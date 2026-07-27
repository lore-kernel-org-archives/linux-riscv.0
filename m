Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958F0C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3QtT3UTqcnTChECsJ1jrYkyFcS0Y5cR7KT13IGfqh4=; b=RBxYCZebo1hNfI
	7RGyWfN2ZICUQPT4FsEFAXmH5l+tjNGJByMRZGsxX9pxvHojsmaNb0Ny2Sk/mMcXSINLkflm68XWj
	QfQWBtMRQpNPZD8Rr92K/euES9IIvZUvjw4C6r5Qkm21V8Pr4vUJM5IOlQbLf4yXz2aKXxUb6vjHO
	bWYaP9Ysk5K8gnnVp81soQnAKIAEJ6832H3+P7XL8qpJciobYiRW+iv0J2Yb5sYbKP8nc8xrUfEIZ
	7tWqllPR0EvQZwxTQmmfyVWxrC/GAHoHoA0eilMF6SzLG9ggvQwPDUdRcQ8yj45D+TdACSVYmjkYF
	E/ZHASkBSRzK2hCt+pxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKUX-00000002iMF-3L9c;
	Mon, 27 Jul 2026 12:31:33 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKUU-00000002iL5-2WAr;
	Mon, 27 Jul 2026 12:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785155401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kiSORZqGzRgPZiGsYQ3k34+qAmA2+ohQ9ieV0/nCrHQBSFb7Zkwli0ibhrlZP5pO4cOwBhBXzVzr6PXbPejR8bQmRoye97O+R2qFzh3ZVLLs4JtEh5COmhAUGIes0IVCWx4s0QJdKqtTtTAu8njVcrYOGjoUYVpgNn6APdeDwHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785155401; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lzUtZjHaCNtOvDUH6TlXLFDO4ardciovEJAHYjHQUHE=; 
	b=jJJ3KFfiXlqK9M+ZjyKjV/+R1xZh3I9fvccqIsI1eKv8BsyigICQBlFKH3ejLvcoFEcpaSdCvswTIO5cJgmmJl1g2ODOc5XH3XnaktRW3hwN1THE6Q2toTVjVXFoiiXixKK32i3cgM6saBuFvLK5r5vkok0Xjo+zieAjvXb22ho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785155401;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=lzUtZjHaCNtOvDUH6TlXLFDO4ardciovEJAHYjHQUHE=;
	b=jAXBgzvoP/KRL/kzNykKMvSVgmywY7QNg1wFwP2hPYt4rF72DlOu6U0y1o4BWw1E
	BQ7rvWs3Ls7IuOeSsseXOlLFbNxXI0DD2v2fKG1oxkXduWlwDmeJVaFav1DW8svk5Kz
	W3u7RmE5qxxdIh3kIuPQUAj7BQihuwFJQVH8PANw=
Received: by mx.zohomail.com with SMTPS id 1785155397890121.03202805715694;
	Mon, 27 Jul 2026 05:29:57 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:29:48 +0000
From: Yao Zi <me@ziyao.cc>
To: codykang.hk@gmail.com, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
Message-ID: <amdPPBOH-Dk4oU7y@pie>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/285.144.37
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053130_694349_EAA10F96 
X-CRM114-Status: GOOD (  20.68  )
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

On Sat, Jul 25, 2026 at 12:51:21AM -0400, Cody Kang via B4 Relay wrote:
> From: Cody Kang <codykang.hk@gmail.com>
> 
> Add the DP/eDP controller that sits downstream of the Saturn DPU. Two
> identical instances share one compatible; the eDP-vs-DP role is board
> wiring, so it is taken from the devicetree: an eDP panel always sits
> under an aux-bus child node, an external DP connector never does.
> 
> The link is driven through the generic PHY framework, so the controller
> never touches a PLL register. The controller's HPD interrupt is gated by
> the DP pixel clock, which can be off exactly when a plug has to be
> caught, so the connector is also polled and the interrupt path re-reads
> the live level when it does fire.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  drivers/gpu/drm/spacemit/Kconfig            |   19 +
>  drivers/gpu/drm/spacemit/Makefile           |    3 +
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.c | 2443 +++++++++++++++++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.h |  328 ++++
>  4 files changed, 2793 insertions(+)

...

> +static int inno_dp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *aux_bus_np;
> +	struct spacemit_dp_dev *dp;
> +	struct resource *res;
> +	int ret;

...

> +	dp->pxclk = devm_clk_get(dev, "pxclk");
> +	if (IS_ERR(dp->pxclk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> +				    "failed to get pxclk\n");
> +		return ret;
> +	}

It seems pxclk is only enabled in probe() and disabled in remove(),
please consider using devm_clk_get_optional_enabled().

...

> +	if (dp->pxclk) {
> +		ret = clk_prepare_enable(dp->pxclk);
> +		if (ret) {
> +			dev_err(dev, "failed to enable pxclk: %d\n", ret);
> +			goto err_reset;
> +		}
> +	}

So this check could be dropped.

...

> +	/*
> +	 * The PHY exposes its PLL as the APMU pixel-clock mux's external
> +	 * parent.
> +	 */
> +	dp->pll_clk = devm_clk_get(dev, "pll");
> +	if (IS_ERR(dp->pll_clk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(dp->pll_clk),
> +				    "failed to get PHY pixel clock\n");
> +		goto err_clk;
> +	}

Same for the "pll" clock.

> +	if (dp->pxclk) {
> +		ret = clk_set_parent(dp->pxclk, dp->pll_clk);
> +		if (ret) {
> +			dev_err(dev, "failed to route eDP pixel mux to PHY PLL: %d\n", ret);
> +			goto err_clk;
> +		}
> +	}
> +	 */
> +	ret = devm_request_threaded_irq(dev, dp->irq, spacemit_dp_irq_handler,
> +					spacemit_dp_hotplug_event_handler,
> +					IRQF_NO_AUTOEN, dev_name(dev), dp);
> +	if (ret) {
> +		dev_err(dev, "failed to request irq %d: %d\n", dp->irq, ret);
> +		goto err_clk;
> +	}

Since 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()") devm_request_threaded_irq() automatically throws
an error message when it fails, so this error message is redundant.

...

> +err_clk:
> +	clk_disable_unprepare(dp->pxclk);

With devm_clk_get_optional_enabled(), you could remove this and
simplify some error handling paths.

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
