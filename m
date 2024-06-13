Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924DBC27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XdzUzh8/HLbcLI1FWd8wWRMdoF/8lnSljaLejarfzmQ=; b=PeoU0xWdCbYgBn
	asGGmKRcGjMZliICiaIxGCCStv6ubTSa9PRg6Ack/ZQFzp66xU1bubEFM3RKW7MJIFPZzVnUsZunH
	UU9LsLiMixuCO6jSKm4e0E+KDWhtEH9kRNMikWMZGRq2ReOwZr0klKNcKWQKZUDhd8nsvUYmu3AOi
	oA9CearGC/hSnEjuy52ra40U3fNGb+2FUv4h2Z9nwvL6UukVZQ813wwUTk26IHWKdEfQEBwfTJpFS
	3ahku2r3fYwL80Oem30tMqI3qzJeYV3BMlYHsS3CTqoM1uMxBOg1r5d0xlUnNQ22HxH/oTsc6Og1u
	Lg319e2IAXLJpyBP4Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHmd6-0000000HDpV-2Y5i;
	Thu, 13 Jun 2024 15:44:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHmd3-0000000HDnX-3xhQ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 15:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D841C61B14;
	Thu, 13 Jun 2024 15:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7B4C2BBFC;
	Thu, 13 Jun 2024 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718293484;
	bh=xoQncLJpBbEP+zyVvrGyI0JKEvpDoHxLakEhQebTzf0=;
	h=From:To:Cc:Subject:Date:From;
	b=k7XhJEk0iETmlFTsANemqhR3QEGu7+9Smi6jDNrqKVGHJJ/wvPqLv0VROmj/MKz8b
	 y79srEO5mcmfg0I/HlckIYSPxFi7b7RZp5Uk5Vt0knBXJ7YXeOtY3dGso4drrziSDR
	 uJL1W1eTOOAoVMaofkVfHV8wi5nswuAISbeWYgqCPLG50OizYnmfZCrIYFU4N0OAOX
	 F3Wox1BWhKmox+t7Crl4lt/ASkuFStI/NbGGvf9Ag74v2wurZ+09NIxyhNSL+mC4Ab
	 trLvs5KcDYL4p9odKyjnPfLfFLrzUgrAF3Ehvb4V1YMJ15DGkGmeX9dm3iYXwHaS1q
	 cZflr6aaCxl9Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH RESEND] riscv: boot: remove duplicated targets line
Date: Thu, 13 Jun 2024 23:30:53 +0800
Message-ID: <20240613153053.3835-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_084446_072243_D728EE97 
X-CRM114-Status: UNSURE (   6.05  )
X-CRM114-Notice: Please train this message.
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

The "targets:" is duplicated in another line, remove the one with less
targets.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index 8e7fc0edf21d..e051c677f6c4 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -20,7 +20,6 @@ OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 OBJCOPYFLAGS_loader.bin :=-O binary
 OBJCOPYFLAGS_xipImage :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-targets := Image Image.* loader loader.o loader.lds loader.bin
 targets := Image Image.* loader loader.o loader.lds loader.bin xipImage
 
 ifeq ($(CONFIG_XIP_KERNEL),y)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
