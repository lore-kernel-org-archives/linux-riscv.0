Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3223C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPCy+8aYlUV9I/Z7ho6ta1aOxlVwg3ikXjd7FZv8Ch0=; b=ppZEk0wsnnSswD
	qqewC2/i3MT5kyCN0s/e385JnS4SFF2pwURTdKGLgEPoSjUWEEF6Ya/zKqEVaxCibydMgbInyL2N4
	JFU7NsG7TjbNGIl+8cxTJydkerf2pgyCWdCZhlFz7EcEbPUvmKLbMDfgeGXZr8JH3yJyixT8yj0sU
	GRihUzqsD9JFCpHf0mEnKLcudXY9/uFs5LDlzS1Gp5QoAtP3Cu8GxZk9gconFSrP97KKYh4mQ7Epy
	Qr+oS4FzgekuBEm5PjZkLWrnRlsvuCDftlCV3SEMQQfVn2yLpmjVoZkokafwHh1nbSxxwo2k99AUi
	AVfAoNnUgMGcPaFkwBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUt9m-00DIPs-TA; Wed, 22 Feb 2023 17:43:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUt9j-00DIPJ-2n
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 17:43:53 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pUt9U-0005ln-Pu; Wed, 22 Feb 2023 18:43:36 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux@roeck-us.net, ajones@ventanamicro.com,
 Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 samuel@sholland.org, linux-riscv@lists.infradead.org,
 christoph.muellner@vrull.eu
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
Date: Wed, 22 Feb 2023 18:43:36 +0100
Message-ID: <2801162.88bMQJbFj6@diego>
In-Reply-To: <2186881.72vocr9iq0@diego>
References:  <mhng-72b23626-1921-454b-bba8-aec29b32048d@palmer-ri-x1c9a>
 <2186881.72vocr9iq0@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_094351_317643_41D54448 
X-CRM114-Status: GOOD (  42.14  )
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

Am Mittwoch, 22. Februar 2023, 18:03:55 CET schrieb Heiko St=FCbner:
> Am Mittwoch, 22. Februar 2023, 17:47:10 CET schrieb Palmer Dabbelt:
> > On Wed, 22 Feb 2023 07:39:11 PST (-0800), heiko@sntech.de wrote:
> > > Am Mittwoch, 22. Februar 2023, 16:31:25 CET schrieb Andrew Jones:
> > >> On Wed, Feb 22, 2023 at 03:27:43PM +0100, Andrew Jones wrote:
> > >> > On Thu, Feb 16, 2023 at 07:33:55AM -0800, Guenter Roeck wrote:
> > >> > > On 2/15/23 14:00, Heiko St=FCbner wrote:
> > >> > > [ ... ]
> > >> > > > =

> > >> > > > So now I've also tested Palmer's for-next at
> > >> > > >    commit ec6311919ea6 ("Merge patch series "riscv: Optimize f=
unction trace"")
> > >> > > > =

> > >> > > > again with the same variants
> > >> > > > - qemu-riscv32 without zbb
> > >> > > > - qemu-riscv32 with zbb
> > >> > > > - qemu-riscv64 without zbb
> > >> > > > - qemu-riscv64 with zbb
> > >> > > > =

> > >> > > > And all of them booted fine into a nfs-root (debian for riscv6=
4 and a
> > >> > > > buildroot for riscv32).
> > >> > > > =

> > >> > > > I even forced a bug into the zbb code to make sure the patchin=
g worked
> > >> > > > correctly (where the kernel failed as expected).
> > >> > > > =

> > >> > > > Qemu-version for me was 7.2.50 (v7.2.0-744-g5a3633929a-dirty)
> > >> > > > =

> > >> > > > I did try the one from Debian-stable (qemu-5.2) but that was t=
oo old and
> > >> > > > didn't support Zbb yet.
> > >> > > > =

> > >> > > > One thing of note, the "active" 32bit config I had, somehow di=
dn't produce
> > >> > > > working images and I needed to start a new build using the rv3=
2_defconfig.
> > >> > > > =

> > >> > > > So right now, I'm not sure what more to test though.
> > >> > > > =

> > >> > > =

> > >> > > Another example:
> > >> > > =

> > >> > > - build defconfig
> > >> > > - run
> > >> > >   qemu-system-riscv64 -M virt -m 512M -no-reboot -kernel arch/ri=
scv/boot/Image \
> > >> > >     -snapshot -device virtio-blk-device,drive=3Dd0 -drive file=
=3Drootfs.ext2,if=3Dnone,id=3Dd0,format=3Draw \
> > >> > >     -append "root=3D/dev/vda console=3DttyS0,115200 earlycon=3Du=
art8250,mmio,0x10000000,115200" \
> > >> > >     -nographic -monitor none
> > >> > > =

> > >> > > With CONFIG_RISCV_ISA_ZBB=3Dy, that results in
> > >> > > =

