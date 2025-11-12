Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276ADCCFA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7u3whvtSEjEqn6+h5H0VevP6c/p0CXnpS7Q5pDUF8Y=; b=Gf/D28Bp94t950
	LmYUK1hIc3FijUccM88a9Qh0kGHDZew1i8HValenk0QD23/2yC8O47oBeLplCUIgpbBqQcKJGv826
	grACV82/Igh979CFWPmmO8i4yX2mVweHL6T3nbzvJXpP1UjIVjRCXnqY7clmBbQHOUw/Gob+3YxOx
	cu9XMQ1eYamKN8tKnWxtCvVzSwHjsrDZqb5W2KdU6mxB9c+85I96PIjbYwoeAeXZE1OBH418z4Oax
	tz/OtTX15OXbH33tTQIaBXQwKuwDWffgqRSWmx7AusceopxHTmwTHNlJBkLqJjUtu3Q55vpp3j6XB
	aw2lAPmIimtiJgqxBYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ81S-00000008YXL-3gF1;
	Wed, 12 Nov 2025 10:24:18 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ81P-00000008YWK-4BMG
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 10:24:17 +0000
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7577934102D;
	Wed, 12 Nov 2025 10:24:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org,
	pjw@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Frank.li@nxp.com,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	conor.dooley@microchip.com,
	fustini@kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Wed, 12 Nov 2025 18:23:49 +0800
Message-ID: <176294293577.242112.11591899263367700984.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022416_054158_3A49CDF9 
X-CRM114-Status: UNSURE (   9.58  )
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


On Mon, 27 Oct 2025 08:29:58 -0500, Alex Elder wrote:
> This series adds support for the SpacemiT K1 SoC QSPI.  This IP is
> generally compatible with the Freescale QSPI driver, requiring three
> minor changes to enable it to be supported.  The changes are:
>   - Adding support for optional resets
>   - Having the clock *not* be disabled when changing its rate
>   - Allowing the size of storage blocks written to flash chips
>     to be set to something different from the AHB buffer size
> 
> [...]

Applied, thanks!

[8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
      https://github.com/spacemit-com/linux/commit/41d34e0b5497f919229d32580fbe34386087458f

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
