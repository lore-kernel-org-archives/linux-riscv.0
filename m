Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064ABC10F04
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILuHpvqM2A4LL717iHLhBgiZ6DFfQKo6Qh0VlcKfOZg=; b=Kzf+VaQozejOdu
	6sB2McEUdMiI9GQEa2JTjFDhTO0aWDBhSvnJl2WsA9cH9wWuT+4wmNchxd8Zto30W614LQOJebGKK
	OPNJ/1fwciJKKL/F3GofrgeRdtYfCdQCwGG36FgFgAszJbI0MS33crUTOdShIenL8TmosVnJReLK1
	+adSGJW0FtRjVh8VHFX9L5z9ki/5ow5ByMAXDwcH+Bl4CqizPNMhLIqv9Xv/H37EbPKxOXdsV6BV7
	8+qtSiVVlJmPzV96ECtnaQM+VyF29R3r6CbA1ett8XM68y3GxX+IcLg9qT1dZvQ6+0buklSbrKmOc
	hvatv+SM0vbdNoh/NW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OD0-00FbK3-1Q;
	Sat, 02 Dec 2023 11:30:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OCx-00FbHN-26
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 11:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 56B38B8406C;
	Sat,  2 Dec 2023 11:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854DEC433C9;
	Sat,  2 Dec 2023 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701516649;
	bh=oaq++MapooJ2EycnyO1+1SBXzHdLUChecLPa1P5lthc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZeZCW75wrX6ms+WZ1Q1JgUt/WzAHbFZf1HVXg2hrKN0kBjzw08Dy8KNefoQkj8QC9
	 CIbXEeuGws/75/j8IxDFJPY7WGCDnK4OnHFcKM+Jy+ijxoxxT0eRNeOCgzbKzZgh+d
	 8+ISGPYJgWL7hHCdil9LwMReV/TUPNhlFWZ4gkZKwKtmSNzfEDBSYPB0+ng5k+iV9g
	 yckiS4b1k3jHwNDXGXit+F8HnicCnTOjKY3Nava6OZCxlh+d3jJ4iTookCYTDn7r1O
	 ap+b3UJE72tLvB5dAFCaf1nxn0htHgn+LPssyVIvrUVOub1zx7vN2eRPm3GyWkb6gY
	 K3uvO57syMwjw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Date: Sat,  2 Dec 2023 19:18:21 +0800
Message-Id: <20231202111822.3569-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231202111822.3569-1-jszhang@kernel.org>
References: <20231202111822.3569-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_033051_837628_BAB5CEEE 
X-CRM114-Status: UNSURE (   9.63  )
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
supports efficient unaligned access, for performance reason we want
to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
avoid performance regressions on other non efficient unaligned access
platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globaly selected.

To solve this problem, runtime code patching based on the detected
speed is a good solution. But that's not easy, it involves lots of
work to modify vairous subsystems such as net, mm, lib and so on.
This can be done step by step.

Now let's introduce RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
NONPORTABLE, if users know during config time that the kernel will be
only run on those efficient unaligned access hw platforms, they can
enable it. Obviously, generic unified kernel Image should enable it.

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
