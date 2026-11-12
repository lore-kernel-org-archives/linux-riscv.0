Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A4160703A5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C7stV+yU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Ptc9r1S0ac0I0U+bp2Iwy36tN+eu5CJ7kCs42QRM6U=; b=C7stV+yU3ZI5gu3tyQt7Xk/hKg
	ApfqfnXWgvOAn4yL7ib1uEUwW8+qM6x4VPHlDBW+arIa8ZPFmcHH2pXBT4jbYzlsSq4ODvWf3L63H
	X1+Fu+Y4YIE22Z7+7F1Ehqqbg7Lbh/WV04BVJ2h3dfyAwG/e6rgw1e+uqxY+RewaYkBFV9p3JHF7L
	zXprqubfFO6zv5bpRQwfJKuZcTuD5lDhsdPz+VClbItxRX2ypzWP8H8PFH2D0Ol3jAgCEjzJb1MsM
	/Xpy4tgeafulJQndA7IdFF6sZDwQ7m1fWhntlED3ZqYCx78uWn6iciu3ubZUxsz0NqP7myb8VAAXw
	y2N1Osrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkH-0000000AFCh-3Cwk;
	Thu, 12 Nov 2026 14:25:45 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkD-0000000AF7R-11vg
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:42 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B0A701F7A3;
	Thu, 12 Nov 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BE6013432;
	Thu, 12 Nov 2026 14:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T7
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:38 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: kvm@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	peterx@redhat.com,
	ljs@kernel.org,
	imbrenda@linux.ibm.com,
	borntraeger@linux.ibm.com,
	frankja@linux.ibm.com,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH v3 6/9] mm/mmu_notifier: add MMU_NOTIFIER_RANGE_PERM_UPGRADE
