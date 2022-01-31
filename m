Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6516C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv3sOiVQxw6VNLXdVTrUHL1dnyKKXCQPBPK1lidaQ+c=; b=aiC/ifNj9lHq0S
	0jlNRRhOKGnxX0AD4GoIdJnkuWPRquavHqjS1J2+a7h+0aI2c7JQQTJcozkvC51k4wuWRMiUoEOzU
	bBOzEeBht2Fp4Lk+B+kkuoGAJlvsKtFQc3G3WBznjgnRgs6xQAsXvlDAir5G1Z2AmAf2PAQR8S+3D
	EE8ZcAVfY3hW9ZCdejBTndfWzJCSMN55vPAjh3WPPUueb7qX6DoSFgYAVfMzybOh8A/OlgiCfaMny
	cM102HmOMhxXt+X0rfxrtCvU5jUHCD4XYKyUFNNaGIK2mnTTdJna4sdcRBJo20hScmWVKUfmHC9gC
	PxnWOB5nEDUWGCKVsXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEYmO-009iLZ-JV; Mon, 31 Jan 2022 15:39:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEYmL-009iK2-Hm
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 15:39:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8160C6145C
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 15:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E448C340FB
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643643579;
 bh=S+JVtyhrSwII/6pN71WYrrMXzhomHDBQD0dIDcv+A3s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b1bUpP7W0k8lVttZ79Iy9olvsgkhxTgxATRvcRr3Yn++XSImeY+aAYItRLoNsUxCF
 1DbgVjAgQUGTcST3UO8HkeNzjtQRzl5Fhj0evS+VAtTBDnMPzZpMZcwYGxL9waoO6/
 Bbn2yqPJj0wrPJWCDChZLm9jYaiVPUEYdjJkZaPBYjapPqgggBVxlYRZkcCPaRuRZk
 mtMF7V/p+gU9vC+68lsK7PQ02AZCvZNym99dMIan517mkVqxyBK0BIXRGOZ4s5mVt3
 iwv6hqfyShk4glxkPv1UETPuRTFwZ2ADflyV38JIMwUNQ/+D36xDYvW/xHAM2WSi4X
 J3rBA9txv1I2A==
Received: by mail-qt1-f178.google.com with SMTP id r14so11740736qtt.5
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 07:39:39 -0800 (PST)
X-Gm-Message-State: AOAM5318jXUs39ZV1LDv5RWC4r+Jv+er0dPDsfHrIHRDNnzBsWEJMuzt
 ooc5i44u1hR1AcH01Xd3RmyajfFbLWEarRgXWg==
X-Google-Smtp-Source: ABdhPJxu+B59w9DW0M1geYs68HEGp28ZLv4SyMZIUN/C1CH9RYxmLWUL6y5b/4WKDRWIhQTI6X5cawEeoSNHZY1s0PM=
X-Received: by 2002:ac8:5b86:: with SMTP id a6mr8557369qta.511.1643643578122; 
 Mon, 31 Jan 2022 07:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-4-conor.dooley@microchip.com>
In-Reply-To: <20220131114726.973690-4-conor.dooley@microchip.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 31 Jan 2022 09:39:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
Message-ID: <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux PWM List <linux-pwm@vger.kernel.org>, 
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 "heiko@sntech.de" <heiko@sntech.de>, lewis.hanly@microchip.com, 
 Daire McNamara <daire.mcnamara@microchip.com>, ivan.griffin@microchip.com, 
 Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_073941_667126_5429C852 
X-CRM114-Status: GOOD (  14.78  )
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

On Mon, Jan 31, 2022 at 5:45 AM <conor.dooley@microchip.com> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>

There should not be a blank line here.

Also, tags should be in chronological order typically. If Daire sent
this patch out with my tag, then the order is correct. If I gave it on
a version you sent, then it goes between Daire's and your S-o-b which
is the case here.


Rob

> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
