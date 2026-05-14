Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F240CD4851
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IdKdYCzDoCeOqPBoEjSc4f9XdDyvOSSyHa5RMPvcx/8=; b=XKHDvPJM8DvlU4
	CKRwqgUNOLDd+o0m0uDBcjd9WOwa3uyKhGfvpMQpSx8a3Be3lLs84zifqInyVJl/Q3y5YSLEN9euK
	WMOSdh/JsVuIf0xZfGh+/DizxBLsrP/HCjPy7Q5RHmxzLECSuOXRVU/0ozM6irgSQU4a8F0XYVf6A
	BGxVTBovUUQhAC9hE4LlAoWXUmOF8/YVij5AiutkMzVUAMa5QBbLezWDAQXwEZcAMJHA3owS4NYWp
	ogfuO7Jur46UTOziALu7G1gMPkudegfnNFPUZSvaE24W7UG8mJYKGXMSZOqUosv2b6ZE6RgzeB+QD
	J/hlsrWM7e1UZFsEFs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUxK-00000005QRn-2ROS;
	Thu, 14 May 2026 12:14:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUxI-00000005QRA-0UTc
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 12:14:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-44a14580111so5792061f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760858; x=1779365658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGqf3rD2el4Fophu1OMYrfA7Yv/0FbhBVG7jdE96agc=;
        b=XZn/BfYmSR0yz/oqeB9O6csEPSfbR263ToUA1ZbZzsKZn+4ju7CNJc/87CSNsIeqTg
         lHRVmaDEZJzr4U46rO/rB/pSexamCO8zrYF4kf6XjOSAw2nHjLMuyjISwrjwnubuvwfW
         LrY2jhgX2fFgxdGjtGSxXyxUv1WDnwzni3nCx8IkO8CIHkcSy60x348+P+gRuvYILy4E
         qeY9Ca0w1YudRHXms5gKvnO6EMZ/TgJHUwc30TymBaDqNOBmGvMr78mY6S2RrZGSJNio
         TfqVUd0lu05i7d0UPMV7fS5i2DJ/Id7R0aEdK7hg7QRwG9eECTHKYbNu5+0uYKhCMbD9
         QxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760858; x=1779365658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGqf3rD2el4Fophu1OMYrfA7Yv/0FbhBVG7jdE96agc=;
        b=XasdIHN+DtORfWX1Z7RsLm/4ylJJ2WgsYBJU69bFW++Ey57GJq4p4U7Uh/zZPt2yHl
         GBl/a9ia1XjYsdgFwD8ihTMR7+C4UO0WtdCdYAZWhdxjZVgL2ZWCOBQ82vseep7hABJB
         ue6JXEYizlDFAKP3mvrIcFpqhno5G4lhoVJoeS9d93W197zgb6hJ09AAnPjV2fgVKrXy
         0JNLTSq8Reu7+as3nl4ztymXdTHhC218vQODs+KJvvvFSum2HgQxv/aCVME9EABca/Mq
         jIwl2hOpk+ged7Za8noY7RSjEFo52c8/zxlFSZJeS9XVhYYTBFiLNHfSzJ19JvJQuv5f
         Fk1w==
X-Forwarded-Encrypted: i=1; AFNElJ9Y6sf/kBuilZPJLI34TdHN/9H0MGnl1cNlQYJUcPpQE65rkgPWSQ0hYD4b1NawfZmEvgwTk9qmXwzh7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7sIlXsrGNkwOUxVIjpYLTIq6610N9EDHX/gitbydMHhGP6Hnx
	2R7X83AyvYaBHVksc5T/oel3UhlYHmKtPqXCwTBvLcG179uXkxHCbOQO
X-Gm-Gg: Acq92OFCCqOkVEdcJSSGm199HR0nn+Y+uJBh04bhbCgs8opa28LRb0YSVPvYy2Q5zub
	OxYlE1cKKCrAInd1qEKec2lrfJ8sY+5Ll802SM53zax4ka/v0C3TytLYZ8uiTO+rp3RSOud3Ddt
	WbYw//qaxqV+fWi23b74yGfyHpaByyjzV1MIWYW2GKXN3ahTum6cWfV+abUGuL8bXdkp1kCBxb+
	cZ3DbqePRlgEsuvSq049Mft5U3ZoyGZXExmgf6KxlLAnrm4MS4+SxERKsT55YsMpi/6+K/6iKb4
	s6Fbh5glU1CLKm4mEOav+A7sxs9uPPlJ3cJUqz/UGb57ydK/EsYjzaDmuAZjEfHKis/K+wly7J/
	3Xdo0HuY/w80+WGzH2VgvJFGr/9PKiGdvNo1bMXJ4H8uQSnlG8J96E7FwAmMM2ZmMH4TBhUwOxc
	8Ec+SvHD5J6Dl550f0xe2l4S66dHtcAmKJLMcI5rYieJZ7HzyA7L5h
X-Received: by 2002:a05:6000:1acc:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-45c7a4ef3e4mr11408615f8f.29.1778760857731;
        Thu, 14 May 2026 05:14:17 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm6285630f8f.2.2026.05.14.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:14:17 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <milant2002@gmail.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v2 0/2] riscv: lib: add optimized memcmp() and extend KUnit tests
Date: Thu, 14 May 2026 14:13:56 +0200
Message-ID: <20260514121359.931999-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_051420_169365_A0CC6531 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

Add an assembly implementation of memcmp() for RISC-V. This version
incorporates feedback from v1 regarding alignment safety, loop 
efficiency, and ZBB usage.

The second patch extends the KUnit string tests to include functional
verification and benchmarking for memcmp().
        
Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

---
v2 changes:
    - Added alignment checks for buffers to avoid expensive misaligned loads.
    - Optimized the loop using end-pointers to reduce per-iteration overhead.
    - Implemented word-aligned tail handling using ZBB shifts.
    - Removed redundant pointer equality (a0 == a1) check.
    - Retained BE support via #ifndef; ZBB rev8 is used for the LE fast-path.
    - Fixed KUnit build failures for Clang and non-benchmark configs.

Milan Tripkovic (2):
  riscv: lib: add memcmp() implementation
  lib/string_kunit: extend benchmarks and unit test to memcmp()

 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 124 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 lib/tests/string_kunit.c        | 106 +++++++++++++++++++++++++++
 5 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
