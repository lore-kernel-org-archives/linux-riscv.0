Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45B2C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 10:24:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E274D64FB1
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 10:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E274D64FB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p7WCIWIxpytsRM1QRjNw+TQnZG44mJudEFZK+xSw7pI=; b=Gff/TBVzDNUAGt
	8jdWt81/3topAbBhNDDJqSnJ4v3xApfdYpOz2XmIISufwFk87IWnHpjh0zAcbbyxSY1Hyf32FwP7f
	xxdaNihlr9s7T71ShOkPxU7SPm10L24duFOzQUsyoVYEZvpTqCdsFPBKbruTCeBQjnlxX/k+OPqVS
	WsbSNYgJlnmXk1gJ3u+gki+BIDZDvpQgK3CDASHSWzLc0Ah6+KropR60P9VasWDi2zKP3xJF1AC1I
	ua/JJBnJe8iVe9zbpPtDBr2E+IOUbPLKeqPEiNDbjCz7PPRIogcK/uPlrgnVioxrMoZI5T7logggD
	kPt/zbenTbUxMn9GBFJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKIUg-008pVE-W3; Thu, 11 Mar 2021 10:24:39 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKIUc-008pUM-Nc
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 10:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615458310; x=1646994310;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SbWEtgZn54yqn4ojnoNKqMeFxkUMf9TNxxN9NLwAkg4=;
 b=nTwKEDRtpreehZMHdNbSngPuSkOl1vnGHcNC3oPKbtrbi0C6+LXWq5ac
 44ox/W/9UvIP3rE7F0ONYZz+Lmii+AYmJxhUDM0bIteCY6WfyaeY+CMdP
 SBxvrDIBXuQi2qD7qha7Szjtfv1EK4mZAQTeeM2y3/9Yx6d9trjb+34j4
 hBVUfdlfagQ3LpdnYfwQz0js+GcZYW6W6hbmUWU5he4yQU0kdxp8FgnAM
 r0Nrq6WXIHW6qXjMgCPm2TUb3HWuWKqaVcOK84O6MpIjpqom5AtPSIl9P
 h0rfPfMS3k/DdxW3LnyyzLjPN9GwwGY8U6aZPCnAwSBIuWQ/KREkp3GGO g==;
IronPort-SDR: /02/QuUROJ0KprlBW0Tiqaa0FA0FMkiOHfFJpxELdFdcpf5DrTaL5MnsSGl0eUiGX14fbHsQS5
 ZFuub7Ih2dLb5wIgzncN6046bO3pOQV2layd6zDAh7uh9NBjWf/qIoRnclRz8TsALfsl0cg9I7
 D/qbXV5IibWyhfxIoHgC88LiCtmD+DmSyyA0vVO6Wm+X0cMnWZED1mLqae9f0xj2GDQ4Kv40Vw
 fZbU+42O3oVY4iWwLgYil0wbfkFbhKgEgOmJd4sR9f3YO/T0tWKGQ2SFxcR4arczNpvsVsbXxS
 0RA=
X-IronPort-AV: E=Sophos;i="5.81,240,1610380800"; d="scan'208";a="266253479"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Mar 2021 18:25:04 +0800
IronPort-SDR: gevssWJKnIPCi4vTZbmzfQPmQOPECKXsgTcaG7O+I2Z5TPKbimN0LD1LkacXU8cjL0HIIFtLIt
 PkxJfCdiu2T46YPWXAVXo/on5kT5wmaSxVO1w20revI19YLiw2t32n7R+fh+ZC/6NWlqGDCyUl
 REceV/CHovSpILRf9Q6WeiP7bO7QljYDsuqL7vYcFSCuq4sr7LKpzJEq04FX3rmGPUH5OBRjoh
 uHwoL9if4D+Ko4tB9dJEpBup4SlTjJpb9SR4f7tcZ+mRALI4Llx4FwCxjL5IZyP2c8sKTO+NZh
 UpXKdIVyCo54h+5mccq6e5ty
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 02:07:09 -0800
IronPort-SDR: AlUY+bJPOY0BEXIoRE8ls4qTUK+qKUWJpCvr9T2S3FPAqqicBPNwCYdCocvjJtpKPW6VO5nU4p
 d5CndwDyNcVoTcWgYt7K7SUhehtSfNw/CgujPA44yIhJIYh9ZzIUytGYV2YKaZBPBXNpLSKhRd
 LqwJBzjYObHcfbvB6MrU04fBMHjq64GRBoLGDhZpnJVfTUT5U4Ck6tzLg7tquZqfZRY2umuC/x
 lGWQmq5sXvVr7uk2D+mp3EaWJg5xhk56u99wgsB+WvQAirbBI3c6opIsz4zYx09IUECAcF4ey6
 yc8=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Mar 2021 02:24:29 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Fix compilation error with Canaan SoC
Date: Thu, 11 Mar 2021 19:24:24 +0900
Message-Id: <20210311102424.34743-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_102435_338700_49E5512F 
X-CRM114-Status: UNSURE (   8.96  )
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

When CONFIG_SOC_CANAAN is selected, the K210 sysctl driver is always
compiled. Since this driver early init function calls the function
k210_clk_early_init() implemented by the K210 clk driver, this driver
must also always be selected for compilation ot avoid build failures.

Avoid such build failures by always selecting CONFIG_COMMON_CLK and
CONFIG_COMMON_CLK_K210 when CONFIG_SOC_CANAAN is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 7efcece8896c..e1b2690b6e45 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -31,6 +31,8 @@ config SOC_CANAAN
 	select SIFIVE_PLIC
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
+	select COMMON_CLK
+	select COMMON_CLK_K210
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
