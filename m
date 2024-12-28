Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0BCE7718F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Dec 2024 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ifRAa2jwfTBqWG2p0S3iCPnXQz5FL+TlctyUbFJeLAs=; b=vwEsiU1hj2KShL
	QYFU94GTs2nqJcAbGSX9RBjaAVB9kewxlIhohJWSk53EJ4YQoqmgEfMljZjqqUiYgtMI6ctXShpiU
	BXTBFOmg88NkH5QfnecdvEoHqtuWF/GMu8GS0wtc9QcPoeTNgRuxui0Hs9uObsKsxFOazdXQ9esLj
	nnl/CBrvLnNe85j2AFEBC35GQBrDZIciGe8ItUCSopHwTgzTIadromLzZYK2uMPlkaQbjJMjq3KeX
	Tq1w2VripH+x9tWoCDyuxWZZk41AnyyTzFGkCO7FPanLcjBK3aTEYy266AySDjtCxB8zJplw+B3SA
	uqbdJfTg+rh39N2HuVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRNq4-00000001LFb-3rYl;
	Sat, 28 Dec 2024 03:50:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRNq1-00000001LF8-4ARc
	for linux-riscv@lists.infradead.org;
	Sat, 28 Dec 2024 03:50:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166360285dso96798355ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 19:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735357804; x=1735962604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuTTA8de23Bkf5QeLvOrkmGblt50MIGep0UadyVCjac=;
        b=Nmj1FHXS9RImS8Sz0OIWTz5GA5FhdR++Y/lvZirOJ7nUHBtBR2Tb2Wpel4bCRqFWLw
         BtNOVztCqBsQuqQ3Q8n6auT/GyASqXzquq2PH1R/6VHfL1VjaAIt1Xd3YAZcXlYzW4Q4
         rmd3ANjBg7IlBlRxFakNcfse/YBpmb2iiqEzd5HB8p4kL5cTpVrKqIyZFPJTiqhjkL/u
         QQC9h+bUwslPdi7cUSAO1fwOdU9CC3UF316qEJPIQVfbBSkJmzyYeFqxjJCVi4qOF9xq
         U/4PKa+Lu6sdv6l+sPnEBMmj0EpsN8pYd5PJkzumBxAgk7oQJdi0QIKEAZ/G0BaD2KZo
         6IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735357804; x=1735962604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuTTA8de23Bkf5QeLvOrkmGblt50MIGep0UadyVCjac=;
        b=dzvhsHWp8UM2GPZkkbngDrRy6wvFgLwvqKABR3AXefvvv5XjxYE1uz4CsvSzp/33ZJ
         8XMH68iFDi8UO5dOLKmmIksDjunvlt7J08JIJPp/hX/l9IaEIc1lWeeXv28IxSpK8MHr
         7adKdKFFF7Z+RXMHzLah9qGQUpKHb2vnBRWutsnyvDtjDC26dt3WKx72wM5Tfmq/xi0e
         91Rg8bOfRnz3DlBQb4qufbq9A9SR/StYEzM/VUxczixPtl3UVpobe9ezLjKyc3Kl4Sp9
         NWqCdnu/95R3Fw7JF3pdKu/5TiPPuxnMp/ZdsmlpnXHoc5QrmsrnO35yFg4eM8Giybkk
         WZJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdhPZpFRDZ0gmHgfiPSYDXVPOjBAUgGVOXFMieH0kOCVFjkHpkSbDjG0WlGI8oTd4MNY69SLt5fD5AqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJxAtZzGSIh9aFDwQw9isjWDmI7eJQUBk0dchYFXga4nveqUy4
	ipue7JVZaYvvLuYh25iYTkiy/ecxZ68Uqo9ZMrkuhDfHmYW7MEFKLM+sGFxETOA=
X-Gm-Gg: ASbGncuv8QVa0Vvk8I3ba2bvAxClvFOu9+Sv2NVpZYVJ0AansOeRNSBu/qoRYAzk778
	z5hUquKtQQ1mM/lj8q/sSYBEfInPyOMXQlYWnClVvEohWSNZ3W8oJXyb7hdAQ4zOCbyylLQ2SG/
	30nmkzZERoOcXxDv6Wn4v+XT38PLex/DzOyj/aeyppaGVGOlNpolNCVNhrYkQdrppBHz37RQnon
	3EggJBVfM4EKHBd5whEAzogyfEy+CCMJkRry2B1xXFZTjLNrbYIV9gaOPqorbikjozxhR7dhfgU
	bbCf2X0BP8EsEVi6REKP6uvsCYnKzRA=
X-Google-Smtp-Source: AGHT+IHkOItvBJKtEwDGdYhLxchWt5x3C0WxVmbqlvnj9hZEJ0dBynL/ueEHD33yi2OB1BIrLOO8GQ==
X-Received: by 2002:a17:902:ebc6:b0:216:501e:e321 with SMTP id d9443c01a7336-219e6f2700cmr441582665ad.56.1735357804579;
        Fri, 27 Dec 2024 19:50:04 -0800 (PST)
Received: from thelio.tailc1103.ts.net (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6922sm143403615ad.223.2024.12.27.19.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 19:50:04 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH] clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
Date: Fri, 27 Dec 2024 19:48:04 -0800
Message-Id: <20241228034802.1573554-1-dfustini@tenstorrent.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_195006_113877_0488DFC6 
X-CRM114-Status: UNSURE (   8.55  )
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

cpu2vp_clk is a gate but was mistakenly in th1520_div_clks[] instead
of th1520_gate_clks[].

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 1015fab95251..cc81ce6bef64 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -896,7 +896,6 @@ static struct ccu_common *th1520_div_clks[] = {
 	&vo_axi_clk.common,
 	&vp_apb_clk.common,
 	&vp_axi_clk.common,
-	&cpu2vp_clk.common,
 	&venc_clk.common,
 	&dpu0_clk.common,
 	&dpu1_clk.common,
@@ -916,6 +915,7 @@ static struct ccu_common *th1520_gate_clks[] = {
 	&bmu_clk.common,
 	&cpu2aon_x2h_clk.common,
 	&cpu2peri_x2h_clk.common,
+	&cpu2vp_clk.common,
 	&perisys_apb1_hclk.common,
 	&perisys_apb2_hclk.common,
 	&perisys_apb3_hclk.common,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
