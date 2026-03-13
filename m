Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF97106FD9D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6pRvuZG5k2fjDCge/fr7naKzTrB569gQTpvwisulB8=; b=Vjjtt8AEbV1M1g
	L6B/a8iZ92ww/hy0pUPCgQ1N6fm2W6USEVradvXEuXvQ40ndqu0h72rnfnF2HyuPpLOx95xQlq68f
	Eh31cngY32co2OsY5jXtFeozcltuPDJ8rQiJzaSCkUJL1yOIRfM/EirHpm1kEOZmK7TdjoNd9NNw9
	ZVmJ3Uah2/Rkx/mFEYvV4JXWqZsk3H53C3rn+TR795MJA1Ka7utUM9nKy13DYo1WdYNWLZT9Zjppu
	DLgu9Bjkj0Vzyamb2aU+Y4xWxjZ/PK+8wOTQcuxVPpiGILO3cmO/zR0tjF5EOPL5jiKOy+UoZNgBc
	NWR6iUpWiY34a9Z+hRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAE-0000000HImn-18Di;
	Fri, 13 Mar 2026 08:46:35 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAC-0000000HIl7-05rf
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:46:33 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8cd7a75c680so293151885a.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773391590; x=1773996390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi85CdMOPx2SFBBaOo/lEOezVJ6w78GyCuOUVcHQnfs=;
        b=M4VYjL1ExObUDEm788HlWpQxb8aEPDvm2mO6YUJ1VAv/P8jojicecbRNK6CoKxvO+X
         BVr9o/xb5SqAG9gfezVjWkbKS4tp2mfqGMCk1KxsiDcuQv1TVoIs7Dz7HC0zm1F9+p1Z
         QKWDDVzi/l4clEghgJnBkpDQkdM8WqShnPF9CXISR0LF/v2o4FXM8Mh1xfifyCoozAYf
         +0EY47jp2cw4J2tJYGQD0iaZTmvrbXufJK58NkVq8iUiq0dmJWYCqNGrEi0a0QqoH2mQ
         z8a8f/80JQ+eby09DuMuyHz9nv/mtC+lbehEnIGeC+E91JsCctI3EtGEOktguGTLw/DS
         9Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391590; x=1773996390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xi85CdMOPx2SFBBaOo/lEOezVJ6w78GyCuOUVcHQnfs=;
        b=OEpTZ0ludsv3j0PaKQ9+KZeObsl7b4m9Z08nZc1ndH7022Wi5NxAfWjCjVigi5Rl05
         +icmQT3fDuXIBj5WN3OOonk8NHC4jO+Zy3yvxoA33pP1DChvS4AXy5TF9RUczxfUQXdC
         ifQMwIe3qzFNIwMqmsPGXkEpvQZanywGh9+7aI5Euyy4v1al1vVptk0j25AXgzZf2UDc
         PxSOFT+GN1UsCU7qHktMWi4Bf2UHQgahP3i3vhEQ4/vJJlCYOVvnMNSMN82oHI7W1UvE
         St/kIpwWzQEPQncee8I3xEsayHWl4tRUy949CTC2LiqcpUm3O4eIQh9FgDGj2bJrMwJI
         fAOQ==
X-Gm-Message-State: AOJu0YwLzXuuMoRNwDPMYJM0EjXGAPADtNg3EXAblocU6yGmjBADDUAo
	mU8K5WST1QIKE5LwdqMNCPTYHfNAU3Yp8RxG5VCbOwuF9RCQz25g4jVhybzhTN44
