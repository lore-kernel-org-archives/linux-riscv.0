Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB9DC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSV6+i59rK8eu7ciW31o7tiF4lLhf78QCfaexC0CqB4=; b=Ezh2DrZJ/xyODf
	VORFUD99nKreUkyap5e5PZNPS4I5eyc5MNrf90Tid3Ip8tMcc6Mdp5S9D0POZLS2pYa6I07XKuz1g
	YETw7WyQWH9vTCohOsyvKaFthNDgVcX7VxtL+/UUXdS8PorDz8gpWZY83SaFqG5jGN6zAESKnEB8t
	ZxqMfYdoj5H7lhB93FyLtMqV4nZVZZLWYIyIzkkKrqaODyauPooKnvQLZRkAwpyW676ND+n4qZjiY
	qeatbugdPDQj1IcOT8q7wzqtYofvL7Br7q2gW3HWG+GjA7R9z9LxnbHDPhMoJgTvdFE+OCqjh0R4g
	LS/8F+gZxqtcevfpy+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPNDb-0096gP-0L;
	Mon, 15 Jan 2024 13:41:35 +0000
Received: from helium.openadk.org ([2a00:1828:2000:679::23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPNDV-0096fQ-3C;
	Mon, 15 Jan 2024 13:41:32 +0000
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 72F6135210AB; Mon, 15 Jan 2024 14:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1705326082; bh=oxu8ri+2lNAJGmWaelZR/DAbUPHgJwlAGo7y/CzxD4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DX6Ey8NpU5GrlvEu3ZRCkLwI5kBRnUvpr23wJSVaSMxIvKcwenahJ6FnpxnlCpzvT
	 q00OflPoW7AF8uLs4+x/C0//3TcLaD7fuJWk3adpvG8BfJL/B5c8yVJ+2pKol1WuZ+
	 hXP81V9hyEpCoS7AKFE+l1KA+iCWIjBaPsusSRwfwCsJWzdAVRc7quDLtRl99U+GB5
	 vZ8tq3rEaqKwyMKsPNvqa8yhU6Xz2PkbZZsreGoz/vomjnBebeI4AOolJ32GaW/Mmo
	 qO7Ah7Eon0nLF4vBUP3bfqcjzzORYmhkrwk+dBf/iwB3cmChCKQvD9qZ3FYOXh0Nn8
	 ZD+QMa3ub/EkA==
Date: Mon, 15 Jan 2024 14:41:22 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Petr Vorel <pvorel@suse.cz>,
	Rob Landley <rob@landley.net>, Tim Bird <tim.bird@sony.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Andrea Cervesato <andrea.cervesato@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	Christophe Lyon <christophe.lyon@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Li Wang <liwang@redhat.com>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Cyril Hrubis <chrubis@suse.cz>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"buildroot@buildroot.org" <buildroot@buildroot.org>,
	"ltp@lists.linux.it" <ltp@lists.linux.it>,
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>
Subject: Re: [Buildroot] [Automated-testing] Call for nommu LTP maintainer
 [was: Re: [PATCH 00/36] Remove UCLINUX from LTP]
Message-ID: <ZaU2Ag1wg1Sne9zZ@waldemar-brodkorb.de>
References: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik>
 <ZZvJXTshFUYSaMVH@yuki>
 <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
 <20240110141455.GC1698252@pevik>
 <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
 <81c07a13-305a-404b-b14c-3aff8fde3f67@linux-m68k.org>
 <d3a26b8e-8823-8f3c-b815-4396cbac1dc3@landley.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3a26b8e-8823-8f3c-b815-4396cbac1dc3@landley.net>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_054130_489276_7BD9113C 
X-CRM114-Status: GOOD (  11.96  )
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

Hi,

I want to clarify some things of the point of view of uClibc-ng
support.

There is support for following configurations for noMMU targets:
ARM:
 - FLAT with Linuxthreads supported (for Qemu you need a Linux patch)
 - FDPIC with NPTL supported (NPTL works only on real hardware not in Qemu)
 - ELF with Thread support not working

M68k:
 - FLAT with Linuxthreads supported
 - ELF with Thread support not working

RISCV64:
 - FLAT without Thread support
 - ELF with Thread support not working

RISCV32:
 - FLAT without Thread support, needs a small Linux Kernel patch

SH2/J2:
 - FLAT with Linuxthreads supported

Xtensa:
 - FLAT with Linuxthreads supported

There are some obsolete architectures supported by uClibc-ng, but
no longer supported by Linux:

Blackfin:
 - FLAT with Linuxthreads supported
 - FDPIC

H8300:
 - FLAT with Linuxthreads supported

C6X:
 - DSBT 

LM32:
 - FLAT

LTP requires NPTL to work, so the only testable platform is ARM with
FDPIC right now.
Unfortunately LTP 20230929 needs fork for some files:

RANLIB libltp.a
/home/wbx/arm/toolchain_st-stm32f746g_uclibc-ng_cortex_m7_soft_eabi_thumb_nommu/usr/lib/gcc/arm-openadk-uclinuxfdpiceabi/13.2.0/../../../../arm-openadk-uclinuxfdpiceabi/bin/ld: ../../lib/libltp.a(tst_res.o): in function `tst_fork':
/home/wbx/arm/build_st-stm32f746g_uclibc-ng_cortex_m7_soft_eabi_thumb_nommu/w-ltp-20230929-1/ltp-full-20230929/lib/tst_res.c:430:(.text+0x952): undefined reference to `fork'
/home/wbx/arm/toolchain_st-stm32f746g_uclibc-ng_cortex_m7_soft_eabi_thumb_nommu/usr/lib/gcc/arm-openadk-uclinuxfdpiceabi/13.2.0/../../../../arm-openadk-uclinuxfdpiceabi/bin/ld: ../../lib/libltp.a(tst_test.o): in function `fork_testrun':
/home/wbx/arm/build_st-stm32f746g_uclibc-ng_cortex_m7_soft_eabi_thumb_nommu/w-ltp-20230929-1/ltp-full-20230929/lib/tst_test.c:1597:(.text+0xf4e): undefined reference to `fork'
/home/wbx/arm/toolchain_st-stm32f746g_uclibc-ng_cortex_m7_soft_eabi_thumb_nommu/usr/lib/gcc/arm-openadk-uclinuxfdpiceabi/13.2.0/../../../../arm-openadk-uclinuxfdpiceabi/bin/ld: ../../lib/libltp.a(tst_test.o): in function `safe_fork':
/home/wbx/arm/build_st-stm32f746g_uclibc-ng_cortex_m7_soft_eabi_thumb_nommu/w-ltp-20230929-1/ltp-full-20230929/lib/tst_test.c:435:(.text+0x345c): undefined reference to `fork'
collect2: error: ld returned 1 exit status
gmake[8]: *** [../../include/mk/rules.mk:45: test01] Error 1
gmake[7]: *** [../include/mk/generic_trunk_target.inc:108: all] Error 2
gmake[6]: *** [Makefile:94: lib-all] Error 2
gmake[5]: *** [/home/wbx/arm/mk/pkg-bottom.mk:141: /home/wbx/arm/build_st-stm32f746g_uclibc-ng_cortex_m7_soft_eabi_thumb_nommu/w-ltp-20230929-1/ltp-full-20230929/.build_done] Error 2
gmake[4]: *** [Makefile:61: ltp-compile] Error 2
gmake[3]: *** [mk/build.mk:221: package/compile] Error 2
gmake[2]: *** [/home/wbx/arm/mk/build.mk:176: world] Error 2

So there is really work to be done to make the existing code work on noMMU.

best regards
 Waldemar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
