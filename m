Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACE8C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+xcLQGOawoLPyb3nturbdOlHAAi14DXqtTeCF2Qu70=; b=zMgpLPDDvs2ymC
	Rj1d33eskjAh882Y3lRJtNwRzTltU2YiG94NB0V8GGln+fbK1i1ARIPma65szQnAiBZjicc+sECj4
	PnwuJO73YHVqzEWhXhy0UmRxXtUHBsjdJT9hb0Fp+ic79w1hLLvR+d4XtRjm0QRNvUqfUdJxK6wNe
	TjzSfUbUIKnELS8Fk+cdp/JQ/UkW8zqHn/aH5czp4mVYbVpB6kFQjmyNGaAq7bN3s5eaqSbSSMHfh
	ba2KlQIdZTk+B3dHDTMF80R2z2H1VubL8cjKew3GD6EHxQLigfHMIk5NI8Nf8lpOVoxredlKhG1mt
	jkPcGi2QQjEfOxuC+Cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz0tt-007xnF-O1; Sat, 26 Nov 2022 19:31:45 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz0tq-007xmd-6W
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 19:31:44 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A99B13F1C3
	for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 19:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669491099;
	bh=2zpd7a1SGgeohkv0SUw3EJvuZe2S1i4FaVDUMzJj/io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=J88nwb7a/P1GFVXWER/ZtvF2btRh0myQcnR3nLg80g3QgCCgR8Asu8aa+vJeiwUpO
	 pDnwEd7FS7EndgbmAd1xtZwict/G1TxFUdFDpOGlukbmerwehVvbQRws0EBGxE39s8
	 pcO4vikWHuxHQkR0GUwWZPyiJqY6/I6RJ6VL6ScQXT6SRGCyLqVKO8FyifkR2TL4b7
	 1Bav5OVK/m1s4FTk+aatU22jdqEnRsemANYhUWW6QbC9jN2Pg+S9tRSQTD4KCbGiS3
	 YdWJ2KZKl59YZdqI1iRM6xn8YZoQ9/c6ijS/2YZeBX/CgdW5KbpAu+ok2FGE4DZmNM
	 ISQ5xMv7UK1Zg==
Received: by mail-ej1-f72.google.com with SMTP id hb35-20020a170907162300b007ae6746f240so2902309ejc.12
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 11:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zpd7a1SGgeohkv0SUw3EJvuZe2S1i4FaVDUMzJj/io=;
        b=wwnbhvLzDUIk1VcENqhV2ojFzX6DywU7QqUE7bW1+HSC3mhPzAEsCz8cVjVY6Wtoj2
         8jIDTaxr3KVncWepRUnNw03fKwbrw4q2fWKaem/YA85KEcMCZT4AHalhTi0HFC3bdSxo
         nN57kliSJZz3kZDNPzQoFISoyKKkDssZ+7zGnvJlVsqBO7ByyRKDa9bxHDDO93DH37KA
         qTFmMGu6GbWU5PulG3vT0XMNxUVousrNVLl673TvXFNP/kWt8oSySd0xLrdO6Cdu5MEa
         JeU4VuLdCr2QWjcGLraEWNOG5pexK5tVtUiQp+rxQMkfJy36u7o+AJhpfHhIM2VQt6nR
         IASw==
X-Gm-Message-State: ANoB5pmpLnrrIqQ3tL+XFci/ugorvBFv7RNvY5oLq3XRR168t1zdZ/vb
	sQm/XrWLfE84+tXst67CZu1hsCKaf3MB1fgay4N4Dv83hjDwavQ6lSISR0mN5VEKAmDld5cHOAY
	acMgN9n4a1id8vgFvQcP34XIEAKTCrEWmacPfTBKbTR+3Zw==
X-Received: by 2002:a17:906:3914:b0:7b2:7e90:53e4 with SMTP id f20-20020a170906391400b007b27e9053e4mr19225626eje.645.1669491098130;
        Sat, 26 Nov 2022 11:31:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+ar2joRyP4lT0A8Cnz1ZF3qCGAADOB6leDxvYPArumSpvtwvdGHBuZ/LUNr/tP2A+qq4DVg==
X-Received: by 2002:a17:906:3914:b0:7b2:7e90:53e4 with SMTP id f20-20020a170906391400b007b27e9053e4mr19225604eje.645.1669491097766;
        Sat, 26 Nov 2022 11:31:37 -0800 (PST)
Received: from localhost ([95.236.177.174])
        by smtp.gmail.com with ESMTPSA id n3-20020a056402514300b0045d59e49acbsm3333844edd.7.2022.11.26.11.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 11:31:37 -0800 (PST)
