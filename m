Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B50DC0032E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUiiGpdextOmJ87IzVjkath0tBa9QfvPAkdBMQON0hw=; b=3lMaDclkbU9E7s
	S36N7q0KNpCXYPnWG1MzMDCBeLisL5PZfYxKU9+VjtlmXhfTOxgk8KHzW+nMy7mt0J38S4wUVEYOP
	WJNzfIUVnQgzem6fpQX1i8NyVy9T8YTxaNggSBjRP5rjTfj/PhelkgM/R/syzralusvWjk+qBCy76
	I40MO9/F6bD6abnDU3XMy9PI71ifp77eRA2zrFe2oUYtX5AB1LnutrEJ2RS36/D9Re2PTRPVSK+x1
	ZnGhVarBz+iRNsNVKnIY+aCE2CZpYxApmioyRT+S0a5pOHCLftTnRsry8ybTMADyYNb6icz0yn09C
	Obm46idLi9rDuUyDwS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpC2-002Jk7-1H;
	Fri, 20 Oct 2023 13:05:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBx-002Jgz-0l
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:05:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso124275566b.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 06:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697807127; x=1698411927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JcX762v3k5cMyKxLty5ODMVhmrCoTWf+2CIDOMj2ww=;
        b=gZN2u037KJU6jaoZPmNFP6SUQHR4410VDQHhnLtZlPliiPter6Q0u62Zw/qKWL3JQV
         /HqHqfsAVairf7bxd20aGP2xo2lkf5GGw2npPjuvGRaU7yow5BaJ7kSV/ZQgHd0sTpjd
         rM8j+xCP6tt7D07wjvjFAp3fWEDNskeNRPBKoiOXTifYv77UgQgsSm9HLpUTCV1PNUAf
         hcLKBHLKwVNyO1eFg0oMKlq/Qq/RAQswXsrTLaV49gJsR7+mkKLPr8qH+Mx+2s1k73kp
         v3SP0//Ty6xDjZc7jp4YnclhSMy+5ubfyGX/ri4YPrzg1Ka+GBkYHdv6WeEOZV7OXTND
         aoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807127; x=1698411927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JcX762v3k5cMyKxLty5ODMVhmrCoTWf+2CIDOMj2ww=;
        b=JAWcn4PEpKttkkEzYwmpf+joE++P2Z//z5A7cqQRDY4NI+xt9NuC8I+6Id7BuFEq34
         riYNtIXRyOv4/n3r/FnZ2X2QoHbpS1F3YLmUPsA6MwssuO9M0VW063R5ToApxqOrQc1r
         /zufRoADPuVoSVdZir65fhUlTYa/uMimk0UD3McSHIK+8wOUw/EguM1LTBeeAH1oDf2l
         vPzGYPoK9wonbX8Yvw+T6Y6XZb1XYOwhYfdtaFoPLtVUiLSEKNKUUu6/FYaPS6/scpua
         HOPPzhXXU8AyzfQbb+9lK2V5Hdm0FV4IvyI06XpEioqcVz5QpYsAMCILmQOgdSQ7RNZm
         NF9g==
X-Gm-Message-State: AOJu0YxsmXxvGeZLrMqboipZEg31Q2SjGSI2ciCf0hp885v3U/t9Tgug
	TPYnOK2ljqwA1sTjoLQ6TCmmjqu78kZcmC0vpPs=
X-Google-Smtp-Source: AGHT+IF8fI860cq8ioE56ifs+G5jNy20dTFeTFEBoNkhiIcTimQRhCZ3ssg6vsGqyOF2CbhP8W5vkg==
X-Received: by 2002:a17:906:da82:b0:9c7:59d1:b2c8 with SMTP id xh2-20020a170906da8200b009c759d1b2c8mr1435208ejb.71.1697807127079;
        Fri, 20 Oct 2023 06:05:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id cd25-20020a170906b35900b009a19701e7b5sm1478863ejb.96.2023.10.20.06.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:05:26 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
Date: Fri, 20 Oct 2023 15:05:21 +0200
Message-ID: <20231020130515.424577-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130515.424577-8-ajones@ventanamicro.com>
References: <20231020130515.424577-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_060529_273578_7E72B4F4 
X-CRM114-Status: GOOD (  17.32  )
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

