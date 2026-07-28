Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E2AC54F4D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Date:Message-Id:To:From:Cc:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2D9eZ3TYQtiKhI9/pxjvA0r5MPJGPr8HnAQZwx5g5eY=; b=0JLKXJzLiByKhL
	AsxGYBfzNxdynhoDfw+5W8Qs4aHblQSH32IXKkURjkDapL/4Xa2E7sy8WC5qBop1KLPhlVRl9rab4
	joX6L4jZhOgduRRC5Twxawyl9R+QY77ZUTt3+ac4kv3JDCQhuE6kLGPIslwbEiuaFHxnXjZ7aiDtn
	1ENUQOghUVcneSamKsL78EVBYyRkkkqG0DxOo/Pw5/4Y425naP0b99nuxmHFOFoRFZNqhZ5NgrG3C
	qetO2kIQaJHxOyTBQsvyMR2fDPHNI4bnc9nTlL+xxhiSzqcqmqRfZIOkBkIfrWRp+PF+hYpqKIHmT
	+4LtuHF49v/xwgdAif2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiez-00000005SRn-2JyI;
	Tue, 28 Jul 2026 14:19:57 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiex-00000005SQi-241y
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 14:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785248383; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=2UCihU+MCaax0FeQAXnlhj+j6M+P2AospgTMIpa496A=;
 b=BCXiUbL85ahQOBwNKEuMrGkrgQO5sUnqIFRw4B2JXiuKOwSzRRgXyDSLNBWbV2p4pRc609
 AZgEZByjnO1eHh95BHOe1v5n3eVAzFquns4VPie4owpnFuuF96imZfR1AQff2/qKEQK/5S
 BYqJwEoKIHvii/JtTwwPfZEiXHYKAHe58u0ndnvmlFwy3OlPNb95FCzsKdsJLo+GnU3nxg
 eDDEG76C5O3C2U11dMzxrOEQmiitsExVqtkH9rzffQlpYedzBUOXzEg36Z7iQP/xWyvEOu
 vSbIRJO6rMrpGroy+YCjubNYBBhgVA/G6lyhGR7ngHRX5JJsfKbX3Alqkuw3JA==
Mime-Version: 1.0
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.117]) by smtp.feishu.cn with ESMTPS; Tue, 28 Jul 2026 22:19:41 +0800
Cc: <geshijian@picoheart.com>, <shenyang.young@picoheart.com>, 
	<yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Message-Id: <20260728141938.95845-1-yang.yicong@picoheart.com>
Date: Tue, 28 Jul 2026 22:19:38 +0800
X-Lms-Return-Path: <lba+26a68ba7d+020658+lists.infradead.org+yang.yicong@picoheart.com>
Subject: [PATCH] RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_071955_590185_20D67944 
X-CRM114-Status: UNSURE (   7.94  )
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

Currently the RMW for IMSIC MRIF is implemented with
word LRSC loop. This will only cover the lower 32bit
on a 64bit system. Instead of guard the implementation
with CONFIG_64BIT here, use try_cmpxchg() wrapper
which has already take care this to fix this issue.
It can also use AMO instructions on supported system.

Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/kvm/aia_imsic.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index d38f5de0834c..c922c037344c 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -220,15 +220,12 @@ static unsigned long imsic_mrif_atomic_rmw(struct imsic_mrif *mrif,
 {
 	unsigned long old_val = 0, tmp = 0;
 
-	__asm__ __volatile__ (
-		"0:	lr.w.aq   %1, %0\n"
-		"	and       %2, %1, %3\n"
-		"	or        %2, %2, %4\n"
-		"	sc.w.rl   %2, %2, %0\n"
-		"	bnez      %2, 0b"
-		: "+A" (*ptr), "+r" (old_val), "+r" (tmp)
-		: "r" (~wr_mask), "r" (new_val & wr_mask)
-		: "memory");
+	new_val &= wr_mask;
+
+	old_val = READ_ONCE(*ptr);
+	do {
+		tmp = (old_val & ~wr_mask) | new_val;
+	} while (!try_cmpxchg(ptr, &old_val, tmp));
 
 	return old_val;
 }
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
