Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED41C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eAykv33CMUETBDCf1WcsKipnC3xeJpfBOs+uYLXOLRA=; b=SbgZCULKJ8VQbh
	GaO6HVygfSCrhvx7qKD+Um0ujX9+v7qZT7A4jA6zz5MD3Vv7zqQxOfl51D1RX0CtDqo1xZtC2kYPd
	0XiaZb4+WISwHxR8j6qUYjGZ/kP7JlE+xit1B6tIIxOJISjVYBejLIcbpqKILfjBd4QpBWy74hB/8
	nxMoaZZTNWhexUgFD4Mhzhl+HWqVzZjPSDA1HG7T9nDFwlhDIUJnOY5siF1MS2Tly1x+6plIYtDge
	ZON7S7c8vdNazbuJahofK1XtrMFJjK552/uLkeG/ZDn1vfVo7ddH5V+k3KzjIhnXPtBGOilURK5bH
	U5pwEPJzICfKVgJWvDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qbh-00FmHw-27;
	Sat, 02 Dec 2023 14:04:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qbf-00FmHZ-2p
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 14:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CACA7CE1411;
	Sat,  2 Dec 2023 14:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA462C433C9;
	Sat,  2 Dec 2023 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701525869;
	bh=AV5SjHrRFe5hjdLFAKlI3xJUbybDuDNPP1TvLDaRINs=;
	h=From:To:Cc:Subject:Date:From;
	b=PJyPXWnas2YQ4+MeVwOs6h99j9+jSJBaewQgFLM0EjWj2woE82icYVpFy1mOkiKGS
	 T3skUbOlQQC4EivCgBtVdPEIBdbrCg10wZOHHleHuhQYHeLPckVXiQhT5W8nF+faXw
	 zGVOG4WFYtfkGdJinzCdLiy+LbYVK3JQJTwrf69l6OeuSwBGvF6exbLPQSsnvUzZWq
	 sQoLbGg/7fny0rt0f38Qi6pEmk1lz/nRGaNs2CNBuYfofhynZIFz6pYrZ57nhD+pLD
	 4GqyvjBrnUMed5YDKzYdpahARVX8Dcxeicqagckk/Bv6JfsfbkKtLu+zyPKDKJhGls
	 OmBMRYzXvM0JQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2] riscv: select ARCH_HAS_FAST_MULTIPLIER
Date: Sat,  2 Dec 2023 21:52:02 +0800
Message-Id: <20231202135202.4071-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_060432_160855_07D711AC 
X-CRM114-Status: UNSURE (   9.03  )
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
---

since v1:
 - fix typo in commit msg
 - add some performance numbers provided by Samuel
 - collect Reviewed-by and Tested-by tag

 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..e4834fa76417 100644
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
