Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A91C606D833
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wSc69CV9;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=q7V7OJU5;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HQIptzs2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=q7V7OJU5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HQIptzs2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L2Ds5alBkdKMBs16+nmFHI6UlJG8Sb0Z0l2I3T/iP74=; b=wSc69CV98vHl9yJaIbQsW0xqBZ
	4UXErIKs5T/p4a8cO6ss2X4PFIW+1I7L6oJnZ5PvAvmg8VhEqNf0wLE1DFmY8iA53TTgstTU+bepV
	PU7CcA/2jt8lW7yEKVP4Vc/NevrDJmIyjoyI3pituIkyxHsNqRPD4JP/V9PbLpShuRv3WFpWlqtic
	qZ4eqytN19GzpXYZ1p7z7xFrJHq6qDOnCGlxdmeGlt3y7gvx6yAvdZ79VqYicSXEeYZpY2DhvEcM2
	6p4t5Afu1mgtkr6FW1wDYx+JSN4VgEfHaCjh3GT9NdDSjBY1UBugw0DC4PvojMi9RTBVTrdu23Fs5
	GKqRG6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0q2-00000009jSG-3IlO;
	Thu, 05 Nov 2026 17:01:22 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0pk-00000009jKp-05m7
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:01:09 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7AE0C1FFF4;
	Thu,  5 Nov 2026 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEZ9JJfmqsHwOWZ8ElxjeuHq5z5hpn3BAo1KSIMWKNg=;
	b=q7V7OJU5V3kHEmtMC+LW7OPlBP2+X1BkkbG18zyn3y4BGYvK/fgcCEK1aPjhjRnJP2Bqy8
	J+COa3CANIoqRNfmnlqPmBE19vl4XySEEdxN0tI4dTFBIUJYs11QtrVG8F6Hd9R3zqpGzb
	fvEz/nka4/mM+a5fXaLH9lgK+wVXm3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEZ9JJfmqsHwOWZ8ElxjeuHq5z5hpn3BAo1KSIMWKNg=;
	b=HQIptzs2YWEwUY035nAUQ/KX3dN/98aVd1ncESN86TGDKhwlZOcEvouUYVi5ZD6VFx4oD6
	ANOmGc1e9j6Kn9DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793898062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEZ9JJfmqsHwOWZ8ElxjeuHq5z5hpn3BAo1KSIMWKNg=;
	b=q7V7OJU5V3kHEmtMC+LW7OPlBP2+X1BkkbG18zyn3y4BGYvK/fgcCEK1aPjhjRnJP2Bqy8
	J+COa3CANIoqRNfmnlqPmBE19vl4XySEEdxN0tI4dTFBIUJYs11QtrVG8F6Hd9R3zqpGzb
	fvEz/nka4/mM+a5fXaLH9lgK+wVXm3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793898062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEZ9JJfmqsHwOWZ8ElxjeuHq5z5hpn3BAo1KSIMWKNg=;
	b=HQIptzs2YWEwUY035nAUQ/KX3dN/98aVd1ncESN86TGDKhwlZOcEvouUYVi5ZD6VFx4oD6
	ANOmGc1e9j6Kn9DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 825F2133F6;
	Thu,  5 Nov 2026 17:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMEkC0K27GqWRwAAD6G6ig:T8
	(envelope-from <clopez@suse.de>); Thu, 05 Nov 2026 17:01:01 +0000
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
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
Subject: [PATCH v2 7/9] KVM: pass the mmu_notifier event and flags to kvm_gfn_range
Date: Thu,  5 Nov 2026 17:50:04 +0100
Message-ID: <20261105165004.2663799-11-clopez@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -12.30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090105_219296_DD798211 
X-CRM114-Status: GOOD (  11.96  )
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

