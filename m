Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6549C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouudiRHdDqYhRJyMVqjr7OGs7TIswItqnBrrQh+2J7c=; b=KCM7RFz738EAdR
	dPqLyPQWnpysqlvGQYJUalSQu+YrfEssLwB66YUg9FQ9tUpldxOW7m4hLeacRlfF43Uh2fCQKthGA
	MTa1lo2DIPXDANi96aQq5IXaJPf5SEjhV0DMR78BesO5ZU2emUyGYNBgzAWJ/v1L/T0ERsLJTyg3p
	b99SWqyW0D89fnp1CqIz+URFHzXQ5wZ+kDO7E2oFUvlhcCai9Gz8NodLdZ4JJB5wW1Q0pkTlCv79F
	sqHP1Am4AjuL5K9LILJIQ12WnPlhVBcPXfIYYKInejjXW5FLySJVlEnrglUd6kzH/3bVCWIFkGJGW
	1kc3w2UDE3ixX0GlrEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Nq-0024ry-1X;
	Fri, 17 Mar 2023 11:36:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Nn-0024oa-0X
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:36:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id ja10so4991673plb.5
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679052983;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=dtK69fD2Yfe98KKhLdoPKFHr5ztBeYVs/L1OcfCNW2eIXEEwVVN31jFNrhH8bCoaua
         c+GO+dfU0JKadWZaSCgrUSPFwVUED8TAMV7MnlVAV7joq8ommk1QLlskOesgdRJWx4ur
         7UzmyxSXNQk6ROd+W+lIP/0LqR9DGjG39GhzdyHbq2gxAeIsEiFBXUqC77b/1mgO5arv
         0qercnS71r1qcj1fQktQ5qZX5Cvl7mFVz38oEtwCOv+vU773xSPRpkVmnqKdvTBO3YqL
         wzAfF8Ol4Ol0WVEnnJl7kn0rx3dwVfTK3V/qyVsqdh5BIcl81ds4NGDdt9gyX4nVT7n9
         ICWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052983;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=GPMUOQsMqsGXPuxwdW86h2uYajEbppqWzrqeDiDvaIHqr/HPJdrlf+9hLh9frRztLD
         fYs5ajKG+HDl4O7kMjubXc06mc2iwn9Oil7h22341rvbRAq2bd2N0gI2lplneAn8r5pd
         x63y2OV0NKwBTcmwEOfeCJGdbabQ/uuMoWBGaCef/EV+h4SMsR6Y/zptBxdEQybTAmuE
         f+fw69E51TCjHDf/7yaREWcMXVzCTa9jvg7kowe7RlpUfkeDp7+i3rzkwVFG3b+met5C
         Jd88XZHpeEd1UplTjWw+47pG7JbzvZsuZeqxmwekxKgUyoAxwr3ZuYFWUHfk7Lhry+SJ
         pHAw==
X-Gm-Message-State: AO0yUKVvpBjWRqJTvDfXx75jBhvpFC0HwsqqPPt3en5mUVCM6QQUNycB
	rPRF7W/nkZshtbucE/dnEGfm+eWsiyF0xfCdkPuuSLT5fWGE4cUWiMPTRdfII8TA3kKo4xWUSr5
	auItSuc1AGLWwZMO+nrftFyH7xYsDXheXzfMi/hGmipS/MMjmDjtnsL4aa/MHgsTu9IqXQmKPZ+
	X+gGvZand7wttg
X-Google-Smtp-Source: AK7set8YaJ+S5JO2EY47OaFzzWSX3SIXv/SMXhmlbmxhhblJd+uc6gZ2A2Il7sKzdv4mcpQLBOTUMw==
X-Received: by 2002:a17:903:120a:b0:1a0:4f24:cae0 with SMTP id l10-20020a170903120a00b001a04f24cae0mr3325825plh.12.1679052982646;
        Fri, 17 Mar 2023 04:36:22 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:36:22 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v15 01/19] riscv: Rename __switch_to_aux() -> fpu
Date: Fri, 17 Mar 2023 11:35:20 +0000
Message-Id: <20230317113538.10878-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043627_201204_9FF26133 
X-CRM114-Status: GOOD (  10.05  )
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
