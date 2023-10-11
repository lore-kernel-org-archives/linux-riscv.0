Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7157ACD6E71
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUiiGpdextOmJ87IzVjkath0tBa9QfvPAkdBMQON0hw=; b=eAxyQhWIK3amu+
	bLcQp3r1igj/kfLjnT5VCdHnlzxBDlzjyJGQuqlIZDFkEEchMWeU1Nx+4KUzXwPr1Dls2tBv0RXrU
	zpxkrVHEB7w0It8HBiDvEkwzoCjZYl1B0nabWGA4kWk5HFViE6ddyMUvEC6EDxIpw7eKAGGLn9ZPo
	/5WI6Cd7aA/8r2SAApfAxUQEj9S/XPBIXTU4oWIntqUwiUc6c3d4z+iMASjSIXdDtH0T9r1nN3npK
	i4ai/oxIG4RhfNVP6/PvW1q5sMWtZl02wJeclA7UlMWrtwzB7UtDI8VGk1HPxh80AHQD5DbYtzqnI
	CsSpKrEgPCAnKWcor4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhJ-00G21d-0c;
	Wed, 11 Oct 2023 13:56:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhF-00G1y1-0p
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:56:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40651a726acso63641425e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697032578; x=1697637378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JcX762v3k5cMyKxLty5ODMVhmrCoTWf+2CIDOMj2ww=;
        b=GUrUjDRvFM0fmmnWaLyCTnztx9ZZ7wMhS2YcF9xlyboY/293I6kTo4D3Idx8tb4YgX
         qSvqtncqC/mCWytB9ZXBblE+6beGoBoQsTCZZiq/pn3kUvVLAL4ciUC1TVqAGv+II1+J
         wJq28wCq0fLaIXWHg9CyjK/hV3K1GkoDfI0tmaVsDQfJXUmDIvfE7aPvLkJkJ0YRWIsP
         Pa3YJkLUycMu5t/DJDwmvpxmCxyuZl5NpieBUOYdLRmXTCn1A91uVUKscJ1zJ9fQQqLk
         pvAZBbGRAzX2GVNrGPgSHl5050xiJOg+NzEfPhj6n135lSPVF9MYMaTsIR6f4ll7BYVE
         VzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032578; x=1697637378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JcX762v3k5cMyKxLty5ODMVhmrCoTWf+2CIDOMj2ww=;
        b=gK2GrIEaVNj8J6Qoj6xL1fn5uS9tSqP3mCzue0a2MzBymq1IvC2ovdD9KWbeU+W3JQ
         qD8DWQjYhqlDyCQpoDgqP191/qtTN3k7NPdNZxwivsl1Q52WdVuP8PZU0wpNJjg8h8Fl
         hZl7zxTwH52jTmnSxWWiHz8/LcatFuVPuGDvzdcGidFfjEHJltmyaeIV6ri7R7eKFgzs
         mf+iuAGywKQe3lZBl99g2Cbkv/hyHAXbktdhX7mX5aIRZqDtRdmq8mOiWok+Wh06mvlS
         gIwjnkPq5SWLwWXOegUSCfoEkdnpviXUHvfqtTCNCFYKEmWuqJNUinTCIg0txFEANMLF
         D1kQ==
X-Gm-Message-State: AOJu0Yy/EotO15MiqNm+zv99g0J5IBlPyxMDOpDosaSCgx6JNbYBsgfG
	jeKiNCsM8MEAFlXU3cQ1Pt6kYWPo76ajuYiJdTY=
X-Google-Smtp-Source: AGHT+IGK5OJJndxuhhHqyjOf68F9fKZeJ6lijkkilLaF7Im7gNJbArSF/HpX68ofUyV6Cdtxn9MZWQ==
X-Received: by 2002:a7b:ce98:0:b0:401:bf56:8ba0 with SMTP id q24-20020a7bce98000000b00401bf568ba0mr18060963wmj.28.1697032578009;
        Wed, 11 Oct 2023 06:56:18 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b004063c9f68f2sm14126692wmb.26.2023.10.11.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:56:17 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v1 5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
Date: Wed, 11 Oct 2023 15:56:16 +0200
Message-ID: <20231011135610.122850-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011135610.122850-8-ajones@ventanamicro.com>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_065621_333664_990B453C 
X-CRM114-Status: GOOD (  17.30  )
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
