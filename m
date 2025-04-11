Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2DCC369A2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 22:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJ/zi42HkOyZ31si8dmQ8he3x3W/V7rrcDd1fv2O5wc=; b=yc3LGyd7+fWw3m
	MaEUgc1w1+iLSifYjYILVwOdstsrvamb8MPkeg4227sArobEJgD2letislUStXhdxmSb287Hh8DkH
	gBI/EBTFGGU4ZRuTe9X4ZQAfDhxAxPJugHviM7h7JmTYWf8ChelnhxcJ6WwhTtPZ9QFU589toTd4Z
	B+o8ePL3bIOYenBlLnZuazs5mlnpJL4tkf00F0ezjVJsRePV8FB7XkIZUicI7B0y2r03xLm9gkK6i
	cwKv+ml2OFpRxz9+GN1vHCszPI2r2uBYABhcYJHsn42JA2Nb09aMjFNW5J8KTSuwXyWZw/RTHh0sg
	l6piMGLbQ8xMECCHNczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NDf-0000000F1Oh-0y33;
	Fri, 11 Apr 2025 22:51:31 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NDc-0000000F1Ny-2fmj
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 22:51:29 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c5e39d1e0eso240355485a.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 15:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744411887; x=1745016687; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HEQDjb5KDxAGEAba9XLVOTbfFbTRrFjtfkQU13uIchk=;
        b=DzWNY/zH1yLhaHUp01ZK0DPJeDxzaAwfdbFry84pR5SNfxhF5f/rXyoTCW7vr5xyEa
         Vtedqoqq/fLJ0oeMbeFI8UW06ph0iKfueWcogXN7nalIp3W8EovomDnVacFDh63E/u68
         TpmH0QbGQ5Z1InGP+S1ow4knNygwWV1AoJ7xRSaw1h06n1AD3zKzLgzhNzfNSdHAaMZd
         73jmJ0qnjeK7Ccc+ncNbvt2f5mO/yCJNdG/qLyvgmj/Ss69OqbYuWBpOJw5T/oHneubU
         l7Cq1mstHPIUx3fwD/MW7VR88Mw6yeiAouzGy2clyo/BHvQxicyWLthds9CZ4fYsoUsO
         CHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744411887; x=1745016687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEQDjb5KDxAGEAba9XLVOTbfFbTRrFjtfkQU13uIchk=;
        b=MdLoLaN9lEy/Dx/XhqBSguivZO4hfOEahAk242SRVZznVKKXG31HjAlOOGncLqlGZz
         HVgkRQr7c7SSmnxUbyX/T6HKpviwsJAMMhr++EX3hBVLdfQb0TtBqFBnZHxR/PKty2Hn
         FX6tc7bw0uw5Jp8DTdF8qcIQwVi/gk6n4jl4MN+giSgRRSzDyAC7/dWVl1t4xPjWAABb
         QkQZDUed+5O8AbElxt5JGMpTd873K+Uc6JGq6lROHyFjULUwSvAD1ye6QSNTl1FdFa7b
         yBEbyhfc3vgSYMidQ0sJxx+4woP2S+8nyozQ/sN1/SXe0GNFQgloyU1NW3uTw+DLLxqq
         sgrw==
X-Forwarded-Encrypted: i=1; AJvYcCUU7ADBRyBLV/tHxu8uOLi5a2iyXAJznx1CURwRDdDf7ihTeNbLGc61srUWykSHHUu3sT6AQDye4UvrQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YweGesrjiYkxcdws5Zz8JivW935F9w+IYjNh3n1Xei+ufb92j0U
	+oqN+co5MFZp3FaL4GjoWcP+7TtLlJ4KR7Qhw5HqzPzL7BmZzOca
X-Gm-Gg: ASbGncuA5K03WGjhcDjMtJUbW+74rDMQHuojIkjfYWu5AQu8qmG+5RsUN0iCr5nwAJ8
	cV9ccgxmUlopw4N5jt8zu4e8ocjDR6HQhLIiO/PLXMuAcAaVvPDEfNyC5cY374IILbcy9dY5hpS
	0mkii/t600d2AeSk1N21muXpu6T0ZQYiQLcwumhQSEVz+5u2O4p8ko9wYT/lXPNV9BbDd+UTFZl
	HV0JzggTVkB7UnPDBpcdyZFpt2pZRvUFHMq+GiGM5Dkr0MWEjlEQsKeNuxjMLgMe0G0S40qENLT
	UezFrcYmQTPNiv60
X-Google-Smtp-Source: AGHT+IGuYAfAK/ysb3ONfMtlfqBs3eOj3RFMg0gm7baoEe6QDUIz8+Gcn1rGlG9Y2X1CtFTB7l/gCw==
X-Received: by 2002:a05:620a:4399:b0:7c5:6396:f161 with SMTP id af79cd13be357-7c7af20ba80mr809021285a.49.1744411886951;
        Fri, 11 Apr 2025 15:51:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a895181csm322699285a.32.2025.04.11.15.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:51:26 -0700 (PDT)
Date: Sat, 12 Apr 2025 06:50:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH 6/9] riscv: dts: spacemit: Add pinctrl configurations for
 PWM0-PWM19
Message-ID: <ujkfb3ajvoebrkvoepztgh3afzw5dq7djefvdddiboo5gxu63x@dlflpzwpv26u>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-7-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411131423.3802611-7-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_155128_676920_493E15C1 
X-CRM114-Status: GOOD (  11.53  )
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

On Fri, Apr 11, 2025 at 09:14:20PM +0800, Guodong Xu wrote:
> Add pinctrl configurations for PWM0 to PWM19 in the SpacemiT K1
> device tree source file. Each PWM instance is assigned multiple
> pinmux configurations corresponding to different GPIOs and
> function modes.
> 
> Configurations include:
> - Mapping GPIOs to appropriate pinctrl nodes for PWM functionality
> - Specifying bias-pull-up and drive-strength attributes
> 
> These updates ensure proper pin multiplexing and drive strength
> settings for PWM signals on the SpacemiT K1 SoC when selected.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 315 +++++++++++++++++++
>  1 file changed, 315 insertions(+)
> 

I think this is too much, I think it is necessary to leave
already used one.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
