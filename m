Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E1AC27C53
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2024 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7RVQNNc2VODh+YXvF4Pw7szv3hT37kACrTe8xv92xg=; b=xn4OYsgITVD8b9
	tAMffCxQNblPvYdeQet5oEiUrC+SJbZl30bl6qASXLqZpsb9MLXEOVb8xvpl5ZxLX3+pq77fRqvA1
	bg0uhjtS0ZikGMpVnm6zHQh6n6gVeAVBWo9SfhOtD9XjLpmEyelfR1lUCRaAtcUQTK/o0CaK0D3iI
	1ik7NvMc0Jjvf1BzdCb68M0zr0ogY2nqlWzfuhYwPLQLAg8Ra1lemwpuPBFQT34gEQeVPykJWHWI+
	yG8fIBfapNxBpFz3cECnhZCmjxYY0+vruZeBkvs2tRjlhuOjS/Gq/KlO9H1MAGyd7S9Xeu1z8bPow
	8v//8oFkLO4h9/Q1nUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGGc4-00000002U07-3y3T;
	Sun, 09 Jun 2024 11:21:28 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGGc0-00000002TzK-1eNI
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jun 2024 11:21:27 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6f97b836c42so502279a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717932083; x=1718536883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6LeVbVhP8fW9dLLQgkcFQHgf3T0RCtlXo8wcgs1rnU=;
        b=FD46pb3tOLwsVI5M4/pcZr478aCL04o8BSPIPwOeOpLdXMqasi7oSZft8ROZYRkrvh
         /QeFQ/uNItp9HWAJVfBvgdWxGFIrEjB3apgGgLjrB7O6dBCd+R6SlrxG+tcPKhMz0zLH
         PLJeCql0YV5NzfyTunPafYfH2hFk2SzBFN/lkl09/qmNHdR4GlI/pcvDgKeIDrvEntz4
         DuzyeU5Ya7iqJ9IAvrnd8l5xm3OF5SHy8jw7xRsmEZHDl/4jkCH9mAtTExMoC8OykzGi
         D/IcBKB1wmxZkheztu2cfdi0x0Psk0LxKzNKg62aR9BZbGb5XCG1zNheFGYVfkv/UpHH
         m3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717932083; x=1718536883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6LeVbVhP8fW9dLLQgkcFQHgf3T0RCtlXo8wcgs1rnU=;
        b=E7laBO4CsrQ6YGQSMYFiHKdzTbpNjbthLApWk6ceoZJJcx2j86RmyhzUFFfHsXR60G
         TrTgGxqpDRA5gBChdgoWhvd/x8cCDwXbFifj27+Pif07w0bE7cQW663JmOhioaMvznPd
         EZuI+1nM6jxTbR/wm6Y67LIfcuTaCO3seCd1A9GyuCeuE04snn3PWwjigGdKqQSt5EFm
         V2++WeprWZPbfdBM2ClkcS5BACWa3a1/etJOASEeT3Dorl3gt437jEl40CDcbG9yVcOy
         K/UUTs6NW+bpytLGo2ze707NQEN3c+ZLt91PrHGnrsuVC3i8xlBGssvaqMbu4+CrnvSA
         mvFQ==
X-Gm-Message-State: AOJu0YyF1XBGyZKwXXEExDLBEpMviKd/ARxoVJfkSmh/BsHzEHc4vb4l
	G+CnfvpebGwWOO3+YD62y05fbLPPDuItRrSTXbB0iDGaB9UBIRvsmwcD763pcPPNmYGpyUZg4ij
	G
X-Google-Smtp-Source: AGHT+IHwBScq1ebphyGH+iK2HIk04UnLf8UGXAlgSrlVCk/JKXyljLxMeVrhBQqlS4Czk84vs5zKig==
X-Received: by 2002:a05:6358:9103:b0:19f:1959:3c3d with SMTP id e5c5f4694b2df-19f1ff8ee68mr712652655d.26.1717932082658;
        Sun, 09 Jun 2024 04:21:22 -0700 (PDT)
Received: from ThinkPad-T490.. ([223.233.86.175])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f7092a525esm8168355ad.241.2024.06.09.04.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 04:21:22 -0700 (PDT)
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
Subject: [PATCH v6 1/1] riscv: mm: Add support for Svinval extension
Date: Sun,  9 Jun 2024 16:51:03 +0530
Message-Id: <20240609112103.285190-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240609112103.285190-1-mchitale@ventanamicro.com>
References: <20240609112103.285190-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_042124_530649_27632D4D 
X-CRM114-Status: GOOD (  14.68  )
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
---
 arch/riscv/mm/tlbflush.c | 58 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..49d7978ac8d3 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -6,6 +6,54 @@
 #include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
+#include <asm/cpufeature.h>
+
+#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
+
+static inline void local_sfence_inval_ir(void)
+{
+	/*
+	 * SFENCE.INVAL.IR
+	 * 0001100 00001 00000 000 00000 1110011
+	 */
+	__asm__ __volatile__ (".word 0x18100073" ::: "memory");
+}
+
+static inline void local_sfence_w_inval(void)
+{
+	/*
+	 * SFENCE.W.INVAL
+	 * 0001100 00000 00000 000 00000 1110011
+	 */
+	__asm__ __volatile__ (".word 0x18000073" ::: "memory");
+}
+
+static inline void local_sinval_vma_asid(unsigned long vma, unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID) {
+		/*
+		 * rs1 = a0 (VMA)
+		 * rs2 = a1 (asid)
+		 * SINVAL.VMA a0, a1
+		 * 0001011 01011 01010 000 00000 1110011
+		 */
+		__asm__ __volatile__ ("add a0, %0, zero\n"
+					"add a1, %1, zero\n"
+					".word 0x16B50073\n"
+					:: "r" (vma), "r" (asid)
+					: "a0", "a1", "memory");
+	} else {
+		/*
+		 * rs1 = a0 (VMA)
+		 * rs2 = 0
+		 * SINVAL.VMA a0
+		 * 0001011 00000 01010 000 00000 1110011
+		 */
+		__asm__ __volatile__ ("add a0, %0, zero\n"
+					".word 0x16050073\n"
+					:: "r" (vma) : "a0", "memory");
+	}
+}
 
 /*
  * Flush entire TLB if number of entries to be flushed is greater
@@ -26,6 +74,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 		return;
 	}
 
+	if (has_svinval()) {
+		local_sfence_w_inval();
+		for (i = 0; i < nr_ptes_in_range; ++i) {
+			local_sinval_vma_asid(start, asid);
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
