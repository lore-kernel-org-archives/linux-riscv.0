Return-Path: <SRS0=YJ0P=FX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E283FC4361B
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 00:21:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C5C23B27
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 00:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C5C23B27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zA0HpLA3dP/+jju6XmDFyEurYG94SImEprnc+NtjcvE=; b=RLkHZFvFDxR8yeLub9EQVpoZAg
	wPD+1EHcXkbc7bN8KFtftdcbK9yD4joiHHNp3qxFWQdVzRsePrVsk9ptYqs+bNMQZ65LL9+nPEZec
	Ov8sEEObBnLv74EML41gdq6NejmGEFv5ypkwj13Q7fRPLdkGMf3fGr+97H8H/Sc+Mw3sKAj06/3yy
	Iwz/Q9QOWw3HKKPPLiPjfBB7dk6bdzRKk8htdtRVlkifWhkVQWoSq5bLgtCDFJ0+o8B5wPv9UI4MW
	bYT63NBq5SkukRJGCiOkV/djOAGxz/8NocHwlK8vJCItpYiRfBQMtuMbYvNlYf7N0Nswiw/iVXnvv
	QT2yUwww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqPzV-0003LY-B6; Sat, 19 Dec 2020 00:20:57 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqPzS-0003LB-NV
 for linux-riscv@lists.infradead.org; Sat, 19 Dec 2020 00:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608337254; x=1639873254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7C1PBe/g/CkOPTuOpOWjCYxZlRKGKI8thmXJHPYZm3s=;
 b=RKGgFgUYOZOiPXh8iv63YB/GzYD4dXkGBW65TREfQhJ0Ap6jv/glcumZ
 3qH+FQLwkRFPGykkMYEZ329tlpCnkmu65bnJ3aoJoxyEOqsvrBr1i5QQn
 dBXOYdnNeSkk40X0YnueLZ+Q1eC+KYBjtiR94rdIyXJh8Q+aYWZkeKj3B
 S7DMedeuLuoQpvZqXc6zAxVF7TtHDjxEVrI3QzVdAHw0rtewhhHcYggPH
 qDdwTq4Osh9OSgx8giGv2RprMSufrn/AalW5M7rN7phNc4+IogZkI4JPH
 HnIu0GITBeb9o4T72f+8/8ZNnFMMbKavQ5hZSc6yWg6QWY42jPwAG/wqh Q==;
IronPort-SDR: AGrMXZYvDzK9mUT9JzpgjFHPpZr6j8rJDe4TBF7u6H0BNSzCwwzD/gfX+9L58F6ddGsBx/2tdG
 n0zP9a/DmkfRV9FT07OZJFfo+z3WgqmyAX1gtnlLde4yjljUrcm6aqLockgZgq2oAfnRuMNRHP
 2X78LA1QFr6KzbhePC8zxCe1ZtXgxaGE1t8iR+8sRJ4WMSKX1ZNXjul/7C9xis/5KrPeJxADJc
 obLkFO3E4+WRzH1Z4IewdQ109FL32qMkxoO3ohQ1nvwxEpJohSnG8mmHZ1MUPaGuelVPvuORM8
 VrY=
X-IronPort-AV: E=Sophos;i="5.78,431,1599494400"; d="scan'208";a="155543114"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2020 08:20:52 +0800
IronPort-SDR: OM+sTP6x/8svFa3hxW4LFsjTuQkETpnfBbU/WdkjbIrsF83y/pCbhqbJeB3gmm4LEfL9R/ey54
 9y+QSyYUUVNo/jsF830T86F4bORcqIVS8+q7BrahudagADs2RiN9ixdY+/DHZEeKml5LTRA66Z
 SxbPNHvTm85kFZvhJoLQFUg1oJhviRq6B6LDDVGmVljGCinBUr+FW03AtbSjzSkIZmw9KX4hjX
 p2LD6ATjs/9TD+QLPUWwxCVOtA6Noxn6QKHKWSLcyp71+orhKFwh+jpjxtHX9GBkEWyam/87n6
 vgsCHU/cjMn6VJgSZeR4hGTs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2020 16:04:25 -0800
IronPort-SDR: xR/9wNPK7kuxjRf6DRiNJ8vndBCwTpioqV3v3byi+29ye+6JTgK8DVeesgKephW/6LUn0g9aW8
 q0EiM2E0PCMX4kPKYmCWJE8ypCpP1Xqes+g136i0I7XGJTR+DeKUnZVGLDe53BC+ZBZ20beNdB
 xTWwFklYraqou2TPCF7KzSthg2zDy/3c1Wp9Z85TZmQoy8nNt8Mmc1Ox9zSkZtBVQOjXYKwDzp
 b3RiPYuqi6bm+ZCyPhv043Lf9PdHWeLegTg3q8u2ptW8oYBK0x7CsRuVAXF2kU/eSKquxR5SgI
 DWk=
WDCIronportException: Internal
Received: from cnf009746.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.26])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Dec 2020 16:20:54 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Trace irq on only interrupt is enabled
Date: Fri, 18 Dec 2020 16:20:51 -0800
Message-Id: <20201219002051.2891577-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_192054_956523_CFB97EAE 
X-CRM114-Status: GOOD (  11.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We should call irq trace only if interrupt is going to be enabled during
excecption handling. Otherwise, it results in following warning during
boot with lock debugging enabled.

[    0.000000] ------------[ cut here ]------------
[    0.000000] DEBUG_LOCKS_WARN_ON(early_boot_irqs_disabled)
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:4085 lockdep_hardirqs_on_prepare+0x22a/0x22e
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-00022-ge20097fb37e2-dirty #548
[    0.000000] epc: c005d5d4 ra : c005d5d4 sp : c1c01e80
[    0.000000]  gp : c1d456e0 tp : c1c0a980 t0 : 00000000
[    0.000000]  t1 : ffffffff t2 : 00000000 s0 : c1c01ea0
[    0.000000]  s1 : c100f360 a0 : 0000002d a1 : c00666ee
[    0.000000]  a2 : 00000000 a3 : 00000000 a4 : 00000000
[    0.000000]  a5 : 00000000 a6 : c1c6b390 a7 : 3ffff00e
[    0.000000]  s2 : c2384fe8 s3 : 00000000 s4 : 00000001
[    0.000000]  s5 : c1c0a980 s6 : c1d48000 s7 : c1613b4c
[    0.000000]  s8 : 00000fff s9 : 80000200 s10: c1613b40
[    0.000000]  s11: 00000000 t3 : 00000000 t4 : 00000000
[    0.000000]  t5 : 00000001 t6 : 00000000

Fixes: 3c4697982982 ("riscv:Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT")
Cc: stable@vger.kernel.org

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 524d918f3601..7dea5ee5a3ac 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -124,15 +124,15 @@ skip_context_tracking:
 	REG_L a1, (a1)
 	jr a1
 1:
-#ifdef CONFIG_TRACE_IRQFLAGS
-	call trace_hardirqs_on
-#endif
 	/*
 	 * Exceptions run with interrupts enabled or disabled depending on the
 	 * state of SR_PIE in m/sstatus.
 	 */
 	andi t0, s1, SR_PIE
 	beqz t0, 1f
+#ifdef CONFIG_TRACE_IRQFLAGS
+	call trace_hardirqs_on
+#endif
 	csrs CSR_STATUS, SR_IE
 
 1:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
