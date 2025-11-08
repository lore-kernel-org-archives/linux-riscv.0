Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12735CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 01:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlnVkSLbOi6FhNYbQbJQGKlMMg5Nq+PvNx8KrFcloBM=; b=klDHpNKClnNCXs
	0ed2QxJgNjPYIjhC3PcreF4U+9nz3KhYZ0jCW1gw0sBRm6+lZc0SYdKJBj77La40R5ox0XFenlb1s
	wIGt5LbY/OW1L+f42i3/T460S6V4cXnORiXiPTxF1l4EjAHkfxYxCEBZH53BxFpeY1sopkRR6t3W/
	C14F3hn9VrvyE3ibrQQ+qirHOyIUzm3++z8JoGDOzjPbGjbeatHBEq1E95+gwDV2Ht47q/a2013BA
	XKj8YoHe+VC0Wrm3Fef9uBk7AIJi5kUXhTHORyPydgb4Y9Am4fsWIWvjsimOVc05L6EBgSIWZwx6s
	/vAMRi0CBTLCZYy75+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXmm-00000001xAa-3G7b;
	Sat, 08 Nov 2025 01:30:36 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXmj-00000001xAH-40lg
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 01:30:35 +0000
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 38CCD340EBA;
	Sat, 08 Nov 2025 01:29:58 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <pjw@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] riscv: dts: spacemit: add initial support for MusePi Pro
Date: Sat,  8 Nov 2025 09:29:45 +0800
Message-ID: <176243100596.329363.7295947572215829421.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
References: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_173034_028300_B3AE4D25 
X-CRM114-Status: UNSURE (   5.89  )
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


On Thu, 23 Oct 2025 15:28:28 +0800, Troy Mitchell wrote:
> This patchset adds initial device tree support for the MusePi Pro board.
> 
> Muse Pi Pro [1] is a single-board computer integrating a high-performance
> RISC-V 8-core processor, storage, I/O and expansion capabilities into
> a credit card-sized 1.8-inch board.
> 
> Link:
> https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
> [1]
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: spacemit: add MusePi Pro board
      https://github.com/spacemit-com/linux/commit/2cc22890635ded33856e2761b780688f54a49393
[2/2] riscv: dts: spacemit: add MusePi Pro board device tree
      https://github.com/spacemit-com/linux/commit/0ee59934662dfb89b43a8392e64ac4880c2fca88

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
