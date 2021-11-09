Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E2C43217
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A6A46128B
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A6A46128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiPtUHl90tIN8IsnFE8yhCqAE6juq9GV1ntR36sjcvw=; b=Yt7hPKinrP4rgf
	yS/ScHHi9xUTL0X12FHTjL9j/RxAhhTZiqOb4Jh32KwQfdSoCB1ssN0Hn8nFFQFhgOiDiVgiXq6h7
	zUTRRWu0dDCBxITta1UBBbvHo+ZbuWA/odAgbp6bLiVlNVIAj+Di/kHB/N2gY6hkFTh+jTM7DgdPR
	v/NuosqGO8FLLOpsUECLWsocPXUw7g2Q2dEp1x3Eb4reyWcWiwlOtdFnmrUAN3Cgb9Jaj26+Po17t
	0zRIBiO7WqCuKk3YPVSEkXD+EnuSqSExrwrw6KQZ5LGkggaGrhFL8yI6CIrcxC5JHRr757HTh8HVW
	bBNgM8x/gXqmcZcjuBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkIPE-000dhH-MS; Tue, 09 Nov 2021 04:06:44 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkIP9-000dec-Oc
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 04:06:41 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so12958890otm.10
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 20:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=srBAEqiQv7t2TUoCMiKomnj9CXcpM/RXP2/IhsCEUt4=;
 b=uMjmnleF0RjkObF3bD6z0r7DYRii+ov5r8yq6FIAJYPUpWYPrvfnre93yhPEgG8bUi
 rD1fokvaAVBBFG1ke5iLYgZX4EEK9D5Y1pWD4hue1FvI0clrgZBB4oPehsxcEJ34tATr
 li7he7nl2GDmWXcY/xHo5/C6kWrCE8CU9aXnqI2iyZK0n6zUbrqsJCWBatZNOt2yFEvn
 lIPNNkeqOpACictiJQyc0VyuguHZ0anRrjFBG89iqJs+w5O9+WBg3XWAfok1gXgl2avS
 XS/JO7wP0tcRTNhL3dkb6p8LChFa05uRyXuTnrgy0sHKMYnkfdxo3KpNKhDEWBM55KLk
 HiiQ==
X-Gm-Message-State: AOAM533qg79ycIxsWM6W0yOd3Ii0fuBxs87Xq55eznBhI8j8CYZML5iN
 KegdTqbpTUbSl142p7/Hiw==
X-Google-Smtp-Source: ABdhPJxAD8OzRK/Sli7Q+xp3mQUCmoiHP7RN7OOEEvobUZ0MlWRieiCoDJdFa0SI20BV1G+hYm0D6w==
X-Received: by 2002:a9d:76d1:: with SMTP id p17mr3474638otl.328.1636430798093; 
 Mon, 08 Nov 2021 20:06:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q81sm6985766oib.47.2021.11.08.20.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:06:37 -0800 (PST)
Received: (nullmailer pid 743039 invoked by uid 1000);
 Tue, 09 Nov 2021 04:06:29 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-spi@vger.kernel.org, linus.walleij@linaro.org,
 lewis.hanly@microchip.com, ivan.griffin@microchip.com,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-crypto@vger.kernel.org, paul.walmsley@sifive.com, broonie@kernel.org,
 robh+dt@kernel.org, atish.patra@wdc.com, linux-kernel@vger.kernel.org,
 daire.mcnamara@microchip.com, alexandre.belloni@bootlin.com,
 krzysztof.kozlowski@canonical.com, bin.meng@windriver.com,
 linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, a.zummo@towertech.it,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, geert@linux-m68k.org,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 jassisinghbrar@gmail.com, linux-rtc@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20211108150554.4457-8-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-8-conor.dooley@microchip.com>
Subject: Re: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs
 rtc
Date: Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.913081.743038.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_200639_842508_6A763FC2 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon, 08 Nov 2021 15:05:48 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552374

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
