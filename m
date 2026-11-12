Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839166070397
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6Z55/hy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NoYzXDWf;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=27/HHTUY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NoYzXDWf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=27/HHTUY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iNpg7Ssk/1TklAoOelpwC7iOrOlkZAVrkY5j73jx3yQ=; b=Q6Z55/hycklT3X2OB/Nv1I8+Dt
	aBjlSx7SVCKBvlqYg2hCx0kFP/DDBtmrza7m0tj27ZdlyaIxPEsrwW47YL2Dz/7M+vFpXGpJ4gdFN
	rnrtfWDxV1JXhl/nwogz8PCsdOwMO5e1ff6l0a4+sWIZquDNzthyGdr0Q5/zhTxaMllAGA5W5ylgG
	eB0TyjSJpoK1arEGisOZkl/zF4YPfPBby1cEVy0eigJaf3b+P9r9pJJ1EtyXCbu5TyPDw9TK7n6ZK
	MXiV8/6HopTn7GiDw+bn69zd7cwslyj3h0SGZgMM/9axToEeWNRWdsCjthUg78W5xDsyQsH1ttXFH
	/kM/WDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkI-0000000AFE4-48eI;
	Thu, 12 Nov 2026 14:25:46 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVkF-0000000AFAB-3Gbq
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:25:45 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3588B1F7AB;
	Thu, 12 Nov 2026 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pds7Uqtuvy1DGjOeeoA+Vkfk5LWosIAipoHj1WXULeE=;
	b=NoYzXDWfAOmI8zdX5+chynT7UmwhBQTnmoRwZoMJ/VGhFM0PKtfGA/JYP/bSAIOADu9kGQ
	9gOBQ7k7ZTXpUlGUFGpEfaj3G9VTwdpmvysWY4H7QdBJ6dxmg4p0Id7AeGXlHPNsGl9x5k
	nn5xl4sAlY5CnQHYIWz4RkNYFCqp2cU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pds7Uqtuvy1DGjOeeoA+Vkfk5LWosIAipoHj1WXULeE=;
	b=27/HHTUYBi6MOz2Dw2T7fjj9pDuC9sG1BBJdzOY94YAfUiu/eHvOCNpuZOT9gxMVmfVKLl
	tBbKllXxrTJz+JCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794493542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pds7Uqtuvy1DGjOeeoA+Vkfk5LWosIAipoHj1WXULeE=;
	b=NoYzXDWfAOmI8zdX5+chynT7UmwhBQTnmoRwZoMJ/VGhFM0PKtfGA/JYP/bSAIOADu9kGQ
	9gOBQ7k7ZTXpUlGUFGpEfaj3G9VTwdpmvysWY4H7QdBJ6dxmg4p0Id7AeGXlHPNsGl9x5k
	nn5xl4sAlY5CnQHYIWz4RkNYFCqp2cU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794493542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pds7Uqtuvy1DGjOeeoA+Vkfk5LWosIAipoHj1WXULeE=;
	b=27/HHTUYBi6MOz2Dw2T7fjj9pDuC9sG1BBJdzOY94YAfUiu/eHvOCNpuZOT9gxMVmfVKLl
	tBbKllXxrTJz+JCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF33813432;
	Thu, 12 Nov 2026 14:25:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w9GzDFnM9WoAPwAAD6G6ig:T9
	(envelope-from <clopez@suse.de>); Thu, 12 Nov 2026 14:25:40 +0000
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
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 8/9] KVM: x86/mmu: don't zap secondary MMU on permission upgrade
Date: Thu, 12 Nov 2026 15:20:37 +0100
Message-ID: <20261112142039.907090-10-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -16.30
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_062544_408394_17D65EA6 
X-CRM114-Status: GOOD (  11.66  )
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

