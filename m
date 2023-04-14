Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F137C77B79
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouudiRHdDqYhRJyMVqjr7OGs7TIswItqnBrrQh+2J7c=; b=qm3bTaSQmTVNy/
	Wy/RWSOERC3vQFmB7hj08naXNrfICzHk/5z+dmwcnU80dyByx6MR/Y5HceLIkvDBv9l+yhnnZtgcS
	bfGDFh1wpAm77F/kr4CpkePl4n2GcHN1LoGxAQquzjabTV+R8lZ/S3mVNWXvcqJgq0gYy+SEXSsD2
	KZcJe+mTpTmz96MAQ8dF0s6KMwz3AtwjU96cpR0canXj8l5OC7SjUQiVKzWPRoESsPiOT1zyd86DG
	G9IiLGncOh10Dbfgv08qAZ1aOmTpSPk493CBRw60w1+IyvKXBoYkM/FLN8IXYS/fXQmQscpcxdiPV
	vSHbdb59arPcMcU9MZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpG-00A1Sx-39;
	Fri, 14 Apr 2023 15:59:02 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpD-00A1RX-2U
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id cm18-20020a17090afa1200b0024713adf69dso6559586pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487939; x=1684079939;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=SXvhgGoWdY4+v0js6UamSIbUsdNlillnh5BR2/gI3mr5VGZ/aiO0T+5K999+nOdAm1
         FV53MybCKnLYnRlS/OUx5MFd1lPXPvysty5xly8BD2hDihMEmSv9d5HhyA2cj42zmrP4
         HZs78S+Onq1MBO7YsEZm6NxRdFd2b4CdXnzSwIAs2tfvmTc/DHp9APpNxEkpOQYBw+Xu
         UVSOcRKjEtMwCau7ZxxA/CvP/NJCTMXlKadL8tIvXYK6togfuSgjaPmDr0KVcf/UzN9u
         3fNUWk9rdP3D/0SmwF9P5R5LPJkHfADah2vIlFTDAkCc8JWoQxG/N1boAa9qIPMqunGE
         KCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487939; x=1684079939;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=OgOKTPaImDnoh568MiOO8IJblYUFXahJU+RBMRzUZX1mc002NG7Mzqqe3faCxFRbNi
         kKlBVT/r5arPvhQC32sPvmKtd8WyWaGx0GsmyGV2T8VV9+3wL3wOQcikNn8lW4yeMxXC
         1cvF94dYuGd0ON5f9Yo1C0waoy71SIOk2rczVJDvlG7VpO5ntgFV2NiZNSupumxzS72V
         5wN3FYMkaDO3jumbrtd9Yos351JkNe4BXusVnwYO3XZktSQ0b2czPOdMgjdoQB04hbgB
         Ug+pmC/XEUg2LuSgPtkmE72LvsyACrfeXQ/F6yud+ZRVCogtANQgzZFe6Lc6lRNz12a0
         5k9Q==
X-Gm-Message-State: AAQBX9dzF4+7uOKPso8nkIdWc4hyyuqUZLjCWWyAf61opnhtt+cmMkeK
	+rrxeorg0PpANxvJd4CyqNpfzcKN9zJ+4B93nKVcjQzTM6zM4U17vsS+9CL/2xwSmXHSIVoEvqx
	tMRbk7HNw2ex37GsVZJQNCT4AkUF75Atbftsg9ep3OZ8wZtO8JiQlKdihLn7FunWCS2qISdH6SB
	AdFqVvM9rGs5Q/
X-Google-Smtp-Source: AKy350ZxguafjbuTJCtXZ0UwMA3Y+whb6ag2ldUxCKWrmYydILPzUyXVfqAAPNk2N+lqD0cJXe0veA==
X-Received: by 2002:a17:90a:bf02:b0:246:57ba:ab25 with SMTP id c2-20020a17090abf0200b0024657baab25mr5991322pjs.11.1681487938804;
        Fri, 14 Apr 2023 08:58:58 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:58:58 -0700 (PDT)
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
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v18 01/20] riscv: Rename __switch_to_aux() -> fpu
Date: Fri, 14 Apr 2023 15:58:24 +0000
Message-Id: <20230414155843.12963-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085859_810294_7C60BDAE 
X-CRM114-Status: GOOD (  10.32  )
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
