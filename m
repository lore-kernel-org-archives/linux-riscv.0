Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA94DC83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 00:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5ZMoDNv+GNT8jmwxuu8ezVyYOgBuoPqjA/JxKvWRAY=; b=zVQgQbFs0rggPF
	BcjQzTsFILOyCfgpY7vE4cfZHNgsKcPb8Zut5/sFKaLaOBU6FeTl4RdhaXhcIjj8rSks90hZ/Y1p6
	DYsGU+e/a2ttvzz9F3hn3hgqE/XvObm3kKziUnlx58zmc2YxmGWpznihCg9YPuqZakALF1+D5f11J
	Vu42UeBdcDppp5Bj2fZ0OcBMhUnxDm9P/WyFzjD5QGDSCBYZ26n7VcfYbhnT8lUpLxBfExi2QDNiy
	LtSvnetEPlCcqTbmnc/S0nqGqRz5e6i6JCNtwjPg40CtpmhrLAsvHO20veVUz6PiirGxsbptcmfMA
	wSsECh+HGousTU90pmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeZL-0000000Ft1j-24Rj;
	Mon, 21 Jul 2025 00:39:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeZI-0000000Ft1M-47Xe
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 00:39:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6935443861;
	Mon, 21 Jul 2025 00:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3069AC4CEE7;
	Mon, 21 Jul 2025 00:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753058388;
	bh=DcAxps/FGdwNvvt1KUL0mg84vdvjjbvyVNUzZyC1NQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVXOMk0ouM5Coaraip90bgDOb+w452a4nPgiKLNRQ0k17QLIABHBTRf/Wp9Thtdmw
	 70ozK9bOxCAhB1n80sYSpx/6ptOWUdf+wNnEpvXhyJ1kk/S5WgsHWlaZZykpX1iun+
	 Z7U1d9GlukCtkVEQHvG4eEusM4Nr2V4x6x28ayGUXdCjWxCPD8UP51KIObxY9R7ZRO
	 S9+Fp67BSmq7l/nIhleQrenNVkIdyVaSrbnFL/LaB6Oyl0/vyYYvvNZ7lMH7yG2yS4
	 sZRKdg8RK4Dt/TbmL3jhj3k6wcC9ih6sPxddMSoiD/e61O42/A7ek38r01yrZSQg+h
	 6Md0qotk0QBog==
Date: Sun, 20 Jul 2025 19:39:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH] dt-bindings: serial: 8250: spacemit: set clocks property
 as required
Message-ID: <175305838704.3151611.2882961129510039332.robh@kernel.org>
References: <20250718-01-k1-uart-binding-v1-1-a92e1e14c836@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250718-01-k1-uart-binding-v1-1-a92e1e14c836@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_173949_038160_1D6D051D 
X-CRM114-Status: UNSURE (   9.67  )
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


On Fri, 18 Jul 2025 23:04:37 +0800, Yixun Lan wrote:
> In SpacemiT's K1 SoC, the clocks for UART are mandatory needed, so
> for DT, both clocks and clock-names property should be set as required.
> 
> Fixes: 2c0594f9f062 ("dt-bindings: serial: 8250: support an optional second clock")
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
