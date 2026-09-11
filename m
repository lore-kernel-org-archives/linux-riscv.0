Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88BEC88E5A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 18:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqWmXN6nhlmlbcH9Tp36/READzvi9G1HCudlkSodl9w=; b=RUjx7LzPktvhE7
	E2sOWd3msvqf/4keFq31DUFjgA3pFuglBr+SSMGdgQwkrXKQ2Aqu1dFSlvW9U6MTBWZdJ0yJ6f3lm
	Dj6BeuBpmPuFOtNB3IXY2pTB1pJN1XzZRBita7liBKFvswOmxWeKrSWG9s+u83ngeEy6FXzGZEb9o
	ZnFK6UEwHIPO82yehQiUIqcT+bjl5VFZd1CuY1kKABgvksn69dfmq5S+YAh7Mdysu9T8kY/iKVUA6
	T8fqycy04T6OLcbNAd5LKGJyFbSMjT0WdEVqO/8vtEuc/MHSEO8ZLjlNrXRJSWPZbaz6WHZbGTfrd
	z6oC49niJ64dy5oYeGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55v3-0000000HQsV-0sv1;
	Fri, 11 Sep 2026 18:24:13 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55v1-0000000HQqn-1KbY
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 18:24:12 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4ab2029eso67056d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789151050; x=1789755850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnw+eSMmqT2cMW48D3VMm6LteKBDWLrfwBvsi1WjswY=;
        b=ABf1RwcM4hxIiD9Jc+ymbWPrJMIbJ3nmmhqmj25PCLdDF7x7QXRORDc3ZFKMXZDpBr
         nZniwIm1rwNW+2dSB/LVXOb9E0yzB0Q/bMICyn7UGnfxnKBbJ9MV0cPvI/GgiZk4R9Ew
         meLdGXVCUjl/k1LCBlFdiEAKP72WRWvqOpPByoAmOpuNVg03fNxiEzDKZYLHM9drg24s
         neJSwqvxnVn/vHDl23BOiBG/VbjwBht3UV86NyYVzOptIskUaNP1ATGWOygpdYMQmCHB
         A1SaV7ITX8wOxh7yFYyxv6C0VsFcfMRC+j1EvFgND1PBlYphmlNpCGCBt2xuF1OUjWQ6
         CIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151050; x=1789755850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnw+eSMmqT2cMW48D3VMm6LteKBDWLrfwBvsi1WjswY=;
        b=C+1JrsV43bcUkTMwgNNWbe+TV8HyojXaA9GKyvufWO7asVcgMMBra+CT81UmY6eB8E
         X+uUFsoPK5FLaLuAQk7aqypChb0Fle+82EhRgR12YskZNbGzxWfu7m2YpcAzZAg6TA8Z
         yrLne9iFVEucqbGx1Q0trp588l2akerA3KyCX5VO6nBbbBsIloSqA4vc24UnDDsO9gJk
         1oBMe5EE9kJdUa2qrMy+ZmqT9nFaK067V7kjMtMjEKk6TWRxMwr7tlhh3k3yhayQNC+E
         F9xLrlsCfDYIeFzQfRaV2LmXQP6FDdJHvVt6aZZGlR0u16fNlFgQmA/G2zhh2VVjG9A9
         63GA==
X-Forwarded-Encrypted: i=1; AKwUvBz4wxv7dF0l3mIWIiVUNzb5M/yRuhIOw9qQ/YeyBEgmUKYnfu1R4EbaFLiaJvmtMLOFqbUGC3kkUbYEPw==@lists.infradead.org
X-Gm-Message-State: AFuF++miUN+NX+WkOV0To4fUNMF/PZTllAN9ERUcGuIfJet9kiiH9Dle
	7I+g0G1s6UGaYFlwbuNRa+wQnlPuVVsxxT+crSYDrK9LKx0QbWnkSBU4fQVA2Mdgz1c=
X-Gm-Gg: AYBFou1C/AICTR/Rlhnjv/ypN3KQOKsEwWNV6eCcY1d51oyK3H/m6MHThWt/r2FLKN4
	ZQoMIP4a76RINPxSwJF32J6lCXxvrRoiUrKEIRO5ffvv7pC6HReeasQRk3fvtEmU0TOziMJ5Pj8
	tEUnQKtNweGwqWuSu21UHwD6emc7jw1TpDWDaN98vk0KuOoCllJOIVInOJi3nEbEI8GHIAd04Dh
	pO5uyyAPNT1UhIAZ4ytsHJcwLPsS6JFcxH7FMd4f10esM+63l7QnJSfA+mvYdllBchPuvb9yAOK
	ghaXkaa2Upjc2B09Z57BX4lTHrqOyO8524ItUdNO0Tle4Vly0zjw3mtAHThD+309MLimw3gJVgU
	iOZkOQgNnRXC8jpeB7Auq5j6HgOUv11GKo1dI+oulWANgMo0DMyLcd9eAd0ayfeLXdxqQwtuaeI
	r1HkWnOpEJBcx5oOLTPsotPfzPW6yy0qdZESiXBBJezw52ATFhCTVInVJA/XDD/J6onW8RIamev
	5/whqOYJQ7xIYpvOoMi1pwdUUieu604qLSe/OwUSdyaTJb7tIEIusLUr2hEXwRLYzmhAdTtZ88h
	qz14z/Pjs1dPaEEmVw==
