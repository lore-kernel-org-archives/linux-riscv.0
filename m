Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5CBC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7avUCiWoJxGE/1vrduQ4BjNBWxrTeMFa6sAU3iDTIBk=; b=VM3nAtPGQ5Nm6k
	zxq8Vm/pmX2p6r2CrFYvKaiUmIATdqXXfvVjlT0x4itoOPo9zTSU3uLdyCUg3vt3Ne4f59VRw1qkX
	klBBo+4BW8eHCupk553dYzNq6Wez5v7zUaWYi5gnmVHfBMnLu3oufPCsdoFfuJne3ZIK/BCXQ1f35
	/RWhyuHKi6idlMowBEwAlkwJC1h4z6sjl6ktqUxOcBSTTrFVj3aKF7i6whsyiJ3A2nGI4BCBuRdJW
	6AuetRw17Bil1KvmtRNJALhtDb4LiJuqKAztL/hMjxLJ1JqV5YtPvjS1uIw1gNJuQQ7ELfhj2seYe
	CagIgKDp6WXWqxSwK57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2rc-00C23S-KF; Wed, 21 Sep 2022 16:46:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2rZ-00C21V-In
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:46:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id z6so10915093wrq.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=Yw6P8uWcw4cBGcbaqsZpk8wARZfWeyzrk6CPKlNIqGs=;
        b=SJDfAUTkNX08HeNv7Zt2yt4svVIXntA1AMaa3KipMqgzA/3XzxtASXnplHXZSNHv1q
         5wzt27EorXVk95cQ67SrbS+GhuA3YkFDJGNUe03MB+9C6AwctOUlIwgb234iKr9qOSQ/
         3mROmQWL5oP9tpkgx9/PUodmt13LYjo2DXgx0t3XflkYEQGjwiVDUB7Wiu+ETvQa3qdy
         L/EfGmivT+ER/3lQGNoQr2BMKkcri8Yd8VZ7yBILiMyqAi41SfJ5aoH42BlPWj82Rqzo
         1s7zerN5lZpu9Nwf1vCNhvHLCXQ8XXuYCfhbwVb44/CbomwOTHo5ScSsXlcKDpcL8uIn
         W8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Yw6P8uWcw4cBGcbaqsZpk8wARZfWeyzrk6CPKlNIqGs=;
        b=WNUEeML+1x5NbJqC/3y20pcAfd27Inu71lbnjr8XVvn9JRYwyiT8a4t2xOJE4xtqLM
         H7+iawQg0TRo/+57hDY+bShLeoO+rW6VHNKIX3CXXKnpj42NJHjsJ7w69h4CDWkrncKF
         D1uuNZk9c3W3vCdcgIE0gP/iYEpD20Y1lJEtxzu+zXzbbZC2H+DIgjLhnsLxK/yX1Qyg
         7hXmY+aPRUg+316/KFXRW41/hGSCFi8gWfnq5DhP3SsuiPv+US38G+1R5fiX+Kn7uLsD
         VPU90JOmi3FuphJM860z9v/vaZYbG8k9fePlqLrkCINvjV7Aiw6zeLpGUXvo8NjOoas5
         1SOw==
X-Gm-Message-State: ACrzQf12S/EfOIpH+3V+wI1VLSlN7kmSgrfiH2Tpf+U5LAUMX7X3r0XD
	fviL23hPH6rJxARf01AaSszaDXZSR8HmoYpmkuWA66lahhZ4Qg==
X-Google-Smtp-Source: AMsMyM7tO9Me9/88M6xHNncGBG95VQNc3dh6D/LBflbB8ZzRe4kwnfCLFPGUFg2KGHsW3v+MT7D7FeSPljtL5aHmFEE=
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr17848376wrr.130.1663778774822; Wed, 21
 Sep 2022 09:46:14 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:45:38 -0700
Message-ID: <CAM2SziVzGC6gx9wi50TVmREggeaa01AUBTk3sAUmV1SVwjEwPA@mail.gmail.com>
Subject: [PATCH 01/17] riscv: Rename __switch_to_aux -> fpu
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094617_637822_0E776C40 
X-CRM114-Status: UNSURE (   9.72  )
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

The name of __switch_to_aux is not clear and rename it with the
determine function: __switch_to_fpu. Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h
b/arch/riscv/include/asm/switch_to.h
index 11463489fec6..df1aa589b7fd 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -46,7 +46,7 @@ static inline void fstate_restore(struct task_struct *task,
        }
 }

-static inline void __switch_to_aux(struct task_struct *prev,
+static inline void __switch_to_fpu(struct task_struct *prev,
                                   struct task_struct *next)
 {
        struct pt_regs *regs;
@@ -65,7 +65,7 @@ static __always_inline bool has_fpu(void)
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif

 extern struct task_struct *__switch_to(struct task_struct *,
@@ -76,7 +76,7 @@ do {                                                  \
        struct task_struct *__prev = (prev);            \
        struct task_struct *__next = (next);            \
        if (has_fpu())                                  \
-               __switch_to_aux(__prev, __next);        \
+               __switch_to_fpu(__prev, __next);        \
        ((last) = __switch_to(__prev, __next));         \
 } while (0)

--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
