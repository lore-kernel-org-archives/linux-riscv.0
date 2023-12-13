Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3259C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KR5QgNnfFLbPPCFll1K5UuazPqlBHbAY5viefaIxGKI=; b=dRMMv3yvEph5UT
	F7BQHEHlbJQcCw6X6f2RLxSTTuiQHbBWI8814zGLR4mGHOpMcS+5RnYkGgKrkuRuwS5Yrg5yD7/St
	xLVnDWvXh8IgaLzPavz6LCMx4PoQLQBkDOkNrqKagvZpm6BbUE7WYsytgVB5n1VNLmSeQWy3aVgL5
	xnxG7d/DF2UMTgX2f70UIF1o31cWefSq4llvJhMaXtAC/hgNQG4R0OWCdw9ip/p8s2+OFU5jOr+WE
	jdgmg4DbYDkkOk+Wl8CI14yO0Dq8LmSLKGmEC4Qb7TQqNSb/eP2s5lmd0wr0pUDTK0JWamRkj8ejJ
	AdpUFo+/in+bq2RE9L3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRQb-00FJgO-1z;
	Wed, 13 Dec 2023 15:45:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRQY-00FJdq-1I
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 15:45:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c362efc2dso8619465e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702482334; x=1703087134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6lUS/g1laxQCVVAVJXpN956K5iMIXsWwq/VHyu1zHk=;
        b=XGjBeM0Z4B9cMTp5J+O/x9KGcSihOACO8ccQ5FV1P82QOiuDiz5yz1aeH6jyqovcEi
         mjPziNK1q1z7le+pLVsP4AGWlxLUhNmXuK9GhYYlCpC4xAqlRzZqXTINKp3iKX5jQl0m
         I9ETkS97FruS0XT4DCXyE8C1hUaNFlNze2xpXruj7ZXe0D2WUaT3dvrl7YbSrQbrMvZ/
         /Gff9NcK6MAck26e+OpTgOAm4foyUHmR31cehF9+nJRhMpBX1QlqEgtZFCUIfSJFBnVn
         yrjNtbTAFclKA0H+UInNOvixbAZYg59VEJLvzEhbsbq5b4tdCvxi7WYqoptqyX/dOBd7
         3GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482334; x=1703087134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6lUS/g1laxQCVVAVJXpN956K5iMIXsWwq/VHyu1zHk=;
        b=uTIERVs8n8+WBQ84f0IWvBhZqVpywofP/FjPXtYLAguBnvfz0B9/bQB1zbEvZcBGCJ
         8n14vUaXLlgt6pzhIEngo79n3xxyH+JB+VKvUKsX0DVKvL8yszNVMn/jFJqBZUmIwMfO
         HgilbWWIDHrKswyVhgbKUR3Gxyj9Y6NGYzZUb++7J2HFyheMmE4w1nk2Gkd10lbbYQWc
         ++WAZP4mt7YmeccweWpbRBYDN8PaoNWwgWZqPGcmMm368GT1FrqzmY2xzmZkvDb8wBJR
         M14aW4HUWS2LgR84cWpDefEGQ/Tp5sLZTwE6drTHCrmsZe5Q0CbTANMyfbVldRjC+HGC
         Qu0A==
X-Gm-Message-State: AOJu0Yw/0h/JzGmK7fKQKuf8gV3qVFw9tPN4nSyBXQ4RQCck+puxEdPZ
	AJP8qRwemTEYVyXE1WE+Qsk=
X-Google-Smtp-Source: AGHT+IGshHAl2eK9hEA+3zLn++WEHxJirAYQ6TQG8PT1AbNLEWonPLRlRz4I8Rm+Ma+qjjtZHqjgEw==
X-Received: by 2002:a5d:64ee:0:b0:333:538a:af10 with SMTP id g14-20020a5d64ee000000b00333538aaf10mr10212763wri.6.1702482333813;
        Wed, 13 Dec 2023 07:45:33 -0800 (PST)
Received: from ivan-HLYL-WXX9.guest.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b00333404e9935sm13546482wrx.54.2023.12.13.07.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:45:33 -0800 (PST)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	samuel@sholland.org,
	alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] riscv: lib: Optimize 'strlen' function
Date: Wed, 13 Dec 2023 15:45:30 +0000
Message-Id: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_074538_439585_D4E143BA 
X-CRM114-Status: GOOD (  16.35  )
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

The current non-ZBB implementation of 'strlen' function iterates the
memory bytewise, looking for a zero byte. It could be optimized to use
the wordwise iteration instead, so we will process 4/8 bytes of memory
at a time.

Word could be tested for containing the zero byte in just 4 operations:

1. Subtract 0x0101..01 from the word. If there was a zero byte in the
word, the leading zero bit of this byte will turn to 1.
2. Calculate ~word.
3. And the subtraction result with ~word. That way we will know if some
bits were 0 and then turned to 1.
4. And the result of step 3 with 0x8080..80. 0x8080..90 filters leading
bits for every byte in the word, so we will know if one of them turned
from 0 to 1.

