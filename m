Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921DAC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtXagAF5JGarW4nTkFwjllAXzT6DueqGZFwqAs4XWF4=; b=Q9OgBR/SM9Zqmk
	zP2Jzds9Wodg2h8LrVbHYWTPWUNikZqXLO2/SW8FYjneCz58N/JboZJK34qOnI6j4/g0+1CSNhJuZ
	gRVM7hl+i8rJUFUAusjcF54UHHZ4lGoeFmhWQ0OoPn3NaNX58BPrMfGPtq1gjw47NPbwBxVs5WjyM
	e9u/HTdVsy0qx0ssdWjhUuI1FUAWeH3O+ZgrGAhnVDKDfkZ7UpelY034zvgOcjCwFsLCrVDWYSJAk
	zmfXagOQLF1VsDrikzsZ7Cps23M7cKkmofnqkumAHJTHzOJZ8lIjT1pe1z0YcED96k/JjpnQJROYx
	Qh5Bjc8JdiIySP9l/eCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRYq-00FM9h-0X;
	Wed, 13 Dec 2023 15:54:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRYn-00FM8G-0C
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 15:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 70F82B81E41;
	Wed, 13 Dec 2023 15:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB99C433C9;
	Wed, 13 Dec 2023 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482845;
	bh=2y1sC29LZVf5pOO/mDDd70nkQpS3j6F+u18Jw81+VcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fa+vjghEYQ0QZb4ZiejM15rw46zji/7Gzsvf2LAZB3W933pTv/Tg+V9MeSa+WaEXx
	 wzA9dbitQYvjCM68noceSUh3BUyRIKPFX8MXHilP66g45R2+UHY1mxzCIVnPZhmsGz
	 nssRld9YUiq0kRlKfJ5SWsfeF1tQzGPefMR38OeG0MYtjPJVehcGC80j39arrmZCFZ
	 pk+xRIWaRhh3gfH4mDdhBxSbiCp31MxmRyPw190pYPsC39MTC8VMVpKtfILskV8CZ3
	 8SjjT3UH3jgN/7THPi5rAgp9uF8ct/4jlvvRoA+TOtoywK6RkfyZR98WuNdbaDqqsT
	 bT+JrUroiOb2w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: (subset) [PATCH v2 0/8] Add JH7100 errata and update device tree
Date: Wed, 13 Dec 2023 15:53:56 +0000
Message-Id: <20231213-animating-ambiguous-b8267c78e335@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bDevohe/TkJ99xD3EWfy4Mbir3mmI5PygrNqH48gvbE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmVlydV/7r2TMbr1Dymn6LXFj5242m78l/nkvrWdXFmP X6LFyYUd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAih+cyMnx/p+8+ZVKr1+Q+ 0XUbvvEemfFVuMno46acPSHaJ49tfHqE4b9nseD609fOXraw55JYuat/dXJWtuj/bDu+DUV7fx/ 458gOAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_075409_547222_DECF7EBE 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 30 Nov 2023 16:19:24 +0100, Emil Renner Berthing wrote:
> Now that the driver for the SiFive cache controller supports manual
> flushing as non-standard cache operations[1] we can add an errata option
> for the StarFive JH7100 SoC and update the device tree with the cache
> controller, dedicated DMA pool and add MMC nodes for the SD-card and
> wifi.
> 
> This series needs the following commit in [1] to work properly:
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[2/8] riscv: dts: starfive: Group tuples in interrupt properties
      https://git.kernel.org/conor/c/dd3c1b365fe9
[3/8] riscv: dts: starfive: Mark the JH7100 as having non-coherent DMAs
      https://git.kernel.org/conor/c/ba0074972ee9
[4/8] riscv: dts: starfive: Add JH7100 cache controller
      https://git.kernel.org/conor/c/d4b95c445cab
[5/8] riscv: dts: starfive: Add pool for coherent DMA memory on JH7100 boards
      https://git.kernel.org/conor/c/0a99b562e815
[6/8] riscv: dts: starfive: Add JH7100 MMC nodes
      https://git.kernel.org/conor/c/a29bb6564e12
[7/8] riscv: dts: starfive: Enable SD-card on JH7100 boards
      https://git.kernel.org/conor/c/c548409cfe03
[8/8] riscv: dts: starfive: Enable SDIO wifi on JH7100 boards
      https://git.kernel.org/conor/c/56b10953da7e

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
