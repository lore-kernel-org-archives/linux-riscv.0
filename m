Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED211C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERNH/83Lk6vTNmxYwnu7232d+1jfTGqVU3g6kpEJV5w=; b=eP299hOaO/ZBjY
	nj1+RPQemvUH1WcoJCTSj7lAdIWBDWk/gv+UCHMgH6WyNX8Dz0JFQkV1RjU/nahrOHKrn37eL4qSr
	5/x0KjlL88Tgst9Pn2ZVg7047RFvhOAaZsJjzK/c1JS9jZG+NGOlje1CTMAmwD4Z7G7/VXm4Dr9PI
	/LyDWREF98uuf8ok1u8gmE0yUXnseB4AcaOzAncvRLV0Uubpw1dRPKeZDqcydbcA+VIDxae09HOqC
	SUHY8IVrsKraT3hy6blR+jFyYDKU0zmLA2fQF1pe7Y+OBJEd9BI5ox3MJYAEFHDHHcH/unijkZ3ZZ
	Qq2ET4dhKVgXq2QjBjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVUb-00H6nf-Ln; Mon, 14 Nov 2022 09:11:01 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPs-00H3dk-JV
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:06:10 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-141ca09c2fbso2218829fac.6
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuilwbSjTkXNw6j4kYlnUJ0pwJrZlWFK5/+cTZqJbNQ=;
        b=dQRXwhn6GU2oVP9rmiDV3LUCEuVG7c7xXVfDgz5AhmWkHM8hafgbZ/QHBKe+g4lGKW
         QR5nRzGhcT8FM66NbfL8s176tW+pVjyTNeKuEKWYJnDSt0jZ51P0A+v8UPHkMAAXw29f
         jJM2IB/NM2lasvFAhF0rYCg4NIIbvCUh+vJnYoiaoorf1I2Q9m6ZHXcQSVuGCw6Zzc4q
         zVvCH4Gpl0o/QBnZnvrl3VrC3NcG9cg8LNxiH505rLVesy3Zj3oGEiVtT6JhlHOQGQ2f
         7N9/bjufSTQquYrJJf8+R5BvxCpVJIGRpWTzkxYZF6zYe7UkkMrjbCJBs+yty/MqIynj
         OEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuilwbSjTkXNw6j4kYlnUJ0pwJrZlWFK5/+cTZqJbNQ=;
        b=YM6zRQAsg6S9Ur+HqulDtV+y+gtrI/OiNYt2zbaLa/bJDWDIZKrFIdDDWYPwW1ywdt
         x76oZ10pdhvdmAbLoHBybUBPGVQDIzuH+K8jtU9TCA39kk+lGK+UPU8EkYY+zWSZCpF5
         SIYI/LzCz1GZG85F6Y99daOUm46zQ+8uESWmvDT0qyM5Umht6x3UnBxjjh7sMsNExHnj
         df3WX8yhxug6PSEmxgg4cELEg9Qba6L1+ped+Cy8OdMjn5z3E9ZyHIf1SQiKQw4Xt9kF
         huxRMYfltohCbAh+TWpD9UhzNz4pNMApQi83zOCJ8PuEdsPF1JWmMy8ldlTMYPnC8OQm
         vdMw==
X-Gm-Message-State: ANoB5pmASt1BNy+bJz31JnRh2qDNB9mmSs4xJ1+bRxC0BwvQJZnKC9gv
	iXqHhIAlBnLZxgq7SRj2esBhGw==
X-Google-Smtp-Source: AA0mqf7B5kjNytx8G6jhKFnk9HRp3NbSU55I/62IjswwphuZUNYZsUlMNIY/ARMiNb+zq4pMcv229w==
X-Received: by 2002:a05:6871:4192:b0:13b:6d76:8bcb with SMTP id lc18-20020a056871419200b0013b6d768bcbmr6016240oab.281.1668416767176;
        Mon, 14 Nov 2022 01:06:07 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020aca2402000000b00354948e04e4sm3432939oic.2.2022.11.14.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:06:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v6 1/3] RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
Date: Mon, 14 Nov 2022 14:35:34 +0530
Message-Id: <20221114090536.1662624-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090536.1662624-1-apatel@ventanamicro.com>
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010608_740900_180A97F7 
X-CRM114-Status: UNSURE (   9.03  )
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

Currently, the memremap() called with MEMREMAP_WB maps memory using
the generic ioremap() function which breaks on system with Svpbmt
because memory mapped using _PAGE_IOREMAP page attributes is treated
as strongly-ordered non-cacheable IO memory.

To address this, we implement RISC-V specific arch_memremap_wb()
which maps memory using _PAGE_KERNEL page attributes resulting in
write-back cacheable mapping on systems with Svpbmt.

Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/io.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 92080a227937..42497d487a17 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -135,4 +135,9 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 
 #include <asm-generic/io.h>
 
+#ifdef CONFIG_MMU
+#define arch_memremap_wb(addr, size)	\
+	((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
+#endif
+
 #endif /* _ASM_RISCV_IO_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
