Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD90C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 12:05:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE7A20772
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 12:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OfHYCJnC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Onob5Wmp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE7A20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O3AsTA0K54Ju0c8kTYbW33sL9eE133S0LLq34pc+ZnY=; b=OfHYCJnC0je0P5JGVhymzt75C
	epoDEBi9rFgrF5kNY751O8rN36eIiQzvK68yp71qrT1DeR0tvLMXTjvycfymaLAY/WFbXdhyWhm26
	d4MVbph1YwH/+ngmRDKgkZIlg085viBr0ssDMEqz8jUD5dMu6AzQ1Z/gOFmQejkndB3E5+QHrAWqa
	4+m6B+lSoEDklRmMAGVTca78zR1IG+vM1kQrAFn9X/vxsnPkPt1YnSpNetnDoiy5OQmKtz0WT1j4l
	2auDDnvA85m9bo/OZ1JANdvyvolOS/s/MTOXShYhcBbQHCT2TZ5CVbo9puMYxX7IGZvCAGVcGvJkE
	6u3DE0R5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqbU3-0000jD-U4; Wed, 01 Jul 2020 12:04:59 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqbU2-0000iZ-0Z
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 12:04:59 +0000
Received: by mail-lj1-x243.google.com with SMTP id h22so19429735lji.9
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KtFCvnxd8+MpkqvG/G0MfW/SUz0N2SJcBbp7x7t75n8=;
 b=Onob5WmplFPUsKQI0wn73HNLQ0LY7thehXrZ/m9pR2hxOikKPdE8M1651/4TSx2eXJ
 BeTrJmrWhOVIvZ0RtCio5R6DQ9SHRIXu4kIVGeRjXBhkbFTzASqqLrbqDqVH1mcbWamN
 21/zeQRrUCdLi7AxYAvN0/m0jUYKNvRIuj1JKJIsoa2hXGCFBI95/IcyGwgHBCdrynwY
 zVKSRVT9RbEXVkoppKp0DbX7YlKhGvKyPSnVeeYKCdTA6fjJBkImEHfQbhBDf09tqCuo
 E8nNxYx/vCNCwRMOO6lmjEnBSI9GpE7CnNZbSfLkz/C3zt7Gst7He5RJiWjfuNM0UEbJ
 b6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtFCvnxd8+MpkqvG/G0MfW/SUz0N2SJcBbp7x7t75n8=;
 b=MrSFYvFSopoVkx/TvcpSFOsVNDSm9ZZ7gvZNgB+4MKivKevYD7noT3TipLF+1JOsVr
 UmrI7FoKH3xNJEWi989xoC5sEqk+JRMQULk9ALuXy5QTdpJzbPe1DTVRjY/NGkdwovPN
 aH6rVDEX0fQJN8nhx5pP7PxxvnUv2jeSN05Gqy0DAtrbyCA0LdjUNtAsvHMVzpvrGa3q
 fmT2rtju9uur4EDNU1Mb/VX3UNvzWL4ttAj9trwLp5lrlrqWRYYmkNWJs2x7RHf7x1cI
 tJpt8cwGSCTyKcdh1HVMZIbt0t6w82rJulAFm0woOykVHHrqYeb98dbn3a2n7VbChPon
 RIIQ==
X-Gm-Message-State: AOAM530v3GFDOGH7WBBRJKhBCXo/vDwXzDdm5/umM0rkSVk1KyvBMvXf
 YTNXDmVYKvQFl68ggQ1bJyrTXdQjD3Qn0p4cqhY=
X-Google-Smtp-Source: ABdhPJyijceoihyWUqbiQs9NUtgmqUMLWefCmn9+XrYOy/yNV3noR3SiGnhZMi+GaXtyOKILyYCqMIWD5P9V2k854ow=
X-Received: by 2002:a2e:161a:: with SMTP id w26mr13164469ljd.216.1593605096394; 
 Wed, 01 Jul 2020 05:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
 <mvmftabiklh.fsf@suse.de>
