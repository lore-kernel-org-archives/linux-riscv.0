Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D06260A3807
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2yKprcAU;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qDQSqMce;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oc1v99b/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qDQSqMce;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oc1v99b/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ive9XZ9YpvP0jkVCbW500Fi7GzvSgTgB5dtfvTFYfvk=; b=2yKprcAU7fZS+eGxyC+ZGKprkC
	SR2PyZvm6gdcijMIOw00KzC2IydgPGvRgfNfYroG1ID0yYykEYb/NEDFo+M0OKyrgFMseOv55TXC5
	3nQtvq3FUcSY4ARNX1R7BssfptZInzN0eLHgiptzGZp8mU0Ww6wcYBdINYGc/8VWVE2m5nn0aOKL1
	6jHzyshUbU+SywyKNj5Me+BPDh2mCWIe2cehtgrzlctzSrAU6ivudRDtL1FlxzHeTQJuZniqEkhSf
	vF00xPHzNShkGj6Wby8oXnI5YM4uTZXzrb/4ErRbZODEXTXhsMUDswppEqUR65GZP8Xh8Ff0yPrXW
	XuytMAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0q3-00000009jT6-1Urk;
	Thu, 05 Nov 2026 17:01:23 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pi-00000009jK0-3zqw
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:10 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C63C202C6;
	Thu,  5 Nov 2026 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTLCeN5jovvTBrG00oVZHmkRkUI0TUXDkV2kppClmaI=;
	b=qDQSqMcecgH0WXSk2Y240aQ1q68bCPZg+2Qse3YSTomNRPbmJ43/iO8LLK65XIw2Yuie8a
	aenffLtwlLO7coIupW7h0qzIUhGSlqfr9FXRoLGzyez21rEI7jLGfNEFGZsLegaQSo8jJA
	9VrV5WCcb0LrE1YWl6IUGwMUTZL2Gns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTLCeN5jovvTBrG00oVZHmkRkUI0TUXDkV2kppClmaI=;
	b=oc1v99b/QcPAkScAs/xHlP0u67nIQGuCXV0P05kIB1+DDvNcWAVKTaS5tSV8uxTcV73Cw+
	KPwlc+NFP/MpB5BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTLCeN5jovvTBrG00oVZHmkRkUI0TUXDkV2kppClmaI=;
	b=qDQSqMcecgH0WXSk2Y240aQ1q68bCPZg+2Qse3YSTomNRPbmJ43/iO8LLK65XIw2Yuie8a
	aenffLtwlLO7coIupW7h0qzIUhGSlqfr9FXRoLGzyez21rEI7jLGfNEFGZsLegaQSo8jJA
	9VrV5WCcb0LrE1YWl6IUGwMUTZL2Gns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTLCeN5jovvTBrG00oVZHmkRkUI0TUXDkV2kppClmaI=;
	b=oc1v99b/QcPAkScAs/xHlP0u67nIQGuCXV0P05kIB1+DDvNcWAVKTaS5tSV8uxTcV73Cw+
	KPwlc+NFP/MpB5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4417133F6;
	Thu,  5 Nov 2026 17:00:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T7
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:00:59 +0000
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
Subject: [PATCH v2 6/9] mm/mmu_notifier: add MMU_NOTIFIER_RANGE_PERM_UPGRADE
Date: Thu,  5 Nov 2026 17:50:03 +0100
Message-ID: <20261105165004.2663799-10-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105165004.2663799-4-clopez@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5uaz9zq77jxr8j8m8i6w3kff)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -12.30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090105_418628_4A06789A 
X-CRM114-Status: GOOD (  16.70  )
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

