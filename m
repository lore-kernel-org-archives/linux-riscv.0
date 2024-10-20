Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDECD3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5hVtMCJrKG/jn/PRW/2+fHKuHpTo6skYSAT7FnoSLk=; b=U0wEv4H2B5LcAY
	wyO5l3OJiR1jgyH+cg69FZHtmhLkvmww+XHkbZhdbR6zTs0lheWbRuryeWFLFzD/6RgEiZ35M/DiS
	WLvryAXwMo2MtReEgJva6GfaQzvA61u8o8gEzka70u9kyChvoBF7fM1rNPwNN1m0t/rFEXsjnUG09
	4oOpc7JRxJf457Kx4RR3nDImywduWscYRTrL0uvXC3ZGNKjjULnXEIuohJ//X8kFWL52ppl7cjOmT
	+Kd95pwqAxqX2Uxuweip31OyYLdkyysSQtAlaS38COIle6waPZciHcizLPSL6zpgldsVhMwCiXD96
	gnz97QkKBzlBagoh947g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buS-00000005N2B-3hqJ;
	Sun, 20 Oct 2024 19:48:16 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buA-00000005Mlu-3YsR
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:48:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e2ed59a35eso3143902a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453678; x=1730058478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS7Zu5aP5OUy3H1PVCUGTrOwGn7CBou3wja5LgjZ/J0=;
        b=CzbDBWZ/RdcNXXfTkb/91BHi2wRkQEHlFluuIMAJ3cypKAiuWdrg7BK530J2pJwJ0f
         e93fhPauwKae+wvJf6UJX6+7fGclarXsCvPqQcmXug6j0fB4v9mkae4bQaVwf88VpEzy
         pbzZUFqL3oxpb8H8oF9BLa60Bo93IMJGvjK0vmue5LlB9gyH2ABuIH4PO7n4ke/nNPh1
         zX6rEEqxBReVYm/C6kjfe9nvOlF2hYa/zSzAVb36b5CIpKR3uYZNzEgXremG26PZDcC1
         RTeURsiUDQzGIa8eZpOerRWM0vI9piz9Xs37itZAhmfXZVOj7zkV5W/nnqovYbSPYxMD
         esZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453678; x=1730058478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KS7Zu5aP5OUy3H1PVCUGTrOwGn7CBou3wja5LgjZ/J0=;
        b=bOhEGi3T47l5vHH4CsNHZpbHia4agwd3HBbDfmQyF6nUIdV9p+GekkjN3V0E+anrzZ
         wsq33wH9a829FrbTnF4KPf1NUn800Cja/1IhBAvGIGwD784gboouVmnXjvNvW5aiq883
         H7baveExkGS7vQw06fgpCS0TxRcZADNhch+Sa3Lpne8Ymxg3PUQ7G9sFtAe+AsC6kihb
         +H6zKjOMM6xbs10o7z9FD1lpP0768YTyDhL0KGCZj1vY54iPUTq63MRmteB9rJkGNrne
         PyWvbSRVqmBk+GAR4531yd8Nqu0s5DgSu0daTjcFErIe9Qr4gHhYz3HaTXClhp9NGQM+
         dyBg==
X-Forwarded-Encrypted: i=1; AJvYcCUKL3mupQpmE92wcKd+dBYhhr28BVCZef75D/raVqRvg6CHjLuw8YmWJ2YCovxy0oDAzS3h4WVoRSC+0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIWxJ2e2P/s6t5gcXfA4np/MgqEXJbsdftyxO+VexZztercub1
	l+z70NK5ztRuehNn2EbKW1JSeaquxsHHoPo4ep141gqSWZ9lo1YjVb9W2e0ESfY=
X-Google-Smtp-Source: AGHT+IGnS7/U9pCy/yFTaLxnb90oRcnjeE7u+Mb775msHzTrrMgFD70FOBbx5TY/apdqG3+0xp0q3g==
X-Received: by 2002:a17:90a:f002:b0:2e2:cd22:b092 with SMTP id 98e67ed59e1d1-2e5617572e6mr11026433a91.16.1729453677600;
        Sun, 20 Oct 2024 12:47:57 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:56 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 07/13] RISC-V: Add defines for the SBI nested acceleration extension
