Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF60BC47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3EWkWi+ZNpwyiHnX5WPSF4CYgRCjcX0d0vVZAylr2A=; b=HFBI414E4jmSb6
	YzUkZ2JMUXqlnfJ3LSBWPHnsV/R4wN/ipaPXUZzZ4S1TX6EMh9poJLGJ4HZ7DhrpHVL7alxtXWwTt
	unKyq5ZlsmQVNUkhKKHt/+JfWSojs5FMhFsLQ2lGOaPEJgNVVoe+OkSlt9NQCfiZWiOS1Hugpmkvv
	XYoomSuLpoPslwEEVnsb4g4BA0+niuqyuV0grq5nyc+RUltggKJSEunh4UeUmsUhDNOTKpHRhiWer
	kr7mlJudU6P8I11KRN2kDbI4Y7UALnoxykZJhMKXQLTfbfyGhcaNOxXQLDmpo7oIyfgWbpBQ/uMe7
	MatAQsIvKnOibDePwpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8di-00000002JLa-2QSe;
	Thu, 25 Jan 2024 22:56:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8de-00000002JJK-1K8w;
	Thu, 25 Jan 2024 22:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7A55622B3;
	Thu, 25 Jan 2024 22:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DA3C433F1;
	Thu, 25 Jan 2024 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706223360;
	bh=Bx1oIdTdd86nzue6xvhtwCp4wPQwGjG0ILCqZqgINO8=;
	h=From:Subject:Date:To:Cc:From;
	b=u/k5uY+I+ALGKvsZhJOKy+elEEMTuGK4js+9E2aa8C+jdW7zCUmcFB09uzv+3CoZu
	 FWBWHBaHi7qqt5eN22oRGai4acZwbSD7+wTeYGd4bp/1BTWPKdzypKh5/upZuxCBTI
	 DwwCb0OmIwH8ErHvyqJ9tF2AwVh/f9Tc6jYY5uvefvVeofbszLGkSgD9Psw/Y/fOqO
	 4JubQhTEYhKN/h+N4+luvLNiDNT38sywwwjB3NkWClFOXDzTsmqYGb6NEb82khEZvP
	 LyqTCcJ5Mv1GCoc5ko76xtnLjFlNccOpbLWrEyB9x/zp7+IcLe5lDiJ5iq6cetYBpb
	 6LFQ6NVeleKSA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/11] Bump the minimum supported version of LLVM to 13.0.1
Date: Thu, 25 Jan 2024 15:55:06 -0700
Message-Id: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMrmsmUC/x3MQQqDMBAF0KvIrPshkwSpvUrpojajHTBREhsK4
 t0bunybd1CRrFLo1h2UpWrRNTXwpaPX+5lmgYZmssZ6w9Zj/MQNUROWpUZUydhXsIMBww3T1Yf
 g+pEHasOWZdLvf78/zvMHzVeZdG0AAAA=
To: akpm@linux-foundation.org, masahiroy@kernel.org
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, tglx@linutronix.de, mingo@redhat.com, 
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
 linux@armlinux.org.uk, ardb@kernel.org, 
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
 will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au, 
 npiggin@gmail.com, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, 
 linuxppc-dev@lists.ozlabs.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, conor@kernel.org, linux-riscv@lists.infradead.org, 
 keescook@chromium.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5041; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Bx1oIdTdd86nzue6xvhtwCp4wPQwGjG0ILCqZqgINO8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbnv0VWied95P5q0eXfkzlxrZNofbTU+K5bbiVjef9U
 LF9Lp/YUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbyoJSRYdfLJeuavmdyeR6u
 +xn7PM6bZ9E7RT/WZzFKl4VUYs0DHjEyPAwMYX+6+56b/awFIlsKOvdcOn9vr4jAiuMznF5/qmc
 T5wMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_145602_493308_810609E4 
X-CRM114-Status: GOOD (  17.55  )
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

Hi all,

This series bumps the minimum supported version of LLVM for building the
kernel to 13.0.1. The first patch does the bump and all subsequent
patches clean up all the various workarounds and checks for earlier
versions.

