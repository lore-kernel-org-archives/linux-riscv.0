Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E74606A330
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yvm8HzvJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uXdcXHCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XwX7psRHxJvuEaycEZ6/zkqWYmia+Qu8ANSJP5CqbBY=; b=yvm8HzvJRl7innvj/ewqA5wYgq
	22a3Ai8xEOgmJg+gkenAUZfVulL0iwYtfoAefJ1E0WZPvgeGwrrNOcIjyKLJepYFmTkr5Hjj4zc4d
	MVerprOVpfR05HVUmTr2GVvYC2kA3jMXiGmppqXOeguLhyk6GVEmm0uvz1NSyU+k9q7GAs5+cn1LM
	IlCTtk9Nx0lcRrnL+bPF3rG9tnQf05EutLFflMdL4jGEBrT5FcNAwh1Ns4Syxg5rndU6L+cRq+9wR
	q14oogWKWdeYG0SehIlrGnhJLSENiNoQG8FVfU7LsuNBOSOArP2HhGyKV4nI2XIU0svmDPyDuW488
	EDle6WtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzCb-0000000HAA7-2r9e;
	Fri, 27 Nov 2026 16:53:37 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzCU-0000000HA85-3n97;
	Fri, 27 Nov 2026 16:53:35 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127165320euoutp024c5fcdfeb78bcc21adbc48f75c3ca089~r9SFz3d-_1155811558euoutp024;
	Fri, 27 Nov 2026 16:53:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127165320euoutp024c5fcdfeb78bcc21adbc48f75c3ca089~r9SFz3d-_1155811558euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795798400;
	bh=7eCRdkskUVIKAV4F73pc7bqV887F0lnrxukv66qVTv4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uXdcXHCNDgUvKYjGzs4I6Y/LbSNrmKUYF/1I7VJEdq5FMAsBOJnK/421qd1tvZBCH
	 LhDrXlSqopL/8bPiDI3uNpIQZPrPJqWZ8PpjEnUggYOoykHsf67rgoaMckrVXdQB0r
	 q/UFtioXKgOj9nRw/8+BsmCSOkgieKfI3SQj27S8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261127165320eucas1p2d67ab9f6e81486993b7490f3746c914c~r9SFgBiTE0677506775eucas1p22;
	Fri, 27 Nov 2026 16:53:20 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261127165318eusmtip137bf72803c990386bb415f5deb6f1ddb~r9SDzrCr51687116871eusmtip1Y;
	Fri, 27 Nov 2026 16:53:18 +0000 (GMT)
Message-ID: <eb7ec558-7f5e-4fa6-b8de-db99c0b56467@samsung.com>
Date: Fri, 27 Nov 2026 17:53:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] drm: starfive: jh7110: Enable display
 subsystem
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>, Manivannan
	Sadhasivam <mani@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
X-CMS-MailID: 20261127165320eucas1p2d67ab9f6e81486993b7490f3746c914c
X-Msg-Generator: CA
X-RootMTR: 20261124155359eucas1p2f7d4e5137f38415561ce77fd55023466
X-EPHeader: CA
X-CMS-RootMailID: 20261124155359eucas1p2f7d4e5137f38415561ce77fd55023466
References: <CGME20261124155359eucas1p2f7d4e5137f38415561ce77fd55023466@eucas1p2.samsung.com>
	<20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085332_557488_D4B9FAA2 
X-CRM114-Status: GOOD (  12.32  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Maud Spierings <maud_spierings@murena.io>, linux-rockchip@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Byron Stanoszek <gandalf@winds.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, Graham Markall <hello@big-grey.co.uk>, Owen O'Hehir <oo.hehir@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/24/26 16:52, Michal Wilczynski wrote:
> This series enables the display subsystem on the StarFive JH7110.
> 
> Merging: everything except the DT patch goes through drm-misc:
> 
>   drm-misc                     1-16, 18
>     drivers/gpu/drm/bridge/, include/drm/bridge/, the display bindings,
>     and, as Conor asked, the StarFive SoC drivers and bindings (patches
>     4-6, 14 and 15, which carry his Acked-by), since the display
>     bindings and drivers belong together. Patches 1 and 2 are inno-hdmi
>     fixes with Fixes: tags; they apply to Rockchip as much as to StarFive
>     and are independent of the rest, so they can go on their own.
> 
>   Conor's tree                 17
>     The DT patch is included for review and testing only. As Conor
>     asked, I will resend it to him on its own once the rest is applied.
> 

Hi,
Patches 1 and 2 are now in a separate series with a third inno hdmi
fix, so they can be applied on their own merit [1].

v9 will drop them.

[1] - https://lore.kernel.org/all/20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com/

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
