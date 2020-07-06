Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE25C433E2
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:27:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2257920724
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EgKNLdbw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="moE2DvrE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2257920724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1umPXkIVQHPQCS1yTh55sW4POQ14YuwTY5okvhadl7E=; b=EgKNLdbwr644mVsoLiDslnCIY
	V8n04dI2CkTyUwYJ+V7npzSRwXhB8XniTa5l2GyD6v0NvACjmQ+wzSw/GRdxFwD/r1js6ZTyIhgUf
	XlN95n13BwQkOZ8HdpA3Vi68q4aJ0S/eyS8l+gUAOmH9wfn0X4KPjr45IkrGReUFYFO4Azn2CLtJ+
	VcWGieIIaGXkXjrHLaFKVhnH36mtNL/lPk0HQrUw4lafZRQzAzDerFHy7woEB2VgrYwpXh5sqOb6G
	HJTaYZbd3T+d/t/5uGmKYIuypg7Tny8iiOkg/QyFa0AP3TlzKn1XcPDy1peiaw5ywuhEi7a4kaADT
	XFWZ0vh6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUtG-0002mH-6d; Mon, 06 Jul 2020 17:26:50 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUt6-0002aE-1z
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056401; x=1625592401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6HBziqjPfpEOovieQwcPFPkqxzZPptEH0FVtMgRIac=;
 b=moE2DvrEeIIHFXq6y9SY8Ws6N5HksNPUl0Q1plR+XBerRH7eVBJ+leTG
 QelY8+F0kO8agDwtMIUDMO8Bs8BzNwHPWsgc7tvs3RzvOuothLO7nn4uu
 WFWjja5+Ub8uBB3AyxPCkGIw18Q9BZAgmYkMpTNQTamOWsH2S7LbrgqwA
 emhkGbAkSkQ5sjfEe1kKUSLRZEp7vLQRJNNtYSUK1BX6+lGsXaGBcV7LR
 l5wKZ3sdrNC71h9gYE7uIqo0TBz12XRbugFlJNbOtIbwPhPc1WMA2kSKK
 Tw/6f2rSj+eccW+Wa7X5MZUqdzCoijiDTduUEXSmdgJ9+bp2P8rdjUUIq A==;
IronPort-SDR: gJZhRKwLiU1w9j8vYlkOpBUhRVbBA2+8W/j2UJIaTVuMmXsV9npM9E3l+Hre9LKA/Vcr1zWPkz
 QSP9+g1lM0xhgWRxxGlSw1f52m2bKCgPkSmMwb5zwCi1Hz7hYV+3El1u1kKWVqyau9xpDfcw1N
 1zWgPczzZBryTwEkrJJ0AOmnLLkv8mIzvRAKyDGfV4UDUDElvCd90QYv941tAgQcIH8AHabP/g
 YGup6K1J6C/bLOwRueE+3npKARGOrQz3Yqz4sG+XxkiBK429U41Gn9LiWyBvPZdbu0+glJd3y/
 eSg=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930689"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:34 +0800
IronPort-SDR: Z5YYtIqAZmoddZCD1dWOb8KdKY1Ob3UdB+LytCBKN3hXcqKEqcYrZ/UPru7qu0PlGO/SMI0tCm
 Kan26ueIZFKe1U917fo7CnkpVSMj96jSA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:14 -0700
IronPort-SDR: fc+bi6bmnTcCFuCWM/PJW/yBtOU6y4/pHTfXU1Clu5VWt4q9Ry8RKZYrjsn3CC61aOfXjrlJif
 vRay6P2HQtfQ==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:33 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 10/11] efi: Rename arm-init to efi-init common for all
 arch
Date: Mon,  6 Jul 2020 10:26:08 -0700
Message-Id: <20200706172609.25965-11-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132640_345569_38383135 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm-init is responsible for setting up efi runtime and doesn't actually
do any ARM specific stuff. RISC-V can use the same source code as it is.

Rename it to efi-init so that RISC-V can use it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/firmware/efi/Makefile                   | 2 +-
 drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)

diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 7a216984552b..61fd1e8b26fb 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -32,7 +32,7 @@ obj-$(CONFIG_EFI_EMBEDDED_FIRMWARE)	+= embedded-firmware.o
 fake_map-y				+= fake_mem.o
 fake_map-$(CONFIG_X86)			+= x86_fake_mem.o
 
-arm-obj-$(CONFIG_EFI)			:= arm-init.o arm-runtime.o
+arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o
 obj-$(CONFIG_ARM)			+= $(arm-obj-y)
 obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
 obj-$(CONFIG_EFI_CAPSULE_LOADER)	+= capsule-loader.o
diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
similarity index 100%
rename from drivers/firmware/efi/arm-init.c
rename to drivers/firmware/efi/efi-init.c
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
