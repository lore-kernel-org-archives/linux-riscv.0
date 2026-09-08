Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9DC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOern31jqwyV2JW/JVEESi9NngB/xJu5WKC2ENSbZN8=; b=Rp8uhePQJXK+FZ
	mLIKMUkLpFk6Vh+bg7x7INWVgzpFwuGA3JTlMAQdMs/uRhUoZnKAXzoEEsocp0vge/PofP09sqfal
	XpWBYHaPNbEmVJWllnTgl8ksnX3ODTkOTcsOZyO1qyXbmbuL07yK/ivIjig0kUgVeZfT8SfDy4oun
	NvG/vhbLDJX7q5m1v3vRcBMLPEybmAzfcBjjyHyRrsz6nDeulMZN1FDVIR2BZhGErllSz2qtKX10U
	/KMlPOBSmDTW0dafuEcaju/4GdhzjmLndn/TCcVG8R/02oHspuHt+UGWidz5No9eb+YXUFDFi+p4p
	0MJ/L+/WtH93flNDRM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sRe-00000008ezI-2zv1;
	Tue, 08 Sep 2026 09:48:50 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sRb-00000008eyQ-0mUf
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 09:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788860927; x=1820396927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=si+pQMS2orFm2KYIwbM662sl0NYGSij8sMghKY+BowE=;
  b=H8rSi4893Fjuc8u/W4kXKLE2vpcQ/R9PGExoA39VMr9xCZXf6W9r0c7E
   dlHiKM0ywY1v+bQDvFCSrxhFd/cRk/6UQo06vFyADiwsuR002XKkCoOCZ
   9RPHEpl0VuHK7K1uKaWlk0zrSLYcmKWExQbjsrelokRlMJzMvOlDolkIF
   VvXUs7WjKM9TN7xnrvWe6mjwLDXOuNVJwF43kc+k+BpwXShEuUpqv8Ufk
   lDxK93hVsgGS0ZPVfKvRxc1IJsG5Z0IkwItYWKwjtUsdZFE/jgENnF6OC
   au0e84anMr+Y8jXuMf4CG9jZBS51jJW/bdJIIu9FCl+Xc6mm+AdmZqYUL
   g==;
X-CSE-ConnectionGUID: PywUpXb7T2+BqxWQ93cQRg==
X-CSE-MsgGUID: iYxezUrRQKyp76QAH9XH8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89301152"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89301152"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:48:45 -0700
X-CSE-ConnectionGUID: yiLn9v7XQR6NiVWkIyNgqw==
X-CSE-MsgGUID: fgg/IIrsQAy1UtuZOE0jPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="272879880"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 08 Sep 2026 02:48:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A666B99; Tue, 08 Sep 2026 11:48:39 +0200 (CEST)
Date: Tue, 8 Sep 2026 11:48:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 06/10] dt-bindings: i2c: dw: Add compatible for
 UltraRISC DP1000 SoC
Message-ID: <20260908094839.GF106095@black.igk.intel.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
 <20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_024847_334621_8AB10179 
X-CRM114-Status: GOOD (  10.23  )
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

On Mon, Sep 07, 2026 at 05:54:45PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> The DP1000 integrates four DesignWare APB I2C controllers. I2C1 supports
> SMBus, while I2C0, I2C2, and I2C3 support standard I2C transfers. Each
> controller has one register range and uses separate reference and APB
> interface clocks.
> 
> Add the DP1000-specific compatible string with the generic one as a
> fallback.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
