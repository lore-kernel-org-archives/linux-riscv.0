Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D47CA0EFC
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMwbzxz6fBbQ39wPduBBoWFVjd106vsl/SWVohSZi/M=; b=yibyf4arpc4AeV
	RknJo0ymJNBZCUt6o2zHQc/F95g6IkVZ0cmHIs0g5T4Z5xvmgahy3z5kJovcx0bUwLBbo491ox4KL
	apaHiB+Ix9A+5J5XeLZUj0nniAN7andTpcgR17eIMPNkpCskjsas/IOjB3htx1hmpGRO4Z+FxXf4C
	TyZ1KvK3fYWH5MNgtSooWz4xrzfksVbkgyH6Zv0EFxUPyfA2kz5Hveq6XTMuMZsAF4dDdE322MoWf
	WFB+FhJb7mb7Lk8zJowPLFPCum0vW8GLeSCSfN6Xw0LnBDlyQoCOfGP2+UDza3H142PCj+KgYpcKN
	NoiRHIAQ7IeQYt7Zzb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq5Ho-00000005pxP-1PZn;
	Sun, 24 Aug 2025 07:37:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq5Hl-00000005px2-37lh
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 07:37:06 +0000
Received: from ofsar (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E1311340DAF;
	Sun, 24 Aug 2025 07:36:57 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: add UART resets for Soc K1
Date: Sun, 24 Aug 2025 15:36:42 +0800
Message-ID: <175602095097.196581.656734670747058634.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821152619.597051-1-hendrik.hamerlinck@hammernet.be>
References: <20250821152619.597051-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_003705_806168_1D323B35 
X-CRM114-Status: UNSURE (   6.39  )
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


On Thu, 21 Aug 2025 17:26:19 +0200, Hendrik Hamerlinck wrote:
> The UARTs in the SpacemiT K1 device tree are probed by the 8250_of driver,
> but without reset lines they remain non-functional.
> 
> Add reset control entries so that the UARTs can operate when mapped to
> devices. UART0 is already de-asserted by the bootloader, but include its
> reset as well to avoid relying on bootloader state.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: add UART resets for Soc K1
      https://github.com/spacemit-com/linux/commit/eba84c94f9597a82f143997bfacc75e5b27a37de

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
