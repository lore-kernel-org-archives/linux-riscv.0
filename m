Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386C3C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DGeT3ZL3sslsouFDihGaetD6ku8zOF95UZ0hOlzkLBA=; b=SYugqdkMVdEZIb
	mpMvdzb0zfAn3fP9zxZ+vNw710zDO2GWzz+ZsOY3hN0z/pu1pBiKHgV2ulibBK9p+8ndZD3bd8ize
	ARzUSmMXdIb/7wG9lMOF6PJx4ijtUIFPamxc+W3F73Ho/LXsD8F02BF3afumu7s+mITa51YARgubW
	2rOaPtH3NP932u6qNwJFiFjfnDEsPiRceRZNLy8m9gb5auQ0KQS+ysVL7WAIh/QlJQT4rKRiG7oy1
	jkWk+a/SZ61ZfeF6/4288FYBr7sdHzGKixrrlOZHpw+1EzKk2V/KXSkEVGaoYJUp9tNnWnIuOztrx
	AsPbUMnmy6SRRJfgxivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1Mf-00000000Y8S-2hcS;
	Thu, 25 Jan 2024 15:10:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1Mc-00000000Y7Q-3EWa
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 15:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B35606221F;
	Thu, 25 Jan 2024 15:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D064AC433F1;
	Thu, 25 Jan 2024 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706195397;
	bh=jGTeEqT3oFqBR8XDClyO1GAGfuARRlp1VqsQY6R1rZE=;
	h=From:To:Cc:Subject:Date:From;
	b=uI9AdYXoCYAn5DBxuyyvDJKzDd81svW6+pDf8TyqdpmXSirs3iM9UeAu1/KDakzpV
	 IsqSQZZyeebMygPcY5g00qnnK1S0gz/6X6kmK1YWDzmCMrCqpY7j22STrwxn7SsMpi
	 QDEINiE6NdWlX0MeVJS4Yd3YR19GMSiS4ny5m9hMlWkUnaUAFIpg+3HTCgksRBRK8F
	 Bhj9/CB/yxx+Rie9jLZn0MhbBGmsz1F/GRzXkvTd+X4K+jvpQGDQbzl6vDgahv6Dhs
	 TpmiRDUvSyW/6S9BJ8kHywTlbsnN/ws880XQbUxLr8V8e5f2QVuFvCvDfuRSFVT8bg
	 cEhhhy2eSrB3A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3] riscv: select ARCH_HAS_FAST_MULTIPLIER
Date: Thu, 25 Jan 2024 22:57:03 +0800
Message-ID: <20240125145703.913-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_070958_929577_897F6A3C 
X-CRM114-Status: UNSURE (   9.61  )
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

Currently, riscv linux requires at least IMA, so all platforms have a
multiplier. And I assume the 'mul' efficiency is comparable or better
than a sequence of five or so register-dependent arithmetic
instructions. Select ARCH_HAS_FAST_MULTIPLIER to get slightly nicer
codegen. Refer to commit f9b4192923fa ("[PATCH] bitops: hweight()
speedup") for more details.

In a simple benchmark test calling hweight64() in a loop, it got:
about 14% performance improvement on JH7110, tested on Milkv Mars.

about 23% performance improvement on TH1520 and SG2042, tested on
Sipeed LPI4A and SG2042 platform.

a slight performance drop on CV1800B, tested on milkv duo. Among all
riscv platforms in my hands, this is the only one which sees a slight
performance drop. It means the 'mul' isn't quick enough. However, the
situation exists on x86 too, for example, P4 doesn't have fast
integer multiplies as said in the above commit, x86 also selects
ARCH_HAS_FAST_MULTIPLIER. So let's select ARCH_HAS_FAST_MULTIPLIER
which can benefit almost riscv platforms.

Samuel also provided some performance numbers:
On Unmatched: 20% speedup for __sw_hweight32 and 30% speedup for
__sw_hweight64.
On D1: 8% speedup for __sw_hweight32 and 8% slowdown for
__sw_hweight64.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
since v2:
 - rebase on v6.8-rc1
 - collect Reviewed-by and Tested-by tag

since v1:
 - fix typo in commit msg
 - add some performance numbers provided by Samuel
 - collect Reviewed-by and Tested-by tag

 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..fdd1a595ebd8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -23,6 +23,7 @@ config RISCV
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
+	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
