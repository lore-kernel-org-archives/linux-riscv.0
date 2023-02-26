Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBABC6FA8E
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 18:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXyo8HwjZU2UWz5E00gT+QY+RXLUi+pBDdYqxZWOFPM=; b=BjE6XRRsI1spNQ
	Duhu7/aZMTUMd5DNA8tc9W6HGVL0L4NUK1m1doFQu+lehkHv95hiBo2KCIhklE7ZpMZvC6/xn+xVx
	gE8T+35gMm6l3h+KgkLKYNdkb5u7xjYbZKPvaL7yQd3NJLS0eKY2V+UXDvhU5I27oWr08EW2zrTeG
	wmhfXuHUphayEq8ZSmBg46NiaYc+o6Rdv4373x9Wz8ARUyuoPbVaOUA3jH1MWQKDJbexz1lM1k/46
	uyN1Q5b+Yjoe6ewX6CG5t+kERNyMw2EXK4LCk/VZ9A7BFL/uv1qCltBUx7RfFcb/SH6BcO3v/vw30
	9zixc8lmtlP942LVo2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWLLL-007exx-U4; Sun, 26 Feb 2023 18:01:51 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWLLI-007exU-W2
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 18:01:50 +0000
Received: by mail-io1-f50.google.com with SMTP id v10so1699919iox.8
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 10:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSUnq8xRtOagq4E41s+KbYjKwfOmBG7Es9wmftqohqU=;
        b=yFNnvud8iglifK5rUb1rWQnmF4/aCw+iiBW6ZpXw5tnrTJyW1B5HrL8nmPNW9+6j2y
         lDTJEP6Pcw+Jf5byl/NjMytSLzdr+n+HIUtnuqBqhWRsH8tjOkQzwMuEcofBw0r9EH8t
         Izdt0ra2YObgNCPefKfIJgnnu5crjCeiNuObGgQPc/audedGy+5U6IDRaqmbEJqspkI4
         A0maiV55OERZSqcvlPam2tIuiaUKO+m2SFkA0/QIbV/9uc7c7+PxL8pqQM4EOcPnHcFb
         PY4LrcqA3peH4VG7KshTgak0aH+2rqnwb/yoBk9kIbaSmEUcqwheicreJ+nb9jKw5EFF
         bxzA==
X-Gm-Message-State: AO0yUKVTYHItGh47bY5E97PCufQCq/AyqjOmkXxRdn10ijsRYcJJMTTP
	kLcmdPJg0tf7cbjNp90OlQ==
X-Google-Smtp-Source: AK7set+3Ok4qG7EMNR+nPCTdYBuutxqpvNu4gD21+j2oWwh0QKKh9T2K+w1r/DIfDQboVOtz+yGwMQ==
X-Received: by 2002:a5d:904f:0:b0:74c:d67a:6fa0 with SMTP id v15-20020a5d904f000000b0074cd67a6fa0mr2414345ioq.7.1677434507245;
        Sun, 26 Feb 2023 10:01:47 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id h2-20020a5ecb42000000b00734ac8a5ef7sm1598081iok.25.2023.02.26.10.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 10:01:46 -0800 (PST)
Received: (nullmailer pid 101541 invoked by uid 1000);
	Sun, 26 Feb 2023 18:01:43 -0000
Date: Sun, 26 Feb 2023 12:01:43 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Xu Yilun <yilun.xu@intel.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org
Subject: Re: [PATCH v1 2/6] dt-bindings: soc: microchip: add a property for
 system controller flash
Message-ID: <20230226180143.GA96766-robh@kernel.org>
References: <20230217164023.14255-1-conor@kernel.org>
 <20230217164023.14255-3-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230217164023.14255-3-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_100149_129680_7DDDE8A8 
X-CRM114-Status: GOOD (  20.18  )
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

On Fri, Feb 17, 2023 at 04:40:19PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The system controller "shares" a SPI flash device with a QSPI controller
> in the MSS. This flash is used to store FPGA bitstreams & other
> metadata. IAP and Auto Upgrade both write images to this flash that the
> System Controller will use to re-program the FPGA.
> 
> Add a phandle property signifying which flash device is connected to the
> system controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../soc/microchip/microchip,mpfs-sys-controller.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index 04ffee3a7c59..97a7cb74cbf9 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> @@ -26,6 +26,16 @@ properties:
>    compatible:
>      const: microchip,mpfs-sys-controller
>  
> +  microchip,bitstream-flash:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Drop quotes.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    description:
> +      The SPI flash connected to the system controller's QSPI controller.
> +      The system controller may retrieve FPGA bitstreams from this flash to
> +      perform In-Application Programming (IAP) or during device initialisation
> +      for Auto Update. The MSS and system controller have separate QSPI
> +      controllers and this flash is connected to both. Software running in the
> +      MSS can write bitstreams to the flash.
> +
>  required:
>    - compatible
>    - mboxes
> -- 
> 2.39.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
