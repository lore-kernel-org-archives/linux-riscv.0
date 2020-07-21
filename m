Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F04C433EC
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:11:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FC4207BB
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0tp4WObo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FC4207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hTf2pRVJEN5mtFor8/y9ASgGzqxrSdybWu5IFggMuhA=; b=0tp4WOboBj3Mf0NlJ+BdoXu/W
	GRNVafvF0Ej5x1RbJu4W+H5n1LCBeOHbwI67vlPEicBmF4R/0CHPmloNlvnCUk6QePCDy9FcSy9pc
	anh6Vb/S+w3v2n53Uq1TbVJAzVftoW2vNT1zevV+3dsJU9l3Ep22IuegSpvt5wNlMi6sXq1reMGZj
	b0BbNpOjLy5BX/WPlqd1qMaYEPptAaukH/7rbp/XRUL54YLSLkqd1twxtQMBAy+difzLyVRbtgIvE
	9mM3BBbPiAt2L0A/FuOOTODlXzf8bTCIedlkbjSgza+WvREeZNlXKprS+2s+WYr0qjYPses6bMo1M
	n+TReTbrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy1QO-0007Ma-92; Tue, 21 Jul 2020 23:11:52 +0000
Received: from kernel.crashing.org ([76.164.61.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy1QL-0007L7-Pp
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 23:11:50 +0000
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06LNB4EP017146
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Jul 2020 18:11:11 -0500
Message-ID: <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 22 Jul 2020 09:11:02 +1000
In-Reply-To: <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
 <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_191149_962485_B17E100B 
X-CRM114-Status: GOOD (  18.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, mpe@ellerman.id.au,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 14:36 -0400, Alex Ghiti wrote:
> > > I guess I don't understand why this is necessary at all.  
> > > Specifically: why
> > > can't we just relocate the kernel within the linear map?  That would 
> > > let the
> > > bootloader put the kernel wherever it wants, modulo the physical 
> > > memory size we
> > > support.  We'd need to handle the regions that are coupled to the 
> > > kernel's
> > > execution address, but we could just put them in an explicit memory 
> > > region
> > > which is what we should probably be doing anyway.
> > 
> > Virtual relocation in the linear mapping requires to move the kernel 
> > physically too. Zong implemented this physical move in its KASLR RFC 
> > patchset, which is cumbersome since finding an available physical spot 
> > is harder than just selecting a virtual range in the vmalloc range.
> > 
> > In addition, having the kernel mapping in the linear mapping prevents 
> > the use of hugepage for the linear mapping resulting in performance loss 
> > (at least for the GB that encompasses the kernel).
> > 
> > Why do you find this "ugly" ? The vmalloc region is just a bunch of 
> > available virtual addresses to whatever purpose we want, and as noted by 
> > Zong, arm64 uses the same scheme.

I don't get it :-)

At least on powerpc we move the kernel in the linear mapping and it
works fine with huge pages, what is your problem there ? You rely on
punching small-page size holes in there ?

At least in the old days, there were a number of assumptions that
the kernel text/data/bss resides in the linear mapping.

If you change that you need to ensure that it's still physically
contiguous and you'll have to tweak __va and __pa, which might induce
extra overhead.

Cheers,
Ben.
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
