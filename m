Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5E2C07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268CB61411
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268CB61411
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qBHlxWRylhqre/yIxWFFnXlPQ4KGCeL/oIfRDJMLXwQ=; b=aS1BLFF/tZH/uITJp3o/em06tN
	9U2v7E4eQnR4JsAuVpAM2Y/M4pVEMPCZiC9wqcPrlEdftVGwkYT69brKqF8s7FBf+xASatjEfTgT5
	DufFK74pt2YlPC9vkWRN5QBhALweDEWyMqnq669Q+u1yrnfrunvsZOhfoj4+VoD7GLtoHN+4jCmwp
	ouxQ3E8EzH/RwZ7XCGbmawUxF6s/AUVuuwoQNqcvixJTSR7r0YrU6YZN7Wp5CySz7eWmlM1K0OdKz
	CSmyU3W3Y6CyueMC9xvkUawVyPSunUZ3I75pCVkBURVFn6moGg+cMynogoSOyege37LbIK9zpZFMh
	FkkSuZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6Zj-00CllW-0x; Fri, 04 Jun 2021 09:57:11 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6Zf-00Clks-JI
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 09:57:09 +0000
Received: by mail-qv1-xf33.google.com with SMTP id x2so3983726qvo.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=p62GDAxTOYvAFgFgLebKY9zfd90qlS2PCRW/KXSEFvE=;
 b=XInNjm08LIZFxY172kH12zI7gRXKbNMsLFVcVn3+GGs3wNFr5D0SxHBJ7kytmW+bcO
 jLb8S9AcJ0/nEgVIu8Wyv26Jb8L+fS+AySLBlHIzWB11yJynIHer7KdB8HNEZ3w+tmZY
 FMmBjlQ2mShedHeydoRUQ7wJKgJa809Lj/fO3wt+JbSCBqAEF0oG9wkeTo8YcPCV9qXz
 FYoC9xKCMUPpe6kBSjlLvYQpPeTaQj+xNt9szACIZbxvmucMosXB2iGjI7vg+Zipw7fj
 HAAiEPoigYVqtvO0EILA55I/O/UNVQ4jHkK7yfC3OLz/88SuAO1E40qgt8wkeh1vik0l
 0oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=p62GDAxTOYvAFgFgLebKY9zfd90qlS2PCRW/KXSEFvE=;
 b=Z/Dekyz+hxqff0dpYmlbCZQPD3C5KOC0ffWjO5EZrkkOGYFipErdpuQJL9dEckMF5Y
 T8GHk5a9IbK3lXPSMy9e5go1CugjsDQ/8ZqlK+Hbu+Wrzy0qp4f+vhJgNOVm55/p1rDW
 dUJM3XvtxdUdh6XB9D0HtGiXKHQMh9hTTwfxAvnAmNNRdMo2AM/qDvyUU4MKk6vYBsK5
 GF7Yer1fxD8tHrYRinhjIn9/RNgSOHCUj1pY0uj+otg7tanqzUt3U0c5HML90188eSRd
 rZktm0F98IWR0T+G6RZc6Ra3cDN0lvVAOsqYbBjUA8oD3QqZfZI152/JfveoGxAmnmAe
 iVtw==
X-Gm-Message-State: AOAM533Cl8mpA+VIWlhyvZ8d5PFvurY/p8KxAD/JqPAlZgYQgoQYkr+m
 lTM3tcxGxoHQ4NKmWbwGbOjCum/dbT5YREYQMq4=
X-Google-Smtp-Source: ABdhPJw8Ccckw0iX6AFGPspoELbNl6Ujbk6mftR7YZzEAohRkYzPVAwfZacvRcCItgXWGcQUw9k6AVs/YoigbtD5DjA=
X-Received: by 2002:a05:6214:2125:: with SMTP id
 r5mr3912708qvc.28.1622800625416; 
 Fri, 04 Jun 2021 02:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACuRN0NjftJDUAsF2pkXbx0jnJ=bba9+j-hJA8Mjj0r4RVicLA@mail.gmail.com>
