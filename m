Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D98AC18E5B
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C58608FB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33C58608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYnllecrJEWevcRaumlM1y6qqF8dKcJ2ydr9mYSmgUg=; b=tZB/RrJe8OD2+4
	8p+bRU/i/j73cgNGo3cMuXr67Zizx7F3jwKLwjvr7lxioaQPA4869JY8hfJyWNWF/StQDdOBfO8wS
	H5SUmRJAfj76OeQkmGU7Z08LSkriqFXfuKslIfUNQOOAGtJceFQmCGJhuti8YKTzSzVebC+WOro2F
	MM0csvkPgqWkb26vSSz60b8T8P3JfgKyWCLHBVKSidTbuvcD180h3DAgqBhB4H+i5YEbJt5Gkg4XW
	NjA/mQahcqJaNuph1orLHHVdkwtZYyayNetEUcRH0gxwoSrfcOtqP0fEvY32qt15hVRpg4+dLXUcS
	+HSTbBD/LxgS5zlolrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc5P-008WBl-Gk; Thu, 21 Oct 2021 17:42:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5L-008W8a-6E
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id t16so4072157eds.9
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Nc7eYDAVKl1lXgjP3Tic4vXvSlms1XomYDkZojHGsM=;
 b=L76PHccrIcJICu9Yfl04l7xaf6PbHFbYP8OArMjdks2a43UQb9ILNGpqF5t//xn4ty
 wjydOwd41fnx+GDJEHLsoOLsc9sp3VBoUMs8AZFNHSX2U+8v8MiZYWOcnRZG537icPQC
 rcvbxhnNMye/6+BuLdaebOuUU17DLrLN5pa1sdCgsq3G4hmU6p5uSUzMWxFgBcwvAAhl
 xZSaec2bCFxx0mdKR7aaQTPU4NFXEhKrYvqAxUQSJThPSGrhLqtXSqMRfuuXdDKjJdJz
 Z6fV5zwP9UaWg0GObE46Sn31JtyXfggupOzz/Xsz1JExTlvHBXJkFFLELxGbzzHqfn7y
 BWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3Nc7eYDAVKl1lXgjP3Tic4vXvSlms1XomYDkZojHGsM=;
 b=4F/VlY2DAASW6l8cfm0Y7ZTnXjAVCachFgN605C0a91ekVpwXL8Q1OhinmilCKCkG0
 mQnW04RUKw7CYFsc3SWYM4VxLdMxs6qybEstkhOK2hZIkHz0HnJMQ6D84XQyYhKSbMxb
 NKMtYot2fHV+dwdtFM7wU/WbnRtyHc7Vq1J7p74hz3GvKIRkZcrVhpeSyz4o3MpnJRMu
 Eh1iaD00DTQzH4CS1ViACgvi6xGPeOQEvRGsrWNdFeMN3bo6Tf7LmKnnt2dgZolv0eph
 wy+bj9+3EWYveQWdR15Lo9wYmBBTPbcTiSuz/3lXLbSqH6E4OD4tSJ2ViTp3bx5vHW6K
 4Wnw==
X-Gm-Message-State: AOAM530Xp97YqyRZQPxFv/yPXp8GDz63VwwbGCputuKtCmNMWAO4dbxo
 zWWTCHver+idBsaaXAf/eMgE04fKzuY7Tw==
X-Google-Smtp-Source: ABdhPJxqA8SrFtSmHrnxkw4ADGVYl+b4TZbNr2qYu32HpC7pqRnMZoxJSJkvN3OXYOa34KR7brCp9Q==
X-Received: by 2002:a17:907:e9f:: with SMTP id
 ho31mr9171273ejc.156.1634838153407; 
 Thu, 21 Oct 2021 10:42:33 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:33 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
Date: Thu, 21 Oct 2021 19:42:08 +0200
Message-Id: <20211021174223.43310-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104235_267001_B3A499F9 
X-CRM114-Status: UNSURE (   9.65  )
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

Add StarFive Kconfig option to select SoC specific and common drivers
required for these SoCs.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..6ec44a22278a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,14 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config SOC_STARFIVE
+	bool "StarFive SoCs"
+	select PINCTRL
+	select RESET_CONTROLLER
+	select SIFIVE_PLIC
+	help
+	  This enables support for StarFive SoC platform hardware.
+
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
