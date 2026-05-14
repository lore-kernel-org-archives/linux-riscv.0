Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E763CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 23:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4IpOeosWK4fsybybYXkdqbVd2HqUuxRmidUf6PfAf0=; b=ePMgzVR4/yGM9Z
	RaVpQbMLvIegx2fRaC8ao/KRR5roObCHXffr61+FARtgQ7JEOdrgJcbRKS28wZXsTPvIIWUAabc+Z
	J1pAx7mJ1d3DZ6EyrVLkOjoCwazYUoLHUMwRdByJAji4G1QF7tdX1zoA8jjOy+UQSqkvFfMq7ozVy
	WCxIXIKgz16aB4naY1xTScpj8YJiq3pOYBWFvKMTEwuI7B+I0oPtXzvf33+UscUAyxvXB1rwlrl3B
	szYGjJa7koLh/qDnYF46khjdD50m9EcyWqFibiQn7gWKj1OzdktJGS8LjiKk/Zb5y6LwtPsfLMWFN
	YHpgs5HasmnhUQeEK71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfZs-00000006por-3upE;
	Thu, 14 May 2026 23:34:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfZr-00000006poh-3lew
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 23:34:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB19D60132;
	Thu, 14 May 2026 23:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353E7C2BCB3;
	Thu, 14 May 2026 23:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778801690;
	bh=VTVKVwBI0yfXk8vWOqDjB0TtPEq/BIS9tDluZGPTVE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzDuGBx6iH26mngpO4t7dd7Ic4nvod0HRexS7rQXFo1QPRZA/pT27Zb0RM54kS4ax
	 vLoFpifHWxhr4nDK0Ox2RFpMAsz4sbMuOCCGVtVxPCusPjFk84roYr0isUi6ARFzA/
	 EFhq8gP7QnWpbLJHq5TqDKr8rr77g36rrTG9zsbNkc+lcAQ0838NHkPrO1D+NMeziu
	 cK7KTcGBzI7uq2IXSLfS2muqYoF7nFUbY5i2Qi2CHTTI8nG+qQA6vzSyZhK+NA4Hr8
	 jOTek0vzKCyFsJa7+mL6lcTVwo+a1rvh4zmuy36abVQ0tS5Wg0gVtUJVIpvabeOOxL
	 UTZZ7K9cVm6yg==
Date: Thu, 14 May 2026 23:34:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/2] pwm: spacemit: Add Support for K3 SoC
Message-ID: <20260514233448-GKA3663945@kernel.org>
References: <20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Uwe Kleine-K=F6nig,
  Can you queue this one for v7.2? I'm sending the DTS part patch
and got a complaint for "clock definitions violation"

https://lore.kernel.org/all/20260511235952.F32FBC2BCB0@smtp.kernel.org/

On 10:46 Tue 28 Apr     , Yixun Lan wrote:
> The PWM controller in SpacemiT K3 SoC reuse the same IP as previous K1
> generation, while the difference is that one additional bus clock is
> added. Introduce a new compatible string and also adjust driver code to
> support it.
> =

> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v2:
> - Merge dt-binding of clock-names property
> - Use local variable for bus clock
> - Rebase to v7.1-rc1
> - Link to v1: https://lore.kernel.org/r/20260409-03-k3-pwm-drv-v1-0-1307a=
06fba38@kernel.org
> =

> ---
> Yixun Lan (2):
>       dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K3 PWM support
>       pwm: pxa: Add optional bus clock
> =

>  .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml   | 41 ++++++++++++++++=
++++--
>  drivers/pwm/pwm-pxa.c                              |  8 ++++-
>  2 files changed, 45 insertions(+), 4 deletions(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260401-03-k3-pwm-drv-4ea99ae355d6
> =

> Best regards,
> -- =

> Yixun Lan <dlan@kernel.org>
> =


-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
