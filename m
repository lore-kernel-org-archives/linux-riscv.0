Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915E6070387
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rq1h5tFm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qg8DPX5crHD0LQdrPnBjehqwgRsxvIrrMo33uNcKUTU=; b=rq1h5tFmizGx/nECq9ga5jNRPS
	qmyXBNKLaGBbFphp5lnmdq9ZWdDPuc9TX7uB5X+o1CFsjoB6GYVp4xZ+i7SYlSOLTgiGeO4Xzh6BP
	ZS9EltGdBSReH/88ouTVt9+lWB7200MVg+VrUGNiYERptuM2kbSRPYD0a+mxIMjHR2OfaOf1O+W/4
	hklk1DOxu8kIxIs1A8KcaJwTtfLaeMukSykpgLIdVpdz2Q9gOvnvzqcbSnwrUKfCxR2SZfCfeeBLF
	1Cr28z9Xwzq3+krX2JI7xl6P6maLfFhSoUTozu/bsB94PVN93fkM9iQawAL/4H1bmN/ursgAq1gNj
	nznHwnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkH-0000000AFCA-2SxB;
	Thu, 12 Nov 2026 14:25:45 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkB-0000000AF6b-3Vom
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:41 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1465B21E0A;
	Thu, 12 Nov 2026 14:25:38 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB15213432;
	Thu, 12 Nov 2026 14:25:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T6
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:36 +0000
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
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH v3 5/9] mm/mprotect: add MM_CP_PERM_UPGRADE
Date: Thu, 12 Nov 2026 15:20:34 +0100
Message-ID: <20261112142039.907090-7-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 1465B21E0A
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062540_023351_61F8C205 
X-CRM114-Status: GOOD (  10.93  )
X-Spam-Score: -1.9 (-)
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

