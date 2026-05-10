Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B292FCD3427
	for <linux-riscv@archiver.kernel.org>; Sun, 10 May 2026 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CP9KgTLP5VqmYS2fJHAx1mtgnefnaBSM4bHRNebWuSE=; b=i3zMBrFCWlTWoX
	c53S4fvGV9S2F95VXiw0SKL3hCGH36ENE6H64SDlTiQygfXLmwP8GR3H6IR9TynoQuYMtN/yZqqpn
	vAokdT8cRE+QmFaLMAgKX4UN1Rp7pYVGuSpkXOkqpgRTxkpLpf31OoffmdPumUlvKLqNRrTo/b3hx
	fI1i1vaMiun0Gr3pr4dF/BRzTACC1N22Yy6ICqM+uq2tUMewfqpMGqYqz8kiPgLElq8WwOf+XRPJU
	cZdmC7eQU3V5gHJgieqzSyjkSs2lkCb2nHF2ZFb5sT802bBf8dr5nS8pdFC4Kqxa/Isr1zf8I6sgY
	2onHLhkTDbj7ZhF1NUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM1ds-0000000AaSE-333m;
	Sun, 10 May 2026 10:44:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM1dr-0000000AaRu-2C9e;
	Sun, 10 May 2026 10:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF18A60018;
	Sun, 10 May 2026 10:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D820C2BCB8;
	Sun, 10 May 2026 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778409848;
	bh=xNiK7MIv6vju5B1sy4IAoMXDD3cGJRPMQPKQthwEF14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Neavf/7wK2DCR2B6tAVILu/VehimNaESaNkCvEbXI5Z5+4Ht9zcJ7RlKJx8e+zr0J
	 NOO4Nbw9/k9ZKR6RrUU7GDt2CI6u8jWssCRsZjEs1zExMtIWwLbJjntkzXp7WmNSXj
	 zJdLkKuCv4QtRa8IizrsfzX9XZ9tI/lRiQJmOQ3HIscsLqowyxSpO7sV6bUEK1V7oR
	 VafMNrcEmGapFLd/PI4z7dvZ5Z/f9U/skiPLz9VGOevYjyRqNJWtmlv/h4FAe0kLan
	 sE5C6QKrSZLOEaz4P7WZDpeRN4jXgJXx9Snf4j4GRf0vOoXqW3lt04uU5UUsDn7YK+
	 ZlicU5XLpo3eA==
Date: Sun, 10 May 2026 16:14:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/2] riscv: spacemit: Add K3 PCIe/USB comb phy support
Message-ID: <agBhdKE7yPPgtvNc@vaman>
References: <20260430022843.1090138-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430022843.1090138-1-inochiama@gmail.com>
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

On 30-04-26, 10:28, Inochi Amaoto wrote:
> The PCIe/USB comb phy on K3 is a big phy that contains multiple
> standalone phys for each PCIe and USB controllers. This phy is
> required to configure a syscon device for mux configuration and
> calibration.

Please check https://sashiko.dev/#/patchset/20260430022843.1090138-1-inochiama%40gmail.com

> 
> Inochi Amaoto (2):
>   dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
>   phy: spacemit: Add USB3/PCIe comb PHY driver for Spacemit K3
> 
>  .../bindings/phy/spacemit,k3-comb-phy.yaml    |  63 +++
>  drivers/phy/spacemit/Kconfig                  |  16 +
>  drivers/phy/spacemit/Makefile                 |   2 +
>  drivers/phy/spacemit/phy-k3-combphy.c         | 250 +++++++++++
>  drivers/phy/spacemit/phy-k3-common.c          | 398 ++++++++++++++++++
>  drivers/phy/spacemit/phy-k3-common.h          |  27 ++
>  6 files changed, 756 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml
>  create mode 100644 drivers/phy/spacemit/phy-k3-combphy.c
>  create mode 100644 drivers/phy/spacemit/phy-k3-common.c
>  create mode 100644 drivers/phy/spacemit/phy-k3-common.h
> 
> --
> 2.54.0

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
