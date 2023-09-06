Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702D0EB8FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 04:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUTBd+UXux6rlU4Q+mZd6YuyBK06VfDYYpnZc+Vy4OI=; b=Xd9cQR0g1K87JH
	gzN/pjFu5V/YrfNzfDNZwIm0YpODCYSzNvUM3XZmnhB6xGlOfJNTqBuZgR1bZvD50UMTyaURKmddb
	e5a7SJO9qaFi6c8HK5wwHcFPNKFqtoGA4JvwIpW7WmDDk28TYoOr4dZtRt1K7xwV+SwZXn4URzqcF
	UPn/aaHmdrJyGvs0ZmdegZHn0dVpZ37UdW9FlpIXNQR9osU1qFlRF/+eTGIhMAVoqTamrxMjmAmwO
	cpGECe0AS49ePaXfjKLiefUpZCc9d1IK9Qx1fU4DUHxdIWcHZY5r0A0oKt08LzpLvK9IbqPzYYKpq
	Zl+lBm2RmPmWMlt17bYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRn-007Fbh-2W;
	Wed, 06 Sep 2023 04:47:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRi-007FYx-3D
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 04:47:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bf1935f6c2so3991175ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 21:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693975636; x=1694580436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pC6fMrxiPM6PX4ZKYPXZ18bjUEmiAKintmn8mf3Gycg=;
        b=Wtws8wLZD8Nt7vfjJVejT0Q7Zu5xXOb2OzxZQFa6rtnt6mX1X705Xm9TcYr9xwzKvH
         UzRbZ8wK9AzwjZIaSicXdadT0aI+JLGBagRJX/oElQbxRkYeUG5sevm/o2HS2U8WDoxj
         iQcrcTR3QGDaKcUXVLsEWmXas0PrJ5QlnzJymTFYG6nS6n5nf6uVJQiVDjGMhqYYmUgb
         mQFB+9PpHfqb4LRkZZp31uYh52bS5oiKRFa7wdwE+eJqVEzTdqvQJOUkN4d+wTivjn23
         q+aBjiXgMO2+ULWed8RbesXC/lCPG5HZ5wUYtj/IrGMtfV5vZUh2r/07LjyFnWOMXo7e
         AcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693975636; x=1694580436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC6fMrxiPM6PX4ZKYPXZ18bjUEmiAKintmn8mf3Gycg=;
        b=PTGZS4nru+Kl13mdLZYbRmMreNijhmuS44ngk/Ju4VaR5tYCNVkvl5eqAmYRQ1bnYs
         fREqzttbJGR5ANmtRkx1tPlgC2wSELKkW1x2tPdQZvJAwdL8MaM0I43UCrcWym7E+oZ5
         vgEPh18KrSkXeQOJ2iDhWQnwZxuIoMhvI8BH2ZpJcxhQMJT6RxiD4RF+6MAjvYGfR4gf
         iedB+1oh5UZPuDKuFbgFf+fiqJtu9st36senNsuVJdQepOpPXY/vUgANQ8CIYJW9bflD
         r1N9XuIpqPHD4gW7VQheC+0osV6uayB3SkpaFbAdmcv3ZwEtrPm4mTEHhk+bi5nMXglx
         XESw==
X-Gm-Message-State: AOJu0YylJMFjpS4vBsfjiF6PSXL/qruZLcdRGTQtjpthxjtPf6vluPGG
	0m7ACrGvlp3P6WPh4dXmU2jtQA==
X-Google-Smtp-Source: AGHT+IF3hLuJVMY5VEx+Jx/XBHupQVgXjaJh6LKZ1JrX6r6XMhKoO3c1y3QvRTWL3Jk4/kBtOjbhXA==
X-Received: by 2002:a17:902:d4ce:b0:1b6:a37a:65b7 with SMTP id o14-20020a170902d4ce00b001b6a37a65b7mr20966438plg.23.1693975635980;
        Tue, 05 Sep 2023 21:47:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001bc56c1a384sm10087313plt.277.2023.09.05.21.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 21:47:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 05 Sep 2023 21:46:53 -0700
Subject: [PATCH v2 4/5] riscv: Vector checksum library
MIME-Version: 1.0
Message-Id: <20230905-optimize_checksum-v2-4-ccd658db743b@rivosinc.com>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
In-Reply-To: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_214719_033573_77E6DCC1 
X-CRM114-Status: GOOD (  15.30  )
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

This patch is not ready for merge as vector support in the kernel is
limited. However, the code has been tested in QEMU so the algorithms
do work. When Vector support is more mature, I will do more thorough
testing of this code. It is written in assembly rather than using
the GCC vector instrinsics because they did not provide optimal code.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/lib/csum.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 87f1f95f44c1..e44edd056625 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -12,6 +12,10 @@
 
 #include <net/checksum.h>
 
