Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2E4C43461
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D15207DF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GyJQ08c6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FrcjBEN0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D15207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O8a95Di4CjggJ3Q6mX6kyyBjxqeWcfOB7QuR1dycKzg=; b=GyJQ08c6J3P5rOv3I4dW1Z6o6
	hQfH8j3hmkkAxvpFdajNPykd+t8eUDdRWsL0VB7QVisKDZtYY/HmUePXPl3ZDxFO6DgVmiQ4QLcM/
	UySl+g1RDSKOC86hGFpPv1eymm5huhyHpfgyfOaWSrcKeqz7lGctACwbRx3bEsSXSp3iV9OI48AhP
	IYI6+uY0hWAE5x+ewkIwQhbGo/NNjjJguvghGgviW+oCkBBR1jR/N1vonFtDzLVJacbEfaoRcAJAp
	nFS2K11QN696413gf3tcANYtUk7O/JqzsR5dsNAcLy4KC5proHCMLCUuVNs/FydjLGny1Dta8GHEA
	EpB108/0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBi3a-0006TQ-TJ; Fri, 28 Aug 2020 17:20:54 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBi3V-0006Nw-9K
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 17:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1598635249; x=1630171249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bk2Gh/XGM+blmye1lG7fqQWiRAnoRdaJAzm3HH3f+As=;
 b=FrcjBEN0cRSy921XA5X5tCMYRuB7jWkmxL3RLQ9qXyux2SB4Stm1DnYI
 QBvKduouSFCSVG1Un0lCp7aOQfjXgO8dod7zTtr+xQIb8tFuH9Iqzf8Bu
 kFHOo+Fw7LsCLGqrfvsNyCj5Q3TfCX3S/cRpPOOJiKYQvhpVZvK5q++W/
 mILHc5PzXj2sfxlk5asy+JfHKl4LAW5nfmUdKFfk8Td+D+Sjd5T4s0J7m
 ahSKjB2+0a4tI18buhS8tVuN9biE29/bj+xconRTk39G79Zb7yQZ1PgUs
 Ba0zeDtegWlx8U8uxURdbCQksEXfpYEMedG/KCtUpWgVf+7wyK4ey0crt g==;
IronPort-SDR: 6eKi4oAMt6nuKTkOQd2tZfnZEzOfAEcKCcixWumpxyhg3XSBhwhe8eEYtBX5HwKJPrw/IUcHYN
 7YztlTz0hA+Iqc9s0u6Ja8jDCcRwzwYaxgr9iZmNlRLy3gvhsbCh2Ec4NhzjbVhlbpW2goNLmF
 bAXhajGzBbjENrNMAczhUX8row57IE9W7Ixl4iV7HyGewlDW0dKib3JTUzJabtimZvXdYcJMKD
 D5XpUFlpwURVJGK/VsgcNOgfCP4LY0dDQ3OvnnKmL2dkqebgi/CO8BZeqSTQVeM/qgcG3G3DpL
 Dh8=
X-IronPort-AV: E=Sophos;i="5.76,364,1592841600"; d="scan'208";a="150414088"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2020 01:20:47 +0800
IronPort-SDR: XuzgbuC1WzIeyTFZuubd8JSEl1xRXuwsXLLMVnIJaKktp5HtQflDUBYKAmlSzmYtZsCS8CgnR8
 4GO4KHSYc0DQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 10:08:19 -0700
IronPort-SDR: DMKenj1WplxHGuwNbsjHFV9MHODA2RxucJWJVYnstOrk1zE0LPtdWpDesbHuzbEc3OTdIuabKx
 2Du80PCFXn3g==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.137])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Aug 2020 10:20:46 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/9] efi: Rename arm-init to efi-init common for all arch
Date: Fri, 28 Aug 2020 10:20:34 -0700
Message-Id: <20200828172036.8056-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200828172036.8056-1-atish.patra@wdc.com>
References: <20200828172036.8056-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_132049_528618_E8941CC4 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: linux-efi@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Ingo Molnar <mingo@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm-init is responsible for setting up efi runtime and doesn't actually
do any ARM specific stuff. RISC-V can use the same source code as it is.

Rename it to efi-init so that RISC-V can use it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
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
