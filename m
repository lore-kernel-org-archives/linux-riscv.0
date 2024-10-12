Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0175CCF2566
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Oct 2024 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iRt93WH2jlTd9gjwEvxgzROX6lIcBwXgUXajg+/txMo=; b=nZSWqiCYLEmtCz/dUwW8KI/KkR
	ZWfBbSnaN3/Vbkcdb544Gt6MXsHsTI6VztlK6Qo634iADULdc2r0HWYELVM1TgsmT37tBQOS2NQmI
	o4llnP5L0fL2JrW7OQySl6iXyy05iTT6ahws7Yy1+TZkxdBOdYrtIstqPmoIv3VVMxTrTkxSi9Ew3
	1RvftHx3xyRyqxOI8c6G4jZFgycL+3VkNyUBpe4YfPpJ/vqy7nqvWni+InDXaFRXYSsihhdCpZt+V
	1y3imzDo2qWcYr02ORcCLdrFFEFi63YVa+f6WSQe1KJjIKP/TWThHK59yq6Iwf0oyV42jbTAN2rOo
	dxIchuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szcRh-00000001Hjl-0DkW;
	Sat, 12 Oct 2024 13:46:13 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szcRc-00000001HiP-23i0
	for linux-riscv@lists.infradead.org;
	Sat, 12 Oct 2024 13:46:11 +0000
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 105DB3FE51
	for <linux-riscv@lists.infradead.org>; Sat, 12 Oct 2024 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728740766;
	bh=wX2+LM1EIphUiY8L+Ud8kXahS9GWghUjKo8VomtJpRE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hmhcZH02omw/3HLqYobtQvxFInoMxRIiPIr91uXFjK15jfbje0xsbxYXqzxAh6IvP
	 ab7hDpnuwbGAdmd+maNz6FzpB5FZz6xz/HkElRSnmDHc1Erv4FEbi1mGx9sWQMz6A9
	 AkTBVBNrAd8twkCdgidO1EPhHXt7OPklfxKNqAdR/6eF7/G/8HKBnErWraUUSZOt34
	 QZvtajwNF6p8X/uKGGpHgVOUUDozZxLQBGaX+Gp7nCBVq9vxfRZyH56pj12JLkRDyo
	 77F+TiACgLrbdRZqJPk8n5VsA4CTVYuUUW8UcbkkIyox+4B4/UUlhwJvvzf7wXluSt
	 Q9Eom84VT2zCQ==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-288996e6b66so200129fac.1
        for <linux-riscv@lists.infradead.org>; Sat, 12 Oct 2024 06:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728740765; x=1729345565;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wX2+LM1EIphUiY8L+Ud8kXahS9GWghUjKo8VomtJpRE=;
        b=bEXP598TrtvCd82JvMscjZF+X2yhJe1ZVUWdkvVBmTlvU1P+mpQx6BKCwKOwFvhLrs
         UWlcamstXt8/ctfMxKkrjKBbxp92u6EOmGnUBJANAMatoXDxV/k/1fFz90c/bNoQZqqp
         nb/CDX9wCiEn5GTHCDjq54pEtT6PAuubXgHE5WEQ2CPQXSzIUTw1796TmrtR9Ye+nZEO
         1usLFRPcHGrlvIax5QwfkLAPUgvVaMbjDLFpD26U1i61PghQnFHb6o4k/I4ROPGU5UB9
         Yi0D5zstI5yuBCb04QsZ209LbO5z2lQ451wgGmEbeaR/GCVFyRL0u1ff3HDBseK1a05R
         svtA==
X-Gm-Message-State: AOJu0YwkizpFtBzRZJ6rXWx+zqTAQCQ5CbGk/Ex0Q4E4ZjQ4mPP2gc5F
	kHzo+VdhsIFMlX4xZtv+83QCHrxFBP1NPNKCfEuisE50qXfIwHhCN15q9RBLRYsy2it7ZIPnDhv
	mTRqpBs6NCoA23YVwJJxnQfW8Tfg0MZ0F3f/cUUmy+Zq7nJhyohzmDtUsD2MMAuzfoaXIhfse04
	vrsgg0qjAbqbqSq2eNEPelzuSi18+9xu1sQjNxyd3Ccc8nSut10f5suVod
X-Received: by 2002:a05:6870:9a20:b0:261:17e7:59b3 with SMTP id 586e51a60fabf-2886dd63017mr3691934fac.3.1728740764928;
        Sat, 12 Oct 2024 06:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP4R8o1xTNt9NnlgIKlLHoYXBR+jmFI4otlWWTHp9Xr17E6cIWspGpN8K84jN8jnyBWovayalZRE70svxjXkQ=
X-Received: by 2002:a05:6870:9a20:b0:261:17e7:59b3 with SMTP id
 586e51a60fabf-2886dd63017mr3691884fac.3.1728740763638; Sat, 12 Oct 2024
 06:46:03 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 12 Oct 2024 06:46:03 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-6-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com> <20240930-th1520-pinctrl-v3-6-32cea2bdbecb@tenstorrent.com>
Mime-Version: 1.0
Date: Sat, 12 Oct 2024 06:46:02 -0700
Message-ID: <CAJM55Z_8d10_8g8D_WwYqi_D36JVs+7UdooO9p81Vuwd8odSyw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_064608_918492_78421479 
X-CRM114-Status: GOOD (  11.37  )
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

Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.
>
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index bf1c639072b8..ca84bc2039ef 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -29,6 +29,12 @@ &aonsys_clk {
>  	clock-frequency = <73728000>;
>  };
>
> +&aogpio {
> +	gpio-line-names = "", "", "",
> +			  "GPIO00",
> +			  "GPIO04";
> +};
> +
>  &dmac0 {
>  	status = "okay";
>  };
> @@ -48,3 +54,36 @@ &sdio0 {
>  	max-frequency = <198000000>;
>  	status = "okay";
>  };
> +
> +&gpio0 {
> +	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
> +			  "", "", "", "", "", "", "", "", "", "",
> +			  "", "", "", "",
> +			  "GPIO07",
> +			  "GPIO08",
> +			  "",
> +			  "GPIO01",
> +			  "GPIO02";
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "", "", "",
> +			  "GPIO11",
> +			  "GPIO12",
> +			  "GPIO13",
> +			  "GPIO14",
> +			  "", "", "", "", "", "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "GPIO06";
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "GPIO03",
> +			  "GPIO05";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "", "",
> +			  "GPIO09",
> +			  "GPIO10";
> +};

Hi Drew,

I just noticed you've moved these entries compared to my original patches, so
they're no longer sorted alphabetically. Why?

Please see https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
under "Order of Nodes".

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