Date: Sat, 26 Nov 2022 20:31:36 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: increase boot command line size to 1K
Message-ID: <Y4JpmEoKOBIbaVLi@righiandr-XPS-13-7390>
References: <20221125133713.314796-1-andrea.righi@canonical.com>
 <Y4Je7chN+fQM3NpP@spud>
 <Y4Jmk74enBTwkNcR@righiandr-XPS-13-7390>
 <Y4JoDSXOLepJX8mI@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4JoDSXOLepJX8mI@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_113142_633581_332527EF 
X-CRM114-Status: GOOD (  28.02  )
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

On Sat, Nov 26, 2022 at 07:25:01PM +0000, Conor Dooley wrote:
> On Sat, Nov 26, 2022 at 08:18:43PM +0100, Andrea Righi wrote:
> > On Sat, Nov 26, 2022 at 06:46:05PM +0000, Conor Dooley wrote:
> > > Hey Andrea,
> > > 
> > > On Fri, Nov 25, 2022 at 02:37:13PM +0100, Andrea Righi wrote:
> > > > Kernel parameters string is limited to 512 characters on riscv (using
> > > > the default from include/uapi/asm-generic/setup.h).
> > > > 
> > > > In some testing environments (e.g., qemu with long kernel parameters
> > > > string) we may exceed this limit, triggering errors like the following:
> > > > 
> > > > [    3.331893] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
> > > > [    3.332625] CPU: 2 PID: 1 Comm: sh Not tainted 6.1.0-rc6-kc #1
> > > > [    3.333233] Hardware name: riscv-virtio,qemu (DT)
> > > > [    3.333550] Call Trace:
> > > > [    3.333736] [<ffffffff800062b6>] dump_backtrace+0x1c/0x24
> > > > [    3.334053] [<ffffffff806e8f54>] show_stack+0x2c/0x38
> > > > [    3.334260] [<ffffffff806f2d06>] dump_stack_lvl+0x5a/0x7c
> > > > [    3.334483] [<ffffffff806f2d3c>] dump_stack+0x14/0x1c
> > > > [    3.334687] [<ffffffff806e92fa>] panic+0x116/0x2d0
> > > > [    3.334878] [<ffffffff8001b0aa>] do_exit+0x80a/0x810
> > > > [    3.335079] [<ffffffff8001b1d0>] do_group_exit+0x24/0x70
> > > > [    3.335287] [<ffffffff8001b234>] __wake_up_parent+0x0/0x20
> > > > [    3.335502] [<ffffffff80003cee>] ret_from_syscall+0x0/0x2
> > > > [    3.335857] SMP: stopping secondary CPUs
> > > > [    3.337561] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
> > > > 
> > > > It seems reasonable enough to increase the default command line size to
> > > > 1024, like arm, to prevent issues like the one reported above.
> > > 
> > > error: arch/riscv/include/uapi/asm/setup.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
> > > 
> > > Unfortunately this does not build :/
> > > 
> > > Thanks,
> > > Conor.
> > 
> > Oh I see, because it's uapi it needs "WITH Linux-syscall-note",
> > wondering why I can't reproduce this failure...
> 
> tuxmake --wrapper ccache --target-arch riscv --directory . \
> 	--environment=KBUILD_BUILD_TIMESTAMP=@1621270510 \
> 	--environment=KBUILD_BUILD_USER=tuxmake --environment=KBUILD_BUILD_HOST=tuxmake \
> 	-o $tmpdir --toolchain llvm -z none -k rv32_defconfig
> 
> (copy paste from a script)
> That's what caught it initially & I think should be reproduce able. My
> own standard build script also runs all of the HDRINST stuff if they've
> changed since the last time a given toolchain was used so it reproduces
> locally for me too.

Ah! I'm pretty sure it's HDRINST, I'm just doing make, cross-compiling
the kernel, and running it directly from the build directory with a
custom script (that is basically a wrapper to qemu), so I don't need to
actually install anything. That's why I didn't catch the error.

Thanks for sharing that, I'll make sure to test also a proper install
next time. :)

-Andrea

> 
> > Anyway, as pointed out by Alexandre, there was already a previous
> > discussion about this topic:
> > https://lore.kernel.org/lkml/CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com/T/
> > 
> > Hopefully this change will be addressed there (and the patch land in
> > -next at least), otherwise I'll post a v2.
> 
> Yup, I noticed that thread - in fact I was going to link it yesterday
> before I saw Alex already had ;)
> 
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
