Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B05606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jEQVMKIT;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dhANqH+F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QPyxgOTmEVSTLin9LWL2H7uBFaEqkRrrOIyoUcny76U=; b=jEQVMKITef7FVP7Ev7oka3LZkf
	EHocIzn6xNmTfWd62NwmZy2KbNdK0xCkCNPPcXSi355ipKK2y62sf2dY4GDQt8cIr0aLqDdmF9r4m
	9w1jE4w2GTi0JkfPUWcTNUUe6AlSgqloaDJHadXVRWVJqk2OSSp18wxG1brlpUALG6r4rDgcHruTK
	aEPEVospctAjigh3L9sPaxpbGLseU0S2bZX56YOA1y1O4MGUVI/yHpHm+oWsCigwJyj8/3v2SaDN4
	cwza+fHmqOhgcIhrNR2BM5cbx+0u4QqAyteQnv99unXaGT5kkxee62p61qTTALkG6pI1hdqyqgZQA
	g2Utjj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK95l-0000000FdYl-0qOa;
	Fri, 23 Oct 2026 06:49:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK95h-0000000FdXw-3DjT
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 06:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Te/e0WFVqv5SNjVug7VJizYyRLpsYmXm4GZX821MDrs=;
	b=dhANqH+FBtTJ3FlWh1L/2x6u+205aMiQvGAT77Qx+8kbGn70rKgswwDl7iGslVQuj29Gq5
	CXbMAW4NqK+wGk+g5AFZSdjFLxoDO8f6ABdsPGuU3NDfP2xMlyh/+NJWQBmPygFoUryKjx
	hZkkBJvnZoYviLMbQCtbOe2p80khvOs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-Gi1PK2XUM7a0J1ACcijeaQ-1; Fri,
 23 Oct 2026 02:49:18 -0400
X-MC-Unique: Gi1PK2XUM7a0J1ACcijeaQ-1
X-Mimecast-MFC-AGG-ID: Gi1PK2XUM7a0J1ACcijeaQ_1792738156
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 357A31800663;
	Fri, 23 Oct 2026 06:49:15 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 212681956095;
	Fri, 23 Oct 2026 06:49:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 00/13] treewide: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri, 23 Oct 2026 08:48:37 +0200
