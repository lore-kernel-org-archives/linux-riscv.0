Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C1C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2024 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikDEutFozhoF/LAVxu0JGwtZYNK9VoRtljBhhFngocY=; b=MaEQSc6uN26rj7M3bQYdsCHbKX
	TMusTmey/T5eLbTnfjkIM4SHzg6pgEQwgcHzSUnXZw2NCGQsyTHPkF5wwtI5X2xx0GJ7ZeBYfTT9h
	MmYcV13sVJLdmmpZ6WGa2yfw3MPC0h2mFEf/H256ER+cfJFQSN5iDiizFFOUu6jA/XT4l0T4ggotp
	+zCpfTHSpwWoXpciFEfl0N1HArxPIX/BLmoqsysGRPxBIoVg3udpJh7RPAq8qoar/v/jD5ouJop9s
	VyNLNS9eao0Scb7TuT+F6D81Dzi/+J7/kcq4DKWo41w2ja6jvRQc3W0ZSYMZasq2d/Iy5uBBmxaA6
	SMjTlXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvaCJ-00000002tpk-0GsH;
	Sat, 13 Apr 2024 10:01:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvaCF-00000002tnG-39bp
	for linux-riscv@lists.infradead.org;
	Sat, 13 Apr 2024 10:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A0B4CE2D43;
	Sat, 13 Apr 2024 10:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A686C4AF0D;
	Sat, 13 Apr 2024 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713002472;
	bh=M8jzyVtgD1C3f4LkPu9lLRDNvCWXKSwAyeVD4GJA+0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDqSIGawNAVQorIkIpn+/2QhThS0S2hvseA7ElQRoNzI1lAODuWbvWRePH/moP0K1
	 aYo/+4AtTxFNy+DPSPHzQZ766DHK4FdFXZ5eCUSPHcDDP8O8rwk/5fengDxFj3MoTI
	 q84dAWhts56Mfjc+Cs3A1sFeehJCoacYnCC0ENjh+ORBGNf5j+YaEBbi1BuAMux+F1
	 aeQPz1J2wKKcMyByrAZnqq63Io9lHLK4KB0K05DbiaZEy4h06qQcR2X2XaTadH1wbj
	 SwKRKpp0hFKEB3VYwHgsWeVmlS/ocbVedTHtqzeDP9fDplNt3L22AhAnlux5nEhTUI
	 rhMGZNAgrHBcg==
Date: Sat, 13 Apr 2024 11:01:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-ext4@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240413-ranging-uselessly-4b1de2210593@spud>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240412154342.GA1310856@mit.edu>
 <87a5lyecuw.fsf@all.your.base.are.belong.to.us>
 <20240413043542.GE187181@mit.edu>
MIME-Version: 1.0
In-Reply-To: <20240413043542.GE187181@mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_030120_172472_C3D97FC3 
X-CRM114-Status: GOOD (  31.38  )
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
Content-Type: multipart/mixed; boundary="===============3359202485899516716=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3359202485899516716==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FJpzzv1jTl7B+Rbm"
Content-Disposition: inline


--FJpzzv1jTl7B+Rbm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2024 at 12:35:42AM -0400, Theodore Ts'o wrote:
> On Fri, Apr 12, 2024 at 06:59:19PM +0200, Bj=F6rn T=F6pel wrote:
> >=20
> >   $ pipx install tuxrun
> >=20
> > if you're on Debian.
> >=20
> > Then you can get the splat by running:
> >=20
> >   $ tuxrun  --runtime docker --device qemu-riscv32 --kernel https://sto=
rage.tuxsuite.com/public/linaro/lkft/builds/2esMBaAMQJpcmczj0aL94fp4QnP/Ima=
ge.gz --parameters SKIPFILE=3Dskipfile-lkft.yaml --parameters SHARD_NUMBER=
=3D10 --parameters SHARD_INDEX=3D1 --image docker.io/linaro/tuxrun-dispatch=
er:v0.66.1 --tests ltp-controllers
>=20
> Yeah, what I was hoping for was a shell script or a .c file hich was
> the reproducer, because that way I can run the test in my test infrastruc=
ture [1]
>=20
> [1] https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-x=
fstests.md
>=20
> I'm sure there are plenty of nice things about tuxrun, but with
> kvm-xfstests I can easily get a shell so I can run the test sccript by
> hand, perhaps with strace so I can see what is going on.  Or I attach
> gdb to the kernel via "gdb /path/to/vmlinux" and "target remote
> localhost:7499".
>=20
> I'm guessing that "ltp-controllers" means that the test might be from
> the Linux Test Project?  If so, that's great because I've added ltp
> support to my test infrastructure (which also supports blktests,
> phoronix test suite, and can be run on gce and on android devices in
> addition to qemu, and on the arm64, i386, and x86_64 architectures).
>=20
> > Build with "make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-gnu-", and =
make
> > sure to have the riscv64 cross-compilation support (yes, same toolchain
> > for rv32!).
> >=20
> > It's when the rootfs is mounted, and the kernel is looking an init.
>=20
> Hmm, so this happening as soon as the VM starts, before actually
> starting to run any tests?  Is it possible for you to send me the
> rootfs as a downloading image, as opposed to my trying to paw through
> the docker image?
>=20
> > I'll keep debugging -- it was more if anyone had seen it before. I'll
> > try to reproduce on some other 32b platform as well.
>=20
> Well, it's not happening on my rootfs on i386 using my test infrastructur=
e:
>=20
> % cd /usr/projects/linux/ext4
> % git checkout v6.8
> % install-kconfig --arch i386
> % kbuild --arch i386
> % kvm-xfstests shell
>     ...
> root@kvm-xfstests:~# cd ltp
> root@kvm-xfstests:~# ./runltp
>=20
> (I don't have ltp support fully automated the way I can run blktests
> using "kvm-xfstests --blktests" or run xfstests via "gce-xfstests -c
> ext4/all -g auto".  The main missing is teaching ltp to create an
> junit xml results file so that the test results can be summarized and
> so the test results can be more easily summarized and compared against
> past runs on different kernel versions.)
>=20
> Anyway, if you can send me your rootfs, I can try to take a look at it.

I think this should be the rootfs here:
https://drive.google.com/file/d/1HIo8EkAKY0xpTIIlwd9fXjRzmIdD7BUA/view?usp=
=3Dsharing

I also attempted to bisect this and ended up at a slightly different
commit to Bjorn: 8c9440fea774 ("Merge tag 'vfs-6.8.mount' of git://git.kern=
el.org/pub/scm/linux/kernel/git/vfs/vfs")
That's a merge of 3f6984e7301f & 5bd3cf8cbc8a, both of which booted for
me. I also tried to bisect in reverse to find the fix a la syzbot, since it
is not broken in 6.9, but that's pretty error prone and I ended up down
branches based on 6.7 and was not able to find the fix.

--FJpzzv1jTl7B+Rbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhpX4wAKCRB4tDGHoIJi
0tRqAQCXXbOrWb84G1BMCnEc/q7K6gnaG6NpDOGxRUtn77Aj9wD/Z8HV03soxS6w
zP3EBHNHEyYrQfbMFW54iQq7kSvAjgk=
=6oYE
-----END PGP SIGNATURE-----

--FJpzzv1jTl7B+Rbm--


--===============3359202485899516716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3359202485899516716==--

