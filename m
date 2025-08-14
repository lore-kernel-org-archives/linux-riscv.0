Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37922CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7Nizg+7n65eKHgsW5ovvD41ddDHQEW3ZuWtXqQd6bk=; b=fh2/xQdIukmlBu
	HQdq1b6KkkOCgDJSgE1Tvl6Hit/o8RuHc8CClimGCQPFl829Wio/OUulIgWZyh+8aaDEQM7tg12xm
	0pxzFTZBDv0dcRBboocVYLtRxdGwcC8zBGtCljM9QFAItyX81+8MJfs9Cr1KIrNQuT+P/swWPXa0U
	ee6gik8gW3Wnru99E3XhpozBUuS7FBeJcgEA+JxTHPk4JtUG/J75D3eAc/ZjT2r0WMuumQFTm1ofB
	9R9D7Gi0zlALbM9a4ZNiIXJg54z5rUGzMa8sQxD1BDMNTrwSX1kLP9pALCk3v94497LnjODw9KNcg
	8ojujTPgSgIEm2r4NuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYHS-0000000H5lf-3mnm;
	Thu, 14 Aug 2025 13:46:10 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXW8-0000000Gu03-1wJO
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 12:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755176171;
	bh=CjtoWhdgfdevioOzjHH4EUUUH9uWoD93N4KhylunA44=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=LxaiRH0/CS6IxsCoNmRVWAolfmtZhdicV6g3XZUNGo376fLk1ONqLqo5BFAlTDf/2
	 OrSfldVwWrg7JvCXBWDQPDRC8uN8m7oLBLada2NsEYLaQVqJaqjeFT5qtOOy+Nzoqb
	 3zcjnUoucjGIyEoJ5BKAVDGllACKuDM6AbTOG0F8=
X-QQ-mid: zesmtpip4t1755176162t001a8636
X-QQ-Originating-IP: ft3DEdIShiaa2Pbj2KfMxFeuKw9DKtlEl9tdgLJOFt0=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Aug 2025 20:56:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15176067644090953445
EX-QQ-RecipientCnt: 16
Date: Thu, 14 Aug 2025 20:55:58 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: i2s: add support for K1 SoC
Message-ID: <7352191F0DCAFF7E+aJ3c3tGKdcM3G-Uc@troy-wujie14pro-arch>
References: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
 <20250814-k1-i2s-v1-2-c31149b29041@linux.spacemit.com>
 <851f1c3d96988920a28412a26d5cd951b684c020.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <851f1c3d96988920a28412a26d5cd951b684c020.camel@pengutronix.de>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NOIkHYnr7VzdxN9VkEVqrvtprMEJI//PVPmx+ylqq4NxdOqdx2qzgriS
	8WkPhVt9eBWkG1ItSZaqK3dsf5O/VN8z7sY7/nRc1GscouNXDHsr5HkdCSeCfgZhgBK5LkH
	vfpy7CmUxNDwlK1sVOq1NiroFLcMzCkJ3MjiCrgB5+eni6izbLN8avov+c2kXr9EdBaahu2
	QMQui3dFdRckVVevoGszhwrl5ktSAKpwdt49Y99dzcEAp+whqW1c98lskdwWmXtq6hghCQO
	97teMwQMtttcEH4DBM5YG+BKxWEuI6ffKKsT2DlE0KfoGJss3Zo1jhKqGPN1v6+JfP/4TR/
	J8uQFmq8jf9yqYNY4e5Wn+/BHM+8QCD1P1NlUvnzV3KSdf9oDFXdpCGqxA80FdDxhWtWx1Y
	N0Ug3omBVa7kSh3/W0EmrDvBFQ5T8OLKNgL2FpN68LrGl2YVVgZiBN18IHy/eP8oK93TGi4
	Y4Tqo1tMXTMD3n3SjR1G8D0bwK3p5q8gS/bakxq9RWXg/qmNy8OpWZ7rmuo0BWVAjN2jMtg
	lnCLpP6XW2m1CLOk3wUn8QWshufLoZ4oAm8PLQE/5+rm0cMBUoM06KtS05n0COKxxfTfmD8
	yvK5TZbnuhIoPNO72IfOnl1Hm0+HBPohgnAAoUf5K4Zyz78Jzn907ljL7c+WYcUZmrTJ/lF
	2rjPNUib9RPSiKeE8NOrTzAaR7Kwr18NkMLRnqfDDo4Dq7dCQxqORElQFDfiVKdUsonyV+D
	5tKEVZY1QjfgtrR+4tHAq6ub5KsohjvcyHjqIX4rw5yUx+65IOuNLMKmhcYRmoxy8qqSk54
	eFYHX/efQfKVLMr4iEXTX8FzUTH0INcTEP9lQ4P7b/jowlFz/yxV5TxjIWo6eF2KCjWnmcd
	+zBtqJT8bLbtkcSeUXGT5CdcRIMAdh75/1DqDudhj1xcvLG5CNNt6yEe5wIaFaBtlZXpKKM
	Ws1OmFwfG0CbR/VrW3IZZKzpPRo/w5Re7Xkzs/I8Y3hZVatEqOZgLIfihwMyZvIYlDieH3h
	cdJvDmDhifrFmerd3AEAA1wmilCYjF548LMcLqOD5C0zziAKU9
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_055717_555507_029A1164 
X-CRM114-Status: GOOD (  20.05  )
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

