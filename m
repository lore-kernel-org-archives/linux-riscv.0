Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644E7D1812A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o/fnFf+mccE4dtvcgyu1R86PzAUyCk1HIQybWiVgdNo=; b=qJyyjKuQdk9qAvQjdxfKKYaFL+
	P2hZX77NKTTBZNonojvCd07Dgmls1n0Eihs78vXYEDrkeH94albF5b4b1PYEe1hsUJ2CwYUpL6u7j
	xrrHfZOg4SnAR2KFFcBm7weYceM4lX+yChBMKvECABJHSX+YZKW92aUoYsqWSXZmnsZgevPtxjmFV
	AUNtJ5GqrRzs43bobL0ksPONElJNauSt/5x5OBglkD8Q589p+XItusEc+rjov47KUhnp8IcKwa50S
	rp4m6np7fwRhdEszgCx7RAY2QG1AhReK1R2ThrHeTszrhJl8nPdI8EHXvpQ3FV9tpf/miInSDkWYq
	RQjeZ/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0N8W-00000005htu-1uPH;
	Mon, 14 Oct 2024 15:37:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0MVj-00000005ZrT-1ZfS
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 14:57:29 +0000
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 83CDD40AFD
	for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728917843;
	bh=w7jcJQQrs2lciGR+l1IMV3wPi6SzvVaYcIWT6ArXKPU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=oqaDaQodQE6Tf+dNfyZ1RdwJa87Kz9p0bIg3rHSHK+GopyTX8tQOhuQDyMDD5GUfF
	 DC9yFIq8hPk244lUkL7fRWOBaInjpsNHXaMqcWKjdt7b+rGhiuOEuz5cPzjOm65x9d
	 9jq8AKVg45zvF3hwvH0NTkmuRnnttBAPJBUYbcczS1pzkqZK0u9ayykDC+ERZofZGx
	 cgIfwAJyhXpoI0u8MGYbO0TJlSHqiQPjUpQnsLQ1VZf4SJTMzJdmKG56ZyWRyrRF38
	 xmg0efxLW3Lf8yubNu0o/godt418aYZupUY0cs7M49IdEk3m7DcjKJl30Gfxh8SaHY
	 GMmjhDztO5qOQ==
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3e5d94c88bfso1230588b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 07:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728917842; x=1729522642;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7jcJQQrs2lciGR+l1IMV3wPi6SzvVaYcIWT6ArXKPU=;
        b=YeUvqnVgh3Yfd/i/+jAedfvpysl9DRC1pKgMMB8xyqqE1S2le5leystIDTA6iHJOIv
         SK3G+K2AZLudp723sG8d9NMiZywiFB9C+8AjIsnR/Bm7EeGrBJprwz+HDg6TbEsBmjPb
         9DojMRSwm5Yz4c1auqtr07WS8Mdkh95W+tRNmGNdnjNiYu+th9noN0bl8VmYxRDRlif4
         AW50pYkZS3gF9+tN1pqT+S/HH16zWu/kGCNSP14hHuRkSQzd+lVCLmpItK4gN/UoF6iP
         EqVT2GUt2bjm7oTcrKve2itW3A3Fu8vBMA/Kp/1t+f5w5hiN+rOeqDJMqecNPc4VXeM4
         Pyjg==
X-Gm-Message-State: AOJu0Yy5dPc8x/6Er0XyW5Cyt94GNU571I9+c/iMDS0UcZmpXuwKgXxp
	I2EOaU7EcX60brN+HMC0/YJTbsNXaW7Vy4k7rmylOlS+9m59Po87s3/lBFxtZEkuzKlLagz/aQe
	UborzZIRVwCfctmmBOX0iLrGwcD8+2hyUsg454JBmt1aVwQIEmco3IsuvoKptK+VD/x+c/tqTuF
	2pGTayGgYX501mcA/qFfzA51M3+EyqyHazfSAl0VT4SvD1sUjI++G2U0J/
X-Received: by 2002:a05:6870:4214:b0:278:bfa:87da with SMTP id 586e51a60fabf-2886dced84amr7421842fac.10.1728917841753;
        Mon, 14 Oct 2024 07:57:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZc7S/SsrDerBCPsPZzUzEauPicO5lJ3x7aYFJHGS/2FP/NfQZYzrPO7bg8HBk/3yI2N7NccykyCVKHL+eU0Q=
X-Received: by 2002:a05:6870:4214:b0:278:bfa:87da with SMTP id
 586e51a60fabf-2886dced84amr7421814fac.10.1728917841412; Mon, 14 Oct 2024
 07:57:21 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Oct 2024 10:57:20 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241014123314.1231517-4-m.wilczynski@samsung.com>
References: <20241014123314.1231517-1-m.wilczynski@samsung.com>
 <CGME20241014123412eucas1p2144768f373a2e2de7f6d00e7b67f9328@eucas1p2.samsung.com>
 <20241014123314.1231517-4-m.wilczynski@samsung.com>
Mime-Version: 1.0
Date: Mon, 14 Oct 2024 10:57:20 -0400
Message-ID: <CAJM55Z-bzivMZWUsHiii+2tw2-kdRe7kqtVa+MvPEAVTmOvChg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: thead: Add mailbox node
To: Michal Wilczynski <m.wilczynski@samsung.com>, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_075727_819307_CAB67DC5 
X-CRM114-Status: GOOD (  14.63  )
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

Michal Wilczynski wrote:
> Add mailbox device tree node. This work is based on the vendor kernel [1].
>
> Link: https://github.com/revyos/thead-kernel.git [1]
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 6992060e6a54..435f0ab0174d 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -555,5 +555,17 @@ portf: gpio-controller@0 {
>  				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  		};
> +
> +		mbox_910t: mailbox@ffffc38000 {

Hi Michal,

Thanks for your patch! Please sort this by address similar to the other nodes.

> +		       compatible = "thead,th1520-mbox";
> +		       reg = <0xff 0xffc38000 0x0 0x4000>,

The documentation[1] calls this area MBOX0_T, but it says it's 24kB long.

[1]: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

> +			     <0xff 0xffc44000 0x0 0x1000>,

According to the documentation this is inside the 24kB MBOX1_T area.

> +			     <0xff 0xffc4c000 0x0 0x1000>,

This is callod MBOX2_T, but is 8kB long.

> +			     <0xff 0xffc54000 0x0 0x1000>;

This is callod MBOX3_T, but is 8kB long.

> +		       reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";

Maybe these should match the MBOXn_T names in the documentation?

> +		       interrupt-parent = <&plic>;
> +		       interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;

You should probably also add the clocks here:

	clocks = <&clk CLK_MBOX0>,  .., <&clk CLK_MBOX3>;

..and claim them in the driver. Otherwise the clock framework will consider
them unused and turn them off without the clk_ignore_unesed kernel command
line.

/Emil

> +		       #mbox-cells = <2>;
> +		};
>  	};
>  };
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
