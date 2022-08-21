Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA11C32789
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qOrOaO26rvBLCmG6IjhRY8fGu3qmj0rUJyuWzU5Yko=; b=VLimx4JWUhHS/8
	/xve48hGHek+AVqS4qnVD28xS6ESujswzxzELTcFomLy5sgd7xOyJFLnfsifIAGW1Rb0LTDBu77dz
	51ed6QRYW96pjYBo1YEd+dpprErOFiPAC6692DCtaANaf7OhwHtz4mWd45XIIQG8ORdDUheUMfqpB
	DjjVa02a2nPkHrcITqsGloWjRl7M+mOdRfluCY0PhS2z8dwLST+JzKUrch5zPk82lThjlQi4+fTVN
	TF9d2mB5vzQDWaVUkKSgYZoIqX2fZDyNYB0XpABmyCrRCSx7VQ0zpooJ66m8NIsaaMo0c4/K8vAhO
	++pPtoLSFp9R9i+dlJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFq-009mvZ-9W; Sun, 21 Aug 2022 11:36:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFh-009mkv-Ik
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 11:36:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id u14so10053331wrq.9
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 04:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=iRydGNWOVxx1HqAigFxDEMCuXoX5Io4IU5ztqyzaPAs=;
        b=Y1WaN5EAlXdoOlvAydRCG82PKL3F1frMO2Gueklv8Hl+oRlW3+ER52FQNA65qlT4ar
         Z7WCuQ1OFzwV34ttvUMnnPCxnyOST7zPOvFzJnEfB+4j9LdkZRYIp6/YyrcDINihXi58
         Mi56g3YyTvh3AlocFbuYHF9KLeRtMj+gJZRl7xjIB1eNlD6/JSYjnAvfIJHSWd6ub0ac
         OCinSVK1v+4gLgh4cdvz9HZxI3kVUH04Zi9qadv4lPjNlRfWpHjmC5O0WECWQc0OFyyR
         pCJxCnow4Yga7OV0QJIHOuik6NTHAoDHxEufFMcUkn3qy31H1Se8nChjkuwao431/pXh
         hafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=iRydGNWOVxx1HqAigFxDEMCuXoX5Io4IU5ztqyzaPAs=;
        b=UJTcDufe5b8IpKC16GYrP+KCo++y71sAbrVSP9yr2BPyQfR6JEmcaIat+WUoSh83J7
         wK1LqeYny8A+o9DGLEXfbNirVq9VeHqyDXpOp7UPiJ/3n9U7Sm/CjBEVZjoDFf5it5zm
         gwdo8rT4P+Ub+kKi05NpM8xCjF2xhlTbBTM3w9YRAZIIYU5+p4e4HpqcVI24XR/Hdy5v
         5dIPGRARYwSjh0A+MI4C5LkRI0AP1qBfqHwzeggQF2sCD0+9ZWW9bGCF6QuOkvVqtF/a
         gFq1RhP0gon6yyi5RXe53K5iWZDuC2Rq0Kvgh5W9KfqiN2ce6qqfjz2wGlvF0yqiNUIP
         x/5A==
X-Gm-Message-State: ACgBeo3x2VQM3oJFfjc4zlUyi7JwOPGwBMW8YLS1YbmhzEr1wurtTFAh
	NofQ7XnB4Io3rfLNj9Qp0KO72A==
X-Google-Smtp-Source: AA6agR5T0RaXBxKPuBVBjPGUHGtJfc4tSWj3x0g4PlWZixJIT3RipsnS2LEVMZyj6NI4Nvr7MxTB/A==
X-Received: by 2002:a05:6000:1545:b0:220:61fa:64a with SMTP id 5-20020a056000154500b0022061fa064amr8748201wry.174.1661081783798;
        Sun, 21 Aug 2022 04:36:23 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003a3442f1229sm14071361wmc.29.2022.08.21.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 04:36:23 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michal Simek <monstr@monstr.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 4/6] sh: use the asm-generic version of cpuinfo_op
Date: Sun, 21 Aug 2022 12:35:11 +0100
Message-Id: <20220821113512.2056409-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220821113512.2056409-1-mail@conchuod.ie>
References: <20220821113512.2056409-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_043625_655337_D287EBE3 
X-CRM114-Status: GOOD (  12.35  )
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

From: Conor Dooley <conor.dooley@microchip.com>

There's little point in duplicating the declaration of cpuinfo_op now
that there's a shared version of it, so drop it & include the generic
header.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/sh/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/include/asm/processor.h b/arch/sh/include/asm/processor.h
index 85a6c1c3c16e..4125494515c9 100644
--- a/arch/sh/include/asm/processor.h
+++ b/arch/sh/include/asm/processor.h
@@ -4,6 +4,7 @@
 
 #include <asm/cpu-features.h>
 #include <asm/cache.h>
+#include <asm-generic/processor.h>
 
 #ifndef __ASSEMBLY__
 /*
@@ -123,7 +124,6 @@ extern unsigned int mem_init_done;
 
 /* arch/sh/kernel/setup.c */
 const char *get_cpu_subtype(struct sh_cpuinfo *c);
-extern const struct seq_operations cpuinfo_op;
 
 /* thread_struct flags */
 #define SH_THREAD_UAC_NOPRINT	(1 << 0)
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
