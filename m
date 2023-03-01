Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858D5C7EE30
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 00:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Lbo3pjc0IKREQUhCu2kkzBjlYWAuJd1REg6mkPOdCY=; b=2aQ1TPbgDhpueQ
	e89mosHfMPKQp9IRdFgK9EgXdyQFy9vmgQxoNK7AT5d8Fj/Ib5gxQGfgzDCOMx0lJs9y6HttcXPHH
	DbS3y6gpPU7uIuc6Gxo4x4vlxLW+yNkMGezT/rr3TpdGl91PUgA7FmtPmxxPtaunoRCVNJRJn/XQZ
	C4T6F5grdlE9pOnrtZAzXFjst/hawyjWm7CaZIZbnflis6aupFBom/cs67D9Xt+BSfjoNlPx1ADUG
	F1xyOwAZ7ZXk3RM6wQ1hWRubjLXbQnWvN0amLHS4xRymjmA99f97lTktgZUgwYMD7kb9FX9A7XQmL
	46J2dMSxn/sNLPMFs7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJG-00EeCh-A1; Wed, 01 Mar 2023 00:27:06 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJC-00EeAT-Eh
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 00:27:03 +0000
Received: by mail-qt1-x82b.google.com with SMTP id r5so12629579qtp.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 16:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677630420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJeL8n1akQBNQY4mRwitUTFXHR0Ml81lQFAgFs/9ooY=;
        b=K7bv3zo7nkCzf6deBRp4Lg5YJiKpmZGrVVrcwX6fMe04PLGbmPyiZ1MfpMFJQ3gczk
         PTyFy7vyLgLlx4rQsvY5iWzcRX3PiEerotSwO1e2S/uUms8G6rSLjchIcjEksVUEjiAm
         lqxx6nLANTkqsDfT2GGi0AknUbNFldAXU+7lx+ghL7WHK+3w+CaZW0Jan14INQZhOML9
         ojesxHzEYYczhj2+mxUoQOQVI0RHUXdx3ff+mDU8+OOYUEjKABkvjPah1T9R0sgtLfL1
         JRbjxDw92oE/6vsQ929iWXZ7ucRImszCuaADlO3+M6lK9IL4xYmXkipZHIL1URAUffnO
         DiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677630420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJeL8n1akQBNQY4mRwitUTFXHR0Ml81lQFAgFs/9ooY=;
        b=VjoDxZaepYlnFttFwjjQZlWDU1q6ZwROIyucz1pU9khN7oFOuvVV36brfdht8WfvDk
         d9moCmMlGGXr6Rv8eMdp20pjixLNEB1Goey7+M7fSxTGngwV3E2OKyddrkJLK8SIqrNW
         d5oXGOVzyjsoF0kSe0yd20tv9Nqr6Vjoqn7z/UGTKsTxlB0hweDvkQrCTsOv149GVt9+
         RYLzspWRIhXC6NgyODDRUp4Oq84TnPcBx+N/ZRxn3hW3t9qMc2/0I7pmftz9TkGiUlxK
         2O4wDWCaHPzpR6x76NgF0lJmMo07eOow9a58d/LmHuo3l+xJmEbIEqCuD7ryVR1cXJUf
         BO1w==
X-Gm-Message-State: AO0yUKVAui7hW+IE9Mr4pQRqP/qb28Ya5ustAcTFAqe8U5s6JPHD8w3X
	fmB+gz/7L1ieuUcrIo7mvAurZr5cfOs=
X-Google-Smtp-Source: AK7set8zokOxucIULtSs5zhdVozPV61o7zflDRvd+aPvYt9Y7AQE+0kZsw5WSyFy3Fvn+3de2l1rkQ==
X-Received: by 2002:a05:622a:1746:b0:3bf:dbd3:a014 with SMTP id l6-20020a05622a174600b003bfdbd3a014mr8768717qtk.45.1677630420219;
        Tue, 28 Feb 2023 16:27:00 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id t8-20020ac85888000000b003bb8c60cdf1sm7576698qta.78.2023.02.28.16.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 16:26:59 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
Date: Tue, 28 Feb 2023 19:26:55 -0500
Message-Id: <20230301002657.352637-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_162702_513381_B00B21F0 
X-CRM114-Status: GOOD (  13.62  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The K210 clock driver depends on SOC_CANAAN, which is only selectable
when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
have been sent for its enabling. The kernel test robot reported this
implicit 64-bit division there.

Replace the implicit division with an explicit one.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
 - new commit
V2->V3:
 - No change
---
 drivers/clk/clk-k210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 67a7cb3503c3..4eed667eddaf 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_hw *hw,
 	f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
 	od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
 
-	return (u64)parent_rate * f / (r * od);
+	return div_u64((u64)parent_rate * f, r * od);
 }
 
 static const struct clk_ops k210_pll_ops = {
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
