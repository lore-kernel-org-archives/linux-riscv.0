Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217A4606D81A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8+U3FCY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bHtRIRuo;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MnULQVB2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bHtRIRuo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MnULQVB2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J4XE8lAz/1Rs1HnuJ4UGKS87KW3gq36WVxnCHO3VyVY=; b=C8+U3FCYLX4IduuzcDhZOtshh+
	A5Nl5QQfOL7VeZSiQoTCS6XYiy8Ms6MaxdlcxKLjqYw3lSqtF1BcXaSLxJh1ff2C0PGNmVVUu5oZo
	X1JaoWDaKTCA23c2F+4HNDYMWlTV3vFFWe5VbC8x/4vwhWVtgFz2HtUwn4Qf/cOZ6ENhF3+GPkRl6
	1REE2+szzE8U9RDp0JkeQsahavu3AoqXdsSHvv1TcPQuhakra0a4FPwyBhJozO9r4h6qkkaPgaUGY
	b46jv4yzUhUwiRRoyszeJXQCKkCbvSlPnf/aS3BD1TRRls8BFRahiNnKHI33OQagKpW7O2T0Ck+SW
	erGMrwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0q3-00000009jSg-068B;
	Thu, 05 Nov 2026 17:01:23 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pd-00000009jIC-3Rra
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:09 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2F1461FE10;
	Thu,  5 Nov 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNgGJWG7rTKkwW3ylpil8PEuUBqj8yefdS7O9KEe1jw=;
	b=bHtRIRuonQJOyPSuvBrRcvmluyZbQFXKnkednZ74NurqqE7mD0rORk4DdY37kO9ARtje2H
	Tfb9aw/KT25PXgNShyd0rTI+HsIdalnYzh8Y/ji+5cnsma12HMP+8MbamiIX+zd6qZM6vV
	kk7tYABFjLG5ohPPbtspouCeIZP/sa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNgGJWG7rTKkwW3ylpil8PEuUBqj8yefdS7O9KEe1jw=;
	b=MnULQVB2MyVRCdT8JcNvwCGhlbVrVTp9YHB8rfRO5thDdE4wCUgLw0RCFoFw+vV3I8Hzux
	IFSTFPsVg63BKPBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bHtRIRuo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MnULQVB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNgGJWG7rTKkwW3ylpil8PEuUBqj8yefdS7O9KEe1jw=;
	b=bHtRIRuonQJOyPSuvBrRcvmluyZbQFXKnkednZ74NurqqE7mD0rORk4DdY37kO9ARtje2H
	Tfb9aw/KT25PXgNShyd0rTI+HsIdalnYzh8Y/ji+5cnsma12HMP+8MbamiIX+zd6qZM6vV
	kk7tYABFjLG5ohPPbtspouCeIZP/sa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNgGJWG7rTKkwW3ylpil8PEuUBqj8yefdS7O9KEe1jw=;
	b=MnULQVB2MyVRCdT8JcNvwCGhlbVrVTp9YHB8rfRO5thDdE4wCUgLw0RCFoFw+vV3I8Hzux
	IFSTFPsVg63BKPBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EB46133F6;
	Thu,  5 Nov 2026 17:00:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T4
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:00:54 +0000
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
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH v2 3/9] mm/huge_memory: honor MM_CP_TRY_CHANGE_WRITABLE in change_huge_pud()
Date: Thu,  5 Nov 2026 17:50:00 +0100
Message-ID: <20261105165004.2663799-7-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105165004.2663799-4-clopez@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL3zg8z7sygsujbub1yh4z3pr1)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 2F1461FE10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090058_376305_212C3A89 
X-CRM114-Status: GOOD (  17.74  )
X-Spam-Score: -4.4 (----)
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

