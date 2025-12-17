Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DE0D65C63
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 22:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaJtKtMfJc2CDGAqJ0fUJqPMO9rQ4owzIW6UItDNmGU=; b=gh4W27egH4HnE1
	O4EAnG0y0h65M+PsbtQjPcLqBJHp8AULAyE1z1OZ3aTQnckC3WfTCrweyEAk/1jUNLQcjNfu2dbof
	2ITOXb541YeAK+D06BwQocVcRtsiTrlIPoiFlpUqEwO25Q8OdtnbAlNHtCVDqGhPwqo5KIm6j1L7f
	9QoVmTff9BJlqe1iCeXOGJLw7XO5HycFSbWYfO69SCXzIXpjSbAD1vPH5V66HVH1Xohd2Tk3s0pLH
	LE7WlGJnrWTM4UE9I7suAZOxqneZbc+DrKZZPxW/FH0f7io/w/iC9KLy0ov08M14XmMH3yQNZ2HM9
	pfZZZOOeRfwkeK7/Ay9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0P6-00000007Urv-0YT0;
	Wed, 17 Dec 2025 22:53:56 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0P3-00000007UrE-1PXp
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 22:53:54 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EBA1F340D31;
	Wed, 17 Dec 2025 22:53:49 +0000 (UTC)
Date: Thu, 18 Dec 2025 06:53:45 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <20251217225345-GYA1943598@gentoo.org>
References: <20251216233514.646263-1-inochiama@gmail.com>
 <20251217001833-GYE1903981@gentoo.org>
 <aUH46Rqb-bzsqUn_@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUH46Rqb-bzsqUn_@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_145353_400100_09284BDF 
X-CRM114-Status: GOOD (  21.31  )
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

Hi Inochi,

On 08:33 Wed 17 Dec     , Inochi Amaoto wrote:
> On Wed, Dec 17, 2025 at 08:18:33AM +0800, Yixun Lan wrote:
> > Hi Inochi, 
> > 
..
> > > +MODULE_IMPORT_NS("SPACEMIT_CCU");
> > the name should be ok as long as no collision and unique, but..
> > I personally would prefer "CLK_SPACEMIT" which follow "subsytem + vendor"
> > 
> 
> I disagree with you, after doing a grep, I found it is more common to
> use "vendor + xxx" format.
> 
I do not have strong preference, as I said on condition that it's unique,
and I do see Allwinner driver using "SUNXI_CCU" (driver/clk/sunxi-ng)

so if clock maintainer have no objection and don't want any enforcement,
then it would be fine by me

> 
> > > +MODULE_LICENSE("GPL");
> > I've got a comment [1] from Ziyao in the review of K3 clock driver
> > that suggest to distill the common probe function, which make sense.
> > So, I plan to have separated ccu_common.c file, with this change,
> > it would be more proper to put MODULE_DESCRIPTION/MODULE_LICENSE
> > into that file
> > 
> > It might takes some time to get there, as I now got a weird panic/hang
> > issue with that change..
> > 
> > Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> > 
> 
> I have seen the K3 driver, but I think it is still necessary to add
> this line to this file. As this is a fix and it may be ported to the
> other version if got merged. So it is better to just add these line
> in the  ccu_pll.c and then you can move them in the file you desired.
> 
fair, let's push this first, then I'll try to refactor on top of it

thanks
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