Returning (exiting with) negative exit codes isn't user friendly,
because the user must output the exit code with the shell, convert it
from its unsigned 8-bit value back to the negative value, and then
look up where that comes from in the code (which may be multiple
places). Use the kselftests TAP interface, instead.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../testing/selftests/riscv/hwprobe/hwprobe.c | 54 +++++++------------
 1 file changed, 20 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index 09f290a67420..56cdca53f54a 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -2,6 +2,8 @@
 #include <stddef.h>
 #include <asm/hwprobe.h>
 
+#include "../../kselftest.h"
+
 /*
  * Rather than relying on having a new enough libc to define this, just do it
  * ourselves.  This way we don't need to be coupled to a new-enough libc to
@@ -16,6 +18,9 @@ int main(int argc, char **argv)
 	unsigned long cpus;
 	long out;
 
+	ksft_print_header();
+	ksft_set_plan(5);
+
 	/* Fake the CPU_SET ops. */
 	cpus = -1;
 
@@ -25,13 +30,16 @@ int main(int argc, char **argv)
 	 */
 	for (long i = 0; i < 8; i++)
 		pairs[i].key = i;
+
 	out = riscv_hwprobe(pairs, 8, 1, &cpus, 0);
 	if (out != 0)
-		return -1;
+		ksft_exit_fail_msg("hwprobe() failed with %ld\n", out);
+
 	for (long i = 0; i < 4; ++i) {
 		/* Fail if the kernel claims not to recognize a base key. */
 		if ((i < 4) && (pairs[i].key != i))
-			return -2;
+			ksft_exit_fail_msg("Failed to recognize base key: key != i, "
+					   "key=%ld, i=%ld\n", pairs[i].key, i);
 
 		if (pairs[i].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
 			continue;
@@ -39,52 +47,30 @@ int main(int argc, char **argv)
 		if (pairs[i].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA)
 			continue;
 
-		return -3;
+		ksft_exit_fail_msg("Unexpected pair: (%ld, %ld)\n", pairs[i].key, pairs[i].value);
 	}
 
-	/*
-	 * This should also work with a NULL CPU set, but should not work
-	 * with an improperly supplied CPU set.
-	 */
 	out = riscv_hwprobe(pairs, 8, 0, 0, 0);
-	if (out != 0)
-		return -4;
+	ksft_test_result(out == 0, "NULL CPU set\n");
 
 	out = riscv_hwprobe(pairs, 8, 0, &cpus, 0);
-	if (out == 0)
-		return -5;
+	ksft_test_result(out != 0, "Bad CPU set\n");
 
 	out = riscv_hwprobe(pairs, 8, 1, 0, 0);
-	if (out == 0)
-		return -6;
+	ksft_test_result(out != 0, "NULL CPU set with non-zero size\n");
 
-	/*
-	 * Check that keys work by providing one that we know exists, and
-	 * checking to make sure the resultig pair is what we asked for.
-	 */
 	pairs[0].key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR;
 	out = riscv_hwprobe(pairs, 1, 1, &cpus, 0);
-	if (out != 0)
-		return -7;
-	if (pairs[0].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
-		return -8;
+	ksft_test_result(out == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR,
+			 "Existing key is maintained\n");
 
-	/*
-	 * Check that an unknown key gets overwritten with -1,
-	 * but doesn't block elements after it.
-	 */
 	pairs[0].key = 0x5555;
 	pairs[1].key = 1;
 	pairs[1].value = 0xAAAA;
 	out = riscv_hwprobe(pairs, 2, 0, 0, 0);
-	if (out != 0)
-		return -9;
-
-	if (pairs[0].key != -1)
-		return -10;
-
-	if ((pairs[1].key != 1) || (pairs[1].value == 0xAAAA))
-		return -11;
+	ksft_test_result(out == 0 && pairs[0].key == -1 &&
+			 pairs[1].key == 1 && pairs[1].value != 0xAAAA,
+			 "Unknown key overwritten with -1 and doesn't block other elements\n");
 
-	return 0;
+	ksft_finished();
 }
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
