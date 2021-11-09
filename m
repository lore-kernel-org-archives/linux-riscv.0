Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A6CC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E9261207
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 04:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0E9261207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lbum0i7+XIrdqduGRk92SLRzmuXcTh9mPy0NcV5I/3k=; b=hUlCVvyU9Gjex+
	sgU+Wxr+813/vBb0z2MB00g85TkpKehlVtyyTCmAuqDDo7M9DOL3pM6R7UYrRV0KsZSLnP2Dq+xom
	zlJDTEFDsTGhSBIlxB1Z8zK+4v4/oCZOEv9WjSjvvHyvqq87Ut+kw87dmKdVO+mDi5Vbk/4CH6MeJ
	OzErbEH+PWzx12ifD3Xww/QFV2BzJrTGUUSFU2ybcgPgypczVmKtmCZfnNtqg5jKaFR9UdmYEcsjF
	SwMgOKIWqwW51ZrmAuciMXdr/I677oIHknzcQ65038/qUekUVbMcIxzeElE/JEEOPB/jFvp6Fm1LQ
	5o5t9DEQNd9luCRHDcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkIP8-000deZ-Bq; Tue, 09 Nov 2021 04:06:38 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkIP5-000de1-TU
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 04:06:37 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 p11-20020a9d4e0b000000b0055a5741bff7so28976786otf.2
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 20:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=tWZ7nDJRHOWBtWd42g9mRKhhf7tmdLbzmOAabTqmyiU=;
 b=r8iDCQy1WBxqRfgdDebi1/BaG15r8rOIAbiClMPPqWRnCvvmMnSpbdr6TGumIno7gy
 mryS3fV865sgSBrSsVLi6aPjOj93iUfpQARW1ISiPAb7Uc3ZAShj07oNhQv/Qh1nlsjk
 3oR21x0noW/iU46C6nqq2icsff8h8mqGrEdyLWuMVPSAv0pTykSR14tInHeync1A9uAE
 W5H8Ju9S2k2CNBiOaHLL4TrktqNT0R1fZwH5w9auVUxFdXSVbDLP6xq2QmumRlKkgG/L
 0xMDA0bcL/AbbCjAkE/7pIFLlz2X71OK0wMr1PfyYhLGTb2saI0rYtIibS9glsPfZWVX
 WQgw==
X-Gm-Message-State: AOAM532VZT7bi+12EjUAZFl2w6G20EUn5xkXhnqnmtgmxR5kFAyyXP7C
 7PrqYIMu7YPgJeSxD0ReYA==
X-Google-Smtp-Source: ABdhPJxAgLpqKxiyb1brUu5+8L15w1Y7+MgbBAzCpLti0Eo2ZuxFP2I0GFC7YipLGJork1cbB+0IMw==
X-Received: by 2002:a05:6830:1e6d:: with SMTP id
 m13mr3466489otr.304.1636430791947; 
 Mon, 08 Nov 2021 20:06:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l43sm6070052otv.25.2021.11.08.20.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:06:31 -0800 (PST)
Received: (nullmailer pid 743036 invoked by uid 1000);
 Tue, 09 Nov 2021 04:06:29 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: robh+dt@kernel.org, linux-usb@vger.kernel.org,
 alexandre.belloni@bootlin.com, palmer@dabbelt.com, a.zummo@towertech.it,
 linus.walleij@linaro.org, linux-spi@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, lewis.hanly@microchip.com,
 atish.patra@wdc.com, linux-i2c@vger.kernel.org, geert@linux-m68k.org,
 broonie@kernel.org, bin.meng@windriver.com, bgolaszewski@baylibre.com,
 ivan.griffin@microchip.com, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 gregkh@linuxfoundation.org, daire.mcnamara@microchip.com,
 linux-crypto@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
In-Reply-To: <20211108150554.4457-6-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-6-conor.dooley@microchip.com>
Subject: Re: [PATCH 05/13] dt-bindings: i2c: add bindings for microchip mpfs
 i2c
Date: Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.899162.743035.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_200635_980592_3BD7D64A 
X-CRM114-Status: GOOD (  12.78  )
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

On Mon, 08 Nov 2021 15:05:46 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552366

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
