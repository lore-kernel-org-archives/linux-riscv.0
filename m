Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29BBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 21:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYvQPmP39+R7PjLjiy2+wvEfLwNxedSP+XmhQwAo+ok=; b=v09UdqtqdM+EJh
	Ey+ZRx4UifXIm+I35buZatOhQbxvOXfShIqmrnOruLQ5FQmtjoUzQnJXCr1O3Yb569NyJhu585O4L
	hy+VKNl7xQy3y5MVU77OLnopGeL2O2wstNSmGijNgdNhGGpMgHuqnhHXx5a4v0IJUqArunSGbb052
	j8vNtLUZYfvyZgZY32fPb+hnhC0yeN9utI9jYFVZgW1oEzn+gXTJRwgJ/58qyPZAjqau2yPQbfP8D
	x3yNfPhXO7G8DAB2u/Smh6+qbxvok5nvMeX1eR2E17KrKR5jJrOoCtw1ZpMnArHHrJ/wph0J/7klN
	3jtxMfLTsJZcJqKEZwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMcVd-00BddE-Ld; Tue, 22 Feb 2022 21:15:45 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMcVa-00BdbD-W4
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 21:15:44 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 y15-20020a4a650f000000b0031c19e9fe9dso16515348ooc.12
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 13:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LxgusODP2GOfUh+GrU/i/NsPSEgZvwaQGFPVZgBGVG0=;
 b=2rd07swu/ieRiJV+IfFPBkpkDPSa9GVEPIkYSgQzHldWufmI6hin2a4LWw+OWy1ADN
 bV7Moc4UgUbRN5WI0weyFDQpzehBtYKLtiQ/cCXs6Kf72Um6v9AxiWmHstUk4CsLNDs2
 V2EGCG60sPT/q5BN4y9RUAyU4RUdowegZGA3uGN0Lk9cq0gn0rhsNk2QPhW3TPAVWToe
 QERo/39xruxWNEtRw1c2va/KHaWQgiD4qAiSr1/L7Q8ZMJcJf4KYaYW/w6X4TISvDtsF
 RkRV275X0EuL5aAwdo5YJAElnI5GYzZujtKNymZnuen/DIDt5sIi3aj/EcZEtzDFtwSi
 m0Vg==
X-Gm-Message-State: AOAM532L7ApPaBFPTnSFqV3cLRiLL1jlTDdrXZJ2upBxJksP+DY0ALNw
 f5G/txqHfKgNLeC41r5Czw==
X-Google-Smtp-Source: ABdhPJweZeM8YTKjHsA/asTQIGx8MLwhI9nfrImLfLJ2q3s2S6hi4sAwCA3bD7eX2mY/mlV4k5EL+Q==
X-Received: by 2002:a05:6870:961a:b0:d2:858c:ea4 with SMTP id
 d26-20020a056870961a00b000d2858c0ea4mr2549999oaq.186.1645564542158; 
 Tue, 22 Feb 2022 13:15:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f1sm3477355oov.45.2022.02.22.13.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 13:15:41 -0800 (PST)
Received: (nullmailer pid 3600555 invoked by uid 1000);
 Tue, 22 Feb 2022 21:15:40 -0000
Date: Tue, 22 Feb 2022 15:15:40 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: sifive: drop Yash Shah
Message-ID: <YhVSfKZbnGcGJGFH@robh.at.kernel.org>
References: <20220214082349.162973-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214082349.162973-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_131543_054768_0597DA88 
X-CRM114-Status: UNSURE (   9.94  )
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

On Mon, 14 Feb 2022 09:23:49 +0100, Krzysztof Kozlowski wrote:
> Emails to Yash Shah bounce with "The email account that you tried to
> reach does not exist.", so drop him from all maintainer entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     | 1 -
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       | 1 -
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 1 -
>  MAINTAINERS                                                 | 6 ------
>  4 files changed, 9 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