QWRkIGEgY2hhbmdlX3Byb3RlY3Rpb24oKSBmbGFnIGZvciBjaGFuZ2VzIHRoYXQgb25seSBhZGQg
cGVybWlzc2lvbnMsCnNvIHRoYXQgTU1VIG5vdGlmaWVyIHVzZXJzIGNhbiBrZWVwIHRoZWlyIG1h
cHBpbmdzIGFuZCBmYXVsdCBpbiB0aGUgbmV3CnBlcm1pc3Npb25zIGxhdGVyLiBtcHJvdGVjdCgp
IHNldHMgaXQgd2hlbiB0aGUgbmV3IFZNQSBmbGFncyBvbmx5IGFkZApyZWFkLCB3cml0ZSBvciBl
eGVjdXRlIHBlcm1pc3Npb25zLCBvciBWTV9BQ0NPVU5ULCB3aGljaCBkb2VzIG5vdCBhZmZlY3QK
dGhlIHBhZ2UgdGFibGVzLiBBbnkgb3RoZXIgY2hhbmdlLCBzdWNoIGFzIGEgZGlmZmVyZW50IHBy
b3RlY3Rpb24ga2V5LAppcyBub3QgYW4gdXBncmFkZS4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBM
w7NwZXogPGNsb3BlekBzdXNlLmRlPgotLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8ICAyICsrCiBt
bS9tcHJvdGVjdC5jICAgICAgfCAxMyArKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRl
L2xpbnV4L21tLmgKaW5kZXggNmFmM2I3MDA4ZjFhLi4wMDE4MjlhNjE0MDUgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvbW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKQEAgLTM1ODUsNiAr
MzU4NSw4IEBAIGludCBnZXRfY21kbGluZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGNoYXIg
KmJ1ZmZlciwgaW50IGJ1Zmxlbik7CiAjZGVmaW5lICBNTV9DUF9VRkZEX1JXUF9SRVNPTFZFICAg
ICAgICAgICAgKDFVTCA8PCA1KSAvKiByZXNvbHZlIHJ3cCAqLwogI2RlZmluZSAgTU1fQ1BfVUZG
RF9SV1BfQUxMICAgICAgICAgICAgICAgIChNTV9DUF9VRkZEX1JXUCB8IFwKIAkJCQkJICAgIE1N
X0NQX1VGRkRfUldQX1JFU09MVkUpCisvKiBXaGV0aGVyIHRoaXMgY2hhbmdlIG9ubHkgdXBncmFk
ZXMvYWRkcyBwZXJtaXNzaW9ucyAqLworI2RlZmluZSAgTU1fQ1BfUEVSTV9VUEdSQURFICAgICAg
ICAgICAgICAgICgxVUwgPDwgNikKIAogYm9vbCBjYW5fY2hhbmdlX3B0ZV93cml0YWJsZShzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJICAgICBwdGVf
dCBwdGUpOwpkaWZmIC0tZ2l0IGEvbW0vbXByb3RlY3QuYyBiL21tL21wcm90ZWN0LmMKaW5kZXgg
ODRiY2ZlMDI4MWQzLi44YzBmY2QxMGY1YTMgMTAwNjQ0Ci0tLSBhL21tL21wcm90ZWN0LmMKKysr
IGIvbW0vbXByb3RlY3QuYwpAQCAtNzY3LDYgKzc2NywxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG1tX3dhbGtfb3BzIHByb3Rfbm9uZV93YWxrX29wcyA9IHsKIAkud2Fsa19sb2NrCQk9IFBHV0FM
S19XUkxPQ0ssCiB9OwogCitzdGF0aWMgYm9vbCB2bWFfZmxhZ3NfaXNfcGVybV91cGdyYWRlKHZt
YV9mbGFnc190IG9sZF92bWFfZmxhZ3MsCisJCQkJICAgICAgdm1hX2ZsYWdzX3QgbmV3X3ZtYV9m
bGFncykKK3sKKwl2bV9mbGFnc190IG9sZCA9IHZtYV9mbGFnc190b19sZWdhY3kob2xkX3ZtYV9m
bGFncyk7CisJdm1fZmxhZ3NfdCBuZXcgPSB2bWFfZmxhZ3NfdG9fbGVnYWN5KG5ld192bWFfZmxh
Z3MpOworCS8qIFZNX0FDQ09VTlQgZG9lcyBub3QgYWZmZWN0IHBhZ2UgdGFibGVzICovCisJdm1f
ZmxhZ3NfdCBtYXNrID0gVk1fUkVBRCB8IFZNX1dSSVRFIHwgVk1fRVhFQyB8IFZNX0FDQ09VTlQ7
CisKKwlyZXR1cm4gbmV3ID09IChvbGQgfCAobmV3ICYgbWFzaykpOworfQorCiBpbnQKIG1wcm90
ZWN0X2ZpeHVwKHN0cnVjdCB2bWFfaXRlcmF0b3IgKnZtaSwgc3RydWN0IG1tdV9nYXRoZXIgKnRs
YiwKIAkgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqKnBwcmV2LApAQCAtODQ3LDYgKzg1OCw4IEBAIG1wcm90ZWN0X2ZpeHVwKHN0cnVjdCB2
bWFfaXRlcmF0b3IgKnZtaSwgc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwKIAl2bWFfb3ZlcndyaXRl
X2ZsYWdzKHZtYSwgbmV3X3ZtYV9mbGFncyk7CiAJaWYgKHZtYV93YW50c19tYW51YWxfcHRlX3dy
aXRlX3VwZ3JhZGUodm1hKSkKIAkJbW1fY3BfZmxhZ3MgfD0gTU1fQ1BfVFJZX0NIQU5HRV9XUklU
QUJMRTsKKwlpZiAodm1hX2ZsYWdzX2lzX3Blcm1fdXBncmFkZShvbGRfdm1hX2ZsYWdzLCBuZXdf
dm1hX2ZsYWdzKSkKKwkJbW1fY3BfZmxhZ3MgfD0gTU1fQ1BfUEVSTV9VUEdSQURFOwogCXZtYV9z
ZXRfcGFnZV9wcm90KHZtYSk7CiAKIAljaGFuZ2VfcHJvdGVjdGlvbih0bGIsIHZtYSwgc3RhcnQs
IGVuZCwgbW1fY3BfZmxhZ3MpOwotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
