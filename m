Return-Path: <SRS0=fDxE=GW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC86C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 22:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAED022E01
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 22:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAED022E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gcmLBuICKEspPL0LCi9qFW3I+1qQe+6puKjr1z5ORLc=; b=f7bgkx+71tP24lnXpqMru8ivN
	6lH5PeXw19Y+78MrZ0LcP1o5g5F1AaWQxPsDJIT+bHRQxrfRaKQ/r0aVEwTr5dEIqfj3GEAofM3jL
	nVzsi4vhC3Vp0DbCHmkuTx2rBR8NMYNIoMasJvMIVvBCYhqS0qUu23OE032Cz7rKwly57A27S2AJ5
	MCoH6O0wpqCgvBdl7Ovd49LggCIfpla61Ekih0mX/pR78xG346NxRZVEMAJObqdZ4kI96WsGx2GsE
	EZJN8fvuYspBzwncR+nHiYnSNVAJ/COiyFKi9L8PZi83W/noScot3P238hJo5pF+FSLLFmixRBeVp
	nsPJLnjMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1zDZ-0008Jp-Vf; Tue, 19 Jan 2021 22:11:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1zDX-0008J5-DX
 for linux-riscv@lists.infradead.org; Tue, 19 Jan 2021 22:11:16 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q7so13849222pgm.5
 for <linux-riscv@lists.infradead.org>; Tue, 19 Jan 2021 14:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=swn/lFlreTHNa8exuubaqI6V2VjZdZSiepv5kEfW088=;
 b=Cfxcfy3o3dUhwNY9xxjHYDVCV2qv6d24hHv55DrhGuKyowNp/t1vfRMd0dGWa8xvzU
 BsR7VSv/IyPp+0G6Mv82dxmbqrtTIl9doekuc9VCBkZuemNiHjn+6bbM5afpzXa0wQRX
 zkBzlx0fQdK3ubMqlzPwz+y//xcU9TNbj3CXJn7xl84eIMsloRBtRVlBWnxDNVT+p5Bu
 NoBAIbm1gZkAW32qmZC/H7a5fQqMA9BSp8waoepvnhfmAwjTuU8IWvBd8xevEXCEYoos
 d+Kdm0K1bEWukkfro+4Jr1pxC5xFuSpPcMmDLgzkx71X6RGl1PGMkOuptO/hMyz9MSWS
 H1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=swn/lFlreTHNa8exuubaqI6V2VjZdZSiepv5kEfW088=;
 b=CsiVZfrcauGdhCHpnzCXq/7YGS9dqLnnRIfSwsvO4n1cKnhNlD0ztajMLLARZ1hBJw
 EoMRV8KQBx3b7YC9TJ5ADW9iKnzj/c6TxdUisQl/ElMVR9kFILqS2ZaxOlB+HRV7PX9u
 DtNO9jmkbJPvKqOBzTeaTB9J04tq3PW3v0bxh98i7u8KRqkgTswqjoblafFCJgBBIclc
 1Yeu+aphoK/uAFQ68YC5RczRg848SNs0kOJ6xFwvlF0ZN35CPd+Ehg/4IwPeYxeap/3+
 rZ/QKR4Sq1hgrKEIXB98Tp28tbOeALbxXW/Wyiht3RbYdFjC6nv0REyDze57fvOc2eI0
 vIIw==
X-Gm-Message-State: AOAM530fxdby8Xt5c8Vf2xFfZXRfSwtNnz2nEKGOlmplWvSyQN7NzlKC
 2qXUu/zQzAk9cqcxSgdzstE=
X-Google-Smtp-Source: ABdhPJyK2GNfzbEuvg4RYa88eZeYn5iPKArW2XyJNdb76B+XXY8cEYsB8XK2OIF+2FxU6QQgx0tdPA==
X-Received: by 2002:a63:50a:: with SMTP id 10mr6263170pgf.273.1611094273530;
 Tue, 19 Jan 2021 14:11:13 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id b17sm3670pju.15.2021.01.19.14.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 14:11:12 -0800 (PST)
Date: Wed, 20 Jan 2021 07:11:10 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drivers/soc/litex: Add restart handler
Message-ID: <20210119221110.GM2002709@lianli.shorne-pla.net>
References: <20210119080938.1832733-1-geert@linux-m68k.org>
 <20210119213444.GL2002709@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119213444.GL2002709@lianli.shorne-pla.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_171115_472425_2B0954BB 
X-CRM114-Status: GOOD (  20.64  )
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
Cc: Gabriel Somlo <gsomlo@gmail.com>, linux-riscv@lists.infradead.org,
 Mateusz Holenko <mholenko@antmicro.com>, Karol Gugala <kgugala@antmicro.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 20, 2021 at 06:34:44AM +0900, Stafford Horne wrote:
