Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5A9CD98DE
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 23:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIY65Q+P8QWRAafYva/9ljgaOWHvdiVQOi5qwLP1Yhs=; b=w8FRbHVlCE7KkN
	pQ5ZGqA7JC4sSSzbptqfcVppm0TLusF1OyX2qLe8aU8cxoO0rUCLl4P1SmngvXjRLIEXuDsTdoMYB
	htOgtm40x7AWZHXLqFWK73Uvthcs1UW82Gg8SaYX2XcyG2AE4rdeyb5OJANnIl6UGmrTnFBKuX7LB
	hj9/E3QNlnX2Agz7EfguQGAG3jBzb3UNIxmXyr4MkE8/NXy8hdc5EC3G6a+QfNo0fviDHHflVgoNR
	43Osu+7z1OZbAjuafRZRxDpBLznY1h7UQDC6NfIjgkPScO7c8Kzw7HkzzSKwA/LYSJJR/Ij/fuEYi
	XxobnC9GucjyQfbA/Brw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGjZ-0000000EwOk-2MVr;
	Mon, 15 Jun 2026 23:28:49 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGjX-0000000EwNu-1edY
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 23:28:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781566124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dY5mBb64gTkFKsOa15ef2GQOxLaHZRK6NOzG/t/3yRw=;
	b=QI7Xs72Azf722gJqQ9cxaQjtSQ2xaEoF0Yx9/zYgWZ8cg8CSmHYZ/3MUQeOVl4iXFWi5rw
	4IfbQ2o/aGn2LnsoR+uitpfCW3KKYR5oOUjhrewjn2yrumkeugfkJDGJXQKJsrpTNcc4iU
	IT3vfho4jKUK/5WGfOlwilLILY/zboQ=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 15 Jun 2026 16:28:22 -0700
Subject: [PATCH 2/2] riscv: Restart via EFI runtime services when available
MIME-Version: 1.0
Message-Id: <20260615-efi_reset_shutdown-v1-2-9414edcbbab0@meta.com>
References: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com>
In-Reply-To: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com>
To: Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@meta.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_162847_604210_937BC673 
X-CRM114-Status: UNSURE (   7.57  )
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

From: Atish Patra <atishp@meta.com>

Firmware-preferred reset and EFI capsule update support requires reset
via EFI runtime services rather than direction M-mode firmware invocation
via SBI. Unlike poweroff, restart mechanism is directly controlled from
machine_restart function though.

Prefer the EFI runtime ResetSystem() service for restart when UEFI
runtime services are available.

Signed-off-by: Atish Patra <atishp@meta.com>
---
 arch/riscv/kernel/reset.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 912288572226..541e2162c85a 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
 
@@ -17,6 +18,12 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	/*
+	 * UpdateCapsule() depends on the system being reset via ResetSystem().
+	 */
+	if (efi_enabled(EFI_RUNTIME_SERVICES))
+		efi_reboot(reboot_mode, NULL);
+
 	do_kernel_restart(cmd);
 	while (1);
 }

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