QWRkIGEgcmFuZ2UgZmxhZyBtYXJraW5nIGFuIGludmFsaWRhdGlvbiB0aGF0IG9ubHkgdXBncmFk
ZXMgcGVybWlzc2lvbnMsCndpdGggbm8gUEZOIGNoYW5nZSBhbmQgbm8gcmV2b2tlZCBhY2Nlc3Mu
IGNoYW5nZV9wcm90ZWN0aW9uKCkgc2V0cyBpdApmb3IgTU1fQ1BfUEVSTV9VUEdSQURFIGFuZCBm
b3IgdGhlIHVzZXJmYXVsdGZkIHJlc29sdmVzLCB3aGljaCB1bnByb3RlY3QKYSBwYWdlIGFuZCB0
aHVzIG9ubHkgcmVzdG9yZSBhY2Nlc3MuCgpOb3cgdGhhdCBjaGFuZ2VfcHJvdGVjdGlvbigpIGtl
ZXBzIHdyaXRhYmxlIGVudHJpZXMgd3JpdGFibGUgb24gdGhlc2UKY2hhbmdlcywgbm8gcHJlc2Vu
dCBlbnRyeSBsb3NlcyBhY2Nlc3MuIFdyaXRhYmxlIG1pZ3JhdGlvbiBhbmQKZGV2aWNlLXByaXZh
dGUgZW50cmllcyBhcmUgc3RpbGwgbWFkZSByZWFkLW9ubHksIHdoaWNoIGRvZXMgbm90IGFmZmVj
dApzZWNvbmRhcnkgTU1Vcy4gTWlncmF0aW9uIGVudHJpZXMgYXJlIG9ubHkgaW5zdGFsbGVkIGFm
dGVyIHNlY29uZGFyeQpNTVVzIGFyZSBpbnZhbGlkYXRlZCwgYW5kIGRldmljZS1wcml2YXRlIHBh
Z2VzIGFyZSBtaWdyYXRlZCBiYWNrLCB3aXRoCmFuIGludmFsaWRhdGlvbiwgYmVmb3JlIHRoZSBD
UFUgY2FuIGFjY2VzcyB0aGVtLgoKaHVnZXRsYl9jaGFuZ2VfcHJvdGVjdGlvbigpIG5ldmVyIHNl
dHMgdGhlIGZsYWcsIGFzIGh1Z2V0bGIgZG9lcyBub3QKcmVzdG9yZSB0aGUgd3JpdGUgYml0IGFu
ZCBtYXkgdW5zaGFyZSBwYWdlIHRhYmxlcy4KCkEgc2Vjb25kYXJ5IE1NVSBjYW4gdXNlIHRoZSBm
bGFnIHRvIGtlZXAgaXRzIG1hcHBpbmdzIHJhdGhlciB0aGFuIHphcAp0aGVtLiBDb25zdW1lcnMg
dGhhdCBpZ25vcmUgaXQgYXJlIHVuYWZmZWN0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgTMOz
cGV6IDxjbG9wZXpAc3VzZS5kZT4KLS0tCiBpbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIHwg
NSArKysrKwogbW0vaHVnZXRsYi5jICAgICAgICAgICAgICAgICB8IDQgKysrKwogbW0vbXByb3Rl
Y3QuYyAgICAgICAgICAgICAgICB8IDUgKysrLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tdV9u
b3RpZmllci5oIGIvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaAppbmRleCBhMTFhNDRlZWY1
MjEuLjExMmJlMjhjZGY2YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIu
aAorKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCkBAIC02MCw2ICs2MCwxMSBAQCBl
bnVtIG1tdV9ub3RpZmllcl9ldmVudCB7CiB9OwogCiAjZGVmaW5lIE1NVV9OT1RJRklFUl9SQU5H
RV9CTE9DS0FCTEUgKDEgPDwgMCkKKy8qCisgKiBTZXQgb24gYW4gaW52YWxpZGF0aW9uIHRoYXQg
b25seSBleHBhbmRzIHBlcm1pc3Npb25zIHdpdGhvdXQKKyAqIHJldm9raW5nIGFueSBleGlzdGlu
ZyBhY2Nlc3MsIG5vciBmcmVlaW5nL21vdmluZyB0aGUgdW5kZXJseWluZyBwYWdlLgorICovCisj
ZGVmaW5lIE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUgKDEgPDwgMSkKIAogc3RydWN0
IG1tdV9ub3RpZmllcl9vcHMgewogCS8qCmRpZmYgLS1naXQgYS9tbS9odWdldGxiLmMgYi9tbS9o
dWdldGxiLmMKaW5kZXggZGE1ZDA0ZWRmN2MxLi4xYTY5ZDFkYTUyN2UgMTAwNjQ0Ci0tLSBhL21t
L2h1Z2V0bGIuYworKysgYi9tbS9odWdldGxiLmMKQEAgLTY2MDYsNiArNjYwNiwxMCBAQCBsb25n
IGh1Z2V0bGJfY2hhbmdlX3Byb3RlY3Rpb24oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJ
ICogSW4gdGhlIGNhc2Ugb2Ygc2hhcmVkIFBNRHMsIHRoZSBhcmVhIHRvIGZsdXNoIGNvdWxkIGJl
IGJleW9uZAogCSAqIHN0YXJ0L2VuZC4gIFNldCByYW5nZS5zdGFydC9yYW5nZS5lbmQgdG8gY292
ZXIgdGhlIG1heGltdW0gcG9zc2libGUKIAkgKiByYW5nZSBpZiBQTUQgc2hhcmluZyBpcyBwb3Nz
aWJsZS4KKwkgKgorCSAqIE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUgaXMgbmV2ZXIg
c2V0IGhlcmUuIGh1Z2V0bGIgZG9lcyBub3QKKwkgKiByZXN0b3JlIHRoZSB3cml0ZSBiaXQsIGFu
ZCBodWdlX3BtZF91bnNoYXJlKCkgbWF5IGRyb3AgdGhlIG1hcHBpbmcsCisJICogc28gdGhpcyBp
cyBub3QgYSBzdHJpY3QgcGVybWlzc2lvbiB1cGdyYWRlLgogCSAqLwogCW1tdV9ub3RpZmllcl9y
YW5nZV9pbml0KCZyYW5nZSwgTU1VX05PVElGWV9QUk9URUNUSU9OX1ZNQSwKIAkJCQkwLCBtbSwg
c3RhcnQsIGVuZCk7CmRpZmYgLS1naXQgYS9tbS9tcHJvdGVjdC5jIGIvbW0vbXByb3RlY3QuYwpp
bmRleCAxNmI4YWVmNzU1YWIuLmZiMjAyM2RjNmU2NiAxMDA2NDQKLS0tIGEvbW0vbXByb3RlY3Qu
YworKysgYi9tbS9tcHJvdGVjdC5jCkBAIC02MDEsOCArNjAxLDkgQEAgc3RhdGljIGlubGluZSBs
b25nIGNoYW5nZV9wdWRfcmFuZ2Uoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwKIAkJCWNvbnRpbnVl
OwogCiAJCWlmICghcmFuZ2Uuc3RhcnQpIHsKLQkJCW1tdV9ub3RpZmllcl9yYW5nZV9pbml0KCZy
YW5nZSwKLQkJCQkJCU1NVV9OT1RJRllfUFJPVEVDVElPTl9WTUEsIDAsCisJCQltbXVfbm90aWZp
ZXJfcmFuZ2VfaW5pdCgmcmFuZ2UsIE1NVV9OT1RJRllfUFJPVEVDVElPTl9WTUEsCisJCQkJCQlt
bV9jcF9pc19wZXJtX3VwZ3JhZGUoY3BfZmxhZ3MpID8KKwkJCQkJCU1NVV9OT1RJRklFUl9SQU5H
RV9QRVJNX1VQR1JBREUgOiAwLAogCQkJCQkJdm1hLT52bV9tbSwgYWRkciwgZW5kKTsKIAkJCW1t
dV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCZyYW5nZSk7CiAJCX0KLS0gCjIuNTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