X-Received: by 2002:a05:690e:bcb:b0:66f:c1bc:87ea with SMTP id 956f58d0204a3-671249f42b0mr1868353d50.67.1789151050314;
        Fri, 11 Sep 2026 11:24:10 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-671259a30b1sm1385517d50.0.2026.09.11.11.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:24:10 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v1 2/2] riscv: optmize ucopy for has_fast_unaligned_accesses
Date: Fri, 11 Sep 2026 13:24:00 -0500
Message-ID: <20260911182402.1434257-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911182402.1434257-1-tchiu@tenstorrent.com>
References: <20260911182402.1434257-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_112411_372718_BDEE5EB6 
X-CRM114-Status: GOOD (  15.79  )
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

Skipping the software aligning code increases the ucopy bandwidth by up
to 11.4%. Commit b94cec5761d2 ("riscv: skip software algning code for
HAVE_EFFICIENT_UNALIGNED_ACCESS") provides this optimization at compile
time, which depends on NONPORTABLE. This patch extends it such that the
optimization can be enabled at runtime, after the unaligned access speed
is resolved.

To do so, we utilize the assembly version of static key and connect it
to fast_unaligned_access_speed_key. The kernel jumps to the software
aligning code as the default behavior, then the jump is optimized to an
nop if the platform supports native misaligned access.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/lib/uaccess.S | 61 ++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index cf8586a937de..ad1457e789fb 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -5,6 +5,7 @@
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
+#include <asm/jump_label.h>
 
 	.macro fixup op reg addr lbl
 100:
@@ -77,33 +78,11 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	bltu	a2, a3, .Lbyte_copy_tail
 
 #if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
-	/*
-	 * Copy first bytes until dst is aligned to word boundary.
-	 * a0 - start of dst
-	 * t1 - start of aligned dst
-	 */
-	addi	t1, a0, SZREG-1
-	andi	t1, t1, ~(SZREG-1)
-	/* dst is already aligned, skip */
-	beq	a0, t1, .Lskip_align_dst
-1:
-	/* a5 - one byte for copying data */
-	fixup lb      a5, 0(a1), 10f
-	addi	a1, a1, 1	/* src */
-	fixup sb      a5, 0(a0), 10f
-	addi	a0, a0, 1	/* dst */
-	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
-
-.Lskip_align_dst:
-	/*
-	 * Now dst is aligned.
-	 * Use shift-copy if src is misaligned.
-	 * Use word-copy if both src and dst are aligned because
-	 * can not use shift-copy which do not require shifting
-	 */
-	/* a1 - start of src */
-	andi	a3, a1, SZREG-1
-	bnez	a3, .Lshift_copy
+#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS) && defined(CONFIG_JUMP_LABEL)
+	ARCH_STATIC_BRANCH_JUMP_ASM(fast_unaligned_access_speed_key + 1, .Lalign_dst)
+#else
+	j	.Lalign_dst
+#endif
 #endif
 .Lword_copy:
         /*
@@ -139,6 +118,34 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	j	.Lbyte_copy_tail
 
 #if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
+.Lalign_dst:
+	/*
+	 * Copy first bytes until dst is aligned to word boundary.
+	 * a0 - start of dst
+	 * t1 - start of aligned dst
+	 */
+	addi	t1, a0, SZREG-1
+	andi	t1, t1, ~(SZREG-1)
+	/* dst is already aligned, skip */
+	beq	a0, t1, .Lskip_align_dst
+1:
+	/* a5 - one byte for copying data */
+	fixup lb      a5, 0(a1), 10f
+	addi	a1, a1, 1	/* src */
+	fixup sb      a5, 0(a0), 10f
+	addi	a0, a0, 1	/* dst */
+	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
+
+.Lskip_align_dst:
+	/*
+	 * Now dst is aligned.
+	 * Use shift-copy if src is misaligned.
+	 * Use word-copy if both src and dst are aligned because
+	 * can not use shift-copy which do not require shifting
+	 */
+	/* a1 - start of src */
+	andi	a3, a1, SZREG-1
+	beqz	a3, .Lword_copy
 .Lshift_copy:
 
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
