Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C05C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXlHb5dpnuGVSkfcQmFFNuC0aAQVpHrVJTEarAaP0hs=; b=Ya4dUPMwB4Mxtv
	da+3agaZM9AfQk82KnjmczTLYT6ikH/ukYEI37/R3xH7nrrU3XThKThvWIarY5xbuB1eg3bpDJBFU
	/aiH3npISIbtybQIyQqMNBi0tHMUTMuGJef920C6+4XLL1feMXIg7S2EpuvmY6vxGYf+nhc+AJ/hq
	Vy1SCEfIcYhPkBtPSqfmi0VnQkB+31pmVm826VQiWWzdiqtNMjNyTUV2MqMTyG8UiGKXIaihVGiMv
	BI4HJOftcDoUb4BYe51sU+mIR5ADwNc5yXeWo6Muyfc82BWlTmeGdfk5sxAutSea3G9CDFNlTYZMM
	OxRERpnITlfkKNd/8B8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrDU-00Cu7p-Jr; Wed, 22 Feb 2023 15:39:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrDS-00Cu6U-1L
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:39:35 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pUrD5-0004TQ-S8; Wed, 22 Feb 2023 16:39:11 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guenter Roeck <linux@roeck-us.net>, Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com,
 Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
Date: Wed, 22 Feb 2023 16:39:11 +0100
Message-ID: <3212670.oiGErgHkdL@diego>
In-Reply-To: <20230222153125.72hugojgwweqkzdy@orel>
References:  <20230212194735.491785-1-conor@kernel.org>
 <20230222142743.a36qt4lgfq6zwd3c@orel> <20230222153125.72hugojgwweqkzdy@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_073934_099755_1A8D98BE 
X-CRM114-Status: GOOD (  35.74  )
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

Am Mittwoch, 22. Februar 2023, 16:31:25 CET schrieb Andrew Jones:
> On Wed, Feb 22, 2023 at 03:27:43PM +0100, Andrew Jones wrote:
> > On Thu, Feb 16, 2023 at 07:33:55AM -0800, Guenter Roeck wrote:
> > > On 2/15/23 14:00, Heiko St=FCbner wrote:
> > > [ ... ]
> > > > =

> > > > So now I've also tested Palmer's for-next at
> > > >    commit ec6311919ea6 ("Merge patch series "riscv: Optimize functi=
on trace"")
> > > > =

> > > > again with the same variants
> > > > - qemu-riscv32 without zbb
> > > > - qemu-riscv32 with zbb
> > > > - qemu-riscv64 without zbb
> > > > - qemu-riscv64 with zbb
> > > > =

> > > > And all of them booted fine into a nfs-root (debian for riscv64 and=
 a
> > > > buildroot for riscv32).
> > > > =

> > > > I even forced a bug into the zbb code to make sure the patching wor=
ked
> > > > correctly (where the kernel failed as expected).
> > > > =

> > > > Qemu-version for me was 7.2.50 (v7.2.0-744-g5a3633929a-dirty)
> > > > =

> > > > I did try the one from Debian-stable (qemu-5.2) but that was too ol=
d and
> > > > didn't support Zbb yet.
> > > > =

> > > > One thing of note, the "active" 32bit config I had, somehow didn't =
produce
> > > > working images and I needed to start a new build using the rv32_def=
config.
> > > > =

> > > > So right now, I'm not sure what more to test though.
> > > > =

> > > =

> > > Another example:
> > > =

> > > - build defconfig
> > > - run
> > >   qemu-system-riscv64 -M virt -m 512M -no-reboot -kernel arch/riscv/b=
oot/Image \
> > >     -snapshot -device virtio-blk-device,drive=3Dd0 -drive file=3Droot=
fs.ext2,if=3Dnone,id=3Dd0,format=3Draw \
> > >     -append "root=3D/dev/vda console=3DttyS0,115200 earlycon=3Duart82=
50,mmio,0x10000000,115200" \
> > >     -nographic -monitor none
> > > =

