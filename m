Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C816CDD1A4
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KCbVFZV2+NYP+3WZ/M/EGDhHGoxGOE1+pRqATdMkFk0=; b=2JFdw0sBTWOj1JXVjukmue3jO6
	ibHvqEz1Vy2OzhbflKvVc0nN2bNAhFNwnradHACYK1F5ZLVXv7oLtrI02Q8W1/ywIxAJi4LYKfJU2
	uMVLe7+qUlAHmVLxhFsyXi4yv9YHF8arzmOMkwlfVhB27oo666iRou/ibXgafB5QCdkyhfoI87SIc
	RCnE1990buN2dZ5lz2DKu865HZfWd+sbaEEFUfV8DH1ghN4JaDRQQA38lSIYx4iMpTpjuvbdaoMol
	Q0wbs6+7jkIw5aU+Z45VB+wDHBjETsoq96nwnOP1qLeNKSr/oeyKN59fGgUNEDUmtrR3XVsbnBwVp
	eN9kTq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suAc9-0000000BCXJ-1B5m;
	Fri, 27 Sep 2024 13:02:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suAVB-0000000BApm-2DAi
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Sep 2024 12:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:Mime-Version:References:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sSmJYgv7I+zUFEDVZuQHO2YXTAln9N/geQIOSH+hGyE=; b=S7ioRtgS9nVk5aTEOcq8RikCWD
	MoKGJBMA9MrgzD5lS5GhB5F/t2+rODkEx0cIkb/25oEGRpSIQAdPvxpF6bf61QQR5v7R0ZbRGiKjo
	l/d+Uw0WAdbJuTeaQVXJqLAR2IdcqYIOkUOlFtQAMRIo9Z/qe7xoygGyHeBfYyPu3uHuyVzRzLwaV
	qs1DrOfkT7UE8rzMhoM8m2EKsxUQJA8NTAbJbzONZWAIHCmjfOtUhl5L1kZvMo+UR66q8koNpuXLI
	5pr9RspJGdlFMrmr8lbHwwz3zrRTQsFfNbZ16LtL9cW7suftDvEUgOZ0LlTCgHgpaCIo2ijlM1ppq
	3b0ybbSw==;
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suAV7-00000002Lnp-3Zi4
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 12:55:15 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CC6053F6B0
	for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727441708;
	bh=sSmJYgv7I+zUFEDVZuQHO2YXTAln9N/geQIOSH+hGyE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Jx1NlAyolBPlsuJRz/UbLdSx9l48gjrjJKZF2B5T5M9fzqL062EpiJDgsjVn9GyP4
	 4t8RIh58UH5HM2xi4FxuWFDvx+NuoFCEhwNQ0Qq2ScZSkE5ZCpz6N0WIBxrc0fm7ld
	 pLRvHs8qfKHE62zdOkEYof4eIi/Q+jqIVHkhANMaEXSD+nOH6AzNUMGoQYLE0psQd4
	 /vZn7WLaGoNnaZfVU/ycU0PDHGAEzwDEk1uKB0b9FoVao4qok6q1orQ1zYviyG7+4g
	 hj8ImvZk/tb3/2ikaeJC5fYpNu6kMWnxNZw+L3tvp1MQF2l79pd6IIww1RMECNSaBF
	 ktoqIA0I92Szg==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2870d506163so918136fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 05:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441706; x=1728046506;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSmJYgv7I+zUFEDVZuQHO2YXTAln9N/geQIOSH+hGyE=;
        b=A7xE2WK2pjrOFzuwukn3XVQHU64OIs1oJU3o0dAPBoigYJZkeKKr2OYauthJANyuK7
         HTqrrd3j6Ks8g2blf+2ML310hpRxu8luX5WKSxcdb6m1MpuHS2oE3mqlq5HKr4U9arfK
         k1KIwzup1tOek5FdyenzRBYMD4D2+ra1QNve5Y0mZGQCg8oU8CjI10Sm1giRdNjYxD7z
         rbr23zFqfm0+hgkvdx5r5Hh/NcDMR+bx0zw26OKnc1HEuSrAtCqJ/ZwPK2flwbwggutj
         TQ4VuDxoPq83PJFo01s54BIVHmAsrKIozUga2pqBfhc38WymaW5mPslz00FVYTAM/bEg
         1lmw==
X-Forwarded-Encrypted: i=1; AJvYcCUu/EUP5mrDRa5kurCspQqftbFqnS1N4lkTu/KLc6cZCj50q5ieJuAXmyKUzLyEMmhP+fenMRhPNrwN1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQr2Mt/NF3FXL2xAF3RU7L7c9y+V4RZn9SZSnwdBhozhQzPpFV
	m6HAn4xK0iOz87BqsLa7D5dMcKqGZSEyd83OwNHNn5P7b4KE1K6eDVbkkw8GG/VmVIU9GCgwdzG
	YqRN2kVdrqKHxP6oxywgTOGZ/CQuMJV/N0Gz4NeFP9Ht+nAfsZ71ruigYam5NskUUwLae+BBdss
	WvNxDVzAjFcay1npXR1pSqmmAg1BvgsHU1sO2DhmAAs4dURaRFTdvX/glS
X-Received: by 2002:a05:6871:890e:b0:27b:66ea:add7 with SMTP id 586e51a60fabf-287109f5bb4mr2306187fac.4.1727441705674;
        Fri, 27 Sep 2024 05:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq2edOIUBYR+Xf5m9TknVcpYnAPqK6sQBsqv8AamrOSSkCMEyyDtCAwOwZQ7rY9zd/qv/ETMaRzLJy5zKgxVE=
X-Received: by 2002:a05:6871:890e:b0:27b:66ea:add7 with SMTP id
 586e51a60fabf-287109f5bb4mr2306155fac.4.1727441705340; Fri, 27 Sep 2024
 05:55:05 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Sep 2024 05:55:04 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com> <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
Mime-Version: 1.0
Date: Fri, 27 Sep 2024 05:55:04 -0700
Message-ID: <CAJM55Z-FLmpFfisNpJi8FP7o_5mwoDa7r18VXW7u7nF0V6oiRw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
To: Drew Fustini <dfustini@tenstorrent.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_135514_235725_D62D0B54 
X-CRM114-Status: GOOD (  11.15  )
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
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: change apb registers from syscon to second reg of gmac node]
> [drew: add phy reset delay properties for beaglev ahead]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 135 +++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++++++
>  3 files changed, 276 insertions(+)

...

> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index ca84bc2039ef..d9d2e1f4dc68 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -11,6 +11,11 @@ / {
>  	model = "Sipeed Lichee Module 4A";
>  	compatible = "sipeed,lichee-module-4a", "thead,th1520";
>
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +	};
> +
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x00000000 0x2 0x00000000>;
> @@ -25,6 +30,16 @@ &osc_32k {
>  	clock-frequency = <32768>;
>  };
>
> +&dmac0 {
> +	status = "okay";
> +};
> +
> +&aogpio {
> +	gpio-line-names = "", "", "",
> +			  "GPIO00",
> +			  "GPIO04";
> +};
> +

These GPIO line names does not belong in this patch. They should
already be included in your other patchset adding the names for the
other lines.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
