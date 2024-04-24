Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00450C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 22:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbX48lm0o1ku1OA8JAzEsr6ogeOORVfq2UXaVPYLrWc=; b=y6+qozz6e5Ap9R
	vOUhwZCweptMCnx1eq8OcJLBEw0t5jPdpzJpXf21QKQjApiFwfXrUA3NBV5Hp7ilxS4vRFHav7n9l
	zu6BzWYXs2ctQ8wKJNkkgzOnrmBKvj/zKWhJ06k4Kj6lmLHL5p+kD11NSkseJ6/9XcNkeykXcKARH
	cRWKFjFwy8v1/B5vmEBLPRGuMMLi3lUaWj7V/oO/K9jL2jAlleGQsyfazq3kkjEqOW+fQji4b9NEE
	gDJhy5a0nQnVg/wi+TKT2ccnyL2JpEfsqSTemymDVnSevPHQER1fHolafHshRb5DWrh/Pn+GjzmgT
	bIz6UbKx73bSZeMNlPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzkjK-00000006Ars-2Qw6;
	Wed, 24 Apr 2024 22:04:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzkjH-00000006ArH-2v35
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 22:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DFDCCE13E6;
	Wed, 24 Apr 2024 22:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BB2C113CD;
	Wed, 24 Apr 2024 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713996276;
	bh=ExMY2DGUIWSWHmlNIofPsgB8GGtX0pH1hq3K1IaRN+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOTbOX7n9SyqWouZPINt8hRWgfHp50GI3RR0vlwFWRwu8VxSx7W8UGc3uBEcGpOtY
	 +1aHPLIFTuleD51AdBad9RJ07NjR9Ul8dYPgNb/G3a52bDUKon7ImnhO1CN3VIPjNc
	 HmPX+vQaXfwZPM8xwW5FqiYz0LJCU8IdemVt1RD67amUSi4gPUsNfOVNgB57cWGErt
	 aUOEL0tjKykv7ORbbu+YRRZ1E1GCT5ktoBfjHQ06Obuz6jzoyBGw+j4LLdBsBFsfUv
	 1cNo/tHc04WorrdbI+hM9RJpej8XJwlZxDvXivhZ7McCHJIv0HaSWuG0+MPc+RRfEF
	 PFILxUhX3oI5g==
Date: Wed, 24 Apr 2024 17:04:33 -0500
From: Rob Herring <robh@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	jeeheng.sia@starfivetech.com, linux-riscv@lists.infradead.org,
	leyfoon.tan@starfivetech.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, devicetree@vger.kernel.org, conor@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: cache: Add docs for StarFive
 Starlink cache controller
Message-ID: <171399595085.782407.16477944917789511195.robh@kernel.org>
References: <20240424075856.145850-1-joshua.yeong@starfivetech.com>
 <20240424075856.145850-3-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424075856.145850-3-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_150439_948543_68A93835 
X-CRM114-Status: UNSURE (   7.40  )
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


On Wed, 24 Apr 2024 15:58:56 +0800, Joshua Yeong wrote:
> Add DT binding documentation used by StarFive's
> JH8100 SoC Starlink cache controller.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../cache/starfive,jh8100-starlink-cache.yaml | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