In-Reply-To: <mvmftabiklh.fsf@suse.de>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 1 Jul 2020 15:04:19 +0300
Message-ID: <CAEn-LTqMAf8vaaMhkX7h7+iY8U8v6JTSpW1FMj+JDr7PaWx1zw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Dynamic CPU frequency switching for the HiFive
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_080458_104295_19F8192D 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Anup Patel <anup@brainfault.org>,
 lollivier@baylibre.com,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 green.wan@sifive.com, Atish Patra <atish.patra@wdc.com>,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, deepa.kernel@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 1, 2020 at 1:41 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jun 16 2020, Yash Shah wrote:
>
> > The patch series adds the support for dynamic CPU frequency switching
> > for FU540-C000 SoC on the HiFive Unleashed board. All the patches are
> > based on Paul Walmsley's work.
> >
> > This series is based on Linux v5.7 and tested on HiFive unleashed board.
>
> I'm using that patch with 5.7.5.
>
> It appears to interfer with serial output when using the ondemand
> governor.

I do recall that userspace governor is the only one supported but this
might have changed before this patch was posted.

Yash, do you have more details?

>
> I also see soft lockups when using the performance governor:
>
> [  101.587527] rcu: INFO: rcu_sched self-detected stall on CPU
> [  101.592322] rcu:     0-...!: (932 ticks this GP) idle=11a/1/0x4000000000000004 softirq=4301/4301 fqs=4
> [  101.601432]  (t=6001 jiffies g=4017 q=859)
> [  101.605514] rcu: rcu_sched kthread starved for 5984 jiffies! g4017 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=2
> [  101.615494] rcu: RCU grace-period kthread stack dump:
> [  101.620530] rcu_sched       R  running task        0    10      2 0x00000000
> [  101.627560] Call Trace:
> [  101.630004] [<ffffffe00085a7e2>] __schedule+0x25c/0x616
> [  101.635205] [<ffffffe00085abde>] schedule+0x42/0xb2
> [  101.640070] [<ffffffe00085d0ba>] schedule_timeout+0x56/0xb8
> [  101.645626] [<ffffffe000263c34>] rcu_gp_fqs_loop+0x208/0x248
> [  101.651266] [<ffffffe0002666de>] rcu_gp_kthread+0xc2/0xcc
> [  101.656651] [<ffffffe00022654e>] kthread+0xda/0xec
> [  101.661426] [<ffffffe00020140a>] ret_from_exception+0x0/0xc
> [  101.666977] Task dump for CPU 0:
> [  101.670187] loop0           R  running task        0   655      2 0x00000008
> [  101.677218] Call Trace:
> [  101.679657] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa
> [  101.685036] [<ffffffe000202b76>] show_stack+0x2a/0x34
> [  101.690074] [<ffffffe0002319b0>] sched_show_task.part.0+0xc2/0xd2
> [  101.696154] [<ffffffe00022bb9c>] sched_show_task+0x64/0x66
> [  101.701618] [<ffffffe000231afe>] dump_cpu_task+0x3e/0x48
> [  101.706916] [<ffffffe000267762>] rcu_dump_cpu_stacks+0x94/0xce
> [  101.712731] [<ffffffe0002631f6>] print_cpu_stall+0x116/0x18a
> [  101.718375] [<ffffffe000264a46>] check_cpu_stall+0xcc/0x1a2
> [  101.723929] [<ffffffe000264b52>] rcu_pending.constprop.0+0x36/0xaa
> [  101.730094] [<ffffffe000266ab2>] rcu_sched_clock_irq+0xa6/0xea
> [  101.735913] [<ffffffe00026d1be>] update_process_times+0x1e/0x42
> [  101.741821] [<ffffffe0002793bc>] tick_sched_handle+0x26/0x52
> [  101.747456] [<ffffffe0002798fe>] tick_sched_timer+0x6a/0xd0
> [  101.753015] [<ffffffe00026d9be>] __run_hrtimer.constprop.0+0x50/0xe8
> [  101.759353] [<ffffffe00026da9e>] __hrtimer_run_queues+0x48/0x6c
> [  101.765254] [<ffffffe00026e410>] hrtimer_interrupt+0xca/0x1d4
> [  101.770985] [<ffffffe0006ceef8>] riscv_timer_interrupt+0x32/0x3a
> [  101.776976] [<ffffffe00085e17c>] do_IRQ+0xa4/0xb8
> [  101.781663] [<ffffffe00020140a>] ret_from_exception+0x0/0xc
>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
