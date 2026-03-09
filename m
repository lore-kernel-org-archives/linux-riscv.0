Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249FAFCA18E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 21:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBWHOipr3D5LYwnrcDTSsAzEALp/OXEo8gZcdClgD3I=; b=gI14IRJuFWYyMk
	L8U/H4VvpHT5e37iK7m9ht3nWZqnKe4JYmUgJaAcJXz83RiWiuyoXPRfKC8Zv/2WETH1JVTJuQMhL
	OuSp8XpLuuqdBDpQ5ZeT4ulJ1DFbrvrYFhBuDHtJBvSzG3PLlH7Rks2ceCRa8EY7iAZse9vPZRRaH
	vednUhkdcG9sUjL0qV6yg1Df5AR0CFIqpb4PSzCdkwle1iGXOK1A86ju8DGfVZQ9MJhGzelavijfs
	09d6B025VPMH9uWKQyKIwYO7mpdVTKIX5fADZtQvPIpR9XU+QERPBfT0B6lKC68EnngZ2xBnIgIo3
	KgppMu6KlNOfjlm0+fJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi2V-00000008AyU-2pOx;
	Mon, 09 Mar 2026 21:21:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi2T-00000008Ay8-3Xvy
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 21:21:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so20194305e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773091278; x=1773696078; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mR/03iy2wclJWH4dE6b/zGJuZMq85sTEJ9qWO5p4OU=;
        b=hBzELtjshBvOK2tY4xXx38QSz2WM75OGbZ9pVNJzGyBTjrniIm+yK9/MxbyipwHcPo
         0RP+Zas6guaSHLlU9WETVqunT/ryi+ZAwKx8EJLXhvf0sCoRNJ6o9Rc51ADOB6zuYCbV
         rlqJifrqnAgwQGQHtzBQZYw2/ys8lS7sgVzxFDEFa4MhMwK2dlVDOlkCQzg2/lFN2FTr
         u75bjoi25TAuejP91YJCGIyDcQfYEWoyw5TnL6nWkDnKuH1SHTGT1aAlvkSdzzn0E6Y8
         151p831zsnExvNiUB0tQXgbf+8xo3T2aSgHv2kFzFDP1VO0wKjtzejHn2qhaubHEq0Ls
         siCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091278; x=1773696078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mR/03iy2wclJWH4dE6b/zGJuZMq85sTEJ9qWO5p4OU=;
        b=O2ZSttD7zyF9wzTECQQ6SKpHietvMiXVQHS+Saz/JcHVfpoMMALj3u9c4fDtwPRWOV
         iHpXNyLmKdLikZrC9vFStjPtBTJGPLQ+cK3RdPOh4HF3ND1zo/HLA0XaDmUNiSRG+qWA
         uVSFPiYoKaKcetMVU4p2R3Cp2lnrYKM7efRkXC6Nh+qfWa53XeEUtNOkd2IsTY+yxDfz
         YIN/75iwkEMZgsB5OzFoiBMVr8w+qOxjsQkhWjIcH8nI+ibdcsATgsCoy9wyT4tSmBP6
         hodZ110G0A2OiNLLOVyBRilsSvXZ5bQ9mPApM4wJAVJa4ZVV0dUnHKvfp4USVe3kcJOl
         6FuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm0IWieZ+SGaCxGoLq97cAIKnrTSvrtMSe+2bi78ub0zXIeJfjZcP9Vgdnq/w728bjgCEaBMSm4sh1bg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5o51iECwnYTiTssuUKMzDonqbmBlnRLGeAzJmU1DJ1x7W0BQF
	FFnvanw5L0j5KvP18kDkIULh7iPRWv9TJF0Ew2ult1QQ7cryGZbNtR3Q
X-Gm-Gg: ATEYQzy1j9TXRE/s1oEHaPI/h8Z4Vs+/Gxc5dKZT5n71g+IMcMH/rFNpvIc5UBC3Y67
	c8xwYBDxBnTuaEDoNnH5yfSl859yhXck94IZdoxMPfJfpiKt6nVhfkU09dhLqiqYHwWe/N/eR+Y
	/0tsenPCf/zl/vqBcGSdXvu30/sbOkaB2ljyAAmiww38ntqjkDl+iQUHd+yH+ZZhuXehoxV/x37
	fNi3MKCmKN519SseJipwzM8wgb95Hxtmv8Bd7L1eGYq3LXl4K5Ng6x4CW+FFaMwn7ZiCQ8rjYMX
	TlGH/uGnL9DJDB1NtCRrpntX/HUSLVIu9X/4u0rx6FbdhcyVMgyo8UTrGLiJScovOHdshivLUiD
	NaQj7ebqok9UFWxiePXls8N0lW601VvUPNUdgcysYSN1DLIcJxwoHBOKgegdp8/eRG4gkXtAUSp
	TasjFb/cwII4di23XA
X-Received: by 2002:a05:600c:1f0f:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-48526967cd9mr205736655e9.22.1773091278353;
        Mon, 09 Mar 2026 14:21:18 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aacd81sm18535685e9.14.2026.03.09.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:21:17 -0700 (PDT)
Date: Tue, 10 Mar 2026 00:21:14 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
Message-ID: <aa85yl-c2suNF5LO@curiosity>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_142121_899299_3FF93677 
X-CRM114-Status: GOOD (  17.43  )
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

Hello Charlie,

On Thu, Mar 05, 2026 at 12:11:28AM -0800, Charlie Jenkins via B4 Relay wrote:
> There are a couple of compilation issues of the riscv selftests.
> Coincidentally two of the issues are independent problems with not
> including the header that includes the BIT() macro and the other issue
> is from checkpatch incorrectly suggesting to remove non-redundant
> braces.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
> Charlie Jenkins (4):
>       selftests: riscv: Add definition of BIT() macro
>       selftests: riscv: Add braces around EXPECT_EQ()
>       riscv: ptrace: Fix BIT() compilation issues
>       selftests: riscv: Add license to cfi selftest
> 
>  arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
>  tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
>  tools/testing/selftests/riscv/vector/Makefile            |  2 ++
>  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
>  4 files changed, 15 insertions(+), 6 deletions(-)
> ---
> base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> change-id: 20260304-fix_selftests-c3f0ae46b3c7
> 
> Best regards,
> -- 
> Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks for catching this !

On rc3 I can also reproduce the issue reported by the kernel test robot
for v_exec_initval_nolibc.c and vstate_exec_nolibc.c. The following
addition to your fixes seems to resolve it:

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 92c4cfe5f34d..48d6cd5e72f6 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -22,15 +22,13 @@ $(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpe
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
-	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
-		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
-	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
-		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 4dde05e45a04..e3f062c85452 100644
--- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
@@ -9,6 +9,10 @@
  * To be "clean" all values must be all zeroes.
  */
 
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+
 #define __stringify_1(x...)	#x
 #define __stringify(x...)	__stringify_1(x)
 
diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 12f1b1b1c7aa..ecd687bb8359 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/wait.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+
+#include <sys/prctl.h>
+#include <sys/wait.h>
 
 #define THIS_PROGRAM "./vstate_exec_nolibc"


Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
