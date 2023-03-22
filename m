Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50896C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r76TUdurgtSZeR9Zyre9CFmmMI4+ywx/68wQlpZ/KGc=; b=igNiWJCq/PikzZ
	UgDCOxORMMmwWXtJ1ZAQLyyP9yRPLShzYQfao/2hX+SQvy2Q1FVy7fkH77UfFLyCbDexeWDhqUrni
	HVnfvFF4CFBY6bT2GUP22zfhh9cMHpxK2cppD1bkNg3yyoUylKsJdULaHKt/VFeC/+4UX3JdMNxUn
	mRO4ehbOful2YaBa0Cgpt+u/2awxiwjlaA4IeddlgIAdk2/uT/04348L3CMXxW7lADRAmkiNe7XU7
	gjdBkDI7i3o6BbJW5wv30yc4uaq8bbrqgMoCGpzHpGUADOJmVmG2d7IeeJbk5SO6gDnJ7o5BqWeiP
	PwIXDiWGVAuh7NKthhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pexHX-00FsSW-0U;
	Wed, 22 Mar 2023 12:09:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pexHS-00FsQa-1I;
	Wed, 22 Mar 2023 12:09:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6F8BB81C39;
	Wed, 22 Mar 2023 12:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A80C433D2;
	Wed, 22 Mar 2023 12:09:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ingdh26u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679486960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvY46fd0vZ13Q/NmQURfWfLe6EF0yiYVFhbjH7fFs7M=;
	b=Ingdh26uTgL+AN1fOvu35JFST2YniG3PTzJicWjc5W9yyYF2h60NUnVJR9UbDD2TPUGlAp
	u8i7dV2T/DOrIM8ICunWgluYNu4zVTlXuvh19Hgs6mw27Ysq1OCE0mSnSr2G/4YPV193zm
	jQbSRUFloY7TwDg99rgsNfJ3CCs+oXY=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3165d7c0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 22 Mar 2023 12:09:20 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] riscv: require alternatives framework when selecting FPU support
Date: Wed, 22 Mar 2023 13:09:07 +0100
Message-Id: <20230322120907.2968494-1-Jason@zx2c4.com>
In-Reply-To: <ZBruFRwt3rUVngPu@zx2c4.com>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_050926_586972_25927263 
X-CRM114-Status: GOOD (  11.42  )
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

When moving switch_to's has_fpu() over to using riscv_has_extension_
likely() rather than static branchs, the FPU code gained a dependency on
the alternatives framework. If CONFIG_RISCV_ALTERNATIVE isn't selected
when CONFIG_FPU is, then has_fpu() returns false, and switch_to does not
work as intended. So select CONFIG_RISCV_ALTERNATIVE when CONFIG_FPU is
selected.

Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
Link: https://lore.kernel.org/all/ZBruFRwt3rUVngPu@zx2c4.com/
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..0f59350c699d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -467,6 +467,7 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
 config FPU
 	bool "FPU support"
 	default y
+	select RISCV_ALTERNATIVE
 	help
 	  Say N here if you want to disable all floating-point related procedure
 	  in the kernel.
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
