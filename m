Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E758CF857B
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UAIRjEbIwUQBsUdOWDiAI9uzUazUdm0oZcBggoe8rVE=; b=CxL9HtpMsSzqX0
	iBFCySPaOHCjxLuJjeMD+wMsHzqaEkginPi2uvweWsYdrb/UleJY+dtTjDB2SmDIH1DCxmKhD5yKO
	3MVPOFPcb7mTU+WL4+ENw9JZp5OH6ShTS60FTc6APdZyOXrEalqPATd4NT4iHj9uhlKnybm5Vk7XC
	93OuG+wiVP6MGNL5jJMihGtpcqvYF6VJxIIrfGonS7tcl8YVKFEXY2pMjfM8PM56AquwS2ep5JXka
	yDPcBsQEhFHICU4RLM3LuH7BQwcX/NVpHevgfPlJZaAHZJ05K5n/vYfX4wFi//uxJT0aH+RW/vJIF
	6cQzZcL900FM0LPFCogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Sk-00000006TDB-1IUf;
	Thu, 20 Nov 2025 10:00:26 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Sh-00000006TCk-3Sxo
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 10:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gO
	Snjn6UEG56w+LuXWMTd8UhHCBQFkw5Sh/frqYoW9w=; b=d3K0m7xKKeEtPScV+s
	hWKHgAqgXX/UCpn5DdYKM4sQtZZsfGCWItACDCp/C02WgGENzX0KSX7WTqo27NGO
	/kpk77Ep3Jy1RgfpN7LEQKOMijGU3EJ7OAerswxN/kmVqZDUh5UEa1VLpPq8YbvZ
	ayPbnWmZ5CqAYJRpQMOKPL954=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBno55J5h5pO3ApBQ--.7036S2;
	Thu, 20 Nov 2025 17:58:36 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	gary@garyguo.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv/atomic.h : use RISCV_FULL_BARRIER in _arch_atomic* function.
Date: Thu, 20 Nov 2025 17:58:31 +0800
Message-Id: <20251120095831.64211-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wBno55J5h5pO3ApBQ--.7036S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1DtF13Gw45XrykXr1kZrb_yoW8Ar4rpF
	WDCw4vkF4Du3Z5Cas0ya18GF4jqw4q9390gry5Wr4Iv3WDtr4UXFn5KFyxt3yUJF4FqFyr
	uwnxW3s8AF4vyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07USNt3UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0gyuWmke5kyYiQAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_020024_240685_5089F6F2 
X-CRM114-Status: UNSURE (   7.19  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

Replace the same code with the pre-defined macro
RISCV_FULL_BARRIER to simplify the code.

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/include/asm/atomic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 5b96c2f61adb..3f33dc54f94b 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -203,7 +203,7 @@ ATOMIC_OPS(xor, xor, i)
 		"	add            %[rc], %[p], %[a]\n"		\
 		"	sc." sfx ".rl  %[rc], %[rc], %[c]\n"		\
 		"	bnez           %[rc], 0b\n"			\
-		"	fence          rw, rw\n"			\
+		RISCV_FULL_BARRIER					\
 		"1:\n"							\
 		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
 		: [a]"r" (_a), [u]"r" (_u)				\
@@ -242,7 +242,7 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
 		"	addi            %[rc], %[p], 1\n"		\
 		"	sc." sfx ".rl   %[rc], %[rc], %[c]\n"		\
 		"	bnez            %[rc], 0b\n"			\
-		"	fence           rw, rw\n"			\
+		RISCV_FULL_BARRIER					\
 		"1:\n"							\
 		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
 		:							\
@@ -268,7 +268,7 @@ static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
 		"	addi            %[rc], %[p], -1\n"		\
 		"	sc." sfx ".rl   %[rc], %[rc], %[c]\n"		\
 		"	bnez            %[rc], 0b\n"			\
-		"	fence           rw, rw\n"			\
+		RISCV_FULL_BARRIER					\
 		"1:\n"							\
 		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
 		:							\
@@ -294,7 +294,7 @@ static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
 		"	bltz           %[rc], 1f\n"			\
 		"	sc." sfx ".rl  %[rc], %[rc], %[c]\n"		\
 		"	bnez           %[rc], 0b\n"			\
-		"	fence          rw, rw\n"			\
+		RISCV_FULL_BARRIER					\
 		"1:\n"							\
 		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
 		:							\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
