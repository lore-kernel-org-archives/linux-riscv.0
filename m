Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12840C7EE2C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IL/nILCyFbgmf4a4uAyJHT5UtGioeF9UZ1VcOFM7gRE=; b=yitadyVe5jjLMA
	omnnoKuygzvEDG1hppEIKje/n5LJZkALMgDv8PgTYv+iT4YhHVVkJkq0UD+otm2EDjNtcG7yNALGZ
	gWLAEIlzWLZYZEMi1VAUntHCpZRWHCK2QTZp+e3oRxj3okns6FuRzsxgTZWL8i8gDXRtW7PADbJfd
	FA667oUbCkS8U4IQPxfqXi87Q+PtddYgO+iXPkLfmAj3AEZYMHhSnx0SiVWmQpsc0nnzePesn6Azm
	UXCZtpEZ8QuvTlqdmD0Jc4KoIN615B+9R1ClHmw4IxFFu/gpP4bBDz3Elw4OKB1dCPeaNnxmMWRXS
	H2uZMku57JjjJpJ4ly8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mnS-00DKjS-0m;
	Wed, 24 May 2023 11:36:50 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mnP-00DKiN-1S;
	Wed, 24 May 2023 11:36:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-970028cfb6cso143723366b.1;
        Wed, 24 May 2023 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684928204; x=1687520204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oCm6OKqBd9FZs5dbQajMLTNl/mBBTw3OR4x7693gBrE=;
        b=I4cLiQTIHzZm8sBtmVFsdKbYNOnsZaNirYxqf6IUwmR/TVcrTxYzng5ZcIlrMGi3nJ
         NkK6nRvGj9klSbim8whLvYb4lg+Re/RXvex9vQKI0PHxP3CHoH1IvY4656ENSpmkKITU
         e7MhLmPx7pR3FJ12s2edRbrhtWs3KgNZX0XHKDIYTOaYfI06HSw8kqVCv9+WY7CDShQk
         j/BtXX7LtGKvj+BbfGj4HaOh1vvDZoxhL2KhyW1JVdeZZ6mgB8Adx3wn7rNJjOh2Wqtw
         V4hIa5AUzBdiOnM+BPnzj0UvpdnIs5pGhgDmgFobJO/+VP+p73wJMIGQ9ROnIgid7JXi
         GTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684928204; x=1687520204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCm6OKqBd9FZs5dbQajMLTNl/mBBTw3OR4x7693gBrE=;
        b=g6w3Z70SWsu8PSapm02yEKQhQZyCWXjYox83nxuAnxmrz/7X17tSQGPZM7OtJh3Rq1
         fXI/1ZpNHM4ruNmipvoFriHjbe/yAoqM1RnCvAqdDWFBtrEwBzmktXvZGlw/5TS87UNu
         mRCn9sASNVv8yNsl3DyRuUhheW9EOtXs01ZaQGYGmy4sM+YhiWOeBaUZZVDC9fYFTx7w
         ci2m2f3ErLf/oyjYhmx0olfP2Qo8DTwr9/1Ihk9PJP2gxnRDAfaYZx4CzJXqJSDGqftC
         EzTza16a/dQacvAeZN0do3K6l/FM/zrfaP76EiqkOPHWkJXwRTuNrdY4O3L2rcACTTom
         +gpA==
X-Gm-Message-State: AC+VfDyv92rE+tPXG3ZWiqh/K/2rVEoY3y9Y8GPA9BvLjJnO72ibcjV5
	Gkpoah/Trpd2Jikj5XCSwSdO57UZQfR5OEBqIyU=
X-Google-Smtp-Source: ACHHUZ5GJeAlXBJeAiYbUR3dLRmpJzG6jJfr1vlY311+6DHVApmd/vBenb0CNYBAN8rhGpxSZ6ePzW/DFt2WAMcrqFA=
X-Received: by 2002:a17:907:6ea2:b0:96f:98f1:6512 with SMTP id
 sh34-20020a1709076ea200b0096f98f16512mr15842859ejc.41.1684928203919; Wed, 24
 May 2023 04:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230524082744.3215427-1-bigunclemax@gmail.com> <20230524103431.50c6a2fd@donnerap.cambridge.arm.com>
In-Reply-To: <20230524103431.50c6a2fd@donnerap.cambridge.arm.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 24 May 2023 14:36:28 +0300
Message-ID: <CALHCpMh2sZSCrFMMT13kYbsu+C2bC2xY3coB_fv0mZom_g=oPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] Add support for Allwinner GPADC on
 D1/T113s/R329 SoCs
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Haibo Chen <haibo.chen@nxp.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	William Breathitt Gray <william.gray@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_043647_491023_8B676254 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Andre,

thanks for you comments

> This may sound kind of obvious, but wouldn't it be easier to model this
> with one compatible string, and have the number of channels as a DT
> property?

Yes, I completely agree that using separate config for each SoCs is looks
overcomplicated because the only difference is the number of channels.
I thought about a DT property with channels number but I didn't find
another ADC driver with the same approach (except i2c ADC's with child nodes).

> Or, alternatively, using iio/multiplexer/io-channel-mux.yaml, since it's
> only one ADC anyway?
I'm sorry, I didn't quite understand what you're suggesting.

> And btw: it seems that the T507 (the H616 die with a different pinout) has
> the same IP, with four channels:
> http://dl.linux-sunxi.org/T507/

Oh, thanks for pointing that. I'll add it to the list in the next version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
