Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F41C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 07:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1zBYWotCjX4ArqlhLcwASqp45U37szjIZhB2FS1vms=; b=rZKUyrRatx/AkL
	KaKvZWRdyqDd5fZ9JiaHU++CZHr9zXmHz0gYJUbL/CHbC9sz6ynA6HOL0ZjncRI9MWKaDe/ggIZ2U
	lQEbYXTZEVhPl8ZOIrNVZK/qZ9fQBQduJM2fzh8iw1buajELru8iiGpVgnO9/etCxz0Z94XmhkJAc
	FGztqyQqWZe9d1tHNahwlcuxfzdhHYbFlS86L2jongh94NMHK+k1OAa5KQREUVTE5if5BB/xlfemS
	QwLbPnEksDn8/7I1F8VPhEjJwIAyVGdt9zsnreI8Pht8ON31HIdfeQ5blZyS+ZQ/Qq3fXjmAOtTrN
	oNemRZmN3IyC0s/BKRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSB8s-00FNtO-2i;
	Tue, 23 Jan 2024 07:24:18 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSB8p-00FNsN-1o
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 07:24:17 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5cf450eba00so3300405a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 23:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705994652; x=1706599452; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+bZRTLUDZoJ2eqVY8R6JDBRomIID8vEH2x+iQzxMJbE=;
        b=ZZE7adx0qnlDdTLmnerny6jYhPan9q0rz5/wx1doywDR61R8JmbRjvRFlLphn1HoXq
         zRyAt4T9DkAeHXMjJpW4QkTCvJKz/HGLZ++6G/XkDR+dIPzqFj04Vwa8ioKIHE+BVkm3
         8X0cr3yn8bzj2RVRf81vR2VoNPOZnKIYTWyg09it2bEbt4aMQ71/0aTC47eTiwt5FCzn
         RsUdeMACrydT0TDWvEbSOxg8+OABGRmOAbbQKpljG/KA0SD1DNNiEhcM1chb9oakZuYc
         AqiJfjF3S8tHCmWlc3h/61y6dqXWI1wnVjf1yodlQu7ovYb2D5ix3PV1IMPXALR+joRK
         3ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705994652; x=1706599452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bZRTLUDZoJ2eqVY8R6JDBRomIID8vEH2x+iQzxMJbE=;
        b=j+58WnpMK3Zb+TSeNjdZVMmeSJ2cYbJIQr9+vvSoFbv4G7lw0q4olAWMHkSLUMqfo5
         Dm8Dmny+ZXh1kWTsN3epDGuK74N1NY3rYjLujVebOh4BG3luHIl7L/QpbCy2eoshadKP
         a/NEm5q4wJwav7z5eNrJVtyRdoLf8TRr47fJbFXxIFU25lh9E5GD/WO7dA0IRb2otyb4
         YhMkKEJzuE4YO7UYMpxd73Lcxp/Ckbk9wdkIk3zfYLf8K0DSvQY5DpVnhKwq+J+ZQzcu
         7uvZD6MjY7xHa+ui8azoOqyOW97jEtWm4w8aW6KA1k/eDia4bc7SMwTvzYjCpHKeYoUV
         /VTQ==
X-Gm-Message-State: AOJu0YxiuGDkhLtcLKsOVhxbtIJUcs0GZQ5f+BP447G1OBEO5TlVFLx1
	2q06YCyDsH6TjM8gYs3Aac/Xwr3gQfaZbuB66Y+B0E4Rylbsfh4YIQURwToWjMpjYualAe5FtYd
	4UT0G9/PAtprfE6ZORomHRTGCSgpgENZ5neQZZQ==
X-Google-Smtp-Source: AGHT+IHVmiMt82VatuhVofaY5FVFMvPoCE3YYBhgAKdfsgL6rSGLizm5EKfBXLxrimqyx8IzR9Zonlh+yb1EWL31x7I=
X-Received: by 2002:a05:6a20:7d86:b0:19c:2f49:96d with SMTP id
 v6-20020a056a207d8600b0019c2f49096dmr4488224pzj.64.1705994651992; Mon, 22 Jan
 2024 23:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
 <20231211104855.558096-4-vincent.guittot@linaro.org> <Za8cjQXptttuyb6c@finisterre.sirena.org.uk>
In-Reply-To: <Za8cjQXptttuyb6c@finisterre.sirena.org.uk>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 23 Jan 2024 08:24:00 +0100
Message-ID: <CAKfTPtAOJpr8VbXwSY_UMTf5Y2gEHAsobjHnJXqe1K1QDGygCA@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] cpufreq/schedutil: Use a fixed reference frequency
To: Mark Brown <broonie@kernel.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org, beata.michalska@arm.com, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_232415_667796_837AB7E7 
X-CRM114-Status: GOOD (  22.82  )
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

Hi Mark,

Could you tried this fix:
https://lore.kernel.org/lkml/20240117190545.596057-1-vincent.guittot@linaro.org/

Regards,
Vincent

