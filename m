Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E55607039E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B/SFoRxD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k/xP1Kb4;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/hUSehq+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k/xP1Kb4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/hUSehq+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MxaWCxMwOZTcXCbFx1AsiNms4mImWeX36FZ+FBcZ+sY=; b=B/SFoRxD7RDt7KPV8YJ4kkNYxK
	iKIAiVvddnCmFNGmrVoNoqTEkBze16wsr82IWq6RaaB6Ci1/wMQ0GhAp2BC3tc7JmHUwXCwt+0a5a
	oPiNH4o4oSfNO/IT5h/jRgTd9UhjzCxwMIFDW/VNMdvWjgebA3VY3kpwYD4D8ONXHN5hCDyjVg1bR
	4Ogq4nfX68UID/yFeu2/BYszl0ebk0u6s1Z2JTHNfevw3as3feAq5BP0b+WP09MbJzPs8DWB6LARE
	YLcmo3OnszOPfpYn3X6FdW2yDxA6Uu1RGCgMZkzVcOKavEu/D8j+Fz+jHf4COE2VlCzu2yy7qZmYn
	61Df/adA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkH-0000000AFCm-3i5e;
	Thu, 12 Nov 2026 14:25:45 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkE-0000000AF8Y-1afs
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:43 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB18F1F7A5;
	Thu, 12 Nov 2026 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egAgTK39zABd/gJChkYURwZvQvarzAr/B6j4tF3tOn8=;
	b=k/xP1Kb4Y0Ig/EixInInOwWOvMgi0T6ABSaEYlalEBYLYUCF5f8zAbGs/mdAEUZbRmN4PR
	ifNh+GYizIzxkHuN2WWC8ffk5lrSWwQ2YJI/LS1FunKlwt27uDNH0fsezbS/UdKRFgiFNv
	QuoLwnyFNFbS9hRk1P8xFoO4z2HfJys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egAgTK39zABd/gJChkYURwZvQvarzAr/B6j4tF3tOn8=;
	b=/hUSehq+rUZXwcxCjhPMecIMFavt7F/FpLJSnEGR+nK44h8S9YvRwsG1kO0xIZ9OsEHR+Z
	l1CKWMuJt5U+mECA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egAgTK39zABd/gJChkYURwZvQvarzAr/B6j4tF3tOn8=;
	b=k/xP1Kb4Y0Ig/EixInInOwWOvMgi0T6ABSaEYlalEBYLYUCF5f8zAbGs/mdAEUZbRmN4PR
	ifNh+GYizIzxkHuN2WWC8ffk5lrSWwQ2YJI/LS1FunKlwt27uDNH0fsezbS/UdKRFgiFNv
	QuoLwnyFNFbS9hRk1P8xFoO4z2HfJys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egAgTK39zABd/gJChkYURwZvQvarzAr/B6j4tF3tOn8=;
	b=/hUSehq+rUZXwcxCjhPMecIMFavt7F/FpLJSnEGR+nK44h8S9YvRwsG1kO0xIZ9OsEHR+Z
	l1CKWMuJt5U+mECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0FA113432;
	Thu, 12 Nov 2026 14:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T8
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:39 +0000
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
Subject: [PATCH v3 7/9] KVM: pass the mmu_notifier event and flags to kvm_gfn_range
Date: Thu, 12 Nov 2026 15:20:36 +0100
Message-ID: <20261112142039.907090-9-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-16.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -16.30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062542_635075_C74C0BEF 
X-CRM114-Status: GOOD (  11.02  )
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

