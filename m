Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D26C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KM3A1W9SpggEDtNeBRo9VAN0WUpMFfx+IvWl/RNdFw=; b=XV7V3qhEieEIZ/
	UuwmRKF3UCP8ZJ/s2jx5QYqeCSHb/cXJkY6Pi1OrNyU8YKpjOHFKTp4amQT7rIJroO9Tm2iW7VKJx
	CjtlOGixAVxxegd+PLpi788EJJGgef1FNINRAPQ65OD6ypkwNuFpXj5rOD+iCDbQ4yrhO8O02kmTE
	zEpwanQRCxMfoTzwlFdM5aqCvCxVJUHSTrjoqIZrRDFGU7QjyNVBuM12AmVKO4XSXaiNrofxTapWm
	2HhVQNNxyZrDcP/xxgGC+4g7HDEa+noCE0Hvpyq0Qq094RoNjj03SUjS/yksPGk2TVPtzmM+dI/6K
	lWkD5Xe+KC0+axy3UlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGit2-00F0c7-49; Wed, 27 Jul 2022 15:23:48 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGisw-00F0YE-6y
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 15:23:43 +0000
Received: by mail-il1-f179.google.com with SMTP id l3so197238ilo.4
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 08:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z5vpqZfmFKwVrz9tfkSeyBo2CWCpn59/Ud7Jqj6aBSo=;
        b=zAenoKwD3Ni/GgZbk9px7tNHaj1aG5QG0mN0kUDP/440WQ4WN3Msu5mE0f8yLXrLTC
         4uXp6qtpHNjrp6El5lvmyGElZYDBW59auwXgiIwFGvrdn0T0H28DidSrWV8EI3YKokvZ
         bQoy0eRa6aSN5MiIm00220C7bAyX8B+0mkIiSZbCaq06nXqGkexywrcK08OQTKlZjJSP
         HVWUfN+1ILYQM/+nLChDbagSGdPpRDQSbnz4UohN7HfmzKBB03OPL/YNsiE8VohsURVf
         JHHQ3dAJMLoR5EdribLlBKjfFRSnmCEkqqK6kt1fkCTgcj0zPzeKlvDM99vuvqWqPq/B
         8HhA==
X-Gm-Message-State: AJIora+99oJwjQ7T7Jix6PJf9IAUJ8UVQKuBEYI5nqs/foNb/gL5+tyT
	xpVqg5Rcz5TC1ETWwX9d1Q==
X-Google-Smtp-Source: AGRyM1up1oPDnQEY9tNohSqCcyJOjFy1DCKFfz/b2rGCtlJVjvqTI93Dp4hC6w8f3DmUzFX2ZvN2pA==
X-Received: by 2002:a05:6e02:1c8d:b0:2dc:8162:282e with SMTP id w13-20020a056e021c8d00b002dc8162282emr8837058ill.5.1658935420412;
        Wed, 27 Jul 2022 08:23:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v5-20020a056e0213c500b002dce9ddcb08sm61488ilj.30.2022.07.27.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 08:23:39 -0700 (PDT)
Received: (nullmailer pid 2696011 invoked by uid 1000);
	Wed, 27 Jul 2022 15:23:38 -0000
Date: Wed, 27 Jul 2022 09:23:38 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Atul Khare <atulkhare@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: sifive: add gpio-line-names
Message-ID: <20220727152338.GA2695979-robh@kernel.org>
References: <20220726170725.3245278-1-mail@conchuod.ie>
 <20220726170725.3245278-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726170725.3245278-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_082342_274318_07F698D4 
X-CRM114-Status: GOOD (  11.20  )
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

On Tue, 26 Jul 2022 18:07:26 +0100, Conor Dooley wrote:
> From: Atul Khare <atulkhare@rivosinc.com>
> 
> Fix device tree schema validation messages like 'gpio-line-names'
> does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
> sifive,gpio.yaml'.
> 
> The bindings were missing the gpio-line-names element, which was
> causing the dt-schema checker to trip-up.
> 
> Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
