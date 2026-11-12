Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65260A5BE3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oMmBAHbj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ASjfoLYK;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AG6NBTHW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ASjfoLYK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AG6NBTHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KbDONwIeAxuslHGigGS78hbZeIb3X4M0D6qdlLj2er8=; b=oMmBAHbj4ofu1o5rJW/8uRZcWR
	zacfGlajwP+q4Ns/FEnCq0wHRYt+QIzpJV/3GjduwBkl7S/q1/hUmgC0kiCSowCwiE/FPuukzh+ua
	8TlINbzzzxGqZY8quHiXix6YrCnHjU2Dk1yolM1UqN/vrT8ubo+WVqMOIa8UbAX5Y9TFvyAFcgmS8
	3fB9Kk3QjNc4+lnEPORQLgu5fCKr1Q4eN2m6UHsd5rL89ieg5rAkznGbOiBMl2opDJRFJIgrK8Mzx
	vYf0ToerIfqJ7vBKQbUvBdGkP1sh9UEI3WpUnv7j6hoquECsGuj6PgIi4Ed7oQnDe+wEgPZGkvV0c
	/BqUo/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkA-0000000AF6v-3MMY;
	Thu, 12 Nov 2026 14:25:38 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVk7-0000000AF4i-1wyO
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:36 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE1611F7B9;
	Thu, 12 Nov 2026 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rarWhYCLUgWlwnaEceP0km2CWzz/RwE1HqqRhAgWRRk=;
	b=ASjfoLYKq8P16CL79W5QgBRozDfCvHzn/EUBfLPNx8F2lufVQ5iB2IBGuN+qYl0e/ALTYZ
	++i8EkuIRmnFo1YSjCzMaT2/UQ2P1nmDuzcP9scj0NkDxymYz5MIt89/Ilm6QhCrABS8/7
	KKyONF65hOwS0bjJ+rN7kS8QSfff9A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rarWhYCLUgWlwnaEceP0km2CWzz/RwE1HqqRhAgWRRk=;
	b=AG6NBTHWRnF6+79ulbExDm0U1UIZBd1in7IoAWxmZUPNiBDjAmbSNt3HovhqSlrQXcHaIe
	fuxhOHi8BiaCzqAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rarWhYCLUgWlwnaEceP0km2CWzz/RwE1HqqRhAgWRRk=;
	b=ASjfoLYKq8P16CL79W5QgBRozDfCvHzn/EUBfLPNx8F2lufVQ5iB2IBGuN+qYl0e/ALTYZ
	++i8EkuIRmnFo1YSjCzMaT2/UQ2P1nmDuzcP9scj0NkDxymYz5MIt89/Ilm6QhCrABS8/7
	KKyONF65hOwS0bjJ+rN7kS8QSfff9A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rarWhYCLUgWlwnaEceP0km2CWzz/RwE1HqqRhAgWRRk=;
	b=AG6NBTHWRnF6+79ulbExDm0U1UIZBd1in7IoAWxmZUPNiBDjAmbSNt3HovhqSlrQXcHaIe
	fuxhOHi8BiaCzqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A294E134F4;
	Thu, 12 Nov 2026 14:25:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T2
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:30 +0000
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
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Feiner <pfeiner@google.com>
Subject: [PATCH v3 1/9] mm: fix eager write-bit restore for write-notified shared mappings
Date: Thu, 12 Nov 2026 15:20:30 +0100
Message-ID: <20261112142039.907090-3-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062535_684340_ACB4E014 
X-CRM114-Status: GOOD (  12.12  )
X-Spam-Score: -2.1 (--)
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

