Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD3CC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpIbmdgHFVCyUlb6q/fEdD8Ft87PcAoFdUxcRIgQQr4=; b=kErNvenS2l7bWq
	qmVDugXpYsXzfbLHUn1org7v3/XZz+vX/ZAIVwkVaCSJlzgY/bAANfzHCUmRNdoYAAziA/F/QiiLq
	0zGlsGrmB0S/wgEaCQnX8l1AFKEt/u/VaAKnMav1/dg4q4+5S5B17YG/xexKcuRen7cDko+XFA3gR
	G74/iEnN3xir9PSRzZxjFPGnATfmiu/GwD5jRXuIp3FioG0fyU5r6aq3EVwIOXHw5XAwFu9PSsMds
	al4gFN1Bl3GmVOdbx54LpKDQzdSqxKEc0VdcHUPTkBQ8/XNpH7yzThZGPUpXLutvT6HEzsI84rPl0
	eI1R9mQhEhyAnxhQBK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRMf-0000000E0ov-0Hmw;
	Tue, 05 Aug 2025 23:46:41 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRMc-0000000E0oa-3P4t
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 23:46:40 +0000
Received: from localhost (unknown [116.232.147.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7517F34072E;
	Tue, 05 Aug 2025 23:46:34 +0000 (UTC)
Date: Wed, 6 Aug 2025 07:46:30 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v4 0/2] clk: spacemit: fix sspax_clk
Message-ID: <20250805234630-GYC937575@gentoo>
References: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_164638_890218_2E085685 
X-CRM114-Status: GOOD (  18.73  )
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

On 21:01 Tue 05 Aug     , Troy Mitchell wrote:
> In the SpacemiT public document, when the FNCLKSEL field of
> the APBC_SSPAX_CLK_RST register is 7 (3'b111),
> which is a reserved value. And BIT3 of the same register is
> a reserved bit.
> 
> But the documentation is incorrect. In reality, the value 7 (3'b111)
> of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
> selected as the parent clock. Similarly, bit 3 is not reserved either.
> When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
> enabled as the parent clock.
> 
> In all other cases (i.e., when FNCLKSEL is not 7), bit 3 has no effect.
> 
> Importantly, whenever FNCLKSEL is set to 7, bit 3 must also be set to 1,
> otherwise the selection of i2s_bclk becomes invalid.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Fixes tag get lost when applying this series, please move to patch [2/2]
or apply to both of the two patches? (I think it doesn't hurt)

also, please rebase this series once 6.17-rc1 tagged as currently patch [1/2]
can't be applied cleanly

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> I sent with a wrong email so resend.
> ---
> Changes in v4:
>   - add comments
>   - add tags
>   - Link to v3: https://lore.kernel.org/r/20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com
> 
> Changes in v3:
>   - Fixing ABI-breaking behavior
>   - Modify commit msgs
>   - Link to v2: https://lore.kernel.org/r/20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com
> 
> Changes in v2:
>   - Use virtual gate instead of new function for sspa
>   - Add Suggested-by tag: Yao Zi
>   - Add Fixes tag
>   - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/
> 
> ---
> Troy Mitchell (2):
>       dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
>       clk: spacemit: fix sspax_clk
> 
>  drivers/clk/spacemit/ccu-k1.c                  | 29 ++++++++++++++++++++++----
>  include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
>  2 files changed, 27 insertions(+), 4 deletions(-)
> ---
> base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
> change-id: 20250717-k1-clk-i2s-e4272f1f915b
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
