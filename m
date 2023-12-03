Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6161C4167B
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opwwsrToKt1T8OPXq1VYyY0uRQmMc98etzBzVqhxusU=; b=MzKBG97jkzKpAy
	17sB8Osd5AI3BgfQ9BtVVjxxZdxmQWor2Z3xplNGGcBuAI2dmdL0HZTaeZBG01/NKC9G2pu6i7A/N
	ukOx041HWcw+M8oPK0IH9p49hNFGgehgRA2wpCruKQhN5RkuYISvjR5LHYoo5CEp7xnk60M6GAEmf
	hKkHsVKN18b0ZhuqXXwg5mzj93lrhzV60QqUDj7XrF0i5bxAtvZvSw0QCgO7yWHq3H6r1JtrXlHTW
	TI0IZ7EwGFRJqErsWaftFNa8qjYWWohVz1WvYh+GHFQAkwrIf6sZRO9WmuOlpG0nOLGbZp+fry5Hx
	0tFRkHXBg7iB4etO3qBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9nB6-0006dp-2U;
	Sun, 03 Dec 2023 14:10:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9nB3-0006ZV-1t
	for linux-riscv@lists.infradead.org;
	Sun, 03 Dec 2023 14:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0524760C27;
	Sun,  3 Dec 2023 14:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C66C433CA;
	Sun,  3 Dec 2023 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701612629;
	bh=c3VWF+YhQlWgynBzGD9ffKWLf/aMfGwEbNyjhdaRP3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbWzBVf/UR4yv5Cp0G8WhSSQ384ppzLv/5r701R/0c1MD0woHqROVMOeNzp4L99/Q
	 CXlzhCeO6GssHUvSmheVJtYG0DxrkMlPSppERq60obNeK01/kpaAOY3lZlF/2yR2+d
	 RSPiLMVRa/WoaC5jwyiwY+G7boSPOrhzNyYzaavFVC1U8A3nSyHy61q429QY63KQSf
	 aSl3DCLDORHSFU+P3LdEOYOKV20PTRv26H1bPIx57US5oeDPcbc3Wwn3iYkP57YSeE
	 DWKJaIvCsnMvPkeoveRRzz8hMAUba1Z8HvQO7W8vf7HjepMKfUACJn/IkgXH0Q9Ihn
	 hi4xaCGUZvjGg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Date: Sun,  3 Dec 2023 21:57:52 +0800
Message-Id: <20231203135753.1575-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231203135753.1575-1-jszhang@kernel.org>
References: <20231203135753.1575-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_061033_751636_B87F9040 
X-CRM114-Status: UNSURE (   9.86  )
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

Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
support efficient unaligned access, for performance reason we want
to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
avoid performance regressions on other non efficient unaligned access
platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globally selected.

To solve this problem, runtime code patching based on the detected
speed is a good solution. But that's not easy, it involves lots of
work to modify vairous subsystems such as net, mm, lib and so on.
This can be done step by step.

So let's take an easier solution: add support to efficient unaligned
access and hide the support under NONPORTABLE.

Now let's introduce RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
NONPORTABLE, if users know during config time that the kernel will be
only run on those efficient unaligned access hw platforms, they can
enable it. Obviously, generic unified kernel Image shouldn't enable it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7f8aa25457ba..0a76209e9b02 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -654,6 +654,18 @@ config RISCV_MISALIGNED
 	  load/store for both kernel and userspace. When disable, misaligned
 	  accesses will generate SIGBUS in userspace and panic in kernel.
 
+config RISCV_EFFICIENT_UNALIGNED_ACCESS
+	bool "Use unaligned access for some functions"
+	depends on NONPORTABLE
+	select HAVE_EFFICIENT_UNALIGNED_ACCESS
+	default n
+	help
+	  Say Y here if you want the kernel only run on hardware platforms which
+	  support efficient unaligned access, then unaligned access will be used
+	  in some functions for optimized performance.
+
+	  If unsure what to do here, say N.
+
 endmenu # "Platform type"
 
 menu "Kernel features"
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
