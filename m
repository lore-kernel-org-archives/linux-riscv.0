Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B65606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3SIKuIxo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=QCxT+YE1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g4VQci4n3mzNGHd1DNbVpsNH+kIsRbAZ0lqHI6oOj0k=; b=3SIKuIxoUjy3oJK1MCtpIRLpIZ
	/L4DLO65xWvkVZBLlDAt0SASYmJl40iZaSYPpnIbUwdPkHqPpRKBzMv+MTPPEbOw7JH7/Sitg/0Wp
	WCgwJ7h7n1F+Rk2FRGHeHnRB6KGevGTDb0/dVwW2KUlVnGvljxExUCom6A0baRYbarMDkLC84iFQU
	dMH01vcfGlRbVCelDN67tBjIFrP3JZfWF9GQ2RXXu9kp5Yo7w35C7uJz18ZDApjJDNOg/aAjlagBD
	0K+sZ7ZVVZi/ho3HjY8c8AGp4n7nz8gXrHeKV2F6KzLeC6yhyxY2bS9iRR/zs/vb6GTpIBSTFTWNo
	0YCxjnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZj-00000007T2f-18Je;
	Wed, 11 Nov 2026 19:01:39 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZa-00000007SwI-0jJs
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:01:38 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-679aeeddc6bso4354878d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 11:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423689; x=1795028489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04CmMlHtyA+HZtytO/qkm53kP2CS5CYWPfp8WeZQAe8=;
        b=QCxT+YE1I0lo4YMJ7Rhs4NpH9UsLqROkiDxSVeq2xCgwn30JuVrboj7bhkYDbDj4//
         4TMxrpILyfvTtQtd8R1qbHK62b7Dg3epKtY/Q+p3dXWf1fdN/RtSR5hQV5+GJ29NDqt+
         dYku+lC4dIyVhn0Aa76G7CRnoZO2Iayrd4eidqSIKIR+DbR8uT8F7r350BdJL+xXO+AT
         +EHHa1XKz7zOEtEZ8/60BFSGy1HlZd6obkfV0WvfT3eQw/CrtklpXwCeUaQ/ZPbYZRI8
         XQIB6aXrmKwlwm+ZA0o5PvLptLiEDQpRT1u9Bh8DajUI4jw0DTDDWy/xNRddy53xUFfl
         NJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423689; x=1795028489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04CmMlHtyA+HZtytO/qkm53kP2CS5CYWPfp8WeZQAe8=;
        b=sLp8GMlnEvjYfGDlM4T7E+cHLQbtO50qL3VoiPUBviyvAWkhA6FVl5URXkeJACA+13
         uUhtM0u32hOnWeG3K5E0A5IqM1QLUUJofX79y8TQJUcULS+OeZlvmQ+7mUM7am/PEbQm
         X8hdNVR8FUP4LLVdysx/nRj+ZcudCsSJu6YjFe6/XsRwUvLaRZVkRs+y8q8MmokH8htS
         9BkhDqvhIx9EeFfzVAHcaJD2LQKDCxI32HkF7Tswwxr16DFS7AHzazjyepzt/A8jKSCX
         1uBAFJFJgdRM0dCpQyEfVpLVkreL/9CLEf5h3HUFIy7hGOrBRQXMNZ+PtYMmU/8N7wpe
         ozxQ==
X-Forwarded-Encrypted: i=1; AL+hErEGZ4IY6n3n5GH0JtsuxiuL5sstFi54G8xuP9lvqC4OHW+uZwnnfp9I3S+J/IYkvxrSvq1VBLj8lvPYQg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+LX1HX3H0JZdFR2oNDcLahgxnSZc+r8pSCfbHZuaC2PsXNIEiv
	NwL5dpHsGLE0Vv9sXz84FAD6VzyWt2NRwHe85piTL2uRcjW/VzaCEW1OiGw6XSPsIDc=
