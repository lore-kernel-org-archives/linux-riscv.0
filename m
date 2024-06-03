Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8128FC25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCryvi8k1bSreZXTost2RUcVfOd4sCn6vBryYawIenY=; b=1zO+IB/0wuMCcj
	mkMg97NgAclNxX5Wv4KoIVLciskh8Y6oAANbr1itv+NCIBB7iJKdL0OgS/iz09MplAxp6ZXv4fNvb
	7LAt8z02eL6MA1nStDiLgm2n35UBgW01UGUGi97mftQc7yIZ6JjcaagtDJOJoPPgMezbJ3NXbm2CE
	TurahhlZR8zU7JV75GIED4RGTQ/kFL07svqftgqn0l89qNjSfy/wgFKgXVzl78hgddgoO64IJ77MV
	8pv2JdFuAfue/F1b+Y50OYA8I83cKL2UWPbZuKsFhC78ZptiemYUfTMtrZrBtP1CsoDDGJ1hgBWuD
	hI9hRaM3ff0uxuIBLssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE6yB-0000000Giko-0xFR;
	Mon, 03 Jun 2024 12:39:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE6y6-0000000Gij3-381i;
	Mon, 03 Jun 2024 12:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1717418358; x=1748954358;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LEM9nLCZweC6fzBGd3LiqBJyI0EVR5DWYNV+RHxhfJc=;
  b=nt0gjnLZwkhqMadgg6Z4IgjxnBNhJXyyN6FVylesspZuBSbUzMQMqQPw
   thdk0EN89kqXG5bj2vPpB2Qc0anWdscs59ADq1P2BShBbrNe0e6/DF3GM
   wlCK2vVxjR04gxJxhuAmZz4nPvxlWyr2/I7dM/IBWXdGvOBRyLjnD+OJz
   JvlFTbA7hlsqocAuGlFbvaPbHIai2mSKURjeKUuISZ9eZ9BpbEOHonkTR
   DcIQQQsxfyUGeqIxclzao4qP8KAkX25AakzR5BKa621VTV6rizqR6o7PH
   2/jJOW2Iruh37xEigL1aI8E46sxn9027kEvbB0Fb9Ddy17yfoVTXEwxeW
   Q==;
X-CSE-ConnectionGUID: mGTV6IY0SjuqO4B8d/I3Zg==
X-CSE-MsgGUID: cs2mH/dwScqctcaN/BguNA==
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="194291692"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jun 2024 05:39:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Jun 2024 05:38:36 -0700
Received: from [10.159.227.221] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 05:38:23 -0700
Message-ID: <7e618af0-51a7-4941-a386-0ac68c66d358@microchip.com>
Date: Mon, 3 Jun 2024 14:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>, <linux-kernel@vger.kernel.org>
CC: <tj@kernel.org>, <keescook@chromium.org>, <vkoul@kernel.org>,
	<marcan@marcan.st>, <sven@svenpeter.dev>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <paul@crapouillou.net>,
	<Eugeniy.Paltsev@synopsys.com>, <manivannan.sadhasivam@linaro.org>,
	<vireshk@kernel.org>, <Frank.Li@nxp.com>, <leoyang.li@nxp.com>,
	<zw@zh-kernel.org>, <wangzhou1@hisilicon.com>, <haijie1@huawei.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <sean.wang@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<afaerber@suse.de>, <logang@deltatee.com>, <daniel@zonque.org>,
	<haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>, <andersson@kernel.org>,
	<konrad.dybcio@linaro.org>, <orsonzhai@gmail.com>,
	<baolin.wang@linux.alibaba.com>, <zhang.lyra@gmail.com>,
	<patrice.chotard@foss.st.com>, <linus.walleij@linaro.org>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <peter.ujfalusi@gmail.com>, <kys@microsoft.com>,
	<haiyangz@microsoft.com>, <wei.liu@kernel.org>, <decui@microsoft.com>,
	<jassisinghbrar@gmail.com>, <mchehab@kernel.org>,
	<maintainers@bluecherrydvr.com>, <ulf.hansson@linaro.org>,
	<manuel.lauss@gmail.com>, <mirq-linux@rere.qmqm.pl>,
	<jh80.chung@samsung.com>, <oakad@yahoo.com>,
	<hayashi.kunihiko@socionext.com>, <mhiramat@kernel.org>,
	<brucechang@via.com.tw>, <HaraldWelte@viatech.com>, <pierre@ossman.eu>,
	<duncan.sands@free.fr>, <stern@rowland.harvard.edu>, <oneukum@suse.com>,
	<openipmi-developer@lists.sourceforge.net>, <dmaengine@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-mips@vger.kernel.org>,
	<imx@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-mediatek@lists.infradead.org>, <linux-actions@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-usb@vger.kernel.org>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <20240327160314.9982-10-apais@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_053919_005731_4F43DA24 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 27/03/2024 17:03, Allen Pais wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>   drivers/mmc/host/atmel-mci.c                  | 35 ++++-----
[...]

For atmel-mci, judging from a few simple tests, performance is preserved.
E.g. writing to a SD Card on the SAMA5D3-Xplained board:
time dd if=/dev/zero of=/opt/_del_me bs=4k count=64k

      Base 6.9.0 : 0.07user 5.05system 0:18.92elapsed 27%CPU
   Patched 6.9.0+: 0.12user 4.92system 0:18.76elapsed 26%CPU

However, please resolve what checkpatch is complaining about:
scripts/checkpatch.pl --strict 
PATCH-9-9-mmc-Convert-from-tasklet-to-BH-workqueue.mbox

   WARNING: please, no space before tabs
   #72: FILE: drivers/mmc/host/atmel-mci.c:367:
   +^Istruct work_struct ^Iwork;$

Same as discussions on the USB patch[1] and others in this series, I am 
also in favour of "workqueue" or similar in the comments, rather than 
just "work".

Apart from that:
Tested-by: Aubin Constans <aubin.constans@microchip.com>
Acked-by: Aubin Constans <aubin.constans@microchip.com>

Thanks.

[1]: 
https://lore.kernel.org/linux-mmc/CAOMdWSLipPfm3OZTpjZz4uF4M+E_8QAoTeMcKBXawLnkTQx6Jg@mail.gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
