Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08914C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XAzKIORwNsagGpvviDCaI0M68hQzcZf9ybhq5jk+8Ac=; b=dqwZILDve9o+yl
	x2s0HbjhudEfzADqELWBSXpdwGdkkqk5vSm8GHedvhC21SIHHxeTLqk//JGj/DOviJQ7fC0mXaXXv
	FH1VyYgHNprH8GuzVvK0/ALqKz4cYL8HZ6QsfCtI+XRmwnqeMesWxDfeJSnSyzyCORN4ac8AyBxn5
	CAU3SgYd8M0yATfCTrVkXboiJDTJAcm3GM0q+VogrY7nymuFptkTfB101dGrAEeFIGSGHDursE56e
	116NykisWQXFEgyX6cOZmAtwnWVlur3RcSWUarHAosPKEAAeqxAQJ+h9cETZK4MazHFwzeaZ5yykb
	E/5EsqX5xlOKbeqIre0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7Ws-00CkNd-64; Wed, 21 Sep 2022 21:45:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7Wo-00CkMS-UA
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:45:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id rt12so5374709pjb.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=pNiBU06AGrcp2W7TASu6fynoklavjSC6OPveK31UOzA=;
        b=AODJ1Met9EqOFJ4cncAvFVOLy/vjD28tPZRu9cI+tOqlRM3XwC4eEObWXuwfBkBDN9
         mOxBzSvjST4aYkBWFRHz1i1TJdk+/i5lB5ynpkAt6eAlo+QxDJrBkrn0Nz9SAtAVDY1g
         INj4t/p1sDMlNYYXorqVirr7LRBXBgWuUwvt84cU+QVW9pprJuTsmbWkhd9pB/4afNoF
         fKHaWzrCX4Q+5bdJiBCMYtqwKZfI1kNxNfYAeaCtFoSNcog9h4iY5lkEtpEu8/gIQtT+
         B29rZ0Im5wgfComzCEXUmaqTAJ0b2hW9OHNlgL53UFClryljl0yxXK494k68dC0RE4nK
         lZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=pNiBU06AGrcp2W7TASu6fynoklavjSC6OPveK31UOzA=;
        b=YJHcFNDyV9+dUYqJ8dymyzeSAVx11XTbv3wswn7fArD3FTpwLjIIMvX1w2n31QP6mm
         nK5kw08SsSZ7EKtsldEuAlo6QEfXOUi+xx/v1MItu5Z9psmfZlgiCyZ9KoG6a0g2M2XD
         eobHuxweYyYLKtnFDQg+W2tp24xy4ruQ9LxnVrUWjkX204ZuWU2OzXtUaC+KAkNl/M2i
         VE9M8QY+9y6RSH765trP4SdcFCgpZJOv88EO+4gZRUF6vqi2FVTN/sHVopdEDev1LgpD
         4Uboxk+yUxIAqF4aZv9js8+y7M+ZrCv7bTZ3vTnb5vJQDJ78Jui7BfVEnA8xb0rRlLVp
         93Jw==
X-Gm-Message-State: ACrzQf3O6ZFX2LAdRZZW+A2zD1/jBlPTcnw0QNt8qoxDtdLiGwRGXhnw
	3uFNwZSgd7tw/AeL1/Pg0jDv/A==
X-Google-Smtp-Source: AMsMyM66myoGyBDoxPP1OWRrxSd6epYp/I3FF3zSvwBuBEey8VV+8fee78OywI4HTAiLpldibOjvXA==
X-Received: by 2002:a17:902:e547:b0:178:7cf4:90e9 with SMTP id n7-20020a170902e54700b001787cf490e9mr232284plf.158.1663796709143;
        Wed, 21 Sep 2022 14:45:09 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:45:08 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Guo Ren <ren_guo@c-sky.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chris Stillson <stillson@rivosinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Dao Lu <daolu@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Knight <nick.knight@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Changbin Du <changbin.du@intel.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Peter Collingbourne <pcc@google.com>,
	Colin Cross <ccross@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Barret Rhoden <brho@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 01/17] riscv: Rename __switch_to_aux -> fpu
Date: Wed, 21 Sep 2022 14:43:43 -0700
Message-Id: <20220921214439.1491510-1-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_144511_211329_C9A6B486 
X-CRM114-Status: GOOD (  13.31  )
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

From: Guo Ren <ren_guo@c-sky.com>

The name of __switch_to_aux is not clear and rename it with the
determine function: __switch_to_fpu. Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 11463489fec6..df1aa589b7fd 100644
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
@@ -65,7 +65,7 @@ static __always_inline bool has_fpu(void)
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -76,7 +76,7 @@ do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
-		__switch_to_aux(__prev, __next);	\
+		__switch_to_fpu(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
