Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4818D1036C
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+goMj1770IXu0amBJQo8HHbhPn1RMvxhkULL1iNb+8=; b=PYxD9sjQYqzbe9
	TG+xRdeQiKTMqoeTaDacTtH4+P/RqppKAXzxMp0VWHSWJXnkf0OHORBezRBAD/KEBshYdnPqf0Ycw
	/5Pzm5aAdNUCoPABlqo/bX8FzgVFhw/mtf/y7TkAQxvLyqX4EHs9wXAXUmaCwMWUOc9hOI7w2yWX1
	5eR5btLRZ3rq9i4Lz+RcrwmalYm/9uFDANnY7bzDsCgdObY4IYc9L0djklQ30g35fIw87G0FmcCUu
	qeyE1Aac7EAwsR5CB3yRgZL1EwydeJqdHYN1X5Lbq6yc+sz4dJNb8WIsgVuWGe4GTe509oNcroNJK
	5vbNxyM1IkzQLKpaihUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44l7-00000001mjS-2csL;
	Thu, 24 Oct 2024 20:48:41 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44hM-00000001lx0-2Hl1
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 20:44:50 +0000
Date: Fri, 25 Oct 2024 04:44:36 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241024204436-GYB1356851@gentoo>
References: <20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org>
 <20241024-penpal-skillet-c44a389e0d4d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024-penpal-skillet-c44a389e0d4d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134448_631236_421D5B43 
X-CRM114-Status: GOOD (  32.03  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor:

once more thing, I'd like to add one additonal mailinglist info,
which make sure all spacemit future patches flow to linux-riscv mailinglist

L: linux-riscv@lists.infradead.org

let me know if this is not ok?

On 16:31 Thu 24 Oct     , Conor Dooley wrote:
> On Wed, Oct 23, 2024 at 12:18:19PM +0800, Yixun Lan wrote:
> > Add myself as maintainer of SpacemiT's SoC tree, which
> > suggested by Conor [1].
> > 
> > Link: https://lore.kernel.org/all/20241018234615-GYA2124001@gentoo/ [1]
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > This will setup proper maintainer info about Spacemit's kernel tree,
> > which should help to take soc and device tree patches, and send the
> > pull request up to Arnd's soc tree.
> > 
> > I asked Kevin to host the kernel tree under SpacemiT's account
> > on github, which should help people to get access more easily,
> > and promote the tree a little bit.
> 
> What do you mean by "get access more easily"?
> 
I'd collect all patches of spacemit (including those sent by others)
and put them into a staging WIP branch, for people who interested to
download/test (not strongly related to upstream work..)

for not hosting the tree at my personal account, as I'd wish more
people to join as the maintainer, which would be easy to manage this..

> In case it is not clear, noone other than those listed in the
> maintainers entry should be pushing content to the fixes/next
> branches and all patches must go through the mailing lists and review
yes, I understand

> process. I'm sure you're well aware of this, but I've never interacted
> with spacemit and don't know if they are.
> 
yes, I will make sure them aware of this.

> Make sure you add the fixes/next branches to linux-next when you have
> the branches established.
> 
ok, I will send email to Stephen once this patch accepted

> > I could take this patch through this spacemit's soc tree if no objection,
> > of cource, after got ACK.
> 
> Yes, do it along with the base series, when that goes in.
> 
sure, will take it along with initial DT series

> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9659a5a7fb3347d649855992a559e3526d18443..4087023593f7a0b2d5c5827df682230c329f82a9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19791,6 +19791,7 @@ F:	arch/riscv/boot/dts/
> >  X:	arch/riscv/boot/dts/allwinner/
> >  X:	arch/riscv/boot/dts/renesas/
> >  X:	arch/riscv/boot/dts/sophgo/
> > +X:	arch/riscv/boot/dts/spacemit/
> >  X:	arch/riscv/boot/dts/thead/
> 
> Huh, this is not meant to look like that. Looks like the patch went
> missing. I'll have to rectify that. You can drop this hunk. I'm going
> to invert it:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=riscv-soc-fixes
> 
ok
> >  
> >  RISC-V PMU DRIVERS
> > @@ -21578,6 +21579,14 @@ W:	https://linuxtv.org
> >  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> >  F:	drivers/media/dvb-frontends/sp2*
> >  
> > +SPACEMIT SoC Support
> > +M:	Yixun Lan <dlan@gentoo.org>
> 
> I'd like to see someone else here, but if noone is volunteering
> themselves, we can hardly force them!
> 
sure, let's give people some time to consider, and I will send an updated version
next week..

> > +S:	Maintained
> > +T:	git https://github.com/spacemit-com/linux
> > +F:	arch/riscv/boot/dts/spacemit/
> > +N:	spacemit
> > +K:	spacemit
> > +
> >  SPANISH DOCUMENTATION
> >  M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> >  R:	Avadhut Naik <avadhut.naik@amd.com>
> > 
> > ---
> > base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
> > change-id: 20241023-00-k1-maintainer-46eb3f31e6f2
> > 
> > Best regards,
> > -- 
> > Yixun Lan <dlan@gentoo.org>
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
