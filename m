Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37455C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03BF961207
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03BF961207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBkTrnRPdd8lcq7Y16shiJ4XHiuxfAsjLZ8kDfhEd5w=; b=jIXj/kJvrwWWJW
	G/vYfSGp1dhIcpjXmMNAqQHoBE8EkYNMgnsSEZlGxByDzGv7xUWoEpACbGpoQ0vu+TXBIWvTdhs5J
	v8TRV1GbDUXa2l7IRWOVek3RoT0DZ/hwhvZ1TKMjDOhY4v6Ms/Y9equtx8pqtL9TV9G0T6kdYlEtF
	7ggMnws6eGrIY2JHiaI1SJsNAkDQ/HqawHBSYrL/C++wCziwbctA1pRp7wom+wMrvwUPepmUd31UC
	pSDDW4ue2yb6SSewrzDww9FxNKd84e96OyktpuzJMFA8oOFAizbEO2p8GtXQAKUSO2HoCF5WKhHlw
	JAuMF2NBLxyTqtlOCOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkIPI-000dir-2n; Tue, 09 Nov 2021 04:06:48 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkIPC-000dg1-As
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 04:06:43 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 h12-20020a056830034c00b0055c8458126fso10041358ote.0
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 20:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=VnK4CqjrP/tqSC7BA9VprQcCacLXAGRlUC8b9O7Uy4M=;
 b=ACM9yw/8SuL6N2wSREFu8V0NiRjMFM1F1pgNRdMz9S7SaHSw3Mm6xE2AG/Mi36f4r9
 MYDBz9X0iaWupxEl7az1DXuh5s7v+zIRSRHp1/Kv0bGc3W/fCQQtppyf6sfThKJPOpMd
 L9Koj/rzG539h/p9/wtUjKmAJ33npojfh+Wm27W/kUxqSkvUx1Sn5tf28aGpl2aJpJWb
 hGT3VV/zH1yU4y2CJ6kxBG6/StS2vsLn/0jDpKQdjQuYk3zCVhcq1L//zSftG3L0avwS
 N2bRy3pU4239uawIQTx9VVm7N+Z3/MVsb/BVv09gMxd2GHezRPEH0JVvvJQBrSxy1bbi
 bWhA==
X-Gm-Message-State: AOAM532OTbCMWuqn7CC6dr5xaNp9tpxPeHZe52q2CFdMR4vdZwkNo4dN
 JtOKnUB12amW5DjOElbI7g==
X-Google-Smtp-Source: ABdhPJwqFn7rKwZp6OnGXpSvQFrbwKnzY5Gjt/HWja7Pt9VDcz04tYmsi6lM2d+x4u61UsKiO9386w==
X-Received: by 2002:a9d:8f2:: with SMTP id 105mr3483960otf.95.1636430801719;
 Mon, 08 Nov 2021 20:06:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m12sm3606861ots.59.2021.11.08.20.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:06:41 -0800 (PST)
Received: (nullmailer pid 743043 invoked by uid 1000);
 Tue, 09 Nov 2021 04:06:29 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, linux-usb@vger.kernel.org,
 daire.mcnamara@microchip.com, linux-spi@vger.kernel.org, geert@linux-m68k.org,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
 bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
 linux-crypto@vger.kernel.org, ivan.griffin@microchip.com, atish.patra@wdc.com,
 lewis.hanly@microchip.com, bin.meng@windriver.com,
 alexandre.belloni@bootlin.com, krzysztof.kozlowski@canonical.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, a.zummo@towertech.it
In-Reply-To: <20211108150554.4457-11-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Date: Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_200642_396981_3A7153F2 
X-CRM114-Status: GOOD (  12.49  )
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

On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552385

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
