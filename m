Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D85FD7F91
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiV+QDxGw3kwEIAZ+4MgL3fn+wJtCDXpEK+RmGN/1U8=; b=5EAi3TSun451fy
	USE6pOonkYCJnoDsDCrsRdAbZtWtT+PygvRBKMF83Ui+MPu6/mAEdXrwe9uk4FR9GEbGgRgvWcp2O
	pt+juneh7WyPRQLQkQro/2j8gqJFnnYUTrAABVjYHqVVh6RTGxJFK/q1Sl0K0EdlTe54NTwW5KWCg
	KfIRSeO1pG9SIf7ZWGRwffek/aaY85D/hu4AfQVloYl7MoCE9J1uz/1d7n1Xm5hb3rD3MMyXaYcKc
	mUBMGrDiPd4rttXfcPKqKjaYOGsJqeoO7Qg7WPBSKKnCxrBUI4CCVWgnbr50Hpm8xsr7zhBj5vSUS
	fjnbwmjurPRaHQQ4GoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw2h-00000008I74-37qr;
	Fri, 27 Feb 2026 11:29:59 +0000
Received: from mail.bix.bg ([193.105.196.21])
	by bombadil.infradead.org with smtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw2e-00000008I6X-3ujA
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 11:29:58 +0000
Received: (qmail 9827 invoked from network); 27 Feb 2026 11:29:53 -0000
Received: from d2.declera.com (HELO ?212.116.131.122?) (212.116.131.122)
  by indigo.declera.com with SMTP; 27 Feb 2026 11:29:53 -0000
Message-ID: <990bc03ed2baa05e619f0aa9cc6a23acadd66ea6.camel@declera.com>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
From: Yanko Kaneti <yaneti@declera.com>
To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Sebastian
 Reichel	 <sre@kernel.org>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Yixun Lan	 <dlan@gentoo.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti	 <alex@ghiti.fr>, "open
 list:RISC-V ARCHITECTURE:Keyword:riscv"	 <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit"	
 <spacemit@lists.linux.dev>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS"	
 <linux-pm@vger.kernel.org>
Date: Fri, 27 Feb 2026 13:29:53 +0200
In-Reply-To: <aaC78FTN31QYaVg0@aurel32.net>
References: <20251102230352.914421-1-aurelien@aurel32.net>
	 <20251102230352.914421-3-aurelien@aurel32.net>
	 <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
	 <aaC78FTN31QYaVg0@aurel32.net>
User-Agent: Evolution 3.59.2 (3.59.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_032957_299046_1F0052F5 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, 2026-02-26 at 22:32 +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-02-26 16:32, Yanko Kaneti wrote:
> > Hello,
> > 
> > On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
> > > Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > > v5: no changes
> > > 
> > >  drivers/mfd/simple-mfd-i2c.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > index 0a607a1e3ca1d..542d378cdcd1f 100644
> > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
> > >  };
> > >  
> > >  static const struct mfd_cell spacemit_p1_cells[] = {
> > > +	{ .name = "spacemit-p1-reboot", },
> > >  	{ .name = "spacemit-p1-regulator", },
> > >  	{ .name = "spacemit-p1-rtc", },
> > >  };
> > 
> > Perhaps its safe to merge this one now that everything P1 and I2C is
> > already in linus tip ?
> 
> Unfortunately, this patchset is still missing:
> https://lore.kernel.org/all/20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com/
> 
> This means the reboots work most of the time, but are not 100% reliable, 
> and that's the reason why this patch got blocked from merging.

I see. Thanks. Sounds to me like sometimes working compared to never
working is better , but anyway..

FWIW  with this patch and the pio patcheset I get this rcu splat on
reboot (which is still working). Similar splat is there without the pio
patcheset.

