Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D418C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAzKIORwNsagGpvviDCaI0M68hQzcZf9ybhq5jk+8Ac=; b=noX+YeT8d4pPJ6
	/H7oS3VcKbD4OqXrcGApTN1fC/cYd9kuzdL8wC2DWL4U/hITVXRrWt0PavhtdMWDwlHJb+8N+UnU3
	WAu4wUYPkgSwuBc3bLheSEfGZDUOScOsWcp91iswAUBJ0IjOKokju2a06uMqFla3+/5r2FPUN0TzF
	NdiiyjGn4YOfTzugEONMp65OgpZNPeHQZUoZNLUdZ/u7cZ1StqEDdNlHIgm7I6zbJVnpQk3D9VKeu
	cAGva1l5oxG7ICiJC+j62ZjY0awFOKNa2t8qERWjofk6eD9EXNT51UvnktWgu10a4Jaxp+FaYBmpm
	FCj1yzHI+xQW6iS6kALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6qg-00CdWv-6I; Wed, 21 Sep 2022 21:01:38 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gH-00CUSw-MV
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id go6so7560959pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pNiBU06AGrcp2W7TASu6fynoklavjSC6OPveK31UOzA=;
        b=uV/XublmZmUP5DVCTZgZS5tbREl3wkFzWsSFWJ8x4PMGJoH3POMGeYH75KOrMG3eNY
         l+LxzTbLM4Jfnv2HXjmO/99EjWtDbC/yF0u0HuUUS+px2EJtexYoUo35M/zRo/+9WzOn
         HMNgcNwRfSA8l7dz30BemIBSXMfy8rG6drxkq5l4XCSpoI7K2n5dWYGia//0nt0co+/6
         V7o0VV8TTzLutUmPdWhAcD8HI5BRMcOmpESIUQQ+du5XDM4AciWOinysSuM2H1E3hn0L
         2phdPajT7I90crkEQJ5kPRgb3a/84PyQjoIVnakql9S4Fp4/ZNVYIKUGZuNylxIrkkUq
         BRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pNiBU06AGrcp2W7TASu6fynoklavjSC6OPveK31UOzA=;
        b=W6WeHz8uxuzkdFDUAzxFbVhYh33FBmLR7W3xYV3BF/4r2N14JQ5GyWlOqUgKRwTCIG
         SxQbe5WLrEGxQqS4aJmAEt3XRbJ1Dj3a31CYwBmlNkt0fKOK7DkENXHfiLgAqILUBkCl
         tDQP9459QEQWj5Eymo7aH4mlR8v1rMYazPQje4TsFu8c0Q5UwsQC2pstrCsmP7U3enkf
         jvlJnKd/WVaSeg2P6pqaWcnFJ1miJLGx2LHb7wNtaLZNxzv1DS/0CMgfZhfKQoEwnuDr
         BRndJWbr7hHZ/Mr+kmnoj0Wtg676XVt8DT19qnCWR7dn4YGusVC4vg2t095tzM5CriSC
         qyig==
X-Gm-Message-State: ACrzQf3/m2fzz2KCL3boWyT+TKaJmB5lnwvEYOlwCc0D4so1EalP3LLr
	9MHkt+IP4m1c/Qaj7f71SWHbb+aCwGezQQ==
X-Google-Smtp-Source: AMsMyM4nrna9g43fUTxKXOUtLMftuR3IePvA7rWFt9hS2+wjfy06r2wFjpqsBaLYZFg7sy4ULRSB7A==
X-Received: by 2002:a17:90b:1c8d:b0:203:cc25:4eb5 with SMTP id oo13-20020a17090b1c8d00b00203cc254eb5mr2540680pjb.132.1663789603352;
        Wed, 21 Sep 2022 12:46:43 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:42 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Guo Ren <ren_guo@c-sky.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 01/17] riscv: Rename __switch_to_aux -> fpu
Date: Wed, 21 Sep 2022 12:46:13 -0700
Message-Id: <20220921194629.1480202-2-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124649_738978_63FB955A 
X-CRM114-Status: GOOD (  10.80  )
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
