Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E626CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YRtyjGqWH9THwKMBGru4PtyX/kT6Bx8xYLC/Sw8nT8=; b=w8tSIE/hvCJZTx
	09lIyifcCXguI5U6GbrhGldcSTOjrFRvn/DQucgPqWtat4qhf8iT8cLDTbE6XR/Kc697kNbvIr7tv
	KxpOOVnSjWSV2O9opQDRFMMMDlhNeqd4cX9tdf0XpXJ/0xcKB9CjsV4HHGq09fHEmph2tnaWyilqM
	UegMzThEPIwtE+VP6+6HAw2+jLiLL0L7Vo7nqbZBF0vlSbRFzQFOPyOO72yPSZdIlx5YkX7L+jozo
	/87oE1SN5IQnd4o4xr47wTZ8e4qJ2ySLBEM74N8qw59Bf3XyfkD9t+YTHg1URN7dQmkDLnn+NM4N/
	ziZ7cbeqxHBcj0e7IyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTvQ-0000000EHrv-42W4;
	Mon, 11 May 2026 16:56:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTvO-0000000EHqO-2Ekm
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 16:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=L78XUyfmd1N5LDsAK22uGyO5m/vZ7XFauhOa9Q1DPPA=; b=mJbiTZwpBLn1iJ9s002v6d53kF
	7ltMVdCI3QMDRuKY7nS6SB1R1fdJNnWumYyoperh77ipD4k5J/eXJ0A5OxPDP2U+Wxu0e5W976yxn
	Fx+6njvE/EaDADFnsK1iG2R13jjYl/2oicpHYZu46xcL0ehRB0eIsqz548jxMEfGOfjBxtCwluHQF
	QwBu1I1AcnCkeg8V8yPf0ZuAzGXcDTJSt67J5+Nlc7qRr62Cs90MdsjGyYhWvCcOBOnEI3PXXAf7U
	ExQCpxGrzxevFd2KUhimBfG3aaAqZwAq1dhaazcmdkkQh8O+zGYHdV571/XYWp6t7tpwqdmRhzlx/
	rfoAAA+g==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wMTv5-00000003ZV9-2MVR;
	Mon, 11 May 2026 18:55:51 +0200
Date: Mon, 11 May 2026 18:55:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	Margherita Milani <margherita.milani@amarulasolutions.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v9 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <agIKFnO1i9eJWXfY@aurel32.net>
Mail-Followup-To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	Margherita Milani <margherita.milani@amarulasolutions.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
 <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_095610_604296_34C76A99 
X-CRM114-Status: GOOD (  10.25  )
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

On 2026-05-11 10:54, Iker Pedrosa wrote:
> Add complete SD card controller support with UHS high-speed modes.
> 
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
> 
> This enables full SD card functionality including high-speed UHS modes
> for improved performance.
> 
> Suggested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 

Thanks for including the card detect change.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
