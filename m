Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8DDC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBhmkqQNMn2Fq+IXAsz0t9UVZ6+S82MlXJPO5lg2R3c=; b=RWQsSpdt1sJsR4
	EcooIoKmUpBNAG2NjaKZ3QPQCBRJrkqd5QfoC18np7UjgNOwfHvbDFDgAoHDqAz6JssRndVnT6V4n
	jGxYlso2Cxfy2zlC2WuT1r9w+V3QzeYfIgrMDpndhqkzlo0NEvYz4L9CehoJN2QFTvVoG55J8VdP2
	HpS8ZioTFUEGW2CjX8x7sCkfHeWsp4urU0GA05Z2qk4odsmJ1DZXXDkEA6E08AVhFjQ2HeqsOV3u8
	ELPsvHW4AJIlum23tyhLQ1/X2ZzbVuaq4xvTjlfjPGS09KApQU96lY1YUOFBkMZQbkrBhU+5vi1Qb
	wxUbDy+WICLFzmhJhi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWsG-009UzN-2L; Mon, 31 Jan 2022 13:37:40 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWsC-009Uy0-NV
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:37:38 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 d18-20020a9d51d2000000b005a09728a8c2so12986450oth.3
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 05:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eyKZGeMppzdMnKqFGEAP/XE0vAujCQDh+n/xAG/dtR4=;
 b=hYLohRgK4f5/KF66QCnog+y5gP85bPuL0oU23uXbHXTB4JNKRtY3VSa8YJ7IlVslSt
 /oqsqvJBAEMBrejk4Xeq55iP/trSKQkSwqMBs0rOxmMctY805jJf1/3pWWtzmNbm+lSG
 4w4+6dzTOZ/Dup0ct1M/omqvXJBt7UB5jzF3wpoddEyNA1XO8f5lDWcUKS62Fd+7rt+Y
 9VZQSfKVRdhKg3Gg1R6vHLMK5dYGxoJ7fvyFUdXjXAdlBHzg1S6JdziYyJ9PCx5gUsl7
 /hYuxnNDmTgEg7g9fL/Ta7rsvwWh5C0EKEWfRPiAZLAUTi6Zk8ciqo6y/Swa3w4EmcUl
 uY2w==
X-Gm-Message-State: AOAM530hHONu5CU7ydV+TG+jOPVOKymZsdrB2FcJD4xKpMfZtZl1hWYR
 ZcpXyCSxu+ui9/O7ZdmeNw==
X-Google-Smtp-Source: ABdhPJwRjL7O/8HCWUdBK+YSkY0A28RmHcoorp6KeBHBAOj+PPMQj/h6dh4utGxfFu9ePS2Ejvizvg==
X-Received: by 2002:a9d:5c8a:: with SMTP id a10mr11505693oti.248.1643636255294; 
 Mon, 31 Jan 2022 05:37:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg10sm4545104oib.33.2022.01.31.05.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:37:34 -0800 (PST)
Received: (nullmailer pid 140169 invoked by uid 1000);
 Mon, 31 Jan 2022 13:37:31 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: bin.meng@windriver.com, linux-riscv@lists.infradead.org,
 krzysztof.kozlowski@canonical.com, robh+dt@kernel.org, palmer@dabbelt.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, lee.jones@linaro.org,
 brgl@bgdev.pl, daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 linus.walleij@linaro.org, paul.walmsley@sifive.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
 u.kleine-koenig@pengutronix.de, lewis.hanly@microchip.com, atishp@rivosinc.com,
 linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 heiko@sntech.de, thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
 jassisinghbrar@gmail.com, geert@linux-m68k.org
In-Reply-To: <20220131114726.973690-5-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-5-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 04/12] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Date: Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.101853.140168.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_053736_797214_9C875743 
X-CRM114-Status: GOOD (  12.67  )
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

On Mon, 31 Jan 2022 11:47:19 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586704

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
