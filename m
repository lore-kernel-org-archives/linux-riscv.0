Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B734DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhSVZZjUeeqRaqwH4289hWU4WxZgCv9oBWbPjWIdQDA=; b=PO2PWSbifQ3jz+
	AKYQfs2E8b03sqirnbtC+jM9pTyzWVSMnkIEFiHg3IzOb5O+NY/Q6YKUOjEfP6dYAbPczPh1DxVCn
	5jummqUQ2PEgJ7EmhcrdKqGG3BsEgLTaJTA2x17ZpPNUrxtpR6ryKbo7kve7DxH/XS9osZRX1Vr2y
	gGuqZrrlriszopDkPL4FBchLdDTLEDaN15X9uHAQ0cnExPu5uNf49dM+DrRGRHA0FB9KR8wSM4L8P
	E7xClOD+OoMDv/lo8ep1JIN7v7ovvaA2c5mu5CFN1Tl5jsqggkZ4VezMRGPTR5gHqS1RtLwRMkHG2
	ra33dVFSOs/oKXwl8Wyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3FD-00CkIR-Ox; Thu, 13 Oct 2022 18:47:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3FA-00CkHP-QI
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 18:47:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 873FEB8202B;
	Thu, 13 Oct 2022 18:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C2AC433D6;
	Thu, 13 Oct 2022 18:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665686860;
	bh=YuUMePZ+vsNbKjlHx9yOeHLR/mA9M7RIxKfWjwX0qPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PazBDFLLXt+GAi+mkSDU9TFTQyuUzl6qteLU+Qq7RRtLckPFKi6j6bJgVfJ9ZQqrX
	 erfrZur+wzF9i6QDqQLAkHrHaKDJ0hpzv18XOrbsUuTMKKY+7dEueNMVTwh/pFOVhx
	 Vm6sARenpfGClnv6W+nJYOd3dlJzEjxg/aOAvhyMJtNmLSo5+k4zIbg3KDqgKWiboT
	 KHpaLWE4n+PU9fAYfUnWOD1K2j8XXbAg3Od+sHfWmucYF4yxGzF6CAPbEPKJ2Wc8Gg
	 1c13fXR1HTlXywmLDurUmQjDdCod/EhG65fJuA3o/B//MJt8MnKtACxnL8rJtTc4aN
	 xrV9C3gqAHQiA==
Date: Thu, 13 Oct 2022 19:47:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>, Jens Axboe <axboe@kernel.dk>,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	"Jason A. Donenfeld" <zx2c4@kernel.org>,
	linux-riscv@lists.infradead.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [linux-stable-rc:linux-4.19.y 3113/3976]
 drivers/char/random.c:1336: Error: unrecognized opcode `csrs sstatus,s4'
Message-ID: <Y0hdR2Z44oOQ989w@spud>
References: <202210101947.iPda3BwQ-lkp@intel.com>
 <Y0QKkwQ5KGT9ngPL@wendy>
 <Y0gONdihAaosW9+U@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0gONdihAaosW9+U@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_114745_197494_EED79D71 
X-CRM114-Status: GOOD (  21.30  )
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

On Thu, Oct 13, 2022 at 03:10:13PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 10, 2022 at 01:05:39PM +0100, Conor Dooley wrote:
> > On Mon, Oct 10, 2022 at 07:51:59PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> > > head:   5644b22533b36dc1a95ab1db4ae83381514b2908
> > > commit: 1923d9a8a08684c063da049fa9d5d8139edbbcbb [3113/3976] random: convert to using fops->write_iter()
> > > config: riscv-randconfig-c024-20221009
> > > compiler: riscv64-linux-gcc (GCC) 12.1.0
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=1923d9a8a08684c063da049fa9d5d8139edbbcbb
> > >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> > >         git fetch --no-tags linux-stable-rc linux-4.19.y
> > >         git checkout 1923d9a8a08684c063da049fa9d5d8139edbbcbb
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/char/
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    arch/riscv/include/asm/irqflags.h: Assembler messages:
> > >    arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s6,sstatus,2'
> > >    arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,0'
> > >    arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s6'
> > >    drivers/char/random.c:1316: Error: unrecognized opcode `csrs sstatus,a3'
> > >    drivers/char/random.c:1316: Error: unrecognized opcode `csrc sstatus,a3'
> > >    drivers/char/random.c:1322: Error: unrecognized opcode `csrs sstatus,a3'
> > >    drivers/char/random.c:1322: Error: unrecognized opcode `csrc sstatus,a3'
> > > >> drivers/char/random.c:1336: Error: unrecognized opcode `csrs sstatus,s4'
> > > >> drivers/char/random.c:1336: Error: unrecognized opcode `csrc sstatus,s4'
> > 
> > All of these look like 4.19.y is missing a backport of:
> > Fixes: 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
> > 
> > That commit is CC: stable, so I assume it did not apply or w/e and
> > nobody cared enough to do a backport?
> 
> It does not apply and no one sent in a fixed backport :(

Welp, I have a fixed backport for it and pushed it out for LKP [0].
Just quickly checked it w/ binutils 2.36 & 2.38 locally, which both
worked fine. I doubt anyone really cares though, 4.19 is pretty long in
the tooth RISC-V hw wise. Not the biggest fan of what I did, but I
didn't want to send backports for some other infra changes that
6df2a016c0c8 depends on.

I'll send it to you once LKP gives it the all clear.

Thanks,
Conor.

0 -https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=riscv-backport_238_fix&id=cf7c2ca06cd0e5f6c16fe70e751380c8673da9ed

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
