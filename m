Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF4CAC5AA
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pjySFSddgpOQguMSFzDkw38v4y1kpVDosIClmquCHo=; b=HZPbR4dK8i+a9H
	g/5nZfZxJL4QL66ewCzp76w0ktU0Uwyiy64OOZsKcLv+XcpZCrSLnMMIn37mE5tPScP2r2Pzqt2g4
	WcJySbT3+b47bJoMrgzr5MT0l7YiE/Fp3jG2ZSZa6dtVSZTC7WVuulHQxi/lFLtz1WNk4RGzIYWO/
	bWN7Ct1WH0bq0RTey+2ecdtmGNJQciaYqG8ADnePsT9fvH7H0nfbFjaKpFll65IiRIQq5r6aTKzxC
	U2H/0aJI+ZwA+wBntCHlkETA83/+e4m3ULvUd86OXE7exVIWktE/MYbe8bEbvQY+cpKrrEwgQq0C9
	4y5lTkIQ1Pw4jpbPrSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rCK-0000000Bvpr-1DON;
	Tue, 23 Sep 2025 00:48:00 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rCH-0000000BvnB-3KR6
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 00:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758588429;
	bh=xopCxW8t1zBW6/HQ6IJ5noM3gFQ+1+pZ3gW2SFPiifM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=s0ChkpwcsSK2P7MZqwPTiJNP3HyXLnfhxrpqM6V0TDSRqQ8O2jkTfwJilIvlgpQPH
	 O55G6VLQMMgddRL9t3aYJCFdDI9sLfdSXUfpRzLNx4pOKnhryQso/JM7aDvoOOtnz7
	 NxvPh0hg3OPRI8b2GFWGHlGHSJbbSiySn7Fc5NlQ=
X-QQ-mid: esmtpgz16t1758588423tdee7036d
X-QQ-Originating-IP: gbwnxMZe9hFGpOZhigdxuB2zr1wbTcYBJC+vkRRZDww=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 08:47:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8933899601725810788
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 08:47:01 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 4/6] i2c: spacemit: check SDA instead of SCL after bus
 reset
Message-ID: <E0A67745AA4B2621+aNHuBTk9aK3AnZjR@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-4-e59bea02d680@linux.spacemit.com>
 <aNG35Dwg7wWivSHJ@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNG35Dwg7wWivSHJ@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Ocx62dM7vaMVzX3fzuIb0L1F35xFrH55HAYaXJaWutu7nwzBqRvfrVz8
	K/NyvCwgMMv+vK0mzu5WPaM8/Iv4vZQrNbnLIn5aetXp/OziZ/mvrAEhABcOnd8eOK1nXuS
	wESoaQyrYAmbESb9LrW32b1B40DkOiVWR98lKFkQDYADwMdINqkJeAPRG7EADr1ogViSY/l
	yvXem4+rO8HZOxRJgqsSn/XJxLFEdHaHtNnkdpPK/4itas9He7xmowWyHvqDZxWSe2kccSs
	o9NZkiUTtHmB/jL1um+KvccbflKnKOFED79K1QTlVsSm6Ei7Ugmx58cAc8DjuHLQmBBf1a7
	CLDV5oOJnrp6AQ8cO+DIKIrgjpGKysPbBF1ruxe+QJArECa+w7gxP7YSQofEPb+e/X/74MR
	vMjGC5tF/sUPJqD/LMtcl7zeybkpogiWjAkp3q6fZKGsC6yQXpJxBFejfB1PWVMwLTwG7mp
	N+grhpdAfMtY18TySvxUcF2dQ4kWQDAiM/AYmVWxPVrsNnbGPITe9Tu/Fo4Eywr7eLB5JLi
	SDhpiVr6zGYfTfkYboFJ5x4Am2BGmCmylzgC/CVMexnSEbEKfxKogcgnvhRGfD7Y7ky6wvk
	TEKCo49+F1pkxS5Zab8d2FbhT7diouYYIR3q2srUOA3E8Q+igmi38LejnaKVIz1PSA8F0Go
	/4d0z2GD5LEeImhHUWKNytSDZbYJZh1c+3QBnbad/7aDER6LEtZCA04Bf7o8tXP6ccw6yY5
	j7kfXoXPhjCcuCM/gE7o+oBKbHCnCPLPiy5xYvpB8SNbUQDcx8+/LrAdDgX4lRmFqGGhv4a
	Ry5RaQVhJlTaHQCtBtTCjFBPnWcOf86MCISL+SQfGNiSYHCpCfrltAuGJbJERNMKkqnyvdu
	VYEo8LtmyDrtDWy3ImcF350yE50JLbQ0ZCIWzs/6VgB6L9jdav0IX3WzbpcuoC1tc7UE5na
	hX6avmJwxW7arV4RcBHOnQucHHVyxRny71wm7z54BvdmSTxPSIHcafHfwJPmcidROxI37J1
	ldeSLankDY3co72JVqBOXx2RqNhtQzEp3v0DnkY+yf6qa86GKp2pf8m1hp2SMgihXGp+cv8
	NziDh/ffipR9OGWfhbDoBY=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_174758_122936_B1EC20EF 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, Sep 22, 2025 at 10:56:04PM +0200, Aurelien Jarno wrote:
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > After calling spacemit_i2c_conditionally_reset_bus(),
> > the controller should ensure that the SDA line is release
> > before proceeding.
> > 
> > Previously, the driver checked the SCL line instead,
> > which does not guarantee that the bus is truly idle.
> > 
> > This patch changes the check to verify SDA. This ensures
> > proper bus recovery and avoids potential communication errors
> > after a conditional reset.
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index c1656b78f1681729ccc2ebca6e290259d14889d9..4d78ee7b6929ee43771e500d4f85d9e55e68b221 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -172,9 +172,9 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
> >  	spacemit_i2c_reset(i2c);
> >  	usleep_range(10, 20);
> >  
> > -	/* check scl status again */
> > +	/* check sda again here */
> >  	status = readl(i2c->base + SPACEMIT_IBMR);
> > -	if (!(status & SPACEMIT_BMR_SCL))
> > +	if (!(status & SPACEMIT_BMR_SDA))
> >  		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
> >  }
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks for the RB!
                - Troy
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
