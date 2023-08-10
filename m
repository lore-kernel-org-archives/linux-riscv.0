Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93CDC001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEAfWTjM0whKIBr0auMop/0znvm6R1AiGxg8414HTWo=; b=d3QT4atyBuCkuX
	Pdb725tAcWqiyhDCfMF+YxIp3zyDYj4JQRBiQvlHu5LSZeRfaK2Z0D/2e4cyiOL7rqCXiL35mGuWC
	j49NYAl4qwJaEnnHMszjtZ59nF3vnCQpiNj0tiujcWqb7xcBMSsvmJ940OJyUCx/XelaVkyGO3l+7
	PtGfAKB4N/9i4nlU+McBDMX/zKhWjAhnpJy/Ip0g5m21DGELU/8rRVzCwO9uPiRLhgS+UgjTnGs9n
	qNJbf069EcRgEJQ6QyszXQ1dJHiQ1m0BE91Pbs+1LbQMx4r0ynEB2KCPdAVdsawI9SzfsA3RVg08j
	QG62SkzBrzpOihJJwAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3tp-007S1F-01;
	Thu, 10 Aug 2023 11:32:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3tm-007S00-0I
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 11:32:15 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D69E23F545
	for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691667132;
	bh=NZfJaleioIc/dNSS6llYa1dUh5p+WpAGVhsLf8ndx7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=jlWJKwKF1nhDjzkflti59fnvxrhIU03aZ4CyN2YjHO6DVNUqceGgtBhkvAYk+iHGw
	 HCPPycHCPYJxw0MGC6NI+8QkNEbONb1xPsdIiUPMXAhoonxDw/EbHRPI1beQU69RZq
	 /YzKJ1OwlrBx4nDF5uyvhqQqQYat7Iw/+0H77DZYR3yYUe+/1rbLlPmOKdXXqo2WUz
	 tExHaJq9FybZZEWHnckmWkEAsKRJ8mSX3LmJeghZXyc10w3W9p8DgzJJHJOPbUL15V
	 fyif9/HySS24U8+U4gPvEeHKR9OEJ0t09ay+6/w3llS/+C7TWLtXKdl6XubdCZBb3w
	 LYvte5PSPY7cw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-40ff829c836so6796711cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 04:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667132; x=1692271932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZfJaleioIc/dNSS6llYa1dUh5p+WpAGVhsLf8ndx7w=;
        b=SUgAF2zgi+ozSR8dGCmuYAoOKKEy8Zv+LwBrE7A78ln779jReQr1W361ltBs7oNvM2
         rcUPy1HH5JsoFJFcz2TXZfu74moVPsj4YnadtjwIGUeMeF1ujDKF7M7wjWhYa8OgH1dp
         YhFJq0CDQVnQLosX4HHemTY9ZtpLfxyu1MdwjormZ76Wyz65kJQaNbKNWS8AU1zPrWL+
         w55VDu/hrU4dAxXXunsozt0BGcqa/mlSRI0c27Db5J6GMrRx8uTX5xAW/jxGWlUkf2cS
         g8zl4SSQrySr6lmLKIoztryhrVLH5M3KCINFaoUoQKqFAb6eWVeGjUzFQn8YEQVoSwR2
         LTmw==
X-Gm-Message-State: AOJu0YzAIN53r09TynY2jm3ipvxabuxYliyDPE1Qx24p0z03o5wf9ZOG
	EFerOM1rv9ApygXNm6yTkY6TWROLa6SZhTqjiJHEV44BU2AAjByCfdya1/SwMNIMbfXQ8/bIe6l
	3jqqEgZrUdusexViulU3gliACa9/9ejwOoC1jmjloPJpSFkIs4kH/IzvCxT4qHw==
X-Received: by 2002:a05:622a:1041:b0:403:b4d5:a5ec with SMTP id f1-20020a05622a104100b00403b4d5a5ecmr1788506qte.4.1691667131792;
        Thu, 10 Aug 2023 04:32:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyU7SG7jGlFoDlU/yvYZWOWhmpI50a0rec0itMvKayLP30Sx0QIY1LoEjWPmvVEawaNn3phHjhl1jxHReilFU=
X-Received: by 2002:a05:622a:1041:b0:403:b4d5:a5ec with SMTP id
 f1-20020a05622a104100b00403b4d5a5ecmr1788494qte.4.1691667131559; Thu, 10 Aug
 2023 04:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230809013917.81674-1-william.qiu@starfivetech.com> <20230809013917.81674-2-william.qiu@starfivetech.com>
In-Reply-To: <20230809013917.81674-2-william.qiu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 10 Aug 2023 13:31:55 +0200
Message-ID: <CAJM55Z8EtUjfjF04jcNwdyPzx3VmEWZs14Fr-9PDiqXcHDOe9Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: enable DCDC1&ALDO4 node in axp15060
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_043214_266543_0178254D 
X-CRM114-Status: GOOD (  18.24  )
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

On Wed, 9 Aug 2023 at 03:41, William Qiu <william.qiu@starfivetech.com> wrote:
>
> Enable DCDC1 node for vmmc-supply and enable ALDO4 node for
> vqmmc-supply.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../starfive/jh7110-starfive-visionfive-2.dtsi   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index d2f3b9eb859b..d67e26b9c791 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -165,12 +165,28 @@ axp15060: pmic@36 {
>                 #interrupt-cells = <1>;
>
>                 regulators {
> +                       vcc_3v3: dcdc1 {
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-name = "vcc_3v3";
> +                       };
> +
>                         vdd_cpu: dcdc2 {
>                                 regulator-always-on;
>                                 regulator-min-microvolt = <500000>;
>                                 regulator-max-microvolt = <1540000>;
>                                 regulator-name = "vdd-cpu";
>                         };
> +
> +                       emmc_vdd: aldo4 {
> +                               regulator-boot-on;
> +                               regulator-always-on;

Hi William,

Just a question: You mark these regulators as always-on, so they'll
never be shut off even if the device is suspended. Is that because the
mmc driver can't deal with reinitializing the mmc/sd-card if the card
has been shut off while suspended or is there some other reason to
mark them always-on?

> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-name = "emmc_vdd";
> +                       };
>                 };
>         };
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
