Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD7FC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 19:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gv9jHu3zKDyM6WNjgCLnAJ1jIMwNaULLn4uMaqbqLQw=; b=wpkfD7opdBR+yK
	7gAe3BYCP1O00dO54Jb9KnynnzC+GdwrqyTBcLQ4lN1HEj+QM1SSAtP7yN5H0ldwEbP/S5P4lDnR+
	ad961XlYiTnTsvT+G+Bq5w6I4Gy7szFXJScAoqED8gDWYG2Buu7j2AH/ACeclb+VxRUoyyYWySYxQ
	171ZealXd+7TJZVmJsvelRq5GKrmQgdX9bvqzv5RVkLrmQR/PZNvazenoiumYGpujVEpCsJvmlSoq
	60WQE2Hl+yEdVPkryCib2QvWdF2sM8nIBtKvODrZs3XEQDZsY0KBxmcotMgsCHdaT+kX8Jstjkgkn
	qpHdxSc86XIJvWJOohTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruzwg-0000000DrpK-2PPy;
	Thu, 11 Apr 2024 19:18:50 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruzwd-0000000Dro8-04xO
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 19:18:48 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso134861276.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712863122; x=1713467922; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gnx+Wh6mZm2zD93yijKpXlCXtlqxeyrEyl4n/ltYBHk=;
        b=k0qMpDV94uOoGo4FY0kIWLBfHrsDQQ29TXWkthjr4I3DX7Pf8xXig+myw1sYyAPsaK
         NvOjOYx4exLNZ9bTGElng11jLzM4EmxG/30r3sj33xHgyiLV+U5cVBaYi2TptIufzfY9
         2+6I2IklSlXPsyhyIMfb6yAb+qTaBGrWS4BxUA7FsPJT7aKGg2W1GnQyyDRmfMNfJm4n
         Iu4shrb9qH+eUBitvbYzZS0klUaTbNc6nIulwIhJE8tiBLLh3jRLyf9r/nTjHUulb0YK
         klVyuDZwjYbq7zoYGP3F7RRMnljgwg+VLe80DyUt/MiPb6ZxfvzlbvW+vMcER1T4gZY1
         2jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712863122; x=1713467922;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gnx+Wh6mZm2zD93yijKpXlCXtlqxeyrEyl4n/ltYBHk=;
        b=rU84JM04phA5FBoYBiWUxiRt5tR9njcwbEdYYceyceK3IOAxbzsQoc0Q2R1H9Uu2s6
         B6JSjF/VlP6gbhI+KSPWHkj7VUCVaJFYYQKUD74Zhpas9fLl6t+kplSHRt8bJbaf3Tn+
         pM4SAjHuVe7kDhUlIg2yuW81UUDKixCa5oiF/WpkLLpTHGKNU8LXkRluz3JL18Y++RWS
         AzqhTadKhz87A0jfP278FKf6IsDKQFqDg3T7VJAU4xOs0D1is8XBtHKM2CEQmRDBZDi+
         e81WrdCJLiNGyoDF2wCMIq2jga5OFyYy7IWggaFtvKxHkP8AXgbrGwlG91q9Ks9MHGbQ
         VyTw==
X-Forwarded-Encrypted: i=1; AJvYcCWLbZEf/uIws+xEFbdR1ItgMwl+8SovjVZdgf1e2epxUMf0ANkRQe4nX11rYjSj4vekBj/eDe3Jsay6S/fLR+7/lfBqQV01V2EwqwSS6U0w
X-Gm-Message-State: AOJu0YxfIYdoUVg9mkbBg9ro6MLQdGhhCN6ogmajBs06jzHwQbgi0ecz
	RN+MedsF/Ne1+lyPDKGanZWbE/rYZM9o+6B685IRrRqjO6Jhr2K+rpgwUeijGqcEeP2vex0JGE7
	0sDpAE1H2m3X4gCvQ5vt6THUhE7Ea+DpN+rr5
X-Google-Smtp-Source: AGHT+IGwHVaFdqdjG/q9Ei/kAzML7ZY1M3xdauS0D/3tbBhX3B8TE51QbULjO2jN+O7dDYP+/cenpRV4eilHJRZuRA4=
X-Received: by 2002:a5b:40d:0:b0:dc6:bcb3:5d8e with SMTP id
 m13-20020a5b040d000000b00dc6bcb35d8emr475726ybp.20.1712863121771; Thu, 11 Apr
 2024 12:18:41 -0700 (PDT)
MIME-Version: 1.0
From: enh <enh@google.com>
Date: Thu, 11 Apr 2024 12:18:25 -0700
Message-ID: <CAJgzZorn5anPH8dVPqvjVWmLKqTi5bkLDR=FH-ZAcdXFnNe8Eg@mail.gmail.com>
Subject: [PATCH] Clarify risc-v hwprobe RISCV_HWPROBE_MISALIGNED_* docs.
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_121847_180931_5200C516 
X-CRM114-Status: GOOD (  10.70  )
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

These only tell you about scalar accesses, not vector accesses.

Signed-off-by: Elliott Hughes <enh@google.com>
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst
b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..239be63f5089 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -192,21 +192,21 @@ The following keys are defined:
   information about the selected set of processors.

   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
-    accesses is unknown.
+    scalar accesses is unknown.

-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned scalar
accesses are
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.

-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
-    than equivalent byte accesses.  Misaligned accesses may be supported
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned scalar accesses are
+    slower than equivalent byte accesses.  Misaligned accesses may be supported
     directly in hardware, or trapped and emulated by software.

-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
-    than equivalent byte accesses.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned scalar accesses are
+    faster than equivalent byte accesses.

-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
-    not supported at all and will generate a misaligned address fault.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned scalar accesses
+    are not supported at all and will generate a misaligned address fault.

 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
-- 
2.44.0.478.gd926399ef9-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
