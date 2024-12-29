Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF038E7718F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBTZJuUIIjngH+ae/XoVB18etLlog5e1dYRVy0FYDAs=; b=zPtKbnbqQlcWRF
	wM/UckmKxs5ExG9ERV2XQcm8I1kVyb/jyo3pmgC1yTu+f+n1UyV6PO3Gh65ddoHfVfBl7pUJ5jSYE
	7r/0HWQnF4GXNzTH6BmjjnOX16YGxpQBUnMkE3ZyEKfiafLt/+D/mKrTklh3gPtIzVO4NahJx2B4C
	gk+yrwA15wexRvO7t13YZ+YipXRCAG2U7vNDoWhUrQwGBuRyeNjOrbUJMzwFV1u48vFi9gMNOffNM
	sEH1wH6VRL6RLxQgVkWGxScoa5H/yrJiGOBJv7tltnFgKaYluj9ZQ9LWeIPhdN2i0FxrKReT7btuQ
	+pfWRoVwE1+L/NBjLjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRo1f-000000034HY-0ZJF;
	Sun, 29 Dec 2024 07:47:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRo1b-000000034GN-3OFE
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 07:47:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21634338cfdso152075355ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Dec 2024 23:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735458467; x=1736063267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=BGkE41NL6wCGKWcFtOgA6woCd+e984I/24MOJmRoXJQMNfkeeWG5LdmL0ubVxarTwe
         y/BX3mkvDVYo51AlsXt+3e54sGzX79LuVNaK65OE+DmkUhAyVA40kEI/qrXQghcES2zO
         YKogyUUPJs3bCgOT4D4FTP9JCvrIeDvsNcZQNpuZ2ExjXyhGgJ/6MYMbqZdFRvhe/wcU
         J8u/AgcGQNN5BsBveWr9gU+aqEE2cewwsPuwLEBibKnH9zxStnBdZARkiN00TAV+dMVd
         ptxgjjuB8q8W36njfzEtkreTlKpTgio4EB1J4zr2dWwbzrel0hqovEYcvlpZxRW2OLrC
         Pz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735458467; x=1736063267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=cDnea7TG+WeOwQZ46OxUK4GAipLEo22BGhDlTf/DSuUjBu/Y9/fjO1GGmm2vxxNg7l
         IA1pC2sIOWzqzYa9Y/3l3flYhEkCCAwFV65e/C8fYAFTgMh+0zMcrwBROL4DIIV25+E8
         /q9aYU5djVxWr1J10gtJDNnJGKcvBmQUPCBl4j+l9mGIgFnPnYnCOI1ZK6vDF6FJTl4D
         IsjOYH+SZKvzipjxJ4vuhUvsi0CiuPIxapEurePX4Uj/rNbp286A3lM+oV8x3T81dX21
         lG4lPjxnt/Y6HGE0tJ7NBorEuOFFBucJP/Pd6EJ7XEjql2WKS6hNWtsoe1x508t1BVcA
         +KQA==
X-Gm-Message-State: AOJu0YyVOVL6E0/DDPxEUxE6MYoiCE9yx4WWzY+wb/y+QpGnPR3Lq6nQ
	cWpe/almZGltbJgvMX9CA1G+QIXvhZmtMpvdyIFEQ4jjJ2/IdBXT6SXvfNF8D2KiJjhL/YDF72T
	g
X-Gm-Gg: ASbGnctaSAeYVMgIchl5W8MibG1dtW+Wqq+tQH9W2+HRsiur0POOfYAzx+qgqFZYqM3
	2FXuMfUJzFFkFk/gPJbyHsDgY3XUCbdev511t5tPEp8bNloTIbhHruZc/c9CUyyZvyTajcKxaD8
	upb7MiNW0Y0AztPKIhc/YiRUr/rPtkDIotU34LoW19K9qmimuLUd3Eij4kX8meh8hQJyew4mQA/
	aXI76BsnMBlhvhgqUu7/Ef9FXsIL0Ps26r8zPU8uqVvEteiHOomVI2YHpUd6s+fmIiCW9V1g/tp
	LfJMMLqMFN6v4xtY
X-Google-Smtp-Source: AGHT+IEjtnq5bXcHCrVotkW4MshmrYYKyL0Pyq/ZCNXYcjJHuEB1Y7i8WdyieJmaU8IJndr258gDnw==
X-Received: by 2002:a05:6a20:e68b:b0:1e1:d26:6657 with SMTP id adf61e73a8af0-1e5e080cb8emr49478295637.42.1735458467002;
        Sat, 28 Dec 2024 23:47:47 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72afb196c04sm7907658b3a.150.2024.12.28.23.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 23:47:46 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 28 Dec 2024 23:47:42 -0800
Subject: [PATCH 1/2] clk: thead: Fix clk gate registration to pass flags
MIME-Version: 1.0
Message-Id: <20241228-th1520-clk_ignore_unused-v1-1-c8f6333d1784@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20241228_234747_854337_28D749B4 
X-CRM114-Status: GOOD (  10.27  )
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

Modify the call to devm_clk_hw_register_gate_parent_data() to actually
pass the clk flags from hw.init instead of just 0. This is necessary to
allow individual clk gates to specify their own clk flags.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 1015fab95251..c95b6e26ca53 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -1048,7 +1048,8 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		hw = devm_clk_hw_register_gate_parent_data(dev,
 							   cg->common.hw.init->name,
 							   cg->common.hw.init->parent_data,
-							   0, base + cg->common.cfg0,
+							   cg->common.hw.init->flags,
+							   base + cg->common.cfg0,
 							   ffs(cg->enable) - 1, 0, NULL);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
