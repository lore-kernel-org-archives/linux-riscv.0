Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CF9C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Z/ZN+cw6JXQdr+Mze4V3igjzMGK712GB7k8NdDMef4=; b=kjllrKG1XKeV7O
	KNHYcTC1oEtmrRkV35MMaL0Gp7a++9RKcH6bdj882JABtqrGhm4nz8Z1TujHvkgsuCmpkaGYNB633
	WneVjlMcuCEDNJtXqOX4wW3NVcCp4yWRrELn4ovO0M3ApA4hupfFlyup6+jTXvdE2vyvcLVqBjl+d
	LUecFaS+TEChbqK3/VOvUzz+THVFT1IgAuqoDdw1QeZXzanUk+WSNaxL5F0ThN8NmKHDtXzl0ngGp
	ING1rCdrnqth5/sedHfNtntO9s1ZFzeaoZ8tghPSMsAzkOHo+uCrq7HRcxQKQOkFBqZK/B970PnZN
	TH078VeFJy3SyTqw4zkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUq65-00Cg8Q-Js; Wed, 22 Feb 2023 14:27:53 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUq62-00Cg7E-Iq
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 14:27:52 +0000
Received: by mail-ed1-x529.google.com with SMTP id ee7so16035519edb.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 06:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSTo+Q7JIlqLKxLPKCXgDp2nt02Z2fkT3JU1WSwd++0=;
        b=pnbYKGMO6tzAbQifGNYCklWVJWTlcxYPT+dtCHM20DliC1N2jA68LpaCwYKpdHyYf2
         Zizf5g4orcwgRJ7WDP1UxfpsvJNl6ubR+f5KGCYP5ogfRiUeRxdwJSH8XZXeqGjl1vzn
         /bdu3WUcuKfzMWxHUmpHb1zzYe9tzxU9Tk7CXuNcga82MP/ssNYpNBKIYy5KczOxgPyw
         7V/HTyknx3sAy9Bbotn+xXCznLm3Z71yRQJC6138S1+6R2L0wvGmaFMGxUsqW4LZUiYk
         DK5Gawktf+aBIYpZWN9LwL0rtNMJRZgZL2CkFD2gQT5BK7clQmTy8gg7/6uA/i1HB3Cc
         bYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSTo+Q7JIlqLKxLPKCXgDp2nt02Z2fkT3JU1WSwd++0=;
        b=dr2LuDkjY9gv5u/2BrnVrCJ1h0l5C+CwlIf6R1WUVa5yq1MlW9MFTfbrpKRCbINSHC
         4iKDzHli+rQLGu8RbKLzQKZStcCEHhDa2lTd8uVPCWaiFcGiISB8qlwXSoccfKLGhIq+
         3EXZSdGxTHeQ5o3gHt2aBKeBYGRXYuggsHpn1UiIFQTcExWU/scSgziUmrTm+uyV2MxF
         xGNIHZd3D9ktnYwIxi/psSosHzdn2yuvUj1QrmrAxOxGksZtTFQMJe5mAc23ynZ/ZMMN
         cynDfwJu8AhA0Eg6ZCQLp3wRYpuP5Q2dnRWKwc4drLpdySf8eJIiQliUqj55VbqCjdDt
         dDLQ==
X-Gm-Message-State: AO0yUKXvC7s4zPejGZSaBnyo1WPVsht4tQJpqkvYr4YszZgHLUuPJi5u
	2a1dWUoDhzs40O3gmatZqopIkQ==
X-Google-Smtp-Source: AK7set/xsjv90m0r+qLWiQJ9QUuzO6bs+FZmN2dyWTHXSlR/2/bU4BZVGDLWu8Lp8OnY+ECSdWuZBg==
X-Received: by 2002:aa7:c1cc:0:b0:4ad:7204:6968 with SMTP id d12-20020aa7c1cc000000b004ad72046968mr6494124edp.32.1677076065085;
        Wed, 22 Feb 2023 06:27:45 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b1-20020a50ccc1000000b004acc123cd94sm4150223edj.30.2023.02.22.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:27:44 -0800 (PST)
Date: Wed, 22 Feb 2023 15:27:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Conor Dooley <conor@kernel.org>, palmer@dabbelt.com,
	Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
Message-ID: <20230222142743.a36qt4lgfq6zwd3c@orel>
References: <20230212194735.491785-1-conor@kernel.org>
 <Y+q8ZnZ2A8g7BNdS@spud>
 <1944134.usQuhbGJ8B@diego>
 <45316784.fMDQidcC6G@diego>
 <479cbefe-7b19-9d2d-4a3c-2bf25e479ce4@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <479cbefe-7b19-9d2d-4a3c-2bf25e479ce4@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_062750_651158_F26243C6 
