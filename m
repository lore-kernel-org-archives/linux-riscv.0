Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C13C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2024 04:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qipOc7/wTtM9JPsKH26bZTkldEnsfm0TdjZl6WWylxU=; b=ixTefRFIb5Bk/K
	NiXAmUepTx4mIORtHa5JHUlQRdblgAb2b8U2W9lOVnkEXLL9KkgSd4oCqX7kxZ+ZskW2DzZoiC5MD
	8P3aEWR8/i3CfiRyilQaGBvYVrUYvlVL0Nez4usHzKeL2yH7/kGXZtMOQEERb6O/0trb+W9OsOKQO
	evd6mlYHOg/LV3YhI7kFTipY/35m2i52MMzA7wuh8qcel2ecQJ8qcaBBhMfUeZ+K/sMmRdMygVvih
	sTNLvo/NakX8vLWW/p59KZwyjOyQ/o+y6J/p0IdkZNKXsrVHSm038ziB+RVY00nT+h4j5LGZPhztD
	Jq6lrvLBF5dtDVkEfGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvV7X-00000002MQ7-1mpx;
	Sat, 13 Apr 2024 04:36:07 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvV7R-00000002MPK-4399
	for linux-riscv@lists.infradead.org;
	Sat, 13 Apr 2024 04:36:05 +0000
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 43D4ZgBU018660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Apr 2024 00:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1712982946; bh=/B4pXAPsMRR82DA1Wh7RuqgKoBHilarf9qCJOIPKqF4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=TbnQtMH6TFa+kLU/M/0hqC87t19sYAJN33+wvj898a7IJ849R+CNp8YkoxJc/Eeqm
	 I2PCmWvJ0bGYq9M9QpnVJo0D7W+DMRoH2GHhUJAP5O8E8XWOtKLsZlCprWefjOuJpC
	 zsYq77DgwqdyyjzyOGaLj+eVsx7pFRn771AUsyRhDjbuR5qA+8fLh273p/m7yumP98
	 djtYmjbKvdy3xFtzs0yaGDs2tVDUtytiErDSfYlSXQUDHzYXGGstKUVL6NVEF2ie/f
	 Qe78Fkdk33nf6FYe0NcVWu+C/fZdkYwQQ1tQRiic7WUtjR7NLiVjj3mdNn2fty2KSS
	 LXpNi5K/SoXmw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 2A66215C0CB5; Sat, 13 Apr 2024 00:35:42 -0400 (EDT)
Date: Sat, 13 Apr 2024 00:35:42 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
        Conor Dooley <conor@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240413043542.GE187181@mit.edu>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240412154342.GA1310856@mit.edu>
 <87a5lyecuw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5lyecuw.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_213602_407885_C95A3F48 
X-CRM114-Status: GOOD (  19.80  )
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

On Fri, Apr 12, 2024 at 06:59:19PM +0200, Bj=F6rn T=F6pel wrote:
> =

>   $ pipx install tuxrun
> =

> if you're on Debian.
> =

> Then you can get the splat by running:
> =

>   $ tuxrun  --runtime docker --device qemu-riscv32 --kernel https://stora=
ge.tuxsuite.com/public/linaro/lkft/builds/2esMBaAMQJpcmczj0aL94fp4QnP/Image=
.gz --parameters SKIPFILE=3Dskipfile-lkft.yaml --parameters SHARD_NUMBER=3D=
10 --parameters SHARD_INDEX=3D1 --image docker.io/linaro/tuxrun-dispatcher:=
v0.66.1 --tests ltp-controllers

Yeah, what I was hoping for was a shell script or a .c file hich was
the reproducer, because that way I can run the test in my test infrastructu=
re [1]

[1] https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-xfs=
tests.md

I'm sure there are plenty of nice things about tuxrun, but with
kvm-xfstests I can easily get a shell so I can run the test sccript by
hand, perhaps with strace so I can see what is going on.  Or I attach
gdb to the kernel via "gdb /path/to/vmlinux" and "target remote
localhost:7499".

I'm guessing that "ltp-controllers" means that the test might be from
the Linux Test Project?  If so, that's great because I've added ltp
support to my test infrastructure (which also supports blktests,
phoronix test suite, and can be run on gce and on android devices in
addition to qemu, and on the arm64, i386, and x86_64 architectures).

> Build with "make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-gnu-", and ma=
ke
> sure to have the riscv64 cross-compilation support (yes, same toolchain
> for rv32!).
> =

> It's when the rootfs is mounted, and the kernel is looking an init.

Hmm, so this happening as soon as the VM starts, before actually
starting to run any tests?  Is it possible for you to send me the
rootfs as a downloading image, as opposed to my trying to paw through
the docker image?

> I'll keep debugging -- it was more if anyone had seen it before. I'll
> try to reproduce on some other 32b platform as well.

Well, it's not happening on my rootfs on i386 using my test infrastructure:

% cd /usr/projects/linux/ext4
% git checkout v6.8
% install-kconfig --arch i386
% kbuild --arch i386
% kvm-xfstests shell
    ...
root@kvm-xfstests:~# cd ltp
root@kvm-xfstests:~# ./runltp

(I don't have ltp support fully automated the way I can run blktests
using "kvm-xfstests --blktests" or run xfstests via "gce-xfstests -c
ext4/all -g auto".  The main missing is teaching ltp to create an
junit xml results file so that the test results can be summarized and
so the test results can be more easily summarized and compared against
past runs on different kernel versions.)

Anyway, if you can send me your rootfs, I can try to take a look at it.

       	       	       	    	      - Ted

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