In-Reply-To: <CACuRN0NjftJDUAsF2pkXbx0jnJ=bba9+j-hJA8Mjj0r4RVicLA@mail.gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Date: Fri, 4 Jun 2021 18:56:54 +0900
Message-ID: <CACuRN0Pd8VFTz55qzXvJeqOEt2ZGi--j1wDyqnAt=q_42ES++w@mail.gmail.com>
Subject: [PATCH 1/1] riscv: prevent pipeline stall in __asm_to/copy_from_user
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 Nick Hu <nickhu@andestech.com>, 
 Nylon Chen <nylon7@andestech.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 linux-riscv@lists.infradead.org, 
 Linux kernel mailing list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_025707_667650_2A3EAE28 
X-CRM114-Status: GOOD (  12.66  )
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

Reducing pipeline stall of read after write (RAW).

These are the results from combination of the speedup with
Gary's misalign fix. Speeds up from 680Mbps to 900Mbps.

Before applying these two patches.
---
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 192.168.1.153, port 45972
[  5] local 192.168.1.112 port 5201 connected to 192.168.1.153 port 45974
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  80.8 MBytes   678 Mbits/sec
[  5]   1.00-2.00   sec  82.1 MBytes   689 Mbits/sec
[  5]   2.00-3.00   sec  82.1 MBytes   688 Mbits/sec
[  5]   3.00-4.00   sec  81.7 MBytes   685 Mbits/sec
[  5]   4.00-5.00   sec  82.1 MBytes   689 Mbits/sec
[  5]   5.00-6.00   sec  82.0 MBytes   687 Mbits/sec
[  5]   6.00-7.00   sec  82.4 MBytes   691 Mbits/sec
[  5]   7.00-8.00   sec  82.2 MBytes   689 Mbits/sec
[  5]   8.00-9.00   sec  82.2 MBytes   690 Mbits/sec
[  5]   9.00-10.00  sec  82.2 MBytes   690 Mbits/sec
[  5]  10.00-10.01  sec   486 KBytes   682 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.01  sec   820 MBytes   688 Mbits/sec                  receiver
-----------------------------------------------------------
---

Afer.
---
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 192.168.1.153, port 44612
[  5] local 192.168.1.112 port 5201 connected to 192.168.1.153 port 44614
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   105 MBytes   879 Mbits/sec
[  5]   1.00-2.00   sec   108 MBytes   904 Mbits/sec
[  5]   2.00-3.00   sec   107 MBytes   901 Mbits/sec
[  5]   3.00-4.00   sec   108 MBytes   902 Mbits/sec
[  5]   4.00-5.00   sec   108 MBytes   906 Mbits/sec
[  5]   5.00-6.00   sec   107 MBytes   900 Mbits/sec
[  5]   6.00-7.00   sec   108 MBytes   906 Mbits/sec
[  5]   7.00-8.00   sec   108 MBytes   904 Mbits/sec
[  5]   8.00-9.00   sec   108 MBytes   902 Mbits/sec
[  5]   9.00-10.00  sec   108 MBytes   905 Mbits/sec
[  5]  10.00-10.01  sec   612 KBytes   902 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.01  sec  1.05 GBytes   901 Mbits/sec                  receiver
-----------------------------------------------------------
---

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 106 +++++++++++++++++++++++++++------------
 1 file changed, 73 insertions(+), 33 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index fceaeb18cc64..2528a77709e1 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -19,50 +19,90 @@ ENTRY(__asm_copy_from_user)
     li t6, SR_SUM
     csrs CSR_STATUS, t6

-    add a3, a1, a2
+    move t5, a0  /* Preserve return value */
+
+    /* Defer to byte-oriented copy for small sizes */
+    sltiu a3, a2, 64
+    bnez a3, 4f
     /* Use word-oriented copy only if low-order bits match */
-    andi t0, a0, SZREG-1
-    andi t1, a1, SZREG-1
-    bne t0, t1, 2f
+    andi a3, t5, SZREG-1
+    andi a4, a1, SZREG-1
+    bne a3, a4, 4f