On Thu, Aug 14, 2025 at 12:36:45PM +0200, Philipp Zabel wrote:
> On Do, 2025-08-14 at 16:54 +0800, Troy Mitchell wrote:
> > Add ASoC platform driver for the SpacemiT K1 SoC full-duplex I2S
> > controller.
> > 
> > Co-developer: Jinmei Wei <weijinmei@linux.spacemit.com>
> > Signed-off-by: Jinmei Wei <weijinmei@linux.spacemit.com>
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  sound/soc/Kconfig           |   1 +
> >  sound/soc/Makefile          |   1 +
> >  sound/soc/spacemit/Kconfig  |  14 ++
> >  sound/soc/spacemit/Makefile |   5 +
> >  sound/soc/spacemit/k1_i2s.c | 444 ++++++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 465 insertions(+)
> > 
> [...]
> > diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9e41525afbf3f08ab9a26b562772861d86f39cd7
> > --- /dev/null
> > +++ b/sound/soc/spacemit/k1_i2s.c
> > @@ -0,0 +1,444 @@
> [...]
> 
> > +static int spacemit_i2s_probe(struct platform_device *pdev)
> > +{
> > +	struct snd_soc_dai_driver *dai;
> > +	struct spacemit_i2s_dev *i2s;
> > +	struct resource *res;
> > +	struct clk *clk;
> > +	int ret;
> > +
> > +	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> > +	if (!i2s)
> > +		return -ENOMEM;
> > +
> > +	i2s->dev = &pdev->dev;
> > +
> > +	i2s->sysclk = devm_clk_get_enabled(i2s->dev, "sysclk");
> > +	if (IS_ERR(i2s->sysclk))
> > +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sysclk),
> > +				     "failed to enable sysbase clock\n");
> > +
> > +	i2s->bclk = devm_clk_get_enabled(i2s->dev, "bclk");
> > +	if (IS_ERR(i2s->bclk))
> > +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->bclk), "failed to enable bit clock\n");
> > +
> > +	clk = devm_clk_get_enabled(i2s->dev, "sspa_bus");
> > +	if (IS_ERR(clk))
> > +		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
> > +
> > +	i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
> > +	if (IS_ERR(clk))
> > +		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa clock\n");
> > +
> > +	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > +	if (IS_ERR(i2s->base))
> > +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
> > +
> > +	i2s->reset =  devm_reset_control_get(&pdev->dev, NULL);
> 
> Please use devm_reset_control_get_exclusive() directly.
Tnx. I will use in the next version.

> 
> > +	if (IS_ERR(i2s->reset))
> > +		return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
> > +				     "failed to get reset control");
> > +
> > +	dev_set_drvdata(i2s->dev, i2s);
> > +
> > +	spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
> > +
> > +	ret = devm_snd_soc_register_component(i2s->dev,
> > +					      &spacemit_i2s_component,
> > +					      dai, 1);
> > +	if (ret)
> > +		return dev_err_probe(i2s->dev, ret, "failed to register component");
> > +
> > +	return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_pcm_config, 0);
> > +}
> > +
> > +static void spacemit_i2s_remove(struct platform_device *pdev)
> > +{
> > +	struct spacemit_i2s_dev *i2s = dev_get_drvdata(&pdev->dev);
> > +
> > +	reset_control_assert(i2s->reset);
> 
> I'd move the reset_control_assert() be moved to snd_soc_dai_ops::remove
> for symmetry.
>
It makes sense.

deassert in ops::probe and assert in ops::remove.

                - Troy
> 
> regards
> Philipp
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
