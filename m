Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B30C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SyVJ4LwN93m4WEGueOn1g1ZqzF3M40QAOGfTznyKgA=; b=VCjzNInWvBPqvf
	vRDiOZmPmhFmEmY715jynvY8rP8PSo4ZLLpTllwyeOqV6Uw7cN9BtLdAO0qxlYi4OeuwtnaRT9Aq4
	/Kj3hU96xwRgtk0qi6VOId4XPA4pthizMhxHxuo8q6iPSN52XDeHj9YyCZI8PMMf3RIyERV9yUBEj
	VlLwCcrVWhwCju0uHO4e+6Kukf7+Q8CI0E2vTMOD0oUad0r08uo5Li43xHk7Oi+emrgYXv2nbw+ME
	IdTOuXvJbzq7bYBfuCCoP9rBm4lYFOrmaDq30uxTGTQcRLvulLYBANiIPjliEBjzYAUE4/6B0Z+WZ
	82EAiOCioTmu4L/ZeH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssf-00GdD9-ME; Thu, 07 Jul 2022 14:53:25 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssc-00GdBI-RP
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:53:24 +0000
Received: by mail-pg1-x530.google.com with SMTP id bf13so5912797pgb.11
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBfA/tOWKDH/d0iqDHWzbMXJjftxH/MH3t5WvdViZQQ=;
        b=pR+rIGsD+r3vX4OQrOKl3UZS4iF8E+D8BKUI/weNfW+PGopIXCDdZPjksfjWd8gHWJ
         BGhOtvNRX7kCy3R7cgJlcljqi+gnkzxAoh5WSZR0HT9FNGdqZT+EazoE4HHnN8Bm1P1R
         X0+52AYO3dKbRIK9Dx/ib4b2Vck4z+rBp9YkPG5A06r/1k8ZwKU9xL/q5t8VApGbfTBU
         PcXFkE/8ooEAc4YqajR0WqTNd9ntjZq+Hl9rMObxWFZmbAA4Ak5JqFsxVVOhl7VsHf5v
         3rSwa+sFPSVJJNm+Czd1o2iiK+2J6k0G6jjdQQZ3o5Q2eKasp44QJ1G+qFNAB8A0/bhV
         cp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBfA/tOWKDH/d0iqDHWzbMXJjftxH/MH3t5WvdViZQQ=;
        b=T2EV5kJQgrCtiR98UTw+U/cLzCQCCY19VXW5aKWauLXgAYZjkELvFexUYJ1WBCL8yC
         Az1x13PAk+MISeAH88FRqoJMWoX2TOz44ECaFLkCsBpWgYxKI0769fn8k9RslNiOZbA1
         XfdhRB4uMi+BSgh7e9AQ3Vn4qF0e22u4jcML2+2OIuUenA+rJM8AplKuS13nEbiXyGi4
         QRVj5U2RMDYZUK/dA+qHruqKn/qnEFY/I6Ire8mlQUeQYa02M/6VAsaV4ZIgbMZrF2cj
         DWeX/rHYe0Nx3G3UeGaHosVYjUX7Ha8dz7DxwxO0dCVtD7c9Wyf4U1fWvy753MvtWrA2
         uPhw==
X-Gm-Message-State: AJIora+7DrBG+Ytj9dvMfq3rrFcAdLtHtH0x7UsCteF5zEhQc/NGhLOO
	Sl8RMLvdsiZ6B5U8UNrfVtfpOQ==
X-Google-Smtp-Source: AGRyM1ubhD1vChakXi7/pBwgcLNQlIVivSTCug4iXuVCxFRInKz9e2YqixdPqeB+1osa1FkcEcoIxQ==
X-Received: by 2002:a17:90b:3504:b0:1ec:d246:f02d with SMTP id ls4-20020a17090b350400b001ecd246f02dmr5706687pjb.46.1657205601346;
        Thu, 07 Jul 2022 07:53:21 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([223.226.40.162])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7951a000000b0052535e7c489sm27144231pfp.114.2022.07.07.07.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:53:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/5] KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
Date: Thu,  7 Jul 2022 20:22:44 +0530
Message-Id: <20220707145248.458771-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707145248.458771-1-apatel@ventanamicro.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075322_942319_D697D6DC 
X-CRM114-Status: GOOD (  12.51  )
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

The kvm_mmu_topup_memory_cache() always uses GFP_KERNEL_ACCOUNT for
memory allocation which prevents it's use in atomic context. To address
this limitation of kvm_mmu_topup_memory_cache(), we add gfp_custom flag
in struct kvm_mmu_memory_cache. When the gfp_custom flag is set to some
GFP_xyz flags, the kvm_mmu_topup_memory_cache() will use that instead of
GFP_KERNEL_ACCOUNT.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/kvm_types.h | 1 +
 virt/kvm/kvm_main.c       | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index ac1ebb37a0ff..1dcfba68076a 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -87,6 +87,7 @@ struct gfn_to_pfn_cache {
 struct kvm_mmu_memory_cache {
 	int nobjs;
 	gfp_t gfp_zero;
+	gfp_t gfp_custom;
 	struct kmem_cache *kmem_cache;
 	void *objects[KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE];
 };
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a49df8988cd6..e3a6f7647474 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -386,7 +386,9 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
 	if (mc->nobjs >= min)
 		return 0;
 	while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
-		obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
+		obj = mmu_memory_cache_alloc_obj(mc, (mc->gfp_custom) ?
+						 mc->gfp_custom :
+						 GFP_KERNEL_ACCOUNT);
 		if (!obj)
 			return mc->nobjs >= min ? 0 : -ENOMEM;
 		mc->objects[mc->nobjs++] = obj;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
