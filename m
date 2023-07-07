Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDB3C001DD
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jrnvTVcSWMR1IYT/iz2+Rag/H78576Z0eHf0RVzmjuk=; b=q85rzbu4ziTchG
	AalJX7dWWO+0KGneFp3Q4cmXlB/6g4CyAclv+1Z6SAb4GC2DSOIC+gmy8QZBASW9/Zs/3aEfKHKJO
	d60fhkltGnXU8WWoveGuOCUBVpr9yAYRxCAHm23O59PQo6t4HNMKQoUOivOxJ4v/ogkJsVtMfopRE
	X/PAO5R3ZjzTpHXOE2iGVFuVlpWZZka5EpSU8h9eVC6erZNdW63s3X7UzEivVV42hU90PLshx5kGm
	arsOrY4IFQy++jTQ0ZICaqRSo4xfQgnkD6JDrx+tz7pav1a266ja4pGYOj0A8WGY3pzgeirvP038+
	Q9/2VGX+dIa16Z1MUHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHiAe-004Bit-11;
	Fri, 07 Jul 2023 09:54:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHiAc-004Bi2-0N
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 09:54:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9516761803;
	Fri,  7 Jul 2023 09:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981EDC433C7;
	Fri,  7 Jul 2023 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688723673;
	bh=1hp9hq9V97MqQl6Xw7YC6xzz3b8dnvVS9EeMnxTUvnE=;
	h=From:To:Cc:Subject:Date:From;
	b=TUQoYVULMKXh34CP4GMBwL2aMTC68aEwFjb4ToiO/+Qzq2SxrW6gzRmUmVk2fcpFH
	 Bioql9dPE6AooB8yzmlwm1/5GOklb1WnaixYCjsUszLm9k78NDsyPe21goIrea9oAQ
	 IRmLCrCAXgy2PbfcBhFPNsyL4HA2H1gcSQPtL8A+FL6o0ufqkIYWkr2VxE1kAYKGED
	 9PQvCgVcvsSIeiKyxfGRGJx2GXPbPbnuZwSob2rNxkr+7erC5ONplrWMYZ2glqWZOW
	 cNCDXz+ygEKZTdDDuhxYXbKgysoCSxYNoKk2t6egKT0K+70Ypy4PLpYxZQOGT+aiP7
	 tsQxY8Pa0rMwQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	dri-devel@lists.freedesktop.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org
Subject: [PATCH 1/4] vgacon: rework Kconfig dependencies
Date: Fri,  7 Jul 2023 11:52:23 +0200
Message-Id: <20230707095415.1449376-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_025434_215974_3CCE7356 
X-CRM114-Status: GOOD (  15.63  )
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

 - mips has a few platforms (jazz, sibyte, and sni) that initialize
   screen_info, on everything else the console is selected but cannot
   actually work.

 - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
   in the opt-out table and declare a screen_info to allow building
   vga_con, but this cannot work because the console is never selected.

Replace this with an opt-in table that lists only the platforms that
remain. This is effectively x86, plus a couple of historic workstation
and server machines that reused parts of the x86 system architecture.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/console/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index a2a88d42edf0c..47c498defc211 100644
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
