Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19983C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouudiRHdDqYhRJyMVqjr7OGs7TIswItqnBrrQh+2J7c=; b=l7CymzciyCyGUd
	Aq0IFelYb/e022e1CdJM9qGcSLciqLx+YLq+RQEnVxzoBLuS/J0ui4lYMIzT1X74+wL7kuSYrsdhS
	S4C7kei5O2o03htJDVD7KOJ7Vpq6/HzLXiAXco+fhndQap+nT78Y50gmLOpY/09rdUrOJw3WvfQn0
	7+SnpPkdHXJn3gcV+/oP3+LZY0XapxF8+mqeiOwAYN21UrzO+ZoF8DsbsezVbsQjK/OZQKlAB93Lx
	nPI39Cg6Tx9t+V9IT3kUrAry60+y/fMbD23rkzCm4iJGBZVJhKoEezFrJTOESAx9etGzX7t4o1Pgn
	Rz/XLPq9LpoePu/OzgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKco-002seY-02;
	Tue, 09 May 2023 10:31:18 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKcl-002sbo-0z
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:16 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-52cbd7e73d2so3267673a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628273; x=1686220273;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=du0Io6LpcTYopchyJqH+rRocOYaZGCdablSccjAYQc49Ba6S0Rrmyl+ci/Z+nxxPQw
         YaGBoKgHS8g3Qaggx+BYSu+hG+hAq80EgnZUR8Ct3LhmNYq4RlRrKbL4AwRUdiHmIlkD
         OcFpHCYfFBsM0b1GAsqbvXLC/uMZqsaurfdT4Zi4oZieblml1tYf+lAmm06k2j/ghmRA
         nZJfoSzceS6dk8Uj9dFuPVrcmHIow3ct78SnSgotzluof0dvxdUaahq1BZuj286W1pZO
         XxyuRuSDnvPxZj5Nc+Egn1JuGzOsL+9sOHwXxobILy/DT2BmJPKbef9R6okXZQ478eGF
         TGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628273; x=1686220273;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=MyyJ1bngJMvDrbnbIFV9tUu9qNmoauwtTiXf2jUnHkcRM4PoWgmVZ06Y+Jy+Yp4zPh
         UxA5r639bLjB74K1FUujaybM9W4jjYSE/oW+PpXnMBnscvDlMarMW0Mlmwh4O2LkWVQx
         AJT5+9RykP/KSPNaJ0ugHyMiHsCDYNntAPnl+3Fn2LvAgZjSfpOpBBUcI1FAGOI9iKmb
         UUHo8kNQLIk/LH01tev1G0U2EihwiHvA+2MHZX6Ruk3R2i6ghRcX0QHL3CotOHUWzEKt
         V0MhHFnldQPHSZ2aUDBrFvw8+DmEqZwTDhrtr+vAkSKgevsGE9fztPO+nFZklRHNoX53
         GFbQ==
X-Gm-Message-State: AC+VfDztPbILQoZMZZjHb2kzXM5ZeTGfqw7s9MvtR9QVGIpSgWX9B13x
	bKHFciWFxIn3X+TYeCj8A6KGNNKj1bpTGWlxKW+9kqGPOAL+1pg+kF3CD4P48jUAManOcVanEko
	67LucHVJKNGD55eAyB4KTSFOE3ncux6Yk0XkFiusMPeO0B4RgvJ0ipDnR81FHlAFzqyMiNilgXO
	RhVEeMQhGSEzOC
X-Google-Smtp-Source: ACHHUZ7IV6OdLi4xQaDu/P5gI9gcveGZ+FpKBQDsjRAPmDvKXG6DubfHPMgSkhsF+HAPAzAZIy4G8A==
X-Received: by 2002:a17:903:18f:b0:1ac:8717:d436 with SMTP id z15-20020a170903018f00b001ac8717d436mr5304921plg.60.1683628272702;
        Tue, 09 May 2023 03:31:12 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:12 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Guo Ren <ren_guo@c-sky.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v19 01/24] riscv: Rename __switch_to_aux() -> fpu
Date: Tue,  9 May 2023 10:30:10 +0000
Message-Id: <20230509103033.11285-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033115_344243_B0AADFC4 
X-CRM114-Status: GOOD (  11.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

The name of __switch_to_aux() is not clear and rename it with the
determine function: __switch_to_fpu(). Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 60f8ca01d36e..4b96b13dee27 100644
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
@@ -66,7 +66,7 @@ static __always_inline bool has_fpu(void)
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -77,7 +77,7 @@ do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
-		__switch_to_aux(__prev, __next);	\
+		__switch_to_fpu(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
