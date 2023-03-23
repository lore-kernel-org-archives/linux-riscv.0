Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E73C76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouudiRHdDqYhRJyMVqjr7OGs7TIswItqnBrrQh+2J7c=; b=06GFRca52two65
	Hozx9fn72Ii3FwCuKKTb1ghQ+EwJwnHTw0OX/wuwzk0lzLwS90+FjS2Tpu61jf/gTS33AqRhhMOMa
	bHlfB2fmcoBTlamdOknB1g41UY8Pg9Xkgk9KGjdTaYrmHgkeMAh+joVV5DN/8K6Wn0dMhce/pZTh5
	I1vR199hJzHuZbfNHFr2CL6MxVmcxcc0Fim/8JRIpZcI365G2KsWRMz/i7pfqYX5vrfnTjkMy+eg4
	LeKBIfbmMIx6ccsM0sRu9/Cm7eRVFfYaMMpsrz5cK7LanjGNC4CWHUp01OtdjdzMJv2dI/hEAAJMe
	eHcSojJC+iWkAkZX4qvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMPm-002GYP-2I;
	Thu, 23 Mar 2023 14:59:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMPk-002GWH-1J
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 14:59:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id o11so22571786ple.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583578;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=EE4iyZ9ZIYFKB5FMvRNeYHxXk8u+i1yhDt4omFH12gjYyHwTnUUiC13hv+Il1HyF6s
         rDXdUWb0h4Ie637VWRym/g/GXTm3eWY062jeeytZnqOgRxRu5dAhzahW6W4wRgoh0Jjh
         ZEfTkXrLECW3ihGU8STm1NE6hOWmG7EzPpqt1Pyd3QbkBLvFgZ41nH7kZ2mEcb91ebJH
         GEDqMHY53zS6Czn5N5+Bfr+Fx5vAlzIMcgn1Sv9Gq08CJJrPQ8I9p8F+7MScW4hMcSqE
         1I7bS048M166lupwCQ8xyRVPoWr8gV/rb1IH9lvyAJTs2q+B4Mqgfemdugx3j7vzqbvE
         paOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583578;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=WbC9dku/MCkkNuxsei9Bs9Cr0zpiG7xBfkwIVfc0hZFDFufj/KJgTtrxke3MRU48xe
         oCmgmaiIzZXNnDFTrwTa9k5Epqna48I0ObF23i/yKrJHHLPWqgVjqCJ3EYZinulWsUlU
         fB1npQTL+kD6yAuL4eDocXRKRaqI95b5cFEeKdhbmDkAWIGkIVVtSu8uS6AntFBinNyB
         0mxGSsPkqScrSlpA/LFbqdARRF1klnRRR/+mXrWujppyEq+jsakgwkexxSua1x2odoZi
         U9a4YEznMkHxazUextJwgyNcJjnrldBDEYQz1F+Uon6UwH/LsNZqtiOajZCn8JtaiNpZ
         GrYg==
X-Gm-Message-State: AO0yUKW5vO5/eRPD09NmUUdS24gDm3X60FvmWHBEvKLU+Y4+Fxwoxsdj
	l4FoL3hPAzOY5sBiS8BFU33iWoJWQ9rQb7whtzej72p0tV1uM1Jg+0Ss5IJaspzgWCAn0xDU2PV
	N28Kca97u7wnw63x2BaZtIza5p6O4c4CznJ9iiyVdkYSrvy4PRzadcJNyOIbOxL0xvU3dYvX/h6
	/9hUUfdLdz8XB7
X-Google-Smtp-Source: AK7set+/B5nEPkQgpgS7TZzUH0y5Y+FUfRpzPltL0G5GjJIHTjTPQSYBW3inr/Q72qMdyce5IYxZZQ==
X-Received: by 2002:a17:903:24f:b0:1a0:7508:daf2 with SMTP id j15-20020a170903024f00b001a07508daf2mr7393444plh.2.1679583578342;
        Thu, 23 Mar 2023 07:59:38 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:59:37 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v16 01/20] riscv: Rename __switch_to_aux() -> fpu
Date: Thu, 23 Mar 2023 14:59:05 +0000
Message-Id: <20230323145924.4194-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_075940_446516_36239F10 
X-CRM114-Status: GOOD (  10.46  )
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
