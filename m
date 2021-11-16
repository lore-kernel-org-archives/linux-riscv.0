Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E3EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C38263214
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C38263214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEe1opLAZk6ZirB344pk4FNXrrPCN+ARnKWHqpfmNN8=; b=ONFO+MXEhv4XVR
	q5HV70UTdSyMXjNBxoH6vC/5JCOfMNO99EaTuHgdDU6DhPXWiItAUU6CRHfHpCdb6eiY0NlSU3W69
	6UieSMiGQubyaeqlWiMAHv0ipDLRm6CY+vAbba1tPeewr4956WyXHUllz9XktNaGisRZa1fAqxSjJ
	R++fMW4SUdudGSq1+3YGL2O0emsbRPNCJM+5rcRQal7VkawGm/uPqQGXxGM+GWRtv1yU+B+nhVC9R
	MTRLgN8i0yqJE/vvTeJz4ib0eBg6y+5RALY0NlBEVegTgJjXjeOylnheheR5aYC3rbOoSXgw1lfRg
	jDkcyPhefaVRpk+K6/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzxx-0023Y5-5s; Tue, 16 Nov 2021 15:01:45 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzxu-0023Ww-OD
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:01:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id r11so25340092edd.9
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPNzD5bnl2PSjk+0YD7yG3K2QwDiM6PZuu4dMQq39/o=;
 b=cnr4Q5xPkbuPm3TLXjaJ2pjkvnzKkt4NU88x+/c491rS++FKb3RZqLNVQvu9n/yjV3
 VK7ZtdcidYz39YXHe0ocRxUBjD0lICRI7sxrE812hF0ClH70z0z8ykOKGYwIXab4aze5
 o1pMSu2zgPs49PISgb1lSONbbu1Xdpyc9GRhpt1VYBWmNIpHXwIBdSjWuulEIxIdAvnl
 nC3mmLl8+1ShbIvWw72ZcCsnqEq5WEqK/+wr4sTsw895EkLFqdTZGG2ygm0D94ofWEmj
 XVfERyEpa2EyfXw8bCxEm+hEYdusum2J8aqoba234GJkRn+U7N7BRX9II7ny0zk75MHW
 uNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oPNzD5bnl2PSjk+0YD7yG3K2QwDiM6PZuu4dMQq39/o=;
 b=ZgysCY3BKGa9R5PIJnmTSMn8v3KkZaDKBet10E9JzavDHH/A2eKQ7upJE3nwmRV0qn
 jEYsUAVCfn/M9xqrrkVnjN4f4Hd4wBSSzRrvOK+5cPgpL5seWFB/cMttskEqJRx/WQ/h
 7Vjv9rsjpr6EVYkA4oBHABlB1yWnQTjXmbcTZIEpFe3jhh7MwStuNLAqMzG4mPoJCUou
 f6wOuOb+y99WcSvjlBo820kSKPB2AugoGWrKMvJulTzM6Vsh6yn+iQ2ybabws9+Uv1uV
 bsPW3m1BImCp1j5n/Wyi1jjWQK1L0Tj3F7HGw1z8C9AAqZ0qg89ZrdO8Wf3OaZwIC9/M
 TzuQ==
X-Gm-Message-State: AOAM533NHi2tP4yz7XHKeAG+inXSHa5TJ7yqs5oliFAnTU1xb+T9BLB/
 B3hMIFPiSA11NqM1iBudjuIF6QByu/KM0Q==
X-Google-Smtp-Source: ABdhPJx8vnoNqgZ/tAcT6WqmQrmmONNtGYsmXPHCLuY8u/9mSGV/N1UqNxsymAeGHieq0Ft7UMkVDQ==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr4587398ede.390.1637074899238; 
 Tue, 16 Nov 2021 07:01:39 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:01:38 -0800 (PST)
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/16] RISC-V: Add StarFive SoC Kconfig option
Date: Tue, 16 Nov 2021 16:01:04 +0100
Message-Id: <20211116150119.2171-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070142_811297_C6EBC5B9 
X-CRM114-Status: GOOD (  10.30  )
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
required for these SoCs. Select subsystems required to boot so the
required drivers gets enabled by default.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