> > > With CONFIG_RISCV_ISA_ZBB=3Dy, that results in
> > > =

> > > [    0.818263] /dev/root: Can't open blockdev
> > > [    0.818856] VFS: Cannot open root device "/dev/vda" or unknown-blo=
ck(0,0): error -6
> > > [    0.819177] Please append a correct "root=3D" boot option; here ar=
e the available partitions:
> > > [    0.819808] fe00           16384 vda
> > > [    0.819944]  driver: virtio_blk
> > > [    0.820534] Kernel panic - not syncing: VFS: Unable to mount root =
fs on unknown-block(0,0)
> > > [    0.821101] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc8-ne=
xt-20230216-00002-g80332825e240 #4
> > > [    0.821672] Hardware name: riscv-virtio,qemu (DT)
> > > [    0.822050] Call Trace:
> > > [    0.822427] [<ffffffff800053e4>] dump_backtrace+0x1c/0x24
> > > [    0.822834] [<ffffffff807f90e4>] show_stack+0x2c/0x38
> > > [    0.823085] [<ffffffff80803aea>] dump_stack_lvl+0x3c/0x54
> > > [    0.823351] [<ffffffff80803b16>] dump_stack+0x14/0x1c
> > > [    0.823601] [<ffffffff807f944c>] panic+0x102/0x29e
> > > [    0.823834] [<ffffffff80a015e2>] mount_block_root+0x18c/0x23e
> > > [    0.824148] [<ffffffff80a0187c>] mount_root+0x1e8/0x218
> > > [    0.824398] [<ffffffff80a019ee>] prepare_namespace+0x142/0x184
> > > [    0.824655] [<ffffffff80a01182>] kernel_init_freeable+0x236/0x25a
> > > [    0.824934] [<ffffffff80804602>] kernel_init+0x1e/0x10a
> > > [    0.825201] [<ffffffff80003560>] ret_from_exception+0x0/0x16
> > > [    0.826180] ---[ end Kernel panic - not syncing: VFS: Unable to mo=
unt root fs on unknown-block(0,0) ]---
> > > =

> > > This works fine if CONFIG_RISCV_ISA_ZBB is not enabled.
> > > =

> > > Tested with gcc 11.3, binutils 2.39, qemu v7.2.0 and qemu built from =
mainline.
> > >
> > =

> > Just to +1 this, I get the same result (unable to mount root fs) with
> > =

> > $QEMU -cpu rv64,zbb=3Don \
> >         -nographic \
> >         -machine virt \
> >         -kernel $KERNEL \
> >         -append 'root=3D/dev/vda console=3DttyS0' \
> >         -drive file=3Ddisk.ext4,format=3Draw,id=3Dhd0 \
> >         -device virtio-blk-pci,drive=3Dhd0
> > =

> > kernel:   latest riscv-linux/for-next (8658db0a4a0f), defconfig
> > gcc:      riscv-gnu-toolchain (12.1.0)
> > binutils: riscv-gnu-toolchain (2.39)
> > qemu:     latest master (79b677d658d3)
> > =

> > Flipping the QEMU cpu zbb property off allows boot to succeed, i.e. it's
> > not necessary to compile out the CONFIG_RISCV_ISA_ZBB code from the
> > kernel, it's just necessary to avoid using it.
> >
> =

> Looks like something in the strncmp implementation. Only commenting it
> out allows boot to succeed.

and interestingly it seems to be something very specific. I.e. my setup is
nfsroot-based (qemu is "just" another board in my boardfarm) and booting
into an nfs-root works quite nicely.

I guess I need to look into how to get an actual disk-image in there.


> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index ee49595075be..0bf03abe1ced 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -9,7 +9,7 @@
>  /* int strncmp(const char *cs, const char *ct, size_t count) */
>  SYM_FUNC_START(strncmp)
> =

> -       ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_=
RISCV_ISA_ZBB)
> +//     ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_=
RISCV_ISA_ZBB)
> =

>         /*
>          * Returns
> =

> =

> Thanks,
> drew
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
