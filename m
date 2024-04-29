Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60BFC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sU7fycHHVul6THcg7DCeXbSDajYD2tvl18Y6FIpMW6M=; b=lJBlMbV+d1y/NBWg9wZujoPdM4
	xOxzVBKgPI+L/ITGouyGeMthEW/gk/KPxAdtjCESTkcN3elYz0+3EQ8I6qZZtZeSh+/zZFeT2z+p5
	Fx3wx+LosCxAWgtU1IuVkp/wOjLo1tMLlPfWGLgL30FkC5a3ZYJ0eApS5qKQVPIUGGiO8uVmw4fwb
	nF/8H6YTZvKgWkc0oi5kt93OT7uTvvoMEySQyjapLKBdZ7VR4VtqimkeHkq6ND2SfHFWMml24d7qd
	yqWbBCin3/26s2tNF5VJlZC5VS+uOKziHj7pOCzhJtrQYhpW5SlgPfcTMuRw+exS3/69Hj5jRxVmd
	e1O0v+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RLx-00000002zWk-0zmv;
	Mon, 29 Apr 2024 13:47:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RLt-00000002zTp-417D
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:47:31 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 931673F8DF
	for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714398446;
	bh=vPe2VoBRc5KJIfuEGnKBAiJXDs81y/WyrmgODkiYq9Y=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Hi7ItRKyxwvkLed5tfDcrf9haM/Qn4W80r4TR81ZztrmQ7XkpN/NLTY5qZ2kf2GV7
	 pUwH6dZovQ1cL8LeWULFbhx0JKXej1MiVKZJdeRwtMZzPBZZA5c3x7bepu6syylXiV
	 Tphuvv4ONuVqH416PQkeZuaNdMXrPlzKoNYCRxgRQDGte8nm69gHsE8jOTbZrUcxwf
	 MvTJZKibgMxgerI/UytSRONrvmPWBSDli6InxTzmyZTotWU/ICBG96wbVaDnb5SHeO
	 yzvXu50dzmQW0DpIFrEbiiaNqyEJ+CkEhYImkQdNiP3RG1YMr6J7hULq3ynHTfAyNV
	 oK5nrNXsy/iUA==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-78f08178393so1073369685a.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 06:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398443; x=1715003243;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPe2VoBRc5KJIfuEGnKBAiJXDs81y/WyrmgODkiYq9Y=;
        b=hwMyEY9QwPueY/nzNGe/mYmWZy6xTrr9nu6g5QevXveZooXOLhJ0VbZ3B4xwUTPpNN
         AJsGkCYBceKp2t8sD0iAuWdy03nNwoKxt7MvxtiHBDb7S+irI1VGQci2Psk0tzFAoEAK
         rW0B/pbuadi2H/0f10kVlu/WUwkYOiwXMduSAgMRvqh2H+UppCxiEDNe9zq8T2lAhEre
         8oszu6WttA/isSPtQb0yHES4nwaMvuzsQ7oxkN0YiTpFzmg1pLoxs0iGyxQxImTLEltv
         WR52ULY3I7nJzRW+ILg5HgtsY8MUKZjfALPnnZNgZjJFYPkfQc0GeRkEUPIQeZPZ49qq
         21kg==
X-Gm-Message-State: AOJu0YyBOkFbmEEOs8rR8yREwTjU6AfnaW8AT6QT5AwBhIiFGfr5L2ka
	rYuNiFkPi2YgFkoxucg8qo+f8ZbaxVnUs93k+S0lZzyT1E+2MUsBFmrTOC3vWJD9uG4yL5OxkEk
	pnTUd7yvHUj1HMt42psVwR7+0+A5amBTSbR3n4XYTNKTxieDr7jkIlirk3QAGVaY2ZecNlI0Oj5
	vmmXe56RLmccQ9JiHkJSaVvFXETlMBrE+ilzRAUwh3mFwvKDKaPz00pw7M
X-Received: by 2002:ac8:5ac8:0:b0:43b:758:6d0 with SMTP id d8-20020ac85ac8000000b0043b075806d0mr1471467qtd.0.1714398443443;
        Mon, 29 Apr 2024 06:47:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8xb8MBQPl+w0n6G4E/6PSSCVvVKCj058nDjmR95TemmORiesDJfSh1k5bwOiMTIeHe1UFlwrkwdUpuedliyo=
X-Received: by 2002:ac8:5ac8:0:b0:43b:758:6d0 with SMTP id d8-20020ac85ac8000000b0043b075806d0mr1471446qtd.0.1714398443156;
 Mon, 29 Apr 2024 06:47:23 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Apr 2024 08:47:22 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240429001317.432-7-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org> <20240429001317.432-7-jszhang@kernel.org>
Mime-Version: 1.0
Date: Mon, 29 Apr 2024 08:47:22 -0500
Message-ID: <CAJM55Z-te=b2ADP6vqjB+GSLUs5_T+hTCQVu2jCTqp-zqanJwA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] riscv: dts: starfive: visionfive 2: add
 "disable-wp" for tfcard
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_064730_177836_92D36981 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

Jisheng Zhang wrote:
> No physical write-protect line is present, so setting "disable-wp".
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index b6030d63459d..e19f26628054 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -304,6 +304,7 @@ &mmc1 {
>  	no-sdio;
>  	no-mmc;
>  	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;

Same nit as patch 5/6, but in any case:

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>  	cap-sd-highspeed;
>  	post-power-on-delay-ms = <200>;
>  	pinctrl-names = "default";
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
