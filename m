Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B020CF8548
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOMLxLsAib9iSe6j9vfvPp62XdB6slJDkZEqCjWjEqs=; b=KwFWYF6UIaEZbA
	YIxb7SWnH8IQ3lmsdUwuexzs3pSBXLglE4OnAfgMc8fj48zwao3B7HsrQAIkTFVAR+PoIPo9fenTh
	FsdQ6xWzRvDVhxaOonEei/Nc0WT+IA9+eSANEWKTM0L58l8m+xpAeDoHzeqM2rwkbde1cHAUOjz9p
	3jEbiuN/i3nFRCS0lw3fNKOGVCCn5fq2Yi9R8QzWbhQ0cp4ZbFwQ8nNEF5oLbhYivBIB2w3G99yoC
	F/hm34wS8Wa+DyHKE7qPoOWzXL/nzhbow3QNkuvOfy1KD5Q9f+DEQaLqaBPE1ss2gs6uTk/CY/6Kd
	T6bldEDlowGnxfTOrYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8um-00000007mF8-3pky;
	Wed, 02 Oct 2024 23:37:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8tW-00000007lwo-1Bt3;
	Wed, 02 Oct 2024 23:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93F9E5C57DA;
	Wed,  2 Oct 2024 23:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461A7C4CEC5;
	Wed,  2 Oct 2024 23:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727912191;
	bh=HyrtHeAPOivtYCgQ4nQSGDVQaHlhKfwSeUxDJUJuZZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJSu6RkyIIspeq4fY3ihUa+g0MzP3pEl9wiNEl8UmxuIAxITAbXlSEqZfQmu+5lxq
	 0Vb1Wkd6vjGP8arRiAH7rjOWD+SbdNG/AcmsakHR5jb23UiV68hRD8h3CfT24FYlSh
	 vnx49MWym7CKuD3Pu71TnSW5Vr+DnIAAkIrx66eNI4p4M/6ColssFiCmFYLba9R9Ca
	 fd0Vi0tE8jz4VErPYJ+LezJUSjk0vemGQlVEA5AUreAsorZJxYfLl+UIAtn6C5E0MV
	 i61aEzBVUhNMKgb+kAcCreN/UAMoQ5qVDcPKG99E7Jm954A0fJVieEZDApWUTeudma
	 ZGyYtD/LvWbpA==
Date: Wed, 2 Oct 2024 18:36:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
	valentina.fernandezalanis@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-riscv@lists.infradead.org, pierre-henry.moussay@microchip.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-amlogic@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 07/11] dt-bindings: clk: microchip: mpfs: remove first
 reg region
Message-ID: <172791218968.1549326.10092947836585074554.robh@kernel.org>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-alarm-drop-down-e37c31e50a48@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-alarm-drop-down-e37c31e50a48@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_163634_387667_4A4AF616 
X-CRM114-Status: GOOD (  13.29  )
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


On Wed, 02 Oct 2024 11:48:05 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The first reg region in this binding is not exclusively for clocks, as
> evidenced by the dual role of this device as a reset controller at
> present. The first region is however better described by a simple-mfd
> syscon, but this would have require a significant re-write of the
> devicetree for the platform, so the easy way out was chosen when reset
> support was first introduced. The region doesn't just contain clock and
> reset registers, it also contains pinctrl and interrupt controller
> functionality, so drop the region from the clock binding so that it can
> be described instead by a simple-mfd syscon rather than propagate this
> incorrect description of the hardware to the new pic64gx SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs-clkcfg.yaml | 36 +++++++++++--------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
