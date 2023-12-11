Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA96C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ejcpx38sEwq6y6K/qwxt8Cl79o+3D75tnNaSeCL1qho=; b=1DBaV9HLYnYSn6
	jB6xnXDMJmF0W0y+TPT3tUeJHxKlCMteJFbJ6/Yj1gYdgBQ1CrA3gOgG8zatWrYDbt2iTRnc5YKnM
	IRH67WPZoElViGM663Yz7wwHbu4AR7feejxkQcq6UAcq7SD7/tp/6c6YwRqIv7d/06MeWQLU/wSia
	xDTqSUGK7uNBY6JahryW+NemNpjXpfNxm97ASc3fkn0Y7GS8Mrv0JiUulzBOtHYQz/2WiBg7f5H8y
	gbBaBDNsUocSqytNMlB0qb2tqaW1uymcOztjlTaxaxUiOYEmIcZ6xlZ+UkYRFyZOcndwCM0qIHV+L
	kdk0e/v6GwVgbT7yDt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe5V-004gt6-0R;
	Mon, 11 Dec 2023 11:04:37 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe5Q-004gsl-2O
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 11:04:36 +0000
X-QQ-mid: bizesmtp73t1702292622tj8j5yuu
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Dec 2023 19:03:40 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: 5q30pvLz2ifwectDw5X1ejEzovDe+SdttSK6eqA0chYVCh0XUtbv4XETa4kck
	A+EYAm88lWow0SrwX5RjG0MO7M/W+Bof2DsgZM/I833wDkp+7uhSiviaquZADvf09fp4u+j
	ZRRkoE0fhwUHZVssdj2ifiAk/CdC6zKgfyhjS70urfxWRyzk0tvZvnETKoZ4w+9iu9FYtvc
	V8E/j5fHNwNKMPLDihwgCw0zxsZPtGLM5uS7rdAVMrWs5tzsHPUyIIpiKU2jcQwXNhQRojT
	i7yaNzDXWtNRxMVEHkyAlw7e2LgeHLMYRkkSnG/RL06fXCqejNUYgDtMA5Ss03oZXZ+9bRE
	gU1Yh2jIZXo3AmCcjKczIBtSrKX6lxKvf0PE8xtw8SkCn4matw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12009462421657250734
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	samitolvanen@google.com,
	conor.dooley@microchip.com,
	bjorn@rivosinc.com,
	debug@rivosinc.com,
	songshuaishuai@tinylab.org,
	greentime.hu@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH --fixes] riscv: Remove SHADOW_OVERFLOW_STACK_SIZE macro
Date: Mon, 11 Dec 2023 19:03:31 +0800
Message-Id: <20231211110331.359534-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_030433_102178_817EFEFF 
X-CRM114-Status: UNSURE (   6.68  )
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

The commit be97d0db5f44 ("riscv: VMAP_STACK overflow
detection thread-safe") got rid of `shadow_stack`,
so SHADOW_OVERFLOW_STACK_SIZE should be removed too.

Fixes: be97d0db5f44 ("riscv: VMAP_STACK overflow detection thread-safe")
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/include/asm/thread_info.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 574779900bfb..4856697c5f25 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -28,7 +28,6 @@
 
 #define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
 #define OVERFLOW_STACK_SIZE     SZ_4K
-#define SHADOW_OVERFLOW_STACK_SIZE (1024)
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
