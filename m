Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDD1C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQZrVo9k2+6WDGJ/gilZgrhuUWHK+FEvxmkSzbGBpNA=; b=NKw7c3lkKLRy3P
	CIP8MCjKpNtnGOKjo5ChDiPK9cE8P6xh/N/OYZqb6sYRZDWDnnCPLHI+7iGZkNI54JiE4LhaTdyM/
	PwNumM8uCvSc91JU5f5nTZFmQNHatZ0QhpA/NCzkVNyGHefjqYyUs6XLHFYMDNLQ9c5WXlI9xBnqu
	AEPnaKsXFwiSUs9D0v094B4aJo2zUltSC7EZw1TCsu4aL3p/eXSYz10X5NnuMw0BnuU69dhyGDYNx
	t+FGpgvzu6/pqGm7zxCMa5dJXzcCLRuGUpGET7m4YDlfQCMwZMvXz/doMhbi1vqHKcuPR7sDJog4+
	miTB9cC+HybTu6Ozxr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFG2-00000001LEj-1Ex5;
	Fri, 29 Mar 2024 16:39:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFFx-00000001LBv-3sYe;
	Fri, 29 Mar 2024 16:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D74B61977;
	Fri, 29 Mar 2024 16:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717E8C433C7;
	Fri, 29 Mar 2024 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711730343;
	bh=mu709RK6RdUvGezRsei4fEVVFDMPGmRnjx++n5sjyL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uEituwgn1xxAMuURhdwt3/iaLtwEGCu1+Mclwo9+Ty7wLbaMiWmyQU0rOPlf9vJzM
	 o13NJKluh2NnMuLRvgLiGrQVrebzv3a2gzICu48+3LXXhQ45oB4NluNbhd7SB44a70
	 M0Wt2X6l0SJT7LJi3C8GA4V9BEhry7YR3ma4wI/3OylDT4TAEwBE8hLV/q3auS8o5H
	 9muF3kTL6rkQ20Iba0mAQK6pIs92yEx6N2CKY/CrPm5aLVKXPn+H3gbBFziiX6OMqC
	 zpP4PltZewjblpXJOZBFZ8cpmv8jSqFoiAAks6EZfkeP36KAWbWprPmsY2/9TNUion
	 NxXBlJGeFB7CQ==
Date: Fri, 29 Mar 2024 22:08:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen <allen.lkml@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Allen Pais <apais@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Kees Cook <keescook@chromium.org>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Paul Cercueil <paul@crapouillou.net>, Eugeniy.Paltsev@synopsys.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Leo Li <leoyang.li@nxp.com>, zw@zh-kernel.org,
	Zhou Wang <wangzhou1@hisilicon.com>, haijie1@huawei.com,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	logang@deltatee.com, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, peter.ujfalusi@gmail.com,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	"jh80.chung" <jh80.chung@samsung.com>, oakad@yahoo.com,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, brucechang@via.com.tw,
	HaraldWelte@viatech.com, pierre@ossman.eu,
	Duncan Sands <duncan.sands@free.fr>,
	Alan Stern <stern@rowland.harvard.edu>,
	Oliver Neukum <oneukum@suse.com>,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-s390@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgbuotY4IX4iHm9U@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
 <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
 <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
 <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
 <CAOMdWSKC4B8zn6N+=5DssB_BiR6JkHBEpJr0ohKb149eJvCKMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMdWSKC4B8zn6N+=5DssB_BiR6JkHBEpJr0ohKb149eJvCKMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_093906_108160_7FEE8F2F 
X-CRM114-Status: GOOD (  23.33  )
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

On 28-03-24, 13:01, Allen wrote:
> > >> > Since almost every driver associates the tasklet with the
> > >> > dma_chan, we could go one step further and add the
> > >> > work_queue structure directly into struct dma_chan,
> > >> > with the wrapper operating on the dma_chan rather than
> > >> > the work_queue.
> > >>
> > >> I think that is very great idea. having this wrapped in dma_chan would
> > >> be very good way as well
> > >>
> > >> Am not sure if Allen is up for it :-)
> > >
> > >  Thanks Arnd, I know we did speak about this at LPC. I did start
> > > working on using completion. I dropped it as I thought it would
> > > be easier to move to workqueues.
> >
> > It's definitely easier to do the workqueue conversion as a first
> > step, and I agree adding support for the completion right away is
> > probably too much. Moving the work_struct into the dma_chan
> > is probably not too hard though, if you leave your current
> > approach for the cases where the tasklet is part of the
> > dma_dev rather than the dma_chan.
> >
> 
>  Alright, I will work on moving work_struck into the dma_chan and
> leave the dma_dev as is (using bh workqueues) and post a RFC.
> Once reviewed, I could move to the next step.

That might be better from a performance pov but the current design is a
global tasklet and not a per chan one... We would need to carefully
review and test this for sure

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
