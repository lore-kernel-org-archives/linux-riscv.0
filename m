Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F001CC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 18:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZViu2/kahXukvbOnWe6gYC88nMUe0MQuZgbiAw0FBQY=; b=HYRHcu8oUKsUa3
	HwhThPby52pLZJsnh9uJDsE2IePgiVb7z4JQ7p4wZ8e60gaS8ty/QromZlpnWws0mabum+JKuzCkA
	ntXlq8KBsikFjkRkMs6EhZCpSXKFFPV27+uM0NnGOFU3jM/pXs64ge1QePvSPpvvpinYO7+ub3c/q
	wzzv1uqyYjuKnhin5rG6VOcywc8JgkGobIMGx4KWrv/nppKKt2UqXKORNzfzgEMmUGixkd6gso5sg
	/gs1g/nOWU5gKYOseLha0P/4eO064ZZVn9+SrKz+4cmnKtI1F7poPzT5UYrLRTNxRHgtrfkvk1Hex
	SOotbFg8mLafWPWGufkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nz3-009T2Z-7W; Thu, 01 Dec 2022 18:08:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nyf-009SgA-1H
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 18:08:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DFF7620B0;
	Thu,  1 Dec 2022 18:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E3FC433D6;
	Thu,  1 Dec 2022 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669918083;
	bh=eV3341lb7+6XNgTLaIktuIdCJWmIKdKYI2s1ijZKMoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+zPGiLMYc5v/FcCKV7AL61qlcz+UajvuQOLjlB36s0iW8umPovln0c9qhmepMJ3s
	 wHoCZXrfKolXi145YCVFHm7mdzYzubwMq62NDQmOQ/ZMZRJMSUoBPMMZDCoW2ZoTf1
	 /+HlzfOO0nZaJtVfAXFpoBQN1hIkwYPn/5HgPCFn9JeNPhTl3E1e+vLOryLHdSkZda
	 QmOL7opnC8pJTLpmIMbPAz4NkbOAo4oEWiDZdC4q5rwSS5GRxyuBRz14Qqb3/P5FRU
	 Z5eMogzHFPVtiknCB88tYl9m0Bm41g4tGhhFMZYOtG9jzVlCF/hlBEgvU4nfleNSlq
	 KWb8blwMxFaSg==
Date: Thu, 1 Dec 2022 18:07:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Song Shuai <suagrfillet@gmail.com>
Cc: Song Shuai <suagrfillet@gmail.com>, guoren@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	apatel@ventanamicro.com, atishp@atishpatra.org, heiko@sntech.de,
	anshuman.khandual@arm.com, liaochang1@huawei.com,
	juerg.haefliger@canonical.com, wangkefeng.wang@huawei.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv : select
 FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Message-ID: <Y4jtfrJt+/Q5nMOz@spud>
References: <20221201151336.8044-1-suagrfillet@gmail.com>
 <Y4jICn5oxLozsv6m@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4jICn5oxLozsv6m@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_100805_184380_D88B8577 
X-CRM114-Status: GOOD (  22.41  )
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

On Thu, Dec 01, 2022 at 03:28:10PM +0000, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 11:13:36PM +0800, Song Shuai wrote:
> > In RISC-V, -fpatchable-function-entry option is used to support
> > dynamic ftrace in this commit afc76b8b8011 ("riscv: Using
> > PATCHABLE_FUNCTION_ENTRY instead of MCOUNT"). So recordmcount
> > don't have to be called to create the __mcount_loc section before
> > the vmlinux linking.
> > 
> > Here selects FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY to tell
> > Makefile not to run recordmcount.
> > 
> > Link_v1: https://lore.kernel.org/linux-riscv/CAAYs2=j3Eak9vU6xbAw0zPuoh00rh8v5C2U3fePkokZFibWs2g@mail.gmail.com/T/#t
> > Link_v2: https://lore.kernel.org/linux-riscv/CAAYs2=iYn8sLQB8oh+RzTKd2VKs8MXOLX6Mwpamx5gdVVN6mkA@mail.gmail.com/T/#m62138d7a76664798d00051818a438a601eff4cf1
> 
> Hey Song Shuai,
> 
> For future patches, please use normal "Link:" tags. If you're just
> linking to prior versions of the patch, just put them below the ---
> line so they don't end up in the git history.

> > Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> > Tested-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 572973103d73..c19cddb8feb9 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -277,6 +277,7 @@ config ARCH_RV64I
> >  	select 64BIT
> >  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> >  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
> > +	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE

Also, why are these not added in alphabetical order, like the current
list is? I don't see HAVE_DYNAMIC_FTRACE in linux-next from the other
day so that probably needs fixing in the series you are based on too.

> >  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> >  	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >  	select HAVE_SAMPLE_FTRACE_DIRECT
> > -- 
> > 2.20.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
