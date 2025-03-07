Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC940C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJigm2W2+0Y2WIOx62nJKgm02l+clp6iN0FsgYhUyJs=; b=zAKoW4/fkWCzi3
	MIR5f+5iaIsOYEHdA2lQbnpFGJewX7cXdu5nNVFRbEJd4QwdUy/3KUHOCG3lVZK/Os4IWaUVNxNs6
	Bb0u2tIUe54MeP4IxoOaFfmx0Dfytq68GnJHfDkeEQjPnY5lZB5E9WVYOERraE4CV4UWs9H1F+5ux
	kzmMCjSIGJDKOF3ieZWkvOdRJVKZG3x29nzimOfl8sDdqyzAVEJ4auvErEpxHk5Z/KsUXq8L6U2mx
	k9NR7HU6qInxnsLDIurrbV9BeKw6Z2IL1kU28FPC7IK0Xl7E54GRc0KxvbDINmdyTp3CHwqstNNG3
	5i6py6lYrpgX2qP5f8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSvb-0000000DXrc-33cw;
	Fri, 07 Mar 2025 08:19:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSvZ-0000000DXqD-0LPI
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 836FB5C4DA3;
	Fri,  7 Mar 2025 08:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020ADC4CED1;
	Fri,  7 Mar 2025 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741335568;
	bh=O5yS4mHGI/dch51w5HPDfMdgFq2Kpq0OWX4IjLSKzZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzQlrVaa4RjdBeyCkD5UADcrV34MMvcjAG+N4ruhxpeXAek8mAx+n60Qv1CrN+Bwr
	 PhWmkhIayjQaQmS7RQNXMXRqEGK+eP9qbASGxqudKiDYDF6fuuk6FSdBtymVr0IJ1T
	 QOZnJUrZRWrq2OtUNDZ3nbXVTKuPymX3bXhuFQlcWUFL2XO7aFvYn4iEVdU9Xc6vvX
	 +9B512qSBQgaBnMJa8/UVIl4qpKT9j8puDdxJ0IwXlCE2W+A7ZngsOgokFhULgGm7R
	 doV4kG7xQ56qRQ49w488TLbwTbwMd0O7uwXygXGb0Ctb7+BPn3bFhfmYFJAUEpMTss
	 x5g9DM4k7He2g==
Date: Fri, 7 Mar 2025 09:19:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>, 
	Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Message-ID: <20250307-magnificent-piculet-of-culture-4fe5dd@krzk-bin>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-4-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-4-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_001929_162962_C8B72E32 
X-CRM114-Status: UNSURE (   6.82  )
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

On Thu, Mar 06, 2025 at 05:57:48PM +0000, Haylen Chu wrote:
> Add definition for the PLL found on Spacemit K1 SoC, which takes the
> external 24MHz oscillator as input and generates clocks in various
> frequencies for the system.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
