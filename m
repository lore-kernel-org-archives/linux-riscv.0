Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF50EE7FF4
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzkh2Whd8TeaJ59qdHUtBHA3Wacll7HRYY/BnPP/UEo=; b=PCsp6A8jtGRC0T
	jrtlvRGk7DgrXqVK4glZxCIJ5Ae4Xu5TJq/Ax9SR9PYM0a8hqun7ZRR9hXMB0Obo7Q4SEFXK7ieVY
	OsRt8EUwKbnkbYFR6Ige74V8RnTZZHH1IZXmMlRfJvCbSQJGQaZINIGOqMjSV1WXxKV5uPp31PR9u
	QwjNA9MZjEfJ+x8rnbviCnvORqapU0goygl5m8pH1rceu7Hk1eT2zpQW7Wi8ZUQUZeRcvLb87x5N8
	OyaWCX4WIHmd5jJUcGUH/l/jjKGT46xuufAu58zT5MmtLHmCjhHt7hVFxbfT3AsaNpWdAj/sZOGyn
	vcBYIa3KuxDMF3xPBNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqc-00GHzx-31;
	Sun, 10 Sep 2023 08:31:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqa-00GHwY-00
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:31:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5A765CE0A36;
	Sun, 10 Sep 2023 08:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B89C433AD;
	Sun, 10 Sep 2023 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334668;
	bh=rVLNDURpOo6qyHiuDOTv1S9pmkvmttipsDX3ZB78S3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J4vv6ZK4m8+ZAYwWtLVLh0MGfPo2+DIhTEV60AiAjhHORFtDmWtIkS+BlESCUmkEo
	 mXfGVL2xe+CW+Cw/i1vYBvg149LAmnA/Sm/7SYj7BinnCDfFR8xqmrKiSB7IEuZHoG
	 L0d04TaCfcKTbiCn3rGUimhpuT7v+Y4/NG9+vXxA0CRX5Tyk2mOHA2hMjOojDrAkVp
	 +k1ByKdKCbaA0SV5+tafSpELg24ZkI1yV2ErBGv7QZQhSNtRNOIMtfx1Xiuj0tQgze
	 0o/Utrj89jmKhS4VOu/9A/1NwYpSKxiuWJKAlyzGG05mhN+Y7XKQrKXBsGUZ1r0dsS
	 uA04kMd6m4fdA==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 10/17] riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors
Date: Sun, 10 Sep 2023 04:29:04 -0400
Message-Id: <20230910082911.3378782-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013112_223927_9AC27824 
X-CRM114-Status: UNSURE (   8.05  )
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

According to qspinlock requirements, RISC-V gives out a weak LR/SC
forward progress guarantee which does not satisfy qspinlock. But
many vendors could produce stronger forward guarantee LR/SC to
ensure the xchg_tail could be finished in time on any kind of
hart. T-HEAD is the vendor which implements strong forward
guarantee LR/SC instruction pairs, so enable qspinlock for T-HEAD
with errata init help.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/errata/thead/errata.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 751eb5a7f614..0df6a67302c0 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -86,6 +86,13 @@ static bool errata_probe_write_once(unsigned int stage,
 	return false;
 }
 
+extern bool enable_qspinlock_key;
+static void errata_probe_qspinlock(unsigned int stage)
+{
+	if (stage == RISCV_ALTERNATIVES_BOOT)
+		enable_qspinlock_key = true;
+}
+
 static u32 thead_errata_probe(unsigned int stage,
 			      unsigned long archid, unsigned long impid)
 {
@@ -103,6 +110,8 @@ static u32 thead_errata_probe(unsigned int stage,
 	if (errata_probe_write_once(stage, archid, impid))
 		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
 
+	errata_probe_qspinlock(stage);
+
 	return cpu_req_errata;
 }
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