Quoting the first patch's commit message for those that were only on CC
for the clean ups:

  When __builtin_mul_overflow() has arguments that differ in terms of
  signedness and width, LLVM may generate a libcall to __muloti4 because
  it performs the checks in terms of 65-bit multiplication. This issue
  becomes harder to hit (but still possible) after LLVM 12.0.0, which
  includes a special case for matching widths but different signs.

  To gain access to this special case, which the kernel can take advantage
  of when calls to __muloti4 appear, bump the minimum supported version of
  LLVM for building the kernel to 13.0.1. 13.0.1 was chosen because there
  is minimal impact to distribution support while allowing a few more
  workarounds to be dropped in the kernel source than if 12.0.0 were
  chosen. Looking at container images of up to date distribution versions:

    archlinux:latest              clang version 16.0.6
    debian:oldoldstable-slim      clang version 7.0.1-8+deb10u2 (tags/RELEASE_701/final)
    debian:oldstable-slim         Debian clang version 11.0.1-2
    debian:stable-slim            Debian clang version 14.0.6
    debian:testing-slim           Debian clang version 16.0.6 (19)
    debian:unstable-slim          Debian clang version 16.0.6 (19)
    fedora:38                     clang version 16.0.6 (Fedora 16.0.6-3.fc38)
    fedora:latest                 clang version 17.0.6 (Fedora 17.0.6-1.fc39)
    fedora:rawhide                clang version 17.0.6 (Fedora 17.0.6-1.fc40)
    opensuse/leap:latest          clang version 15.0.7
    opensuse/tumbleweed:latest    clang version 17.0.6
    ubuntu:focal                  clang version 10.0.0-4ubuntu1
    ubuntu:latest                 Ubuntu clang version 14.0.0-1ubuntu1.1
    ubuntu:rolling                Ubuntu clang version 16.0.6 (15)
    ubuntu:devel                  Ubuntu clang version 17.0.6 (3)

  The only distribution that gets left behind is Debian Bullseye, as the
  default version is 11.0.1; other distributions either have a newer
  version than 13.0.1 or one older than the current minimum of 11.0.0.
  Debian has easy access to more recent LLVM versions through
  apt.llvm.org, so this is not as much of a concern. There are also the
  kernel.org LLVM toolchains, which should work with distributions with
  glibc 2.28 and newer.

  Another benefit of slimming up the number of supported versions of LLVM
  for building the kernel is reducing the build capacity needed to support
  a matrix that builds with each supported version, which allows a matrix
  to reallocate the freed up build capacity towards something else, such
  as more configuration combinations.

This passes my build matrix with all supported versions.

This is based on Andrew's mm-nonmm-unstable to avoid trivial conflicts
with my series to update the LLVM links across the repository [1] but I
can easily rebase it to linux-kbuild if Masahiro would rather these
patches go through there (and defer the conflict resolution to the merge
window).

[1]: https://lore.kernel.org/20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org/

---
Nathan Chancellor (11):
      kbuild: Raise the minimum supported version of LLVM to 13.0.1
      Makefile: Drop warn-stack-size plugin opt
      x86: Drop stack-alignment plugin opt
      ARM: Remove Thumb2 __builtin_thread_pointer workaround for Clang
      arm64: Kconfig: Clean up tautological LLVM version checks
      powerpc: Kconfig: Remove tautology in CONFIG_COMPAT
      riscv: Remove MCOUNT_NAME workaround
      riscv: Kconfig: Remove version dependency from CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE
      fortify: Drop Clang version check for 12.0.1 or newer
      lib/Kconfig.debug: Update Clang version check in CONFIG_KCOV
      compiler-clang.h: Update __diag_clang() macros for minimum version bump

 Documentation/process/changes.rst |  2 +-
 Makefile                          |  8 --------
 arch/arm/include/asm/current.h    |  8 +-------
 arch/arm64/Kconfig                |  5 +----
 arch/powerpc/Kconfig              |  1 -
 arch/riscv/Kconfig                |  2 --
 arch/riscv/include/asm/ftrace.h   | 14 ++------------
 arch/riscv/kernel/mcount.S        | 10 +++++-----
 arch/x86/Makefile                 |  6 ------
 include/linux/compiler-clang.h    |  8 ++------
 lib/Kconfig.debug                 |  2 +-
 scripts/min-tool-version.sh       |  2 +-
 scripts/recordmcount.pl           |  2 +-
 security/Kconfig                  |  2 --
 14 files changed, 15 insertions(+), 57 deletions(-)
---
base-commit: 979741ebd48f75ed6d101c7290e3325340d361ff
change-id: 20240124-bump-min-llvm-ver-to-13-0-1-39f84dd36b19

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
