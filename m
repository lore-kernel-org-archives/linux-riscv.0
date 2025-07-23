Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A048EC83F25
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 04:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tlm/vSmpPs9NoMVC/UDlORdHmeYp2SxWheh/t7z3hls=; b=YXr2iPdjVc+M1m
	7V8RGRCGzLblofYzD5JTDU7DV/0bJquC99k8jiIvqR+JEjDNfwr4d1t5586M22zJy1o5/8hArRbNo
	vedgQOlIw9sBo4WOlDxeALv7JJc6E8aI5sjrQ8JAk32XPSAgo8dq6xJKyjU1MjgROYx0TOxfjQ2Vk
	l/l0UY/d5RO7TE3GyJfLDZlwYJh3/xxf7HcaWI140CviVwgzVaU8Nl08y7vMmWMc3oMIsC4VtR8qa
	Z2lijmWA6xCrx7c/4Wqcjk8tGXfUKb+Mz2BALjBJ9nuWqvPTxo3aN1S7pY+mRmKsC71S1iFzq7VTK
	/j0XK6W7dI63iLih3SaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRIJ-00000004037-357k;
	Wed, 23 Jul 2025 04:41:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRIH-0000000402Q-2N4T
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 04:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FB7F45600;
	Wed, 23 Jul 2025 04:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B89C4CEE7;
	Wed, 23 Jul 2025 04:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753245689;
	bh=wwIY2xZCBjZZJz2L/BRVUGlcwY9EU7yshxeruIN26XA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tfm/xn3hdAnkKPGn1yixfoAD3w2ta11qQNWO1UQMR9fQxllwA9CizXX4AyPUpNLvB
	 CqYGcUdfZvt19Xrm60Y3PIIFlIwzJxVF9r9QP3lyyjtReoFcu34oVe1wUb1wklpHI7
	 cRz98aBanVXpNA5PSR4H6RMSJ+SUWmBrOP7G6wOXr/qlEyYy6JbvCL7qiDhpTwjIL3
	 /1cfQbmOvflo8j1d/vjauTXjotxqp1LBhITvewsoh4rW+qsfW/Y3u9S+XM0oO99WJX
	 NBMTCnUb2QWjozmJLY38VgrzhStaraq7cREWOeJIJBSqMRkdiWuzRolv5b+F/DWCwt
	 PFLSd+90PCVZw==
Date: Tue, 22 Jul 2025 23:41:28 -0500
From: Rob Herring <robh@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK
 for SSPA
Message-ID: <20250723044128.GA1207874-robh@kernel.org>
References: <20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com>
 <20250722-k1-clk-i2s-v2-2-2f8edfe3dab4@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250722-k1-clk-i2s-v2-2-2f8edfe3dab4@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_214129_620935_3A1D0709 
X-CRM114-Status: GOOD (  11.82  )
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

On Tue, Jul 22, 2025 at 03:36:31PM +0800, Troy Mitchell wrote:
> This patch adds macro definitions: SSPAx_I2S_BCLK,
> to introduce a dummy gate for i2s_bclk.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  include/dt-bindings/clock/spacemit,k1-syscon.h | 114 +++++++++++++------------
>  1 file changed, 58 insertions(+), 56 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> index 35968ae98246609c889eb4a7d08b4ff7360de53b..6914ccf5be45a1071d5b6eac354cacb67888e00c 100644
> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> @@ -123,62 +123,64 @@
>  #define CLK_TIMERS2		41
>  #define CLK_AIB			42
>  #define CLK_ONEWIRE		43
> -#define CLK_SSPA0		44
> -#define CLK_SSPA1		45

> +#define CLK_SSPA0		46
> +#define CLK_SSPA1		47

Uh, no. You can't re-number things. This is an ABI and you just broke 
it.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
