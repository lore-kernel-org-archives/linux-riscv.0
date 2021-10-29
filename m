Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFBCC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A39360FC1
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A39360FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcYZZCA+eCm1Ado4UGIurO+sgCmosnZy0HlxFJ8SDN4=; b=keA6gouMGUoAVb
	UzCQg5UkSgK7zoNVy6vFQAf2hdKLnpKdHSQFLH6mPx6E+hxyBqTaXyVAqZeJVIrVB6eAzmiXD9Mp5
	X4H7MHU+4lz895aRdCrw2Pka2Z59mwh0Weq9UUnJgG6eR9DkO71khpB9tpoG0nmZ2cVb3zdOZdelO
	3tueoJB4axSFrxooGwQD6mJx1l1eiFZIRP4cTQLS+s1YuD+RNYYiQIPvKi/lUnYOEaFr8+nx/z7ty
	ZsWnyoclLRW3JGYvFUc4yOkvJDjESpfwkHXrf4FyoxBGV0UXnZtfKTw5Zx5kqjrZwMN3UfmtZ0VM4
	Pdbn5bV2l/Du6BiqseBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgGuz-009TgG-EI; Fri, 29 Oct 2021 01:42:53 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgGuw-009Tff-Qf
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 01:42:52 +0000
Received: by mail-oi1-f181.google.com with SMTP id o4so11078692oia.10
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 18:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4sHQdDY4P05JEnKl7awu/hkkNPAWR0ffqMWRMPagXzw=;
 b=lYw92bhw9+WYAMQ/fc0tXkPNHx86CcQt7Hyhr0OtozZ4t8dBL0Y2gH5KUeaS7vq2RZ
 6zYg1WB7GvkIamUGVX+tz8RzCOSJ9toClEE6Tl81rmFY3VReFfXcp1hmhPTFBhQOpNAu
 jUaFbdz/ysOvdfL5TrDps9DkWLi3lIbkgQ+TzFnW80CDg+P8HLycMyz86jazpo1CyIln
 t6d4gAdW8R0+X4WDWJhWFTn5U0Rq1TW2bT2Lq7LyBK4I1xNE4WYiP2WRJEPieA540nOp
 IBUcxAiRnLRsuxvHSzj6V4LTXQTzdA5eCqBVrz0Yds88MkG6sJno8I181KNMxNbvvx24
 tKRw==
X-Gm-Message-State: AOAM533AiKT1eQgKu4gvd8gfzUXCfho5hS9zNkr0AVWEWQMElhaLzSeS
 rub92jkpprmDFkoUV5aJ0Q==
X-Google-Smtp-Source: ABdhPJw83q7+d1mdvH3PCYo96B+Ez+4pDfPWmS+v8FCelRGjG4ytJdSiuw3+WU1CVADuFH5DMEd43A==
X-Received: by 2002:a05:6808:f86:: with SMTP id
 o6mr5539674oiw.68.1635471769478; 
 Thu, 28 Oct 2021 18:42:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d25sm341396oti.9.2021.10.28.18.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:42:48 -0700 (PDT)
Received: (nullmailer pid 976189 invoked by uid 1000);
 Fri, 29 Oct 2021 01:42:47 -0000
Date: Thu, 28 Oct 2021 20:42:47 -0500
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Matteo Croce <mcroce@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Atish Patra <atish.patra@wdc.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Anup Patel <anup.patel@wdc.com>, 
 Maximilian Luz <luzmaximilian@gmail.com>, linux-serial@vger.kernel.org, 
 Fu Wei <tekkamanninja@gmail.com>, linux-riscv@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>,
 Drew Fustini <drew@beagleboard.org>, 
 linux-clk@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 07/16] dt-bindings: reset: Add StarFive JH7100 reset
 definitions
Message-ID: <YXtRl3RfbV3HL25z@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-8-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-8-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_184250_885752_10F65B05 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, 21 Oct 2021 19:42:14 +0200, Emil Renner Berthing wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add all resets for the StarFive JH7100 reset controller.
> 
> Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
> to all definitions.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  include/dt-bindings/reset/starfive-jh7100.h | 126 ++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 include/dt-bindings/reset/starfive-jh7100.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