..
[   56.411363] systemd-shutdown[1]: Rebooting.
[   56.432988] reboot: Restarting system
[   56.434120] ------------[ cut here ]------------
[   56.438642] Voluntary context switch within RCU read-side critical section!
[   56.438665] WARNING: kernel/rcu/tree_plugin.h:332 at rcu_note_context_switch+0x370/0x510, CPU#0: systemd-shutdow/1
[   56.438693] Modules linked in: rfkill binfmt_misc vfat fat r8169 loop nfnetlink zram lz4hc_compress lz4_compress fuse
[   56.438733] CPU: 0 UID: 0 PID: 1 Comm: systemd-shutdow Not tainted 7.0.0-rc1+ #16 PREEMPT(full) 
[   56.438742] Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10ky-OpenWrt-r28427-6df0e3d02a 10/01/2022
[   56.438747] epc : rcu_note_context_switch+0x370/0x510
[   56.438757]  ra : rcu_note_context_switch+0x370/0x510
[   56.438764] epc : ffffffff801781b8 ra : ffffffff801781b8 sp : ffffffc6000432b0
[   56.438769]  gp : ffffffff83843a90 tp : ffffffd6048bdd00 t0 : ffffffff80036330
[   56.438774]  t1 : ffffffc600043080 t2 : 2d2d2d2d2d2d2d2d s0 : ffffffc600043330
[   56.438780]  s1 : ffffffd67eb15240 a0 : 000000000000003f a1 : ffffffff83559770
[   56.438784]  a2 : 0000000000000010 a3 : ffffffff83559b30 a4 : 0000000000000000
[   56.438789]  a5 : 0000000000000000 a6 : ffffffff83529700 a7 : ffffffff83559758
[   56.438793]  s2 : ffffffff83b55370 s3 : 0000000000000000 s4 : 0000000000000000
[   56.438798]  s5 : ffffffff83b55370 s6 : 0000000000000000 s7 : ffffffd605a1ccc0
[   56.438802]  s8 : 0000000000080009 s9 : 00000000fffc4890 s10: 0000000000000020
[   56.438806]  s11: ffffffff800b5160 t3 : 00000000ffffdfff t4 : 0000000000000001
[   56.438812]  t5 : 000000000000001f t6 : ffffffc600043098 ssp : 0000000000000000
[   56.438817] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[   56.438822] [<ffffffff801781b8>] rcu_note_context_switch+0x370/0x510
[   56.438832] [<ffffffff81285038>] __schedule+0x88/0x870
[   56.438844] [<ffffffff8128584e>] schedule+0x2e/0xa8
[   56.438851] [<ffffffff8128d9e4>] schedule_timeout+0x84/0x120
[   56.438860] [<ffffffff81286930>] wait_for_completion_timeout+0x78/0x148
[   56.438869] [<ffffffff80e30ab6>] spacemit_i2c_xfer_common+0x2d6/0x600
[   56.438881] [<ffffffff80e30e2a>] spacemit_i2c_xfer+0x1a/0x40
[   56.438887] [<ffffffff80e24d3a>] __i2c_transfer+0xf2/0x570
[   56.438896] [<ffffffff80e2520c>] i2c_transfer+0x54/0xc0
[   56.438903] [<ffffffff80c7fc02>] regmap_i2c_read+0x5a/0x98
[   56.438912] [<ffffffff80c791d4>] _regmap_raw_read+0xbc/0x380
[   56.438922] [<ffffffff80c794d0>] _regmap_bus_read+0x38/0x70
[   56.438930] [<ffffffff80c7776e>] _regmap_read+0x4e/0x1e0
[   56.438938] [<ffffffff80c7821c>] _regmap_update_bits+0xac/0xe8
[   56.438945] [<ffffffff80c79d04>] regmap_update_bits_base+0x5c/0x80
[   56.438953] [<ffffffff80e3ec1c>] spacemit_p1_restart_handler+0x2c/0x70
[   56.438963] [<ffffffff800b519a>] sys_off_notify+0x3a/0x60
[   56.438973] [<ffffffff800b3450>] notifier_call_chain+0x68/0x1a8
[   56.438980] [<ffffffff800b36c6>] atomic_notifier_call_chain+0x3e/0x60
[   56.438986] [<ffffffff800b5fb2>] do_kernel_restart+0x2a/0x40
[   56.438993] [<ffffffff80028b80>] machine_restart+0x18/0x28
[   56.439005] [<ffffffff800b618a>] kernel_restart+0x92/0xb8
[   56.439013] [<ffffffff800b64f2>] __do_sys_reboot+0x13a/0x238
[   56.439021] [<ffffffff800b671a>] __riscv_sys_reboot+0x22/0x38
[   56.439028] [<ffffffff8127ecfe>] do_trap_ecall_u+0x176/0x608
[   56.439036] [<ffffffff812926ec>] handle_exception+0x16c/0x178
[   56.439049] ---[ end tracsys: 0x0

Regards
Yanko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
