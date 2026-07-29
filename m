Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E161C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxLbaMVcVunMnK9bChDXaXYJtjgJteaKI3RuLRHJ8JU=; b=cF9z8O3ZKwmKdG
	Pt1gZHlKDHayAzv5FoMXspZ0BaVsyE0jGE8vDc475NGZWPwqiWMhLOdZFbIbCOZ1RXNzsjBbhLBa9
	g28qoQhPpXpa9kCWhF2KMH8DJE9hJynoEw/OI61KNwpUkTZcWo4VTEwfDJ9ScDr4z/331Af/uBfb1
	e6f4dGsWqZyBsxxPY6fQFOGcy/6SSPLgQ2/g3/F52RcgvdMXoYQ0gR1c/jZKPGbsNu/uU1MeqHbcy
	bEboQGc2EFEWNQ3M223IQRTh7K1qodJ1lQDUIf9hZPzPVr1fC6f9bzctnvOjZnUUX15Y3FQBxvj2r
	GuzJgUjaYzvRxVN4Trgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosxa-00000006Zh5-0T6q;
	Wed, 29 Jul 2026 01:19:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosxY-00000006Zgy-2Avp
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:19:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 729D640D3C;
	Wed, 29 Jul 2026 01:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DCD1F000E9;
	Wed, 29 Jul 2026 01:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785287987;
	bh=ATMYrAwVujA9rTlR4Jzs4dT+nbSqGZK7ev3BrwlqI4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XyKg3ltqLIDAAI5/osueEcrWjJfA8fKD6d06slFM9bwudXOLYTLcB8snDJYZCZstM
	 Ycz0rmtJjUGGK9EWAezlzQ5RfQzRjGbLbE++JWE5zlmQRWsPQqed8xT0/NKfSA6YH2
	 seXIaovj5Rx82tpc/b6fmByzPEcNt22ouiKz0cIQtHFSkgynNoR5Nwyn7iEN5kSdqh
	 QAwpU5Chtd36dVnc1vNQDBMUy2FRDvTvNDJWJ2Me9qLOEGJ44MA4DG98HZGdikAa60
	 abBGIe31o3KBYYGxrwTc0gYS4ALv5LtjG3Ow/Nxh9cOpmfEjdidzZGOTTmizEGbb/C
	 CUx3UjT7UnMbQ==
Date: Wed, 29 Jul 2026 01:19:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Message-ID: <20260729011944-GKE76518@kernel.org>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
 <20260721-kx-i2s-dts-v1-3-d22cb6cfaab5@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721-kx-i2s-dts-v1-3-d22cb6cfaab5@linux.spacemit.com>
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

Hi Troy,
On 19:35 Tue 21 Jul     , Troy Mitchell wrote:
> Add the six SSPA-based I2S controller nodes for the K3 SoC.
> 
> i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
> divider, so they use the published 7-clock layout (sysclk, bclk, bus,
> func, sysclk_div, c_sysclk, c_bclk).
> 
> i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
> its sysclk is driven directly by a DDN (ISCCR0) and has no separate
> divider stage.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 119 +++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
