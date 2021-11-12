Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD30C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B48D60EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B48D60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSviVy851ehuW7cnHVBeifVcxcQYP0ToDZQGQYxb0Lk=; b=JXV5F5bgkZd/In
	MVgniV+VsPz3JlSh4Q8WMu9UHrMnZCvbHzRRvaoDOOlrx5H4u3OLdPFHZNkF2y6ex0TSvKjxmuIer
	5bUqvslfP0tMAcTD3p7PP7X5z4ArfFjcq8R33yZaD/tH8tIXTY2FT03eMPvV8N5DoVieePXOCyJ20
	8WP55gMnGQjty0/RenMP/llDVP3zK0Qw4VVojP1gC2ehrk5DpyD4yzlBPOi+Skv7TPLkx1LtCaSC6
	Tw8kswZKnVxHPJMGdhVGMwN9fW1Ofmf1tu3mIcpliuXNWuXpqIjjQgDDBlzKn2h7KBrj9YXRlVnz8
	AtV6Oku9tHLPfCUJ5z6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlcQy-00BUU7-UO; Fri, 12 Nov 2021 19:42:00 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlcQv-00BUTH-M0
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 19:41:58 +0000
Received: by mail-oi1-f170.google.com with SMTP id r26so19831478oiw.5
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 11:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=REnFA6XjBzbaJieuVI+3pKSNQf8y2uvx/eALnpSC2h8=;
 b=ByfldnhKa2qTgJA60tr35FcyveO1EXIGxnJzZvhYQsoxK4M+RoxSIqNGt8SnOm5BTx
 2eERo1Gqlhx8JWMFGmx6kX+XHNwcGJO8HvaVcZHFnJEUJkT4lOdUPIydtkWBIzCU/DHZ
 +0qmLQ+aEsLHI2mjbys5svnTYi5mwJ5cOezzq2uhIQL2kOu1IRK6AuJwiukAsGVA+sfA
 nbZhZMCgCxMaWTr+zBdPdMp39CsF7xLcxLYoWCX5Lp/u20oCw/Sb9K5dW+3/rMA7ZULL
 I5UTH+czybockQ8FRWq96fXdFHMHx2lIh6OrTfR1kRdhepCYV2toi6/8c2A0vW/IdJ5S
 aC1w==
X-Gm-Message-State: AOAM531j3786lYTeggn0ivHswfK/ukZYEiWGM0OBkr/7VuARVRkt9Fs2
 ZzdCsX2DvYk4dpfflamYuIEjx+n4aA==
X-Google-Smtp-Source: ABdhPJzcS2l/5MNH+2SzstpCYLnxRNd0oaOSeSF7EvZ53DH9N0wqYiTu9pw7lRw9oWf2KEUgJ3ArdQ==
X-Received: by 2002:a54:4d89:: with SMTP id y9mr14782184oix.127.1636746115578; 
 Fri, 12 Nov 2021 11:41:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a23sm1202937ool.3.2021.11.12.11.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:41:55 -0800 (PST)
Received: (nullmailer pid 3243939 invoked by uid 1000);
 Fri, 12 Nov 2021 19:41:53 -0000
Date: Fri, 12 Nov 2021 13:41:53 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Michael Zhu <michael.zhu@starfivetech.com>, linux-kernel@vger.kernel.org, 
 Jiri Slaby <jirislaby@kernel.org>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 linux-clk@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
 Fu Wei <tekkamanninja@gmail.com>, Atish Patra <atish.patra@wdc.com>, 
 Maximilian Luz <luzmaximilian@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Drew Fustini <drew@beagleboard.org>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-serial@vger.kernel.org, Anup Patel <anup.patel@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
Message-ID: <YY7DgSPChPpXzA9j@robh.at.kernel.org>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102161125.1144023-12-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_114157_744210_47B2BDE9 
X-CRM114-Status: GOOD (  13.35  )
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

On Tue, 02 Nov 2021 17:11:20 +0100, Emil Renner Berthing wrote:
> Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
> 
> @Linus: I'm really struggling to find a good way to describe how pin
> muxing works on the JH7100. As you can see I've now resorted to
> ascii-art to try to explain it, but please let me know if it's still
> unclear.
> 
>  .../pinctrl/starfive,jh7100-pinctrl.yaml      | 307 ++++++++++++++++++
>  1 file changed, 307 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