> > >> > > [    0.818263] /dev/root: Can't open blockdev
> > >> > > [    0.818856] VFS: Cannot open root device "/dev/vda" or unknow=
n-block(0,0): error -6
> > >> > > [    0.819177] Please append a correct "root=3D" boot option; he=
re are the available partitions:
> > >> > > [    0.819808] fe00           16384 vda
> > >> > > [    0.819944]  driver: virtio_blk
> > >> > > [    0.820534] Kernel panic - not syncing: VFS: Unable to mount =
root fs on unknown-block(0,0)
> > >> > > [    0.821101] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-r=
c8-next-20230216-00002-g80332825e240 #4
> > >> > > [    0.821672] Hardware name: riscv-virtio,qemu (DT)
> > >> > > [    0.822050] Call Trace:
> > >> > > [    0.822427] [<ffffffff800053e4>] dump_backtrace+0x1c/0x24
> > >> > > [    0.822834] [<ffffffff807f90e4>] show_stack+0x2c/0x38
> > >> > > [    0.823085] [<ffffffff80803aea>] dump_stack_lvl+0x3c/0x54
> > >> > > [    0.823351] [<ffffffff80803b16>] dump_stack+0x14/0x1c
> > >> > > [    0.823601] [<ffffffff807f944c>] panic+0x102/0x29e
> > >> > > [    0.823834] [<ffffffff80a015e2>] mount_block_root+0x18c/0x23e
> > >> > > [    0.824148] [<ffffffff80a0187c>] mount_root+0x1e8/0x218
> > >> > > [    0.824398] [<ffffffff80a019ee>] prepare_namespace+0x142/0x184
> > >> > > [    0.824655] [<ffffffff80a01182>] kernel_init_freeable+0x236/0=
x25a
> > >> > > [    0.824934] [<ffffffff80804602>] kernel_init+0x1e/0x10a
> > >> > > [    0.825201] [<ffffffff80003560>] ret_from_exception+0x0/0x16
> > >> > > [    0.826180] ---[ end Kernel panic - not syncing: VFS: Unable =
to mount root fs on unknown-block(0,0) ]---
> > >> > > =

> > >> > > This works fine if CONFIG_RISCV_ISA_ZBB is not enabled.
> > >> > > =

> > >> > > Tested with gcc 11.3, binutils 2.39, qemu v7.2.0 and qemu built =
from mainline.
> > >> > >
> > >> > =

> > >> > Just to +1 this, I get the same result (unable to mount root fs) w=
ith
> > >> > =

> > >> > $QEMU -cpu rv64,zbb=3Don \
> > >> >         -nographic \
> > >> >         -machine virt \
> > >> >         -kernel $KERNEL \
> > >> >         -append 'root=3D/dev/vda console=3DttyS0' \
> > >> >         -drive file=3Ddisk.ext4,format=3Draw,id=3Dhd0 \
> > >> >         -device virtio-blk-pci,drive=3Dhd0
> > >> > =

> > >> > kernel:   latest riscv-linux/for-next (8658db0a4a0f), defconfig
> > >> > gcc:      riscv-gnu-toolchain (12.1.0)
> > >> > binutils: riscv-gnu-toolchain (2.39)
> > >> > qemu:     latest master (79b677d658d3)
> > >> > =

> > >> > Flipping the QEMU cpu zbb property off allows boot to succeed, i.e=
. it's
> > >> > not necessary to compile out the CONFIG_RISCV_ISA_ZBB code from the
> > >> > kernel, it's just necessary to avoid using it.
> > >> >
> > >> =

> > >> Looks like something in the strncmp implementation. Only commenting =
it
> > >> out allows boot to succeed.
> > >
> > > and interestingly it seems to be something very specific. I.e. my set=
up is
> > > nfsroot-based (qemu is "just" another board in my boardfarm) and boot=
ing
> > > into an nfs-root works quite nicely.
> > >
> > > I guess I need to look into how to get an actual disk-image in there.
> > =

> > It looks like Drew isn't using an initrd (and with NFS, presumably you =

> > are)?  That's probably a big difference as well.
> =

> There is no initrd involved in my qemu setup ;-) .
> Just a kernel built from current for-next + defconfig and a nfs-server
> holding a full Debian-riscv64 system.
> =

> =

> The magic qemu incantation is also pretty standard:
> =

> /usr/local/bin/qemu-system-riscv64 -M virt -smp 2 -m 1G -display none \
>  -cpu rv64,zbb=3Dtrue,zbc=3Dtrue,svpbmt=3Dtrue,Zicbom=3Dtrue,Zawrs=3Dtrue=
,sscofpmf=3Dtrue,v=3Dtrue \
>  -serial telnet:localhost:5500,server,nowait -kernel /home/devel/nfs/kern=
el/riscv64/Image \
>  -append earlycon=3Dsbi root=3D/dev/nfs nfsroot=3D10.0.2.2:/home/devel/nf=
s/rootfs-riscv64virt ip=3Ddhcp rw \
>  -netdev user,id=3Dn1 -device virtio-net-pci,netdev=3Dn1 -name boardfarm-=
0,process=3Dboardfarm-vm-0 -daemonize
> =

> =

> And I also checked that my kernel really lands in the Zbb-code by simply
> adding a "ret" [0] and making sure it breaks vs. runs without it
> =

> =

