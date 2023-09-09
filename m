Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133C5EE57CD
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 23:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5DjhDu5drjZIDZrKkDps3YdTtTq838amk+7J7+wS1VI=; b=V0oFdRN9QfYlyTw7sLp4DcR5oy
	ggoL0R+DICyZqBf6c8Vko6s7iQCq/+wF87T8R3mKS9L9fLVzYmtLwycUBOY83/9Pi4g5wc3j4P9vp
	QNaHwuG9t6IrGiQXC6q4CM2iTKdy8PXIuQeVmbGCe02Dl5rT6xwaEP7Dmo8nRrIfz6yj3Y9eesZRw
	+1pMv8D+LKX6hvquqZg6bwdOkFcjRaeAvLJi+7GCEN/zJut/HtwrS7GhFab7sM6y1GcHk7OLCQidL
	F7100ZY4NU/yaCGmxw0+Y7WO2guMCvz1YVQp/zP92ydVG+FJo6Cxa6n9bcS0YdoLi6fuIOAs26GRY
	F082odRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf7Ir-00FvRa-0l;
	Sat, 09 Sep 2023 23:23:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf7Io-00FvRA-0n
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 23:23:47 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C6E083F13F
	for <linux-riscv@lists.infradead.org>; Sat,  9 Sep 2023 23:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694301822;
	bh=g38mnsqH2vU/74bmC9caLvWkHP+AyVA0JTu2qX2Y3fc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=A7MjM8AiNyKAAxHfQXK7OMgnD2qlHb+AkiLGTkegEyOl/Th4Y3DsDd9TattRjgCAe
	 /wgQLmW1Bu9UNIGjPQ43NxvGy53McbRE8FmTNLLsekneQNZCLyMcjSmP8b3Hpnn8si
	 +ClFV9jrOKM6hxQzE1KyhVAiaPASTuvxLQWWMCI4SjOU8NJaVgyj4n4RN6We700j8p
	 AoxKRil/9qgKMmbla/gkEctwmm0tEdBuZrwv3lVU8Y1doh7F4w9ZmgXGC5Ijnz3FyE
	 v7zScmqyI6UMoOSCo/YT13UnXaQRTvH7kGzxGX6z7a/W6EnRXonTwYui8uA+G/cenI
	 TnbXZLjuA8hag==
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6496d9acb98so36552266d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 09 Sep 2023 16:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694301821; x=1694906621;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g38mnsqH2vU/74bmC9caLvWkHP+AyVA0JTu2qX2Y3fc=;
        b=YPXSUxxH8MRB171O2lLjscf1kPeLmGMh2m7IRFijfuYvnZ/6Tg5sfzuXQTqycdjpMe
         fh/B1rMnBrqoZIDQdMKIXib2COrlMxRiVaRnMT6kXuBj9JnJgWcTntkDO98uJoE/NHiP
         03Rj2911y6jYeDGSrYmk0qx59+Ou/S6H9wLSOVynweTv+LQPv1mpMQJOMzxPeCy6LLi3
         sW4FnNZ54pESoXB7kn9fN0bn6r+kVhXJrVQx/Fus52Wezpv1iv0N4jzkeeIdKjd3+92r
         9wVp5nwCHGVZf/PQ4FdB2mvxeALzvi4mMhspAeX4Oo2d99TRWhrjgIv9rOq5vTuPVVDM
         lYbw==
X-Gm-Message-State: AOJu0Yy2Qp46oonljurRRTwKT+SenYlJ7VwMi+wHV6SU6SaG7u0FsQna
	OJCCQvUSg3Fq4Y5NGhtqBxQiSBx5QHa5FcOsM/kv89Nz+AyQvIwinEOOTSWKc8VZtDMIkc3j7g5
	Z4upfL0TWvNSaqByykp1rldRAJHgXMp+aT4p1fyLjJZVoGjUS3nH4YR4NZwH9Sg==
X-Received: by 2002:ac8:5fd1:0:b0:403:3583:68eb with SMTP id k17-20020ac85fd1000000b00403358368ebmr8328318qta.19.1694301821759;
        Sat, 09 Sep 2023 16:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEligNCMo7eGYPMSQx5GN7uRZvx7+f7h9gFSFY5WF33IvudVpZLJQrGFnyPQi+7GeUnGV3ayeuhZMSG/0dtB0o=
X-Received: by 2002:ac8:5fd1:0:b0:403:3583:68eb with SMTP id
 k17-20020ac85fd1000000b00403358368ebmr8328310qta.19.1694301821519; Sat, 09
 Sep 2023 16:23:41 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 9 Sep 2023 16:23:41 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230907053742.250444-4-xingyu.wu@starfivetech.com>
References: <20230907053742.250444-1-xingyu.wu@starfivetech.com> <20230907053742.250444-4-xingyu.wu@starfivetech.com>
Mime-Version: 1.0
Date: Sat, 9 Sep 2023 16:23:41 -0700
Message-ID: <CAJM55Z9VkLLN9y=1ZBb7g+23vWomgJHKpGe0o9sSv0UEQsdJRg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: dts: jh7110: starfive: Add timer node
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_162346_436655_DFC326E0 
X-CRM114-Status: GOOD (  11.30  )
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

Xingyu Wu wrote:
> Add the timer node for the Starfive JH7110 SoC.
>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index ec2e70011a73..84bb9717be13 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -502,6 +502,26 @@ sysgpio: pinctrl@13040000 {
>  			#gpio-cells = <2>;
>  		};
>
> +		timer@13050000 {
> +			compatible = "starfive,jh7110-timer";
> +			reg = <0x0 0x13050000 0x0 0x10000>;
> +			interrupts = <69>, <70>, <71> ,<72>;
> +			clocks = <&syscrg JH7110_SYSCLK_TIMER_APB>,
> +				 <&syscrg JH7110_SYSCLK_TIMER0>,
> +				 <&syscrg JH7110_SYSCLK_TIMER1>,
> +				 <&syscrg JH7110_SYSCLK_TIMER2>,
> +				 <&syscrg JH7110_SYSCLK_TIMER3>;
> +			clock-names = "apb", "ch0", "ch1",
> +				      "ch2", "ch3";
> +			resets = <&syscrg JH7110_SYSRST_TIMER_APB>,
> +				 <&syscrg JH7110_SYSRST_TIMER0>,
> +				 <&syscrg JH7110_SYSRST_TIMER1>,
> +				 <&syscrg JH7110_SYSRST_TIMER2>,
> +				 <&syscrg JH7110_SYSRST_TIMER3>;
> +			reset-names = "apb", "ch0", "ch1",
> +				      "ch2", "ch3";
> +		};
> +
>  		watchdog@13070000 {
>  			compatible = "starfive,jh7110-wdt";
>  			reg = <0x0 0x13070000 0x0 0x10000>;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
