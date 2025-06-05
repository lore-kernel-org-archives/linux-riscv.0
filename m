Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72373C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuym4pl0fnnIPquRZuoHOyCXyUm2K2TDdu8SySnBpmg=; b=WJ3mcXjV33dq8G
	0xun0dEaDIqnnH2bEvuanrc83qRd0amfd9PbOeaqDVACpcE9ssFrUeJJJnZ0QVNGHW3uCELtf1XVr
	pxnsO0Qh/RWYW4rhYBKmZ39gkLL85S/ujsQGt5mmbbvjlLLjEMmJPRSGK5Ey4QkpGUQQ0fZJYTMiD
	5biclxIJwFIV1PduC/cW9J1pd5xXyUY2HTmDF4xku+qfC7RijGIyNjWFqU/WxbGo2K/xId6ZFfkF5
	1AQIahqTO0BBy7fZ6JS6keAawXQ1oVJRtu/eXthUxl/3tRq39fklXYfGeCBFEymbYywiW9mNatKHi
	bSPuY1MWUhR6m/nUSeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5aP-0000000F1kW-2rBw;
	Thu, 05 Jun 2025 08:04:29 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5aJ-0000000F1jY-46XU
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 08:04:28 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250605080419euoutp0146023ee4eb4838e50f325bcba6ff75b0~GFuC7qlU_0706407064euoutp01C
	for <linux-riscv@lists.infradead.org>; Thu,  5 Jun 2025 08:04:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250605080419euoutp0146023ee4eb4838e50f325bcba6ff75b0~GFuC7qlU_0706407064euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749110659;
	bh=Zg2vFiDx8CLX/mdtIR7HKEpZZXyINdX/0zaUIkLHpyY=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=Rvmi3wBoxe3CjmYCAbux+kdSq+wRynDdHKPpwYThxDYXTyCzUEzPZQYAvvCtX/UBU
	 oJwQDtYGpF+so6MhP3ncSa6ttez12mLTS3/KQw5TcByFphEYqr+vn5I1ythhFDBMOY
	 RpDP+gcCW4zJRDbScdmV7zBbJB/wXvVwyMMcjXvY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250605080419eucas1p2a3ceb2a6638ecf161295ac365bdeb33f~GFuCyHZaS1597115971eucas1p2N;
	Thu,  5 Jun 2025 08:04:19 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250605080419eusmtip29b6aea360f101e67bba3f51bc79273e7~GFuCZpf261330113301eusmtip2Z;
	Thu,  5 Jun 2025 08:04:19 +0000 (GMT)
Message-ID: <2793e943-0297-47cd-bb65-b680a308a700@samsung.com>
Date: Thu, 5 Jun 2025 10:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: Enable TH1520 aon, mbox and reset
 support
To: Drew Fustini <drew@pdp7.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250605071940.348873-3-drew@pdp7.com>
X-CMS-MailID: 20250605080419eucas1p2a3ceb2a6638ecf161295ac365bdeb33f
X-Msg-Generator: CA
X-RootMTR: 20250605073400eucas1p181cb06c580c775a0205881cd1b54cc6e
X-EPHeader: CA
X-CMS-RootMailID: 20250605073400eucas1p181cb06c580c775a0205881cd1b54cc6e
References: <CGME20250605073400eucas1p181cb06c580c775a0205881cd1b54cc6e@eucas1p1.samsung.com>
	<20250605071940.348873-3-drew@pdp7.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_010424_478993_E0A2AFE9 
X-CRM114-Status: UNSURE (   9.99  )
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



On 6/5/25 09:17, Drew Fustini wrote:
> Enable TH1520 Always-On (AON) firmware protocol, TH1520 Mailbox and
> TH1520 reset controller.
> 
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index fe8bd8afb418..86b13177f27b 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -178,6 +178,7 @@ CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_AXP20X=y
>  CONFIG_REGULATOR_GPIO=y
> +CONFIG_RESET_TH1520=m
>  CONFIG_MEDIA_SUPPORT=m
>  CONFIG_MEDIA_PLATFORM_SUPPORT=y
>  CONFIG_VIDEO_CADENCE_CSI2RX=m
> @@ -258,7 +259,9 @@ CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_PM_DEVFREQ=y
>  CONFIG_IIO=y
> +CONFIG_TH1520_AON_PROTOCOL=m
>  CONFIG_THEAD_C900_ACLINT_SSWI=y
> +CONFIG_THEAD_TH1520_MBOX=m
>  CONFIG_PHY_SUN4I_USB=m
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m

Thanks !
Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