This patch modifies the riscv-specific strlen function to work in the
following way:

1. If the address is unaligned, iterate SZREG - (address % SZREG) bytes
to align it.
2. After the address is aligned, iterate words of memory and check them
for containing the zero byte using the algorithm described above.
3. When we found a word with a zero byte, iterate through the word
bytewise to get the exact position of the 0 and return the corresponding
string length.

Here you can find the benchmarking results for the VisionFive2 board
comparing the old and new implementations of the strlen function.

Size: 1 (+-0), mean_old: 673, mean_new: 666
Size: 2 (+-0), mean_old: 672, mean_new: 676
Size: 4 (+-0), mean_old: 685, mean_new: 659
Size: 8 (+-0), mean_old: 682, mean_new: 673
Size: 16 (+-0), mean_old: 718, mean_new: 694
Size: 32 (+-0), mean_old: 753, mean_new: 726
Size: 64 (+-3), mean_old: 835, mean_new: 773
Size: 128 (+-8), mean_old: 994, mean_new: 821
Size: 256 (+-4), mean_old: 1314, mean_new: 924
Size: 512 (+-38), mean_old: 1978, mean_new: 1105
Size: 1024 (+-40), mean_old: 3263, mean_new: 1542
Size: 2048 (+-54), mean_old: 5871, mean_new: 2352
Size: 4096 (+-155), mean_old: 11061, mean_new: 3972
Size: 8192 (+-542), mean_old: 21431, mean_new: 7214
Size: 16384 (+-43), mean_old: 42239, mean_new: 13722
Size: 32768 (+-2712), mean_old: 85674, mean_new: 28471
Size: 65536 (+-907), mean_old: 189219, mean_new: 74236
Size: 131072 (+-1343), mean_old: 377023, mean_new: 147130
Size: 262144 (+-411), mean_old: 752993, mean_new: 292799
Size: 524288 (+-12242), mean_old: 1504279, mean_new: 583952

The function was tested on different string lengths and random offsets
(to check how it works with unaligned addresses). The clocks count were
measured with ktime_get and the mean values are calculated from 1000
test runs for every string length.

You can notice that the new function is slightly faster for small string
lengths and 2-3 times faster for longer strings, therefore I believe
this change could be really useful.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 arch/riscv/lib/strlen.S | 72 +++++++++++++++++++++++++++++++----------
 1 file changed, 55 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 8ae3064e45ff..76486dd3c07d 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -5,29 +5,67 @@
 #include <asm/alternative-macros.h>
 #include <asm/hwcap.h>
 
-/* int strlen(const char *s) */
-SYM_FUNC_START(strlen)
+#define REP_80 __REG_SEL(0x8080808080808080, 0x80808080)
+#define REP_01 __REG_SEL(0x0101010101010101, 0x01010101)
 
+/* size_t strlen(const char *s) */
+SYM_FUNC_START(strlen)
 	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
 
 	/*
-	 * Returns
-	 *   a0 - string length
-	 *
-	 * Parameters
-	 *   a0 - String to measure
-	 *
-	 * Clobbers:
-	 *   t0, t1
-	 */
-	mv	t1, a0
+         * Returns
+         *   a0 - string length
+         *
+         * Parameters
+         *   a0 - String to measure
+         *
+         * Clobbers:
+         *   t0, t1, t2, t3, t4
+         */
+
+
+	mv t4, a0
+
+	/* Check the address memory alignment */
+	andi t2, a0, SZREG-1
+	beqz t2, 2f
+
+	/* Get SZREG - (address remainder) */
+	xori t2, t2, SZREG-1
+	addi t2, t2, 1
+
+	/* align the address */
+	add t2, a0, t2
 1:
-	lbu	t0, 0(t1)
-	beqz	t0, 2f
-	addi	t1, t1, 1
-	j	1b
+	beq a0, t2, 2f
+	lbu t1, 0(a0)
+	beqz t1, 5f
+	addi a0, a0, 1
+	j 1b
 2:
-	sub	a0, t1, a0
+	li t2, REP_80
+	li t3, REP_01
+3:
+	/* v contains 0 byte if (v - 0x0101..01) & ~v & 0x8080..80 != 0 */
+	REG_L t0, 0(a0)
+	sub t1, t0, t3
+	not t0, t0
+	and t1, t1, t0
+	and t1, t1, t2
+	bnez t1, 4f
+	addi a0, a0, SZREG
+	j 3b
+4:
+	/*
+	 * We found the word with 0, iterate it byte-wise to find the actual
+	 * string length.
+	 */
+	lbu t0, 0(a0)
+	beqz t0, 5f
+	addi a0, a0, 1
+	j 4b
+5:
+	sub a0, a0, t4
 	ret
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
