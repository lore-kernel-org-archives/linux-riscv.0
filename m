Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B15CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QQEflqf8twKXUtsd7Gn7N4nBrz8FznRgMySvDcFGOeU=; b=1bhVD0fhDJD6Fg
	AvTccxDOaTNZAV+TYyccZ7ATMQZ3XqZZybqV4egiLVrzdWXa53lIcj8tDSFH87KaYHqAQCHTb8zLz
	viHQABk76uduum+eAOsXh2P1j3aXyH40ShR938q3H3dT8LepUyx4vONbFYAOnPrIiCXkOrDMDzmBG
	qZIZ3RTOUosujsOLXTjbGSEchpWD4BnQ/Ex0/GEVgS6qioUonYBZDuSdDl98FPmfTk2EoYT7MCJYH
	tU+tdT+HxtOJ8YZo/l7OSBKz4fiM/+5EkjH2WbUMgYeurkYAHGv6dw+JDa65M5LTpFlLE11QkdpTG
	gMREqQd0Fly1/yRHZ1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc22a-00H7z5-33;
	Fri, 01 Sep 2023 11:10:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc22Y-00H7vI-0A
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 11:10:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1511808f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693566610; x=1694171410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eoe1/ChVUjSFSmLUE4WJGxelcTGXE6vWPUltvYJLI+4=;
        b=VZPNluzkoC0EKFP7vUM+LX1iKDFEGJXZg0v4hW0LF30xuIZBZWMHvTJf0djk8En8xx
         rVwkBnHFH9jNqfmzD0t1gq2Ic2KAd+CQmfbN5E7NrzX4L7gweqdEMNx6wovJHQe0lbcX
         5qfBLJNVtsSb6QuOYPEpoq7pB/cMg85wLpQ1g/5f6t75hN2BXzSOf2VO3BKdZLTwVj0K
         /WDwtchKVEIbBa8eXeiyUQqG0hBakir5A1LjfR9j98FvA3IPflATsoyo0gj3CLnTsI9a
         6uU290ZZB1604ArjUVbD16b4sSZ8TkA00hrjZAMI2zXdOFUAvjfNogkARTDExvyPsngg
         +ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693566610; x=1694171410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoe1/ChVUjSFSmLUE4WJGxelcTGXE6vWPUltvYJLI+4=;
        b=L1sgXTb5+cOtz3T9N6JkyRLfShiXTsVOGD5bpbf/+qlVExgNSaBucQbzsYJmfeamUg
         ZjIOjlbH10/3J7P8TllJKNdCZCtr7WpB09rGoWyPupl4C98aGM/IJ8VsvBF46OtLrYId
         WGLJOBe83wjHMZpwgedgUGfcHv12QyEUuB3bJPpQadbhKBTR+89+kHsni87iDivABaLt
         5BzGEs+WRaIJcYeklPm7wxXhlW2N+AL2FntVquTSS4/9R9+lj1mEWZ/JKMW0L/ZpFMsv
         a3OgYvGp8qiY9QmYtdTRMuwy0QQuK6ndsxga+CS4ThXlCZnHuuqckkGBtPX5ghGTDPDX
         7LRA==
X-Gm-Message-State: AOJu0YyydWp5h5wHhtacqUiIa8+ngf72vc0XYiuuiJe8W0qhoW5+3TaS
	ge/tjG8qnPOFzDYnjx04sFg=
X-Google-Smtp-Source: AGHT+IHWXkKNZTnWFwfPFYrEdVN56j+KTfn8NoHTCp1OoCCvz7p2z92KmuU46u1Sh7AgXE5ITnNM7Q==
X-Received: by 2002:a05:6000:4b:b0:314:34dd:aaec with SMTP id k11-20020a056000004b00b0031434ddaaecmr1689758wrx.8.1693566610033;
        Fri, 01 Sep 2023 04:10:10 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:64d6:8737:b80d:a298])
        by smtp.gmail.com with ESMTPSA id h8-20020adf9cc8000000b0031c612146f1sm866827wre.100.2023.09.01.04.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:10:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met
Date: Fri,  1 Sep 2023 12:09:36 +0100
Message-Id: <20230901110936.313171-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_041014_118458_263F1EAD 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

To prevent randconfig build issues when enabling the RZ/Five SoC, consider
selecting specific configurations only when their dependencies are
satisfied.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@intel.com/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 67604f24973e..5a75ab64d1ed 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,10 +334,11 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	select ARCH_RZG2L
-	select AX45MP_L2_CACHE
+	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
 	select DMA_GLOBAL_POOL
-	select ERRATA_ANDES
-	select ERRATA_ANDES_CMO
+	select ERRATA_ANDES if RISCV_SBI
+	select ERRATA_ANDES_CMO if ERRATA_ANDES
+
 	help
 	  This enables support for the Renesas RZ/Five SoC.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
