Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B16C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSE3H+Vj9U5hsGKqQZWOhQ5kIF8RBxlABJQCet9zEdk=; b=nGzmyxtePW9jPH
	MZLNnNQc2PoJFF6E1Kt+/9Z9ArREaJnKWwhkfjfhglX4UOCSs78yWwMkr+0rp1xeK+STHIXZSiK3r
	aNINxhNnNfmIkDNmFkx4+q4cxZBSK8mQknlKlHer6/K4CDTBQw11egsF9OA8OPZidqvJMP8RTkVhd
	rTa+dO//xoamYXkIkrpOFAlPsjgYRE87gK9VJ48dNjA1vIpRc2wJXxrb9pz6z/mX92LLhYme/svGf
	RfQKfC3x26ncSluLgHUjxuW2tt51T1XT3p/SSRkdHj38U0GQc97x49K2RZtuQZgUSqhJsNRzTuwlz
	KWkRL3VYBcWa/MUqz6og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog6u-000000055oh-1ozo;
	Tue, 28 Jul 2026 11:36:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog6s-000000055oa-3xU5
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:36:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0746960051;
	Tue, 28 Jul 2026 11:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702EA1F000E9;
	Tue, 28 Jul 2026 11:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238593;
	bh=uX3pP76S/qlTRKFBZVbxoy2xc8qbjMlkLp0qhkXmDKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k+GSRIzMqHHcvajLyRfyxs/cTin3AHBQyjsRiAKR/iFMi2c7M5rjjZmxFoj6oS450
	 Z8IMiGVgxh8dYNlS/ystcEW7Sr5tXoj+JuzCcOQETGaTgfbjmM+/Byj/2vkMhWA+Ie
	 Y3WI3uoMdpmGgMfMZ2fA3Q1zoMC2e8opztjt64gs87VI0Wa2puTeLLksOR4oDpZ4l5
	 wJXiZK0waQeWI/IexjAEAVVAyU4IwZ99E1igp1uV72tV7GMhtMmIiXvjC84ZLBtdMN
	 RsD89T+wm4EvAOxJ4az4TyC603AKAbjROJJnitOFndsaCmVRoHOXek4OcpIyQOtWx+
	 Yjl4V11OiWhXQ==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Date: Tue, 28 Jul 2026 11:36:23 +0000
Message-ID: <178523830524.623317.15821976156314944479.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260725005804.373698-1-inochiama@gmail.com>
References: <20260725005804.373698-1-inochiama@gmail.com>
MIME-Version: 1.0
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


On Sat, 25 Jul 2026 08:58:01 +0800, Inochi Amaoto wrote:
> As reported, the phy framework can not detected the phy id correctly
> when reiniting this. So add the phy id compatible string to the
> etherenet phy, so the phy can be reinit successfully.
> 
> Note: separate this patchset as two patch for backport if necessary.
> 
> Inochi Amaoto (2):
>   riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
>   riscv: dts: spacemit: Fix phy id check for the phy on com260 board
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=6d6536c880febe2340d8d388f42660eccff5aa81
[2/2] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=9db839d52ccd9af67d460cb9ac893276a74b88e5

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
