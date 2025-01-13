Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85183C02183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oU6rFay5sRNxnepcWrZccoSTGSKKZxohbV/3EZ6p6g=; b=mseCuREk0ldUq2
	lRN4ze1TV00GNQot5w95gl88ZJrCT+sPrlHlrdj5oPkb70XSf5s3L5PbI/oTcE41b3BsdeuYral37
	HyDzeHGGTbFbgq5t6L5uItQ5ldEzkzsJLShz8Eu3l2ZbHnN1DAACu99ybsEzlUaT3z/JND3TjsL2f
	K8AjEMLWT/wtmTmwy1PhFpX7JzN0BvGbNK9IxNkRq3hBOkGp9n8rP5Tqz+/gW0MyMjY9Lni2c+YzG
	FeS3gqwUM4c6H1jdSJaHFcZ0iuE6gmv6Dqm+5H7QEqN2DRyyR1oNHBoq/qrmfl3YDxb5jONwoi+0e
	/CPMqBo1R68dJ9vArTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR61-00000006Yqi-3Rmi;
	Mon, 13 Jan 2025 20:31:37 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR5x-00000006YpN-3mnX
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 20:31:35 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so8284872a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 12:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1736800293; x=1737405093; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=Ay5eG6XOrnZeaUccrNUp1kwfuhkO/OEoDisjT5eJioyiCQc2YiJkHcjMjFoT+0AjYz
         sAiBCZbaHLTw6FGUuGJ2zZzMj8csQAKIx/ihHCTPti4pumzN8jadCBuyoKRoCJzxiYMM
         va3ApY6XW5HltEMsMETBLNI4jamtxf7+x42PlXRgN5PyMjl3v/wyyzJ8RFrf31oTkS8Y
         TDkqxjfB6oMULFpDr0xqpu2pKE4x4G8KhnMjy3vRnzusQ/Vlw5UkyFoggFTOUxvfWXEI
         nGdDf5vFAKb/47a4bQyVgCW4WXqSuDMURdHicH95VMWgtoEmEe6yZQ4tMxJ0uqMU+wRi
         yUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800293; x=1737405093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=J+JE5rn9XNEm1j6HgfLAQukIsYPQqkDH4yznvXyIo2jbKdGyf3sM08GBtk440jqzCQ
         JWasTVn2+dRUGRn4JmyDEDnqCT/Gia+8D5229KGhYN4tYamO3Cuj5F7guDxFoiVEA2KQ
         fDMjccTv7SReNwA72u086NEVUjaQL6UwwNaiybiY5Fe3oD2DOYX6WZak/Mg2Vmp+ZCQ2
         /3L/ZIAT+yFvnOPN3U2LbszWvozvHgJXl3n/+gqW5yOtbctW99COeHkHjL9Pm64ZRu+U
         tLnJnzzhmrIJOI4AeedVNsYetvyluQriEn3np7tPEQS63A+neYRxPP8vSjb+oMGSxFuE
         IvAQ==
X-Gm-Message-State: AOJu0YxQgeCY5XU/3VaPbJlvI1lMd0KEACC6IWCfrdtZCLnplalNaXmR
	K8ty3om+bIxOv099DP6DQSvotDDINNuFkrZ46wxPdpSk3NGmYsrObd/6YHzi0hs=
X-Gm-Gg: ASbGncu7jOdgDlQnddSVW9KxUxznaE2sWjCc/vOy7K1CUsg1sCTAv15FcYn4ViaaWtj
	VslyY9SjlX+wQKCAz0gA5cgULnYa4JfsHsymFVaxWfQ3TZjM5BEp9PY41fGvo++rsxHs0Jz5B3d
	i2wQqlfsaAm1mftJHJCcJ9LNwLBJdJPhL5bAOo0Fo5CfUvZ193HWVRmseUxnIFUPmwNb/CIe9Q1
	yTmE94325DjKjslg1XAt8S8I+OSqdhUL9/dKldlzmwRtExiSBDUDhT+pByfCL3OyhdslkuMK1WB
	52w5pisYnsOEBQKy
X-Google-Smtp-Source: AGHT+IETyPk+dkPDvT+m7Nlwd8jsvTLbyizrVTdVzrO+oEChgBr7zxyycDxXOJNikGNq0OksD5a6ww==
X-Received: by 2002:a17:90b:2f0b:b0:2ee:db1a:2e3c with SMTP id 98e67ed59e1d1-2f548f1738cmr29086701a91.1.1736800293053;
        Mon, 13 Jan 2025 12:31:33 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm10514811a91.31.2025.01.13.12.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:31:32 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 13 Jan 2025 12:31:25 -0800
Subject: [PATCH RESEND 2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520
 boot
MIME-Version: 1.0
Message-Id: <20250113-th1520-clk_ignore_unused-v1-2-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_123133_944491_17C29378 
X-CRM114-Status: UNSURE (   9.49  )
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
