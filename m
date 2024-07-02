Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFB8C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lLfs4HoFohJwtkx6qNl+D4hJLpJB9kONhyQZ//1WHug=; b=ML03U6KsCMz1VC
	BQvvsoM3IvWODa8eJH8ePtl0EFw3oV3ii5dGF9j9qnWR5ca/e+pDZegdtUjcLyL5m9+2adkvZh+O1
	F6ngqIxfYlqk84BytEU2LTmuKr/WLTiBixhMsq957Uj+KTynvpw+oF8LkbK1meUoL8s+9HATIgoCS
	AaInPNjswZcaCjzBzQG3k4t5hIbL8+bhuzn2fIJAg5bG4HMAn+At/ewheE4oNXChLZWyWuo/ZSKiZ
	dM7DzB7UxtcmZSikvfhq3VCe4YAGMLptK4kOInFJ+EaRYPRCBANct33PPB5LI1hKO+jfLQwnqj6ZO
	M2yCox6WvlW4WLT0L7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOaix-00000006LQT-3GI6;
	Tue, 02 Jul 2024 10:26:59 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOaiu-00000006LPJ-1L0N
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 10:26:57 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5c410776a80so2077552eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 03:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719916014; x=1720520814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+6YVXnCoQ7qEw7sNekNtkJPPQroyl9lTFP46uKAB1k0=;
        b=PPTNrv+J2dBgoUsdnfFJhxnEwS3IvpcM3pjWRnl3dTJsiDXq44KmB/FkUBoMi3VSk8
         aLeQeqzJn3NcTYZoGMmBZKczAy+JZhK/NPY4ieTytXrLmmxbSkTI/v4d1CVzpnHih0FM
         iOizfSwK1J0qHs9HlYN1hrQvqKwyum1mHjBwbefPmHbtEhzcjDHFZ1ABerTx0hImPXjJ
         cgJPC32wCihI3wMw1JB/Ai9DecXgB87feW+gs9YmdFiW/YDpPxDNnM/CkHxQ6sBKbHG0
         QN6NVo05QXEso8hoEQv+MLnFsGctw+bvncZJPfjobUaa94Ktvlx+kjoWR1uCgqYLS2EN
         basw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719916014; x=1720520814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6YVXnCoQ7qEw7sNekNtkJPPQroyl9lTFP46uKAB1k0=;
        b=aB7mCd0kbCc7wxmlbrDsi7aC0QonNn/14iyCZ/WwJMUR0+6pOKGvW75MnJ0ATiG3D6
         24Y+HqC4w9BjcguC7MYUAP7JxbefWyCwGSFev9fu6/YVS6qrVVYkiyzsF9OfuFeZwWnk
         oDrNs3k+Ju9ueKDHSdkHPFwCk/q3bdb033UK4K6ea/K83t/Pm/uz/xecoz+Iz6awsCD8
         XteIa8ms0eYjEwU7B3zsD+vk5TTki0Ye4vk9Pwm6TwH14U4WtRsOOe3Z7mxHrXOwxhUH
         fovK7H+9oWhCR06JcnEHp/XMe970/3JSkJydqCuttAuOvuk2gzrBB2DE4VJa2cZFfHMi
         6kZQ==
X-Gm-Message-State: AOJu0YxpAcAHfpk/XwOJSiOPl52bVBWR81Rl0I1NGAkQ9ggOBAXSEcF5
	QGq5xI9wJ/spb0tSKMSKqLLR7NQzPSt3z1vim0xNw/D67zG0Kn1YN6aG03o/YYkh8W2wLqx3YZZ
	A
X-Google-Smtp-Source: AGHT+IE7N5uVnEVvb3xPK8QgJDLCvw56PgeF1K1Z2Y9HlVJpsAXkadeed7hFYdYJLiP6XqLxa1Q6hA==
X-Received: by 2002:a4a:1a42:0:b0:5c4:c72:b257 with SMTP id 006d021491bc7-5c438e095c4mr7689214eaf.2.1719916014592;
        Tue, 02 Jul 2024 03:26:54 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([2401:4900:531b:f9d9:fde0:f256:2f01:22f4])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-5c41493a0d7sm1367803eaf.28.2024.07.02.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 03:26:54 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v8] riscv: mm: Add support for Svinval extension
Date: Tue,  2 Jul 2024 15:56:37 +0530
Message-Id: <20240702102637.9074-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_032656_382499_824E12E6 
X-CRM114-Status: GOOD (  17.14  )
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

The Svinval extension splits SFENCE.VMA instruction into finer-grained
invalidation and ordering operations and is mandatory for RVA23S64 profile.
When Svinval is enabled the local_flush_tlb_range_threshold_asid function
should use the following sequence to optimize the tlb flushes instead of
a simple sfence.vma:

sfence.w.inval
svinval.vma
  .
  .
svinval.vma
sfence.inval.ir

The maximum number of consecutive svinval.vma instructions that
can be executed in local_flush_tlb_range_threshold_asid function
is limited to 64. This is required to avoid soft lockups and the
approach is similar to that used in arm64.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
Changes in v8:
- Fix line wrap
- Add RB tag

Changes in v7:
- Use existing svinval macros in the insn-def.h
- Rename local_sinval_vma_asid to local_sinval_vma

Changes in v6:
- Rebase on latest torvalds/master

Changes in v5:
- Reduce tlb flush threshold to 64
- Improve implementation of local_flush_tlb* functions

Changes in v4:
- Rebase and refactor as per latest changes on torvalds/master
- Drop patch 1 in the series

Changes in v3:
- Fix incorrect vma used for sinval instructions
- Use unified static key mechanism for svinval
- Rebased on torvalds/master

Changes in v2:
- Rebased on 5.18-rc3
- update riscv_fill_hwcap to probe Svinval extension

 arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..782147a63f3b 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -6,6 +6,27 @@
 #include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
+#include <asm/cpufeature.h>
+
+#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
+
+static inline void local_sfence_inval_ir(void)
+{
+	asm volatile(SFENCE_INVAL_IR() ::: "memory");
+}
+
+static inline void local_sfence_w_inval(void)
+{
+	asm volatile(SFENCE_W_INVAL() ::: "memory");
+}
+
+static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
+	else
+		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
+}
 
 /*
  * Flush entire TLB if number of entries to be flushed is greater
@@ -26,6 +47,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 		return;
 	}
 
+	if (has_svinval()) {
+		local_sfence_w_inval();
+		for (i = 0; i < nr_ptes_in_range; ++i) {
+			local_sinval_vma(start, asid);
+			start += stride;
+		}
+		local_sfence_inval_ir();
+		return;
+	}
+
 	for (i = 0; i < nr_ptes_in_range; ++i) {
 		local_flush_tlb_page_asid(start, asid);
 		start += stride;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
