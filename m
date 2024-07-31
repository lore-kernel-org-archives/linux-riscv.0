Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AC5C52D1D
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 06:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XBN7Al4i1JElRlILcgaH0PoFZOxWwIdk9G58uhyMBIU=; b=a9zcn9gzk9KLyp
	43B7nEal979N+FH2/T8PNBPZ5EFMkF2tugmGBTAJVZyFwScRwuWtReIqIKRldPYZ6w8nojYuwqTZA
	T29sPHnChQQhnXNaGXGUzZUsVTyvZ87MMJLLfbPr3WazI/3FEqiqaRS3rYgMj7oBHXZE6l/FN8YPm
	FPpFRQ1x6olGEJIsvW4B48E4XwUQ+vEbcLCQCgb46jqlNvI7uVpdRODvZSVwcdLgUgbYy3pRfGqiR
	vr0C3FmBFWoGVxs9YcWWTChajFrehjdxZqZc33VTuP/EyGhc72wvmSdUVIt+a6OJP4hJy2XY5nv2D
	eKaKUJ8gNY6o5uzN2b8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2cX-0000000HUSx-2V4V;
	Wed, 31 Jul 2024 06:15:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2c2-0000000HUH7-0m0s
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 06:15:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fd9e70b592so35933865ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 23:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722406501; x=1723011301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mC3tXuwifMCr47H/ReF2rBsHBnKM2KWjJi3hvYggrH8=;
        b=fTvsrTzNwIaRV2lN39Ek+YRuRM3fV9bkGgzsSOGTI+DAJCI3ZsmQDKRo7jdOV7RhxH
         SgURKdwrdGu2Op/xwFs6TCoR5bBEjah1sx3yhtIgXX4eyKun6smyIqSm2YPcvbkDzFHy
         8dMb3eUVYxvUr4uCpkGmgYc2kbTjmOe5KwPZKYgjHhPw5Pyasn8VoeF4dFK36Ya5WPPc
         YD2P/5rxB4OlHzSNDcsz4IgZhrn3IivFsi3LVS2eY5viLeQIKa0v4H7UvlRL2dojd2H1
         AzBAvR5Ft2rbwrsIqVqpy37lcjE4RqETtjDUfDQbQZSlZZ1LPlffuziu/yek3TfqkYLj
         RAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722406501; x=1723011301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mC3tXuwifMCr47H/ReF2rBsHBnKM2KWjJi3hvYggrH8=;
        b=gzNRowr7mS0socFvkAY3Z3qqJ63aekbj3LMVOBdzY/if/T13rakyPx7v+vCzBQAL/V
         AheHdXes/pnabydiMnU2ZX+dXPyu89hzwggKb+0mPhEXKDyfqriE95yMVrtpROjXneDL
         46G3sIyeC3j+bz8eYMKHyK2Xzstn7ctJ6YWD5MdHtJhw7ZnctgJonIscYM+BrWPZsJX6
         athuk8zdlyuBuFzfxaT7WdYVA5+SPQU6Y8FozGovFrxQy3yi7a2VWEB0nHijdrSUqoES
         Na9qjA9QgQKe4b8pLx25Wr3s6p3l3cdS3+4Os20xQownKSOk0RINrzIEpQY1WZ6RetY6
         UA+g==
X-Forwarded-Encrypted: i=1; AJvYcCWbGF+odZxtRqIYnaQ6uC6U5+lMp2NH2lxpOsg9NkqBdwW9hlFvoC5WdqVksQBdZ3ISj+gaewrv4OyqDCqcw8XL1ZnAU5BuWKTI0Ww6u3oa
X-Gm-Message-State: AOJu0Yy2h5P3tx2KJaXE70zCMtbe5rLNiY/v2gy+qMxcApRqvy9mzMiO
	T8IOtziSjRKVP5ykO4HBXQLkORqwdSoyWAo7wEiUF7RP+hbhQVJVGnGGWlZw1SXyE5lbTIJSOxY
	h
X-Google-Smtp-Source: AGHT+IHAm8yRTbqgNkd3W/umYT9moh5/2wBAdYnIzsqz4npYm9ETZcWZ1wL+JK+URtWlkoJNxI+00w==
X-Received: by 2002:a17:902:ce0d:b0:1fd:a360:446f with SMTP id d9443c01a7336-1ff048afb6dmr108366915ad.65.1722406501309;
        Tue, 30 Jul 2024 23:15:01 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1802:170:4520:8165:b9e7:a203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c7fff8sm112384435ad.53.2024.07.30.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 23:15:00 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <drew@pdp7.com>
Subject: [PATCH] clk: thead: fix dependency on clk_ignore_unused
Date: Tue, 30 Jul 2024 23:14:40 -0700
Message-Id: <20240731061439.3807172-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597; i=drew@pdp7.com; h=from:subject; bh=3qhd4SE6YoyKmVa0gQyG4Is1h6oEVGw8BykU91343Uw=; b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStvOZ/XWZz2cX5vivMZj5qWLAguf/bGbbNAdUbj0otr lFsVJN/31HKwiDGwSArpsiy6UPehSVeoV8XzH+xDWYOKxPIEAYuTgGYiNprhn/K3J2smRu/PufJ OrJz25NFps82VTE6uLhX/Evbd53357dKRoaLzjcCUovLf6TmbpuoMcP+pAvTlonTri6+GDuZL7R e7DIPAA==
X-Developer-Key: i=drew@pdp7.com; a=openpgp; fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_231502_480895_6A541FD3 
X-CRM114-Status: GOOD (  13.42  )
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

Add the CLK_IGNORE_UNUSED flag to the vp-axi clock (CLK_VP_AXI) to avoid
depending on clk_ignore_unused in the cmdline. Without this fix, the
emmc-sdio clock (CLK_EMMC_SDIO) fails to work after vp-axi is disabled.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b 

This is based on v6.11-rc1. I've been reviewing the TH1520 System User
Manual [1] and I am uncertain why "vp-axi" affects "emmc-sdio":

 - EMMC_SDIO_REF_CLK_EN is bit 30 in PERI_CLK_CFG (offset 0x204)
 - VPSYS_AXI_ACLK_EN is bit 15 in VPSYS_CLK_CFG (offsset 0x1e0)

I don't see any linkage between them in the public documentation.
However, the addition of the CLK_IGNORE_UNUSED flag to "vp-axi" does fix
the boot failure when clk_ignore_unused is not used.

I've pushed a branch that has the dts branches on top of this patch [2].

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://github.com/pdp7/linux/tree/th1520-fix-clk_ignore_unused

 drivers/clk/thead/clk-th1520-ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index cbc176b27c09..17e32ae08720 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -738,7 +738,7 @@ static struct ccu_div vp_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vp-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IGNORE_UNUSED),
 	},
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
