Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73BBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJUen71Zg7VT92MQ1f/nuLnZKxwKVQKskAnLv59ObTc=; b=rhXkVDy6JhwyNX
	i07H12Vgg6vsTNn/nIn3cJ9FFtbkSIf1Xr7d+m78ZAODITxgeMj9dVhGo6ZmPlgU3WlVUe+to6EH9
	PdoonY0gvTL9Vz18hDksoVGxEQq5U102yeUhTB3YL7+3Zji4iNVWpu1BiT0YuXvnXil4UjW9AK+KR
	m+4n8fcZDanxosOVO74x3ogvSx46CUQniyCbEdquWiFj6fvCxFO8SaqJI4cT1QQvFllaVf7GshXYL
	CRv+Wmuy9lZ2BooE0X7UfvGY9M1Io7GQHJrRyishRPNvIGejzcRXUrk6sVWh+2kL+Ouax4i3T9DC4
	dE/Iv22S0p+3v7xGrKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdVt-00HTvc-VM; Tue, 05 Apr 2022 07:22:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdOp-00HPax-RJ; Tue, 05 Apr 2022 07:14:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D349E615FE;
 Tue,  5 Apr 2022 07:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65104C34115;
 Tue,  5 Apr 2022 07:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649142886;
 bh=czcF1B6lamA2QE0/pzTN2aNL2pufxwZMl+tVG9rkf3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RJWOm7M3XXGmDosd3qRUX35iFS117oeOyg0m88AcYGHci3soFwkrSnRJkYjLyvBZl
 BtVhGrOs08GluxiCoLUt3DNWb2a6bdJNfZnZSUmKiTlJKpQJuHNyZtd3UqS80e90Ls
 aqHLZ0DaYiuEN3aqiOI6n1kQqV/eMeXkopBndYHDnS7tWb8i8xDf0+xh/5jHPpv1UE
 GjeZk5QASjUzv5VcVqM8QUJfjNTJGaSU4JYxZvjL1dqRqgn6z1MAnjDUyrm898lRdr
 QZliXcoWVqmMrdJ3VWEErBTHQc7sADJpMGtJVqrDwPQqmu0emi8jBrf9FovTGheWjw
 /N8GgOqJw9MDQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de, nathan@kernel.org,
 naresh.kamboju@linaro.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, heiko@sntech.de,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
Date: Tue,  5 Apr 2022 15:13:07 +0800
Message-Id: <20220405071314.3225832-14-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405071314.3225832-1-guoren@kernel.org>
References: <20220405071314.3225832-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_001448_010674_C8291D60 
X-CRM114-Status: GOOD (  10.18  )
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

From: Guo Ren <guoren@linux.alibaba.com>

If the current task is in COMPAT mode, set SR_UXL_32 in status for
returning userspace. We need CONFIG _COMPAT to prevent compiling
errors with rv32 defconfig.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/kernel/process.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 504b496787aa..b4421c16198c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -98,6 +98,15 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 	regs->epc = pc;
 	regs->sp = sp;
+
+#ifdef CONFIG_64BIT
+	regs->status &= ~SR_UXL;
+
+	if (is_compat_task())
+		regs->status |= SR_UXL_32;
+	else
+		regs->status |= SR_UXL_64;
+#endif
 }
 
 void flush_thread(void)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
