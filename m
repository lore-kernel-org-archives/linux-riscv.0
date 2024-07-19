Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC817C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhEomQZ3w/Rt6oUaLliuutmjWb7sVjDOo0oUZuBut64=; b=1tbsj4K4Y22/wq
	3xnj2lAFmpcFRpP/lsaGt+bL7kifW4Bdpfyu74t/7d2Ys/n5LNzeI3YuTKP/sqmL4DCh3o5glvkj0
	bsgACaALzaySFfm2EluVCVarhhyEJjqPkLD5Cxy09RRHlq1BWePOpY1fqZQ7UKrhNflHZkfOMnsDN
	dMU85K6ke3exAvfA45ED23FJ9ideIFIbe8NLHMfUuxzIxz/nVkxeRoaw0mbPx0maFj0zbmIvUV6tu
	dTZR6qRkKmemKIQXFK3xT5tjD9xfDNPBOcRZEGRROx+eJ4EgAgXTR/1ps3CegAysKTYR6c6xVUjgX
	/NkCRIkcV8I7d4HCZOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBA-00000003BSs-3Yhi;
	Fri, 19 Jul 2024 16:09:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqB4-00000003BN1-1ZAb
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc491f9b55so20683725ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405389; x=1722010189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2Ojl6CxNtzijt64bsbd3hW1xSapMUpvDVQohCtRHds=;
        b=KhujUTv0wLhGsnl25uWOT6eyjn1n6dC8PnQhTMJgRQHlVbakXpBmYVtPo8/reVIA8m
         SasfCZl0CIlCI0WxIELjg76hCNwg0S7cEesB0EkQAXGNbap37bw/loZ9xDk8Smed8bAR
         80ylquBYXuix19/PVq192VO6Tm4vApOjpNyRWwINfo9ffoO2CFVoWE7dImLnKR4FXr1t
         hA/drJg1e78czofi4+voNmjCVYUweB9SLL82NXRepSgr9WQcCQ+BxFFhcc+nzf3raZaW
         KbRNhjItex1nS+MhLRZmzdvw/lkgBt2Qy54JE5ERQpjNb/hZhb4Ddwx1jbNGPKjtCLwk
         qPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405389; x=1722010189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2Ojl6CxNtzijt64bsbd3hW1xSapMUpvDVQohCtRHds=;
        b=YRdK9XmocZC+WsPysDDrHPdtekDXal+iAp8yiccuUtd4GEQPNXBShxEOa+pn0d/EaR
         kv/ftLBDmbt2On3k1JiWhjebV9w4wcatFjGTbytPxdK0WM4ZNzvMtuGA5MSbZtV+Ahwu
         y1hbdDZFucmDIAWG7dWjfc6zsFCquvggcsXdOt5hmK8KFiUYhLp5a/ktP9L+V/jkWM+S
         bR2vLMxRsPxrsqS5qXj3wtgaH51RWQdQkgfspVefohW3bZZBRdt2WpHZoO/uzwu0fTvr
         CdzmJYP683Mq/EO+Fhatia0nKGKzKto9+j9B9RD7ni2Z8zJHiPFG1Zdu7e7ddaU6JsLE
         4QRw==
X-Forwarded-Encrypted: i=1; AJvYcCUAJ5NlEVdx83ic8q2LS4kzztq+lEZfNa/RcQLv97Oa9I55AkXBQZfm+8Emt0NIWvnkyXCPLVEwdBiKMwNkU7pSwOMvjrXv3NEYoCLM3NFr
X-Gm-Message-State: AOJu0YxhZS9ib9p8Z8s6zG3HQLidcnrjh2ixV9PD8Z71SVpdkIb7l78E
	p5ZBo8KMYUOnTHzJCIVIsZ24uFF0VgY2sweVBAEoShrPm2PABAigLzgdeS4kpog=
X-Google-Smtp-Source: AGHT+IFJHVb5AztA8Bz3SXW38j/FW4FxxQCuUsU/Eh5eRydXFkn3S1MMglCigkpjrto6nPgWyi46Gw==
X-Received: by 2002:a17:903:22c9:b0:1fb:7b96:8467 with SMTP id d9443c01a7336-1fd7463c9d4mr3651825ad.63.1721405389316;
        Fri, 19 Jul 2024 09:09:49 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:48 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 07/13] RISC-V: Add defines for the SBI nested acceleration extension
Date: Fri, 19 Jul 2024 21:39:07 +0530
Message-Id: <20240719160913.342027-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090950_598341_E9556161 
X-CRM114-Status: UNSURE (   9.54  )
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
---
 arch/riscv/include/asm/sbi.h | 120 +++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 1079e214fe85..7c9ec953c519 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -33,6 +33,7 @@ enum sbi_ext_id {
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
+	SBI_EXT_NACL = 0x4E41434C,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -279,6 +280,125 @@ struct sbi_sta_struct {
 
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
