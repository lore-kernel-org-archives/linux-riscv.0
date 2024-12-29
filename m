Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69150E7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oU6rFay5sRNxnepcWrZccoSTGSKKZxohbV/3EZ6p6g=; b=kuzkCHe1j2odkW
	d3LzdeEdVFQziBbj1SG6vpJBdIt7TJVfV0kBZsDPj5ZNAZB+gAARa8inIaxPHaWja4ZqS5nqefBRg
	cxoLZj8+NZs34OkcOaFkgsf21ZhheTy00wLMfePccsrvcEZMv/2uOnvCfjkXWcrZWrbl0YQy/TtCs
	Ta+21ZwKhJcrqreHxnVw+JpPKag8W8FGve9hzh0mknh/1ETy2jOyk9Z4GCC9DoT2q1gpqQvi9Mj7o
	AolsawZhsCz8+aOsJ8Zx0N5i2MWWA/gHAQIBto0ANHLFpMznoFhlZbTM1IoCegu1IDN1ZFOIQWO7X
	d0gEv3sN0PYy40n5rlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRo1g-000000034Hq-36B7;
	Sun, 29 Dec 2024 07:47:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRo1c-000000034Gt-2lKN
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 07:47:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-219f8263ae0so66278705ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Dec 2024 23:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735458468; x=1736063268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=Ab6rFSApiFRfsO6ox4WwXlx37A19lhJonxNLKjVizKG1C56OTdt1w5YVFpZzwCzW99
         pf2pjs08Oh5uPvBCPWrJWWPR4MaqFalScMIaVC51IJj3RFRmc2mAc3cyC9IeL5IuKfR6
         /4mDLLRVEmv5MaqiOKq6Had9yrrYcv9vD0esc74RlrmSuhln9u+75bpjrqfwbIJVIisJ
         QnT0NhJXi9rkgONOYfR2Srktj7IMYn5t2XDslwuDNq84DfBsTfFr9IjuXqeJw5Ydh0JH
         o7Y6D3EjmRBz5CSqiHMCVSX08gX8Rm/QMKOtf9Hu4+QRJctoKS/hyZr3v2Lmr0l9ME61
         LD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735458468; x=1736063268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=AsdKqKYuju9M9LGwVVdaPuORZTC1e4Z/gXqNur+VbHAykpbqlO8/rZRTbZLOQ+i+XN
         KVp0j3+nN/I7miGtI8CUGgGZuzoYwy4T4X9KezWm3Uv4QWF1sASDQfUobsLnzeK6aeU6
         QXAhsbNRqdMmzflotyF5tjiusPsoNd0tvWSVvbclAX9haKFU52Xj6c/DlrYh60H3Lyl0
         gM1K9v+lGvIh8un1Sue3PrZbOBkKJQPXffpLhGZ9a6gmvi4nEFZu2U91ahPDUc1Hlnh8
         0jnuovfs7P4nEbeXgB2BTd0hyDelorGJlZ+kzKeJjY75lFIUO1Pxg3dEriuYLQEZPETI
         9lrg==
X-Gm-Message-State: AOJu0Ywpx+OFThMECor8yEodfxYTcHRsEx3LezZauD7PPiqzFtYfa2HH
	NGizKiY8IxpV5Mu3a280nuUNK2xgmuKOnVONE6V+BYbDYorrxVO7hzbTTmuUETg=
X-Gm-Gg: ASbGncugW9MzU0B+8qTCszEYN8kWs6hwsyrHYrdhKSth6+x2LL0twGvLbyvF1g7/VCo
	iOfyv8w/7DL3w9WnmRQ1gHlsf1pqTWQJJy1BnWvveA7qy2EPFwlDqXFeXXL5czAa5A+Gw0jESyl
	4WUr/AEDY+beHI09zh2Oa0V7E+7NmhgsEXols0PxmAa83pEFhth+w4uVHrr+wrTdT28iACk9ek7
	bLWUiYqrhpTES5BVNvizoHZ12d3rAyhWOlyJPRJBCAlM6mhYWYDZyk50gKkcC458OPfqdAyLFJ6
	XjuelH0CwBrJGF2q
X-Google-Smtp-Source: AGHT+IHqsni2m5eaDcRqtxzDWRYhuVp63TQTc5E6K1zeiuggIW4mudwRgzaxbglJMxuljed81fs76w==
X-Received: by 2002:a05:6a00:410d:b0:725:e5a7:fdac with SMTP id d2e1a72fcca58-72abe1ad517mr47137154b3a.26.1735458467863;
        Sat, 28 Dec 2024 23:47:47 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72afb196c04sm7907658b3a.150.2024.12.28.23.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 23:47:47 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 28 Dec 2024 23:47:43 -0800
Subject: [PATCH 2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
MIME-Version: 1.0
Message-Id: <20241228-th1520-clk_ignore_unused-v1-2-c8f6333d1784@tenstorrent.com>
References: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
In-Reply-To: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_234748_703864_D7B298D6 
X-CRM114-Status: UNSURE (   9.06  )
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

Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
perisys_apb2_hclk and perisys_apb3_hclk.

Without this flag, the boot hangs after "clk: Disabling unused clocks"
unless clk_ignore_unused is in the kernel cmdline.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index c95b6e26ca53..d02a18fed8a8 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -657,7 +657,7 @@ static struct ccu_div apb_pclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("apb-pclk",
 						      apb_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_IGNORE_UNUSED),
 	},
 };
 
@@ -794,13 +794,13 @@ static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_
 		0x134, BIT(7), 0);
 static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd, 0x138, BIT(8), 0);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
-		0x140, BIT(9), 0);
+		0x140, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(9), 0);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(10), 0);
+		0x150, BIT(10), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(11), 0);
+		0x150, BIT(11), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(12), 0);
 static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), 0);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