Date: Thu, 12 Nov 2026 15:20:35 +0100
Message-ID: <20261112142039.907090-8-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: B0A701F7A3
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062541_487975_DBE59458 
X-CRM114-Status: GOOD (  15.75  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIGEgcmFuZ2UgZmxhZyBmb3IgaW52YWxpZGF0aW9ucyB0aGF0IG9ubHkgdXBncmFkZSBwZXJt
aXNzaW9ucywgc28KdGhhdCBzZWNvbmRhcnkgTU1VcyBjYW4ga2VlcCB0aGVpciBtYXBwaW5ncyBy
YXRoZXIgdGhhbiB6YXAgdGhlbS4KY2hhbmdlX3Byb3RlY3Rpb24oKSBzZXRzIGl0IGZvciBNTV9D
UF9QRVJNX1VQR1JBREUgYW5kIGZvciB0aGUKdXNlcmZhdWx0ZmQgcmVzb2x2ZXMsIHdoaWNoIG9u
bHkgcmVzdG9yZSBhY2Nlc3MuCgpOb3cgdGhhdCBjaGFuZ2VfcHJvdGVjdGlvbigpIGtlZXBzIHdy
aXRhYmxlIGVudHJpZXMgd3JpdGFibGUgb24gdGhlc2UKY2hhbmdlcywgbm8gcHJlc2VudCBlbnRy
eSBsb3NlcyBhY2Nlc3MuIFdyaXRhYmxlIG1pZ3JhdGlvbiBhbmQKZGV2aWNlLXByaXZhdGUgZW50
cmllcyBhcmUgc3RpbGwgbWFkZSByZWFkLW9ubHksIHdoaWNoIGRvZXMgbm90IGFmZmVjdApzZWNv
bmRhcnkgTU1Vcy4gTWlncmF0aW9uIGVudHJpZXMgYXJlIG9ubHkgaW5zdGFsbGVkIGFmdGVyIHNl
Y29uZGFyeQpNTVVzIGFyZSBpbnZhbGlkYXRlZCwgYW5kIGRldmljZS1wcml2YXRlIHBhZ2VzIGFy
ZSBtaWdyYXRlZCBiYWNrLCB3aXRoCmFuIGludmFsaWRhdGlvbiwgYmVmb3JlIHRoZSBDUFUgY2Fu
IGFjY2VzcyB0aGVtLgoKaHVnZXRsYl9jaGFuZ2VfcHJvdGVjdGlvbigpIG5ldmVyIHNldHMgdGhl
IGZsYWcsIGFzIGh1Z2V0bGIgZG9lcyBub3QKcmVzdG9yZSB0aGUgd3JpdGUgYml0IGFuZCBtYXkg
dW5zaGFyZSBwYWdlIHRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNsb3Bl
ekBzdXNlLmRlPgotLS0KIGluY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggfCA1ICsrKysrCiBt
bS9odWdldGxiLmMgICAgICAgICAgICAgICAgIHwgNCArKysrCiBtbS9pbnRlcm5hbC5oICAgICAg
ICAgICAgICAgIHwgNyArKysrKysrCiBtbS9tcHJvdGVjdC5jICAgICAgICAgICAgICAgIHwgNSAr
KystLQogNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggYi9pbmNsdWRlL2xpbnV4
L21tdV9ub3RpZmllci5oCmluZGV4IDVkYjc4ZTU3NjFjNS4uYjJmMTg2ZWJhY2Y5IDEwMDY0NAot
LS0gYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCisrKyBiL2luY2x1ZGUvbGludXgvbW11
X25vdGlmaWVyLmgKQEAgLTYwLDYgKzYwLDExIEBAIGVudW0gbW11X25vdGlmaWVyX2V2ZW50IHsK
IH07CiAKICNkZWZpbmUgTU1VX05PVElGSUVSX1JBTkdFX0JMT0NLQUJMRSAoMSA8PCAwKQorLyoK
KyAqIFNldCBvbiBhbiBpbnZhbGlkYXRpb24gdGhhdCBvbmx5IGV4cGFuZHMgcGVybWlzc2lvbnMg
d2l0aG91dAorICogcmV2b2tpbmcgYW55IGV4aXN0aW5nIGFjY2Vzcywgbm9yIGZyZWVpbmcvbW92
aW5nIHRoZSB1bmRlcmx5aW5nIHBhZ2UuCisgKi8KKyNkZWZpbmUgTU1VX05PVElGSUVSX1JBTkdF
X1BFUk1fVVBHUkFERSAoMSA8PCAxKQogCiBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyB7CiAJLyoK
ZGlmZiAtLWdpdCBhL21tL2h1Z2V0bGIuYyBiL21tL2h1Z2V0bGIuYwppbmRleCBjZTljOGU1N2I4
ZTUuLjA2ZmQzMWI4ZmJjNCAxMDA2NDQKLS0tIGEvbW0vaHVnZXRsYi5jCisrKyBiL21tL2h1Z2V0
bGIuYwpAQCAtNjYzMiw2ICs2NjMyLDEwIEBAIGxvbmcgaHVnZXRsYl9jaGFuZ2VfcHJvdGVjdGlv
bihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkgKiBJbiB0aGUgY2FzZSBvZiBzaGFyZWQg
UE1EcywgdGhlIGFyZWEgdG8gZmx1c2ggY291bGQgYmUgYmV5b25kCiAJICogc3RhcnQvZW5kLiAg
U2V0IHJhbmdlLnN0YXJ0L3JhbmdlLmVuZCB0byBjb3ZlciB0aGUgbWF4aW11bSBwb3NzaWJsZQog
CSAqIHJhbmdlIGlmIFBNRCBzaGFyaW5nIGlzIHBvc3NpYmxlLgorCSAqCisJICogTU1VX05PVElG
SUVSX1JBTkdFX1BFUk1fVVBHUkFERSBpcyBuZXZlciBzZXQgaGVyZS4gaHVnZXRsYiBkb2VzIG5v
dAorCSAqIHJlc3RvcmUgdGhlIHdyaXRlIGJpdCwgYW5kIGh1Z2VfcG1kX3Vuc2hhcmUoKSBtYXkg
ZHJvcCB0aGUgbWFwcGluZywKKwkgKiBzbyB0aGlzIGlzIG5vdCBhIHN0cmljdCBwZXJtaXNzaW9u
IHVwZ3JhZGUuCiAJICovCiAJbW11X25vdGlmaWVyX3JhbmdlX2luaXQoJnJhbmdlLCBNTVVfTk9U
SUZZX1BST1RFQ1RJT05fVk1BLAogCQkJCTAsIG1tLCBzdGFydCwgZW5kKTsKZGlmZiAtLWdpdCBh
L21tL2ludGVybmFsLmggYi9tbS9pbnRlcm5hbC5oCmluZGV4IGUzZjkyODgzYmYyMy4uYjc0ZWEx
OGM2MTAzIDEwMDY0NAotLS0gYS9tbS9pbnRlcm5hbC5oCisrKyBiL21tL2ludGVybmFsLmgKQEAg
LTE0NTMsNiArMTQ1MywxMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHRlX25lZWRzX3NvZnRfZGly
dHlfd3Aoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHB0ZV90IHB0ZQogCXJldHVybiB2bWFf
c29mdF9kaXJ0eV9lbmFibGVkKHZtYSkgJiYgIXB0ZV9zb2Z0X2RpcnR5KHB0ZSk7CiB9CiAKKy8q
IFdoZXRoZXIgYSBjaGFuZ2VfcHJvdGVjdGlvbigpIG9ubHkgYWRkcyBwZXJtaXNzaW9ucy4gKi8K
K3N0YXRpYyBpbmxpbmUgYm9vbCBtbV9jcF9pc19wZXJtX3VwZ3JhZGUodW5zaWduZWQgbG9uZyBj
cF9mbGFncykKK3sKKwlyZXR1cm4gY3BfZmxhZ3MgJiAoTU1fQ1BfUEVSTV9VUEdSQURFIHwgTU1f
Q1BfVUZGRF9XUF9SRVNPTFZFIHwKKwkJCSAgIE1NX0NQX1VGRkRfUldQX1JFU09MVkUpOworfQor
CiAvKiBzaHJpbmtlciByZWxhdGVkIGZ1bmN0aW9ucyAqLwogdW5zaWduZWQgbG9uZyBzaHJpbmtf
c2xhYihnZnBfdCBnZnBfbWFzaywgaW50IG5pZCwgc3RydWN0IG1lbV9jZ3JvdXAgKm1lbWNnLAog
CQkJICBpbnQgcHJpb3JpdHkpOwpkaWZmIC0tZ2l0IGEvbW0vbXByb3RlY3QuYyBiL21tL21wcm90
ZWN0LmMKaW5kZXggOGMwZmNkMTBmNWEzLi5iN2FjY2Y2MGMzZDQgMTAwNjQ0Ci0tLSBhL21tL21w
cm90ZWN0LmMKKysrIGIvbW0vbXByb3RlY3QuYwpAQCAtNjA4LDggKzYwOCw5IEBAIHN0YXRpYyBp
bmxpbmUgbG9uZyBjaGFuZ2VfcHVkX3JhbmdlKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsCiAJCQlj
b250aW51ZTsKIAogCQlpZiAoIXJhbmdlLnN0YXJ0KSB7Ci0JCQltbXVfbm90aWZpZXJfcmFuZ2Vf
aW5pdCgmcmFuZ2UsCi0JCQkJCQlNTVVfTk9USUZZX1BST1RFQ1RJT05fVk1BLCAwLAorCQkJbW11
X25vdGlmaWVyX3JhbmdlX2luaXQoJnJhbmdlLCBNTVVfTk9USUZZX1BST1RFQ1RJT05fVk1BLAor
CQkJCQkJbW1fY3BfaXNfcGVybV91cGdyYWRlKGNwX2ZsYWdzKSA/CisJCQkJCQlNTVVfTk9USUZJ
RVJfUkFOR0VfUEVSTV9VUEdSQURFIDogMCwKIAkJCQkJCXZtYS0+dm1fbW0sIGFkZHIsIGVuZCk7
CiAJCQltbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgmcmFuZ2UpOwogCQl9Ci0t
IAoyLjUxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