-    addi t0, a1, SZREG-1
-    andi t1, a3, ~(SZREG-1)
-    andi t0, t0, ~(SZREG-1)
+    beqz a3, 2f  /* Skip if already aligned */
     /*
-     * a3: terminal address of source region
-     * t0: lowest XLEN-aligned address in source
-     * t1: highest XLEN-aligned address in source
+     * Round to nearest double word-aligned address
+     * greater than or equal to start address
      */
-    bgeu t0, t1, 2f
-    bltu a1, t0, 4f
+    andi a3, a1, ~(SZREG-1)
+    addi a3, a3, SZREG
+    /* Handle initial misalignment */
+    sub a4, a3, a1
 1:
-    fixup REG_L, t2, (a1), 10f
-    fixup REG_S, t2, (a0), 10f
-    addi a1, a1, SZREG
-    addi a0, a0, SZREG
-    bltu a1, t1, 1b
-2:
-    bltu a1, a3, 5f
+    lb a5, 0(a1)
+    addi a1, a1, 1
+    sb a5, 0(t5)
+    addi t5, t5, 1
+    bltu a1, a3, 1b
+    sub a2, a2, a4  /* Update count */

+2:
+    andi a4, a2, ~((8*SZREG)-1)
+    beqz a4, 4f
+    add a3, a1, a4
 3:
+    fixup REG_L a4,       0(a1), 10f
+    fixup REG_L a5,   SZREG(a1), 10f
+    fixup REG_L a6, 2*SZREG(a1), 10f
+    fixup REG_L a7, 3*SZREG(a1), 10f
+    fixup REG_L t0, 4*SZREG(a1), 10f
+    fixup REG_L t1, 5*SZREG(a1), 10f
+    fixup REG_L t2, 6*SZREG(a1), 10f
+    fixup REG_L t3, 7*SZREG(a1), 10f
+    fixup REG_S a4,       0(t5), 10f
+    fixup REG_S a5,   SZREG(t5), 10f
+    fixup REG_S a6, 2*SZREG(t5), 10f
+    fixup REG_S a7, 3*SZREG(t5), 10f
+    fixup REG_S t0, 4*SZREG(t5), 10f
+    fixup REG_S t1, 5*SZREG(t5), 10f
+    fixup REG_S t2, 6*SZREG(t5), 10f
+    fixup REG_S t3, 7*SZREG(t5), 10f
+    addi a1, a1, 8*SZREG
+    addi t5, t5, 8*SZREG
+    bltu a1, a3, 3b
+    andi a2, a2, (8*SZREG)-1  /* Update count */
+
+4:
+    /* Handle trailing misalignment */
+    beqz a2, 6f
+    add a3, a1, a2
+
+    /* Use word-oriented copy if co-aligned to word boundary */
+    or a5, a1, t5
+    or a5, a5, a3
+    andi a5, a5, 3
+    bnez a5, 5f
+7:
+    fixup lw a4, 0(a1), 10f
+    addi a1, a1, 4
+    fixup sw a4, 0(t5), 10f
+    addi t5, t5, 4
+    bltu a1, a3, 7b
+
+    j 6f
+
+5:
+    fixup lb a4, 0(a1), 10f
+    addi a1, a1, 1
+    fixup sb a4, 0(t5), 10f
+    addi t5, t5, 1
+    bltu a1, a3, 5b
+
+6:
     /* Disable access to user memory */
     csrc CSR_STATUS, t6
     li a0, 0
     ret
-4: /* Edge case: unalignment */
-    fixup lbu, t2, (a1), 10f
-    fixup sb, t2, (a0), 10f
-    addi a1, a1, 1
-    addi a0, a0, 1
-    bltu a1, t0, 4b
-    j 1b
-5: /* Edge case: remainder */
-    fixup lbu, t2, (a1), 10f
-    fixup sb, t2, (a0), 10f
-    addi a1, a1, 1
-    addi a0, a0, 1
-    bltu a1, a3, 5b
-    j 3b
 ENDPROC(__asm_copy_to_user)
 ENDPROC(__asm_copy_from_user)
 EXPORT_SYMBOL(__asm_copy_to_user)
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
