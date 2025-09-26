Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985EDCAC5AC
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 04:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhEqj/KspiBjxbh6OCz7MFPspHnV8o/H8PnLlRSClJE=; b=DT0xSq+vhrdpU8
	vb5dIbEz9vm9OaMG3jCtLNiAwQy6f5CdqZNKDj7xLZfHbXB5kzbzhhR7OtUPvRY7Mq3zKqNtR9yFn
	CViLB4aO1ifjcQI6x8Hp/adZKGG0g2WwLO2R50eVzkePy2ndrn4UeQl9G7uYWlJnMrTJ+AbLuGpDK
	t35AEdKkh/WFki1hfYUWwRRCcx+2VDbJb/BWbfK4fzDjZr6OLw0jJWPT4wsWVYwuhNpHoEoPSG2Al
	qiqYXr3YhMJDvRJGPjY0vQpUBDSfrsxImqCGghddKzkeCp/izEekY7ctt8VLokNCdPbOdNODZkeie
	iKQzcc2qVMBOrBPX5sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1zjz-0000000FbKr-3aI9;
	Fri, 26 Sep 2025 04:07:27 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1zjx-0000000FbKX-293G
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 04:07:26 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 01DA2340E85;
	Fri, 26 Sep 2025 04:07:22 +0000 (UTC)
Date: Fri, 26 Sep 2025 12:07:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ziyao@disroot.org, junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: define a SPI controller node
Message-ID: <20250926040713-GYA1324993@gentoo.org>
References: <20250925121714.2514932-1-elder@riscstar.com>
 <20250925121714.2514932-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925121714.2514932-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_210725_571506_B98D829D 
X-CRM114-Status: UNSURE (   8.12  )
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

Hi Alex,

On 07:17 Thu 25 Sep     , Alex Elder wrote:
> Define a node for the fourth SoC SPI controller (number 3) on
> the SpacemiT K1 SoC.
> 
> Enable it on the Banana Pi BPI-F3 board, which exposes this feature
> via its GPIO block:
>   GPIO PIN 19:  MOSI
>   GPIO PIN 21:  MISO
>   GPIO PIN 23:  SCLK
>   GPIO PIN 24:  SS (inverted)
> 
> Define pincontrol configurations for the pins as used on that board.
> 
> (This was tested using a GigaDevice GD25Q64E SPI NOR chip.)
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
>
Reviewed-by: Yixun Lan <dlan@gentoo.org>


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
