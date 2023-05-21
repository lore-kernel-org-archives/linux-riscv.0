Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98592C77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GlwNP7T5lrscxmU83iea8sF8WD8FGFlZ3KErvgkhzc=; b=RmzCAfw8iwUtY6
	kJjEvqUKSjszGUjdajG4IzQPLk6tcz70AjkHyqbLmRjNanPrZopOnkGch3MNMQi0ArroLn41hAZZJ
	WekH4ADLq8yHZy+oRsWe8xJhdhZnJh8+Gy0vSHnhacJ7YtvBAYO/R1q/PgfOixuLKsJz1yfigkxXh
	PqVOhgGQ775ShUCmiSrYznp2twpGx13j2C9LHinDrSDbCdLZWkLRZZ0TLly+6tJcsdR12bsX6TaKC
	UUmudnox9vO+7nZ+puCgrcEqWcDW4eueQG+dO2j30v1tJRr3Qq5b6Qe/gjw15AuVdsBzTlyKoj0bq
	bmh+pyX9OlXOwpDSacYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fEA-003UON-2b;
	Sun, 21 May 2023 09:19:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fE7-003UNy-30
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:19:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B42760DB7;
	Sun, 21 May 2023 09:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA5EC433D2;
	Sun, 21 May 2023 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684660782;
	bh=Ri3kKBr01+MP3QDbGPBmEWoExZ0gTtpVLnd/es22juQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVW8N9bs2UtvPpjhiGKfpluePpK8Thtinh0N35LKOGlGiK2nwWRlAw/TJNz2gp46G
	 5l/bDgQSH+vhXIcaUJ9NgdgiplvQpJSVdA2RB/Ti0p3h/jSRj9S6yC4CW7Hik1ej33
	 CDZgPezrjV21iVGzbUO9rWoD9gWl4QhgWTVz6u0av8mV+YsTkbpcUNagF1/cjhXGS6
	 lmDdHqrRqgdXUPGNT6i/4HzERGzet7w5sPMAjraM3NpyftNF7VNFhm7eJ5jYgrdQlQ
	 u6iubadEF7Z+mNAIjw2huT62DWCXVVVLGg3q8kv83z8yj3hrCA4lmKKv4OsVsdWGOv
	 pPDg9il8IUzGA==
Date: Sun, 21 May 2023 17:08:31 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: palmer@rivosinc.com, conor@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, npiggin@gmail.com,
	paul.walmsley@sifive.com, paulburton@kernel.org,
	vincent.chen@sifive.com, tim.bird@sony.com
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Message-ID: <ZGnfj6GIcam6O0ay@xhacker>
References: <20230517082936.37563-1-falcon@tinylab.org>
 <ZGna6sWmRZbMf3OH@xhacker>
 <ZGnbfhpLUY7w9Sdu@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZGnbfhpLUY7w9Sdu@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_021944_058486_576F5C25 
X-CRM114-Status: GOOD (  34.96  )
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

On Sun, May 21, 2023 at 04:51:14PM +0800, Jisheng Zhang wrote:
> On Sun, May 21, 2023 at 04:48:47PM +0800, Jisheng Zhang wrote:
> > On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> > > Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> > > the user to enable dead code elimination. In order for this to work,
> > > ensure that we keep the alternative table by annotating them with KEEP.
> > > 
> > > This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> > > it only shrinks their builds by ~1%, a smaller config is thereforce
> > > customized to test this feature:
> > 
> > OOPS, I didn't noticed that you have sent out the patch and you are now
> > in v3. I may read your patch sevral months ago, but I forget it.
> > But your version missed an important preparation patch which is
> > to fix the typo in commom vmlinux.lds.h in asm-generic, thus LD_ORPHAN_WARN
> > will warn loudly. See[1] for more details.
> > 
> > Another missing point is we need to keep the .init.pi* and .init.bss*
> > sections. See[1] for more details.
> > 
> > Since you are the first person to send out the patch of
> > HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv, do you mind if I update
> > my series and take your patch in my series v2, make you as the commmit
> > author, use your commit msg, and add my co-developped tag etc?

Another option is: I remove patch4 from my series and you send out an
updated version to fix the missing .init.pi* and .init.bss* KEEP.
> 
> forget to add Link reference:
> 
> [1] Link: https://lore.kernel.org/linux-riscv/20230511141211.2418-1-jszhang@kernel.org/
> 
> > 
> > Thanks
> > 
> > > 
> > >           | rv32                   | rv64
> > >   --------|------------------------|---------------------
> > >    No DCE | 4460684                | 4893488
> > >       DCE | 3986716                | 4376400
> > >    Shrink |  473968 (~10.6%)       |  517088 (~10.5%)
> > > 
> > > The config used above only reserves necessary options to boot on qemu
> > > with serial console, more like the size-critical embedded scenes:
> > > 
> > >   - rv64 config: https://pastebin.com/crz82T0s
> > >   - rv32 config: rv64 config + 32-bit.config
> > > 
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > ---
> > >  arch/riscv/Kconfig              | 1 +
> > >  arch/riscv/kernel/vmlinux.lds.S | 2 +-
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 348c0fa1fc8c..d2eb1a862ea8 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -111,6 +111,7 @@ config RISCV
> > >  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> > >  	select HAVE_KRETPROBES if !XIP_KERNEL
> > >  	select HAVE_RETHOOK if !XIP_KERNEL
> > > +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> > >  	select HAVE_MOVE_PMD
> > >  	select HAVE_MOVE_PUD
> > >  	select HAVE_PCI
> > > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > > index e5f9f4677bbf..0f5dfbc113d4 100644
> > > --- a/arch/riscv/kernel/vmlinux.lds.S
> > > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > > @@ -112,7 +112,7 @@ SECTIONS
> > >  	. = ALIGN(8);
> > >  	.alternative : {
> > >  		__alt_start = .;
> > > -		*(.alternative)
> > > +		KEEP(*(.alternative))
> > >  		__alt_end = .;
> > >  	}
> > >  	__init_end = .;
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