X-CRM114-Status: GOOD (  23.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 16, 2023 at 07:33:55AM -0800, Guenter Roeck wrote:
> On 2/15/23 14:00, Heiko St=FCbner wrote:
> [ ... ]
> > =

> > So now I've also tested Palmer's for-next at
> >    commit ec6311919ea6 ("Merge patch series "riscv: Optimize function t=
race"")
> > =

> > again with the same variants
> > - qemu-riscv32 without zbb
> > - qemu-riscv32 with zbb
> > - qemu-riscv64 without zbb
> > - qemu-riscv64 with zbb
> > =

> > And all of them booted fine into a nfs-root (debian for riscv64 and a
> > buildroot for riscv32).
> > =

> > I even forced a bug into the zbb code to make sure the patching worked
> > correctly (where the kernel failed as expected).
> > =

> > Qemu-version for me was 7.2.50 (v7.2.0-744-g5a3633929a-dirty)
> > =

> > I did try the one from Debian-stable (qemu-5.2) but that was too old and
> > didn't support Zbb yet.
> > =

> > One thing of note, the "active" 32bit config I had, somehow didn't prod=
uce
> > working images and I needed to start a new build using the rv32_defconf=
ig.
> > =

> > So right now, I'm not sure what more to test though.
> > =

> =

> Another example:
> =

> - build defconfig
> - run
>   qemu-system-riscv64 -M virt -m 512M -no-reboot -kernel arch/riscv/boot/=
Image \
>     -snapshot -device virtio-blk-device,drive=3Dd0 -drive file=3Drootfs.e=
xt2,if=3Dnone,id=3Dd0,format=3Draw \
>     -append "root=3D/dev/vda console=3DttyS0,115200 earlycon=3Duart8250,m=
mio,0x10000000,115200" \
>     -nographic -monitor none
> =

> With CONFIG_RISCV_ISA_ZBB=3Dy, that results in
> =

> [    0.818263] /dev/root: Can't open blockdev
> [    0.818856] VFS: Cannot open root device "/dev/vda" or unknown-block(0=
,0): error -6
> [    0.819177] Please append a correct "root=3D" boot option; here are th=
e available partitions:
> [    0.819808] fe00           16384 vda
> [    0.819944]  driver: virtio_blk
> [    0.820534] Kernel panic - not syncing: VFS: Unable to mount root fs o=
n unknown-block(0,0)
> [    0.821101] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc8-next-2=
0230216-00002-g80332825e240 #4
> [    0.821672] Hardware name: riscv-virtio,qemu (DT)
> [    0.822050] Call Trace:
> [    0.822427] [<ffffffff800053e4>] dump_backtrace+0x1c/0x24
> [    0.822834] [<ffffffff807f90e4>] show_stack+0x2c/0x38
> [    0.823085] [<ffffffff80803aea>] dump_stack_lvl+0x3c/0x54
> [    0.823351] [<ffffffff80803b16>] dump_stack+0x14/0x1c
> [    0.823601] [<ffffffff807f944c>] panic+0x102/0x29e
> [    0.823834] [<ffffffff80a015e2>] mount_block_root+0x18c/0x23e
> [    0.824148] [<ffffffff80a0187c>] mount_root+0x1e8/0x218
> [    0.824398] [<ffffffff80a019ee>] prepare_namespace+0x142/0x184
> [    0.824655] [<ffffffff80a01182>] kernel_init_freeable+0x236/0x25a
> [    0.824934] [<ffffffff80804602>] kernel_init+0x1e/0x10a
> [    0.825201] [<ffffffff80003560>] ret_from_exception+0x0/0x16
> [    0.826180] ---[ end Kernel panic - not syncing: VFS: Unable to mount =
root fs on unknown-block(0,0) ]---
> =

> This works fine if CONFIG_RISCV_ISA_ZBB is not enabled.
> =

> Tested with gcc 11.3, binutils 2.39, qemu v7.2.0 and qemu built from main=
line.
>

Just to +1 this, I get the same result (unable to mount root fs) with

$QEMU -cpu rv64,zbb=3Don \
        -nographic \
        -machine virt \
        -kernel $KERNEL \
        -append 'root=3D/dev/vda console=3DttyS0' \
        -drive file=3Ddisk.ext4,format=3Draw,id=3Dhd0 \
        -device virtio-blk-pci,drive=3Dhd0

kernel:   latest riscv-linux/for-next (8658db0a4a0f), defconfig
gcc:      riscv-gnu-toolchain (12.1.0)
binutils: riscv-gnu-toolchain (2.39)
qemu:     latest master (79b677d658d3)

Flipping the QEMU cpu zbb property off allows boot to succeed, i.e. it's
not necessary to compile out the CONFIG_RISCV_ISA_ZBB code from the
kernel, it's just necessary to avoid using it.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