> Next I'll try to move my rootfs into a real image-file and switch over to
> the commandline Drew calls, to see if it'll reproduce then.

With the rootfs in an image I could reproduce the issue now.

I hacked in a very crude change to find the invocation that acts differently
and voila it's a strncmp of the "/dev/vda" against "/dev/" [0].

It's really strange that all the other invocations produce correct results.




[0]
non-working - with zbb-strncmp:
[    2.619129] strncmp: comparing /dev/vda <-> mtd, count 3 =3D> -1
[    2.620451] strncmp: comparing /dev/vda <-> ubi, count 3 =3D> -1
[    2.621163] strncmp: comparing /dev/vda <-> PARTUUID=3D, count 9 =3D> -1
[    2.621703] strncmp: comparing /dev/vda <-> PARTLABEL=3D, count 10 =3D> =
-1
------ below is the difference
[    2.622255] strncmp: comparing /dev/vda <-> /dev/, count 5 =3D> 1
[    2.623446] strncmp: comparing /dev/vda <-> /dev/, count 5 =3D> 1
------ above is the difference
[    2.627064] strncmp: comparing sysfs <-> ext3, count 4 =3D> 14
[    2.627646] strncmp: comparing tmpfs <-> ext3, count 4 =3D> 15
[    2.628476] strncmp: comparing bdev <-> ext3, count 4 =3D> -3
[    2.628990] strncmp: comparing proc <-> ext3, count 4 =3D> 11
[    2.629422] strncmp: comparing cgroup <-> ext3, count 4 =3D> -2
[    2.629856] strncmp: comparing cgroup2 <-> ext3, count 4 =3D> -2
[    2.630345] strncmp: comparing cpuset <-> ext3, count 4 =3D> -2
[    2.630785] strncmp: comparing devtmpfs <-> ext3, count 4 =3D> -1
[    2.631267] strncmp: comparing debugfs <-> ext3, count 4 =3D> -1
[    2.631696] strncmp: comparing securityfs <-> ext3, count 4 =3D> 1
[    2.632596] strncmp: comparing sockfs <-> ext3, count 4 =3D> 14
[    2.633095] strncmp: comparing bpf <-> ext3, count 4 =3D> -3
[    2.633600] strncmp: comparing pipefs <-> ext3, count 4 =3D> 11
[    2.634071] strncmp: comparing ramfs <-> ext3, count 4 =3D> 13
[    2.634501] strncmp: comparing hugetlbfs <-> ext3, count 4 =3D> 1
[    2.634955] strncmp: comparing rpc_pipefs <-> ext3, count 4 =3D> 1
[    2.635407] strncmp: comparing devpts <-> ext3, count 4 =3D> -1
[    2.638788] strncmp: comparing ext3 <-> ext3, count 4 =3D> 0


working - with normal strncmp:
[    2.416438] strncmp: comparing /dev/vda <-> mtd, count 3 =3D> -62
[    2.417312] strncmp: comparing /dev/vda <-> ubi, count 3 =3D> -70
[    2.418296] strncmp: comparing /dev/vda <-> PARTUUID=3D, count 9 =3D> -33
[    2.418921] strncmp: comparing /dev/vda <-> PARTLABEL=3D, count 10 =3D> =
-33
------ below is the difference
[    2.419450] strncmp: comparing /dev/vda <-> /dev/, count 5 =3D> 0
[    2.420698] strncmp: comparing /dev/vda <-> /dev/, count 5 =3D> 0
------ above is the difference
[    2.424086] strncmp: comparing sysfs <-> ext3, count 4 =3D> 14
[    2.424663] strncmp: comparing tmpfs <-> ext3, count 4 =3D> 15
[    2.425111] strncmp: comparing bdev <-> ext3, count 4 =3D> -3
[    2.425563] strncmp: comparing proc <-> ext3, count 4 =3D> 11
[    2.426022] strncmp: comparing cgroup <-> ext3, count 4 =3D> -2
[    2.426717] strncmp: comparing cgroup2 <-> ext3, count 4 =3D> -2
[    2.427175] strncmp: comparing cpuset <-> ext3, count 4 =3D> -2
[    2.427608] strncmp: comparing devtmpfs <-> ext3, count 4 =3D> -1
[    2.428061] strncmp: comparing debugfs <-> ext3, count 4 =3D> -1
[    2.428526] strncmp: comparing securityfs <-> ext3, count 4 =3D> 14
[    2.428985] strncmp: comparing sockfs <-> ext3, count 4 =3D> 14
[    2.429423] strncmp: comparing bpf <-> ext3, count 4 =3D> -3
[    2.429863] strncmp: comparing pipefs <-> ext3, count 4 =3D> 11
[    2.430433] strncmp: comparing ramfs <-> ext3, count 4 =3D> 13
[    2.431202] strncmp: comparing hugetlbfs <-> ext3, count 4 =3D> 3
[    2.431721] strncmp: comparing rpc_pipefs <-> ext3, count 4 =3D> 13
[    2.432222] strncmp: comparing devpts <-> ext3, count 4 =3D> -1
[    2.432685] strncmp: comparing ext3 <-> ext3, count 4 =3D> 0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
