Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF20C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YSmsjNyfiAOFOiwOyj3W81XzJTk8jdFTem0RDntUX4=; b=QB2AWj3NqgI+Ea
	BbDsvLJIk4HDKOIVrymCNT4/rggpO9R1uKjMj6ybvWLqGOLFZirtjII4yabHXiQkyf+1ae2RyaOYx
	BKDpJrg+2EeRgrTQTDkc3vAKzVU/J36/7BBH1iltXwSIUT7Blw4Bz0fwETXQrAcseQuTubJTd5CBK
	7rpEDhRuncMqOeVfKeQTgixEh1Z9yMleVfO3DiQ5MBWbJWJjZTT/Zjrj1J3qwM8/2VV+p6V/jaiS6
	TwlRhUahNS6mOZTQggyf9Z2b23TO4PEcY+cnvf/T43bptDS7zwf/vcDNY0VjN4c7F51LvBgucW1sk
	b0znOZ5/9jQhee+DzkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Zj-00000008bxT-1xFk;
	Mon, 04 Mar 2024 10:29:39 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh58o-00000008Wid-2diw
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:01:56 +0000
X-QQ-mid: bizesmtp83t1709546464tu9e1xsu
X-QQ-Originating-IP: kh9aUmyxjyUl4zwZL1fChSvzQIYaeJHkGEmOd9fAvBQ=
Received: from localhost ( [112.22.30.30])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Mar 2024 18:01:03 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0000000
X-QQ-FEAT: +oIWmpEafD8OVAQfNNpTjIHw8qZhJIYDRrXOZUtmxSmzmlacXcINFLIpaIMVt
	huQSSluLBpbnu7UeOPiaU+D5ZRAiHAYgyNlyp8yb98m0dzevjhiPyzPdWF4x36miGPHU/a+
	iG2GmJlMxZwNtfhbiFn5WDklX23pYbAIaTD6RLCUVnDthdxk4nXdqZmZJdLBvm2Yg/q8rz8
	l90RIkO0EaoSKWkiHAVUJvsVel6OFJw5XA6YubVcadD5X4TYZ3aEDGvFnH1X2lpC+Iqw4G0
	m9nwHcp4yA3Jli9cEA40/tFCPD/v4iYM+m9bFnxUWvl6THUQCqXkZ+4Ebkmkn4Gb1xVHBG/
	QkbpLaU3hS8KxJCfgtOeT+pDhva6PAZKgWMVi2mPoHro2Seums8QcY3oD2XaGquOK9BclSR
	fcnWn53r8HVbny0pQUT4ig==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 5907862964829062476
Date: Mon, 4 Mar 2024 18:01:03 +0800
From: Dawei Li <dawei.li@shingroup.cn>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: microchip: Fix over-requested allocation size
Message-ID: <04A659134520CC60+ZeWb3xHvErS113zU@centos8>
References: <20240304092532.125751-1-dawei.li@shingroup.cn>
 <20240304-dislike-enchanted-bab883cdd609@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304-dislike-enchanted-bab883cdd609@wendy>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_020153_673749_C5556E6A 
X-CRM114-Status: GOOD (  18.83  )
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

Hi Conor,

Thanks for the quick review.

On Mon, Mar 04, 2024 at 09:52:52AM +0000, Conor Dooley wrote:
> Hey,
> 
> On Mon, Mar 04, 2024 at 05:25:32PM +0800, Dawei Li wrote:
> > cocci warnings: (new ones prefixed by >>)
> > >> drivers/firmware/microchip/mpfs-auto-update.c:387:72-78:
> >    ERROR: application of sizeof to pointer
> >    drivers/firmware/microchip/mpfs-auto-update.c:170:72-78:
> >    ERROR: application of sizeof to pointer
> > 
> > response_msg is a pointer to u32, so the size of element it points to is
> > supposed to be a multiple of sizeof(u32), rather than sizeof(u32 *).
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202403040516.CYxoWTXw-lkp@intel.com/
> > Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> > ---
> >  drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
> > index 682e417be5a3..7ea3cdb917bc 100644
> > --- a/drivers/firmware/microchip/mpfs-auto-update.c
> > +++ b/drivers/firmware/microchip/mpfs-auto-update.c
> > @@ -384,7 +384,7 @@ static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
> >  	u32 *response_msg;
> >  	int ret;
> >  
> > -	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(response_msg),
> > +	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(u32),
> 
> Why not use `sizeof(*response_msg)`?

Because checkpatch complains about 100-character violation and I don't
want to wrap lines :)

I will respin V2 as you suggested.

Thanks,

    Dawei

> 
> Cheers,
> Conor.
> 
> >  				    GFP_KERNEL);
> >  	if (!response_msg)
> >  		return -ENOMEM;
> > -- 
> > 2.27.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
