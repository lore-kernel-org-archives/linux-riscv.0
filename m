Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600DB606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=36DKaaC+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=YMwfenKF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ouRjM8ogotr7gzxi2p2dFYkGUbLTcAyNSXxybFNDI6c=; b=36DKaaC+9hPXiQtMJUdGd8gKKv
	mtnnkKkbTIhEDKhRuO/9XdKiLGb5or2FqgQCElfXC5381iS+sum046pyjB8eBWDq2P4Z6ooaPptog
	NQ2ksWYxQoAB3P7t+qO1izRlVodpNOqbYdYtkcjRUtvJD2iXHPMZoJYrGOE7UMBxKDSXAflOtaZ71
	c/zny+9Y3ng2v+wF7XhuKeqVet/iCeE13iBe2xzuzeTnbTBAWkZugf94M6Duj5PFZ+elavJUMH3X7
	W46xVXh8WSS/ysI40T6UoJ4aKLcGX1xssVl7ZyeVScENAK62hrHzfVjyWxKdAaieEPSjQvwQrbv+u
	yVlKqqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmvk-0000000AHq2-0PDX;
	Wed, 18 Nov 2026 21:11:00 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmvh-0000000AHoK-35Az
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 21:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tIKDVSjVcHAwPM4Udn/N9uTGDPYtfcGsqelMKv/u8Vw=; b=YMwfenKFu77Rd4cA50Ct4iw/xK
	+YUal108UpuW7zj8Ytkx7sxnfwT9P/GPoDsTDnNRgGysory7cLx829c4tlj8lUvBJ8a114rtvkZ+l
	aEgauDnKaKDcWfZt8WRyRuJyvGccC2GgEH35dI9hiWNqk2VxjIOOiDQ6lGOBHiRDAC7DqFfVPgrK3
	cjJ/qSKM8G0FqFda/sKjhmBNbBG5yAP2KaFU1EEFglmpdlDn4DK9XZHILHYUvHcptdyYfyhGewxTL
	sysJ4pUIxw9tOdKTuxo5WGfzysSwbAEJTsWYOr7lm1EcRX6weP1/daTWtZhfnxbMxQsKYFN0Uirr7
	Z9CQDg5w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTmvU-00000000TjL-0wR2;
	Wed, 18 Nov 2026 22:10:44 +0100
Date: Wed, 18 Nov 2026 22:10:43 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Wang Yang <yang.wang@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>, Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
Message-ID: <av4UUyCtDBJNU0h5@aurel32.net>
Mail-Followup-To: Wang Yang <yang.wang@deepcomputing.io>,
	Yixun Lan <dlan@kernel.org>, Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-4-yang.wang@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118085742.1817536-4-yang.wang@deepcomputing.io>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_131057_781367_C983EED1 
X-CRM114-Status: GOOD (  10.72  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026-11-18 16:57, Wang Yang wrote:
> Initialize and recover the K3 eSPI peripheral channel before populating
> its children. Keep controller register programming, clock and reset
> handling in the controller driver rather than in the EC transport.
> 
> Port the existing vendor-derived implementation separately from the EC
> client. The controller logic comes from the vendor BSP at revision
> 29b78afb484b, authored by goumin <min.gou@spacemit.com>. Preserve its
> register programming and link-recovery behavior.
> 
> No matching SpacemiT eSPI submission was found in the archived SPI,
> RISC-V and Chrome platform searches used for this port.

While this is correct, please note that there was a try from AMD to 
define a eSPI bus framework back in August [1]. However I haven't 
spotted any further progress.

Anyway thanks for your work, I guess this can also be useful for the EC 
controller on the K3 Pico-ITX boards, which drives among other things 
the fan PWM.

Regards
Aurelien

[1] https://lore.kernel.org/all/20260804115259.4065638-1-krishnamoorthi.m@amd.com/

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
