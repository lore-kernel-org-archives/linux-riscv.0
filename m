Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEA1C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 08:21:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7E223131
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 08:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7E223131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rYkgYcgqSQAsVD4VRDgIH7CWasK77cdGJwgeGM0SiXY=; b=SwqzL3Otc20boQUV8obqXK8no
	oVyDeWHw/NeKboC18rWNJf5WIlrugYsg6x5B6FjFgO1yMeuHkhe9QgnBex2nJ9RClwtEEE+QSD9eG
	xBssbi7+srBYvcDwngJGDadj4Rvsi0fiQYl1fADmDBFB9xOhCN49I+DZDPuudm/2xjqJy82jEPkZr
	J78pIErA2hyykrpshO1vrO9Iz62U7BvWV+vnzuiP2uUrx7Zw7QgJuc+H75G9bnLPfGf4nBsS84QlG
	/Gy/gzXNEQRLpa8MituBNjAEHyjX1aPgo5dOc2fY9LAxV0iWJx8oQiRduDLlU1g+FYZ/gWj0rHd12
	z94G3ylkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l28ja-0002Kw-AO; Wed, 20 Jan 2021 08:20:58 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l28jV-0002Ip-ND
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 08:20:55 +0000
Received: by mail-ot1-f48.google.com with SMTP id f6so13403050ots.9
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 00:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54NUOyClmna+6jwSaRTzrk1a0mWX77xAMqQqC9zDA3k=;
 b=jR7tgl/gPFENFix/u9SehHdEnZm7GzhZtjGfOE8sVSdXxF1bVIAmvaUGn/TqAGkkUT
 G4IUH5YpWrCOaHj7fREFTD8JqbmOVPpRuzgvJ2GxYb70kcOjrSNwh7M5yHkPgOSewVBj
 z7bl9khRqMCl5SJG+WG/thAHK7c3JDXYq6OaEYVfq6+hkD53+rdz0nwW1rmAr/WNUxmU
 8H/8NKxFNqCbsOeTT12otn5SduqjhwQtozwiOhF3nli1LvJdAL2I4VJqbaUHPblJ0Sq8
 RYU7E8nnOOZPzkhDRI7DEHTmr9tvVu2cnwlNf7HHDeJLosAG0xD8fLOdfbn4Bx2fUxku
 44+Q==
X-Gm-Message-State: AOAM53165UFKXecuQyivaIxRll3AosPBBA7rJfjz8iZkhJFVJrxdX9gv
 JCOp/atS632BfimUoO0PUwXfZGOQrXE+KQWcpVA=
X-Google-Smtp-Source: ABdhPJzfxMTsAvZ+SILTVY24yY9okpaVeh49Zuxh+4hAVdm2JWBVT+vMz8fsNOfjP6a3VqlGpJ4mOqfERVCUhhoahvE=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr6286950oth.250.1611130850929; 
 Wed, 20 Jan 2021 00:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20210119080938.1832733-1-geert@linux-m68k.org>
 <20210119213444.GL2002709@lianli.shorne-pla.net>
 <20210119221110.GM2002709@lianli.shorne-pla.net>
In-Reply-To: <20210119221110.GM2002709@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jan 2021 09:20:39 +0100
Message-ID: <CAMuHMdVpogc=oEgCCq8N__RJkujJX47OaZZcyaRgjSJV2+SZ-Q@mail.gmail.com>
Subject: Re: [PATCH v4] drivers/soc/litex: Add restart handler
To: Stafford Horne <shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_032053_927383_A5C62C9B 
X-CRM114-Status: GOOD (  26.25  )
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
Cc: Mateusz Holenko <mholenko@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Stafford,

On Tue, Jan 19, 2021 at 11:11 PM Stafford Horne <shorne@gmail.com> wrote:
> On Wed, Jan 20, 2021 at 06:34:44AM +0900, Stafford Horne wrote:
> > On Tue, Jan 19, 2021 at 09:09:38AM +0100, Geert Uytterhoeven wrote:
> > > Let the LiteX SoC Controller register a restart handler, which resets
> > > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Thanks, this looks good to me, queued to my linux-next branch.
> >
> > -Stafford
> >
> > > @@ -66,8 +71,19 @@ static int litex_check_csr_access(void __iomem *reg_addr)
> > >
> > >  struct litex_soc_ctrl_device {
> > >     void __iomem *base;
> > > +   struct notifier_block reset_nb;
> > >  };
> > >
> > > +static int litex_reset_handler(struct notifier_block *this, unsigned long mode,
> > > +                          void *cmd)
> > > +{
> > > +   struct litex_soc_ctrl_device *soc_ctrl_dev =
> > > +           container_of(this, struct litex_soc_ctrl_device, reset_nb);
> >
> > Nice.
> >
> > > +   litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
> > > +   return NOTIFY_DONE;
> > > +}
> > > +
>
> Actually, I tested this out on the latest (2-weeks ago) Litex and
> openrisc/for-next and it didn't seem to work correctly.
>
> I will look into it a bit closer, but if you see or can think of anything let
> me know.  Note There are a few failures below related to network services as my
> for-next kernel doesnt have a network driver (yet).

