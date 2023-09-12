Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B68CA0ECE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b7/cJx6Lsy8DqWg/scWqeboVn0AVbcKV4NaGyranheE=; b=TU6GpeSH5X8wS3
	QQvS1RyT6eNN9Nz1ZdziCy8/z0/U5Ut3IJsp8lIdF9IjEj0dDKgeAlQ1kXi7H+c1QGMAJSCTwqi86
	cMC+uFA3KBkyCVsgDCBJi4Dlvg50IzKa3tnh0yHxESqaEPi3EIlePqorkxfX7CPG8YoqZpW1dg/u7
	HmrKxCS0uP9rzPse3koH4sJi1nFLZYLZaBxgaML7b8TJFbpD9yon+dCfeXxBe5UDLcHVKyV/B9XSX
	bqzbEgTYgK6bVWdkbK8hKzCYKK52gYmSk/jCfJ7m20/lBxkRr2iyBK45iD+NXpKVpBIaJ8l/a0EV7
	hk9OQTodZPA3/7m01v4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxwY-002Q0X-2G;
	Tue, 12 Sep 2023 07:36:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxwV-002PzK-2S
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:36:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F724B81B01;
	Tue, 12 Sep 2023 07:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA49C433C7;
	Tue, 12 Sep 2023 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694504173;
	bh=NEBCs0obZ/Zb3TNso8vqG2Frf4fuv/wh7I2pZQ8DKS0=;
	h=From:To:Cc:Subject:Date:From;
	b=g3oyoBfGxbLRWsS9qGBEirOD91LnZvsQhdoc/VuVTmra+dcBJaraJ568IV4ZX+bld
	 DKm6qi/sRIKg5T6gMOlfYGfIbZ56gpVO5uBsM2eQ+IA87+jzQFDM0ZBIVT25SJ7s/8
	 2LLQDs7pVB42q8MXA/9Hsw6VUvkQhNyoy0Y2hPui1eUMl96csq36Xx/8I1kuOcFP8R
	 OF54GqJgjTHkjGPvB9mxPy8oI4s1njA/Epr+hsZx47n5lK6z1svkNEYvedNNkcC6JE
	 j5KKHK1b6xwnoqcEFuEk53QuQXzT78K54NU7jTfCZ5p/4aYhHwEsCcjvv6yfvt+d8q
	 oC4ZedOXBmUAQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3] riscv: errata: fix T-Head dcache.cva encoding
Date: Tue, 12 Sep 2023 15:24:10 +0800
Message-Id: <20230912072410.2481-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_003615_943128_5D70731D 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Heiko Stuebner <heiko@sntech.de>, Drew Fustini <dfustini@baylibre.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

The dcache.cva encoding shown in the comments are wrong, it's for
dcache.cval1 (which is restricted to L1) instead.

Fix this in the comment and in the hardcoded instruction.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Guo Ren <guoren@kernel.org>
Tested-by: Drew Fustini <dfustini@baylibre.com>
---

This is a renew of Icenowy patch series[1], patch1 is necessary to
make T-Head C910 powered SoCs CMO work correctly.

Link: https://lore.kernel.org/linux-riscv/20230103062610.69704-1-uwu@icenowy.me/ [1]

Since v2:
  - rebase on linux 6.6-rc1
  - collect Tested-by tag
  - remove patch2 since I want patch1 to be applied as fix for
    linux-6.6. patch2 will be sent separately.

Since v1:
  - rebase on linux 6.5-rc7
  - collect Reviewed-by tag


 arch/riscv/include/asm/errata_list.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index e2ecd01bfac7..b55b434f0059 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -105,7 +105,7 @@ asm volatile(ALTERNATIVE(						\
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01001      rs1       000      00000  0001011
  * dcache.cva rs1 (clean, virtual address)
- *   0000001    00100      rs1       000      00000  0001011
+ *   0000001    00101      rs1       000      00000  0001011
  *
  * dcache.cipa rs1 (clean then invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
@@ -118,7 +118,7 @@ asm volatile(ALTERNATIVE(						\
  *   0000000    11001     00000      000      00000  0001011
  */
 #define THEAD_inval_A0	".long 0x0265000b"
-#define THEAD_clean_A0	".long 0x0245000b"
+#define THEAD_clean_A0	".long 0x0255000b"
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