X-Gm-Gg: ATEYQzyRtqZm0IhjQHZmJZtBLhUQm4Dv/JbZh9ryWz8k43xaaZKkztYsw9cn1CF2C5U
	gMHCBqqGlqvO3+MU+fivZg5IksRlQ0jMRud2U52weIK6f8h33azJhod9GfFfutAwYTlOL5EUsP/
	yd7dRbI3RsG2Z7+Vx67EisdvPFtezubWROcWnLukMWxv4Y7Byims5Kr4L38qXaRecxTGsOrms7o
	aDPb5ns9xZhmz/G0z3DUbI6so9iLSB25fXgyqD1h68LyzoV7ya1crbXzJIMvVDygZAhzYcbZmDU
	awacR0q5JYr4vEwmR1T/0dwGOAAiW2oFN4Y7VAjOLDvYVD//9eB3EjUqwgJvY3nuRhLz4pmkZQ6
	z/lVdVEjp5gZmZzh7kiX4Y1r+0kvPn0rmXvorgH03WKc815jWsIHGCcZdNOFf58hzDgrX1qtXBs
	wtIpPLsvqTqnaL2bHIO+RTtfbf
X-Received: by 2002:a05:6214:518d:b0:899:b03f:c989 with SMTP id 6a1803df08f44-89a729d929amr81972516d6.2.1773391590219;
        Fri, 13 Mar 2026 01:46:30 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm50142206d6.13.2026.03.13.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:46:29 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/6] riscv: apply page table attribute bits for XPbmtUC
Date: Fri, 13 Mar 2026 01:44:04 -0700
Message-Id: <20260313084407.29669-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313084407.29669-1-ganboing@gmail.com>
References: <20260313084407.29669-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_014632_089085_F9DD5E50 
X-CRM114-Status: GOOD (  12.16  )
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

Apply the UC bit like Svpbmt and THEAD_MAE does. Also changed the
_PAGE_PFN_MASK definition to exclude the UC bit, as it's position
is now determined at runtime, and can be part of PPN.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/include/asm/errata_list.h | 17 +++++++++++++++--
 arch/riscv/include/asm/pgtable-64.h  |  9 ++++++++-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 6694b5ccdcf85..ba0f3d4dd0cbb 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -53,6 +53,16 @@ asm(ALTERNATIVE(	\
 	: /* no inputs */	\
 	: "memory")
 
+#ifdef CONFIG_64BIT
+#define ALT_PAGE_CUST_BIT(_bit)						\
+asm(ALTERNATIVE("li %0, 0\t\nnop",					\
+		"1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
+		      "ld %0, %%pcrel_lo(1b)(%0)", 0,			\
+			RISCV_ISA_EXT_XPBMTUC,				\
+			CONFIG_RISCV_ISA_XPBMTUC)			\
+		: "=r"(_bit))
+#endif
+
 /*
  * _val is marked as "will be overwritten", so need to set it to 0
  * in the default case.
@@ -60,11 +70,14 @@ asm(ALTERNATIVE(	\
 #define ALT_SVPBMT_SHIFT 61
 #define ALT_THEAD_MAE_SHIFT 59
 #define ALT_SVPBMT(_val, prot)						\
-asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
+asm(ALTERNATIVE_3("li %0, 0\t\nnop",					\
 		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
 			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
 		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
-			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE)	\
+			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE,	\
+		  "1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
+			"ld %0, %%pcrel_lo(1b)(%0)", 0,			\
+			RISCV_ISA_EXT_XPBMTUC, XPBMTUC_HAS##prot)	\
 		: "=r"(_val)						\
 		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
 		  "I"(prot##_THEAD >> ALT_THEAD_MAE_SHIFT),		\
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 1a6d04884111d..aab6990d92238 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -76,7 +76,14 @@ typedef struct {
  * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
  *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
  */
-#define _PAGE_PFN_MASK  GENMASK(53, 10)
+static inline u64 riscv_pfn_mask(void)
+{
+	u64 cust_bit;
+
+	ALT_PAGE_CUST_BIT(cust_bit);
+	return GENMASK(53, 10) ^ cust_bit;
+}
+#define _PAGE_PFN_MASK  riscv_pfn_mask()
 
 /*
  * [63] Svnapot definitions:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
