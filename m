Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01637C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A1B61073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9A1B61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skvuVptncqu1zeER/i/qPA6BvcWbRZaQ4Zltj2dpAJM=; b=g4qj8OLIg+muxo
	NuVMuIEpm3sPlnrx7YzpXwpbg3Z0inQ0sXEc9cetTNKOTWTY0f0CFxJw9lJR7l1+hjrMH+5RC1vvj
	B+9TIom1AaxdGH5f3O5ghOd5pAi7al0MqwCmmrYxJ94VL6qybhRKGFsf8ffeUHvJWUGACbaPCvY9Y
	XtAQ2y9GydgFy2qSg0TzMZNWCATbUuS1243Li+H+F1+YZRaqGR+lt/zvS7fjojLar+yLfFvGK409c
	tJPzqBXvZv3avc5MFv90Y7kKgP7E8wyrkRB9PpluSCrNUpn8APcqfUYYnqJWQNxY/ykOjhqC4wH7T
	BAc/t3CT0HOx9+WxqcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4xX-003jUB-QS; Wed, 03 Nov 2021 01:20:59 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4xI-003jQH-Id
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 01:20:46 +0000
Received: by mail-oi1-f170.google.com with SMTP id bm39so1544927oib.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 18:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=7teodorTO0INls1DjJkT3je8WWhcqqBYQt3N+yxioBA=;
 b=6bxulCQeYBbs1bcFCdmYfpFSgvl+voT49eqLbxJz+zHk5+xGaQjj3E2mAY8NYMscmE
 c3Num8AgkoYaB7kzp4QF0Dx3MNlevqjJJQHNXAC2wedhFEIOgX0ML8JEJZijSEr9q/zk
 5QRa8/EWNucR8FbaxPhWwIC2+OnYWebT48ybr9ZHKnmDUZVELZgZ0CVOYYSU8jRQljsb
 VyxOcmOoJHwFT8xTDnrcXEsJX2PGZwuZx9EI9Bo3+eOMVzLcsRM85pexCFlaYpJTSPnb
 t8nuVurGec51yILHMzprUhjoM5a1wkyuQYKVsl9Sed6HYP4Ve+qtNyRrBzMCelJ3hPt2
 9CSQ==
X-Gm-Message-State: AOAM531q00fwxsaJMlLsb/vUsi8CfLKxbeXQsYy3gfR0C3Ecv5whhL4e
 GZtEXkBOxLCWYnwXYjaBDQ==
X-Google-Smtp-Source: ABdhPJz+XiqXqa13HySwUt3ExapyVdCd7ov56jToPTJLR5fauSFywxLvyUKmpF4WrlpT7UIBwfhNfA==
X-Received: by 2002:a05:6808:1408:: with SMTP id
 w8mr8047512oiv.128.1635902440976; 
 Tue, 02 Nov 2021 18:20:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g21sm174822ooc.31.2021.11.02.18.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 18:20:39 -0700 (PDT)
Received: (nullmailer pid 3880382 invoked by uid 1000);
 Wed, 03 Nov 2021 01:20:37 -0000
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Anup Patel <anup.patel@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Matteo Croce <mcroce@microsoft.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-serial@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-riscv@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-gpio@vger.kernel.org, 
 Fu Wei <tekkamanninja@gmail.com>
In-Reply-To: <20211102161125.1144023-12-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
Date: Tue, 02 Nov 2021 20:20:37 -0500
Message-Id: <1635902437.610819.3880381.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_182044_658732_FC8139D6 
X-CRM114-Status: GOOD (  16.24  )
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
MIME-Version: 1.0
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dts:19:18: fatal error: dt-bindings/clock/starfive-jh7100.h: No such file or directory
   19 |         #include <dt-bindings/clock/starfive-jh7100.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549835

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
