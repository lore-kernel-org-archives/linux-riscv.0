Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7711C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 23:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zqrJ1iE6x1vyVuF3og+Bw2neGLDUsF3NYd9IJLoOEE=; b=oxMWqFI6Sg7YFp
	3Gt0I6RpaAgajoGiBk63vLAs0g0MYY/WE/x1utjXsqlR1HKh8ta0+w5JJ/A1yBOg59KPEHm/kBpkP
	JIEhGWfYMKy9O3q9FGEC0RT5m+PYLJR/chj3S9QbiKxQhiJXftrxOgMGTQ+t3I3KSZ56tkHuNglbS
	SkdGiVl8yNNc74retNaL3IfauoJiu4Hl20LsRfndXnBpxH/+9gRTXGxLL7f0MQJ2bs4Jf0GcM/HV7
	YqGSg7CYWejgv+YYDGS1c28Xov9YiY5q9parKzuuDsTYCzzjgriOC6zitnCIFenUsgMVdax2tdy4T
	YIQiSZfd0HEDI/UngdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPCs-0000000DRsd-1deP;
	Thu, 20 Mar 2025 23:21:46 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPCn-0000000DRri-1gO8
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 23:21:45 +0000
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9FFC13430AD;
	Thu, 20 Mar 2025 23:21:38 +0000 (UTC)
Date: Thu, 20 Mar 2025 23:21:28 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: spacemit: add K1 reset support
Message-ID: <20250320232128-GYA10498@gentoo>
References: <20250320194449.510569-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_162141_469058_FA54DE8E 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Alex:

Thanks for sending this patch series

Can you also CC spacemit mailing list: spacemit@lists.linux.dev
it should be handled automaticlly in next 6.15-rc1 version as the
MAINTAINERS file updated
https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=4a0c4e723c94

On 14:44 Thu 20 Mar     , Alex Elder wrote:
> This series adds reset controller support for the SpacemiT K1 SoC.
> It is based on Linux v6.14-rc1.
> 
> It is built upon the clock controller driver that Haylen Chu
> currently has out for review (currently at v5):
>   https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/
> 
> It also depends on two commits that will land in v6.15: 5728c92ae1123
> ("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
> and 7ff4faba63571 ("pinctrl: spacemit: enable config option").
> 
you can use b4 to handle patch dependency, and currently you may got 
linux.riscv.bot complaint, but may fix later
https://github.com/linux-riscv/github-ci/issues/24

> The first patch adds three more system controller CCU nodes to those
> implemented by the SpacemiT K1.  The second updates the existing clock
> driver with a structure used for OF match data, allowing both clocks
> and resets to be specified.  The third provides code that implements
> reset functionality.  The fourth defines groups of reset controls
> implemented by the CCUs that have alraady been defined.  The fifth
> makes it possible for a CCU to be defined with resets but no clocks.
> The sixth defines three new CCUs which define only resets.  And the
> last patch defines these additional syscon nodes in "k1.dtsi".
> 
> All of these patches are available here:
>   https://github.com/riscstar/linux/tree/outgoing/reset-v1
> 
> 					-Alex
> 
> Alex Elder (7):
>   dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
>   clk: spacemit: define struct k1_ccu_data
>   clk: spacemit: add reset controller support
>   clk: spacemit: define existing syscon resets
>   clk: spacemit: make clocks optional
>   clk: spacemit: define new syscons with only resets
>   riscv: dts: spacemit: add reset support for the K1 SoC
> 
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
>  arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
>  drivers/clk/spacemit/ccu-k1.c                 | 393 +++++++++++++++++-
>  include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++
>  4 files changed, 539 insertions(+), 19 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
