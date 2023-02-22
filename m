Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA8BC636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2Kh9t8Xd+8tBirdNrS3Cctqed4pb6zc7Jc7vvXUBrY=; b=gh9hNxk82yY9Ht
	c52lESx1833YBHercngWFEs8WYIAtUN6FMEhlXngNa8hUxyDwIu8K1LbTf7H+npgQPWh2wDBnVUF8
	V2sPHkFmrvdk127q6HYLSng4vQyPeXTfXGMhKfNhXJIKqXeleCtNsqb0ra6eCAMK3PKhH0TIZU/JD
	yf5Y6SBDkzVDwHq2PKzy7jI7zi8EBSYkoeGUhrPDnvIbZK/bydBtCoVtsKa3OxZB/e7Qn8KKQGmPU
	EUX74/rUXRdokqGFH7pznc74+CK2wq7OTM8XxgTndolKkG7YIXkQn4VlMsJ7CWFja9hWnFqpKp+GB
	5JTCukVhzjtW/4sgaX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsXW-00D8SS-9u; Wed, 22 Feb 2023 17:04:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsXT-00D8QN-50
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 17:04:20 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pUsX7-0005OU-02; Wed, 22 Feb 2023 18:03:57 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux@roeck-us.net, ajones@ventanamicro.com,
 Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 samuel@sholland.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
Date: Wed, 22 Feb 2023 18:03:55 +0100
Message-ID: <2186881.72vocr9iq0@diego>
In-Reply-To: <mhng-72b23626-1921-454b-bba8-aec29b32048d@palmer-ri-x1c9a>
References: <mhng-72b23626-1921-454b-bba8-aec29b32048d@palmer-ri-x1c9a>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_090419_210943_BE97C417 
X-CRM114-Status: GOOD (  37.88  )
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

Am Mittwoch, 22. Februar 2023, 17:47:10 CET schrieb Palmer Dabbelt:
> On Wed, 22 Feb 2023 07:39:11 PST (-0800), heiko@sntech.de wrote:
> > Am Mittwoch, 22. Februar 2023, 16:31:25 CET schrieb Andrew Jones:
> >> On Wed, Feb 22, 2023 at 03:27:43PM +0100, Andrew Jones wrote:
> >> > On Thu, Feb 16, 2023 at 07:33:55AM -0800, Guenter Roeck wrote:
> >> > > On 2/15/23 14:00, Heiko St=FCbner wrote:
> >> > > [ ... ]
> >> > > > =

> >> > > > So now I've also tested Palmer's for-next at
> >> > > >    commit ec6311919ea6 ("Merge patch series "riscv: Optimize fun=
ction trace"")
> >> > > > =

> >> > > > again with the same variants
> >> > > > - qemu-riscv32 without zbb
> >> > > > - qemu-riscv32 with zbb
> >> > > > - qemu-riscv64 without zbb
> >> > > > - qemu-riscv64 with zbb
> >> > > > =

> >> > > > And all of them booted fine into a nfs-root (debian for riscv64 =
and a
> >> > > > buildroot for riscv32).
> >> > > > =

> >> > > > I even forced a bug into the zbb code to make sure the patching =
worked
> >> > > > correctly (where the kernel failed as expected).
> >> > > > =

> >> > > > Qemu-version for me was 7.2.50 (v7.2.0-744-g5a3633929a-dirty)
> >> > > > =

> >> > > > I did try the one from Debian-stable (qemu-5.2) but that was too=
 old and
> >> > > > didn't support Zbb yet.
> >> > > > =

> >> > > > One thing of note, the "active" 32bit config I had, somehow didn=
't produce
> >> > > > working images and I needed to start a new build using the rv32_=
defconfig.
> >> > > > =

> >> > > > So right now, I'm not sure what more to test though.
> >> > > > =

> >> > > =

> >> > > Another example:
> >> > > =

> >> > > - build defconfig
> >> > > - run
> >> > >   qemu-system-riscv64 -M virt -m 512M -no-reboot -kernel arch/risc=
v/boot/Image \
> >> > >     -snapshot -device virtio-blk-device,drive=3Dd0 -drive file=3Dr=
ootfs.ext2,if=3Dnone,id=3Dd0,format=3Draw \
> >> > >     -append "root=3D/dev/vda console=3DttyS0,115200 earlycon=3Duar=
t8250,mmio,0x10000000,115200" \
> >> > >     -nographic -monitor none
> >> > > =

> >> > > With CONFIG_RISCV_ISA_ZBB=3Dy, that results in
> >> > > =

> >> > > [    0.818263] /dev/root: Can't open blockdev
> >> > > [    0.818856] VFS: Cannot open root device "/dev/vda" or unknown-=
block(0,0): error -6
> >> > > [    0.819177] Please append a correct "root=3D" boot option; here=
 are the available partitions:
