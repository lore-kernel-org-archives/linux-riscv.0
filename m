Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E6EC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 02:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmUhv6GwR1Vzaja9Z6+ESt55+gObaL3SSXDbSY+CI5w=; b=n47OFSNOO1gCcz
	XcMfBUtSUfk1T2xb4hUY/V8NlwOj4XNUjaUkBZlhBjvqoVssE83/fRYR6ZltuVhb9zkSi+Q4jzOiC
	shjhjSjLf01h325tha3iI4MeEP5R9arEjvYVefk0G/YTfaAkqr3ATKYhm1euHuPI4uLVwP/Uvkor7
	PBEjtUbRSVl7/lYCLX9Q8iPDzKT8WdX97NqqP76DfEKnbqjg3MajvtGlOlIpB3czdvUjf7rrKUSaX
	oLg55BUvyH8iYrSs0V3PZvJryWXwxk082hXMPc93DjuY5ZymCh6m4aIilwgLqGm7+QOYezUuUAszV
	BqrRjzbCR62rK0qoDJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60ok-003eIi-LG; Tue, 28 Jun 2022 02:19:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60oh-003eHG-Hc
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 02:19:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DD2B5B818E4;
	Tue, 28 Jun 2022 02:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2C3C341CB;
	Tue, 28 Jun 2022 02:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382740;
	bh=79bXSpWjGPh6CzHNAJvqzaDpWV02fZudh2qvMmluaos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Glb9aijZ76eLTniIJ+AFDiPZL5DDrD/vGsM/9WfvSOLTcuzWDlGn7Um9tDSM6Je6y
	 BCPqteDb8OvDpVoMB6BUd31CHH9DSbfiP86JBPQnhtKnG7gMySSocpfSFaOS0JvnZD
	 5hZPLHV4HpuqoyBRROQsDvhrHwFR4x6/ApSiS9ZIGTl63OtLd9T8VhRjcVPKeus8Gc
	 pCuERs6IGd28sQhUPqGUEJlKcwLk3UCIW0nf6b1Jiu1sVnYUoxuLF2jfgy2STBM+Zq
	 TuPzDjWLBTjY5lCvahwTmY33f3lmVJygdzFaTBa06/sTEg9tKfnwxHZmjdAdpQCC48
	 obtE7iLGCuGpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.18 09/53] selftests: Fix clang cross compilation
Date: Mon, 27 Jun 2022 22:17:55 -0400
Message-Id: <20220628021839.594423-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_191903_902660_B5F49D6B 
X-CRM114-Status: GOOD (  11.49  )
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 795285ef242543bb636556b7225f20adb7d3795c ]

Unlike GCC clang uses a single compiler image to support multiple target
architectures meaning that we can't simply rely on CROSS_COMPILE to select
the output architecture. Instead we must pass --target to the compiler to
tell it what to output, kselftest was not doing this so cross compilation
of kselftest using clang resulted in kselftest being built for the host
architecture.

More work is required to fix tests using custom rules but this gets the
bulk of things building.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/lib.mk | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 2a2d240cdc1b..1a5cc3cd97ec 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -7,10 +7,31 @@ else ifneq ($(filter -%,$(LLVM)),)
 LLVM_SUFFIX := $(LLVM)
 endif
 
-CC := $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
+CLANG_TARGET_FLAGS_arm          := arm-linux-gnueabi
+CLANG_TARGET_FLAGS_arm64        := aarch64-linux-gnu
+CLANG_TARGET_FLAGS_hexagon      := hexagon-linux-musl
+CLANG_TARGET_FLAGS_m68k         := m68k-linux-gnu
+CLANG_TARGET_FLAGS_mips         := mipsel-linux-gnu
+CLANG_TARGET_FLAGS_powerpc      := powerpc64le-linux-gnu
+CLANG_TARGET_FLAGS_riscv        := riscv64-linux-gnu
+CLANG_TARGET_FLAGS_s390         := s390x-linux-gnu
+CLANG_TARGET_FLAGS_x86          := x86_64-linux-gnu
+CLANG_TARGET_FLAGS              := $(CLANG_TARGET_FLAGS_$(ARCH))
+
+ifeq ($(CROSS_COMPILE),)
+ifeq ($(CLANG_TARGET_FLAGS),)
+$(error Specify CROSS_COMPILE or add '--target=' option to lib.mk
+else
+CLANG_FLAGS     += --target=$(CLANG_TARGET_FLAGS)
+endif # CLANG_TARGET_FLAGS
+else
+CLANG_FLAGS     += --target=$(notdir $(CROSS_COMPILE:%-=%))
+endif # CROSS_COMPILE
+
+CC := $(LLVM_PREFIX)clang$(LLVM_SUFFIX) $(CLANG_FLAGS) -fintegrated-as
 else
 CC := $(CROSS_COMPILE)gcc
-endif
+endif # LLVM
 
 ifeq (0,$(MAKELEVEL))
     ifeq ($(OUTPUT),)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
