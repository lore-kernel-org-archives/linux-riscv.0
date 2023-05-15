Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B49C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6dE5sqfHVXJgcTsHuJa7YCWEXtMsu9UpUM29/iANlQ=; b=AIxC5J+/j5XVCv
	yP20ev2k/zkmauaAvE61rM1kESmXhppZkwPUkZWfB5vU9+Oa+dHLY9DIGc3RJwJL4EZ7n6or1/eec
	AFQ+nBy929NohSCsq24z3HfHxQnynX1sSd/PMhsUBY7/ue8ZRiixkh8/GvCVBr56DfQ4eIGNGhIKd
	s6k9OncAzu37xhFpEl6GRu+B8U5a5b3JVDyrNoGVGMfvQiVLuP2yauTmSYibZWUTCfTzvrxthayd2
	OMlH5KB8GSGkkCxNyrE7JbBWce5fvi6yimHbcdqESk3qhLkj7FrhBtDa13JVeGBTaLFsBwacQ/DuC
	ydfuyf5JpuqKIUSdAyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6y-0010Dx-2r;
	Mon, 15 May 2023 05:51:08 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6w-0010CF-1O
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:51:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-52cb78647ecso7498446a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129865; x=1686721865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XDEVfXqS4FP0KdGTx6jL5yfIe6/oO8gDCIQfJ1eWZE=;
        b=eo+hRK3Y6dFcpXE+MFhCwXrUsWBWvgOpcG+KbYVEc0DqQgCL+swnaKrDmIfoDh8TRe
         2hKgFyvx9N6JbNkAa121GRj+WzhpUml5rUfGm4nN89OoFCceHUiKktEO6no31ZDHA2dm
         vu3aQ2Y0qbCdrwrMHzB7oxlpvZnl0+wjHjhF38ju8yd5O4GM0lgTnoBN+QhEt2YgYAuB
         KjX/ebuvlXou1OgUYvoC4/ceYoRbK1BF7oG+yD58urPPEfekTeQmm4yGKdqbhbhdgo+K
         kxQbbm5n3OpfAAOFYRtjP0l883SnrIMgXvEQGPn8Amcd3XQA8zjuIuvbINQVit0iuDax
         vrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129865; x=1686721865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XDEVfXqS4FP0KdGTx6jL5yfIe6/oO8gDCIQfJ1eWZE=;
        b=SUGEATrwgDoLYWmh6X9YqnQqewzHqXlSoKBBG2GnfmdWqkK569EHmXkmTFrVWCsqbf
         LmFOvDKPBlay4+TrN1zoaqaSjUNi8jT4+TnJCOJ/D6OxGrf7XjaP4NM398hk5A49ok5T
         NWAq/EV8QYGVkhi7QdUswJoubJYHMhhhbXAJgvJQIeVGSWZqNmlDrMizsGgzmLA8K5+m
         7WOlU8a0/m5Z0f3eZrDbs8KZyp2wXPh3tgeNCNc7yiqa1Tqwp68INJXwIMeLtCFJYr0a
         gVDM0h8M2r0hsr2jX6Xs9O4ne0sCBQiJ3p2z7kEiRX8yv1tl6a2UaS7Rv7gIj5kt+K4H
         acew==
X-Gm-Message-State: AC+VfDw1lAh6bRgNgzBwXnfGmyypMA+63t8qTI4EE+ThX6Ms+88dL3V3
	V3mmf3oOF4k0r3qr7xuo/3DBXA==
X-Google-Smtp-Source: ACHHUZ6UQir4ba9Ebio27KXOD5zQZPs31XYvm+RGv/D0bj2Ha4phrPNjik5ybphmkZHP2SryZzKRYg==
X-Received: by 2002:a17:902:eb46:b0:1a6:5487:3f97 with SMTP id i6-20020a170902eb4600b001a654873f97mr31149745pli.64.1684129865387;
        Sun, 14 May 2023 22:51:05 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:05 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 13/21] RISC-V: only iterate over possible CPUs in ISA string parser
Date: Mon, 15 May 2023 11:19:20 +0530
Message-Id: <20230515054928.2079268-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225106_467985_B387D759 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

During boot we call riscv_of_processor_hartid() for each hart that we
add to the possible cpus list. Repeating the call again here is not
required, if we iterate over the list of possible CPUs, rather than the
list of all CPUs.

The call to of_property_read_string() for "riscv,isa" cannot fail
either, as it has previously succeeded in riscv_of_processor_hartid(),
but leaving in the error checking makes the operation of the loop more
obvious & provides leeway for future refactoring of
riscv_of_processor_hartid().

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b1d6b7e4b829..c607db2c842c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -12,6 +12,7 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -99,7 +100,7 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	unsigned long hartid;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -112,16 +113,20 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		rc = riscv_of_processor_hartid(node, &hartid);
-		if (rc < 0)
+		node = of_cpu_device_node_get(cpu);
+		if (!node) {
+			pr_warn("Unable to find cpu node\n");
 			continue;
+		}
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
+		rc = of_property_read_string(node, "riscv,isa", &isa);
+		of_node_put(node);
+		if (rc) {
 			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 			continue;
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