> >> > > [    0.819808] fe00           16384 vda
> >> > > [    0.819944]  driver: virtio_blk
> >> > > [    0.820534] Kernel panic - not syncing: VFS: Unable to mount ro=
ot fs on unknown-block(0,0)
> >> > > [    0.821101] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc8=
-next-20230216-00002-g80332825e240 #4
> >> > > [    0.821672] Hardware name: riscv-virtio,qemu (DT)
> >> > > [    0.822050] Call Trace:
> >> > > [    0.822427] [<ffffffff800053e4>] dump_backtrace+0x1c/0x24
> >> > > [    0.822834] [<ffffffff807f90e4>] show_stack+0x2c/0x38
> >> > > [    0.823085] [<ffffffff80803aea>] dump_stack_lvl+0x3c/0x54
> >> > > [    0.823351] [<ffffffff80803b16>] dump_stack+0x14/0x1c
> >> > > [    0.823601] [<ffffffff807f944c>] panic+0x102/0x29e
> >> > > [    0.823834] [<ffffffff80a015e2>] mount_block_root+0x18c/0x23e
> >> > > [    0.824148] [<ffffffff80a0187c>] mount_root+0x1e8/0x218
> >> > > [    0.824398] [<ffffffff80a019ee>] prepare_namespace+0x142/0x184
> >> > > [    0.824655] [<ffffffff80a01182>] kernel_init_freeable+0x236/0x2=
5a
> >> > > [    0.824934] [<ffffffff80804602>] kernel_init+0x1e/0x10a
> >> > > [    0.825201] [<ffffffff80003560>] ret_from_exception+0x0/0x16
> >> > > [    0.826180] ---[ end Kernel panic - not syncing: VFS: Unable to=
 mount root fs on unknown-block(0,0) ]---
> >> > > =

> >> > > This works fine if CONFIG_RISCV_ISA_ZBB is not enabled.
> >> > > =

> >> > > Tested with gcc 11.3, binutils 2.39, qemu v7.2.0 and qemu built fr=
om mainline.
> >> > >
> >> > =

> >> > Just to +1 this, I get the same result (unable to mount root fs) with
> >> > =

> >> > $QEMU -cpu rv64,zbb=3Don \
> >> >         -nographic \
> >> >         -machine virt \
> >> >         -kernel $KERNEL \
> >> >         -append 'root=3D/dev/vda console=3DttyS0' \
> >> >         -drive file=3Ddisk.ext4,format=3Draw,id=3Dhd0 \
> >> >         -device virtio-blk-pci,drive=3Dhd0
> >> > =

> >> > kernel:   latest riscv-linux/for-next (8658db0a4a0f), defconfig
> >> > gcc:      riscv-gnu-toolchain (12.1.0)
> >> > binutils: riscv-gnu-toolchain (2.39)
> >> > qemu:     latest master (79b677d658d3)
> >> > =

> >> > Flipping the QEMU cpu zbb property off allows boot to succeed, i.e. =
it's
> >> > not necessary to compile out the CONFIG_RISCV_ISA_ZBB code from the
> >> > kernel, it's just necessary to avoid using it.
> >> >
> >> =

> >> Looks like something in the strncmp implementation. Only commenting it
> >> out allows boot to succeed.
> >
> > and interestingly it seems to be something very specific. I.e. my setup=
 is
> > nfsroot-based (qemu is "just" another board in my boardfarm) and booting
> > into an nfs-root works quite nicely.
> >
> > I guess I need to look into how to get an actual disk-image in there.
> =

> It looks like Drew isn't using an initrd (and with NFS, presumably you =

> are)?  That's probably a big difference as well.

There is no initrd involved in my qemu setup ;-) .
Just a kernel built from current for-next + defconfig and a nfs-server
holding a full Debian-riscv64 system.


The magic qemu incantation is also pretty standard:

/usr/local/bin/qemu-system-riscv64 -M virt -smp 2 -m 1G -display none \
 -cpu rv64,zbb=3Dtrue,zbc=3Dtrue,svpbmt=3Dtrue,Zicbom=3Dtrue,Zawrs=3Dtrue,s=
scofpmf=3Dtrue,v=3Dtrue \
 -serial telnet:localhost:5500,server,nowait -kernel /home/devel/nfs/kernel=
/riscv64/Image \
 -append earlycon=3Dsbi root=3D/dev/nfs nfsroot=3D10.0.2.2:/home/devel/nfs/=
rootfs-riscv64virt ip=3Ddhcp rw \
 -netdev user,id=3Dn1 -device virtio-net-pci,netdev=3Dn1 -name boardfarm-0,=
process=3Dboardfarm-vm-0 -daemonize


And I also checked that my kernel really lands in the Zbb-code by simply
adding a "ret" [0] and making sure it breaks vs. runs without it


Next I'll try to move my rootfs into a real image-file and switch over to
the commandline Drew calls, to see if it'll reproduce then.



[0] =

diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index ee49595075be..6b35933c5949 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -53,6 +53,7 @@ strncmp_zbb:
 .option push
 .option arch,+zbb
 =

+       ret
        /*
         * Returns
         *   a0 - comparison result, like strncmp




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
