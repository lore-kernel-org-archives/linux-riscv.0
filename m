Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A4CFD2F6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 05:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C6E94JY0pMJfPlST01SRIvJO203CHScI88Hv4QtWK4I=; b=0JqYIwYNvFnN2s
	nAZbQrmGWx5RXzl9YzGUeA/5PWqDSt+zBVFikd/jTTtowTRNEfjVlZgQfEqUvqUMBjso0toWgdjmx
	Pg00kvyPVJLxbv5FHZEvBuIS2Uh1+YxaXnFbWluzZOKaNqfLZPf7sKqs/9D0mhYSuQx8e1KX5SxUr
	B7STBNMd9L5zUjTH/VXgF3bJjjfLH8EqLcEKBAWR57QK0jBPtONh4TC/HXZiTSKEvTsl7r+jq0Pfk
	pq3K9Q9fKEo4YP8SivmxIgb8jL6+Qq+y4OkpFJGzaSRNh7jhnXCd6bWZrKunNUvSH5PkMHzkzHbt4
	d3IcP41/eDbpRvBNfjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQItb-00000004pky-2Zhw;
	Tue, 02 Dec 2025 05:25:51 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQItX-00000004pk6-1Css
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 05:25:49 +0000
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-03 (Coremail) with SMTP id rQCowAAHlthSeC5pKwLkAg--.34172S2;
	Tue, 02 Dec 2025 13:25:38 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 02 Dec 2025 13:25:07 +0800
Subject: [PATCH v2] lib/crypto: riscv/chacha: Avoid s0/fp register
MIME-Version: 1.0
Message-Id: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIADJ4LmkC/32Oyw6CMBBFf4XM2iG0QmlY+R8GTSmDNIaHLTYq6
 b9bYW8ymzP3kbuCI2vIQZWsYMkbZ6YxAj8koHs13ghNGxl4xgvGjhla47THqMW7fvy9wW7GQuQ
 5tVI2THGI0dlSZ15b7bne2dLjGduX/QmNcoR6GgazVIkXKZNoNbusAX7+3rhlsu9tlWdb4P8Az
 5ChkNSVSrR5WapTdCmXKp3qEeoQwhfEOT5G6gAAAA==
X-Change-ID: 20251130-riscv-chacha_zvkb-fp-5644ed88b1a2
To: Jerry Shih <jerry.shih@sifive.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAAHlthSeC5pKwLkAg--.34172S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1DurWDZF13uw47Kry3Jwb_yoW8CrykpF
	Z8W3s2krW8Jr97C3y2kF4ftw4fuF9Fkry3W34jqw15tay8Jr1xZFn2934rXF1rZFy8GFyq
	yrs8C3Za9F98ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUFg4SDUUUU
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_212547_693274_9371188C 
X-CRM114-Status: UNSURE (   9.20  )
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

In chacha_zvkb, avoid using the s0 register, which is the frame pointer,
by reallocating KEY0 to t5. This makes stack traces available if e.g. a
crash happens in chacha_zvkb.

No frame pointer maintenence is otherwise required since this is a leaf
function.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Changes in v2:
- Remove frame pointer maintenance, and simply avoid touching s0. Since
  this is a leaf function, this also allows unwinding to work.
- Link to v1: https://lore.kernel.org/r/20251130-riscv-chacha_zvkb-fp-v1-1-68ef7a6d477a@iscas.ac.cn
---

Found while diagnosing a crypto_zvkb "load address misaligned" crash [1]

[1]: https://lore.kernel.org/r/b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn/
---
 lib/crypto/riscv/chacha-riscv64-zvkb.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/riscv/chacha-riscv64-zvkb.S b/lib/crypto/riscv/chacha-riscv64-zvkb.S
index b777d0b4e379..3d183ec818f5 100644
--- a/lib/crypto/riscv/chacha-riscv64-zvkb.S
+++ b/lib/crypto/riscv/chacha-riscv64-zvkb.S
@@ -60,7 +60,8 @@
 #define VL		t2
 #define STRIDE		t3
 #define ROUND_CTR	t4
-#define KEY0		s0
+#define KEY0		t5
+// Avoid s0/fp to allow for unwinding
 #define KEY1		s1
 #define KEY2		s2
 #define KEY3		s3
@@ -143,7 +144,6 @@
 // The updated 32-bit counter is written back to state->x[12] before returning.
 SYM_FUNC_START(chacha_zvkb)
 	addi		sp, sp, -96
-	sd		s0, 0(sp)
 	sd		s1, 8(sp)
 	sd		s2, 16(sp)
 	sd		s3, 24(sp)
@@ -280,7 +280,6 @@ SYM_FUNC_START(chacha_zvkb)
 	bnez		NBLOCKS, .Lblock_loop
 
 	sw		COUNTER, 48(STATEP)
-	ld		s0, 0(sp)
 	ld		s1, 8(sp)
 	ld		s2, 16(sp)
 	ld		s3, 24(sp)

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251130-riscv-chacha_zvkb-fp-5644ed88b1a2

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
