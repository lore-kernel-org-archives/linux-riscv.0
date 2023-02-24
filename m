Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76675C6FA99
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQd+10br6/V/PDJ6EhjPFhsn4cc+CzSHbhJ4iIiLT2U=; b=pHGm1UfumKHUZf
	3z7US5tB0xdana0dylT/sOJrXNkfOj/x0hqW/HB2LCdKAksCPV2C5HkGm3daaGTx4xuZlQ1dnkhlY
	CPcRZ6Bstg8G33d2otF0Ffnpn1879WW8TjxdWpM7GWmrVEifKS8dlUzYjxY9O5Go7MaLXcclguf5t
	nVqnhYF53TNj04g5vAn4U0aX9OnxLuVmTKXDmpWRDgu0v3HIZ/DRopTp+P36r5rHkJf0tcG4rPN+k
	MuH7pI1EH2baQEcKdj/8kMfcyD/Pw080ums4xOrdq55pIQAODKZa7UPSmQ1gjj7cAdSMJPCo9D7c7
	GIED+fBYwJmHDRcXvRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaH4-0030dm-O7; Fri, 24 Feb 2023 15:46:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGy-0030bU-KQ
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:46:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so2457264wmb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo+EVv3XgUTIIi+/6+ttXrZNhwVtRPj9hfyuzLntRpg=;
        b=BlvNIrd+NK3X/O7djU/e+reAqeQ1TbZeGjnDUbarCo3tgR/wdG+BRlSQfH9sP8F0IY
         ToOklkNZ88vWDVHmFh0Yhz8r4M2GkwQudrsCJtM53/Bb5XO4IOr5vfr8kUd7tVnWllPj
         chYH0B4691aXg8A8h2xKzKFMvjqSpJlLIQhQTiKrNBFuwh0ybIAHmqblYY/bLNyEIq8w
         R+IYTipbmeDmZQ86gysHLMfDFb00H0cJfAoI8W7Ib6q7dicm1frdfn3cz71An1pZ25Xa
         TnuJ8ZeeBuEA5BKn0AO5tmIITu+/cCLAGbSKUhchnlDXIKM8BUXAb5uL2L7wlaaX6ABe
         17sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo+EVv3XgUTIIi+/6+ttXrZNhwVtRPj9hfyuzLntRpg=;
        b=FfqF+A9bHi23XRsUV1vTcFwhE+oVMW4KFTl0WR0bZs6J88O2dg8Ha/F7YhFY3HF45P
         5mhYc3Rq7BWGmfvuzM0Lt9L40NXU04vURTeoSymYZlU+7CM569J82ui/HycxdMd6fFOj
         eb3dHlBwwk6D8+mjOzTQehkDyLrRL/kAz0qB3gaT+3pPBy5G8d8BId/xc+plQSbLdVVY
         EeJsor2OX3Irtvg0CGvAr280sZqfwiaJ/lObnWQeHp+XSfa6px5s04lq3FMeDnbDlXcS
         JyeQcr/gpZTZaEREt4xfMYXRbTCamsjHh13TikBU6ZZtnrcIpKrXcZHl+XGv3m2HP+X0
         QgMA==
X-Gm-Message-State: AO0yUKVAHO4gmerD/9gLzH3JsG5RjAgqUT0kggpf8tYVQII9qXwp7OpW
	h0LPIpDcL8BHMDeQXH6Q4CzDOCF9Nn4JVcNW
X-Google-Smtp-Source: AK7set8GAoA4nmCfxT1zlQElJnV5PWOWUZwedMvETDBWAhMtp/moQqlJaAMnP+gMM85uG2+0edOxjA==
X-Received: by 2002:a05:600c:3417:b0:3ea:c100:e974 with SMTP id y23-20020a05600c341700b003eac100e974mr4120986wmp.26.1677253571284;
        Fri, 24 Feb 2023 07:46:11 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r1-20020adfdc81000000b002c5503a8d21sm11250427wrj.70.2023.02.24.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:46:11 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 6/6] riscv: cpufeature: Drop errata_list.h and other unused includes
Date: Fri, 24 Feb 2023 16:46:01 +0100
Message-Id: <20230224154601.88163-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224154601.88163-1-ajones@ventanamicro.com>
References: <20230224154601.88163-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_074612_690132_E5DB196D 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

Drop errata_list.h, since cpufeature.c includes hwcap.h directly to
get cpufeature IDs. And, while there, prune the rest of the unused
includes too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/cpufeature.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 059db20b28ca..6569d963fc7d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -8,20 +8,15 @@
 
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
-#include <linux/libfdt.h>
 #include <linux/log2.h>
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
-#include <asm/errata_list.h>
 #include <asm/hwcap.h>
 #include <asm/patch.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
-#include <asm/smp.h>
-#include <asm/switch_to.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