Y2hhbmdlX3Byb3RlY3Rpb24oKSBhcHBsaWVzIHZtYS0+dm1fcGFnZV9wcm90LCB3aGljaCBsYWNr
cyB0aGUgd3JpdGUgYml0CmZvciBDb1cgYW5kIHdyaXRlLW5vdGlmaWVkIG1hcHBpbmdzLiBDYWxs
ZXJzIHNldApNTV9DUF9UUllfQ0hBTkdFX1dSSVRBQkxFIHdoZW4gdm1hX3dhbnRzX21hbnVhbF9w
dGVfd3JpdGVfdXBncmFkZSgpCnJldHVybnMgdHJ1ZSwgc28gdGhhdCBlbnRyaWVzIHRoYXQgY2Fu
IGJlIHdyaXR0ZW4gd2l0aG91dCBhIGZhdWx0LCBzdWNoCmFzIGRpcnR5IFBURXMgaW4gYSBzaGFy
ZWQgbWFwcGluZywgYXJlIG1hZGUgd3JpdGFibGUgcmlnaHQgYXdheS4KCkZvciBzaGFyZWQgbWFw
cGluZ3MsIHRoYXQgZnVuY3Rpb24gcGFzc2VzIHZtYS0+dm1fcGFnZV9wcm90IHRvCnZtYV93YW50
c193cml0ZW5vdGlmeSgpLiBPbmNlIHdyaXRlbm90aWZ5IGlzIGVuYWJsZWQsIHRoaXMgcHJvdGVj
dGlvbgpsYWNrcyB0aGUgd3JpdGUgYml0LCB3aGlsZSB0aGUgdm1hX3BncHJvdF9tb2RpZnkoKSBy
ZXN1bHQgaXQgaXMgY29tcGFyZWQKYWdhaW5zdCBhZGRzIGl0IGJhY2suIFRoZSB0d28gbmV2ZXIg
bWF0Y2gsIHNvIHZtYV93YW50c193cml0ZW5vdGlmeSgpCnJldHVybnMgZmFsc2UgYmVmb3JlIGNo
ZWNraW5nIGZvciBzb2Z0LWRpcnR5LCB1ZmZkLXdwIGFuZCB3cml0ZWJhY2suCgpBcyBhIHJlc3Vs
dCwgd3JpdGUtbm90aWZpZWQgc2htZW0gbWFwcGluZ3MgbmV2ZXIgZ2V0Ck1NX0NQX1RSWV9DSEFO
R0VfV1JJVEFCTEUuIEZvciBleGFtcGxlLCBjb21taXQgOTMxMjk4ZTEwM2MyCigibW0vdXNlcmZh
dWx0ZmQ6IHJlbHkgb24gdm1hLT52bV9wYWdlX3Byb3QgaW4gdWZmZF93cF9yYW5nZSgpIikgbWFk
ZQp1ZmZkLXdwIHVucHJvdGVjdCBzZXQgdGhlIGZsYWcgc28gdGhhdCBkaXJ0eSBzaG1lbSBQVEVz
IGJlY29tZSB3cml0YWJsZQphZ2FpbiwgYnV0IHRoaXMgbmV2ZXIgdGFrZXMgZWZmZWN0LiBVbnBy
b3RlY3RpbmcgTiBkaXJ0eSBzaG1lbSBwYWdlcwpzdGlsbCBsZWFkcyB0byBOIGZhdWx0cyB0aGF0
IG9ubHkgc2V0IHRoZSB3cml0ZSBiaXQuCgpUaGlzIGRhdGVzIGJhY2sgdG8gdGhlIGNvbW1pdCBp
biB0aGUgRml4ZXMgdGFnLCB3aGljaCBtb3ZlZCB0aGUKZXF1aXZhbGVudCBjaGVjayBpbiBtcHJv
dGVjdF9maXh1cCgpIGJlZm9yZSB2bWFfc2V0X3BhZ2VfcHJvdCgpLgoKRml4IHRoaXMgYnkgcGFz
c2luZyB0aGUgcHJvdGVjdGlvbiByZWNvbXB1dGVkIGZyb20gdGhlIFZNQSBmbGFncywgYXMKdm1h
X3NldF9wYWdlX3Byb3QoKSBkb2VzLgoKTm90ZTogdGhpcyBvbmx5IGFmZmVjdHMgcGVyZm9ybWFu
Y2UsIGFzIHRoZSBuZXh0IHdyaXRlIGZhdWx0IHJlc3RvcmVzCnRoZSB3cml0ZSBiaXQgYW55d2F5
LgoKRml4ZXM6IDY0ZTQ1NTA3OWUxYiAoIm1tOiBzb2Z0ZGlydHk6IGVuYWJsZSB3cml0ZSBub3Rp
ZmljYXRpb25zIG9uIFZNQXMgYWZ0ZXIgVk1fU09GVERJUlRZIGNsZWFyZWQiKQpTaWduZWQtb2Zm
LWJ5OiBDYXJsb3MgTMOzcGV6IDxjbG9wZXpAc3VzZS5kZT4KLS0tCiBtbS92bWEuaCB8IDIzICsr
KysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS92bWEuaCBiL21tL3ZtYS5oCmluZGV4IDNm
YzNiNDdhOTU0Yi4uZTgzNzAwZTI0OGU0IDEwMDY0NAotLS0gYS9tbS92bWEuaAorKysgYi9tbS92
bWEuaApAQCAtNTg5LDYgKzU4OSwxNCBAQCBpbnQgc3BsaXRfdm1hKHN0cnVjdCB2bWFfaXRlcmF0
b3IgKnZtaSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJICAgICAgdW5zaWduZWQgbG9u
ZyBhZGRyLCBpbnQgbmV3X2JlbG93KTsKICNlbmRpZgogCisjaWZkZWYgQ09ORklHX01NVQorc3Rh
dGljIGlubGluZSBwZ3Byb3RfdCB2bWFfcGdwcm90X21vZGlmeShwZ3Byb3RfdCBvbGRwcm90LCB2
bWFfZmxhZ3NfdCB2bWFfZmxhZ3MpCit7CisJY29uc3QgcGdwcm90X3QgcHJvdCA9IHZtYV9mbGFn
c190b19wYWdlX3Byb3Qodm1hX2ZsYWdzKTsKKworCXJldHVybiBwZ3Byb3RfbW9kaWZ5KG9sZHBy
b3QsIHByb3QpOworfQorCiBzdGF0aWMgaW5saW5lIGJvb2wgdm1hX3dhbnRzX21hbnVhbF9wdGVf
d3JpdGVfdXBncmFkZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAkvKgpAQCAtNTk2
LDE5ICs2MDQsMTYgQEAgc3RhdGljIGlubGluZSBib29sIHZtYV93YW50c19tYW51YWxfcHRlX3dy
aXRlX3VwZ3JhZGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEKIAkgKiBpZiB3ZSBjYW4ndCBk
byB0aGF0IGF1dG9tYXRpY2FsbHkgZm9yIGFsbCBQVEVzIGluIGEgbWFwcGluZy4gRm9yCiAJICog
cHJpdmF0ZSBtYXBwaW5ncywgdGhhdCdzIGFsd2F5cyB0aGUgY2FzZSB3aGVuIHdlIGhhdmUgd3Jp
dGUKIAkgKiBwZXJtaXNzaW9ucyBhcyB3ZSBwcm9wZXJseSBoYXZlIHRvIGhhbmRsZSBDT1cuCisJ
ICoKKwkgKiB2bWEtPnZtX3BhZ2VfcHJvdCBsYWNrcyB0aGUgd3JpdGUgYml0IGlmIHdyaXRlbm90
aWZ5IGlzIGFscmVhZHkKKwkgKiBlbmFibGVkLCBzbyBwYXNzIGl0IHdpdGggdGhlIGJpdHMgcmVz
dG9yZWQsIGFzIHZtYV9zZXRfcGFnZV9wcm90KCkKKwkgKiBkb2VzLgogCSAqLwogCWlmICh2bWEt
PnZtX2ZsYWdzICYgVk1fU0hBUkVEKQotCQlyZXR1cm4gdm1hX3dhbnRzX3dyaXRlbm90aWZ5KHZt
YSwgdm1hLT52bV9wYWdlX3Byb3QpOworCQlyZXR1cm4gdm1hX3dhbnRzX3dyaXRlbm90aWZ5KHZt
YSwKKwkJICAgICAgIHZtYV9wZ3Byb3RfbW9kaWZ5KHZtYS0+dm1fcGFnZV9wcm90LCB2bWEtPmZs
YWdzKSk7CiAJcmV0dXJuICEhKHZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSk7CiB9Ci0KLSNpZmRl
ZiBDT05GSUdfTU1VCi1zdGF0aWMgaW5saW5lIHBncHJvdF90IHZtYV9wZ3Byb3RfbW9kaWZ5KHBn
cHJvdF90IG9sZHByb3QsIHZtYV9mbGFnc190IHZtYV9mbGFncykKLXsKLQljb25zdCBwZ3Byb3Rf
dCBwcm90ID0gdm1hX2ZsYWdzX3RvX3BhZ2VfcHJvdCh2bWFfZmxhZ3MpOwotCi0JcmV0dXJuIHBn
cHJvdF9tb2RpZnkob2xkcHJvdCwgcHJvdCk7Ci19CiAjZW5kaWYKIAogc3RhdGljIGlubGluZSBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYV9wcmV2X2xpbWl0KHN0cnVjdCB2bWFfaXRlcmF0b3Ig
KnZtaSwKLS0gCjIuNTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
