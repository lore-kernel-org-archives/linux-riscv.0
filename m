Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE59FC3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NCL+7z8OGAg9+n24vlGfZTvEBRRJcJnu7x8paEEdKk=; b=n3+h84SL0ehB/v
	zWBswhfrqTUId6DHcb4An0hKn69LxArycFQag+xEVn/Qxf7JEa6f08VNBAuu7xXnYzX5PGE81Qbex
	bmI4bItfXhr3icbDNXXMXAVq9CPEsDPAbpzpDA4qN7l2Hd4/s9vh0t7bBjZid4b9CHkcQIs5lmpAQ
	ABloBCVj5oa6ZD72jxtirgwMLmXYoF/x14GgugANfwFakaSFNMR9zM7q2G6eRYwOoQpBYZdogZ7ew
	j/RMxUv3nA+wemZctQpTe3R4fwjovTXs8EqW9ygBhXLdCmGtnW3Z1FFjvwruBawAv5GZ5m42qyC6d
	38BoubUM11UHYZ8XMV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBw2a-00000007WK6-0rFq;
	Mon, 05 May 2025 13:39:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvtK-00000007V4K-3PSn
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 13:29:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvsv-0001kY-OL; Mon, 05 May 2025 15:29:29 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvsr-001EmE-2j;
	Mon, 05 May 2025 15:29:25 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvsr-000KtU-2N;
	Mon, 05 May 2025 15:29:25 +0200
Message-ID: <a21bc1518141c38b064360ff4c2b7953bfdfda41.camel@pengutronix.de>
Subject: Re: [PATCH v2 05/10] dt-bindings: reset: sophgo: Add SG2044
 bindings.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Andi Shyti
 <andi.shyti@kernel.org>,  Thomas Gleixner <tglx@linutronix.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Samuel Holland
 <samuel.holland@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>,  Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, Chao
 Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
 <looong.bin@gmail.com>
Date: Mon, 05 May 2025 15:29:25 +0200
In-Reply-To: <20250413223507.46480-6-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
	 <20250413223507.46480-6-inochiama@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_062954_850360_6AAD9BD7 
X-CRM114-Status: UNSURE (   8.47  )
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

On Mo, 2025-04-14 at 06:34 +0800, Inochi Amaoto wrote:
> The SG2044 shares the same reset controller as SG2042, so it
> is just enough to use the compatible string of SG2042 as a
> basis.
> 
> Add compatible string for the reset controller of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Applied patch 5 to reset/next, thanks!

[05/10] dt-bindings: reset: sophgo: Add SG2044 bindings.
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=1c64de886b88

regards
Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
