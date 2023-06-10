Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FEDC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 17:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiOs6/OCBYn5ZA9bst7IHVYj2CTvQ87/hTm0b46zC6U=; b=Kav34MhSbRzEkD
	sMl692hOVMvf4qSfqOq1ngdQgbHZOlFMIW2xYPDSAO7kJTTLXBT1jQJhrffVLNodZwEFOm+ulSlir
	kBh9bQUGPYr6tJ/y6iZX2BWNUlcvoQCdAdWcj3Oh8hyoTo9Ih+Wd1tvXpe1F6eMGTzTewgriBUddk
	xdBKbfCLL0gtt69J4x5KmiCA1ls7TQAfxL8muQsNrvNQ4vcEpc6+RFwgorFTh+qD6SfXcXdWIig6m
	vaFvyt3g3JYwrShxp2HdtoEKEY7XoqL+BRp1WVyfFO77WyJ6HYXrPvv3aL6JvALxJMcp7uOi6f7P2
	SwGBV5NMPFklmldi2dew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82oL-00Gicz-0a;
	Sat, 10 Jun 2023 17:55:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82oI-00GibT-18;
	Sat, 10 Jun 2023 17:55:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0B6D61031;
	Sat, 10 Jun 2023 17:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE88C433D2;
	Sat, 10 Jun 2023 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686419733;
	bh=Z7CDYiZUhDciWFfHCWXIbPWCYecbEDUP0+fYC7qnEIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TAJ3nnNaH/YW5/D3Hcc7UM2mzrLOh4yB5AwCexral7DO+cJBaaer4N50jLHJxh0Ij
	 do27NCukKDieM4s9l33g5VChkQ5iAMItocYdHzhMMg/wgqN6NVeYhXhvgjMd4boT2y
	 y8VjTNay3js48W8Ame3xXUkYAZ0z2HhNpTyKxUayiF6QeGxYKb17dLPPGN+JpsP22r
	 fNQgrE180WTO4vCpUN6mFsj0imY6XkXs1sIUgYla/w/glfjpbW87yAF0ggFgQddkhV
	 PbFBVuCrGPRj4VrTLsDf6HJP3YPJmbq0Y63EvyOUvdlk+UXDFVUvQTZZPfhXfXHn5r
	 YdaNIyi3kKLVw==
Date: Sat, 10 Jun 2023 19:12:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav
 <demonsingur@gmail.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>,
 William Breathitt Gray <william.gray@linaro.org>, ChiYuan Huang
 <cy_huang@richtek.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu
 <chiaen_wu@richtek.com>, Arnd Bergmann <arnd@arndb.de>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs
 GPADC
Message-ID: <20230610191204.007c0159@jic23-huawei>
In-Reply-To: <20230610122934.953106-2-bigunclemax@gmail.com>
References: <20230610122934.953106-1-bigunclemax@gmail.com>
	<20230610122934.953106-2-bigunclemax@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_105534_437456_373B74D7 
X-CRM114-Status: GOOD (  12.86  )
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

On Sat, 10 Jun 2023 15:29:07 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> The General Purpose ADC (GPADC) can convert the external signal into
> a certain proportion of digital value, to realize the measurement of
> analog signal, which can be applied to power detection and key detection.
> 
> Theoretically, this ADC can support up to 16 channels. All SoCs below
> contain this GPADC IP. The only difference between them is the number
> of available channels:
> 
>  T113 - 1 channel
>  D1   - 2 channels
>  R329 - 4 channels
>  T507 - 4 channels
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Looks good to me. Just the issue Connor pointed out in the DT binding to resolve.
Note that this will be cutting it fine for this cycle, but 'might'
make it in if the stars align.  If not it will need to wait for next cycle.

Jonathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