UHJvcGFnYXRlIHRoZSBldmVudCBhbmQgZmxhZ3Mgb2YgdGhlIG1tdV9ub3RpZmllciBpbnZhbGlk
YXRpb24gaW50bwpzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSwgc28gdGhhdCBhcmNoaXRlY3R1cmUgaGFu
ZGxlcnMgY2FuIHRlbGwgd2hhdCBraW5kCm9mIGNoYW5nZSB0aGV5IGFyZSBoYW5kbGluZywgc3Vj
aCBhcyBhIHBlcm1pc3Npb24gdXBncmFkZQooTU1VX05PVElGSUVSX1JBTkdFX1BFUk1fVVBHUkFE
RSkuIFRoZXkgYXJlIG5vdCBjb25zdW1lZCB5ZXQsIHNvIG5vCmZ1bmN0aW9uYWwgY2hhbmdlLgoK
U2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2xvcGV6QHN1c2UuZGU+Ci0tLQogaW5jbHVk
ZS9saW51eC9rdm1faG9zdC5oIHwgMyArKysKIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDgg
KysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRl
eCBlN2ZjOTRlMjkxMGEuLjFmNWNlNDQxMGRkYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9r
dm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtMjc0LDYgKzI3NCw5
IEBAIHN0cnVjdCBrdm1fZ2ZuX3JhbmdlIHsKIAllbnVtIGt2bV9nZm5fcmFuZ2VfZmlsdGVyIGF0
dHJfZmlsdGVyOwogCWJvb2wgbWF5X2Jsb2NrOwogCWJvb2wgbG9ja2xlc3M7CisJLyogRnJvbSB0
aGUgbW11X25vdGlmaWVyIGludmFsaWRhdGlvbiwgaWYgYW55LiAqLworCWVudW0gbW11X25vdGlm
aWVyX2V2ZW50IGV2ZW50OworCXVuc2lnbmVkIGludCBmbGFnczsKIH07CiBib29sIGt2bV91bm1h
cF9nZm5fcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2Up
OwogYm9vbCBrdm1fYWdlX2dmbihzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fZ2ZuX3Jhbmdl
ICpyYW5nZSk7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3Zt
X21haW4uYwppbmRleCBjZjRjYjU4NmYxNDAuLmM1MTdkMWRlYjQ4OCAxMDA2NDQKLS0tIGEvdmly
dC9rdm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC01MzIsNiArNTMy
LDggQEAgc3RydWN0IGt2bV9tbXVfbm90aWZpZXJfcmFuZ2UgewogCWJvb2wgZmx1c2hfb25fcmV0
OwogCWJvb2wgbWF5X2Jsb2NrOwogCWJvb2wgbG9ja2xlc3M7CisJZW51bSBtbXVfbm90aWZpZXJf
ZXZlbnQgZXZlbnQ7CisJdW5zaWduZWQgaW50IGZsYWdzOwogfTsKIAogLyoKQEAgLTYxMyw2ICs2
MTUsOCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGt2bV9tbl9yZXRfdCBrdm1faGFuZGxlX2h2
YV9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sCiAJCQkgKi8KIAkJCWdmbl9yYW5nZS5hcmcgPSByYW5n
ZS0+YXJnOwogCQkJZ2ZuX3JhbmdlLm1heV9ibG9jayA9IHJhbmdlLT5tYXlfYmxvY2s7CisJCQln
Zm5fcmFuZ2UuZXZlbnQgPSByYW5nZS0+ZXZlbnQ7CisJCQlnZm5fcmFuZ2UuZmxhZ3MgPSByYW5n
ZS0+ZmxhZ3M7CiAJCQkvKgogCQkJICogSFZBLWJhc2VkIG5vdGlmaWNhdGlvbnMgYXJlbid0IHJl
bGV2YW50IHRvIHByaXZhdGUKIAkJCSAqIG1hcHBpbmdzIGFzIHRoZXkgZG9uJ3QgaGF2ZSBhIHVz
ZXJzcGFjZSBtYXBwaW5nLgpAQCAtNzM4LDYgKzc0Miw4IEBAIHN0YXRpYyBpbnQga3ZtX21tdV9u
b3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAog
CQkub25fbG9jawk9IGt2bV9tbXVfaW52YWxpZGF0ZV9zdGFydCwKIAkJLmZsdXNoX29uX3JldAk9
IHRydWUsCiAJCS5tYXlfYmxvY2sJPSBtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdl
KSwKKwkJLmV2ZW50CQk9IHJhbmdlLT5ldmVudCwKKwkJLmZsYWdzCQk9IHJhbmdlLT5mbGFncywK
IAl9OwogCiAJdHJhY2Vfa3ZtX3VubWFwX2h2YV9yYW5nZShyYW5nZS0+c3RhcnQsIHJhbmdlLT5l
bmQpOwpAQCAtMjU1Miw2ICsyNTU4LDggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGt2
bV9oYW5kbGVfZ2ZuX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwKIAogCWdmbl9yYW5nZS5hcmcgPSBy
YW5nZS0+YXJnOwogCWdmbl9yYW5nZS5tYXlfYmxvY2sgPSByYW5nZS0+bWF5X2Jsb2NrOworCWdm
bl9yYW5nZS5ldmVudCA9IHJhbmdlLT5ldmVudDsKKwlnZm5fcmFuZ2UuZmxhZ3MgPSByYW5nZS0+
ZmxhZ3M7CiAKIAkvKgogCSAqIElmL3doZW4gS1ZNIHN1cHBvcnRzIG1vcmUgYXR0cmlidXRlcyBi
ZXlvbmQgcHJpdmF0ZSAudnMgc2hhcmVkLCB0aGlzCi0tIAoyLjUxLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
