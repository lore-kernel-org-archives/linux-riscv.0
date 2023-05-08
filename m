Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF04C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6dE5sqfHVXJgcTsHuJa7YCWEXtMsu9UpUM29/iANlQ=; b=An9fc6bvlR2tj5
	vHPT6hq8c0/v1i0BQcjXNhoUt4OqQXpb99SdiaClXooNQbpwL1pJxtOgJHOpV2O0afs/5LvWS0BH0
	Tk2hwCKtXLAHDX6wUXdAkCf4UGl8vWb5kaB08HHlIvsHO4SEnSY1yWqMqX5uZEVnbZiZqlZ5+tZg1
	wDYsty1C0gHdymOV3G4LbWrqxADZss32k+BPMpY0CZtxCFjMLnC+RerW6magDI46NABRzPepzD3/7
	X64KH9XtwuNDmT0xoyiwLTiUfNr91d5jr5LwEAs1wj+2gwUf0kKBM5V46XiIUn1PVwiHIJyUCMJSD
	D+JFzGq3SBCFhJ16zNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRv-000SOG-1d;
	Mon, 08 May 2023 11:54:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRs-000SMq-2g
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:54:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1aaea43def7so29597555ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546875; x=1686138875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XDEVfXqS4FP0KdGTx6jL5yfIe6/oO8gDCIQfJ1eWZE=;
        b=NcufZwwvsj6/Boyj1pZX9SDoMFX3Dm2oty/qRNBJOjRjuNJFqKfLDuz7KnZhPMErND
         hzMLFmmVo206PCVp9d7A+QuEFdVAvPQsbM/vMN5sifyGfmgdxW3gVzHHSWPvKPArOvik
         YIAfNdCYYluT2mdY/5ynJqUWZ6Juz4WRIwj6Ip9TdigxU8k/hWnFJqi14QGEMNF80tah
         vQYIR/at9zkw9K58cy2JXFTG0ONm0RMZMBw0iyqx5FimbSkg7TOJEWNpDfjK345YX5Ji
         3dFtlaLRzMTCuxo+IZaZKoQXFtXhTHUQyNbLjYPc2TgTkRFaX+pOViv/azy0VTr/QdHk
         snAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546875; x=1686138875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XDEVfXqS4FP0KdGTx6jL5yfIe6/oO8gDCIQfJ1eWZE=;
        b=kJIh/ik+jsSZ4OVwADWQu8XO9gLlmpQB+yBpEl1lC8qH0UY2B9uVXveW7pgmgUmlep
         2HqZYrfWF3R8xzaoB4oddgY/EX/AguiGG+kpG4nn4uFe3RdR8ggRHOWKhpHCU2VoyaGk
         YXfpKbCWXXT7nrUwTX4Cdav64I1fJIIbotkxv2thP6QK3RaEvVPaTDmjc+kpjFMWfcBm
         8AIN7PDiFlG9rdyCA4ee0Y7ObuWOnbJrGdVGdG5C6BkccS2yF+0zhHJbBTzCgX3Keh8y
         x00aDPEWELjZGSjc7frdZ6wTv8vf1zEb1eHv02M8FjmhIehcqvhRtOaLf7j8UWfvowAt
         CoKg==
X-Gm-Message-State: AC+VfDwVXJrnKrvaB7tcfUeSTrmrbCqQasn4wFOelyudUqAxyM6eLb/n
	F24ETg2UzZmFNkM6BkKPJMOaPw==
X-Google-Smtp-Source: ACHHUZ5hMTFJTQPYhgpNKN39ORLnHJpWwdogloO8Lwo1VmnXnF01HpatA+Awvt6a3JK3sbEX6Ku1xg==
X-Received: by 2002:a17:903:2308:b0:19d:778:ff5 with SMTP id d8-20020a170903230800b0019d07780ff5mr13151647plh.15.1683546874762;
        Mon, 08 May 2023 04:54:34 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:54:34 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 12/21] RISC-V: only iterate over possible CPUs in ISA string parser
Date: Mon,  8 May 2023 17:22:28 +0530
Message-Id: <20230508115237.216337-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045436_868463_BD353A60 
X-CRM114-Status: GOOD (  12.99  )
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
