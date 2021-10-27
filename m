Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3EDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F79C60F38
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F79C60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QBbLb64VKkdqJSFRq/NkMZPGXhOMYGpNfT9INKvFUo=; b=4WXjest3jEQ+NK
	hKERIt1g+/b90Z9v6jeVpY3MEMT3Bx0Clkb0YADVdbBwW8x2bD4yo50PAJAVrOHrKawLJHDCTUR+k
	YxwrUZqCMQfJD6DIpYqJEQ7ohmOqFuWE2GLgD0WegAC5k4VsIRdE75Mzk3xRTHdaNoqPGKMF9tvPV
	s6zVx07ibseFKccPQf6Wd4fcHvcra3FJY9ugVKz3an3x4qqn9gbszWZmwUAmg3Jc4UbdU5QtOa04Y
	bq/JShNwjh4vdRt1J8uxP+5o6v2OD8qB/AZxGAkFIr1Vro5oflyNX4OEvHItky8Pabh+ZAKQ28kxA
	SNqiksIxhQqUW2Lwh+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfkGJ-005Bkk-Mx; Wed, 27 Oct 2021 14:50:43 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfkGF-005BjC-Tp
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 14:50:42 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HfWp413gwz1rk5Y;
 Wed, 27 Oct 2021 16:50:36 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HfWp4017Qz1qqkD;
 Wed, 27 Oct 2021 16:50:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id mvw_Vf1g8ae4; Wed, 27 Oct 2021 16:50:34 +0200 (CEST)
X-Auth-Info: uyeUEsOYKs8g0PlgbxUncJma1HMUm74E4sgRZWggIapnCF9LPFgALkqIfuqoYU9Q
Received: from igel.home (ppp-46-244-163-205.dynamic.mnet-online.de
 [46.244.163.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 27 Oct 2021 16:50:34 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id C36B92C28AC; Wed, 27 Oct 2021 16:50:33 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Saleem Abdulrasool <abdulras@google.com>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,  Bill Wendling
 <morbo@google.com>,  clang-built-linux@googlegroups.com
Subject: Re: [PATCH v3] riscv: explicitly use symbol offsets for VDSO
References: <20210804173214.1027994-1-abdulras@google.com>
X-Yow: I've got to get these SNACK CAKES to NEWARK by DAWN!!
Date: Wed, 27 Oct 2021 16:50:33 +0200
In-Reply-To: <20210804173214.1027994-1-abdulras@google.com> (Saleem
 Abdulrasool's message of "Wed, 4 Aug 2021 17:32:14 +0000")
Message-ID: <874k92a5dy.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_075040_292885_99B242B0 
X-CRM114-Status: GOOD (  17.35  )
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

On Aug 04 2021, Saleem Abdulrasool wrote:

> The current implementation of the `__rt_sigaction` reference computed an
> absolute offset relative to the mapped base of the VDSO.  While this can
> be handled in the medlow model, the medany model cannot handle this as
> it is meant to be position independent.  The current implementation
> relied on the BFD linker relaxing the PC-relative relocation into an
> absolute relocation as it was a near-zero address allowing it to be
> referenced relative to `zero`.
>
> We now extract the offsets and create a generated header allowing the
> build with LLVM and lld to succeed as we no longer depend on the linker
> rewriting address references near zero.  This change was largely
> modelled after the ARM64 target which does something similar.
>
> Signed-off-by: Saleem Abdulrasool <abdulras@google.com>

I think this broke out-of-tree module builds.

https://build.opensuse.org/package/live_build_log/openSUSE:Factory:RISCV/rtl8812au/standard/riscv64

+ make -j4
make ARCH=riscv CROSS_COMPILE= -C /usr/src/linux-obj/riscv64/default M=/home/abuild/rpmbuild/BUILD/rtl8812au-5.9.3.2+git20210427.6ef5d8f/obj/default  modules
make[1]: Entering directory '/usr/src/linux-5.14.14-1-obj/riscv64/default'
mkdir: cannot create directory 'arch/riscv/kernel': Permission denied
  LDS     arch/riscv/kernel/vdso/vdso.lds
  AS      arch/riscv/kernel/vdso/rt_sigreturn.o
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  AS      arch/riscv/kernel/vdso/getcpu.o
mkdir: cannot create directory 'arch/riscv/kernel': Permission denied
  LDS     arch/riscv/kernel/vdso/vdso.lds
  AS      arch/riscv/kernel/vdso/rt_sigreturn.o
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  AS      arch/riscv/kernel/vdso/getcpu.o
cc1: fatal error: opening output file arch/riscv/kernel/vdso/vdso.lds: No such file or directory
compilation terminated.
make[3]: *** [/usr/src/linux-5.14.14-1/scripts/Makefile.build:366: arch/riscv/kernel/vdso/vdso.lds] Error 1

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
