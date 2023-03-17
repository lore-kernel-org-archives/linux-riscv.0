Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B5DC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 22:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESrvsw+1q8nh15mMGiX7ERReqQm6d0/lAWb5YO62mY0=; b=SHBqLYkXi+FUDc
	Bs3Fvl6m3SDi5OjPnIl53CjoJszugRR0dp5CP8iLOY0k6al6QSWsnXEwnQa3DCf9kQYhpl4JPOE++
	4qzKUOxrdu60DSCNuv2wLgACxC/OarVVdeJPy1O/wFqjp66Dj2FS5EMiLwUs97OWrTcTnzXm6OfQh
	s8W7mvqJbxcQFpyl+mMp9al2+jEmxW1XkYW1Wi3qzuOWMtq/0xDtSaNUv3C/uhzo9zNqqXJlZqWFF
	aI/LEtlas3S1HyhA1dpImFQ1E/V0rzhpUSGVHBFItHpx0bdkRsaDfi0mF10yZJ5tx/PiNf3GZuhZu
	eKYjav3KH0jeqZe8DAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIKV-003YKq-1t;
	Fri, 17 Mar 2023 22:13:43 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIKS-003YJh-0h
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 22:13:41 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2EF9720002;
	Fri, 17 Mar 2023 22:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679091214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eqxKutKiqW8yb2sPT5I6IOs38EHv69itxPuXft2vTRA=;
	b=AbsH0TjoP6YcpQsD+UJ+eJekzztouvgcCeWA2NlIs0pjV7MpzkjbqVA48XdcBYQLK8f8IV
	g38lBx8f21+94whY7EBbNXB4OT9l/XbjfPrfUR+UQrElDTAd82JqXq1qm0q2HF4VeoCVxg
	hXjnzuYZ3sK7S6HiY8aYU8zOHwAaK/SFn77zRqWcv8c5ADq+RCcR8He/Ac9vc7eHhV7bXS
	/jL+O67DQidklXIf5le3d3+atjpZfiCs8TaLVtuFlhFcDFAFThDSxbmXfd7Iqbvbk8qxly
	XNFCVknlDusaQbfgP0m/5Cn5nAkwGekIz3Vn+eCEArSWqT8H+mDLsaLqx0H8cw==
Date: Fri, 17 Mar 2023 23:13:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: (subset) [PATCH v1 4/5] rtc: mpfs: convert
 SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Message-ID: <167909119653.115559.4747292512289955247.b4-ty@bootlin.com>
References: <20230309204452.969574-1-conor@kernel.org>
 <20230309204452.969574-5-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230309204452.969574-5-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_151340_406085_64D640E9 
X-CRM114-Status: UNSURE (   7.79  )
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


On Thu, 09 Mar 2023 20:44:51 +0000, Conor Dooley wrote:
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the Microchip FPGA
> RTC driver to use the new symbol.
> 
> 

Applied, thanks!

[4/5] rtc: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
      commit: f12f0c7da37c58da92bd4a6bdc469df7e0b2da5e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
