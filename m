Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CDDCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1VHy/YDV1mvD8a931oEOqXD5PBWt6ybwjhyng7AAxw=; b=j//4gO1zknAIz7
	d3ahKBe1J36xKEnzD4GoeyeQ7V+GeMsUO2FTPBZJ68FCt4bwYlR4mzwicB4A+62wIkfitvCoZ54O9
	rs65ipRI4/dHkmlU6LfNTmsNrQVBAFmWGrimw6BnalO78zIwK3tJXmzpzAmj66WeYaKpVH67NoG8R
	t5/gdRC3DV2SNoQPjsJx+4VuWGRvHNiBj0eq5vt5pw0bDP0e4t8Mv7OFSRj8Ou1CK1eTwItKhgzau
	wO84j/Q35IMmsnE8pP8AJSxF0AR/ZUkjbKMB5q/I4ZZ4s9fuUGXBJ97TvDqm0D+6U5egTqGSQlVih
	8Wb2VDc4vC+1uQyHpN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE6A-00FVnD-1b;
	Mon, 18 Sep 2023 13:15:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE64-00FVkC-2T
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 13:15:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so558274166b.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695042926; x=1695647726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=pd+h5etkQ94sfY4xLb0NttfBmmqHug056IFC+Z62CWBFXbcocTPGjT0jGhC0xq991b
         Gb+7u2U3uOt/olNp+sUZWbXtGZ1PuWyxd2I6tIX4+DL0i3+XWcPVdhkmMvmx7BB6V5gl
         m/wBUHLiOMbh9WYdISQ8ctyVMUq4lm/76Nu6oqOMfDO+Pmj6yZCrViM/60AebkluZ+w1
         4W5a2Lre59Vf243J09cEEDr3MHNkNbg2SZswd7nHJeoUbo4JOUXuX6uzWocod5czeoxc
         w5ZCDmt2cL5cJpAZuuoKMO8tOQecpGK0GWhjeQIfR8QJo5i1k+xy7c2dEKgvDFhnMSO7
         x0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695042926; x=1695647726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCGTSuqvvD5txfHJJaQYik4t5PK/mtwBdizG3ZZUj7w=;
        b=DidOeA8JutAyMp3wMKq7qFcEtmqUbeHl9RvScA8Hc09X621sFubzJ3VAVXKkhiM9qJ
         2Xq0Mt5sr1JAtK4vHL2Y344nR4PV9brlkon8ASb1cuw+vm5SccTbBMirgZJDZhg6k0Du
         0VkOb9Ri1xXIrgDzcmtnyVfP6eXiCK5m5nACRSx3jUFNXJfWvlG7AK4pHGXAY9ybvwyU
         SqRi+TtK8xA8o5IFgwkfK7QQKafGat8PbcWeXaKyhzDjVxo7huIlh/DDC8UZnoo76mdF
         nD0pSL1f69rnium3dHnvdYktpu7ciI6YQrn293B6jRtUdmSnuc4DS9PkK5MlMVlv4wqD
         rZzQ==
X-Gm-Message-State: AOJu0YyPHIzrLamC4m1gAoUjWvU7MNHkE+p53k2n9L3klf89HFwehEZl
	NvtupgbmMxqtqAUZDGKtkIcApc9PQNll/3KK5aQ=
X-Google-Smtp-Source: AGHT+IEmnIJavJKEJFKSD/N1apctV1oNLSIjSRPXkpAWjNRFZ603SPwvq6SCGcE8zwkd9xlEo2qUJg==
X-Received: by 2002:a17:907:78d5:b0:99d:fab5:e888 with SMTP id kv21-20020a17090778d500b0099dfab5e888mr8015056ejc.34.1695042926378;
        Mon, 18 Sep 2023 06:15:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lc25-20020a170906dff900b0099bd86f9248sm6455373ejc.63.2023.09.18.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:15:26 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	xiao.w.wang@intel.com
Subject: [PATCH v4 5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
Date: Mon, 18 Sep 2023 15:15:24 +0200
Message-ID: <20230918131518.56803-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918131518.56803-8-ajones@ventanamicro.com>
References: <20230918131518.56803-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061528_805086_47B38DC4 
X-CRM114-Status: GOOD (  17.79  )
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
