Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75551FB3CE4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sVdnyTIyTOIjkIlNbPtrAETVLGuWItRo2tLNt3iO/s=; b=xyGbiZmiXiyYQW
	fvktmMvJYfM+nVxyNiff51oeMc69ekKjGAhDAfdDXdFFmOEaUnjxaSqVxvlf68hIFEfj5El1o7zuW
	OIUqy6RPc+k8FRCDR0OwchQVT6J9x8n6c6SnvmQqnPxQgHtTaehU4cUWz5Tu2+eDeoaIME7+mu1fw
	mUsiX+MC4C/xA+DvhkYELhrnvNSX5zZDkbGhhrWHYsbpCZgUwcrYItXi9n2DmPCIhJ1ApzE4cVY/P
	NCJEdr/wXBpOlGPXqzQqtB67nivGM9BFy9USTt1cbWiZeZ3bq8onFixRkuVh9zAG6ee49hce6zfT0
	TtGTdGmIb+1eSUcfWHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78ec-0000000AwBI-1Hhx;
	Mon, 30 Mar 2026 09:11:26 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78ea-0000000AwAk-21E7
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:11:25 +0000
Date: Mon, 30 Mar 2026 17:11:09 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774861881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RWLL1ngJTwQYwWnnu+CvoNT76JVvFYBiVINVvbGMfIs=;
	b=LqTHpS3Oy8BE0FVueb0+OHKZbGIzEIAXz/ujG5sEIXVN1V7nvBUViVznOfte/SHGMNMtiW
	+F2FkUKLqtfkLudR9xNPOI/J2hEeDfEMZB64Ef0LSBUjhLFoylMdCt9B93lqr7U62ffDuf
	lPpbhVfPpXC1GUl9MYoC2/zkjR+brJw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v5 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Message-ID: <aco-LZmy7iTTFG9v@kernel.org>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-2-bd853604322d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-2-bd853604322d@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_021124_669118_1C287F4F 
X-CRM114-Status: UNSURE (   9.21  )
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

On Mon, Mar 30, 2026 at 16:38:03 CST, Iker Pedrosa wrote:
> Ensure SD card pins receive clock signals by enabling pad clock
> generation and overriding automatic clock gating. Required for all SD
> operation modes.
> 
> The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
> and eMMC operation as both protocols use the same physical MMC interface
> pins and require proper clock signal generation at the hardware level
> for signal integrity and timing.
> 
> Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
> SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
> controllers to handle removable card scenarios.
> 
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
