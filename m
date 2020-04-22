Return-Path: <SRS0=xrvF=6G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E361C5518B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 17:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756272098B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 17:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pI06OWav";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="R07/Fn6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756272098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3Ir0nx+YW9/Y/QoNsm4s9My9FST7EOEB7+Knipberc=; b=pI06OWav84fG7P
	UXlWSK6xdlccHypLn0hLT1kNGUi0t+WDBhe7s4IvpQS57sYUBBRIeHYPHWFdhcstufRMgguZQ28j+
	0E2a0hUxRUXc9hbAhLHWWcLFc7MqTmWYuGI2ZDEvvACLyzg5uZhjmNBh69vuI8vkaMsiGMJ9mUcap
	wc+XMvMq2UY15BRWS67fR3WYP4ZqN0gCOTi7+3AY9ZVRBJBuyWnG7HA5TzZzq2Ilxka4/q7yC2c4E
	NLKQdoorL5CYr2RRaxNya1u/qIvm9mDHlO8iXdpf7MJcvwVxOdZ6Dp0QqQArsIRL3JxjVQLgj5754
	k/Tt85uftjsjQQi/pO6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRJ77-0004RJ-1D; Wed, 22 Apr 2020 17:24:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRJ73-0004MM-Gc
 for linux-riscv@lists.infradead.org; Wed, 22 Apr 2020 17:24:42 +0000
Received: from cam-smtp0.cambridge.arm.com (fw-tnat.cambridge.arm.com
 [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0029F20776;
 Wed, 22 Apr 2020 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587576281;
 bh=VEbcVR+7QZ/PYnwd2O1oLeCPzDhFMpwwHDPF8q+T0CI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R07/Fn6kP2LSVbAqdS6J71pMci97ArrszezDwfrjti1NEg9DJ7QLAxwP0BNOow2B5
 flvWqxYghEZZlM4KmGEq0SOPLX5nF0ysKlcrrDE2ZQ3dyHxLRZkQH1vzVxEoWBH0pA
 xo+cmCSlBIyvwa3tq35NApTErz+ndw2oI8/DJhe8=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Subject: [PATCH v5 2/7] efi/libstub: Make initrd file loader configurable
Date: Wed, 22 Apr 2020 19:24:09 +0200
Message-Id: <20200422172414.6662-3-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422172414.6662-1-ardb@kernel.org>
References: <20200422172414.6662-1-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_102441_582895_07E761D8 
X-CRM114-Status: GOOD (  11.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Loading an initrd passed via the kernel command line is deprecated: it
is limited to files that reside in the same volume as the one the kernel
itself was loaded from, and we have more flexible ways to achieve the
same. So make it configurable so new architectures can decide not to
enable it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/Kconfig        | 11 +++++++++++
 drivers/firmware/efi/libstub/file.c |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 2a2b2b96a1dc..4e788dd55b03 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -124,6 +124,17 @@ config EFI_ARMSTUB_DTB_LOADER
 	  functionality for bootloaders that do not have such support
 	  this option is necessary.
 
+config EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER
+	bool "Enable the command line initrd loader"
+	depends on EFI_GENERIC_STUB
+	default y
+	help
+	  Select this config option to add support for the initrd= command
+	  line parameter, allowing an initrd that resides on the same volume
+	  as the kernel image to be loaded into memory.
+
+	  This method is deprecated.
+
 config EFI_BOOTLOADER_CONTROL
 	tristate "EFI Bootloader Control"
 	depends on EFI_VARS
diff --git a/drivers/firmware/efi/libstub/file.c b/drivers/firmware/efi/libstub/file.c
index ea66b1f16a79..ccdc36aaaa97 100644
--- a/drivers/firmware/efi/libstub/file.c
+++ b/drivers/firmware/efi/libstub/file.c
@@ -254,6 +254,9 @@ efi_status_t efi_load_initrd(efi_loaded_image_t *image,
 			     unsigned long soft_limit,
 			     unsigned long hard_limit)
 {
+	if (!IS_ENABLED(CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER))
+		return EFI_SUCCESS;
+
 	return handle_cmdline_files(image, L"initrd=", sizeof(L"initrd=") - 2,
 				    soft_limit, hard_limit, load_addr, load_size);
 }
-- 
2.17.1


