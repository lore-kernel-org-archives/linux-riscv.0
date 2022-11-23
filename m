Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BCFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 01:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXcPB5xHB40cek6pqFq14g3uJNwwDSnnvs1RrLFnQ4U=; b=lZwchyTHwkNmuY
	rQHBxc7NyZ+aMbBx0vyqCrPpxr9voPzZcgLW8Z22b0wHgi0ocK8D7+fqvijn4lP6ArAZORBy9nvqq
	+83ZXV9ih44jTZ5AEeyqkpnDWa7Pm8LrzSDdy1IcLlPzHlpgYztqNIX8WfDcTlRVOT5siKEYDbE4e
	CEkdYjm9fo6ZTpg5/nImvFdzJ3W+TJeXhFgI2CbuxRBVAet+fsT63b35hARJdN8oppz+Qzmimyvz6
	M7WWdhXZDjJjC52j+xcUgeg16wZsQCMxoGc1HdRJZAMBCr66Iy/wfKu99J0al2ZFUctjONDW5tkIN
	XQMrdX5O21vq4nkIs1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxegp-00CgSk-F1; Wed, 23 Nov 2022 01:36:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxegT-00CgGy-Go; Wed, 23 Nov 2022 01:36:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id y203so16011550pfb.4;
        Tue, 22 Nov 2022 17:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnT85l1YGrgftRmY4cs0kf1GLdUSkFh5ZyBQMsB8/d8=;
        b=oUgfZGpfTt3n+gdaAcgz00Mug4dCBCNB/xDdXlVP+K6uV0glmqUHVVcqvQO8b0rrYS
         k3IzWT0SIbOyFZv/D/7QcoURlIYUwvOvNaTu7L+CZNAwJYt1nt0rIwdpZN55gZjFPVDI
         QJECxzixlHdMg1q1pT9qIYI9+GhiFa1fqTUgbMKyAYcqpJDuaoCiKXQVuUOwTk0jlTjZ
         3Uev4hAehD0PGurOWFjtKN6iyx6GnRSSpFJyRNen7Sb0J7XCDoK3YT/eXmH0m93Yr+Jz
         aTw2wWkj5t9YMQ8PpTDjD/+uILOjduYoHPN5Xsw8eSbyvQHXUtHPQgtQs1cq8HHs6mn/
         8jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnT85l1YGrgftRmY4cs0kf1GLdUSkFh5ZyBQMsB8/d8=;
        b=Rgi/MCLrDFZLFsxVfXmyJSLtR9FRczYrOnN5FfPdleoti3oDtC+Yu0HWNKCFDZn1OO
         CO0UnHfLdpY18BFuSu3m6TpBBR2LsYL3+Myto5yY3OEjnOVMAvJougi1XXJQN0fpqNfs
         W9ZMcwg0jcbSTXcKHc/HD6Krpvew5bDDKtZseIsZqUJkuM7qTtoBRxJHmyLXiiROQ5Oc
         o3bOtCmw0SfSxhJnoEl0KOMXyTV/9TKfg+JWFlEXiK9OHsuThbvdFXEPcZvfvET2RT6H
         KICtXJ/078SSoyzD9Vh+KSzdVdaq03mq0t4yoNe6AUrg5cnxYR6L2kyQ32uvwy/joWRs
         CtEQ==
X-Gm-Message-State: ANoB5pnPLrBEhRNGBdYzsPssWBgF2Ic222WL88C7FwOuDWaJ7ZRX1VCT
	CkJcro3hmC9ENrfFqBm98Sw=
X-Google-Smtp-Source: AA0mqf78pgAVtMq8pq+tCGwJHeM7QPMfI1EDDft+2+fSPKOuH2O4/vhP5xQpLF4Y0UoxHBvM5RyLQA==
X-Received: by 2002:a63:ff0b:0:b0:477:362d:85d3 with SMTP id k11-20020a63ff0b000000b00477362d85d3mr5493742pgi.395.1669167374414;
        Tue, 22 Nov 2022 17:36:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902b68500b00186b758c9fasm12680124pls.33.2022.11.22.17.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 17:36:13 -0800 (PST)
Date: Tue, 22 Nov 2022 17:36:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: drop redundant part of title
 (beginning)
Message-ID: <Y315CQUTFYocBnfS@google.com>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_173617_611437_30F9D618 
X-CRM114-Status: UNSURE (   7.83  )
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

On Mon, Nov 21, 2022 at 12:06:13PM +0100, Krzysztof Kozlowski wrote:
>  Documentation/devicetree/bindings/input/gpio-keys.yaml          | 2 +-
>  Documentation/devicetree/bindings/input/microchip,cap11xx.yaml  | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
