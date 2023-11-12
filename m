Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0480C4167D
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWtol93mQiyolF301G6ZtAqwgAwey8TWZnXc8rcIHmc=; b=BB6IiXXlGKlPWF
	IsErNRXqxGUeizLgLlVsCrfOak6BXvo5bQHSOAqKlANxDgnWe9/nh7FtNmNaxV5Eshi/xtGAz1miy
	jfkrlvx46AcrmIVodazmHLieHw1kpjecZj6BTJY45HBU16AM9JtgTHnzZeQPsildO9FT/0cO09KTq
	iGIbY+druGRzG0CzYJdtkQDmALpGwEvmI1d7ptrZQuXaCrrJl+5tVzfNJM4Df1DJ9dYv4sFZm1puA
	kXmZPUm8sxo/15InMzX+2F6ZEkLHURK0PvGFQLrxlxKJfI8jbzdlzKPrg0N7KLe+WUHc297ArTu00
	mg7sgpgc/f1+xSUjBKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nz-00BlBC-18;
	Sun, 12 Nov 2023 06:18:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nx-00Bl89-0C
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:18:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DC4F5CE0E9C;
	Sun, 12 Nov 2023 06:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3362C433C7;
	Sun, 12 Nov 2023 06:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769922;
	bh=bS9zYu4p2fDX0v+IO9ccI6gNcdJmQYX5Su7I11BAbz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eds0Ikvb4knSS+2emy3RCxl6MssNc5zSLI7TvAgF41P6aLGxzvhumme+tfoiJbZYR
	 E64mIZD3foSewobLLFWM8uEAYS2F7Kh6RRauO69qm7oFrRLBiW5gcTGx7lQquDH1H4
	 pyGzBxPO8sU1e4R2qo6ecYZVx0NP7Pn6xurHDlH/Gr544GTZVrrt/ofParw6Qb0Tpm
	 9o78tX8Aa4k8+RKVvEClQE4oPy776KWO5tvkrU2H3+Gs4WcLuzV1r+qVRi/fQ/GK8P
	 B5sTrI/oBj3IU/2VjqZLyF7Cy/1WyISInWnMyztHVxlQ5TsnAF6GPIStsmJkrSURHC
	 7/S9+w2Jg0xbg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 32/38] riscv: s64ilp32: Validate harts by architecture name
Date: Sun, 12 Nov 2023 01:15:08 -0500
Message-Id: <20231112061514.2306187-33-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221845_270846_875AD66A 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When rv64ilp32 was introduced, the 32BIT would work with rv64,isa. So
use the architecture name instead of the ABI width name. This is an
addition to the commit: 069b0d517077 ("RISC-V: validate riscv,isa at
boot, not during ISA string parsing").

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index bc39fd16ab64..3c06ffc00fe0 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -66,10 +66,11 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		return -ENODEV;
 	}
 
-	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
+	if (IS_ENABLED(CONFIG_RV32I) && strncasecmp(isa, "rv32ima", 7))
 		return -ENODEV;
 
-	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
+	if ((IS_ENABLED(CONFIG_RV64I) || IS_ENABLED(CONFIG_RV64IILP32))
+				     && strncasecmp(isa, "rv64ima", 7))
 		return -ENODEV;
 
 	return 0;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
