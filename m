Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8931C04A94
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4/aXslBpN7fGNJnMF/9oKWSZTJ6VSpIobENJ6nK8dE=; b=Uwl5a85rqed+JA
	LVyVjGhoRoMQwsWq0gI+mE1nb7DoKnKhekQ+SOhAYylNvS6dTz5YYfZjFZN5rve9zjVrEZ0QMad/y
	64MnSkWcVKpdidYxRlcKfRg/hpxM06CHsxNUDH3lLT9OE9LIqB+k6W2TjNCe1eu1qaReq3Sxe8FCx
	zaV7wQTcUo500dX05jXu7RW8Y987+LLVswebmNeKVSRptZe9BeI1xPiMfhjVc+7JBDY/vTBRoDAHh
	JtPosvZUKqKpTDtANM6xa7l/EC0doYyGHCdOdOJNWgrkb+54HqTB5UJ3DjTTBspQ2rxDUiwv/XbT8
	8AsirS+/cRWsCUdtioSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6Td-007Qvh-0w;
	Wed, 19 Jul 2023 12:40:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6TZ-007Quj-2L;
	Wed, 19 Jul 2023 12:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B172561671;
	Wed, 19 Jul 2023 12:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CEEC433C7;
	Wed, 19 Jul 2023 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689770415;
	bh=2Mh2IaKPPNhzRZYphoca+mrfCEIgr8Qop4RzoTlfeXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdnJnXZBopbW8ulNYqpU/DMRLnFvRdebMFTyM5ZbUz9uphIDnfM1bwXcJy4q98hV1
	 YvkNVBvKC8yohU9kFV2O9rZzsV6BHo+Gp7r57jtuzwT2EGjbSI3SGel3uViBRPEhBb
	 ip/PIfXyASkYOykVmYw18TlYUqquf6JTgcIuRtHIZikFIK7mW6+f54j0fN2gBg6Mo9
	 33y9RPC8lI3s6GaxlRiG4j0ziax6mnCs9g+lTmKKsuJzAhAhhCpC6roDYXyvQfy8DJ
	 QnH2m6TVUl1aV/rdXInE2gIEgG+xSamAjI3mkmHoaGPYauUBjJf5u1R0YwiqgRL3Hb
	 2sr2V6misyjqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Deepak Rawat <drawat.floss@gmail.com>,
	Dexuan Cui <decui@microsoft.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Khalid Aziz <khalid@gonehiking.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	WANG Xuerui <kernel@xen0n.name>,
	Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
Date: Wed, 19 Jul 2023 14:39:36 +0200
Message-Id: <20230719123944.3438363-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719123944.3438363-1-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_054017_845160_D5ADC809 
X-CRM114-Status: GOOD (  18.67  )
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

From: Arnd Bergmann <arnd@arndb.de>

The list of dependencies here is phrased as an opt-out, but this is missing
a lot of architectures that don't actually support VGA consoles, and some
of the entries are stale:

 - powerpc used to support VGA consoles in the old arch/ppc codebase, but
   the merged arch/powerpc never did

 - arm lists footbridge, integrator and netwinder, but netwinder is actually
   part of footbridge, and integrator does not appear to have an actual
   VGA hardware, or list it in its ATAG or DT.

 - mips has a few platforms (malta, sibyte, and sni) that initialize
   screen_info, on everything else the console is selected but cannot
   actually work.

 - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
   in the opt-out table and declare a screen_info to allow building
   vga_con, but this cannot work because the console is never selected.

Replace this with an opt-in table that lists only the platforms that
remain. This is effectively x86, plus a couple of historic workstation
and server machines that reused parts of the x86 system architecture.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/console/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 1b5a319971ed0..6af90db6d2da9 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -7,9 +7,9 @@ menu "Console display driver support"
 
 config VGA_CONSOLE
 	bool "VGA text console" if EXPERT || !X86
-	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
-		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
-		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
+	depends on ALPHA || IA64 || X86 || \
+		(ARM && ARCH_FOOTBRIDGE) || \
+		(MIPS && (MIPS_MALTA || SIBYTE_BCM112X || SIBYTE_SB1250 || SIBYTE_BCM1x80 || SNI_RM))
 	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
 	default y
 	help
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