V2hlbiBjaGFuZ2VfcHJvdGVjdGlvbigpIGlzIGNhbGxlZCBvbiBhIHJhbmdlIHdob3NlIHZtYS0+
dm1fcGFnZV9wcm90CmRvZXMgbm90IGNvbnRhaW4gdGhlIHdyaXRlIGJpdCAoTUFQX1BSSVZBVEUg
bWFwcGluZ3MsIHdoaWNoIG5lZWQgQ29XCmhhbmRsaW5nLCBvciBNQVBfU0hBUkVEIG1hcHBpbmdz
IHRoYXQgd2FudCB3cml0ZSB0cmFja2luZyksIHRoZSBuZXcKZW50cmllcyBhcmUgY3JlYXRlZCB3
aXRob3V0IHRoZSB3cml0ZSBiaXQsIGxldHRpbmcgdGhlIGZhdWx0IGhhbmRsZXIKcmUtaW50cm9k
dWNlIGl0LiBJbiBzdWNoIGNhc2VzLCBNTV9DUF9UUllfQ0hBTkdFX1dSSVRBQkxFIGlzIHNldCB0
bwplYWdlcmx5IHJlc3RvcmUgdGhlIFcgYml0IGluIHRoZSBwYWdlIHRhYmxlIGVudHJpZXMgd2hl
biBzdHJpcHBpbmcgdGhlCndyaXRlIHByb3RlY3Rpb24gd2FzIG5vdCBuZWVkZWQuCgpIb3dldmVy
LCBjaGFuZ2VfaHVnZV9wdWQoKSBkb2VzIG5vdCBjdXJyZW50bHkgcmVzcGVjdCB0aGUgZmxhZy4g
VGhlIG9ubHkKdXNlciBvZiBodWdlIFBVRHMsIGRldmljZSBEQVgsIGlzIG5ldmVyIENvVyBhbmQg
ZG9lcyBub3QgbmVlZCB3cml0ZQpub3RpZmljYXRpb25zIGZvciBkaXJ0eSB0cmFja2luZywgYnV0
IGl0IGRvZXMgZ2V0IHRoZW0gb25jZSBzb2Z0LWRpcnR5CnRyYWNraW5nIGlzIGFybWVkIHRocm91
Z2ggL3Byb2MvcGlkL2NsZWFyX3JlZnMuIHZtX3BhZ2VfcHJvdCB0aGVuIGxhY2tzCnRoZSB3cml0
ZSBiaXQsIGFuZCBhIHByb3RlY3Rpb24gY2hhbmdlIGxlYXZlcyBkaXJ0eSBQVURzIHJlYWQtb25s
eSwgc28KdGhlIG5leHQgd3JpdGUgdGFrZXMgYSBmYXVsdCBvbmx5IHRvIHNldCB0aGUgd3JpdGUg
Yml0IGFnYWluLgoKQWxpZ24gY2hhbmdlX2h1Z2VfcHVkKCkgd2l0aCBjaGFuZ2VfcHRlX3Jhbmdl
KCkgYW5kIGNoYW5nZV9odWdlX3BtZCgpIGJ5Cm1ha2luZyBpdCByZXNwZWN0IE1NX0NQX1RSWV9D
SEFOR0VfV1JJVEFCTEUuIEJlc2lkZXMgYXZvaWRpbmcgdGhvc2UKZmF1bHRzLCB0aGlzIGtlZXBz
IGh1Z2UgUFVEcyBjb25zaXN0ZW50IHdpdGggdGhlIG90aGVyIGxldmVscyBpZiBQVURzCnRoYXQg
bmVlZCBDb1csIHN1Y2ggYXMgYW5vbnltb3VzIG9uZXMsIGFyZSBldmVyIGludHJvZHVjZWQuIFRo
ZXkgd291bGQKb3RoZXJ3aXNlIGxvc2UgdGhlIHdyaXRlIGJpdCBvbiBldmVyeSBwcm90ZWN0aW9u
IGNoYW5nZSwgZXZlbiB3aGVyZSB0aGUKd3JpdGUgZmF1bHQgaGFuZGxlciB3b3VsZCByZXN0b3Jl
IGl0IHdpdGhvdXQgZnVydGhlciBjaGVja3MuCgpEbyB0aGlzIGJ5IGludHJvZHVjaW5nIGNhbl9j
aGFuZ2VfcHVkX3dyaXRhYmxlKCksIHdoaWNoIG1pbWljcwpjYW5fY2hhbmdlX3BtZF93cml0YWJs
ZSgpLiBPbWl0IHRoZSBOVU1BIGFuZCB1ZmZkLXdwIGNoZWNrcywgd2hpY2gKY2hhbmdlX2h1Z2Vf
cHVkKCkgYWxyZWFkeSByZWplY3RzLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2xv
cGV6QHN1c2UuZGU+Ci0tLQogaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggfCAgNSArKysrKwogbW0v
aHVnZV9tZW1vcnkuYyAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKystCiAy
IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaCBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCmlu
ZGV4IDc4MGZlODQ5ZmY4Yi4uOTQzZDdlOTVmNDI2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L3BndGFibGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaApAQCAtMTg2Niw2ICsxODY2
LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IHBtZF9zb2Z0X2RpcnR5KHBtZF90IHBtZCkKIAlyZXR1
cm4gMDsKIH0KIAorc3RhdGljIGlubGluZSBpbnQgcHVkX3NvZnRfZGlydHkocHVkX3QgcHVkKQor
eworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta3NvZnRfZGlydHko
cHRlX3QgcHRlKQogewogCXJldHVybiBwdGU7CmRpZmYgLS1naXQgYS9tbS9odWdlX21lbW9yeS5j
IGIvbW0vaHVnZV9tZW1vcnkuYwppbmRleCBiZDQ0ZDU4ZTg2ODQuLjUwNmUxZTYxYzBmZCAxMDA2
NDQKLS0tIGEvbW0vaHVnZV9tZW1vcnkuYworKysgYi9tbS9odWdlX21lbW9yeS5jCkBAIC0yODI0
LDYgKzI4MjQsMjkgQEAgaW50IGNoYW5nZV9odWdlX3BtZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxi
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAlyZXR1cm4gcmV0OwogfQogCisjaWZkZWYg
Q09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQKK3N0YXRpYyBpbmxpbmUg
Ym9vbCBjYW5fY2hhbmdlX3B1ZF93cml0YWJsZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwK
KwkJCQkJICAgdW5zaWduZWQgbG9uZyBhZGRyLCBwdWRfdCBwdWQpCit7CisJc3RydWN0IHBhZ2Ug
KnBhZ2U7CisKKwlpZiAoV0FSTl9PTl9PTkNFKCEodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKSkp
CisJCXJldHVybiBmYWxzZTsKKworCS8qIERvIHdlIG5lZWQgd3JpdGUgZmF1bHRzIGZvciBzb2Z0
ZGlydHkgdHJhY2tpbmc/ICovCisJaWYgKHZtYV9zb2Z0X2RpcnR5X2VuYWJsZWQodm1hKSAmJiAh
cHVkX3NvZnRfZGlydHkocHVkKSkKKwkJcmV0dXJuIGZhbHNlOworCisJaWYgKCEodm1hLT52bV9m
bGFncyAmIFZNX1NIQVJFRCkpIHsKKwkJLyogU2VlIGNhbl9jaGFuZ2VfcHRlX3dyaXRhYmxlKCku
ICovCisJCXBhZ2UgPSB2bV9ub3JtYWxfcGFnZV9wdWQodm1hLCBhZGRyLCBwdWQpOworCQlyZXR1
cm4gcGFnZSAmJiBQYWdlQW5vbihwYWdlKSAmJiBQYWdlQW5vbkV4Y2x1c2l2ZShwYWdlKTsKKwl9
CisKKwkvKiBTZWUgY2FuX2NoYW5nZV9wdGVfd3JpdGFibGUoKS4gKi8KKwlyZXR1cm4gcHVkX2Rp
cnR5KHB1ZCk7Cit9CisKIC8qCiAgKiBSZXR1cm5zOgogICoKQEAgLTI4MzEsNyArMjg1NCw2IEBA
IGludCBjaGFuZ2VfaHVnZV9wbWQoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsCiAgKiAtIDE6IGlmIHB1ZCBjYW4gYmUgc2tpcHBlZAogICogLSBIUEFH
RV9QVURfTlI6IGlmIHB1ZCB3YXMgc3VjY2Vzc2Z1bGx5IHByb2Nlc3NlZAogICovCi0jaWZkZWYg
Q09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQKIGludCBjaGFuZ2VfaHVn
ZV9wdWQoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
CiAJCSAgICBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLCBwZ3Byb3RfdCBuZXdwcm90
LAogCQkgICAgdW5zaWduZWQgbG9uZyBjcF9mbGFncykKQEAgLTI4NjMsNiArMjg4NSwxMCBAQCBp
bnQgY2hhbmdlX2h1Z2VfcHVkKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLAogCSAqLwogCW9sZHB1ZCA9IHB1ZHBfaW52YWxpZGF0ZSh2bWEsIGFkZHIs
IHB1ZHApOwogCWVudHJ5ID0gcHVkX21vZGlmeShvbGRwdWQsIG5ld3Byb3QpOworCS8qIFNlZSBj
aGFuZ2VfcHRlX3JhbmdlKCkuICovCisJaWYgKChjcF9mbGFncyAmIE1NX0NQX1RSWV9DSEFOR0Vf
V1JJVEFCTEUpICYmICFwdWRfd3JpdGUoZW50cnkpICYmCisJICAgIGNhbl9jaGFuZ2VfcHVkX3dy
aXRhYmxlKHZtYSwgYWRkciwgZW50cnkpKQorCQllbnRyeSA9IHB1ZF9ta3dyaXRlKGVudHJ5KTsK
IAlzZXRfcHVkX2F0KG1tLCBhZGRyLCBwdWRwLCBlbnRyeSk7CiAJdGxiX2ZsdXNoX3B1ZF9yYW5n
ZSh0bGIsIGFkZHIsIEhQQUdFX1BVRF9TSVpFKTsKIAotLSAKMi41MS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