X-Gm-Gg: AYBFou0CIKHppZNafcUs952KO4g2GlgsxN8piM9i+W6iqJBrAB5ap3iwHhqe2yYB0LN
	dw573Brm0+2BmVBYA9ZebjXj7P8UlM1E0iOpiroOlQjn7WsUXKA6WK62IGWC32u2wGNsWPJORjs
	FThLTEJPcgMH/Xjdxry5jUW3q1EGNpnH5++xeFjE7Yy88i6KebxCQEOQVl4Rq2/hOg69oh0AT92
	Lda4INzfM/+VB0JzYRBED31zZ0Co+5oJn0aDBhX/+DEv4owjmiS8x16A5vqb/38uPofg5nUwEPi
	906Zf05xaO1AcBTbj/FW9ApCj5o4dHTUL97vEo+Jo6bWA1JOTRVnnwA30QM+xNIbkua5jy7Zsu9
	ciFZXm1JIq0+0TGDuFPF8vQibar/+HTM58FZel/C51rjxNl7kkHgNdumdD3v2YDZNeOjgVNGjJB
	1D8PN1y6t+7bKSfF+5p7tJmhTgtHt/xRScEfaQHJrxlsQ/bm2sc9F8fH76NhIkBsgv6kAU9NK+V
	FGckfJUq2g34Wp2LuEv92DC5M9034K1IYFT45n/gfGmiefrFd/81qo6nUhdOM6Eeb/crVfHhrQE
	PXVLgW6j8ifg/9om4aJTFJB+u2kRjfwCykzVCsVI3dp7BoV8Wevl4RZVajslVY6JP6lPbJ0Eb5G
	Tn2ysjyPgeT6LlgnuD4Mu4BLBZku7+QDi5csNMVrHyucc2vU=
X-Received: by 2002:a05:690e:1381:b0:67b:f85b:737 with SMTP id 956f58d0204a3-67c68051586mr1824026d50.57.1794423688530;
        Wed, 11 Nov 2026 11:01:28 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:01:27 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v7 6/6] riscv: KVM: do not save host vector context for vcpu
Date: Wed, 11 Nov 2026 12:43:28 -0600
Message-ID: <20261111184359.1239821-7-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111184359.1239821-1-tchiu@tenstorrent.com>
References: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110130_224679_C80796BA 
X-CRM114-Status: GOOD (  13.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Host's vector contexts are already managed in per-thread's struct by
regular context switch routines. Saving and restoring the context in
preempt-notifier is redundant.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Note: I haven't been able to get a statistically significant result on
how this help/regress KVM performance running a nginx server in guest.
I am happy to carry out a test again and post the number if there is any
suggestions on what workload can benefit from this, thanks!

Changelog v7:
 - new patch since v7
---
 arch/riscv/include/asm/kvm_vcpu_vector.h |  9 ++-------
 arch/riscv/kvm/vcpu.c                    |  3 +--
 arch/riscv/kvm/vcpu_vector.c             | 20 ++------------------
 3 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 60fa28030944..06409c870a06 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -35,8 +35,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
 				      unsigned long *isa);
 void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 					 unsigned long *isa);
-void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
-void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_host_vector_restore(void);
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
 void kvm_riscv_register_vctx_callback(void (*func)(void));
@@ -77,11 +76,7 @@ static inline void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *c
 {
 }
 
-static inline void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
-{
-}
-
-static inline void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
+static inline void kvm_riscv_vcpu_host_vector_restore(void)
 {
 }
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index caf6e0ad72ef..d9d31851ee62 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -650,7 +650,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
 	get_cpu_vector_context();
-	kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
 					    vcpu->arch.isa);
 	put_cpu_vector_context();
@@ -677,7 +676,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	get_cpu_vector_context();
 	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
 					 vcpu->arch.isa);
-	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
+	kvm_riscv_vcpu_host_vector_restore();
 	put_cpu_vector_context();
 
 	if (kvm_riscv_nacl_available()) {
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 730c32f7de50..6129a6e18404 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -61,17 +61,9 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 	}
 }
 
-void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
+void kvm_riscv_vcpu_host_vector_restore(void)
 {
-	/* No need to check host sstatus as it can be modified outside */
-	if (!kvm_riscv_isa_check_host(V))
-		kvm_riscv_vector_save(cntx);
-}
-
-void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
-{
-	if (!kvm_riscv_isa_check_host(V))
-		kvm_riscv_vector_restore(cntx);
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
 	riscv_v_flags_set(riscv_v_flags() & ~(RISCV_V_VCPU_CTX | RISCV_V_VCPU_NEED_RESTORE));
 }
 
@@ -81,20 +73,12 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 	if (!vcpu->arch.guest_context.vector.datap)
 		return -ENOMEM;
 
-	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL_ACCOUNT);
-	if (!vcpu->arch.host_context.vector.datap) {
-		kfree(vcpu->arch.guest_context.vector.datap);
-		vcpu->arch.guest_context.vector.datap = NULL;
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 {
 	kfree(vcpu->arch.guest_context.vector.datap);
-	kfree(vcpu->arch.host_context.vector.datap);
 }
 
 void kvm_riscv_vcpu_flush_vector(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
