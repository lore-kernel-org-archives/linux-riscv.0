Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443FDE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 20:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZzUEW1hPzwsy2YS57vH6y5P5xZo5B31iSbLYPrVSno=; b=ux9TR7zCqQLCy4
	HnltcvGZpBa+ZaUy7Aq9bp2e5ZfsFS5K3K6XSNcMVK44yGjOfvPAKAfvjboB2U24U+EPwk+/eWj/v
	LhOah1HJdklyJ6nMoIcD9IZj9K/fL27szXUqwfzGP+yREdoSCejx9tYMKZyDpVRdDsUH0e4YpPgmk
	7FzuuYcO4xRZSdQdXoeWwPoBBhCZFIpxfUe9Ixj/807+pVk4u4o+tL/7EiQWE0SCFFYYZiPxFM8rG
	uWUk2+GZ1g3gEgSyOeesaPxUgRX9bZkVhrcMtRoOZoTUXHsmebVDhO/2akyGlzhlpnRJEtMOIHZZI
	H+1/ZTtxVSb2AvegSF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHSd-0000000BDmz-33qR;
	Mon, 16 Dec 2024 20:12:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHSb-0000000BDmT-3nnR
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 20:12:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A2BCA41A7A;
	Mon, 16 Dec 2024 20:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24015C4CED0;
	Mon, 16 Dec 2024 20:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734379976;
	bh=0ZbyjzgC3dHjGKp8RZR5Ahq6W5KWOhfGSyCWXHNwsIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pGAgjiE81L4S6Ic6+1dYnB4u9n6HR1VQXWRWcl5EevUBW4ad9rMlppiJJ69GkX7in
	 sluke/vuJtbMbNzNZj+7Ud/wS2MwETmdMhL29a4UAbVIsYAB3iRMSpdIFIWUv8dpAW
	 xS97vXz0GDgjVDnUICNdLgQ2kTSkvYcNlUXSE+frlocxRkMSL9fa4zQKZdZyx2ADPG
	 AHA9IAzbwu55kuUKjBW/F9VD6oiz78Ih+foOD7PHdhv1EppvzGcTRQ2RrgMPnv4drE
	 gPaLkP0pYSollYN1vD1SmY47YbIQuhQUlV9B7Y8n8NIwDjqGoFhDOBHIkvS+Lh2sBl
	 6DamSxCbzNR7g==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	E Shattow <e@freeshell.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions
Date: Mon, 16 Dec 2024 20:12:45 +0000
Message-ID: <20241216-freemason-suitcase-b51553eb39d7@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210042002.165297-1-e@freeshell.de>
References: <20241210042002.165297-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=316; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=mpxJW/4UFb2dGz8JVlLmLF1WTAywGMOwpepePhdbuhw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkJnfsnt4gfPrL2eM4T14RGjgO1HIo6AmGPm5rq55k7B L+2a17SUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl8mcLI0HIw8MrRyNnPTpp3 8t19Wd2yMV7sYM2Fn8FH5qm8uz7R3Jvhv9OVSqmrHwPtdBa1bfLLDb60JJN/nWIcQ8jcau3Xr4J 92QE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_121258_009120_C13DEAB6 
X-CRM114-Status: UNSURE (   4.94  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 09 Dec 2024 20:19:56 -0800, E Shattow wrote:
> Fix a typo in StarFive JH7110 pin function definitions for GPOUT_SYS_SDIO1_DATA4
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions
      (no commit info)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
