Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4C606A326
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=262f6g1a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0w4y3pq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KUNHETQP0k5fTPlvAWsHlJmZYWYWfhNriA7kDJ3gjb4=; b=262f6g1aBAScp1+E336nqD8VwC
	d5umDw8g6XDayfoa9zm5s01LcP9hmLIJEEl+/wvjCcUt6w3dayyZWBii/HhXKbN47lzmpcddhtTmX
	deUDAJLClOAel7YVMkCrq0GeZAqnEknAJ4CAasN0gT8oyNXCirNDvntHD9ZVDiCJltAEZPty0/DgO
	tQDb+Q55AiXaFmV/oadAnPPw/xSXzflbrxCVHt9JWoIYpfwOFJ/K9NOWtUNz10TgOif83obAR9uKt
	8MjlPScCm7QCWvvuI44A5iJxO/ywFA3ZJhko64Cxo1E9tgaO15Qwv4WGfX4mNCnF94jPLd0DOqcRe
	tXL8RQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTztJ-0000000BdlH-3wCT;
	Thu, 19 Nov 2026 11:01:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTztF-0000000Bdhq-3UZo;
	Thu, 19 Nov 2026 11:01:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D35C437DC;
	Thu, 19 Nov 2026 11:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128761F000C6;
	Thu, 19 Nov 2026 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086077;
	bh=NlUvq2HpnerQLH3flTbOZH1bj0OHRcxRHwUIA48QJc0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=K0w4y3pqXsaP3ubeldycHwHdzHusNNZ8UWp+6vQiAMiUx60nPEzsEI6UORCWk2eQM
	 Wr9MQq++PwU5z61f5LSDEP/iq4naKOipL4OMYf3DinFcFig10sjtTbY97erbnHEo4N
	 YUsiICY5uHAbdPH6LrzIgPYWrXrSB9l/2O0n7IlxkCsCvQCLsq4VEjI6XjjyL4rxmv
	 iQPAM4DO3b1e/YXAvLTi7iTezPwfGOpMZZWOUYfE8tL1pN806bFh5j5ih6yGAgPP1a
	 FfTA7G26gf/3dkJHKJphG6zjuFB4DY41xyN0dDytK5Ezt06txmdtB1kzNPaWLRDwgR
	 3LJf+KdeFvAjA==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,  Alexander Gordeev
 <agordeev@linux.ibm.com>,  Andrew Morton <akpm@linux-foundation.org>,
  Baoquan He <baoquan.he@linux.dev>,  Borislav Petkov <bp@alien8.de>,
  Catalin Marinas <catalin.marinas@arm.com>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  Geert Uytterhoeven <geert@linux-m68k.org>,
  Heiko Carstens <hca@linux.ibm.com>,  Helge Deller <deller@gmx.de>,
  Huacai Chen <chenhuacai@kernel.org>,  Ingo Molnar <mingo@redhat.com>,
  "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,  John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,  Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Pasha
 Tatashin <pasha.tatashin@soleen.com>,  Paul Walmsley <pjw@kernel.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Rich Felker <dalias@libc.org>,
  Russell King <linux@armlinux.org.uk>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Thomas Gleixner <tglx@kernel.org>,  Vasily
 Gorbik <gor@linux.ibm.com>,  Will Deacon <will@kernel.org>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  x86@kernel.org,  Alexandre Ghiti
 <alex@ghiti.fr>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,  Cong Wang
 <cwang@multikernel.io>,  Mark Rutland <mark.rutland@arm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  "H.
 Peter Anvin" <hpa@zytor.com>,  "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>,  Shrikanth Hegde <sshegde@linux.ibm.com>,  Sven
 Schnelle <svens@linux.ibm.com>,  WANG Xuerui <kernel@xen0n.name>,
  kexec@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org,
  linux-riscv@lists.infradead.org,  linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities
 in Kconfig.kexec
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org> (Mike
	Rapoport's message of "Thu, 19 Nov 2026 08:16:58 +0200")
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
	<20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
Date: Thu, 19 Nov 2026 11:01:06 +0000
Message-ID: <2vxza4n53x1p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19 2026, Mike Rapoport (Microsoft) wrote:

> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
