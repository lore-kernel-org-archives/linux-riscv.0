Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F5BC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olni8tSehzlThP/CLrWYXzj1RIMYRvCgvtn+sUjw6lY=; b=ee/ga5tKdBjArZ
	9fGMtTl/vpGv0XXeGGYGxvyJmJlLns8hEalEfsgFa7PUG1h60Jbs61ZsSG/cMyNudcc+649Ocm2bA
	wwSCSwM1SlKcpOB4y4Z1nLAas6mKDecF+mewzJX3NoDPTZOe13NSyj3MLT0KcnVBv3jQJRBkmkFN9
	jJ5mH68W1tF2e1WBz/j35B8Fz+NXbHTGeG7ix4GUd5jXA+LjRr463MaPlS+SGkWNNgHPT6rmX5Ldr
	7H7ucCTM4l4EG/IwxkvsUYFlUhuHJad3Sp1Es9BGXgJjmoYrz/JG8pYl1vSVujHqJLzawu8mDd6f/
	zf1UERopxogUXYTDO7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOeK-003cj9-28;
	Tue, 09 May 2023 14:49:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOeH-003ci2-2f
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 14:49:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCE7E6104A;
	Tue,  9 May 2023 14:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CCBC433EF;
	Tue,  9 May 2023 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683643744;
	bh=NBvpZ3SVsEm0RYtMI4MVcyA/5Q5NxM5iMqiiZpuJwog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYRH/oxwAZvnUeZPPirZXT7XWphCD4RiogIVrgR0hmbqX2nXQTT24uAmjwk6gbMu7
	 rdbt7GsjiN/gVpBu9EodkLSk95qo4OzGy32rNn3B4iw3FCYWCG0cOVLC01M/oGpRYK
	 h9suRxfgbB9B1abUln2d3A17GNmKVeEHCCZ+IHbWPiBcrhffOL/OJMB+LVCA208+V0
	 yNAvnS4TXlvuq/yvOBgxbISxBplraaUTtpPg+cWZUxxCQipC3p++WVhI4ySs4trCW9
	 YTooyDIqUO4mfR0WhY/yTmgzDQ/hM9yJGIQOnt+qbPHUGgJJKCI0SQZbVzrVmiPhDm
	 JKBXF3mse5wUQ==
Date: Tue, 9 May 2023 22:37:56 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: enable BUILDTIME_TABLE_SORT for !MMU
Message-ID: <ZFpaxItE8TUTXktH@xhacker>
References: <20230409164306.3801-1-jszhang@kernel.org>
 <20230411-flier-establish-d3ffd434be28@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230411-flier-establish-d3ffd434be28@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_074905_929155_6B15AB50 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, Apr 11, 2023 at 10:37:36AM +0100, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Mon, Apr 10, 2023 at 12:43:06AM +0800, Jisheng Zhang wrote:
> > BUILDTIME_TABLE_SORT works for !MMU as well, so enable it.
> > 
> > Tested on QEMU and FPGA.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Fails to build for nommu_k210_defconfig:
> 
> make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build -sk -j30
> no __ex_table in file: vmlinux

This failure log makes me carefully go through the ex_table mechanism
again. Now I knew where's the failure from and what should be done:
Because FUTEX is disabled in nommu_k210_defconfig. However, there's a
deeply hidden issue here: there should be no __ex_table section usage
at all in NOMMU case, becaue __ex_table usage relies on MMU to do the
*fixup*, so I need to patch the risc extable part instead.

Thanks

> Failed to sort kernel tables
> make[2]: *** [../scripts/Makefile.vmlinux:35: vmlinux] Error 1
> make[2]: *** Deleting file 'vmlinux'
> make[2]: Target '__default' not remade because of errors.
> make[1]: *** [/home/conor/stuff/linux/Makefile:1250: vmlinux] Error 2
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:226: __sub-make] Error 2
> make: Target '__all' not remade because of errors.
> 
> :(
> 
> > ---
> >  arch/riscv/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c5e42cc37604..212ea28e346b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -50,7 +50,7 @@ config RISCV
> >  	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
> >  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
> >  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> > -	select BUILDTIME_TABLE_SORT if MMU
> > +	select BUILDTIME_TABLE_SORT
> >  	select CLINT_TIMER if !MMU
> >  	select CLONE_BACKWARDS
> >  	select COMMON_CLK
> > -- 
> > 2.40.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
