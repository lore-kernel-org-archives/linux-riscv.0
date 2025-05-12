Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF417C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twMZFog0sdTL2AhJRIigqd6PTTlWopeh7kAiDRHovD4=; b=wlmvtQ/LN1PlJf
	cMhLQPGHPWoAgIULFxfczKByvKFdekc8GzhMJLXEjvCRisOWyux/umx8imujqIEl8KWlVn6ftAUKN
	jP+QedxHyUsAbO1CY9IpAieHQdvpgiqfb3YlbyfkzHsz6srqshJW9t7dXEQ/XpMIQBsnDGcRxMD0V
	kQMaKcqtZiZPKOLPNoyADfKM+SCV2XBvtXL9+eGD2CwiKqqTFYbkh2ad6oMjWnUo5zhSStyc34vBR
	QU7BVHz+BbiQzS22gVkeRwtzcJxD9uvEb3KbLFQja9XgNrJDohJugK6wd1bGbpznaE/1f5KyEn24K
	X3SqEdRQOv/kTaz1DVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO2h-00000008fwF-2Mcp;
	Mon, 12 May 2025 07:57:43 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO1l-00000008fpQ-1ozI
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 07:56:46 +0000
Received: from localhost (unknown [116.232.18.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 867583430F3;
	Mon, 12 May 2025 07:56:42 +0000 (UTC)
Date: Mon, 12 May 2025 07:56:31 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
Message-ID: <20250512075631-GYA517379@gentoo>
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
 <20250509-20-k1-sdhci-v3-2-526c35feaa20@gentoo.org>
 <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_005645_492783_04300CFF 
X-CRM114-Status: UNSURE (   9.44  )
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

Hi Ulf,

On 09:04 Mon 12 May     , Adrian Hunter wrote:
> On 09/05/2025 16:22, Yixun Lan wrote:
> > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > SDIO, eMMC support, such as:
> > 
> > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > - Compatible for 8bit eMMC5.1, up to HS400
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 

If this isn't too late (as v6.15-rc6 is tagged), I'd like to seek
the opportunity to queue for v6.16 as no big changes during these
two review cycles..

I also know people who would expect to have a full rootfs support,
and this driver is sufficient to bring eMMC up and will make their
life of development easy..

But if you have different opinion, then I'm totally fine to delay
it to next merge window, thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
