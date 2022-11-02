Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204CDC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqR3UHtEEcqFBfulwhPb6LC3SygWpY5JVnaung04keo=; b=bIEyV4Ts7aFilZ
	yXZZjYIjQwCuR+zYBurVAPDjg0XFcYC5EhKqFF5o2qT+oEbSVBQZrGk9I4nYHHV1zZ3x0ue69wEkM
	kO3xktngxgA6MsMBEMryWTNTFDSRj+dRkzcROrUWDBkE+cYUmnUKkOX2M953BNwpVZmgP5J5Hv1KR
	jtKQ4/zOvlxA17pVBXDHgsUaPsHmTDWxbC1yi6URHouHVh7gjGzXTEzYW2Pg1ZE4OjS21nXXEq3ME
	RXqXIbC2DMZGa72yCUFxKobPqPB3zcnph3oabtZRGzgT6JLUC6oqSgZTbATttVnw/gqZ/HAdmNfUq
	3Zzp8clcpbcsTiE2lxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHgc-00CcjP-5E; Wed, 02 Nov 2022 17:37:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHgY-00Cchn-UI
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 17:37:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1867461ACA;
	Wed,  2 Nov 2022 17:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01EEC433C1;
	Wed,  2 Nov 2022 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667410673;
	bh=C7djWQbBJX1AM7fSvtoWtTiF2BgIva+pASKAjGZVevU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odUT8QDh+qqr4P3f6EboSgGzToIq6ljdiISZHN7EIT3GuRbEUzStj66n/ONbIs/39
	 ZF4ZBaZd5KpfFDMvgRoZxbPx0t7+7ufnbDe2PGz1fAPssxhwtht1dD/PRgfvxF244o
	 3Vj7KqrscxfgNNyM7XbqDb0MTJaxtcLIdUUXbFElgRq+ArV0rqY02VqNuP/ASo1v5m
	 nYo0q+tu6idts2WGIcTxoTV7Wqy18/2LR0tDT/53iX9S/bT2BzENBmY0wki0+ODLtP
	 R/DYbNlh2mEksAb9vOVEd2EZjoSxepk8soefhHWWI3g9PFEb46DmVWL36Ikj6UaWnZ
	 hbh68oPdfPIig==
Date: Thu, 3 Nov 2022 01:28:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: vdso: fix section overlapping under some
 conditions
Message-ID: <Y2Koq5QELaoBe7nj@xhacker>
References: <20221031175842.1699-1-jszhang@kernel.org>
 <20221101091942.k7pgcbbkudgjk4ae@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101091942.k7pgcbbkudgjk4ae@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_103755_077292_714EB093 
X-CRM114-Status: GOOD (  28.70  )
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

On Tue, Nov 01, 2022 at 10:19:42AM +0100, Andrew Jones wrote:
> On Tue, Nov 01, 2022 at 01:58:42AM +0800, Jisheng Zhang wrote:
> > lkp reported a build error, I tried the config and can reproduce
> > build error as below:
> > 
> >   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
> > ld.lld: error: section .note file range overlaps with .text
> > >>> .note range is [0x7C8, 0x803]
> > >>> .text range is [0x800, 0x1993]
> > 
> > ld.lld: error: section .text file range overlaps with .dynamic
> > >>> .text range is [0x800, 0x1993]
> > >>> .dynamic range is [0x808, 0x937]
> > 
> > ld.lld: error: section .note virtual address range overlaps with .text
> > >>> .note range is [0x7C8, 0x803]
> > >>> .text range is [0x800, 0x1993]
> > 
> > Fix it by removing the hardcoding 0x800 and related comments.
> > 
> > Link: https://lore.kernel.org/lkml/202210122123.Cc4FPShJ-lkp@intel.com/#r
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/kernel/vdso/vdso.lds.S | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> > index 01d94aae5bf5..344209d2e128 100644
> > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > @@ -31,13 +31,7 @@ SECTIONS
> >  
> >  	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
> >  
> > -	/*
> > -	 * This linker script is used both with -r and with -shared.
> > -	 * For the layouts to match, we need to skip more than enough
> > -	 * space for the dynamic symbol table, etc. If this amount is
> > -	 * insufficient, ld -shared will error; simply increase it here.
> > -	 */
> > -	. = 0x800;
> 
> Hi Jisheng,

Hi Andrew,

> 
> Removing this hard coded value is a good thing, but I don't understand
> why, if it was necessary before, that it's no longer necessary. Can you
> please explain that in the commit message? If the linker improved in

To be honest, I dunno. The hardcoded 0x800 was there from day1, maybe
Palmer knew the details.

> this regard, then do we need to document a new minimum linker version?


> 
> > +	. = ALIGN(16);
> 
> Aligning text to a 4-byte boundary makes sense to me, but I don't

Aha, I think align text to 4byte is fine. In my old memories, I was
told to align function entry at 16byte boundary, I'm not sure this
is still true.

PS: I just sent out v2 of this fix. The fix method is different and
think v2 is the correct fix while this v1 is an improvement.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
