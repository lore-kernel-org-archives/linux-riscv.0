Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515B2C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uI15rJ74AFFVsAAvZVuhzA2eVdoHm7O4eMJSi1o0TiA=; b=U4T+fwC5zy0XE2IlszfYR6zpYZ
	hNMu7hJ2v+pg+9yvdxbkCuhJIdYcIX1bhi+kKntzxxl8GYnwLdXzyX9kl5gSCYgwi2YBlBJZOABZz
	NlRQtiUmsxOXEwj+wrzo2O8OmvUZOaFIeWwAVjvTzyLpfvg9W6dRo5C8UgeH1njrJU8yh271nL/hC
	jVhhxnAmsNFmn++/m934ycDk+LETe8Yjf1Rfgdg8n++XAwV/8t0izplAFO5SY03UrdFXMdTRaHeRa
	OQK26eL0Lx5Ncm5dgUXiTORzXZrsELaMeId7KmLao1hbxOaLsZWMj/OS8aG0hAL225TVADGIWIZRI
	gO9jLK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNMx-00000009UIm-1fkD;
	Fri, 07 Feb 2025 12:22:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNMu-00000009UIB-0toT
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 12:22:02 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 90F863F291
	for <linux-riscv@lists.infradead.org>; Fri,  7 Feb 2025 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738930915;
	bh=bLYbBkGBrBPKD0BA+zFMlOKFJsc5hMvXA5oz9aSTjyU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=aI1IA//7pBo/FYAoSPXPE2XyU2iIbqSQjBCQY71OX+J3m1pQC3JIFSjAprHms9sbO
	 bJ1tHvYjxjCwEc49BM10dOhbUCgI6ecJ00SZrtjhcuH6Y9B4M5frQdOLZnmUI5IIYG
	 HaMdmR5fB9WhixmplYxSMzCIAhG8M/qiHKGETFryu6bxaiRtnX6cQoULoh+tCwuJia
	 PoacAZX8jbVT6lGd5dmPqFAOlUEMZUkAkgdZ717JgD8IRRzWGuqMkBhZQbbBKNar8Y
	 d+fbxR8Lg1jrCgrH7DcFx0q65ofs0SvgMMxMEUvOfeOv+39MzzbozLO3t5pJ53Q2B7
	 /tYtTGkWJmgfA==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3ececfdeb82so692264b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 04:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738930914; x=1739535714;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLYbBkGBrBPKD0BA+zFMlOKFJsc5hMvXA5oz9aSTjyU=;
        b=CkGu+KDHPcpTYLevLJhZIcOi3VWvi8CZw2RjB0dOsujfl49InrNexCx1jiJkkxFd35
         zWUrTUoCKexW0URz/v7GHIIgvmCDFXiKDFVTDV3DUABYDkHrF6fEBuoqb9kR/pM8v0n5
         8jvTgxqnH4GgLVsw16A5hc7DBvsDTR3m8gRZpxx3sTZGacLiDi8m8WLVFeHJyANJ1rU9
         +HiAC1t8htNZzcIVCynP2pw5v+1uFyinystkg2QU0EyKLnhaZYnTExBzsmDaNNpZUVhc
         RSZIszEBgeXM10lsgW9Rylv73kTQfpxAMrigNAd46p18W7Qbee7M63FKgoOuzhhGSUoV
         5W2A==
X-Forwarded-Encrypted: i=1; AJvYcCUfr4FYqBxvv4s4JrIJHYokqJKbpOy9p/5RdCuwta5Zb6JjN8IReKyKwHM9fs6lpzE3Z4G3q09bWkQGGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9A8Bs3shALMYniB170IgDC97hDIF2IdgYgDfTJQjYvbZe1UNA
	Kk/hdtscMo4tWS9OAjqPU6P56I1MgKzM4ucBHyywRd3cEUJLJnWXPVOLkJCkQegGqVtyb4EYm22
	ifbin9XZ7+Tx8XWVzAMlTa1ppny/j/4dFhjOO2CymGFiSla34h3I2NDFToibKuH6O0QjD781CIk
	w2JTVjlsYwEKmtVh62HoYGkiag/iO/fgBxJxMEdiFFyjxquEdHPCSB//RO9NgZjWZG
