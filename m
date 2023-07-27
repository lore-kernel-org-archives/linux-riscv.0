Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723F6C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cx+4ubtYsx9A8bSMBn+6Fe+dAE5Dz+4jj3l0U+Tdezw=; b=QRw+PqYH3uPPuO
	BkG1mXXGCUshc5K2nwjUe2ZGievcGL8Pz61usttA71t5wGtDk8QBdcDQg1HsU/v1/tLg3dcf07sYG
	q3rXKa+o9M7gN6bMWCSdZJ1+DRAwxct2DuLsvvYeFQFZdZdFSdW8u889JO4Rng72ol1X4uiNdE/6x
	pfwjogNrHZ9VQofZjhUmMpMSrBaScJMb+g7UCEpNxTm0F45WlRS6kVciDDUcu2LSm9EEl/IZwD+PR
	rZvAj95XAJwSIY1eFhJqPQ5yF41C8494VZ9vVo6IZ8cBmaI9YUC5/YoALiiltSpUL4clYOL6Q7Rck
	UCqB8iRJ+ZLi//CxF9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP20Y-00FDIO-1y;
	Thu, 27 Jul 2023 14:30:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP20U-00FDDr-2S
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:30:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so15684005e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690468221; x=1691073021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUMayOneQ9ikYzzZBl/jcEnYT2gsm9hVqQEHFi1LQzE=;
        b=j2+29OnuTalZpnUEEI7QghInin+VyTSgd3U/3esMN0czsLEJt+ZuFpJ6Bib2ay3vAo
         534lwlygEEh6CiPhlG5t57U9tfZcRtsdMErIcrzQbkcQNe9XfC/5Az3c7pEmwas+++Ay
         Ayoo+z561d8R12szH3sy/0m935SuCVVAl+bvyiQO4sxYJnRHU2BXGlZ5UIoTF7Hu2N5z
         xNsqBZn4ZvCRlUc6Q5mfe7LzXpr++aSf8VpcTNiLu641sXTu1vu3EaWXk2+i7KfSm8f+
         uY4DXBO1KTcNDRfFNOUGEC4sFMo/U6p05YmISwy6Vk7IDK4aogg8I04Fbfi2dVFTm3Be
         /tYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468221; x=1691073021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUMayOneQ9ikYzzZBl/jcEnYT2gsm9hVqQEHFi1LQzE=;
        b=XCCvf3dliDjypDlRylIVrY6CZgUDqDOe6cj26L4AOa9/w7YhmrbaYhpQ0TymAkXaRB
         UEvEwSdUVKjrBmg9lgt5bcYkxe2n96sxUKDltkx/4xeEP7yaM7P6caIksdwOb66+rc2x
         dsM2hOGgKaG0z1SYNcPbVJDFGUZVjgqKadA9YJjap91FGOksng2w/XWJRcvJ1u3DBdk4
         BDxnNpnBMau2+5yVW4GsRtLf00hstjUQZGYmVWWBpfU6+Jc5J6zWgQ0XeLn6gkYUqYBE
         qvwKu7HffhZVt8OeJKhAHQV8MUHFPd2VGwjAvLzoDIyopuMkQaVGw4t2T2zHCZdt3U/O
         /kTg==
X-Gm-Message-State: ABy/qLa61ypyFgaew+2fWX/D+ictxZj0+LNa/MjLC4fxszdbE97DXE2W
	Tl9s8nEXRkysJaQ+FNnvKTu6TA==
X-Google-Smtp-Source: APBJJlFlAaMbRzdmArSgZ+AV8w3c/5LHqShEcivfEyw65QdH0Aqu7aOQV+4CCgwg82+wdZ4YMYCOsA==
X-Received: by 2002:a1c:790c:0:b0:3fc:180:6463 with SMTP id l12-20020a1c790c000000b003fc01806463mr1879971wme.7.1690468220870;
        Thu, 27 Jul 2023 07:30:20 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s23-20020a7bc397000000b003fba6a0c881sm4726178wmj.43.2023.07.27.07.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:30:20 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
Date: Thu, 27 Jul 2023 16:14:28 +0200
Message-Id: <20230727141428.962286-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_073022_836716_801769F7 
X-CRM114-Status: GOOD (  11.25  )
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

riscv now supports mmaping hardware counters to userspace so adapt the test
to run on this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/tests/mmap-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index e68ca6229756..f5075ca774f8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
 			 "permissions"),
 	TEST_CASE_REASON("User space counter reading of instructions",
 			 mmap_user_read_instr,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
@@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
 		),
 	TEST_CASE_REASON("User space counter reading of cycles",
 			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