Date: Mon, 21 Oct 2024 01:17:28 +0530
Message-ID: <20241020194734.58686-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124758_945508_583E5C14 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

Add defines for the new SBI nested acceleration extension which was
ratified as part of the SBI v2.0 specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 120 +++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 98f631b051db..6c82318065cf 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -34,6 +34,7 @@ enum sbi_ext_id {
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
+	SBI_EXT_NACL = 0x4E41434C,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -281,6 +282,125 @@ struct sbi_sta_struct {
 
 #define SBI_SHMEM_DISABLE		-1
 
+enum sbi_ext_nacl_fid {
+	SBI_EXT_NACL_PROBE_FEATURE = 0x0,
+	SBI_EXT_NACL_SET_SHMEM = 0x1,
+	SBI_EXT_NACL_SYNC_CSR = 0x2,
+	SBI_EXT_NACL_SYNC_HFENCE = 0x3,
+	SBI_EXT_NACL_SYNC_SRET = 0x4,
+};
+
+enum sbi_ext_nacl_feature {
+	SBI_NACL_FEAT_SYNC_CSR = 0x0,
+	SBI_NACL_FEAT_SYNC_HFENCE = 0x1,
+	SBI_NACL_FEAT_SYNC_SRET = 0x2,
+	SBI_NACL_FEAT_AUTOSWAP_CSR = 0x3,
+};
+
+#define SBI_NACL_SHMEM_ADDR_SHIFT	12
+#define SBI_NACL_SHMEM_SCRATCH_OFFSET	0x0000
+#define SBI_NACL_SHMEM_SCRATCH_SIZE	0x1000
+#define SBI_NACL_SHMEM_SRET_OFFSET	0x0000
+#define SBI_NACL_SHMEM_SRET_SIZE	0x0200
+#define SBI_NACL_SHMEM_AUTOSWAP_OFFSET	(SBI_NACL_SHMEM_SRET_OFFSET + \
+					 SBI_NACL_SHMEM_SRET_SIZE)
+#define SBI_NACL_SHMEM_AUTOSWAP_SIZE	0x0080
+#define SBI_NACL_SHMEM_UNUSED_OFFSET	(SBI_NACL_SHMEM_AUTOSWAP_OFFSET + \
+					 SBI_NACL_SHMEM_AUTOSWAP_SIZE)
+#define SBI_NACL_SHMEM_UNUSED_SIZE	0x0580
+#define SBI_NACL_SHMEM_HFENCE_OFFSET	(SBI_NACL_SHMEM_UNUSED_OFFSET + \
+					 SBI_NACL_SHMEM_UNUSED_SIZE)
+#define SBI_NACL_SHMEM_HFENCE_SIZE	0x0780
+#define SBI_NACL_SHMEM_DBITMAP_OFFSET	(SBI_NACL_SHMEM_HFENCE_OFFSET + \
+					 SBI_NACL_SHMEM_HFENCE_SIZE)
+#define SBI_NACL_SHMEM_DBITMAP_SIZE	0x0080
+#define SBI_NACL_SHMEM_CSR_OFFSET	(SBI_NACL_SHMEM_DBITMAP_OFFSET + \
+					 SBI_NACL_SHMEM_DBITMAP_SIZE)
+#define SBI_NACL_SHMEM_CSR_SIZE		((__riscv_xlen / 8) * 1024)
+#define SBI_NACL_SHMEM_SIZE		(SBI_NACL_SHMEM_CSR_OFFSET + \
+					 SBI_NACL_SHMEM_CSR_SIZE)
+
+#define SBI_NACL_SHMEM_CSR_INDEX(__csr_num)	\
+		((((__csr_num) & 0xc00) >> 2) | ((__csr_num) & 0xff))
+
+#define SBI_NACL_SHMEM_HFENCE_ENTRY_SZ		((__riscv_xlen / 8) * 4)
+#define SBI_NACL_SHMEM_HFENCE_ENTRY_MAX		\
+		(SBI_NACL_SHMEM_HFENCE_SIZE /	\
+		 SBI_NACL_SHMEM_HFENCE_ENTRY_SZ)
+#define SBI_NACL_SHMEM_HFENCE_ENTRY(__num)	\
+		(SBI_NACL_SHMEM_HFENCE_OFFSET +	\
+		 (__num) * SBI_NACL_SHMEM_HFENCE_ENTRY_SZ)
+#define SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(__num)	\
+		SBI_NACL_SHMEM_HFENCE_ENTRY(__num)
+#define SBI_NACL_SHMEM_HFENCE_ENTRY_PNUM(__num)\
+		(SBI_NACL_SHMEM_HFENCE_ENTRY(__num) + (__riscv_xlen / 8))
+#define SBI_NACL_SHMEM_HFENCE_ENTRY_PCOUNT(__num)\
+		(SBI_NACL_SHMEM_HFENCE_ENTRY(__num) + \
+		 ((__riscv_xlen / 8) * 3))
+
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_BITS	1
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_SHIFT	\
+		(__riscv_xlen - SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_BITS)
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_MASK	\
+		((1UL << SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_BITS) - 1)
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_PEND		\
+		(SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_MASK << \
+		 SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_SHIFT)
+
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD1_BITS	3
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD1_SHIFT \
+		(SBI_NACL_SHMEM_HFENCE_CONFIG_PEND_SHIFT - \
+		 SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD1_BITS)
+
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_BITS	4
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_SHIFT	\
+		(SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD1_SHIFT - \
+		 SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_BITS)
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_MASK	\
+		((1UL << SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_BITS) - 1)
+
+#define SBI_NACL_SHMEM_HFENCE_TYPE_GVMA		0x0
+#define SBI_NACL_SHMEM_HFENCE_TYPE_GVMA_ALL	0x1
+#define SBI_NACL_SHMEM_HFENCE_TYPE_GVMA_VMID	0x2
+#define SBI_NACL_SHMEM_HFENCE_TYPE_GVMA_VMID_ALL 0x3
+#define SBI_NACL_SHMEM_HFENCE_TYPE_VVMA		0x4
+#define SBI_NACL_SHMEM_HFENCE_TYPE_VVMA_ALL	0x5
+#define SBI_NACL_SHMEM_HFENCE_TYPE_VVMA_ASID	0x6
+#define SBI_NACL_SHMEM_HFENCE_TYPE_VVMA_ASID_ALL 0x7
+
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD2_BITS	1
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD2_SHIFT \
+		(SBI_NACL_SHMEM_HFENCE_CONFIG_TYPE_SHIFT - \
+		 SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD2_BITS)
+
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_ORDER_BITS	7
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_ORDER_SHIFT \
+		(SBI_NACL_SHMEM_HFENCE_CONFIG_RSVD2_SHIFT - \
+		 SBI_NACL_SHMEM_HFENCE_CONFIG_ORDER_BITS)
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_ORDER_MASK	\
+		((1UL << SBI_NACL_SHMEM_HFENCE_CONFIG_ORDER_BITS) - 1)
+#define SBI_NACL_SHMEM_HFENCE_ORDER_BASE	12
+
+#if __riscv_xlen == 32
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_ASID_BITS	9
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_VMID_BITS	7
+#else
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_ASID_BITS	16
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_VMID_BITS	14
+#endif
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_VMID_SHIFT	\
+				SBI_NACL_SHMEM_HFENCE_CONFIG_ASID_BITS
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_ASID_MASK	\
+		((1UL << SBI_NACL_SHMEM_HFENCE_CONFIG_ASID_BITS) - 1)
+#define SBI_NACL_SHMEM_HFENCE_CONFIG_VMID_MASK	\
+		((1UL << SBI_NACL_SHMEM_HFENCE_CONFIG_VMID_BITS) - 1)
+
+#define SBI_NACL_SHMEM_AUTOSWAP_FLAG_HSTATUS	BIT(0)
+#define SBI_NACL_SHMEM_AUTOSWAP_HSTATUS		((__riscv_xlen / 8) * 1)
+
+#define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
+#define SBI_NACL_SHMEM_SRET_X_LAST		31
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
