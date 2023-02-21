Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A18C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgEgos1H/9zUpfSbe4u7a4I2VfwOyutIGbLosyvoBV4=; b=zgpoDBkXoyBGMa
	obaXA9i6yWTBx14fDnaXyYLelgrrc357tMjbQkSLqMFCkOkvGSBPGglRcx00PWkXdDpnXbzz2Es7I
	uvJpSlx5UBqNfoYx1waVhzekzgzwpn+2Xe7XCqwTREsUsuXQ78oD0A22Lo+K1qXzdpm1eq8oqy1zW
	lFh6WQAxcABUHgU2cOrqLnoGdvUDo+PZfxshKr+lxjR15ucChEKxAoBzs3NDHw/KeDylhdnLFBdhk
	LNAnD/str+38MZTOTFbWXfdCpBz9sySzQ+hbQUwSmT19iKh9vRVpvhgblWzZezPf0KpBWZT9oDkrI
	9ScuBtA8NrlE8q9yjacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUm7-008ka2-8t; Tue, 21 Feb 2023 15:41:51 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUjq-008izG-El
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 15:39:32 +0000
Received: by mail-ot1-f46.google.com with SMTP id r23-20020a05683001d700b00690eb18529fso1047823ota.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 07:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5/tMfieURLcBSj5dsmqN62a4IUK2Eg+XakNMC0OKXU=;
        b=B5UM92PWVYoMqCXIZn6QA34ng6l6VzXgUpzDsFd+/epjEi6K8EptRZWqO0VaIpdenK
         ad2KtOv0o1Gf//ttYtamyVFMgQkotUyVl6625F/EFx6TObNLZTbhSzoxUgFKZ5Ytzbxt
         Fm5j3YPS4APk5uFIx3zmRa+aA9UXf767fVKdJQ6rCHTU0yf1qZFDmmzZPfSKK0F/g2oY
         ayHDJTz1Gu4MrGLmOoS8dK046nbIjiBAIiq9bwRrff38vBgQCqd80XKZ4vBMsm3aQsnp
         xiljSn80s3CXZ6WpMvckJbOsE+gw9vb7hvrzGUjFA8S4Jl7o/uwMj0vLRlD5RVU4tZho
         F57g==
X-Gm-Message-State: AO0yUKWpaoOzwnbTuPfuyEJPr+7ZH9PLAxz2okTMcKq5hBIz/ZRF91NE
	wvxaIUJv0DelKaXdKdRirQ==
X-Google-Smtp-Source: AK7set+5D9u532a/FkmP73W9cjxPme9PnhFyfhuayG1zE0gSufgX9Q0AFXayW6atHjKU2bJCTj4bXA==
X-Received: by 2002:a9d:1d0:0:b0:68d:41b2:5b75 with SMTP id e74-20020a9d01d0000000b0068d41b25b75mr7462876ote.11.1676993969090;
        Tue, 21 Feb 2023 07:39:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q7-20020a9d57c7000000b00690f7c779ebsm1218195oti.7.2023.02.21.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:39:28 -0800 (PST)
Received: (nullmailer pid 2584244 invoked by uid 1000);
	Tue, 21 Feb 2023 15:39:27 -0000
Date: Tue, 21 Feb 2023 09:39:27 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, linux-pwm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Sagar Kadam <sagar.kadam@openfive.com>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH] dt-bindings: drop Sagar Kadam from SiFive binding
 maintainership
Message-ID: <167699396496.2584137.12786082916323503594.robh@kernel.org>
References: <20230217180035.39658-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230217180035.39658-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_073930_549597_A0831DEA 
X-CRM114-Status: GOOD (  12.06  )
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


On Fri, 17 Feb 2023 18:00:36 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Sagar's email listed in maintainers is bouncing as his division was sold
> off by the company. I attempted to contact him some days ago on what the
> bounce email told me was his new contact information, but am yet to
> receive a response.
> 
> Paul and Palmer are listed on each of the bindings, both of whom were
> alive & well as of Wednesday so the bindings remain maintained.
> 
> CC: Sagar Kadam <sagar.kadam@openfive.com>
> CC: Sagar Kadam <sagar.kadam@sifive.com>
> Link: https://lore.kernel.org/all/785425ca-4000-a7e4-16d6-4d68c91b158d@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Palmer/Paul, as mentioned Wednesday, here you go!
> ---
>  Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml | 1 -
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml       | 1 -
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml          | 1 -
>  Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml    | 3 +--
>  4 files changed, 1 insertion(+), 5 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