> On Tue, Jan 19, 2021 at 09:09:38AM +0100, Geert Uytterhoeven wrote:
> > Let the LiteX SoC Controller register a restart handler, which resets
> > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Thanks, this looks good to me, queued to my linux-next branch.
> 
> -Stafford
> 
> > @@ -66,8 +71,19 @@ static int litex_check_csr_access(void __iomem *reg_addr)
> >  
> >  struct litex_soc_ctrl_device {
> >  	void __iomem *base;
> > +	struct notifier_block reset_nb;
> >  };
> >  
> > +static int litex_reset_handler(struct notifier_block *this, unsigned long mode,
> > +			       void *cmd)
> > +{
> > +	struct litex_soc_ctrl_device *soc_ctrl_dev =
> > +		container_of(this, struct litex_soc_ctrl_device, reset_nb);
> 
> Nice.
> 
> > +	litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
> > +	return NOTIFY_DONE;
> > +}
> > +

Actually, I tested this out on the latest (2-weeks ago) Litex and
openrisc/for-next and it didn't seem to work correctly.

I will look into it a bit closer, but if you see or can think of anything let
me know.  Note There are a few failures below related to network services as my
for-next kernel doesnt have a network driver (yet).

Using my buildroot rootfs: http://shorne.noip.me/downloads/or1k-glibc-rootfs.cpio.gz

    # shutdown -r now

    Broadcast message from root@buildroot (console) (Thu Jan  1 00:00:48 1970):
    The system is going down for reboot NOW!
    INIT: Switching to runlevel: 6
    # mounting home work nfs ...
    mount: mounting 10.0.0.27:/home/shorne/work on /home/shorne/work failed: No such device
    enabling login for shorne ...
    setting coredumps ...
    Stopping dropbear sshd: FAIL
    Stopping ntpd: FAIL
    Nothing to do, sntp is not a daemon.
    Stopping network: ifdown: interface lo not configured
    ifdown: interface eth0 not configured
    OK
    Saving random seed: [   52.020000] random: dd: uninitialized urandom read (512 bytes read)
    OK
    Stopping klogd: OK
    Stopping syslogd: start-stop-daemon: warning: killing process 51: No such process
    FAIL
    umount: devtmpfs busy - remounted read-only
    umount: can't unmount /: Invalid argument
    [   53.710000] reboot: Restarting system
    [   54.710000] Reboot failed -- System halted
    [   76.040000] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [reboot:131]
    [   76.040000] CPU: 0 PID: 131 Comm: reboot Not tainted 5.11.0-rc1-00009-gff28dae0bc90 #418
    [   76.040000] CPU #: 0
    [   76.040000]    PC: c00050b8    SR: 0000827f    SP: c180fdb0
    [   76.040000] GPR00: 00000000 GPR01: c180fdb0 GPR02: c180fdc0 GPR03: 0000827f
    [   76.040000] GPR04: c0348944 GPR05: 00000000 GPR06: c180fc70 GPR07: 00000000
    [   76.040000] GPR08: c180fdb0 GPR09: c00050b8 GPR10: c180e000 GPR11: 0000001e
    [   76.040000] GPR12: 00000000 GPR13: 00000020 GPR14: 00000001 GPR15: 00000000
    [   76.040000] GPR16: 00000000 GPR17: c02e48d4 GPR18: 00418958 GPR19: c02e48d4
    [   76.040000] GPR20: 00000000 GPR21: 00000000 GPR22: c02e4018 GPR23: fffffffe
    [   76.040000] GPR24: ffffffff GPR25: 00000000 GPR26: 00000000 GPR27: 00000000
    [   76.040000] GPR28: 00000000 GPR29: ffffffff GPR30: 00000000 GPR31: ffffffff
    [   76.040000]   RES: 0000001e oGPR11: ffffffff
    [   76.040000] Process reboot (pid: 131, stackpage=c180a000)
    [   76.040000]
    [   76.040000] Stack:
    [   76.040000] Call trace:
    [   76.040000] [<(ptrval)>] machine_restart+0x44/0x5c
    [   76.040000] [<(ptrval)>] kernel_restart+0x78/0xa4
    [   76.040000] [<(ptrval)>] ? mutex_lock+0x24/0x50
    [   76.040000] [<(ptrval)>] __do_sys_reboot+0x1a8/0x21c
    [   76.040000] [<(ptrval)>] ? do_filp_open+0x40/0xa0
    [   76.040000] [<(ptrval)>] ? slab_free_freelist_hook+0x6c/0x14c
    [   76.040000] [<(ptrval)>] ? arch_local_irq_save+0x24/0x3c
    [   76.040000] [<(ptrval)>] ? kmem_cache_free+0x130/0x194
    [   76.040000] [<(ptrval)>] ? call_rcu+0x50/0x8c
    [   76.040000] [<(ptrval)>] ? __fput+0x2d0/0x2f4
    [   76.040000] [<(ptrval)>] ? do_sys_openat2+0xd8/0x134
    [   76.040000] [<(ptrval)>] ? task_work_run+0xbc/0xf4
    [   76.040000] [<(ptrval)>] ? do_work_pending+0x60/0x12c
    [   76.040000] [<(ptrval)>] sys_reboot+0x14/0x24
    [   76.040000] [<(ptrval)>] ? _syscall_return+0x0/0x4


-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
