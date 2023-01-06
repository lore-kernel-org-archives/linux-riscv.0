Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92EDC5479D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v4ttE1jOFxCMMasY4SbBmJMjnVdG195clYF1prtZLr0=; b=Q8xNylAF0kHyr9
	bgUNCu9afkTiwHSjXC4VYISXU/0ofI36QJcPWW/PvUiUhV+3b5ItUCh1PdfGBaMRE12HL4JvJSu61
	nzFGQY5KmZUdmZtAPafUYMIRX7+3DQ4l1ZRpvDTfx0Wva8FC8hjtDdD0hGEicwbw0fBmOmm75qvVM
	UeH5LnOsHkHji4ghmbVD9wYQx+qWZ4RhMc06deKV45Cq1R+yKUYPC0PnjO0FxqrKmldjw5MY4aNDi
	nFkPR4sHLo5k0XWFfIjGi/6xLeUspMJS+6Iivra+5vIsqKybr5mnis7ferMRiP2B1c9+Co6kaeF/I
	p6vtiNjbOwWdbbDNUHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDpKe-009mbZ-8O; Fri, 06 Jan 2023 16:12:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDpKb-009mah-MN
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 16:12:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id EA116CE1CFC;
	Fri,  6 Jan 2023 16:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93289C433EF;
	Fri,  6 Jan 2023 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673021549;
	bh=VVqoRkUDwnsCIlYEoiqptxZQONeF/KwdyouDY3AymiQ=;
	h=From:To:Cc:Subject:Date:From;
	b=R7mi1oekbqGue9wYgiHJm224AXmui6dnEfJSRFh1ULEJtO7EUWn8+YA7bqh41Z8RH
	 1GQorgYPL5mqv8EjYc5yIPihjDLq+8Lui48HhgSE6F4Fta8vgANOUsJJmUyS0ky1oA
	 C1JzuVo+8RvqdILCmM0riVmzE7/srsvJSapkVLaqsK8oc5BjZr/XEvMLq45oYKwroA
	 YQyg0Eaa607TFSrV+ALJQMa/o7FOCNP4XjdYDDx4jIj0jWcwRRNDIQip33MpGqmUOE
	 EHwDNlnsyho1FKz2ZBdfEBPsL5iRXXX3hQvQ25djwITr8GqNlW4kXmV9uE1p7Oqxov
	 lpsQPOBOaE/4Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Myrtle Shah <gatecat@ds0.me>
Subject: [PATCH] riscv: fix -Wundef warning for CONFIG_RISCV_BOOT_SPINWAIT
Date: Sat,  7 Jan 2023 01:12:13 +0900
Message-Id: <20230106161213.2374093-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_081233_941932_0CB31EAE 
X-CRM114-Status: UNSURE (   9.96  )
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

Since commit 80b6093b55e3 ("kbuild: add -Wundef to KBUILD_CPPFLAGS
for W=1 builds"), building with W=1 detects misuse of #if.

  $ make W=1 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- arch/riscv/kernel/
    [snip]
    AS      arch/riscv/kernel/head.o
  arch/riscv/kernel/head.S:329:5: warning: "CONFIG_RISCV_BOOT_SPINWAIT" is not defined, evaluates to 0 [-Wundef]
    329 | #if CONFIG_RISCV_BOOT_SPINWAIT
        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~

CONFIG_RISCV_BOOT_SPINWAIT is a bool option. #ifdef should be used.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b865046e4dbb..4bf6c449d78b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -326,7 +326,7 @@ clear_bss_done:
 	call soc_early_init
 	tail start_kernel
 
-#if CONFIG_RISCV_BOOT_SPINWAIT
+#ifdef CONFIG_RISCV_BOOT_SPINWAIT
 .Lsecondary_start:
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