Hmmm, openrisc/for-next does have commit 131172a4a8ce3fcc ("openrisc:
restart: Call common handlers before hanging").

It's been a few years I used an OpenRISC setup.
Do you have a link to Linux on mor1kx/LiteX setup instructions?

>
> Using my buildroot rootfs: http://shorne.noip.me/downloads/or1k-glibc-rootfs.cpio.gz
>
>     # shutdown -r now
>
>     Broadcast message from root@buildroot (console) (Thu Jan  1 00:00:48 1970):
>     The system is going down for reboot NOW!
>     INIT: Switching to runlevel: 6
>     # mounting home work nfs ...
>     mount: mounting 10.0.0.27:/home/shorne/work on /home/shorne/work failed: No such device
>     enabling login for shorne ...
>     setting coredumps ...
>     Stopping dropbear sshd: FAIL
>     Stopping ntpd: FAIL
>     Nothing to do, sntp is not a daemon.
>     Stopping network: ifdown: interface lo not configured
>     ifdown: interface eth0 not configured
>     OK
>     Saving random seed: [   52.020000] random: dd: uninitialized urandom read (512 bytes read)
>     OK
>     Stopping klogd: OK
>     Stopping syslogd: start-stop-daemon: warning: killing process 51: No such process
>     FAIL
>     umount: devtmpfs busy - remounted read-only
>     umount: can't unmount /: Invalid argument
>     [   53.710000] reboot: Restarting system
>     [   54.710000] Reboot failed -- System halted
>     [   76.040000] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [reboot:131]
>     [   76.040000] CPU: 0 PID: 131 Comm: reboot Not tainted 5.11.0-rc1-00009-gff28dae0bc90 #418
>     [   76.040000] CPU #: 0
>     [   76.040000]    PC: c00050b8    SR: 0000827f    SP: c180fdb0
>     [   76.040000] GPR00: 00000000 GPR01: c180fdb0 GPR02: c180fdc0 GPR03: 0000827f
>     [   76.040000] GPR04: c0348944 GPR05: 00000000 GPR06: c180fc70 GPR07: 00000000
>     [   76.040000] GPR08: c180fdb0 GPR09: c00050b8 GPR10: c180e000 GPR11: 0000001e
>     [   76.040000] GPR12: 00000000 GPR13: 00000020 GPR14: 00000001 GPR15: 00000000
>     [   76.040000] GPR16: 00000000 GPR17: c02e48d4 GPR18: 00418958 GPR19: c02e48d4
>     [   76.040000] GPR20: 00000000 GPR21: 00000000 GPR22: c02e4018 GPR23: fffffffe
>     [   76.040000] GPR24: ffffffff GPR25: 00000000 GPR26: 00000000 GPR27: 00000000
>     [   76.040000] GPR28: 00000000 GPR29: ffffffff GPR30: 00000000 GPR31: ffffffff
>     [   76.040000]   RES: 0000001e oGPR11: ffffffff
>     [   76.040000] Process reboot (pid: 131, stackpage=c180a000)
>     [   76.040000]
>     [   76.040000] Stack:
>     [   76.040000] Call trace:
>     [   76.040000] [<(ptrval)>] machine_restart+0x44/0x5c
>     [   76.040000] [<(ptrval)>] kernel_restart+0x78/0xa4
>     [   76.040000] [<(ptrval)>] ? mutex_lock+0x24/0x50
>     [   76.040000] [<(ptrval)>] __do_sys_reboot+0x1a8/0x21c
>     [   76.040000] [<(ptrval)>] ? do_filp_open+0x40/0xa0
>     [   76.040000] [<(ptrval)>] ? slab_free_freelist_hook+0x6c/0x14c
>     [   76.040000] [<(ptrval)>] ? arch_local_irq_save+0x24/0x3c
>     [   76.040000] [<(ptrval)>] ? kmem_cache_free+0x130/0x194
>     [   76.040000] [<(ptrval)>] ? call_rcu+0x50/0x8c
>     [   76.040000] [<(ptrval)>] ? __fput+0x2d0/0x2f4
>     [   76.040000] [<(ptrval)>] ? do_sys_openat2+0xd8/0x134
>     [   76.040000] [<(ptrval)>] ? task_work_run+0xbc/0xf4
>     [   76.040000] [<(ptrval)>] ? do_work_pending+0x60/0x12c
>     [   76.040000] [<(ptrval)>] sys_reboot+0x14/0x24
>     [   76.040000] [<(ptrval)>] ? _syscall_return+0x0/0x4
>
>
> -Stafford



-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
