Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794FCC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5037660F3A
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5037660F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ub6MS3tOxWHiIjaH8hINi7/Meu3VIBlWb9MAJaxXpA8=; b=1NB/gGiH6KVRfq
	34dUSQ+yvf8QdMex5EVVYDbg+nOG4F7j8BeQ+SvxbLiNgTfKgKrPUS7CWLXWOPDMeP5o15wGVRMmp
	tqCOg1Q0PxFntkk0ce5Sfswcz9oXCYze9cx/a6p+oj/wAuIX5vYBpmXBi3ECRGvmdtGY1TTNfFXgA
	28l2V3k9ERVphPkTPakcji4yMj2zvWLdHjs74WdfSBm/L18NTMBvXT3d7BsdBcEBZFSc9UPQEBMdH
	ZrZFQuwlE8zD4ACIA6phm4IU5SEQF9csHsCdW1FCB/127LT2elXjizEjUX3FkgGmXMENhtxqeI2Zn
	5vcsdu28hjox89EsZceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI2M-00D2Ot-VF; Tue, 12 Oct 2021 13:41:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2H-00D2Lo-TI
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:41:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id y26so88693482lfa.11
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUqIN3jc1B7BdFYR/xAZI4s+PXfJnAOSswOrC3XOxaI=;
 b=JX957KK70swcK0wo0oRZPHmqn1EqjQPunB5Xi190+LnnPvBt5EXaW4WYvIVkRRFQMk
 6vfZmlkECojgEAsIk8I6eTHCHuUZtqNpkzkSbP8NwHyErFVJ0auHbi7s8UbLjNKNowUn
 JnuOAh4FhmZfOJZ7RvEu8DJ6Esxn6VsV9eD8Mpk3FNDhD3GkeGvnt5mfnxwiDHFp4t7i
 ewmICEjsgCu8gXGrABq8+mIFf788Iz6/WgYTtvV2wBgt0v+e+BEnqhZSNJGuTZMt7j19
 s6TlVuSVH8k4POreUux2vCkj+lOSgIWpnV+qYkBbLWcxHS8K9qUe5NnV+/9mdm1GnBkM
 LV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OUqIN3jc1B7BdFYR/xAZI4s+PXfJnAOSswOrC3XOxaI=;
 b=LZFOegh3NHZJJGCqNMPieJLHGeN0yDR/daF7NT2mw8XrB+GGkf6QOHtpJiDuVG1x7y
 MMNC12byGTo5IsSXqI5pEgBotyUDqvuHtNcsGjPsrDaRUpfRMGuW9x+Hza1G317Qf4UA
 //DVzJZ9oF6PGZWRvhGRCQ1A3j0pJkfWG7+BSruCClMAETBnJoqb8x26yqd57ffb+7/A
 q3xbrRX+vjYywHVzDlYKTNBUpwCMAvR4NTLT6OUUDaYBA/HhecTtmRBxoQmOmdvtpfRH
 CsNodBNfNqYS8YiP0uD0TiCAFb6j0q6a9dI+0mWmaL6b1tPl8kVfiwp6XW0NbR5zDT1d
 cn3Q==
X-Gm-Message-State: AOAM531r3yaqi2nSMBjdHOP/Dg5tnV8cJwFEiGUAc+RRt2NIu8otjmZX
 8R/99ubbAM9ROUZ4LVNdTN+DUIN4lVitjw==
X-Google-Smtp-Source: ABdhPJxl+/GExB5aaKfbaejroG2VgMWLxTTJdKqsHEHslti8Xgz78fqrcqYoelG3mgFGK0tT0M9eMQ==
X-Received: by 2002:a05:6512:32c5:: with SMTP id
 f5mr14915902lfg.340.1634046100219; 
 Tue, 12 Oct 2021 06:41:40 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:39 -0700 (PDT)
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/16] RISC-V: Add StarFive SoC Kconfig option
Date: Tue, 12 Oct 2021 15:40:12 +0200
Message-Id: <20211012134027.684712-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064141_977405_CD233C3D 
X-CRM114-Status: UNSURE (   9.80  )
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
index 30676ebb16eb..725e9a1b1ab6 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,14 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config SOC_STARFIVE
+	bool "StarFive SoCs"
+	select SERIAL_8250_DW
+	select SIFIVE_PLIC
+	select PINCTRL
+	help
+	  This enables support for StarFive SoC platform hardware.
+
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
