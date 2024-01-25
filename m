Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E538C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D1amFpSth3NpsM8m3+cZwvk0sfyTGS5tlDuit/2sppU=; b=rpzws4O08BDF61
	LgQ0Kk4+FsbUtPzl5izyCy8LSNUHwqErM0CmUN09JdnSQ7C/Zw38I2R8gCt72ioZQUkXZnFfRZ++h
	1gkiPXTjsyrIYg1S6KTn7ik9nmTVJZ9libKTq/rFZaz89o/Dl953bYVWCzzTWYOQ6YHWyPXkAprJ/
	tqCNBlP5fdNkWxNG1n1tgmNJNi+YM2QVAxDH5KZGo4H2oQIXRYdlfzUCJ0g9U0CUkPsTO0XggFsjb
	OpwASfiKrNyJyP2q+a+GxYJmCSc60VYvQl3pYWaMaOivBrWUO54or7nAn7Xz+GvQZAg2HsRwEyUQJ
	insSsnyN2HwaNxxv9r+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSswb-006fTF-12;
	Thu, 25 Jan 2024 06:10:33 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSswY-006fSV-0v
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:10:31 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6ddf26eba3cso4158618a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706163028; x=1706767828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5UOEcCOGayf5fE0hmDRoB6IFfHak7GXt74RM7JU47Y=;
        b=aNRWTYFRsTsjtsmVguPaTUoDaR3mQ2YbAdiVVyvKmGkI52JjB3TQCeTDM0xAGhqLSN
         Pgh93wA1JViYQ46bPqI4eu11SvXPxmGoxBlAiSENbR+Cpl4GpJe4HXpQt1T7RrNoSrmV
         zFhe9kdjkZPdkOJCoR/5Zpov6WkPbLSaCbaoOZvVbe9Y+CZkcQpcCjM3g9bFVYuGnAFz
         M7q7tcZ6A1emgl8lyaieMuVtPgD8SkhnhPfFF5XQTJRRvunRTPuUnkEim3/KQGcRpBWN
         3teZXAXAoN4Akar91aSEbCDGQzpRujUvCgBSbLuHGEL7+fIe570zAY6DKDywV1sSMqEY
         yFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706163028; x=1706767828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5UOEcCOGayf5fE0hmDRoB6IFfHak7GXt74RM7JU47Y=;
        b=meqQzSyjD2MOYkqCD4CSFqiWiA9Ki2xAmUM61h4OTLFc6bKFd5IH4OTYBGuYC7EguY
         iIxY1F7jpGdT2bt2k81KwrZtYsULcyBLzYwhV90WPAvfY9a/UyUG8GJcMH0+/xhgoS4D
         jLd5XotDCZwmuvWnJiuU9LyyCpIhAo8bNJImFE0u5+r7wnAWwCkLfis3zjqtmB/n4SZx
         PRwVReapSYrffe5nAWxjbUm16N3BzXXGBhP6wfmS4ztnzQU1Kj0LgmfmvzYRNthGszxJ
         tnMoFLygRgnLP8FK19dOowO/FaS/ryg6uOCL5Cs28PKJ/AzDEngMqEmvRmywlSS4sSUk
         ZKyg==
X-Gm-Message-State: AOJu0YyXGUJbAKbcRtf4p5WxTZLN7uo8c3p9zpBTAaa0jHTzlw8Yt7nO
	J9zdzLNfcf5kLL++gyEirSLxQCoxjv6JsYnghJ4ufA9GggUHq283
X-Google-Smtp-Source: AGHT+IHxmTVll4Cf8JjrzxGvWNFM4f/G55JM2dOmVP6aW9splGnxNL/nv5pU/Vz/5Rg/XQeNyBlcuw==
X-Received: by 2002:a05:6870:6189:b0:214:d7de:dc92 with SMTP id a9-20020a056870618900b00214d7dedc92mr154668oah.47.1706163027698;
        Wed, 24 Jan 2024 22:10:27 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id z16-20020a544590000000b003bd9c53096csm2856540oib.31.2024.01.24.22.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:10:27 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 0/4] riscv: sophgo: add reset support for SG2042
Date: Thu, 25 Jan 2024 14:09:47 +0800
Message-Id: <cover.1706161530.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_221030_367605_EF71C35B 
X-CRM114-Status: GOOD (  10.82  )
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

From: Chen Wang <unicorn_wang@outlook.com>

From: Chen Wang <unicorn_wang@outlook.com>

This series adds reset controller support for Sophgo SG2042 using
reset-simple driver.

Thanks,
Chen

---

Changes in v2:
  This patch series is based on v6.8-rc1.
  - fixed some minor formatting issues.
  Note that if you need to pass dtb check, you need to apply a patch. This
  patch is missing in v6.8-rc1. For details, please see [2].

Changes in v1:
  The patch series is based on v6.7. You can simply review or test the
  patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1704790558.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM/T/#u [2]

---

Chen Wang (4):
  dt-bindings: reset: sophgo: support SG2042
  reset: sophgo: add SG2042 reset generator driver
  riscv: dts: add reset generator for Sophgo SG2042 SoC
  riscv: dts: add resets property for uart node

 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 ++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  9 ++
 drivers/reset/Kconfig                         |  1 +
 drivers/reset/reset-simple.c                  |  2 +
 drivers/reset/sophgo/Kconfig                  | 10 +++
 .../dt-bindings/reset/sophgo,sg2042-reset.h   | 87 +++++++++++++++++++
 6 files changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
 create mode 100644 drivers/reset/sophgo/Kconfig
 create mode 100644 include/dt-bindings/reset/sophgo,sg2042-reset.h


base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
