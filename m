Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449C1C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA972070C
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rwxZJIdB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VVRb5XAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA972070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=haOKVN2e1Tj3LLnUyFtHZoT6HjBuTffUCSA68E2X6Rg=; b=rwxZJIdB4kBkeEMKNPPegN0yX
	3zEptBf11tXB+ycGzUnb8MikhuBJrrSPrczl7TjrzCmAplBTTTKRjLQqLOP7/os2SR4Uh1zNuBMSZ
	n5+nN7CaU/DJVZDc+s/5VOFh3rgFCR1lRGLUCd5svzgR/eIWHq5iEimbm7Mood/kUFa/kKELrizTq
	uA6rSsSwf9bfv928XmES1CojHspo2JfBywdj6af2Kf2Uz3aymmpDgtaUvdI9gs1NaglwUUJUO7lUe
	hV80N/P4ba6CV+DKGwxpsSx855w4md6AtICYbK5YgjVMHqrivgTzqUEGk6KLYqzGyIdnNosFLfzRd
	l4lpDw8Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUt2-0002c3-Of; Mon, 06 Jul 2020 17:26:36 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUsz-0002Zt-I6
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056394; x=1625592394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5X06JHUw7otD1cmcj2n/lx5hX3r8VhRKMlY+7ax6kt0=;
 b=VVRb5XAxWo42xfDk7yfDC2ORGyzbpSQbJ7kdavhKsFk3AJ1eJGQlK7em
 4ZeWHlJUj67qTem1K1viRJ7V4jnFjaGgnPg8Hq/2EnJA87CyWyOyDBmwK
 JgJUz7pWIPqA7nJHAUxCkNM5xqbHd/BvBCDU3734739Mtwn5bNw2o0VpI
 870gx5DQJHd2TQBr8Ahg9OOdDIms150R5heqPWkiY0sPFooMcuUktlvkp
 ZSfBWw3yTwtrVzR22KIpp0m/opISWh3kN6GwJVKzuOSi/XK6/dm16waPG
 0f1ANnvn/vw5L941hY9/bS7/jt3oH8IswGbsvqp+2h45HzUvVRzNK6Uc5 g==;
IronPort-SDR: bdDwVXhmIdOcEPwYwXqKoOimp9zb0jzk+QOt/m2OrlMKrN8OK2dGX7aW6Z7+Fahei/XZJ81Sn8
 BM7w9CNoeTk39NRCsWjyGMNM/VYARhfo34V4aux2eI9S4kbYc89LiXX1l3NYqPf7rRhXOWIoFN
 PHc4is3fij7HyLe9mMCuoEXNlCRWL5tmTPd5r2gJcxfao/zL/oJs4jGX9E1kwYxZqUiyLoI44G
 uLtm52FW94zJt4aJb3ChLjO7/0DF1EibtDGRgJgamnereWKcX/LzUOxSHkdAtNd+A9H4N0077X
 eSk=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930677"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:31 +0800
IronPort-SDR: G5obp10YIlDxaZ62FoTXya0PyEPMkt0rrci1yFNt7tqllcyCw8xrL7Op05LVdGRda+vLqXS7yt
 B0+PofU2TALqiMo90euagG7r87tvdLZXY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:11 -0700
IronPort-SDR: 0rNpNsBq9dJOaB/dCBImZi7qAbAVgQqcgUJOA8uQYYQJVZAspFE89p4TnGiU1Hf8fagRuuQmdt
 XiMqzYA3FRDA==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 01/11] efi/libstub: Move the function prototypes to
 header file
Date: Mon,  6 Jul 2020 10:25:59 -0700
Message-Id: <20200706172609.25965-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132633_811070_C448CA17 
X-CRM114-Status: GOOD (  10.23  )
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

The prototype of the functions handle_kernel_image & efi_enter_kernel
are defined in efi-stub.c which may result in a compiler warnings if
-Wmissing-prototypes is set in gcc compiler.

Move the prototype to efistub.h to make the compiler happy.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/firmware/efi/libstub/efi-stub.c | 17 -----------------
 drivers/firmware/efi/libstub/efistub.h  | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 3318ec3f8e5b..a5a405d8ab44 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -121,23 +121,6 @@ static unsigned long get_dram_base(void)
 	return membase;
 }
 
-/*
- * This function handles the architcture specific differences between arm and
- * arm64 regarding where the kernel image must be loaded and any memory that
- * must be reserved. On failure it is required to free all
- * all allocations it has made.
- */
-efi_status_t handle_kernel_image(unsigned long *image_addr,
-				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
-				 unsigned long dram_base,
-				 efi_loaded_image_t *image);
-
-asmlinkage void __noreturn efi_enter_kernel(unsigned long entrypoint,
-					    unsigned long fdt_addr,
-					    unsigned long fdt_size);
-
 /*
  * EFI entry point for the arm/arm64 EFI stubs.  This is the entrypoint
  * that is described in the PE/COFF header.  Most of the code is the same
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 2c9d42264c29..85050f5a1b28 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -776,6 +776,22 @@ efi_status_t efi_load_initrd(efi_loaded_image_t *image,
 			     unsigned long *load_size,
 			     unsigned long soft_limit,
 			     unsigned long hard_limit);
+/*
+ * This function handles the architcture specific differences between arm and
+ * arm64 regarding where the kernel image must be loaded and any memory that
+ * must be reserved. On failure it is required to free all
+ * all allocations it has made.
+ */
+efi_status_t handle_kernel_image(unsigned long *image_addr,
+				 unsigned long *image_size,
+				 unsigned long *reserve_addr,
+				 unsigned long *reserve_size,
+				 unsigned long dram_base,
+				 efi_loaded_image_t *image);
+
+asmlinkage void __noreturn efi_enter_kernel(unsigned long entrypoint,
+					    unsigned long fdt_addr,
+					    unsigned long fdt_size);
 
 void efi_handle_post_ebs_state(void);
 
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