V2hlbiBhbiBtbXVfbm90aWZpZXIgaW52YWxpZGF0aW9uIG9ubHkgdXBncmFkZXMgcGVybWlzc2lv
bnMKKE1NVV9OT1RJRklFUl9SQU5HRV9QRVJNX1VQR1JBREUpLCBrZWVwIHRoZSBleGlzdGluZyBT
UFRFcyBpbnN0ZWFkIG9mCnphcHBpbmcgdGhlbS4gVGhlIFBGTiBpcyB1bmNoYW5nZWQgYW5kIG5v
IGFjY2VzcyBpcyByZXZva2VkLCBzbyBhbgpleGlzdGluZyBTUFRFIGlzIG5vIG1vcmUgcGVybWlz
c2l2ZSB0aGFuIHRoZSBuZXcgaG9zdCBQVEUsIGFuZCB0aGUgbmV3CnBlcm1pc3Npb25zIGFyZSBw
aWNrZWQgdXAgb24gdGhlIG5leHQgZmF1bHQuCgpUaGUgbW90aXZhdGluZyBjYXNlIGlzIGEgdXNl
cmZhdWx0ZmQtd3AgZGlydHkgdHJhY2tlciBzdWNoIGFzIFFFTVUncwpiYWNrZ3JvdW5kIHNuYXBz
aG90LCB3aGljaCB1bnByb3RlY3RzIGV2ZXJ5IGd1ZXN0IHBhZ2UgYXMgaXQgc2F2ZXMgaXQuClph
cHBpbmcgb24gZWFjaCB1bnByb3RlY3QgbWFrZXMgdGhlIGd1ZXN0IHJlZmF1bHQgaXRzIHdob2xl
IHdvcmtpbmcKc2V0LiBPbiBhIDY0R0IgZ3Vlc3QgdW5kZXIgYSBiYWNrZ3JvdW5kIHNuYXBzaG90
LCBhIHJlYWQtbW9zdGx5IHdvcmtsb2FkCmRyb3BzIHNlY29uZGFyeS1NTVUgcmVmYXVsdHMgZnJv
bSB+MU0vcyB0byB+Mi41Sy9zIGFuZCBjcm9zcy12Q1BVIFRMQgpzaG9vdGRvd25zIGZyb20gfjE0
MDAvcyB0byBuZWFyIHplcm8uCgpOb3RlOiB0aGlzIGFsc28gc2tpcHMgdGhlIEFQSUMtYWNjZXNz
IHBhZ2UgcmVsb2FkLCB3aGljaCBpcyBub3QgbmVlZGVkCmFzIHRoZSBwYWdlJ3MgUEZOIGlzIHVu
Y2hhbmdlZC4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNsb3BlekBzdXNlLmRlPgot
LS0KIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jIGIvYXJj
aC94ODYva3ZtL21tdS9tbXUuYwppbmRleCBmODllOWY4YTZjYzIuLjNjOTIzNzliZGJlMCAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYworKysgYi9hcmNoL3g4Ni9rdm0vbW11L21t
dS5jCkBAIC0xNzE5LDYgKzE3MTksMTMgQEAgYm9vbCBrdm1fdW5tYXBfZ2ZuX3JhbmdlKHN0cnVj
dCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdlKQogCWxvY2tkZXBfYXNzZXJ0
X29uY2Uoa3ZtLT5tbXVfaW52YWxpZGF0ZV9pbl9wcm9ncmVzcyB8fAogCQkJICAgIGxvY2tkZXBf
aXNfaGVsZCgma3ZtLT5zbG90c19sb2NrKSk7CiAKKwkvKgorCSAqIERvIG5vdCBib3RoZXIgemFw
cGluZyBTUFRFcyBpZiB0aGlzIGlzIG9ubHkgYSBwcm90ZWN0aW9uIHVwZ3JhZGUuCisJICogUGVy
bWlzc2lvbnMgd2lsbCBiZSBmYXVsdGVkLWluIG9uIGRlbWFuZC4KKwkgKi8KKwlpZiAocmFuZ2Ut
PmZsYWdzICYgTU1VX05PVElGSUVSX1JBTkdFX1BFUk1fVVBHUkFERSkKKwkJcmV0dXJuIGZhbHNl
OworCiAJaWYgKGt2bV9tZW1zbG90c19oYXZlX3JtYXBzKGt2bSkpCiAJCWZsdXNoID0gX19rdm1f
cm1hcF96YXBfZ2ZuX3JhbmdlKGt2bSwgcmFuZ2UtPnNsb3QsCiAJCQkJCQkgcmFuZ2UtPnN0YXJ0
LCByYW5nZS0+ZW5kLAotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
