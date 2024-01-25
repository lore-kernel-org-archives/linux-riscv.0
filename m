Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D34C48286
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5gE9Dx8q02di10H9Z+j21qHfFYyY8I45LfK4UhgY3E=; b=vAv1vSAUuOx81S
	r3QwAtdcSJG2ZFj/iH4jiS7UU7RciEj7xFgtMPUS9AVkJYpSzPk5cOmqCzeR0PJ4DGMjxK8DMzTth
	/srWOpZbByKyHqaP3/kX4g9ZzIu1MKlG9DP8ZvmZQ2i5LiTcl7a/KvXpctCj/eg4lwnQGQSHRc6ls
	nYnIWUhQMbH4zkjsPQbCO3IcMNpWEfP0PX/h5FT7pR/hLl/KhmOFcD4d1CM//1MCKvhjepuwBsVWP
	OL7OtTZ+c673VaKoZA8h5PW6QRtMn9GoK8dk/s4+x7tNgzs1E7PFMw75NJqVNxBuZIYSttRXSkRUC
	1IhXx0f1H9tFeMKvUKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3aT-00000001AHb-1AiC;
	Thu, 25 Jan 2024 17:32:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3aO-00000001AF1-24a2
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 987E3CE347C;
	Thu, 25 Jan 2024 17:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BBAC433C7;
	Thu, 25 Jan 2024 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706203937;
	bh=IDSSBzPhxzI+ZK3MxpGpT7LOXd777sA7SwQ1ZR2C1s4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XFn3NOYndZhJ2KFChTNTUAi9PV1wJbswY7JOjNIj4+XEgp8qCtCZYARLiv5YNm2fv
	 Xfr9vt36bv9KIMKzMShzfACzod4M/vOm64cRl4AGF37q97uQq2Q4KeX0OXxzS22D7g
	 MgiA0Ib1ifvakVI2o8EoEkfHyybf0eaTsKKhzRClTi0Cp4gIrdlxXXPpbMX6e6zbSd
	 LvAWmBiw+1LAPf0bXTHIJm1oCj9I8nua8nuzgphr1KVLDYrDJHg9yVbRHwIKum1qj3
	 +SKvxxWteyxCeAvilAUGM/FQ9pTj6H4gv/8S7kAv9IuXsNDZ3Rw1d1o3Pmvq2xFzrM
	 NC5V/djg1TtVA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Jan 2024 10:32:11 -0700
Subject: [PATCH 1/2] kbuild: Add -Wa,--fatal-warnings to as-instr
 invocation
MIME-Version: 1.0
Message-Id: <20240125-fix-riscv-option-arch-llvm-18-v1-1-390ac9cc3cd0@kernel.org>
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 masahiroy@kernel.org
Cc: nicolas@fjasle.eu, andy.chiu@sifive.com, conor.dooley@microchip.com, 
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=nathan@kernel.org;
 h=from:subject:message-id; bh=IDSSBzPhxzI+ZK3MxpGpT7LOXd777sA7SwQ1ZR2C1s4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbZsu7K6zaXpv59fmm4t4LfcbtCm9jLi6ssZYLLWOee
 vmvbhJnRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhIkRDD//B3jdx17xQfM9iZ
 pRb/+3snLFAuM/FoKZPe0zvH17zUN2L4zaZcGrX4yv84AfeJ3nziev6BfF/4DA599lxStzMjqDC
 KDQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_093220_947132_D13770B7 
X-CRM114-Status: GOOD (  11.34  )
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

Certain assembler instruction tests may only induce warnings from the
assembler on an unsupported instruction or option, which causes as-instr
to succeed when it was expected to fail. Some tests workaround this
limitation by additionally testing that invalid input fails as expected.
However, this is fragile if the assembler is changed to accept the
invalid input, as it will cause the instruction/option to be unavailable
like it was unsupported even when it is.

Use '-Wa,--fatal-warnings' in the as-instr macro to turn these warnings
into hard errors, which avoids this fragility and makes tests more
robust and well formed.

Cc: stable@vger.kernel.org
Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.include   | 2 +-
 scripts/Makefile.compiler | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 5a84b6443875..3ee8ecfb8c04 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler-with-cpp -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 8fcb427405a6..92be0c9a13ee 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -38,7 +38,7 @@ as-option = $(call try-run,\
 # Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(KBUILD_AFLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
