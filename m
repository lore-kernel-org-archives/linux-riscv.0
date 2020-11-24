Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AC7C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 18:58:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A621B206C0
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 18:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JAKfiq88"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A621B206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ih/pBbE9WX9g2ewqNqhafFRF0WuKfTBY9TepUiC7vR8=; b=JAKfiq88tbOorn2+sRpujsVbxI
	FZKkNdOvNI25Pr93YjtaOEV3NVZWCyx8kZSmbEqIOojc4aEsevARNweP1ieF0F9mbvGksfUj4sbxY
	k5QR+c6VZhSbqJsl4JwytLDiJbke2zcTCLxdFEDhQckLMuVBVUdLpm7ywL91voE5GEjPqr5Rnpj0W
	Mw/9bepfM/sz7CE7RoX7gjaxtv9EVGVN/tX0geMHiWWGscRVCpHOaAfLCuEOKltLN/P9b/1X/7lNs
	Rc1U8t2YYgGZQ4hNsZ05vQrz+2bp9yTlV5R/wUKhrjC6Cq47BRtrBNOCGCVjBCDIiVqYOMyoxqhk6
	sgB2I5Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khdVi-0003qm-FR; Tue, 24 Nov 2020 18:57:54 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khdVg-0003pR-DB
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 18:57:53 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id wJxg2300q4C55Sk01Jxglf; Tue, 24 Nov 2020 19:57:44 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1khdVU-005WMp-Cs; Tue, 24 Nov 2020 19:57:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1khdVT-00ErGj-Rb; Tue, 24 Nov 2020 19:57:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Date: Tue, 24 Nov 2020 19:57:38 +0100
Message-Id: <20201124185738.3541314-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_135752_608298_4F6CC39E 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There is no need to enable Virtual Terminal support in the Canaan
Kendryte K210 defconfigs, as no terminal devices are supported and
enabled.  Hence disable CONFIG_VT, and remove the no longer needed
override for CONFIG_VGA_CONSOLE.

This reduces kernel size by ca. 65 KiB.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Against k210-sysctl-v15
---
 arch/riscv/configs/nommu_k210_defconfig        | 2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index df89d53bd125679b..9262223037e43479 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -48,6 +48,7 @@ CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
+# CONFIG_VT is not set
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_LDISC_AUTOLOAD is not set
 # CONFIG_HW_RANDOM is not set
@@ -67,7 +68,6 @@ CONFIG_GPIO_SIFIVE=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_NEW_LEDS=y
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 3d2cb4747e7f85b7..4cd1715dd0cf3747 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -41,6 +41,7 @@ CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
+# CONFIG_VT is not set
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_LDISC_AUTOLOAD is not set
 # CONFIG_HW_RANDOM is not set
@@ -60,7 +61,6 @@ CONFIG_GPIO_SIFIVE=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_MMC=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
