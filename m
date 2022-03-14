Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E41C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EHN/mUwIxrB72+Yh6w4rFHzLVL2Z3bqBYl6kmU4hzn4=; b=KVZ
	/m9LGebWvnYvK7MhBV0RTIbF6h5/qweczyaSJmeRzuDMBPbS6I9VRchFlLp7VN5s8qccSu3xjHG5q
	wbDgKllUsmTaDI8jBptRCZ5ufBufaiu1ABCGyhqkR4FpDo71r+L2j5JtOrgqw7C8ZkJUWyWUZCQRm
	/08i015wpqEosemyGYQRpXICouiLF9G7WtdQQ3ppRiS+fFoj4o99Ur6du74R3XDhy+bCxGpZA53kU
	AVzQRSFjM0hDVyssG4fAQgGSOXFfPww8Es29dQjRQZPI7OXuZIlc2j9N9+bOIVoLVCmN0X57Og+tV
	z6v8cAcUmpYPBvKSU1RhsyVJselw0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTgfV-004ic3-BG; Mon, 14 Mar 2022 09:07:09 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTgfO-004iVo-Ki
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 09:07:03 +0000
Received: by mail-ed1-x54a.google.com with SMTP id
 cf6-20020a0564020b8600b00415e9b35c81so8243726edb.9
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=a4IR97CqDqOCyGomwvsbWVLvZxZNOCZYNgnnVH7AcmE=;
 b=WYLlAG25ii3y3y1thMBgjtpcyqaX8mgBsj8kB31fLccDXRYGaDycSvw1ZVKby8Ln5W
 xB2AGLnQJ+8Fk0ar0eF2jIVd2HgXF3sVkHAcLB+z5EvqEmkq+bwr8xqpznbBqmwp3/wz
 sW9335qDdLf347ACQtr5rNMpUMw4f8WhEwinpMpUBra4cuFQp6q6rnP+e7I3dDy9/nCu
 Qp+oAzIvrEm5fxugg+n6DXdIopPsXC5KC8wZyRD3/aWN+0EZfZjEcoGlmme6VhHmYkIL
 IEFYnaN+QYW7aZjG9rzZeZAON1/uYrnqmLykxhQ15xYm0COoD7jE3KB8PDyaXn/FD/pW
 hZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=a4IR97CqDqOCyGomwvsbWVLvZxZNOCZYNgnnVH7AcmE=;
 b=yYrMslKTXpAYQHnBwfLezBfwFnt4lHRc2FNqVq//I1uKsWbnLynHXkbAbYVccgnrTk
 V0fFZP9oqAlBCv6oFWb7qeyINImSark6xwKitiWGXkCE1SruCLjXBdcZKFd8Gv1xfQ59
 Lfoqe7MK2x8LWRAv1AKMIIuXmsEgI9mrnlSlj9gDJXfqy2Djbaxr0NdRub92k9c+vbiD
 wF9fGRfdeRKqa9Aprx8fvAa/umga2/Bv535LWTgvy3kzMaq27wkAdDcxOcdzhqWLvoUR
 ucNk0RAssKVau1RBSD4+TVZ3Lb2l0UTwjrJ9dgChWb7EHeltN6bpjPC4nm5CaQOoGU5J
 n7Aw==
X-Gm-Message-State: AOAM533wqxZVPk8hRQP20Z+mXn11Zq4bSIuLuXE0mXaKObDjSkG23piM
 Gc1kS2ULygNETfM36l0MLKwRjKxMcWUk
X-Google-Smtp-Source: ABdhPJwiuMz0Z8GMmEpnMUM7XACdoctJGixTmv011kh2RGgYcICeO3/3rC5ZP/6t3zFF1x7oKtet9wv1mUGu
X-Received: from dvyukov-desk.muc.corp.google.com
 ([2a00:79e0:15:13:44f9:d689:30de:bc71])
 (user=dvyukov job=sendgmr) by 2002:aa7:d491:0:b0:416:189b:e43c with SMTP id
 b17-20020aa7d491000000b00416189be43cmr19392136edr.41.1647248819017; Mon, 14
 Mar 2022 02:06:59 -0700 (PDT)
Date: Mon, 14 Mar 2022 10:06:52 +0100
Message-Id: <20220314090652.1607915-1-dvyukov@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] riscv: Increase stack size under KASAN
From: Dmitry Vyukov <dvyukov@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 alexandre.ghiti@canonical.com
Cc: Dmitry Vyukov <dvyukov@google.com>, 
 syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com, 
 linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_020702_709675_53F642C9 
X-CRM114-Status: UNSURE (   7.83  )
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

KASAN requires more stack space because of compiler instrumentation.
Increase stack size as other arches do.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Reported-by: syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com
Cc: linux-riscv@lists.infradead.org
Cc: kasan-dev@googlegroups.com
---
 arch/riscv/include/asm/thread_info.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 60da0dcacf145..74d888c8d631a 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -11,11 +11,17 @@
 #include <asm/page.h>
 #include <linux/const.h>
 
+#ifdef CONFIG_KASAN
+#define KASAN_STACK_ORDER 1
+#else
+#define KASAN_STACK_ORDER 0
+#endif
+
 /* thread information allocation */
 #ifdef CONFIG_64BIT
-#define THREAD_SIZE_ORDER	(2)
+#define THREAD_SIZE_ORDER	(2 + KASAN_STACK_ORDER)
 #else
-#define THREAD_SIZE_ORDER	(1)
+#define THREAD_SIZE_ORDER	(1 + KASAN_STACK_ORDER)
 #endif
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 

base-commit: 0966d385830de3470b7131db8e86c0c5bc9c52dc
-- 
2.35.1.723.g4982287a31-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
