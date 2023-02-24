Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E393C7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3XcarmIazPLWOF7586TT2Z8vvzc3yIsDMSVfQ9lpWI=; b=idqrJwXIsSyDLb
	BsfsK7qDeB74yj3mEQld+yCR8H65eiFUXQNxhq/d7ypFZ7rLUWUFd8lZTV388r0eLk6XaxNgkx0/J
	rt7Ypf8UT7Q35T0o5z7kem8yMCo7sjOXZb63gii/AOT5efCY65qCEneT80XszqXChaN0YF07/crcM
	r7ODQ9JrQ56ryw65LWp3Y7yGgXBEgV/mAyd/RWDslpw1xQLL2Q6BwpESv6IVT4jqmBoc3DPjBlEWj
	k1YKyhOzwqyNBzKO71VHwMjGfddu+iqFcCrpF2knkM8s78N/mSblbvveF0npJV2nWa6dFJ+NseHiU
	RRGMQ+uy3ZxSskyZloHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbS1-003D8A-Iw; Fri, 24 Feb 2023 17:01:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbRx-003D6Z-Cn
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:01:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id s5so194788plg.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZvIhYFmeKjhMfSClOcNvYFcw+7eVoiwutwql0vi/jk=;
        b=ZeNg+0N8YaWAFggGX5OHDLm4z7gM8lBbNQqDT+/4n7T2dBGC6mrVfc66/MOw9KdHtw
         WTEL4n9NgznWy+PyzdWpsV+ZjchPt6HC+pJPzJOjVb/v3JzSKUE1SZvhOFdnX/yYpwEv
         CGlzMk/GRJF3q1ePaAifGhFZjra5Mj5w8Riow0xB1E5gzgIUk+XD6RxJ26pTQnhfgMGr
         2r8UiPdyuB9LYPqB/PsJJ4T0shfI5eOAuL9kZslksj28fTWziVfyFLcrdHD1w9Sd5dAV
         Q/EdnOxx8QEERVmqrr4JWlCLwzbw86dDzff2voTFkdWcHIdoAiZ4RlVw924LIkQb+UEb
         3RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZvIhYFmeKjhMfSClOcNvYFcw+7eVoiwutwql0vi/jk=;
        b=btePjl+vVJZ5OHOj6TscVmTXN5c15WG0NCydAaecYvMNofYbhoEvmo/6CrNp++xImN
         F6n2AxRWndcst3adVqf/C8vqQOyY4wQVkpmiR1iHeLjVppWZtoRrfptLYJkdb73V29h0
         yyEBF6yFZhXGl1y5BpFAvJcV5c40AjxWMRKsMyDyVkvZF8M618pMGTfdU3LkkBMkDB7N
         8v8Gehv1zhggUCsVTnOZ+fLKbQwQv5sYj9Ke5l4lc2vCkXunvafo5UyHIp03O5WDcSJG
         AaK91+3uSt7TfTVIBoqFLfmYHGMUXqjLWLVfQKrfFkCaMyRpJuG91YNIzKDIr7IlhP+1
         140w==
X-Gm-Message-State: AO0yUKUa6olcl6JqpWUpDEhKR+du9fz/slSIbs8rWbFJNOaJwpG2TdLt
	jP+Im9f67XvphpFNqPIDRIEG/E5FVIeXxokl3EDUGao8ZFeBEDzvbHBQdiDRIduIUqxUAc5j85i
	NovG0EaGW+MWMyconDAmb/iBHnGTvaxS7FMYFLjUP3cXAkOtDrXt3bebTu6AcutDLLS0+Hn4LlX
	RjnKEsQXvvSg==
X-Google-Smtp-Source: AK7set93R37VeqYtz2Q7nwYYxsKvvHYRwi1MVAY3nHlm44LAzi8Mx7/WrgqwZadC+nBgZvMUyvCxDA==
X-Received: by 2002:a17:902:f94e:b0:19b:e73:809c with SMTP id kx14-20020a170902f94e00b0019b0e73809cmr15771534plb.1.1677258096226;
        Fri, 24 Feb 2023 09:01:36 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:01:34 -0800 (PST)
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
	Nick Knight <nick.knight@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v14 01/19] riscv: Rename __switch_to_aux -> fpu
Date: Fri, 24 Feb 2023 17:01:00 +0000
Message-Id: <20230224170118.16766-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090137_456441_FE1E98E1 
X-CRM114-Status: GOOD (  10.63  )
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

The name of __switch_to_aux is not clear and rename it with the
determine function: __switch_to_fpu. Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
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
