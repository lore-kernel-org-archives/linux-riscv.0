Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59978606A333
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W9fxaJh/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=e1U02Z80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rhF5iJpaLBFCr+K2mCoMi6sONfevQAe2rcBbWrT3hlk=; b=W9fxaJh/LFZTD1UZWyzY49exTZ
	iilhx0/n2DQLRNe86dOMeAZjsZKdNYFvWLZ4ix6Eo1arjGQ7WAkgd5DcVWQGVkr+TXTTE/CDncTga
	9xumVcHqGcOf6D7ZRTCspNGUcEv86Lp79QRQ5Pq5mXVZJKACy2OeeDIJfKAj/Fd2BBtFRyIeVsza0
	EAqVPRUL3cX3Cf91++XAu6r6J+97yeUqqlicq3/6hqmd7CbUIDhW4EISQN0TgHoAcoxBPX0QUEKUK
	uIUMNlZdnrXP1fYe/angPs0TrxFqmWowLi6lTPZxYI61L6auGXgFIJuRWKs7em4urSh/TbmuEImVg
	eSAsMy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFST-0000000AU8S-2UTV;
	Wed, 25 Nov 2026 16:02:57 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFSM-0000000AU6f-3t9s;
	Wed, 25 Nov 2026 16:02:55 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261125160245euoutp01643ec134cd0c29416f15b98b4c0d8cc6~rVTXAYGFq2394723947euoutp01V;
	Wed, 25 Nov 2026 16:02:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261125160245euoutp01643ec134cd0c29416f15b98b4c0d8cc6~rVTXAYGFq2394723947euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795622565;
	bh=ndbQ4zOYDp69YxH+vSmF4c25f0epkpIi0n8RI4ocFgM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=e1U02Z80qtk/nwxit57Qm6MpSrKZqhLaXn1xXYc34Vn0Eip6382b1av0O6PBF68d/
	 B+Dumn3anLrajMn3xyffUdgm+em8ubtrl2UA1YPq6TqsDRgnUrgdx/z+eBTbv/89Nr
	 BFOGepG56xBXw0iJaV/CwLUtCghah3S95AlnkChA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261125160245eucas1p1beac30b8fac0db60d40e99f0990a67bf~rVTWtiIWT1277212772eucas1p1A;
	Wed, 25 Nov 2026 16:02:45 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261125160243eusmtip277776f891a27dfa466a595a92f06eb14~rVTVBDesA3197031970eusmtip2F;
	Wed, 25 Nov 2026 16:02:43 +0000 (GMT)
Message-ID: <f432f455-f393-49f6-94e1-48caf1e35565@samsung.com>
Date: Wed, 25 Nov 2026 17:02:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/18] drm/bridge: starfive: Add JH7110 HDMI
 controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Emil Renner
	Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Heiko
	Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Andy Yan
	<andyshrk@163.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Yakir Yang <kuankuan.y@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>, Manivannan
	Sadhasivam <mani@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <831aebd692fc5ddbbd1cf57f1aad3bcc0d3f30d2.camel@pengutronix.de>
X-CMS-MailID: 20261125160245eucas1p1beac30b8fac0db60d40e99f0990a67bf
X-Msg-Generator: CA
X-RootMTR: 20261124155429eucas1p1015c7cd9beec294fefdcd6900dd407f6
X-EPHeader: CA
X-CMS-RootMailID: 20261124155429eucas1p1015c7cd9beec294fefdcd6900dd407f6
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155429eucas1p1015c7cd9beec294fefdcd6900dd407f6@eucas1p1.samsung.com>
	<20261124-jh7110-clean-send-v8-16-de92635dd857@samsung.com>
	<831aebd692fc5ddbbd1cf57f1aad3bcc0d3f30d2.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_080252_355748_8743A53C 
X-CRM114-Status: GOOD (  20.49  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Maud Spierings <maud_spierings@murena.io>, linux-rockchip@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Byron Stanoszek <gandalf@winds.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, Graham Markall <hello@big-grey.co.uk>, Owen O'Hehir <oo.hehir@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/24/26 17:50, Philipp Zabel wrote:
> On Di, 2026-11-24 at 16:52 +0100, Michal Wilczynski wrote:
>> Add the HDMI controller (bridge) driver for the StarFive JH7110.
>>
> [...]
>>
>> Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>> Tested-by: Byron Stanoszek <gandalf@winds.org>
>> Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/bridge/Kconfig            |  11 ++
>>  drivers/gpu/drm/bridge/Makefile           |   1 +
>>  drivers/gpu/drm/bridge/jh7110-inno-hdmi.c | 297 ++++++++++++++++++++++++++++++
>>  3 files changed, 309 insertions(+)
>>
> [...]
>> diff --git a/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a0283f83ddc93e3e6c9e9192b73dca9a63f9d9ab
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
>> @@ -0,0 +1,297 @@
> [...]
>> +
>> +struct stf_inno_hdmi_controller {
>> +	struct clk_bulk_data clks[CLK_CTRL_NUM];
>> +	struct reset_control *tx_rst;
> 
> tx_rst is never used outside of starfive_inno_hdmi_controller_probe(),
> it could be a local variable.

agree, thanks will fix in v9

> 
>> +	struct phy *phy;
>> +	bool enabled;
>> +};
>> +
> [...]
>> +static void stf_inno_hdmi_rst_assert(void *data)
>> +{
>> +	reset_control_assert(data);
>> +}
>> +
>> +static int starfive_inno_hdmi_controller_probe(struct platform_device *pdev)
>> +{
> [...]
>> +	ctrl->tx_rst = devm_reset_control_get_exclusive(dev, NULL);
>> +	if (IS_ERR(ctrl->tx_rst))
>> +		return dev_err_probe(dev, PTR_ERR(ctrl->tx_rst), "failed to get tx reset\n");
>> +
> [...]
>> +
>> +	ret = reset_control_deassert(ctrl->tx_rst);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_add_action_or_reset(dev, stf_inno_hdmi_rst_assert,
>> +				       ctrl->tx_rst);
>> +	if (ret)
>> +		return ret;
> 
> This looks like it could be simplified with
> devm_reset_control_get_exclusive_deasserted().

Yes I think this can be simplified, thanks !

> 
> regards
> Philipp
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
