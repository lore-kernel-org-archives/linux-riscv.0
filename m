Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A48C54EAA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+agYYuB5KTQ1T3nV3Tfzwcp7tMCYLDpqamVsIwRpMmY=; b=JqtuQXU5qHdESO
	tAGPl03MnwfufcFSImdpL3qHI2pfJF7G+HeM58f5S+rO4HRrPR2UvzUw6bbyPM6UA5UBtVu6vOGFR
	ODNGqNmEsSpU1VqeDHhkROLklvUqzFrYMuIM/6BvDGfSZ7CRmwYkJ6+Ew3ltdphKbdTd2mcKEjXnU
	KxL723qlW8JcOoteFe5PChucsDaKKMJogaTMAkLzF7w58IRDsFc5BjXvgFPa2eJfyX9fbBqRS6Yij
	GzUqOfI4vAByT4VAT1TOu9ARSP6jLO+loj3o31v+vqcBVKfnmyfbgQI4V8SYADYpKbgnHYnHRBGcx
	37TydI5B/E9XTc5Qe75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeI-007V7J-Bp; Wed, 25 Jan 2023 14:21:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeB-007V54-Uq
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:21:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso2192414pjj.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KWPmdzL4KDI+P9FBRLObkkbD4XUM8Bx5n5J13K5PnOs=;
        b=hQuUO/eo6k4eleNUG2ld9HYEpLREF+8/F/IBdxy8iFtmwvco51oOCCsBrvWqOQcvCW
         UkWEJ+Jrtx2Yxp7WpQVSXEvB2kPxcduH1wd1UXgfqsEOQAQ2O6F+ZoUcMoyFYiZI8k6K
         rnGlQ0YhTvNhfQN4NFD4WDTMKvRvHDIToHFKdIG51uyShesnebUdMRnMu+xr+iBAspPl
         fFgoZ99EQ7CjXoD7mDz48PE407ybNXBraAFzBjx1X4JIj8MzrOkWBVbgxwyf0s6kUxl0
         +BYb1qUs5iyeKjLZyiyqB3iBkkjH6FvCMCqA7cCms4s3yRP0L8174EsQH55P9OxxQhYq
         GvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWPmdzL4KDI+P9FBRLObkkbD4XUM8Bx5n5J13K5PnOs=;
        b=OU8lED42JPHjvdj2xdnpnAfEjPKH/4ot9IgUR83hktZ+D+wqqygB5E9O4HoUIXEToU
         E83A2zSnz7gNcGHOeY92dNmF1mpU0eZj07mSty4qw4OCVhN2WKJnORNL6bnuskKc2hCb
         DEnNx0eF/NpDmp3LZEu6d0I3tRV8voti0PsCQt4HeKXgEJ4UVzYqNJlah1OUYFfAGKCI
         7t/xR08PQGViuZHuwcWV11hMROnj7VQRolP4kyqeWSUENKnuTOp0y9at8glcmqpJ6ABD
         ujRiI2tcRAJTsQcOcqobZ3Qdu6iqJzZ17Hd8oVElEDKMO7Xk9tU5sVFEw/sSkGgyU8pF
         Afww==
X-Gm-Message-State: AFqh2kpgymUl7pz6gB8C0mA3kyt85HY2P7TN+7fN0ao+G5WyGi7VK9eG
	Mh5hhFbzK/HZLRCxCSSxro+U6tQP7ZnVBh/bpGLnaiVS7og9QFbq3yHyLaB7WvYaxsEMKv937k/
	2kRzMZ1qePf9WPKP6IYYWWAVXNrw+ogwM63NX+B5rux/JwohCqxeSGJyzbgKKDjq3C/t8/ELFR+
	YYVu5O29nCdA==
X-Google-Smtp-Source: AMrXdXsl7rV8DsXkMHGVa7+IIwGPdkE61rCL6eL0mrsIe4bJEIjl2yD2X8Uap2oWLC5MpweONerK/w==
X-Received: by 2002:a05:6a20:394a:b0:b0:5600:f2b7 with SMTP id r10-20020a056a20394a00b000b05600f2b7mr41499161pzg.54.1674656466655;
        Wed, 25 Jan 2023 06:21:06 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:06 -0800 (PST)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v13 01/19] riscv: Rename __switch_to_aux -> fpu
Date: Wed, 25 Jan 2023 14:20:38 +0000
Message-Id: <20230125142056.18356-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062108_011626_5DFBD750 
X-CRM114-Status: GOOD (  10.45  )
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
