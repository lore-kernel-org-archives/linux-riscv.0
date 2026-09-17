Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29019C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhUlUCINDo0Wav2eUJ6sADecRps2vS2v/msTwYpywcU=; b=uLyZheEnePuUvE
	BFQ2RQCiIAMhEQgf8CWIy2vBmk9yewxLtGtwVEipi2Ho1qnvRUYimCil2DFxqNcvCjPk86w3Tjh7h
	HfP5/FJAreoDiEKsJ1QBGu3Seyv6ix2611OXwv6FJ6tzdCNzC+QqccjuVuY3Ky8zfSKQnMLmRvDzG
	De5hcBMkj4u0MzDcMIJUj8wvGF4JV0NLk4RsAD8NOYzyYTzXrhENE2tDBqMFzfKED81z049qHH8bX
	I+jxdhO0doAs9LP5J0bAiR+5zixC1JI46GJ2EQmSVsbNtFzYIKh7zZu+7N4zAEe+AvO1AiXQQJlvN
	wmzAG4m/ziNy9Gr55cqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Dgi-0000000Bd2o-2EqO;
	Thu, 17 Sep 2026 15:06:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Dgh-0000000Bd2T-2q75
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Sep 2026 15:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/OfWtIewPY5C/r0HMIf+o2IIttSmiKU4y8rC/hzPssc=; b=mfsZkXWnHLGf3LMvO0jQNzI8J6
	wjBSuykVb33x5sd92aVc+t1C3Yz28ScwMA0o68CWPlG0fQymRGHElljbLgtJW9oI8Ae4dMUD1XDiu
	Pv68vtMdLOpMkeMHsd33O/81B7kzDJGU8AjAZAYOdtfREOAY/yXKEywNzd/XE+e+GPZVnbcbtHI4a
	g4WHX/it2C5KucMYt8a6Qvkx8fupqwPXqDv4GlbCU+2VE8+tDwEgix8S0jbssxZ51KMPbFm2+xHu3
	z0lS2keHOWSvNbdpi4BAkL6iquid5KdBTbzLaWPhE5rfLFOHtCsWYCH07YPD/koxum+AsJfaQaeas
	zylRzy0A==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Dge-00000008ybz-2cXH
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 15:06:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 634831A0934;
	Thu, 17 Sep 2026 15:05:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26C255FAA3;
	Thu, 17 Sep 2026 15:05:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C35C211C7B08C;
	Thu, 17 Sep 2026 17:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789657549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/OfWtIewPY5C/r0HMIf+o2IIttSmiKU4y8rC/hzPssc=;
	b=ngBXbn7/ts81Rynz7n5bSN7vmTTpu4edcR52tEjvtmzV0mtJnaTqQaaGTaP6UXbcZcuttd
	OmHSxedWnPBXZuzpLcrjJddURZ4iBxRQxqWuUXqCtPjgw44XdjtUZzeb4ixeueEh/Pjs3x
	/eWz9LcI5bxvgzjpghmVc+XOtR8IQ3BUPB6X/utwtHLYoy1NQVdzrmV/b3RW+jMtn6MkTh
	+P+X9EUacmGoXpVXdFe93bfZwrZ5ww11hjFw5RlJwwEHjnY4K+Lzz34RW8ywCr6zBFQl5u
	wZSqY+rp+UjM2V2g8x9tD4szg7BX2Co1MnCeqc+BhGY2Fm25gVBYVqzQV44emw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Lee Jones <lee@kernel.org>,  =?utf-8?Q?Andr=C3=A9?= Draszik
 <andre.draszik@linaro.org>,
  Ulf Hansson <ulfh@kernel.org>,  Liang Yang <liang.yang@amlogic.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Bjorn Helgaas <bhelgaas@google.com>,  Lorenzo
 Pieralisi <lpieralisi@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,  Manivannan Sadhasivam <mani@kernel.org>,  Ray
 Jui <rjui@broadcom.com>,  Scott Branden <sbranden@broadcom.com>,  Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,  Will
 Deacon <will@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  Vinod
 Koul <vkoul@kernel.org>,  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Jose Abreu
 <joabreu@synopsys.com>,  Ray Jui <ray.jui@broadcom.com>,  Scott Branden
 <scott.branden@broadcom.com>,  Atish Patra <atishp@rivosinc.com>,  Shawn
 Guo <shawn.guo@linaro.org>,  Dmitry Osipenko <digetx@gmail.com>,  Thierry
 Reding <thierry.reding@gmail.com>,  Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>,  Okan Sahin <Okan.Sahin@analog.com>,
  devicetree@vger.kernel.org,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@sifive.com>,  Conor Dooley <conor@kernel.org>,
  linux-rtc@vger.kernel.org,  Ricard Wanderlof <ricardw@axis.com>,
  patches@opensource.cirrus.com,  Lukas Wunner <lukas@wunner.de>,  Chunfeng
 Yun <chunfeng.yun@mediatek.com>,  Eugen Hristev <ehristev@kernel.org>,
  dri-devel@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-hwmon@vger.kernel.org,
  linux-iio@vger.kernel.org,  linux@analog.com,
  linux-input@vger.kernel.org,  chrome-platform@lists.linux.dev,
  linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Expand flow lists to block lists
In-Reply-To: <20260917144028.459053-1-matyasdaniel006@gmail.com> (Daniel
	Matyas's message of "Thu, 17 Sep 2026 17:40:28 +0300")
References: <20260917144028.459053-1-matyasdaniel006@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 17 Sep 2026 17:05:33 +0200
Message-ID: <87tsnnj4ua.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_160608_771013_68A265AA 
X-CRM114-Status: UNSURE (   7.49  )
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

On 17/09/2026 at 17:40:28 +03, Daniel Matyas <matyasdaniel006@gmail.com> wrote:

> Running dt_bindings_check returned:
> [error] string value is redundantly quoted with any quotes (quoted-strings)
>
> The files used quotation marks in flow lists because the strings had
> commas and these commas were interpreted as separators. Convert flow
> style lists to block style lists, so that there is no problems with the
> commas.
>
> Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com> # MTD

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
