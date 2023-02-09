Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078D9C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JYpDhOfh2bbd9dNy7RLbFpubbxFuNYOoYFOkA/8pgl4=; b=O0U1+3h+gZLU+3
	JW9T1Dj9H7mry+xxyydF6JEcQS7yfLpIAUuR/EKNwI//8qUXbO3Z1LMzr+c0UeUUoA3Ir8jSnh0ms
	a3XIi0Pm7S6ax2NeR6Zuwu+yWrmGOWb+sWvJlRhox31Pqqt7ZqiSsd7/S8uWSo9Cl9fBSXvGrs1qN
	5lN2Gk93rUjpnJmip4IgADLEbunVEEhaTqr7u2bCei+2bCVYAnhvWgIELF9evrzJ+zug6mOpu6zyt
	t3L5agVci7gw2mebgy9cWIGyC8Ht0S3OSnlODxzY59UYdPI3tEMJJ1C6UHipjVY8b2CdC5NvavkGI
	lUzO/E65lMjFhD3gVSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6AR-001WfH-0x; Thu, 09 Feb 2023 12:36:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6AM-001WeQ-Al
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 12:36:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id c26so1108468ejz.10
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNeMNPSogBc2+cDtXQ0Rczlwa1OjhglQtQBbkHpO7iw=;
        b=cYTE/CGZmBsDBFx4ml1Dapm+ChemnUUXMHKkOnJV36R1HKGLHCKrocvcQyEyBRqa0B
         WHiwaYjNK2j3zB/VrJ4/ZZaGm/GjOSs/nMw4kI4AJSrZgkuXbxW5pz3/3GYPf1If9i5y
         2DmJF87Mdh/GM1ir7UFHQtj4fSxI0m7ZhNaNwZR4fnQEi229U3oiOVR3VfNMbE+Ovmhn
         efkab6Yk9Mlr5hI2HY0wPeuW46NEHU5PnAvPyjPSNS5vd1mXjvXv4+9b+8VNuxEHfpkx
         Xk7OWsfJoWYvCqrC/sj4TaQw5TwSp2COclNKZS3n1p6FGGLQvqfLGhL+oortJMZEGp4k
         AqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNeMNPSogBc2+cDtXQ0Rczlwa1OjhglQtQBbkHpO7iw=;
        b=kjQZGETbYq6VF12kfONuCuqfRbukA0PYzwlaHBg+eqKyC4PpRTrQ0FsUs4yfMOOPs/
         0GCeSHZff1vhFGy1pLtadx5IsiTG+Hv3C2W+iHTDDa4OH2PqyliYKUZ0lCAHRs7/s9fL
         YmEmwrkvdnSpIOmSW5kB8cYt6xOgMHxPEY5etui/xNyIeU47jp8b2iK0S+KNiMIkqStd
         H1I/QLIg1O+0RZ0X024DdvpWZM9Q9kv+Lsi5fWYsUTFPYwmKKDGlB7sEGwZQNDkgIQSt
         D3vpWLStcpnnulZMy4Ujga/Ui40Xn0Ib4hurwDLvlRSRatI9NCRx1STOrjl7R1C2aCw3
         ANNw==
X-Gm-Message-State: AO0yUKUq88dFTAFNSZb/zs8yE1ifzPaV5zeIvJKT+b1aFBGXz73YGsDJ
	Fc+KPEi1RtYKfbD3BCMEF5FdpH5Sv0Giy0Xz
X-Google-Smtp-Source: AK7set8N+fjZgz5msId3gzA1aGHnOGhAQNVDbEuJRAh/DPTH8kTMilRLUe/KuKSldpwF7zzUSerGaQ==
X-Received: by 2002:a17:906:f95:b0:886:7eae:26c4 with SMTP id q21-20020a1709060f9500b008867eae26c4mr12516649ejj.5.1675946198177;
        Thu, 09 Feb 2023 04:36:38 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id og49-20020a1709071df100b008898c93f086sm819537ejc.71.2023.02.09.04.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:36:37 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Qinglin Pan <panqinglin00@gmail.com>
Subject: [PATCH] riscv: hwcap: Don't alphabetize ISA extension IDs
Date: Thu,  9 Feb 2023 13:36:36 +0100
Message-Id: <20230209123636.123537-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_043642_393377_3B677583 
X-CRM114-Status: GOOD (  14.87  )
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

While the comment above the ISA extension ID definitions says
"Entries are sorted alphabetically.", this stopped being good
advice with commit d8a3d8a75206 ("riscv: hwcap: make ISA extension
ids can be used in asm"), as we now use macros instead of enums.
Reshuffling defines is error-prone, so, since they don't need to be
in any particular order, change the advice to just adding new
extensions at the bottom. Also, take the opportunity to change
spaces to tabs, merge three comments into one, and move the base
and max defines into more logical locations wrt the ID definitions.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 42 ++++++++++++++++------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index ee9c80fe0062..2a6dac9434b3 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -24,29 +24,27 @@
 #define RISCV_ISA_EXT_u		('u' - 'a')
 
 /*
- * Increse this to higher value as kernel support more ISA extensions.
- */
-#define RISCV_ISA_EXT_MAX	64
-#define RISCV_ISA_EXT_NAME_LEN_MAX 32
-
-/* The base ID for multi-letter ISA extensions */
-#define RISCV_ISA_EXT_BASE 26
-
-/*
- * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
- * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
- * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
- * extensions while all the multi-letter extensions should define the next
- * available logical extension id.
- * Entries are sorted alphabetically.
+ * These macros represent the logical IDs of each multi-letter RISC-V ISA
+ * extension and are used in the ISA bitmap. The logical IDs start from
+ * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
+ * letter extensions. The maximum, RISCV_ISA_EXT_MAX, is defined in order
+ * to allocate the bitmap and may be increased when necessary.
+ *
+ * New extensions should just be added to the bottom, rather than added
+ * alphabetically, in order to avoid unnecessary shuffling.
  */
-#define RISCV_ISA_EXT_SSCOFPMF         26
-#define RISCV_ISA_EXT_SSTC             27
-#define RISCV_ISA_EXT_SVINVAL          28
-#define RISCV_ISA_EXT_SVPBMT           29
-#define RISCV_ISA_EXT_ZBB              30
-#define RISCV_ISA_EXT_ZICBOM           31
-#define RISCV_ISA_EXT_ZIHINTPAUSE      32
+#define RISCV_ISA_EXT_BASE		26
+
+#define RISCV_ISA_EXT_SSCOFPMF		26
+#define RISCV_ISA_EXT_SSTC		27
+#define RISCV_ISA_EXT_SVINVAL		28
+#define RISCV_ISA_EXT_SVPBMT		29
+#define RISCV_ISA_EXT_ZBB		30
+#define RISCV_ISA_EXT_ZICBOM		31
+#define RISCV_ISA_EXT_ZIHINTPAUSE	32
+
+#define RISCV_ISA_EXT_MAX		64
+#define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
 #ifndef __ASSEMBLY__
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
