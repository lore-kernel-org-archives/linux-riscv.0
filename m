Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB03C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vS1nvishlkD+xVCevU8bjfKsJGzW31YJImRGMLWOtUc=; b=PNhSvldvcAVHMj02idTJffTqKu
	PHrdHSogcSTserMvN+bQ60dCKy/EFSgMb8Eu6gCtmx3r/PQlKsPrXn3CwGUhEFBr19dawRStzIWpH
	2+0za6+vxl6zXfYi8KWnr8lRe1JS8aWF+hBTj0OJKefahj91pMZX/9H2K8gJ8dAeuh9t5fWOOGy+C
	U8Xn8xp/ktjzLWWi26EuJ9q9wr4AbEtBXuLcbSLIg+QtNyruCV4A+u/N/SrBP+hxejOtJ9zKqKbWY
	ZiuRWl07drA4pfSfqhGjoyKoxGI9XrYGyvZIY5p/oZa80RlIj2duA/LYF+nDQystt7n98Rlc6Dvf8
	U2z45erA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOQ-005KHc-HW; Thu, 11 Aug 2022 21:07:02 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFON-005KBm-UA
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:07:01 +0000
Received: by mail-pj1-x1036.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso6247475pjl.4
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=JrHUTkJyQWr1jJIPcxndllMl3ULcPf+kBB+IZh69boA=;
        b=QyByDNzU0LLWSP3pCHqJuo1AUxkE432ctIaCVFEaqbh6KSme27t2bncc2YpexJzZZN
         D6Gzxaxx7+JmrmOshKQv5Wiakv025CZocwBVBjYGpOwwmNdh0ZkXePLRcn9mihdwd3bV
         JYriUdKzNglB+n7gKMAfrwGGEaJuS6+aZ3+oaIrtoUIo3GWbRjtnTVOmZTvb4w12LhVW
         1kWtv3jiY/xu+rOKc6Iiv5dznAh21pBsLZ0z4meReseuplORjfdbWe8XFzatF1301QGT
         PGzPxWxX73FVuCnSeN8l9iEU2iLi1i753hcqWHCKNi/F7nOibf+/oKShN+7FyEvIQqrK
         69qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=JrHUTkJyQWr1jJIPcxndllMl3ULcPf+kBB+IZh69boA=;
        b=l3U32t1qkTTP6MS1OO7MmqMq+Yaip4mSNh/fo8vurJHzQWtIQ/irUa57OWkmSAMnDc
         CVpMPgPTskkki9bXrrr+TGVOFXb+JMeFWMBIwu8dyoMRjFxS5kau7lXP5sXDD4stwHhB
         REy4BwvJ29PnQvBaAz+/qQcMP7UdIJ3041hP0uS1+htdhidOAEWBV0Q0PVfbP2npxL2b
         k5kZV2yK00YVi7U9y9JJxy1b3/hzRigY1AzJ7B6bs3ojp0ki48IC8jttYgmrJhnr0Uhv
         0VJgb0OTaLtqMKH/XYBmPxokh72Iob1VR3gEulL9nX+aOQNSGwarIt7kNAkJCOvqx8ky
         kftQ==
X-Gm-Message-State: ACgBeo1u6URUOXOQKPQVDrbRPOPisqdcsv/cwVW/bM7gHl4+sVMMGz2h
	B/okKolGnlmOxMGd+1MIQvXIUg==
X-Google-Smtp-Source: AA6agR6XAQlEc6RM9lomCPThmIuzbW7YQlUvuKU4lrWhPm22PyZgoIEmGk2m2jQZ59bDV3Rt0+Hb7g==
X-Received: by 2002:a17:902:8502:b0:16c:c5c5:a198 with SMTP id bj2-20020a170902850200b0016cc5c5a198mr898604plb.88.1660252016890;
        Thu, 11 Aug 2022 14:06:56 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id lj7-20020a17090b344700b001f731a1ed88sm4150322pjb.2.2022.08.11.14.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:06:56 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:06:56 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 12:09:15 PDT (-0700)
Subject: Re: [PATCH v2] riscv: dts: starfive: correct number of external interrupts
In-Reply-To: <20220707185529.19509-1-kettenis@openbsd.org>
CC: mail@conchuod.ie, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, kernel@esmil.dk, kettenis@openbsd.org,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: kettenis@openbsd.org
Message-ID: <mhng-4117ac1c-2f8c-4011-91df-c920e6ab6aad@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_140659_992377_DB888C8E 
X-CRM114-Status: GOOD (  19.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 07 Jul 2022 11:55:28 PDT (-0700), kettenis@openbsd.org wrote:
> The PLIC integrated on the Vic_U7_Core integrated on the StarFive
> JH7100 SoC actually supports 133 external interrupts.  127 of these
> are exposed to the outside world; the remainder are used by other
> devices that are part of the core-complex such as the L2 cache
> controller.  But all 133 interrupts are external interrupts as far
> as the PLIC is concerned.  Fix the property so that the driver can
> manage these additional interrupts, which is important since the
> interrupts for the L2 cache controller are enabled by default.
>
> Fixes: ec85362fb121 ("RISC-V: Add initial StarFive JH7100 device tree")
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---
>
> ChangeLog:
>
> v2: - Fix commit message
>
>
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 69f22f9aad9d..f48e232a72a7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -118,7 +118,7 @@ plic: interrupt-controller@c000000 {
>  			interrupt-controller;
>  			#address-cells = <0>;
>  			#interrupt-cells = <1>;
> -			riscv,ndev = <127>;
> +			riscv,ndev = <133>;
>  		};
>
>  		clkgen: clock-controller@11800000 {

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
