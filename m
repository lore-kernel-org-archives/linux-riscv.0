Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E960CE7A8C
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 19:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eubN0el/s5O97U5bwA/tMVOu0vPHloR/w1jRgulNZ9g=; b=a6N8AWqE78hWv/
	gtoIUP653nscQcoFXoV4Qs46eLGiXhu3A79SgpOfA71fM9ZZVf7qD0nE65tu/00DVkD7aTmL/4cJW
	eTvfyMXLMt0BpIMSBIqaTxdX7UsVfjbUSmNzO0OjyOFMwXDQA2gIg3TTwRqOiU1nY2YZdL5MAvJc5
	CZXj3sy4Da9n9cv+5H4U63/rEaQjb8fMjTBj4WoFv3C3S+sTIV1eyNJ1SYyVY8OUvYOnBa4+yNbhH
	D3J15NPAuQqXVZ/ZG2ul0pifKs2e6lEOLYFk3TrnweObYJfhMyC+a+11qLUyMSCRZjhTxd3PKdZlX
	saPTPzA3riUkNGt0+3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkUzi-00CiiD-1T;
	Sun, 24 Sep 2023 19:42:18 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkUzf-00CihH-38
	for linux-riscv@lists.infradead.org;
	Sun, 24 Sep 2023 19:42:17 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c136ee106so621303866b.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695584534; x=1696189334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1OAJIe+rOLUJzcNXVPzHOsb+JGDg6uIpunRCjru7BA=;
        b=UhisJ5VUUlRE3kilmIeyQArdml1KHghUTmWfYjxDAZhpmYqEelrwew0MO8Kt71v6oq
         ACCQiQUyEtxEr8g/eiFk5a1aBqQZ22278NPb0RX8ppHXF8HczWF1xzFaS+CKQdsNU+L4
         fgb0Geby21MmUmOSYgVA1tROWSR3C7BkGZEQSjfZA41zaCK7bKbMf9DnY2HjqdAKynP8
         r++o82Vb/LG4SWSWlDdJoZxNfiTRFlq0l8G+emOhn6AAphzFBdLfK+GnyusFQRc9PPp/
         8At9jCPpaNIMyaN1/CaAtyhxv3KsH+dAnb03pDDQzrdlRnS4prz1umrCxQ71dYoGrafN
         g4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695584534; x=1696189334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1OAJIe+rOLUJzcNXVPzHOsb+JGDg6uIpunRCjru7BA=;
        b=bv9pDhZ/4fZBIec6Y/Q13cEhzmV1gKDbXmAyeU9GuGmDTS4bZCN4jH9cOgObudPs3e
         n4u2WvFdL0oj34kGbz8dO/i5x1P6HWtuoVV/Vl/arHD4jUHdpWk/ubV8jQgwhF5sciXW
         Op0/3e0pIBxaOvxVskx86DlxrbXaKfhpRqqezAAfIRf/1IpC96+tfkWQDaP3BgRok5m8
         M2fugapH0u/Jx2FvRHyf6Z/kiQeQKmihWaDYrv9Wu2tRoWxl3iADTOXwejg0d7EzYbbS
         k2f+YnnkwI+RaRmEbulelJrHz7oE0/xXOKimyRRLABeNMjRTG/aFkapKXEeyhZ8j2std
         ysdg==
X-Gm-Message-State: AOJu0YwhV3xLQYDZ6DEpx3oKKJomYhnpFqjYuu0it855kW11fzsYp0Cf
	5PV/veaScVhgxgnz2/G8fTcJNooTWqgRw4dr
X-Google-Smtp-Source: AGHT+IElTLWdxYzDdmFsBbLbnhFSAtGhPSM0V5vdb/GQFUHvl00TjFJ8CTOxEMzXqAItwMFv4I1k2w==
X-Received: by 2002:a17:907:2e01:b0:9ae:406c:3425 with SMTP id ig1-20020a1709072e0100b009ae406c3425mr4634928ejc.0.1695584534105;
        Sun, 24 Sep 2023 12:42:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d18-20020a17090694d200b0099cb1a2cab0sm5322258ejy.28.2023.09.24.12.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:42:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 5/6] riscv: dts: allwinner: convert isa detection to new
 properties
Date: Sun, 24 Sep 2023 21:42:12 +0200
Message-ID: <4833002.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230922081351.30239-7-conor@kernel.org>
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-7-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_124216_011209_ACE11C85 
X-CRM114-Status: GOOD (  12.87  )
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

Dne petek, 22. september 2023 ob 10:13:50 CEST je Conor Dooley napisal(a):
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the D1 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..947e975d2476 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -25,6 +25,9 @@ cpu0: cpu@0 {
>  			mmu-type = "riscv,sv39";
>  			operating-points-v2 = <&opp_table_cpu>;
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			#cooling-cells = <2>;
>  
>  			cpu0_intc: interrupt-controller {
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
