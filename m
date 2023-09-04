Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEC3C71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1VHy/YDV1mvD8a931oEOqXD5PBWt6ybwjhyng7AAxw=; b=YbCwWKvEmx3P4d
	5wiaXdBAgkVuGgybtL7zEldaOFFiuR+sDwwJHplIUux5FBF+qPJIbUkv8m2bHTwOKs5EhCqBqTJh5
	IUtQ/teatVqfkMCcvqb+WV+4FzGaejrtvzwAbCV4auRN4XcNhctL/qSzieUBdGYczOUblVVumFnOK
	TCV3GNkV49eg08GwKDJV2k79kldqUbLVISZA/txh6htBNk7pPMjqdSa3VWOEd/K2sttq0W2Sjy4tE
	mi18/anUbh9swliCDXDWs+0hpP0tMOtpTx5QdoAd0SOxryCLb4SGQUhvLYorvOqbR30rLTBSwuXlE
	4gQebRntE+AOrVCPrjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCyC-004UWb-2m;
	Mon, 04 Sep 2023 17:02:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy8-004UUM-0e
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:02:33 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98377c5d53eso240591366b.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693846949; x=1694451749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=VXQ3tNDsD69SVcNp1IVwUQuWwOndiYdgJhJOXYxsdE3rvC+nFaa+tkA9FFPTHH/suR
         abcXhX1Rs9kDXgcXB5vClYMtYwYyQcgOC1VNYikuoCBV2zr4rXvsfVRWxB9bd61SUnhS
         +uZH6VNE8A/qBh6Ust3/vXUSQKQqWLx11/7yplOu3E5f+Ael6SxnASECnaSLsrMo7M0T
         34hWn1k1d58dpz7Ss24BelSkcfYm7/yoxpq63sCHeOKtQXrJoS55X7XCKPAdOcnuR+2K
         zW2GRllaQhGbgNng/e/WUCXVz7Mis8nCUCXJYPf4N45E7zIwqCui3GIFVOV3zNQ3EFr4
         xz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846949; x=1694451749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=XuU7uocM1sCuwP+DK5IHGcmHOwPp1cap0umPqxdnB0Xx6oIapTIZSBWNVuS6w+pfcp
         DF266gZTE5MIpWUbcpyTtovdegEMy5QZo/frRmRgZKbfDA+6hzVWXLvtRtFQGFGfDuVx
         +fCkO7E7/mkv67flmEVvC+aOR7gDgbh2hLYuhWXR8ANJsMw6/sDUrjW/YJSvZVeeJ5T3
         wb5P7FnWWZdg3PSMtZKsj6kkHeGnyFXvUxH5x0BFjvYCBELiKD3C6A3thEgYG0yqvQTk
         r3Mh8x3L86wB3Cg+Kt4sxBgnrK216gVae53jlhzrFoFcMEmDdTXVZRimibs84xdubJyH
         GHdg==
X-Gm-Message-State: AOJu0YxcUHget1mWK+zedkroCysGj/De8+PHK+EVvxhKraZD3BG6OUkF
	T3BXZgR1GO2eBJ0g8dJp9byxpU0kqfva5Mvlwc37MA==
X-Google-Smtp-Source: AGHT+IHhYCKGoon3B8+E/pS2LNPK7iJfF7tyofmjqDOP2jd90OBRHTEbe13Cawx3Tfk6gkMCSS0asg==
X-Received: by 2002:a17:906:15d:b0:9a6:4f54:1da6 with SMTP id 29-20020a170906015d00b009a64f541da6mr2165909ejh.57.1693846949104;
        Mon, 04 Sep 2023 10:02:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hb26-20020a170906b89a00b009931a3adf64sm6549541ejb.17.2023.09.04.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:02:28 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
Date: Mon,  4 Sep 2023 19:02:26 +0200
Message-ID: <20230904170220.167816-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904170220.167816-8-ajones@ventanamicro.com>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_100232_236139_6DBA2796 
X-CRM114-Status: GOOD (  17.94  )
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