UHJvcGFnYXRlIHRoZSBldmVudCBhbmQgZmxhZ3Mgb2YgdGhlIG1tdV9ub3RpZmllciBpbnZhbGlk
YXRpb24gaW50bwpzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSwgc28gdGhhdCBhcmNoaXRlY3R1cmUgaGFu
ZGxlcnMgY2FuIGRldGVjdCBhCnBlcm1pc3Npb24gdXBncmFkZSAoTU1VX05PVElGSUVSX1JBTkdF
X1BFUk1fVVBHUkFERSkuIE5vIGZ1bmN0aW9uYWwKY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQ2Fy
bG9zIEzDs3BleiA8Y2xvcGV6QHN1c2UuZGU+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1faG9zdC5o
IHwgMyArKysKIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDggKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCBlN2ZjOTRlMjkxMGEuLjFm
NWNlNDQxMGRkYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2lu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtMjc0LDYgKzI3NCw5IEBAIHN0cnVjdCBrdm1fZ2Zu
X3JhbmdlIHsKIAllbnVtIGt2bV9nZm5fcmFuZ2VfZmlsdGVyIGF0dHJfZmlsdGVyOwogCWJvb2wg
bWF5X2Jsb2NrOwogCWJvb2wgbG9ja2xlc3M7CisJLyogRnJvbSB0aGUgbW11X25vdGlmaWVyIGlu
dmFsaWRhdGlvbiwgaWYgYW55LiAqLworCWVudW0gbW11X25vdGlmaWVyX2V2ZW50IGV2ZW50Owor
CXVuc2lnbmVkIGludCBmbGFnczsKIH07CiBib29sIGt2bV91bm1hcF9nZm5fcmFuZ2Uoc3RydWN0
IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpOwogYm9vbCBrdm1fYWdlX2dm
bihzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fZ2ZuX3JhbmdlICpyYW5nZSk7CmRpZmYgLS1n
aXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwppbmRleCBjZjRj
YjU4NmYxNDAuLmM1MTdkMWRlYjQ4OCAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYwor
KysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC01MzIsNiArNTMyLDggQEAgc3RydWN0IGt2bV9t
bXVfbm90aWZpZXJfcmFuZ2UgewogCWJvb2wgZmx1c2hfb25fcmV0OwogCWJvb2wgbWF5X2Jsb2Nr
OwogCWJvb2wgbG9ja2xlc3M7CisJZW51bSBtbXVfbm90aWZpZXJfZXZlbnQgZXZlbnQ7CisJdW5z
aWduZWQgaW50IGZsYWdzOwogfTsKIAogLyoKQEAgLTYxMyw2ICs2MTUsOCBAQCBzdGF0aWMgX19h
bHdheXNfaW5saW5lIGt2bV9tbl9yZXRfdCBrdm1faGFuZGxlX2h2YV9yYW5nZShzdHJ1Y3Qga3Zt
ICprdm0sCiAJCQkgKi8KIAkJCWdmbl9yYW5nZS5hcmcgPSByYW5nZS0+YXJnOwogCQkJZ2ZuX3Jh
bmdlLm1heV9ibG9jayA9IHJhbmdlLT5tYXlfYmxvY2s7CisJCQlnZm5fcmFuZ2UuZXZlbnQgPSBy
YW5nZS0+ZXZlbnQ7CisJCQlnZm5fcmFuZ2UuZmxhZ3MgPSByYW5nZS0+ZmxhZ3M7CiAJCQkvKgog
CQkJICogSFZBLWJhc2VkIG5vdGlmaWNhdGlvbnMgYXJlbid0IHJlbGV2YW50IHRvIHByaXZhdGUK
IAkJCSAqIG1hcHBpbmdzIGFzIHRoZXkgZG9uJ3QgaGF2ZSBhIHVzZXJzcGFjZSBtYXBwaW5nLgpA
QCAtNzM4LDYgKzc0Miw4IEBAIHN0YXRpYyBpbnQga3ZtX21tdV9ub3RpZmllcl9pbnZhbGlkYXRl
X3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAogCQkub25fbG9jawk9IGt2bV9t
bXVfaW52YWxpZGF0ZV9zdGFydCwKIAkJLmZsdXNoX29uX3JldAk9IHRydWUsCiAJCS5tYXlfYmxv
Y2sJPSBtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSwKKwkJLmV2ZW50CQk9IHJh
bmdlLT5ldmVudCwKKwkJLmZsYWdzCQk9IHJhbmdlLT5mbGFncywKIAl9OwogCiAJdHJhY2Vfa3Zt
X3VubWFwX2h2YV9yYW5nZShyYW5nZS0+c3RhcnQsIHJhbmdlLT5lbmQpOwpAQCAtMjU1Miw2ICsy
NTU4LDggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGt2bV9oYW5kbGVfZ2ZuX3Jhbmdl
KHN0cnVjdCBrdm0gKmt2bSwKIAogCWdmbl9yYW5nZS5hcmcgPSByYW5nZS0+YXJnOwogCWdmbl9y
YW5nZS5tYXlfYmxvY2sgPSByYW5nZS0+bWF5X2Jsb2NrOworCWdmbl9yYW5nZS5ldmVudCA9IHJh
bmdlLT5ldmVudDsKKwlnZm5fcmFuZ2UuZmxhZ3MgPSByYW5nZS0+ZmxhZ3M7CiAKIAkvKgogCSAq
IElmL3doZW4gS1ZNIHN1cHBvcnRzIG1vcmUgYXR0cmlidXRlcyBiZXlvbmQgcHJpdmF0ZSAudnMg
c2hhcmVkLCB0aGlzCi0tIAoyLjUxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
