Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83998CCFA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqzakzAecGUesrVzJd+uwPVhk6qf59SbTdBb9EKnFJM=; b=KEp4VlipoFyXgu
	oYq4GWFPQ2G3H+sfu1jTjzAG4rP3e5qrTkdFME/TVJly8e+76We5ZD9G8qrgpS9ru+jzw9KwJVtXC
	rbvxbYJ2QMdY7Vxa96WOBGaEGVlmG0R3HMDMI+y97PGz1OmARbqfL4aYGb7b4P8A9havQGEHE1Wrc
	GJR6TVGysdNxXAqdpyMZnSl9KBV6u/PxkwHrKW82rATOQxgCYttz5tTd9RqgCbaJ01Lajqdf+oFiv
	aViIeKfgi4k0GZuC2iCUKFnOHolO+a1c0dfDXpZqJth5NwMLy8FZDuAkVO4y1R8+Imhm7yUUJwxBq
	qCIWcmrOmkzLZxHrXSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8DP-00000008aiq-2aOY;
	Wed, 12 Nov 2025 10:36:39 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8DN-00000008aiU-1Sv8
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 10:36:38 +0000
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BBB72340BEF;
	Wed, 12 Nov 2025 10:36:33 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	michael.opdenacker@rootcommit.com
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4 0/2] riscv: spacemit: initial support for OrangePi R2S
Date: Wed, 12 Nov 2025 18:36:25 +0800
Message-ID: <176294344891.286285.2166158383229687355.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
References: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_023637_413287_9E99B680 
X-CRM114-Status: UNSURE (   7.34  )
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


On Wed, 12 Nov 2025 04:44:40 +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> This adds initial support for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is identical in die
> and package to the SpacemiT K1 SoC [2].
> 
> What makes this board attractive is its 4 Ethernet ports
> (2 x Gigagit RGMII with an external Motorcomm YT8531C PHY,
> and 2 x 2.5 Gigabit Ethernet with RTL8125BG on an internal
> PCI Express bus), its small form factor and its attractive
> pricing like other OrangePi boards.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S board
      https://github.com/spacemit-com/linux/commit/323256d11e01d5ee2a0a2e7b682890498b90b212
[2/2] riscv: dts: spacemit: Add OrangePi R2S board device tree
      https://github.com/spacemit-com/linux/commit/63e572b11464a233f45ad469ba64b8b9e68a9cd1

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
