Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64577EA71A1
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 19:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Id4HksimfB9PkQ0CRaB0RPxzhwe89DslSTHW7J89kVs=; b=ByVNCD+XeRb7Js
	jMPw74NT6D2cevXI6uD0aobRBhZR0jX9cMsV7xXgt/1v3iE08IWk6CJ3KF0wHxaElG7A9ZZ+dNvet
	pzXUXHi1hg2Nh6O+JirrrXi2XV4lWRLB37Wf/aoUCz0e97cM9RDcozF5R97DcKhxA+v7bS+B7WGEW
	sbj2QfZTF3ZIEko6veIMi8rwW5Oh6myPReQlsb0EPjGCU561bTVaIjEOMBGOoSyMhAXXW5TCzeNrh
	2CibW8k+AV/0fl2JiIuoDAuXE0RWawtTPNCfW+YZxRT4vGsFylCmkDf93vOOqs0+t0MDpW5T2NCz5
	Gqr9WSdX3UK2F+lEhp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXUZ-000000061M6-31VP;
	Sun, 19 Apr 2026 19:07:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXUY-000000061Lz-33l2
	for linux-riscv@lists.infradead.org;
	Sun, 19 Apr 2026 19:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9EDF6011F;
	Sun, 19 Apr 2026 19:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0C2C2BCAF;
	Sun, 19 Apr 2026 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776625657;
	bh=CLN/WytTm5Iyitqeq5WgLKn12mSy9O29jgFf5PJ1nqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JvqeAI5YOhaFnwRk0ai+Xp5cF9LJbDyfC6O/rff6/2HzqpzXUjMlXl5c+t/wXaYoT
	 txV57DUNkdCZWThfVymtG5zNHw9m8GpDtb1qkSLpr76cVzmIBO/V4P+Lx1ZPN15452
	 bLtug+6bRzvsAkRlGivmRzLYMxu8EJj+eERjsdL0z7l+y0dW3zmzDpFw5jOfWFMKUs
	 pLxys6SlEh7xOOEnjxxxUX/0hR5G7a+0nFMRAHA+cGkDC5tSLIXKfcdExSKjAC1SwU
	 Av72Rehz4czWTQSLHeO9dnskWe/Lkm19OW2P8X5JP6eisw1DLuFH4C5AoatBI3hhir
	 ZVNnKQzLSBOiA==
Date: Sun, 19 Apr 2026 21:07:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Dan Williams
 <djbw@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/11] MAINTAINERS: add an entry for media
 maintainers profile
Message-ID: <20260419210730.3c9a84d1@foz.lan>
In-Reply-To: <63c25cd9-2145-40c7-b1bc-463214d5df6c@infradead.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
	<361c00348573e45b4e06b674b2b45e47dc65c938.1776405189.git.mchehab+huawei@kernel.org>
	<63c25cd9-2145-40c7-b1bc-463214d5df6c@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

On Sat, 18 Apr 2026 17:02:55 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> > The media subsystem has a maintainers entry profile, but its entry
> > is missing at MAINTAINERS.
> > 
> > Add it.
> > 
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f0b106a4dd96..620219e48f98 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16115,6 +16115,7 @@ S:	Maintained
> >  W:	https://linuxtv.org
> >  Q:	http://patchwork.kernel.org/project/linux-media/list/
> >  T:	git git://linuxtv.org/media.git
> > +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
> >  F:	Documentation/admin-guide/media/
> >  F:	Documentation/devicetree/bindings/media/
> >  F:	Documentation/driver-api/media/  
> 
> I now see 2 P: entries for MEDIA INPUT INFRASTRUCTURE
> and 2 P: entries for X86 ARCHITECTURE.
> (don't know how/why)
> 
My patches (and my tests) are based on docs-next. Perhaps some other
patch is adding them as well.

I'll rebase them on the top of -rc1 after it gets released.

Thanks,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
