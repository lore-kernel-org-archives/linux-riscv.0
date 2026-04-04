Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97587E88D8B
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vv+52QhWeneGTENnkEAULYyKFNqdP2G6lkxR8f63hv8=; b=yLM7x6kKWqfs7U
	wGEM1E/UuMjNJsID/WV+WyZVgrxg54mAFSnFLMg7IWixD5ObRnqPDvWYa+11e5jdhZX9+XU2ZovGA
	99FTQDun2FELE3lFg8jEYkT3j97AQiFtr8SXYBvLoB/New3ChPfVkhHHNajmbuf+Y6n2nbQ8BFljB
	j5XS6us9GLAPBSYlEyZV3yD/UNAgqqTfMtXqcscybITpA0b9+Z6Q8je8XP6JtACJCX+52qzmKjjXG
	cXvNCPY3UqjpAe+Zqg1GqabqmSUk4qMCgABCEjoO6JGP4RCgTbthxWH25IbOYfvuFaaX/izDHVApr
	4UrglaSx3od09mbBFxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8zHB-00000003QKu-26zV;
	Sat, 04 Apr 2026 11:34:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8zHA-00000003QKn-1Aha
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 11:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C27560008;
	Sat,  4 Apr 2026 11:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4093FC19421;
	Sat,  4 Apr 2026 11:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775302490;
	bh=Ow9QhO9wfoF7Vmg/G2JX4vIid+D5TO7M8+RE/T6ptQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmZ68RU39l6GEIZun8e6WzYdbO86be3EcpU17/EAfhJZv347v/TM+QxiPaMbFpeHc
	 K4bMxLwFJBq8bSrHeAVv63/rAX7/V7gFMMrtBnIlHT8gwOMNuAu5ju0PhDxH1JOkhq
	 BE1T2BXRI+aqfuAxSUg53sxoPCgXYtlSSogEHojPe4us+ppePsvedzZsAqsQaZvOfW
	 vDYeAQo33yt4zz+qbu0bfCvEuKd/pZkQlAEDiD+bgI1QtXRUBqIfESa50DAJcehylR
	 mPuikA8MEO8zbOed65evwcniqk6g07jgYhNr1Gd2xm7T9zyZ/Uj9ST/tkOnjHCvMG6
	 QuZsP5sMcUIqQ==
Date: Sat, 4 Apr 2026 13:34:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, netdev@vger.kernel.org, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 17/22] dt-bindings: clock: Add StarFive JHB100
 Peripheral-2 clock and reset generator
Message-ID: <20260404-valiant-auburn-raven-c24be6@quoll>
References: <20260402105523.447523-1-changhuang.liang@starfivetech.com>
 <20260402105523.447523-18-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402105523.447523-18-changhuang.liang@starfivetech.com>
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

On Thu, Apr 02, 2026 at 03:55:18AM -0700, Changhuang Liang wrote:
> +  clocks:
> +    items:
> +      - description: Peripheral-2 600MHz
> +      - description: Peripheral-2 400MHz
> +      - description: Peripheral-2 125MHz
> +      - description: Peripheral-2 GMAC2 RGMII RX
> +      - description: Peripheral-2 GMAC2 RMII Reference
> +      - description: Peripheral-2 GMAC3 SGMII TX
> +      - description: Peripheral-2 GMAC3 SGMII RX
> +      - description: Main Oscillator (25 MHz)
> +
> +  clock-names:
> +    items:
> +      - const: per2_600

Does not have any meaningful name in datasheet / clock hierarchy?

> +      - const: per2_400
> +      - const: per2_125
> +      - const: per2_gmac2_rgmii_rx
> +      - const: per2_gmac2_rmii_ref
> +      - const: per2_gmac3_sgmii_tx
> +      - const: per2_gmac3_sgmii_rx

per2 is redundant. Name these according to clock input names.

Same for your patch for per3.

> +      - const: osc
> +
> +

Just one blank line

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
