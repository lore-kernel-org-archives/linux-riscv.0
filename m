Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAC1CAC5AA
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjOKu/HRjV3NNXrS8Bk183zcK5TcvuJGyoukNR8knnY=; b=wzt1SGm3ayaIdP
	fsZnM3F2LmuReoK0sjoiDP18qKKcJBiBS1UUnh4KRzPzBtPM5glVHDW5apvDRpsBn7B43wrdfeS8M
	h3n/2pspzXjq1RGkAp2ys8HyMInfw8Z/sFfgtMlodDj5p4u40EXuL5HKJIm7rcSnbbfK9Sq2T6z7b
	9qxUQ6xw/t9RCxxcf72QNaG/SAoUtdRdrDrfaoJmunu+poOI6Gn7WlltBplQw/fcR376InfCK472T
	fx1RHNAgO7wCehDkVxZRYBGDB2bf5yIlvGeFFCTkTsT/aHDo7eLqR2DRV/t7zYfugmKDRDWyrvPTl
	daEJuYn+kA03l5xQ+7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Mf-00000005u24-09gS;
	Sat, 20 Sep 2025 20:39:25 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MX-00000005tkH-1Spp
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:18 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-4249327319dso8145715ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400756; x=1759005556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDiaVjHF4kERpiNA+aqN0eX91N+wRKnw/AH6MzFfvy4=;
        b=pQARDDUgtF3U5DQBVpScECDrgbbj2sNkFx6uMoWi6M7rEdDQHZU2gQNzeH6kPDvGso
         NsBlwgTNKUcvDuqL6tqhVygIIz+0iVyIcfXA21YOhdPYSeXnM5ttb0BXCym1HKOX/jyO
         eqqj97MjB9NeZORWUCqqRa10c3tTSzl+cRdsYAc0f9EP5A4NBGFUWgEJ4l+W+jxK3Opl
         vgFbF+J0PFlnHzSfwo1nobXuLL/CwmkU/c62EDej2U3zsu/+MweZIvPZeQfGurX+0ACy
         unkEiwPRICzaQ+hzFDDTy74Iocp7wTv2rTRC620OyPEUN52A3GAFjoq4OqDlOXKzBwty
         eQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400756; x=1759005556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDiaVjHF4kERpiNA+aqN0eX91N+wRKnw/AH6MzFfvy4=;
        b=KFsYdmiwtkjD8lSg9YHNAStMGDZLTDve7xZtF1s01CzczBJlbuVNmTzcD5MVWwRTRf
         0tGcU4lakNQLZtp+ZUAeutooc9qNRNsuiKNgQVN3TDzC0QcSFkE+SEl8eXNMSLQHrAGP
         uPvW90YRvEEiQiglWHUM1RkDMOpDoTZqdXdcwW1V39YZn4U89naZSNf03zDiK69yXh2V
         rFFxOzsyYguCD8+qhhABExVVBEAvtOdtleTgZPAiH53DHrCjAHdFS0akzHJuiAZpJpEW
         kAUnlOhMLQ479Vx08q+jNOagRtTUmSW1k5lajwb7cNtYA95jiodCBiuuDcN+7BlwItvV
         jGWw==
X-Forwarded-Encrypted: i=1; AJvYcCUEHKduq5gnmHnbgsPxr1AOX9c8T8OdmLi3WnV2ZewcXN27aLk6NAEcexyMMC7JsjdSe+hMAG03QaCrIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybF7398zbfvP6FOrJe0N+TiyW4njnBIi6FoLMI+I01+OmnwAzE
	wNpMRfKYM691FqqAD0OSUql3YApbMWZTaEb1OdRYsXH6Fbrnw8EjLrbGJCXyQWXjOYI=
X-Gm-Gg: ASbGnctraOcX7BssokigzWui0xDWnq5CBCjxFThsVyDjqcO9oh95tqG3TxVF9GJ+4aE
	dtO0SsL49LTW7CifLYGbxt0gaJmlUcAgt7eeQAwz+sSuRKPIyCwpPBFVyTX7yyked8QdJBDXK47
	C+/d5YowcZkTFodS43UQtly2hwaV97BUICwAvfoPyr/oBqyMuqhql2oRMTk28DUCJEVBUDJm55i
	ko6DWMBluSDZrUwdFfmgpBzQLzbaJqqu/F5R/abZGslI3RARM7YtiJc/GjD3Smrr6KqySB5T7tZ
	l5fC7cQLKwkKf5Fjcbu+bBvLu6HrCQIwlr+skYpAVwMAqMXcDs4R2aGrE15u4r5temNsVjndIGk
	2DvxIhY9Dxp2C4SYk3c7PoLWH
X-Google-Smtp-Source: AGHT+IG8Raz8xeq0QgKszu3pyBicegyYf16hU26G0T5WrFouzicPpKiOvFexp2tE8Gc55HnrfGmbkg==
X-Received: by 2002:a05:6e02:1947:b0:424:80f2:299 with SMTP id e9e14a558f8ab-424819955bbmr133419975ab.27.1758400756210;
        Sat, 20 Sep 2025 13:39:16 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-424804ec921sm30642665ab.43.2025.09.20.13.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:15 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 18/18] DO NOT UPSTREAM: RISC-V: KVM: Workaround kvm_riscv_gstage_ioremap() bug
Date: Sat, 20 Sep 2025 15:39:08 -0500
Message-ID: <20250920203851.2205115-38-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133917_434631_FCF46D58 
X-CRM114-Status: GOOD (  10.20  )
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

Workaround a bug that breaks guest booting with device assignment that
was introduced with commit 9bca8be646e0 ("RISC-V: KVM: Fix pte settings
within kvm_riscv_gstage_ioremap()")
---
 arch/riscv/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 525fb5a330c0..994f18b92143 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -56,7 +56,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
-	prot = pgprot_noncached(PAGE_WRITE);
+	prot = pgprot_noncached(__pgprot(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ | _PAGE_WRITE));
 
 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
 		map.addr = addr;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
