Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D2E77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlEAPm/uKsW3v6pKQZXPXaw7x9torg6xlodGPUIRYVo=; b=BCoOJSLNB/iSPb
	OL0/R7zL8QMAADaYZ5fl8ewXm2cBf36Fxxerii/wxJOM8Zt+s06QbCqImiUbeS+w0hGw4FeIeXI6x
	TkN93NK5OEUAySN3W5Xihnjpika4ER/Rhwi0yW3CDvqQrCCtbnyesywYnATqEyMKFW/ohwyF8SICd
	EmteaGL2guFJ0z3olWYEhWgqIjrk18xWy/zdD7cHANYHaYZL8nvXoUSHGU7nsV2VX9+7Cg11Fg7gD
	xOXCQ3bgv3J0weh3Nb37shfaoTyrNuNL+5nBBvxp+XvmGjR8o1LTVVDoLWQOubmIcuZ65kaGBRheB
	IyfzvbQ0+PwuwXWfc2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0vt-0000000EpL2-1ybo;
	Sat, 04 Jan 2025 09:59:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0vr-0000000EpKe-0uAj
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 09:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3B78A4032E;
	Sat,  4 Jan 2025 09:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E7CC4CED1;
	Sat,  4 Jan 2025 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735984737;
	bh=AwdFx98pEAireyoVzCdRMZVDpZ9o6J75X9n8rzgDT3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTlL+k2MwomgUMaU/dvTC+jGQZiN0GJKrKzlG0A2DIczkSuvGaUO7OH28utdkBoVW
	 EBXrTMN9AJMWbqb3L5bqF2wnEhQX+M9/RSgmHLbAmgDDYfM8mwjx3Hk4cKFsFjkooi
	 ZifboexBvb+XKgPqcrLxH0cPV6s88iaBjnPGcZJyaCWgTOPZIlT08wqHkvbtj2fgcJ
	 RdQ0yJT5Car4UQytaSVSyXZEiGa6lM2CrL+w02LBKeA3xPs7uRlggkPrHffmXBtvuN
	 RoKY6TkSubUchOxOLJIbgJj2aYzO1MyTfAVOFIYCUGb5Z/Hd2MMKz37oCs+F2abbGR
	 95j2C2tYiLOhw==
Date: Sat, 4 Jan 2025 10:58:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <coyp227rh643slvrrtlls6zc4r2fgvajrvsw63xpyxno7b73wy@cvsjtsghmnx4>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-3-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103215636.19967-3-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_015859_319549_999C46B6 
X-CRM114-Status: UNSURE (   6.42  )
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

On Fri, Jan 03, 2025 at 09:56:34PM +0000, Haylen Chu wrote:
> +#define CLK_PLL3_80		32
> +#define CLK_PLL3_40		33
> +#define CLK_PLL3_20		34
> +#define CLK_APBS_NUM		35

Binding looks fine, thanks for the changes, but now I noticed this
define.  Please drop. Number of clocks is rarely useful as a binding and
usually leading to ABI issues.

Same for all other clock controllers below.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
