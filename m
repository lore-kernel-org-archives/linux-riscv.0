Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD30C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95Yx1d9j6QMJLnHdzvN6EDQr4c5KHVUxtiBdRU+YSKA=; b=QOxl6X/Ku8MJh1
	Ux9qBe2pI+5L4gfDIw028x4A9pGvSN7lamJolQZxzylVIQlOajwl15ZMyQr/KOnbC3PNk7uNTB0Tb
	iNyoyt86ehW/80NbRnU6AGtDf5v3ad9w+TDbCaUOYARP707nSCAC1JM3tQHhS/uaW6LtpktJbDAZ3
	zkl/T/6jxrPVs1gPNMdA9H/I9g4wQmawk/YUvtKkeiBwmutlvCVCh21Lv0UJmSU2DuCzBXuYMltuJ
	ynuQ56y0qL3xcbJ4Jaz8KqcV/gjTlv9yEAw+qH5FJKOulr5ZCGn2qKy1AmPV4LxZs6NDN7Qqo3SO2
	7KCcATiajCi646+HnM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3g-00HURI-3B;
	Thu, 14 Dec 2023 10:35:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3e-00HUPS-0e;
	Thu, 14 Dec 2023 10:35:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so7205645f8f.0;
        Thu, 14 Dec 2023 02:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550107; x=1703154907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YMMP/qsVfdoJtEElBLyEEO9c305KOAYJqUkekDdPZs=;
        b=XmYwZJSbG8o2vul88RKbtZ+iD6o5J9C5XQiEO0JpRKIT1Rx6DlKni/NU8XFcbyHvbJ
         BWDXGOfcLE978pmeLnbOwRDEpbEKR2S/z21qRPigDCLrPH+0Ka/2lnX+Y79tOzfqyHMx
         181Jn9GsQjvCOQvyM5hRu/WigjcecPSulVW29a/M7diesY47e+0yzUJGkBLGu3tOWbne
         Cn6PoI8idxCCKPbiUqQEZ37ESr2AMDhlOjDYCKjQTLCOwGBU4yR5y31Zqc+VjS0PFtXv
         Yu6wkhCJqRyT+e+8BIDCuABxh2vuZKHxXENLXzOVSeU9BJTvXZaUb4l3012S4+M9D6MT
         m9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550107; x=1703154907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YMMP/qsVfdoJtEElBLyEEO9c305KOAYJqUkekDdPZs=;
        b=stAzJlOX/mbawlsFrbgG+QEunIqIPvWG63kZjrZTsZ585hL1hyL4e128sXIf7/dXvP
         Gt8a71z8+QmXcguvY2l3hDZEVIN1e+8hi8UA9j2YaKaT9N0JlPAebZDnFeKpK++YOMy9
         tZPomm8hgvZiaLgn+ftrUyFb/86mDMBiDsweWJdiCeaqv+gs13nJnmCzaQej2wbPvf6y
         RctIEzwTIVKb5Ff6WJ6Pc4aVaEHBqn0dm5dM4U7L6HOYLQ0Fug2F9AqHEOiqO6jGkzj3
         wgq89SLAAouTAmH3mFo3o71FX8p5N9smfCWThjmW+Ip3mV1v5ugoLsNxrLgp0fYkmSmO
         mm6Q==
X-Gm-Message-State: AOJu0Yww1Hj/S1ViBbyElLhsFDQrOCU0PAcqj7/zc2WgFU1+eTaZ9zwQ
	ysuFCC81rF/fmMTWWr86iGM=
X-Google-Smtp-Source: AGHT+IGB2gMg2Mze62sZsH15EW7tQ5RddMXqMonm4fA8WEreIbA3LcsoIasFJ6/XxlhankFX/CQcBw==
X-Received: by 2002:adf:9790:0:b0:333:2fd2:6f82 with SMTP id s16-20020adf9790000000b003332fd26f82mr4844499wrb.140.1702550107021;
        Thu, 14 Dec 2023 02:35:07 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:06 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 2/5] cpufreq: sun50i: Add D1 support
Date: Thu, 14 Dec 2023 11:33:39 +0100
Message-Id: <20231214103342.30775-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214103342.30775-1-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023510_238586_CC0A1E4C 
X-CRM114-Status: GOOD (  10.78  )
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

Add support for D1 based devices to the Allwinner H6 cpufreq
driver

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 32a9c88f8..ccf83780f 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
 
 static const struct of_device_id sun50i_cpufreq_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6" },
+	{ .compatible = "allwinner,sun20i-d1" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
