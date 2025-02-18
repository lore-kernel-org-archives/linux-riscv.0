Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081A2C021A9
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 00:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+t6ZsNBH78/B2lLP6QQWGHGU7P2z2J9qBE42SPA5/MQ=; b=YqOx//4hipiKNl
	N17NYdxHnExahzsV5tHpXppbRRvpAXD1moYFwdyyq8T3ha4r2b0Szzeimk+IjXm4E4SZMPYJAbu3U
	CxyaSH3T9mwj31eN10rfS/8R+AnR76wOCjxpIQagobJhtyv9bJYXnZ8+mI6XvwLMbL+B0JOjCGfQa
	Q1D+FevlIpO20zCIbcycX3SFKvfFJ6exCYl3K7ICuPDtrh2gidQigT9Y2BCHITw4KHjdfLAyKv6x3
	qDm6ihrdYeCKO5aJTbn6A/f3Ab85bUlJA3lvPk10u+8LG1VJ+LQHmgsTvbM2TEaYAJhIIIg1UphN2
	yQq82eHYLBX9K0daDf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBZs-00000006LSG-1mRP;
	Tue, 18 Feb 2025 00:35:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBZp-00000006LRu-2dAo
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 00:35:07 +0000
Received: from localhost.localdomain (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E6210343119;
	Tue, 18 Feb 2025 00:34:59 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: linux-kernel@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	javier@dowhile0.org,
	rjones@redhat.com,
	abologna@redhat.com,
	spacemit@lists.linux.dev,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Add initial support for Milk-V Jupiter
Date: Tue, 18 Feb 2025 08:34:32 +0800
Message-ID: <173979802066.53738.3069472182540355902.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214151700.666544-1-javierm@redhat.com>
References: <20250214151700.666544-1-javierm@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_163505_689795_DA698236 
X-CRM114-Status: GOOD (  11.11  )
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


On Fri, 14 Feb 2025 16:16:36 +0100, Javier Martinez Canillas wrote:
> This patch-set adds a minimal support for the Milk-V Jupiter board.
> which is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC.
> 
> The DTS is very basic but at least allows to boot into a serial console
> and get UART output, similar to what exists for other K1 based boards
> such as the BananaPi BPI-F3.
> 
> [...]

Thanks, Applied to SpacemiT's SoC tree:
 https://github.com/spacemit-com/linux/ (for-next)

[1/2] dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
      https://github.com/spacemit-com/linux/commit/8c8d2a19a3ad87d9344a5e58172f8e0c05c4622a
[2/2] riscv: dts: spacemit: Add Milk-V Jupiter board device tree
      https://github.com/spacemit-com/linux/commit/5b90a3d6092d9292d3c4fe4eef8969282e070ae3

The for-next branch will be sent via a formal Pull Request to
the Linux SoC maintainers for inclusion in next merge window.

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
