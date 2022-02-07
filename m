Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581A7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsmNrNdAdNju9upGLoIvTpGRMiYlhb1kLJbC9PS5h1s=; b=owNVsrjleBQkIt
	UoJdMjyB9ER6hDGXZo5AVCLs4eWqv78FbaTjjIeDyuNcnZOvUo8NqLNWZUCeRL/EHIAMw9jbBdgg7
	OOeU+1dcu1AtD+TLjlJQjtyoKN/nJ8P5fNIXoSzRQUDkHG7htoqkCM6M7j7xnItI6ROuWkujoybM5
	OFE6kK5Tyz2GYL+OVLF3X2UW/Ph6e5sOObVmLdgTxTNgKgxUCZqH6gAdLeRwaoO+3339vkhwz7C3p
	+G5gWagoo6P4sSB6IerG+OWgcM9MaV0RwPrHtUgVVjFxCQff1ppe8jAfskXhTnYvx47tHmbBE2n4u
	h0Xhb6NK75WQGqNja2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHAJc-00BeJv-89; Mon, 07 Feb 2022 20:08:48 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHAJa-00BeHm-1c
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 20:08:47 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so14956009ooq.10
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 12:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CrvosFW42PH24vyhcJ8yCYK5kuH9wojPlsSY3hcdOUc=;
 b=yCbZykl2i0g3aoz8pta6eOCvco0wyJqDEiGaUL6whoZvZRfgWGPxHGXscHUO3G3aTk
 VYXTMN9hIWufi84VeC++dJDhGpBb7jTruzvlFiWivx5GmBq7/6fAtkQDBhVBJnxHFFGD
 sa++dM+3wGm5AdrGfNUNUDrgKBzuhRmmXQYw+hcDogsWqHiTG/a/r0m1PU97xkfuzpyN
 cBLiNOy4NHhKHUwOZ3rZtErASNRCZ5goxBuGftKHwZXvEDYS7MA3pxWQkO9GyLPIrsjF
 iTwTuhBuk4AEtlKjQ93mWvl1Sx7yzNuoMVtzpINIDfoqRKQHQPHcf5b2yWEY2Ep0lGW/
 lLtg==
X-Gm-Message-State: AOAM5312xkXjRlJt/MiQsNBrOPJlZpg+N5B9PGXGxvsitQldIioVu6Di
 krwph2UzWL7NezBcVRK37A==
X-Google-Smtp-Source: ABdhPJyJK27+psTtrfkCuMuAqpffgGb6n5sw/ohgngNCI1dXBNEA26ejonL56UAsIWXjvhBlpqcVtQ==
X-Received: by 2002:a05:6870:72c5:: with SMTP id
 o5mr203147oak.138.1644264520985; 
 Mon, 07 Feb 2022 12:08:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b8sm4398365otk.36.2022.02.07.12.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 12:08:40 -0800 (PST)
Received: (nullmailer pid 822044 invoked by uid 1000);
 Mon, 07 Feb 2022 20:08:38 -0000
Date: Mon, 7 Feb 2022 14:08:38 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, robh+dt@kernel.org, ivan.griffin@microchip.com,
 atishp@rivosinc.com, bin.meng@windriver.com,
 Palmer Dabbelt <palmer@rivosinc.com>, devicetree@vger.kernel.org,
 heiko@sntech.de, u.kleine-koenig@pengutronix.de, paul.walmsley@sifive.com,
 krzysztof.kozlowski@canonical.com, aou@eecs.berkeley.edu,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, jassisinghbrar@gmail.com, a.zummo@towertech.it,
 daire.mcnamara@microchip.com, palmer@dabbelt.com, lee.jones@linaro.org,
 linux-pwm@vger.kernel.org, geert@linux-m68k.org, brgl@bgdev.pl,
 lewis.hanly@microchip.com
Subject: Re: [PATCH v6 04/12] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <YgF8RhEUVNb1ZVFl@robh.at.kernel.org>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-5-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207162637.1658677-5-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_120846_113353_F8D3ADE5 
X-CRM114-Status: GOOD (  10.19  )
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

On Mon, 07 Feb 2022 16:26:30 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
