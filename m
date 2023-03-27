Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86040C761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouudiRHdDqYhRJyMVqjr7OGs7TIswItqnBrrQh+2J7c=; b=xp4Wj62iYjdpZ5
	30z18m1w5Z4Gae+AdVbRK9zEJ2WAkEsg0DF6MgXZvGTIfQuMftHbRQu5gF3r6aO8lI8wzi2yEmjRU
	EWt8Nr6EaHN9lOsrpMtwe2n3u6glza1llthtIQv2hGuNivSc6qQwbhN7+NstD8fxfmxDaGb249QA7
	iAjbxbRFOdlfBMirYDQ5/WOvj+FzrR1m4rMWatEHs6w1zIQf9LJ7UAMXQ3gLAo63QuydB0yIRaTAh
	vnGOEdGFqTo8srxH22XEBOVRJtzfCyMd5G3oR71ZcQN+axux7apu5OHsZg2hg8IhI+6bzO17FnWVQ
	Nirp3/NZbHqN2gOv5LWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2f-00Bkw1-29;
	Mon, 27 Mar 2023 16:49:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2b-00BksQ-05
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:49:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id o11so9025179ple.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935792;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=DrjYNVn/XrUZ7De3DWAyMEfNXt5xR47EPuDuqzl54H8yLyvQsQzec7yBsdxHTqrCP2
         JDBpDsS7dK7v054WTSmiK6tn6IuLOUS87LAXTp81No+VOoTWnvGNLrk3iuQe+D1So8zc
         8QWdyHCxdJVPyiXG6Bx5mzYNkKe1tcjN/dfW84SvToC15fbtdUHGoFjvQ69cPc/rv56n
         t3gwGf/FZepjefg6ObDAbm+Qfgo09/EwadE/HXDWyBCxqqpP8UwcbWSeY1CU3DjMq581
         7IctosOFB2OILR3hIIN7xwmhSjG7vY5m7iJJ6L7mcbsnDJdO13ZwqBhh7vjhFrr13y4O
         Crdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935792;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=lmPvHopdWD3xGP7h9GUefn3/zYexbz8i0qZ79L8JcHqS3kvdm/h0UOvDi0qVNftkoG
         L+z6SrP3PM9BJi4xdeIsul5vG8i9wXtW4GVPkDm7hV6jkc28F1tQvgQd7iyL8xH5D7vc
         kRU1eFYIdHz9B09kzXmlzE4j5MJKofmPQrBUAEFgBkO4S65kAsMu5A5sUqFRrJOi8TeK
         ziYNQFSkCqtUX3Y1Cx+2HiR1Ck234AeFYP4TTYLdl9bvQnul0heN20QU9wyz4ENxljtm
         hyiKVSGrHdU24yXohG1sPdDL99jWVBVBqpn9pRHQ9XVw8XEzTljHsK/NSk/0XFp4Yf0Y
         cxIQ==
X-Gm-Message-State: AO0yUKW2AHTnts8dWzUOk9KBmi0Pb3OSJ1D/B8jwibeO5P6KumfGfvK6
	Nr7E+zYIm2aPEKloOshfBM8vA1oblLqsSafHyhbH08s7fmxvF9Pse9F5PS9uQNgP7DDBgcfBdaF
	oul2M65FP5bdzWwPFTnyM7q1vo7GxtPFSu85n2jWd80b2wxmgiwb2I5y4cIL5bUf/f8kXghikAx
	5XY9FkWp3uIFbz
X-Google-Smtp-Source: AK7set+WEKuQejo7OWoTNvElULfoKX69nTqrkV5rQ/pJeuh4jTWt7crWI7OgztZP2pQiD///y2qCMg==
X-Received: by 2002:a05:6a20:2a10:b0:d3:5224:bbc2 with SMTP id e16-20020a056a202a1000b000d35224bbc2mr11795629pzh.42.1679935791866;
        Mon, 27 Mar 2023 09:49:51 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:49:51 -0700 (PDT)
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
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v17 01/20] riscv: Rename __switch_to_aux() -> fpu
Date: Mon, 27 Mar 2023 16:49:21 +0000
Message-Id: <20230327164941.20491-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_094953_065394_B98CA370 
X-CRM114-Status: GOOD (  10.58  )
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
