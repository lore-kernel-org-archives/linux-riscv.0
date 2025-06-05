Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAA6C5B552
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVpVoIn1HklME1fNkPdYFOLAduwvZcmZkc8XHdT+zhE=; b=iA7USK3z0OO1rc
	3ar04+BThryK7UJNr7dX0NdKpMuGHo2Kgy31DKh5vqPkF3vxk/MkAUkD3F7PIotwBBBWCUiUjjdzZ
	ZQpfrlpQiLTldCfpe1RTSMIz/QN+7P+O1GMq3WysJ1xhC2eLlLHaXNxZ6jnRiBLZsVidqrXDVZ6cl
	bxEjbus4mSxUmAsOo48bulS9km/ehC7/471iBlnMbr7sDM2yODduDxEzrKooxR5lSou3tRLWRZP7p
	SnjS8Y4/Ju3N/xcRE+5uK70tTP4DrcNiRxmGVzPdP852v4jMUoiV/2uaziX01Iexru3sax5KfY3LE
	QWtsAmNRdoXGFEYe4Bsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t8-0000000EpFO-2s79;
	Thu, 05 Jun 2025 06:15:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t3-0000000Ep7G-0M5x
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-312a62055d0so651598a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104136; x=1749708936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBw4EHffUTV31O6B+TCgyeA+gw4sP4Qg6j7rVTIEdxU=;
        b=gjEbppLbVa6F/Dy6SrnUV+iJyjSjw13nF1xxRvRTSuvkFLVnsjXJgEpWlc24ilT69t
         oLKm1goDuaYphz4yzKnH+tJPViVcwVKOlNS3j2nWXX70pCr7ejdqGVFnMceTDyAuhxNv
         JNb3wqqTBw2zr9wXAFf3jYC0Ro8ZROuJqGvn24cpvjGwHZY1ue7Ow+NsHEaZZ2Br6VK4
         eJ0/k94IMlC+5yKV+amg6jnU/n0dzW8vKi74d4hm6QwF3EqywWxDHj14aRZjzYd26nKF
         LDs2wcaf+6wfR+VPNdE2T+o8D2PBQ8w3+oyvf7QOC/wtOL2JpyvRf6p4lbWYVIVHdbi8
         FWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104136; x=1749708936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBw4EHffUTV31O6B+TCgyeA+gw4sP4Qg6j7rVTIEdxU=;
        b=A2GpS7AVRUMq00pVmvrLHvTEwbIbuR7bKDwm/ZwsERM1VLRRJLjgaufMbPf+kYvJyM
         14gGRsx86V2778gTAFf0JvZ5wXW9F4VJWWCbh7aTAcA0fZmTkazJsFQnmrnWRy6QLTo+
         xTvV+sGcrjRr7uZF04S/wU8hJbClG9cCOSeqj+0VjexOMTxnoiIzyfACFIXMpTkCll90
         kFAkQeXuNspOApr+0nGgW2kdKWVj0jm45RwYCAOE9vRt/j4mYgw7d2OFpIiG03bunal5
         aoe7YP78/NMW8umJuxNgCFU0SVGIjoOP+0IXv/H+wkHSoCuSDboD1Rb5hgOUVy1mqltj
         kPSw==
X-Forwarded-Encrypted: i=1; AJvYcCWpN5eLPDA72cWTiezj9/sMmGq5IabOOGv3TY+yrGe8LMGQVD6J/cADk4WubSn2eOhXrPbeL42d0La5UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Xnrjxhuqa6WGruerUIz8cXlOur3D7P7XSj8EFUjHsNLr0G0c
	hpHhNQnh6POoCrowXv5O6BOhxCEsYZoS+jc/RkMIe4LyUO4BqIqZeNY8aTmSdD0kLIs=
X-Gm-Gg: ASbGncsVRg83ngnx8eg3Jh76Buk9nRwGuclzp2H4+JSRYO2HdxaLQuk2Ys3A//i+y7i
	jh3tcC4lL+hSodP9o3Qi6uTD1xcJpfjqIMv/UFxKMCgX7gp+Bv8Mn9qHx7vM53hZiNWPYZlrZoK
	9XOPHhjpzGVOBJ4N7eYWBmzRQs8j7ysX/0d/SgtkeHxxyJJ+HZbLbrXMVkhRd0dI0FaoEyDvxfr
	u84QX8ISQYaYKZREkbmFFTovwZ0oZRc9rJ0WxfDr2fCLI4/nWXUlekQl8pLdE2kiEW32g8LwOZO
	XiQkJ0ApEyYv9qLXN8g6p7bLX8qiYBe2eznahUiSznDB0uqFdn3gphshn3FbTlAsH4+UXaZpUED
	dIROfYjEW7qSUhr+DIoxqYQkt9lg=
X-Google-Smtp-Source: AGHT+IFD6i36g3dYe1k+gDLGsx1D0hcp/ZxtNU3y3iDfAyRruAl8oD12KxZBz84WYVYtRaZXIXAJqw==
X-Received: by 2002:a17:90b:3ec7:b0:311:9c9a:58da with SMTP id 98e67ed59e1d1-3130cd12ba3mr8390187a91.8.1749104135972;
        Wed, 04 Jun 2025 23:15:35 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:35 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 08/13] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
Date: Thu,  5 Jun 2025 11:44:53 +0530
Message-ID: <20250605061458.196003-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231537_163225_61D2671B 
X-CRM114-Status: GOOD (  11.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The kvm_arch_flush_remote_tlbs_range() expected by KVM core can be
easily implemented for RISC-V using kvm_riscv_hfence_gvma_vmid_gpa()
hence provide it.

Also with kvm_arch_flush_remote_tlbs_range() available for RISC-V, the
mmu_wp_memory_region() can happily use kvm_flush_remote_tlbs_memslot()
instead of kvm_flush_remote_tlbs().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 2 ++
 arch/riscv/kvm/mmu.c              | 2 +-
 arch/riscv/kvm/tlb.c              | 8 ++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index afaf25f2c5ab..b9e241c46209 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -42,6 +42,8 @@
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d4eb1999b794..834d855b0478 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -342,7 +342,7 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
 	spin_lock(&kvm->mmu_lock);
 	gstage_wp_range(kvm, start, end);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index da98ca801d31..f46a27658c2e 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -403,3 +403,11 @@ void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
 			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
 }
+
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
+{
+	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
+				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
+				       PAGE_SHIFT);
+	return 0;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