X-Gm-Gg: ASbGnctzI8j5ptN9jRrL4YkqBaUhya7Eyyj1+QIbhlGCMHfMRZSmz2eBld8hKdZga7J
	uoiGiQwjTRcOH2lUMrYQLD3kws/WtkGBmMDI7IbcYDpn5fAHBJClTnX9RjTn9Sg==
X-Received: by 2002:a05:6808:1a22:b0:3e7:5b06:ff61 with SMTP id 5614622812f47-3f392324bbdmr2004976b6e.21.1738930914177;
        Fri, 07 Feb 2025 04:21:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0nrruP1KWAtV3Ixvpat5sYozBaFXe8iNBwq/tYngmUIbKou/lN0W5ZFA5kCc2px9kPN8lYrh9JqD5uo1u+aw=
X-Received: by 2002:a05:6808:1a22:b0:3e7:5b06:ff61 with SMTP id
 5614622812f47-3f392324bbdmr2004957b6e.21.1738930913755; Fri, 07 Feb 2025
 04:21:53 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:21:53 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:21:53 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-2-e@freeshell.de>
 <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com> <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
Mime-Version: 1.0
Date: Fri, 7 Feb 2025 04:21:53 -0800
X-Gm-Features: AWEUYZlUXTw9uJtoXI-0CyJ4qca5NzN8JB2qd0nSma75DDzMHwSqSLFJSPEnyhI
Message-ID: <CAJM55Z9HTLoE3ShMfyqN=-KeC+EY_kQ+JSvFpxpX1gumio1Brg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: E Shattow <e@freeshell.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_042200_578631_B9B43D0D 
X-CRM114-Status: GOOD (  25.66  )
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

E Shattow wrote:
>
>
> On 2/5/25 02:16, Emil Renner Berthing wrote:
> > E Shattow wrote:
> >> Replace syscrg assignments of clocks, clock parents, and rates with
> >> default settings for compatibility with downstream boot loader SPL
> >> secondary program loader.
> >>
> >> Signed-off-by: E Shattow <e@freeshell.de>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> index 48fb5091b817..a5661b677687 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
> >>  };
> >>
> >>  &syscrg {
> >> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> >> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> >> -	assigned-clock-rates = <500000000>, <1500000000>;
> >> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> >> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> >> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> >> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> >> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> >> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> >
> > I think Conor asked about this too, but you still don't write why it's ok to
> > drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
> > respectively. You should add this to the commit message itself.
> >
> > /Emil
>
> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why tweaking
> the frequencies and increasing core voltage was ever needed.

I think it's quite common for SoCs come out of reset in a safe slow clock
configuration and then expect software to set clock speeds to what the chip is
really capable of.

> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate of
> CPUfreq by setting PLL0 rate to 1.5GHz" [1].
>
> Since [1] I have had problems with several passively cooled Milk-V Mars
> CM Lite systems powering off due to thermal limits. My experience then
> is that the specialized 1.5GHz operation is not appropriate for all
> JH7110 CPU board layouts and applications.

If that's the case then maybe only lower the clock speed on the Mars CM Lite
boards.

> Hal says I failed to get these assignments in Linux to work in U-Boot
> because U-Boot doesn't have driver support to increase CPU voltage, and
> Hal offering to add this to a driver in U-Boot... but that's the wrong
> way around in my opinion, unless there's some defect in the JH7110 CPU
> that it won't run reliably with hardware defaults.
>
> 1:
> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivetech.com/
>
> What is the correct thing to do here?

I really don't think slowing down all the boards because of missing code in
U-Boot is the right solution, but Hal also answered in the old thread.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
