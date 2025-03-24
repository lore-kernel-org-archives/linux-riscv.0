Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C6CC36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyDMV4aVEUycsvVKZBRgSFonpahGR5JmQ+/hIP6n1iI=; b=OlluBUZeMlwej3
	n+YMXsAnjzpmIYad1HqRuQjau7prOqHEGDrWEBmeuHvTSgKB8KMrSHoxjmQHTq6BnaicVc9yOD/yg
	/exY+DQb8ea9OQUbPWKZY8qL6LpaYxYrWHAPLCYAowQw30u6AUFpckc8SKO3gFJyWCMyIzFU9cUpo
	3zV+Qs8Y2RnBSTbUaiEJLHYG/Tuelj6kpEZHQEFvJjVDOS36XB3dfaV887sT6w1tUlO+hrwCIuI9w
	meEx2D7lma9Ur4S4NnR67WosE105rgvZvAf9xCIxuON/yPucTcGJIpNKUYGuL70n5lnZThy09Xn9X
	ZZAeT8ktHjSn47L6XSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twktG-00000003gwR-428I;
	Mon, 24 Mar 2025 16:43:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkhi-00000003ede-0c84
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 16:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AEBA5C6297;
	Mon, 24 Mar 2025 16:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D808EC4CEDD;
	Mon, 24 Mar 2025 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742833869;
	bh=gfXXiQCFAETf0jTJcsIlh59JFNBubS0WLf34O4y8etU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVy+zIOKcgk+jlVdsItdX1cqY1MqL1N9+iqr0YxbG4BiFkrD0ATC8oMKU2Ax9xSMP
	 XwpcRgrIdK/0b60JJy+nOFgC3abTB2W89zJ9sS650vorQ07s1gLl20RcUAdJgaApdO
	 i8wWsz4CS15XYwI+JsXxu6WHriRUJraQgE3NRDPrrlts/FWK11jmGnQ5Mz8ja2nMs8
	 1pV8wPEeYBfxkhaPx4+A8cv2I56/oL7GVPFYxcBDQ48uRfsZHoKiMJifJAACnfrifM
	 rL2SAaIAhHzHQANLKKDaHBGapLadtz54gQsO/ITTJqUdnW8gAhjglfhcEWBkctgDWv
	 2h9l7gAy3WStw==
Date: Mon, 24 Mar 2025 11:31:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eric Dumazet <edumazet@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-mips@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 03/13] dt-bindings: net: cdns,macb: allow
 dma-coherent
Message-ID: <174283386719.296457.5916372144709687859.robh@kernel.org>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-3-537b7e37971d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321-macb-v1-3-537b7e37971d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093110_227919_C0F709C8 
X-CRM114-Status: UNSURE (   7.82  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 21 Mar 2025 20:09:34 +0100, Th=E9o Lebrun wrote:
> On EyeQ5, the GEM DMA controller is coherent with the CPU;
> allow specifying the information.
> =

> Signed-off-by: Th=E9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> =


Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
