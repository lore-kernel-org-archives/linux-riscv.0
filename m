Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2925CF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54KYXVxpZ4j7mZtX4IAUFNfinLzGomAGogGmwGzONFI=; b=WMB/Bvh1qDESyx
	apZ6JjB3N/DBo9/JgmJR+hvER8/FFFHFq9xtC7JjvA5QOIVSTSC5VOzOYid/2zJGH0ty8MClRvEFu
	xzwA64armt2/eUz5sHnQTMS6uIhuZ+floRzVQZT3LUN8q54IunrXuJBhC7eM5hfWd+906F7GtX+tP
	sGYGAwXeEZKcTXIHbO6k8mlIyP7fFXZvOXDyArtEbfFxXp7w1Viaz5agq8i7ilXnJs6KpYPUE0opz
	wrdK3Ydn2/c/RxYJcDQa+bkmTLrPeGsKLwRJ7OvGqgLO4dTsu2aBEYSqSM8zV7PMDK5wQFKmQ4JJ5
	WOyVEdI3W76Btu+flGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7S1-0000000703L-2IrU;
	Thu, 20 Nov 2025 16:24:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7S0-0000000702v-0cH5
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:24:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 463CC6018D;
	Thu, 20 Nov 2025 16:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2303C4CEF1;
	Thu, 20 Nov 2025 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763655843;
	bh=yE0HGlgQMyWuwGMkFr6IkxtA9ubA8hTIp9QK5QW4fME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGfUdH4N8DBhfHMzjUXtnDrndgpJLKWpXH2M3I3XWXHFybjcnAn7THGLEi3MYw+sX
	 ACYKPl5rrenNysrfVwAxeBgtqYzw999iEX8IR2j9NYaqxSzfEE8R2VdZQwXRFxxix+
	 VEZM9ub/Q1aD9E2/1+wM9opZjOy8bED6AJGBbdmHV3Qhvy0O/FdaFZKfGibktmyicX
	 wrb/ZotulBGSZ1kiE+/8SnZmyurulCCjHUgb5mrH9j9sa2K15Wwg1ifgZ0vzNZgn8r
	 1eSOikdPs29MFFovDEq4cQQ0AjxEGiOcnRXNTGH8urada9d02J2jS0S08iJw+hoo5Y
	 EIYPA9L/s0YBg==
Date: Thu, 20 Nov 2025 10:24:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: riscv: Add StarFive JH7110S SoC and
 VisionFive 2 Lite board
Message-ID: <176365584062.1484282.2905349748406374384.robh@kernel.org>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
 <20251120082946.109378-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120082946.109378-3-hal.feng@starfivetech.com>
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


On Thu, 20 Nov 2025 16:29:43 +0800, Hal Feng wrote:
> Add device tree bindings for the StarFive JH7110S SoC
> and the VisionFive 2 Lite board equipped with it.
> 
> JH7110S SoC is an industrial SoC which can run at -40~85 degrees centigrade
> and up to 1.25GHz. Its CPU cores and peripherals are the same as
> those of the JH7110 SoC.
> 
> VisionFive 2 Lite boards have SD card version (default) and eMMC version,
> which are called "VisionFive 2 Lite" and "VisionFive 2 Lite eMMC"
> respectively.
> 
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
