Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AF5EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1VHy/YDV1mvD8a931oEOqXD5PBWt6ybwjhyng7AAxw=; b=0R1JG3amNJmVaT
	6VGwPSyP+UGO3dmweOyHjsQwm957WtIEehDqt2Ap+KX2yGqmOd1p6gtR8FSY5uLhYzwLwN6ouyUSP
	aIFl0axosm0SEx7Q1iNWdmFpo5bByKzY3IOl0c1I1cA9xgWW9BXrNxYDmPCgc2zpDLGjpFg0F6Vad
	6N7samwM1tlNj+NKD5/VdI+o9FKyRhYEjtcYBf4lAWbTjFR8Xlr3HLmDQoFA6TB/XN41hOqfnVRTz
	ClbZI+3s1qen3UadWQnYqeJwuYHrsLEO76AM3e/FxZG/OPAYhlQRmg5fiHNTRXwSpVTuL7GFrOUc2
	g7VqF3tGpRlctw3W2Rfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThml-004pdN-05;
	Wed, 09 Aug 2023 11:55:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmg-004paT-1e
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:55:27 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso6723488e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691582124; x=1692186924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=k7vOwfh8pO7D9mmiQHTm4vJqXRtCZ4BwLsFaIUts49fDEzzhZq6aDnBdoaXcagLmZC
         ItuoE8KFrpI08ZUh6can+MkLKQMcgIjo6DzRuD55Fl11oJKpcHUEajqQV4sq9ycrreAg
         2rIhmJ+KP6qmMhGMPXK5NSqZaW5syiBi+7kbYEzf00jcJwxAozApcwNyxFSK5Jg5QR/E
         SdZ9GgsPh1dUvAW5WKdYb5Enx78FfpVU/zd+LYyWP0U4GkeJJ6KqkT97mdWTsc3YI/fR
         Yo5s5QPThY5+SaAffOQfHDejWuYuWZs+9S9QTYmOrj7QnsZKnh5KJQsvYsdtW4gxMzdJ
         7CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582124; x=1692186924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=RXNDDpSTjcxrOMgHNivYj1+6t6TI+bu/4w3Podl7QDDhh08LyGbrGXaU1PmOFmQcqe
         j0Skln4VEPVkXfvrdmFPiWjH6uhWea0GxIOgprwFbR7DO8EjGPeY37d7Iuqb+R6V4NuR
         uckX4LnKMXbO4YYdK9zxpVJqfWFGHIN2irH0hojMSmmp/EFxUsCV/RFf20XEvXvXjXOE
         tLJ+OnzvhtCsAEiKfV7kA7ZhCn2mryd8TceY0A96Uv1ehdSamzfAHaENMfIfYC7PHwX1
         vbeDpsULjnqQLDuYtpA4Sk/FV7SVE6DgCgnCtcMzaYXuloCXOaRQ4b5iQX/hRxC2i7GK
         FKqg==
X-Gm-Message-State: AOJu0YxwGBJtPJFY9nAhcTQ5HrztmtR0PLsSvs0dOTcOPlgMQrYtqmFC
	6U21x1lI1vjEpn+Fql9AgDGoIN4M0kU9fKCncDBLBAin
X-Google-Smtp-Source: AGHT+IHD+CjBY8mgfl0MKPyYRq+KY4iLGGOTkr8Xmh1dHX9dpFWHsduFrzHWcUZPrNCxCrNgwReB5A==
X-Received: by 2002:ac2:48a2:0:b0:4fd:e113:f5fa with SMTP id u2-20020ac248a2000000b004fde113f5famr1593160lfg.7.1691582123715;
        Wed, 09 Aug 2023 04:55:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h4-20020aa7c944000000b0052369aa9956sm567617edt.26.2023.08.09.04.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:23 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH 5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
Date: Wed,  9 Aug 2023 13:55:22 +0200
Message-ID: <20230809115516.214537-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809115516.214537-8-ajones@ventanamicro.com>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_045526_547719_D35C9688 
X-CRM114-Status: GOOD (  17.77  )
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
