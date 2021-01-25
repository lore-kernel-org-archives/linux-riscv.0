Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B5DC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 23:58:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C78D22597
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 23:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C78D22597
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tPsfrshQZ464roKjjzhC4dPH3OtQRHd7R7QK4NtFiqQ=; b=WJAP4CMDHg3nMdblU5yjId56g
	MCyf9oyEZFvf0feR6TuEG4J32B5s+coxKXgzXrm88ZI0VxMLntz38FkUywR4v2UZEjICEdJI6/EKj
	4+XXbKDzm4mB8eBPAP5SnPc+zxsePfv0e4F2XaFv9aZOIkq+DB7YCLfnjYsd/p72Us//eELpg8yk7
	i/l26PC7WS9YWELvP10TOgnYdKo/Fe1FC3u+huU1k37ShxfKlkWX1gAnyn66+xivw2NhAqk7WaBGu
	XXo1FIhgWdQs3lSXrOHI6iI/5esLcUWg3xQNp5UagJPEQrOCdGNZxAkstZnBborpGlO9fCL5LOyGW
	kJq2FjKqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Bkg-0000ug-K8; Mon, 25 Jan 2021 23:58:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Bix-0000BQ-6I; Mon, 25 Jan 2021 23:56:48 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l4Bih-00066j-UM; Tue, 26 Jan 2021 00:56:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: (subset) [PATCH 00/20] Rid W=1 warnings from Clock
Date: Tue, 26 Jan 2021 00:56:22 +0100
Message-Id: <161161878917.2050283.12124477211963150680.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_185647_341070_025EC9C6 
X-CRM114-Status: GOOD (  13.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>,
 =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Stephen Gallimore <stephen.gallimore@st.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Abraham <thomas.ab@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Omri Itach <omrii@marvell.com>,
 Maxime Ripard <mripard@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Scott Branden <sbranden@broadcom.com>, Tero Kristo <kristo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>,
 Pankaj Dev <pankaj.dev@st.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <Pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Jan 2021 09:30:20 +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> We should have these nailed in ~2 patchsets.
> 
> Lee Jones (20):
>   clk: rockchip: clk: Demote non-conformant kernel-doc headers
>   clk: rockchip: clk-cpu: Remove unused/undocumented struct members
>   clk: rockchip: clk-pll: Demote kernel-doc abuses to standard comment
>     blocks
>   clk: rockchip: clk-half-divider: Demote non-conformant kernel-doc
>     header
>   clk: bcm: clk-iproc-pll: Demote kernel-doc abuse
>   clk: sifive: fu540-prci: Declare static const variable
>     'prci_clk_fu540' where it's used
>   clk: socfpga: clk-pll: Remove unused variable 'rc'
>   clk: socfpga: clk-pll-a10: Remove set but unused variable 'rc'
>   clk: mvebu: ap-cpu-clk: Demote non-conformant kernel-doc header
>   clk: imx: clk-imx31: Remove unused static const table 'uart_clks'
>   clk: st: clkgen-pll: Demote unpopulated kernel-doc header
>   clk: st: clkgen-fsyn: Fix worthy struct documentation demote partially
>     filled one
>   clk: ti: clockdomain: Fix description for 'omap2_init_clk_clkdm's hw
>     param
>   clk: sunxi: clk-sunxi: Demote a bunch of non-conformant kernel-doc
>     headers
>   clk: ti: dpll: Fix misnaming of '_register_dpll()'s 'user' parameter
>   clk: ti: gate: Fix possible doc-rot in
>     'omap36xx_gate_clk_enable_with_hsdiv_restore'
>   clk: sunxi: clk-a10-ve: Demote obvious kernel-doc abuse
>   clk: sunxi: clk-mod0: Demote non-conformant kernel-doc header
>   clk: versatile: clk-icst: Fix worthy struct documentation block
>   clk: zynq: clkc: Remove various instances of an unused variable 'clk'
> 
> [...]

Applied, thanks!

[01/20] clk: rockchip: clk: Demote non-conformant kernel-doc headers
        commit: 415173712003ad7e54de7198979d68a428440ed6
[02/20] clk: rockchip: clk-cpu: Remove unused/undocumented struct members
        commit: 274ae6da4b3275fea32f0807e6e20715695dd210
[03/20] clk: rockchip: clk-pll: Demote kernel-doc abuses to standard comment blocks
        commit: eee7b95589e61bd7250cada52ddd8039c63535ef
[04/20] clk: rockchip: clk-half-divider: Demote non-conformant kernel-doc header
        commit: d48fbef962b095f7cc22017642fb9055d57fdb53

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
