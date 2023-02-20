Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ECEC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdL2SUJ/zEuEaPyiouMJ9g2bcZpLbpr738PCWV+Mt90=; b=Am5Sp7U0VYQPXW
	A1aYRj/w7daU9T6xlhV6IeD6jVouAlU7TIBycyaK3VgEYejRc5VaRyslSjDxpgtfbaVlpSmYXjg5c
	8YiPdWq42c0BU4xAtSbZNhpROUVgS6ZHSNRPe+438XDmKAdT/7/oVhoBggINTVuI9yYt+pNpj8wzL
	Auek3k2M9OoTrM7qi2L9aA/6lHRsfYY2wuclOsxLcmh5uhmtnvrHGrA268CHe5rx3lViZ1cxppKGp
	FtDd66GYoXTcbJiLt0l3NjBzFD5l8zcCWDkYa/SpWw+HuYT5JFaE4tbB/F+qMz3VSepP8TQTSQVJP
	9P8Du+9jJhV5ZUtiZfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU6nZ-004Gve-8D; Mon, 20 Feb 2023 14:05:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU6nV-004GtQ-7f
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 14:05:43 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C33763F212
	for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676901933;
	bh=dzSoi4QFKSwQF6afiZkQC9N3RdyPdUsM3TO6tUG2yLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=oB1ImhX1lPfDvxu5WeGoHEkCEXYCBDiPw7CdOQGzQ8kYOxZa/o1dGVfxUcuJbcCbC
	 HqnzioxWinbxLNk+r6XrKNGCqMWMazzw747r7hjdGqF6xEAtyvKlXc6f9Bgcwv3cKq
	 aF0NlahJHR1fnzJTaHOCEMK7glSS2wbHmqwjf7dMiZ9t/8+186EFh5CKF2qrE0iEkg
	 83Crfa4eeU6LrSYrP8YRE9U0zi1rEvuF/8WYJ6NmYOSYhizrs4C4E5cfcpojNi4Nj7
	 XBBoQmJubcp4YfVN5J0XEeYn0/aYOzN5TmYMArYzeYKHqZuAYKXnr8X5/DhjFGruXh
	 g7RX4aYUu3lVA==
Received: by mail-qk1-f198.google.com with SMTP id w29-20020a05620a095d00b00724fd33cb3eso1175677qkw.14
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 06:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzSoi4QFKSwQF6afiZkQC9N3RdyPdUsM3TO6tUG2yLg=;
        b=DWWLyO78oft3Q8lJReIh76HyHQ3CUMKWTY8BTzZ1h2cqZYUT703Njz7BU/jTS3+r1c
         oYO8HND7PTsivZm0fy8tp5R9ITt0vzNyAkTvVI0uVXLYywAh7KuY0V5RtnU+ao/rxWJN
         M65/Sjs9jqcUL3gOcOrw+E5wpyY6zr6yNPchkA3gBSb2uF1+zFrzgYDIp+Ut5rEnmVs/
         4jQwmVziBfAJtF5BO03zoS9ttOep8GphDh+Z8gfV82y/Ps5YzG2KhUIeXTQWScSG4htY
         DjmIe1Dabux/GYLpmPiKNi5H00GNLSoar//dM3IfZaada7CO6qVOXjo/ldYerapPDGqK
         zbYQ==
X-Gm-Message-State: AO0yUKU4v4gOTBW7kSV7fPD1GvcipPZEUAi1FJa6UHrYbI2bqGF3a+L0
	cJrWq/4MZxoEPBORbfFa/+KWqDjgMKiEenKjxMjrFtvf2SRAmKwfzcbxEVKSeqhFBUClDZ1oI3F
	bFb2B1TKY64bdwLfEjZEV+ApGh3ED8Dojv4NrwJo7piVswKo8AkOaI7wMoY0kLg==
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id y16-20020a0cd990000000b00570fc874f2cmr292635qvj.83.1676901932971;
        Mon, 20 Feb 2023 06:05:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9+5IcIjvQKZqoR1+axj5VeZiHUAcZlLKVa9weRBzGDTEUyWaKv9QTowi0nMLky06a8W3KysbXpK45taPqjNlI=
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id
 y16-20020a0cd990000000b00570fc874f2cmr292626qvj.83.1676901932733; Mon, 20 Feb
 2023 06:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com> <20230118061701.30047-8-yanhong.wang@starfivetech.com>
In-Reply-To: <20230118061701.30047-8-yanhong.wang@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 20 Feb 2023 15:05:17 +0100
Message-ID: <CAJM55Z_a4SN9jYFZqnM9nrL2a-nDzLSGLbXdsTYuf0OrD-c0Fg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] riscv: dts: starfive: visionfive-v2: Enable gmac
 device tree node
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_060541_427572_08595022 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, 18 Jan 2023 at 07:19, Yanhong Wang
<yanhong.wang@starfivetech.com> wrote:
>
> Update gmac device tree node status to okay.
>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../dts/starfive/jh7110-starfive-visionfive-v2.dts     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> index c8946cf3a268..b22363d5f9dc 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> @@ -15,6 +15,8 @@
>
>         aliases {
>                 serial0 = &uart0;
> +               ethernet0 = &gmac0;
> +               ethernet1 = &gmac1;

Hi Yanhong,

Please keep these sorted alphabetically so it's obvious where the next
additions go.

/Emil
>         };
>
>         chosen {
> @@ -114,3 +116,11 @@
>         pinctrl-0 = <&uart0_pins>;
>         status = "okay";
>  };
> +
> +&gmac0 {
> +       status = "okay";
> +};
> +
> +&gmac1 {
> +       status = "okay";
> +};
> --
> 2.17.1
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
