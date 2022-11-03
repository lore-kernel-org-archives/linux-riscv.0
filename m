Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12447C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F67iGExaXrXaU3uPik/bgXpv3i+zHJfFXqejM7+zvlQ=; b=ePmr5jmHj6fOtJ
	xtejdfSZjPKJ3gqVvAO6iT3lBAGIOweNAn/QjnBJUmaoOKW/dlcaXTQBCF2AcivtP/uMaGqfPiavF
	t+GTP6CIIMNP0H1pghIp5eXwj8VmAqS7yZuM6+YSx8Xnie0QFlq2ktl5QehJVLcn3OP/0lRkpZVQm
	lSdKfbCD/WqzvBTtojG2EBT+TOSk9gxwJn5BS4gjUE2a5nAeBVXBgojqqHV0QORqDlRr+2OJwmNkD
	5RPIRJ5+eYeno0DWmHaGtNwUOt7DR24GWKYAOi0EQMBAVhZ1C+CnFG8udNPrP2OwNFYLTS0P7p1q7
	yW+ZTxIJicOcsX3gmgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqPfh-00Fbj0-9h; Thu, 03 Nov 2022 02:09:33 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqPfe-00Fbi7-02
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 02:09:32 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N2nHx68XCz4xP9;
	Thu,  3 Nov 2022 13:09:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1667441358;
	bh=JSSHWTvGDMu8HB+pnn2yZCR+yhgFgEaVO6lUyM6ufbM=;
	h=From:To:Cc:Subject:Date:From;
	b=JqFl1QRgpdWHWNhPGycVaNAkX9qbOPeoyD0gMuMZw1F/V1Be4OIcf/C+kxclB+DMP
	 /iSqo0cS/Zib0IsDwY1K02NQ1fDg+6XHgwKPWLFO/7xmviCYYQ5F8frpN1Flrf+JSq
	 7P/cb6bRf2IIRIiyWncjSAEuKn1xEumX1GG/z06GnwU04jvPvm4aa6Wh17lDoKhJDh
	 EyAYuwEcsQ61m9wozPo3jfOn/emN6A292VvR9Qf7LQJ51DV6Z1N7E5SsDCGAg6mack
	 GIDS64bmJRhbeA7p9Viyx/pIrpU90vQhbBTdXxx3OUPIOTZnyV3jDw8KIN/eGFWABX
	 fIvqKBkKwnSlA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 schwab@linux-m68k.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
Date: Thu, 03 Nov 2022 13:09:17 +1100
Message-ID: <87o7tossaa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_190930_582812_94BB3A18 
X-CRM114-Status: GOOD (  10.09  )
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.1.

We had a few bad bugs on 32-bit and compat due to the introduction of syscall wrappers,
which caused syscall arguments to be handled incorrectly for some syscalls. I have at
least one report of it causing someone's root partition to fill up, presumably due to a
bad fallocate.

The asm-generic change affects RISC-V too, although Palmer didn't think there were likely
to be many compat users on RISC-V.

cheers


The following changes since commit 65722736c3baf29e02e964a09e85c9ef71c48e8d:

  powerpc/64s/interrupt: Fix clear of PACA_IRQS_HARD_DIS when returning to soft-masked context (2022-10-27 00:38:35 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-4

for you to fetch changes up to 02a771c9a68a9f08cce4ec5e324fb1bc4dce7202:

  powerpc/32: Select ARCH_SPLIT_ARG64 (2022-11-01 15:27:12 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.1 #4

 - Fix an endian thinko in the asm-generic compat_arg_u64() which led to syscall arguments
   being swapped for some compat syscalls.

 - Fix syscall wrapper handling of syscalls with 64-bit arguments on 32-bit kernels, which
   led to syscall arguments being misplaced.

 - A build fix for amdgpu on Book3E with AltiVec disabled.

Thanks to: Andreas Schwab, Christian Zigotzky, Arnd Bergmann.

- ------------------------------------------------------------------
Andreas Schwab (2):
      asm-generic: compat: fix compat_arg_u64() and compat_arg_u64_dual()
      powerpc/32: fix syscall wrappers with 64-bit arguments

Michael Ellerman (3):
      Merge tag 'v6.1-rc2' into fixes
      powerpc/64e: Fix amdgpu build on Book3E w/o AltiVec
      powerpc/32: Select ARCH_SPLIT_ARG64


 arch/powerpc/Kconfig                     |  3 ++-
 arch/powerpc/include/asm/syscalls.h      |  7 +++++++
 arch/powerpc/kernel/sys_ppc32.c          | 13 ++++++++++++-
 arch/powerpc/kernel/syscalls/syscall.tbl |  7 +++++--
 include/asm-generic/compat.h             |  2 +-
 5 files changed, 27 insertions(+), 5 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmNjINoACgkQUevqPMjh
pYCh1A//cDma7NOr7AgBcSCDjifYW+k7zSDgo/kELK126zsWa1mEeBBMNqbLVbRM
PPYjZUT8wcAjfKRm1V50Y5AoLjk+Me0IyNswKmWJQGUvQgwTt67GI90Z5eR3NiDl
niIfJYCccV2dqL+8SvEAWqCnXK/ViVFeTQfqf11SahS4Ste+vHW91sFrnew7gHb9
2sChygEsGq03iOOaVjXy0NArcCKWonAkzoxGtlTp1EWzfXNg5ApiydLfonlxofQk
t6DE3EGHq6fKaFy+fyTuIuKsqbfn2ucQ/yTXPxtnNThOIxTqj8VjMmfYgbiyMWHG
LIZ36o5sOblL1eFFYed+Dokg89hI5lJm6CCwc9/8WeTddX9wEZnRylgF9wSelQ+9
6PZrdfK7IqWC3Ugu+mI+xl0VjUj9jEdDMZNeus65xC7+3qRabOTsQxIIHDk4lM7J
DNxfVU2NNjM4Qh1FEC0JSVMlabW3Xk72OFilKf/OKJCxPAQUccjrI146yd1Ygqsc
diwzE94nkEeggYH1uPSfDeFT4t5l+jL0pSdVhjrMcnJBwVI/PjsR47a2YnrFqKUz
FQAKAbr/tJOM9sTsqaiZmMGh2lcMW8/pKZOwZoaA6YIM14jkchzNIpOyb/GRop9w
zf2VsG5UU5C4paW8yZ0sj5YyC+Ts2breiZJFNZzCmPsZzAH8wg8=
=rvku
-----END PGP SIGNATURE-----

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
