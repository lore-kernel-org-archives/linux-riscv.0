Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3317C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3pLQokzHISOFCXimpQvWaZcmIt7ISbNsWu0NjrmxdA=; b=2ZUDR+ftHOR/BU
	hHmeIO7s7s1I9Ek5wNDV/M7HB7/D0ZdmWSY9jp5jACBTgP6LeFCN0Nj5fSy0Z3tmxK3iHtQcMfS25
	KlCOLomwXYd+Vf2l9nYVaQAfBROuEET46vmYGrLcMfShIGBAM+JkXrQG5/4FzmGhrbBXWT8nCHVxM
	kh9lDZPvMblF9RcG+vasV+UjUpMSoVgh+9wa/wn496+w9DerlkOzCdEPGKZVciRLxTdIWVGiKUQDd
	QnEDaAe0bTWMUmpark5kS6LoNl/hLNW3uN3+DQhIjyaN5bARM8mK6CpkjFNzqaJlotviDz5TI9/lW
	0tnPE9YSIJveaerBBbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohkw-005xG9-HN; Wed, 11 May 2022 08:31:38 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohks-005xCK-LM
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:36 +0000
Received: by mail-pf1-x435.google.com with SMTP id p8so1360891pfh.8
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=xQ+/39AkE91LiVQ4Kr8wAA4c9UriWAJqTaLbb/7ZPVs=;
 b=SfpCeNotyMV4WtU4qnoNenmfbtHMUNvrX4pnIiOvIGTqAQAaXZ/jGZzwDQBZ8ygJc2
 TLnaW+J8N+713J2VFcZHm01b+3Up8pZC1pM0BTk4kO6gyONiOpX3Pkuau+2cZY9llWmj
 d0DdSlvrKLHfRH5NCzmwQQaEzTeVucMJSJ7gm4nmwJ7+dc3FlENOFcWkpnhYGibD9V/i
 FG0BsVfs7fKzU2MdbfHlc13e0MZOCKIayq82xy74sZCwBaOxH5Tlci+oX9ZzNsTjyYvI
 pr3Kuowifkn/6Yx6HumbY49exSgGILh/7/RAmVmIASfQeMMATBf7qsL0JD2wNxkrHUl7
 t/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=xQ+/39AkE91LiVQ4Kr8wAA4c9UriWAJqTaLbb/7ZPVs=;
 b=u2frb1ZXfg0PjssMAdC3961LqeuYODbKxG9FKmnfbTlCsokXFkg+mpYmuoWwSXEjzd
 g6ME6qL+6u+t84vE8vHBn5rgIt6CuKulHdzhsOPTuXWXBybdmdZ8qmrUJ/6F2s76p3u0
 Jt+xbr2FZ0tChXCApmBGK2DyQwIRV90oJJo9722ZGWe0ybhjB7PpX2VrlaLy05UVRM3J
 MpSQdlRf1gZTEv4sKXo9Vi2jtz2oCjGN49Ep78c3dpefQ1mcb0EXAaLIlmHD6/07iinm
 guMm+Z71HhCKyDLPXmlt1vRKGfSimwyszXmA5HzKyh+Y3IYE6znn4YrlaoJmuVKol6Eu
 HsRA==
X-Gm-Message-State: AOAM531o56v+3tKix5US8GM2bdtkKqIMAv6OhM0aMRzY0gxOYKko7l24
 nIUa8r4eNmE7aiQnK16i6XQ2iw==
X-Google-Smtp-Source: ABdhPJx14OOqONpi9lA4QVGlDX8spXGW/IUI+yFob384ZCn8UeBWK1FuA2bgig7NAFiQb5KBMGjw3g==
X-Received: by 2002:aa7:962e:0:b0:50d:5ed8:aa23 with SMTP id
 r14-20020aa7962e000000b0050d5ed8aa23mr24006586pfg.43.1652257890964; 
 Wed, 11 May 2022 01:31:30 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:30 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 01/16] riscv: Rename __switch_to_aux -> fpu
Date: Wed, 11 May 2022 08:31:11 +0000
Message-Id: <7bf1e003db9845e2a13eff15c33e3a490d34810a.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013134_778338_7EB45FF0 
X-CRM114-Status: GOOD (  10.49  )
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
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0a3f4f95c555..ec83770b3d98 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -45,7 +45,7 @@ static inline void fstate_restore(struct task_struct *task,
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