On Tue, 23 Jan 2024 at 02:55, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Dec 11, 2023 at 11:48:51AM +0100, Vincent Guittot wrote:
> > cpuinfo.max_freq can change at runtime because of boost as an example. This
> > implies that the value could be different than the one that has been
> > used when computing the capacity of a CPU.
>
> So, this seems very weird but I just finished a bisection of a failure
> that showed up during the merge window with the DT kselftests on
> meson-gxl-s905x-libretech-cc (Libretech Le Potato) running an arm64
> defconfig.  Looking at the commit this seems like a very surprising
> false result but I verified that the commit before this one runs fine
> and reproduced the failure, the bisect does seem to converge well also
> so it appears like there's something going on.  Does this ring any bells
> for anyone?
>
> The test is timed out by the kselftest wrapper:
>
>    kselftest: Running tests in dt
>    TAP version 13
>    1..1
>    # timeout set to 45
>    # selftests: dt: test_unprobed_devices.sh
>    # TAP version 13
>    #
>    not ok 1 selftests: dt: test_unprobed_devices.sh # TIMEOUT 45 seconds
>
> with no obvious effect on the system, a successful run takes less than
> 20 seconds so it shouldn't be that the timing is marginal.  I'm guessing
> that reading the one of the files under /sys/devices hung.  No other
> boards in my lab are affected and I'm not immediately seeing anything
> remarkable about this board.  Full log from a bad run at:
>
>     https://lava.sirena.org.uk/scheduler/job/493329
>
> and a good run:
>
>     https://lava.sirena.org.uk/scheduler/job/492453
>
> Bisect log (the skipped commits didn't build):
>
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [4fbbed7872677b0a28ba8237169968171a61efbd] Merge tag 'timers-core-2024-01-21' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect bad 4fbbed7872677b0a28ba8237169968171a61efbd
> # status: waiting for good commit(s), bad commit known
> # good: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect good 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> # bad: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework listmount() implementation
> git bisect bad ba5afb9a84df2e6b26a1b6389b98849cd16ea757
> # bad: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
> git bisect bad de927f6c0b07d9e698416c5b287c521b07694cac
> # bad: [35f11a3710cdcbbc5090d14017a6295454e0cc73] Merge tag 'mtd/for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> git bisect bad 35f11a3710cdcbbc5090d14017a6295454e0cc73
> # bad: [d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9] Merge tag 'slab-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
> git bisect bad d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9
> # skip: [968b80332432172dbbb773e749a43bdc846d1a13] Merge tag 'powerpc-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
> git bisect skip 968b80332432172dbbb773e749a43bdc846d1a13
> # good: [372a34e66fb7f95124fadae9c600b231c35696a7] fs: replace f_rcuhead with f_task_work
> git bisect good 372a34e66fb7f95124fadae9c600b231c35696a7
> # good: [ae24db43b3b427eb290b58d55179c32f0a7539d1] powerpc/ftrace: Remove nops after the call to ftrace_stub
> git bisect good ae24db43b3b427eb290b58d55179c32f0a7539d1
> # skip: [3cf1d6a5fbf3f724d12b01635319924239d42c00] Merge tag 'm68k-for-v6.8-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
> git bisect skip 3cf1d6a5fbf3f724d12b01635319924239d42c00
> # good: [2a33e2ddc6ebf9b5468091aded8a38f57de9a580] splice: remove permission hook from do_splice_direct()
> git bisect good 2a33e2ddc6ebf9b5468091aded8a38f57de9a580
> # good: [9b7e9e2f5d5c3d079ec46bc71b114012e362ea6e] fs: factor out backing_file_splice_{read,write}() helpers
> git bisect good 9b7e9e2f5d5c3d079ec46bc71b114012e362ea6e
> # good: [12c1b632d970c0138b4c5c65a1065e7d0604d272] fs: reformat idmapped mounts entry
> git bisect good 12c1b632d970c0138b4c5c65a1065e7d0604d272
> # good: [d23627a7688fabff0096a7beaff1a93de76afaad] EDAC/igen6: Add Intel Raptor Lake-P SoCs support
> git bisect good d23627a7688fabff0096a7beaff1a93de76afaad
> # skip: [ab5f3fcb7c72094684760e0cd8954d8d570b5e83] Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> git bisect skip ab5f3fcb7c72094684760e0cd8954d8d570b5e83
> # good: [eb183b2cd0a6549992eca3c4ada0b1bc1d9340f5] Revert "perf/arm_dmc620: Remove duplicate format attribute #defines"
> git bisect good eb183b2cd0a6549992eca3c4ada0b1bc1d9340f5
> # good: [1ab33c03145d0f6c345823fc2da935d9a1a9e9fc] asm-generic: make sparse happy with odd-sized put_unaligned_*()
> git bisect good 1ab33c03145d0f6c345823fc2da935d9a1a9e9fc
> # good: [794c68b20408bb6899f90314e36e256924cc85a1] x86/CPU/AMD: Get rid of amd_erratum_1485[]
> git bisect good 794c68b20408bb6899f90314e36e256924cc85a1
> # bad: [11137d384996bb05cf33c8163db271e1bac3f4bf] sched/fair: Simplify util_est
> git bisect bad 11137d384996bb05cf33c8163db271e1bac3f4bf
> # good: [9c0b4bb7f6303c9c4e2e34984c46f5a86478f84d] sched/cpufreq: Rework schedutil governor performance estimation
> git bisect good 9c0b4bb7f6303c9c4e2e34984c46f5a86478f84d
> # good: [599457ba15403037b489fe536266a3d5f9efaed7] cpufreq: Use the fixed and coherent frequency for scaling capacity
> git bisect good 599457ba15403037b489fe536266a3d5f9efaed7
> # bad: [50b813b147e9eb6546a1fc49d4e703e6d23691f2] cpufreq/cppc: Move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}()
> git bisect bad 50b813b147e9eb6546a1fc49d4e703e6d23691f2
> # bad: [15cbbd1d317e07b4e5c6aca5d4c5579539a82784] energy_model: Use a fixed reference frequency
> git bisect bad 15cbbd1d317e07b4e5c6aca5d4c5579539a82784
> # bad: [b3edde44e5d4504c23a176819865cd603fd16d6c] cpufreq/schedutil: Use a fixed reference frequency
> git bisect bad b3edde44e5d4504c23a176819865cd603fd16d6c
> # first bad commit: [b3edde44e5d4504c23a176819865cd603fd16d6c] cpufreq/schedutil: Use a fixed reference frequency

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