Message-ID: <20261023064908.66707-1-thuth@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: KU2BdxIkYGaZisUmfUxLd6E90OLAlOrzSjP_wxrg-xc_1792738156
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234925_885057_879934C4 
X-CRM114-Status: GOOD (  14.81  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembly and C source code.
However, all the supported versions of the GCC and Clang compilers (and
also other compilers like Tiny-C or PCC) define the macro __ASSEMBLER__
automatically already when compiling assembly code, too, so some kernel
headers are using __ASSEMBLER__ instead. With regards to userspace code,
this seems also to be constant source of confusion, see for example these
links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it makes sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurrences of __ASSEMBLY__ into __ASSEMBLER__ and
finally removes the -D__ASSEMBLY__ from the Makefiles.

I split the patches per architecture / maintained subsystem to ease
the review, and I also split the uapi headers from the normal ones in
case we ever decide that uapi needs to be treated differently from the
normal headers here and the patches would need to get reverted.

v5:
- To ease the review, I split some huge patches into smaller patches
  when there was a separate entry for the files in the MAINTAINERS file 
- Dropped the patches that were already merged
- Rebased the patches to the current master branch and fixed new
  occurrences of __ASSEMBLY__

Thomas Huth (13):
  of: fdt: Replace __ASSEMBLY__ with __ASSEMBLER__ in of_fdt.h header
    file
  smccc: Replace __ASSEMBLY__ with __ASSEMBLER__
  ARM: PXA: Replace __ASSEMBLY__ with __ASSEMBLER__
  ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in ptrace uapi header
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  asm-generic: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  uapi: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  asm-generic: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi
    headers
  include: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  treewide: Stop defining __ASSEMBLY__ for assembler files

 Documentation/dev-tools/checkuapi.rst          |  2 +-
 Makefile                                       |  2 +-
 arch/alpha/boot/compressed/Makefile            |  2 +-
 arch/arm/include/asm/assembler.h               |  2 +-
 arch/arm/include/asm/barrier.h                 |  4 ++--
 arch/arm/include/asm/cache.h                   |  2 +-
 arch/arm/include/asm/cp15.h                    |  4 ++--
 arch/arm/include/asm/cputype.h                 |  4 ++--
 arch/arm/include/asm/current.h                 |  4 ++--
 arch/arm/include/asm/delay.h                   |  4 ++--
 arch/arm/include/asm/domain.h                  |  8 ++++----
 arch/arm/include/asm/fpstate.h                 |  2 +-
 arch/arm/include/asm/ftrace.h                  |  6 +++---
 arch/arm/include/asm/hardware/cache-b15-rac.h  |  2 +-
 arch/arm/include/asm/hardware/cache-l2x0.h     |  4 ++--
 arch/arm/include/asm/hardware/dec21285.h       |  2 +-
 arch/arm/include/asm/hardware/ioc.h            |  2 +-
 arch/arm/include/asm/hardware/iomd.h           |  4 ++--
 arch/arm/include/asm/hardware/memc.h           |  2 +-
 arch/arm/include/asm/hwcap.h                   |  2 +-
 arch/arm/include/asm/irq.h                     |  2 +-
 arch/arm/include/asm/kexec.h                   |  4 ++--
 arch/arm/include/asm/kgdb.h                    |  4 ++--
 arch/arm/include/asm/linkage.h                 |  4 ++--
 arch/arm/include/asm/mach/arch.h               |  2 +-
 arch/arm/include/asm/mcpm.h                    |  4 ++--
 arch/arm/include/asm/memory.h                  |  4 ++--
 arch/arm/include/asm/mpu.h                     |  4 ++--
 arch/arm/include/asm/opcodes.h                 | 12 ++++++------
 arch/arm/include/asm/page.h                    |  4 ++--
 arch/arm/include/asm/pgtable-2level.h          |  4 ++--
 arch/arm/include/asm/pgtable-3level.h          |  4 ++--
 arch/arm/include/asm/pgtable-nommu.h           |  4 ++--
 arch/arm/include/asm/pgtable.h                 |  8 ++++----
 arch/arm/include/asm/probes.h                  |  4 ++--
 arch/arm/include/asm/proc-fns.h                |  4 ++--
 arch/arm/include/asm/ptrace.h                  |  4 ++--
 arch/arm/include/asm/system_info.h             |  4 ++--
 arch/arm/include/asm/system_misc.h             |  4 ++--
 arch/arm/include/asm/thread_info.h             |  2 +-
 arch/arm/include/asm/thread_notify.h           |  2 +-
 arch/arm/include/asm/tlbflush.h                | 10 +++++-----
 arch/arm/include/asm/tls.h                     |  4 ++--
 arch/arm/include/asm/unified.h                 |  6 +++---
 arch/arm/include/asm/unwind.h                  |  4 ++--
 arch/arm/include/asm/v7m.h                     |  4 ++--
 arch/arm/include/asm/vdso.h                    |  4 ++--
 arch/arm/include/asm/vdso/cp15.h               |  4 ++--
 arch/arm/include/asm/vdso/gettimeofday.h       |  4 ++--
 arch/arm/include/asm/vdso/processor.h          |  4 ++--
 arch/arm/include/asm/vfp.h                     |  2 +-
 arch/arm/include/asm/virt.h                    |  4 ++--
 arch/arm/include/uapi/asm/ptrace.h             |  4 ++--
 .../mach-footbridge/include/mach/hardware.h    |  2 +-
 arch/arm/mach-pxa/irqs.h                       |  2 +-
 arch/arm/mach-pxa/pxa-regs.h                   |  2 +-
 arch/arm/mach-sa1100/include/mach/bitfield.h   |  2 +-
 arch/arm/mach-sa1100/include/mach/hardware.h   |  2 +-
 arch/arm/tools/gen-mach-types                  |  2 +-
 arch/arm64/kernel/vdso32/Makefile              |  1 -
 arch/hexagon/include/asm/hexagon_vm.h          |  4 ++--
 arch/hexagon/include/asm/mem-layout.h          |  6 +++---
 arch/hexagon/include/asm/page.h                |  4 ++--
 arch/hexagon/include/asm/processor.h           |  4 ++--
 arch/hexagon/include/asm/thread_info.h         | 12 ++++++------
 arch/hexagon/include/uapi/asm/registers.h      |  4 ++--
 arch/loongarch/vdso/Makefile                   |  2 +-
 arch/mips/boot/compressed/Makefile             |  2 +-
 arch/mips/vdso/Makefile                        |  2 +-
 arch/powerpc/boot/Makefile                     |  2 +-
 arch/powerpc/platforms/cell/spufs/Makefile     |  2 +-
 arch/s390/Makefile                             |  2 +-
 arch/x86/boot/Makefile                         |  2 +-
 arch/x86/boot/compressed/Makefile              |  2 +-
 arch/x86/realmode/rm/Makefile                  |  2 +-
 arch/xtensa/kernel/Makefile                    |  2 +-
 drivers/firmware/efi/libstub/Makefile          |  2 +-
 drivers/net/wan/Makefile                       |  2 +-
 include/asm-generic/barrier.h                  |  4 ++--
 include/asm-generic/bug.h                      |  4 ++--
 include/asm-generic/current.h                  |  2 +-
 include/asm-generic/error-injection.h          |  2 +-
 include/asm-generic/int-ll64.h                 |  6 +++---
 include/asm-generic/rwonce.h                   |  4 ++--
 include/asm-generic/signal.h                   |  4 ++--
 include/linux/amba/serial.h                    |  4 ++--
 include/linux/annotate.h                       | 18 +++++++++---------
 include/linux/arm-smccc.h                      | 10 +++++-----
 include/linux/cfi_types.h                      |  6 +++---
 include/linux/compiler.h                       |  4 ++--
 include/linux/compiler_types.h                 |  8 ++++----
 include/linux/edd.h                            |  4 ++--
 include/linux/err.h                            |  2 +-
 include/linux/export.h                         |  2 +-
 include/linux/init.h                           |  6 +++---
 include/linux/ioport.h                         |  4 ++--
 include/linux/linkage.h                        |  6 +++---
 include/linux/mem_encrypt.h                    |  4 ++--
 include/linux/of_fdt.h                         |  4 ++--
 include/linux/pe.h                             |  4 ++--
 include/linux/platform_data/emif_plat.h        |  4 ++--
 include/linux/ti-emif-sram.h                   |  2 +-
 include/linux/types.h                          |  4 ++--
 include/uapi/asm-generic/int-l64.h             |  4 ++--
 include/uapi/asm-generic/int-ll64.h            |  4 ++--
 include/uapi/asm-generic/signal-defs.h         |  2 +-
 include/uapi/asm-generic/signal.h              |  4 ++--
 include/uapi/linux/a.out.h                     |  4 ++--
 include/uapi/linux/const.h                     |  4 ++--
 include/uapi/linux/edd.h                       |  4 ++--
 include/uapi/linux/hdlc/ioctl.h                |  4 ++--
 include/uapi/linux/types.h                     |  4 ++--
 scripts/Makefile.build                         |  2 +-
 scripts/gfp-translate                          |  2 +-
 scripts/headers_install.sh                     |  1 -
 .../tests/cmd_graph/test_savedcmd_parser.py    |  2 +-
 tools/include/asm-generic/barrier.h            |  4 ++--
 tools/include/asm/alternative.h                |  2 +-
 tools/include/linux/cfi_types.h                |  6 +++---
 tools/include/linux/compiler.h                 |  4 ++--
 tools/include/uapi/linux/const.h               |  4 ++--
 .../testing/selftests/kvm/lib/riscv/handlers.S |  4 ----
 .../testing/selftests/vDSO/vgetrandom-chacha.S |  2 --
 123 files changed, 229 insertions(+), 237 deletions(-)

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