+#ifdef CONFIG_RISCV_ISA_V
+#include <riscv_vector.h>
+#endif
+
 /* Default version is sufficient for 32 bit */
 #ifndef CONFIG_32BIT
 __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
@@ -115,6 +119,108 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	offset = (csum_t)buff & OFFSET_MASK;
 	kasan_check_read(buff, len);
 	ptr = (const csum_t *)(buff - offset);
+#ifdef CONFIG_RISCV_ISA_V
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		/*
+		 * Vector is likely available when the kernel is compiled with
+		 * vector support, so nop when vector is available and jump when
+		 * vector is not available.
+		 */
+		asm_volatile_goto(ALTERNATIVE("j %l[no_vector]", "nop", 0,
+					      RISCV_ISA_EXT_v, 1)
+				  :
+				  :
+				  :
+				  : no_vector);
+	} else {
+		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_v))
+			goto no_vector;
+	}
+
+	len += offset;
+
+	vuint64m1_t prev_buffer;
+	vuint32m1_t curr_buffer;
+	unsigned int shift, cl, tail_seg;
+	csum_t vl, csum;
+	const csum_t *ptr;
+
+#ifdef CONFIG_32BIT
+	csum_t high_result, low_result;
+#else
+	csum_t result;
+#endif
+
+	// Read the tail segment
+	tail_seg = len % 4;
+	csum = 0;
+	if (tail_seg) {
+		shift = (4 - tail_seg) * 8;
+		csum = *(unsigned int *)((const unsigned char *)ptr + len - tail_seg);
+		csum = ((unsigned int)csum << shift) >> shift;
+		len -= tail_seg;
+	}
+
+	unsigned int start_mask = (unsigned int)(~(~0U << offset));
+
+	riscv_v_enable();
+	asm(".option push						\n\
+	.option arch, +v						\n\
+	vsetvli %[vl], %[len], e8, m1, ta, ma				\n\
+	# clear out mask and vector registers since we switch up sizes	\n\
+	vmclr.m v0							\n\
+	vmclr.m %[prev_buffer]						\n\
+	vmclr.m %[curr_buffer]						\n\
+	# Mask out the leading bits of a misaligned address		\n\
+	vsetivli x0, 1, e64, m1, ta, ma					\n\
+	vmv.s.x %[prev_buffer], %[csum]					\n\
+	vmv.s.x v0, %[start_mask]					\n\
+	vsetvli %[vl], %[len], e8, m1, ta, ma				\n\
+	vmnot.m v0, v0							\n\
+	vle8.v %[curr_buffer], (%[buff]), v0.t				\n\
+	j 2f								\n\
+	# Iterate through the buff and sum all words			\n\
+	1:								\n\
+	vsetvli %[vl], %[len], e8, m1, ta, ma				\n\
+	vle8.v %[curr_buffer], (%[buff])				\n\
+	2:								\n\
+	vsetvli x0, x0, e32, m1, ta, ma					\n\
+	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\t"
+#ifdef CONFIG_32BIT
+	"sub %[len], %[len], %[vl]					\n\
+	slli %[vl], %[vl], 2						\n\
+	add %[buff], %[vl], %[buff]					\n\
+	bnez %[len], 1b							\n\
+	vsetvli x0, x0, e64, m1, ta, ma					\n\
+	vmv.x.s %[result], %[prev_buffer]				\n\
+	addi %[vl], x0, 32						\n\
+	vsrl.vx %[prev_buffer], %[prev_buffer], %[vl]			\n\
+	vmv.x.s %[high_result], %[prev_buffer]				\n\
+	.option pop"
+	    : [vl] "=&r"(vl), [prev_buffer] "=&vd"(prev_buffer),
+	      [curr_buffer] "=&vd"(curr_buffer),
+	      [high_result] "=&r"(high_result), [low_result] "=&r"(low_result)
+	    : [buff] "r"(ptr), [len] "r"(len), [start_mask] "r"(start_mask),
+	      [csum] "r"(csum));
+
+	high_result += low_result;
+	high_result += high_result < low_result;
+#else // !CONFIG_32BIT
+	"subw %[len], %[len], %[vl]					\n\
+	slli %[vl], %[vl], 2						\n\
+	addw %[buff], %[vl], %[buff]					\n\
+	bnez %[len], 1b							\n\
+	vsetvli x0, x0, e64, m1, ta, ma					\n\
+	vmv.x.s %[result], %[prev_buffer]				\n\
+	.option pop"
+	    : [vl] "=&r"(vl), [prev_buffer] "=&vd"(prev_buffer),
+	      [curr_buffer] "=&vd"(curr_buffer), [result] "=&r"(result)
+	    : [buff] "r"(ptr), [len] "r"(len), [start_mask] "r"(start_mask),
+	      [csum] "r"(csum));
+#endif // !CONFIG_32BIT
+	riscv_v_disable();
+no_vector:
+#endif // CONFIG_RISCV_ISA_V
 	len = len + offset - sizeof(csum_t);
 
 	/*

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
