Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D4C83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1VHy/YDV1mvD8a931oEOqXD5PBWt6ybwjhyng7AAxw=; b=IRBSK+Tjiol1w5
	pjrR33RlOVNdSugEJJ1pcEwRhVa2LzSKsl6Nxh7lU8bTUc0XSIpebVAK2jVewWkP+GZLhI0XMw4O5
	hIm5jnmRaTMy/KVRH5GbNkIk1cLndBAWl7EZ2Oo7ZevIsqH1XbXro7RqOVvwYDxDYdicQ4GUd531r
	ptgAozDw8qkRAtW/bru2sMNdbBuOQ37b3o8t+TAv/pATrHGCpmzBrGt6ZdTfKS0IoujjvsRJVkNeA
	RAzplj8v/SqxNvOwTGzGStr9PqcF5L7rIobmZrMm9PDMQRstlTQD9tiXSVhQ3QYK2gDFWKnATkdVk
	HMEaB2BvdXQl0VAxZPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOQ-00DsZc-0R;
	Wed, 30 Aug 2023 16:50:10 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOL-00DsWv-1U
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:50:06 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bbbda48904so449871fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414203; x=1694019003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=Wl60ixcg5QqKKtH7QAtCv1Jsq/GkOnhv/FoYnBizHX8F8shIhm2sM/J6AfL9WHr1VR
         UfFGc0f0mssNnLUd4w/DYnTY3KQWJCP29ZMqF66MSzEqDXyh1D4KUhharArkp2o1b/KV
         H7WJ90SccKMClkfWrqtd2rYHpZSD/xjRNmQNk+B84s3pkdWVktxQzqD4mcD1+I+Fkk/M
         AHwZJ7odum6XnMrPCu9HDpanT07tqJ0mH7VxSVrSvte3BkGR1c4WgFinxZbIfrbIHHB7
         mn+rxtICB+uNjoAN6GnEhKjQMZIK4o4qZRms9Q5U7nSU/0UEo91lPTxoXWlHsjH1rGZQ
         Lqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414203; x=1694019003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=Mx6xquc+RNTLmKH/mKohOgGvmTDVlc8tvTGZqltscpqfCZmPWJ3rWHR6JkjmWhhl6y
         i/n5rwe5Q3PujlT2hIhyDaowkovbG5FYbNH5B2LKqTNlCMoDBrnZHVlOo1qgpRciJrE+
         jwVPxTBZIN5hyRLWtJeeOPH+gG8L38uF49uz6+23lrnhzSfmdXjnznbNvjC9cC+lRG0F
         F01nsVMswhR9IPdcz1utSLVNXUdajyvQHoGKIEj9IsFmEVb5ZRAUokg5CguJnV/gg4eu
         eFXiKPbXQ4HR++dBLSBaB//PGzOBkgEVHsp6myk0NGJp37DnzxCUfbnzEUJIZbA2dmg8
         IF8w==
X-Gm-Message-State: AOJu0YzzSRE0cwv5CDp26AArtczr+jAwQD2DLnEIMwRor4/GrhPoEVhY
	f2frkVKxegNGYssDvmuBB5NwdqLIJgmFD0eZCaab5w==
X-Google-Smtp-Source: AGHT+IHQEFuBxTm6If1kWQORHw0f8wjeM6HzYgReA9nrKXBBrifRVU+lo07i7pouDhni+fTvUXsAPg==
X-Received: by 2002:a2e:80c2:0:b0:2b9:ba02:436c with SMTP id r2-20020a2e80c2000000b002b9ba02436cmr2359246ljg.28.1693414203112;
        Wed, 30 Aug 2023 09:50:03 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q13-20020a7bce8d000000b003fe4548188bsm2786727wmj.48.2023.08.30.09.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:50:02 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
Date: Wed, 30 Aug 2023 18:50:00 +0200
Message-ID: <20230830164954.91987-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830164954.91987-8-ajones@ventanamicro.com>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_095005_514251_8DD6C3CF 
X-CRM114-Status: GOOD (  17.80  )
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
index 09f290a67420..4f15f1f3b4c3 100644
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
+	ksft_test_result(out != 0, "NULL CPU set with non-zero count\n");
 
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
