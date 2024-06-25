Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9ABC41513
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrHQb1IM7d6XAdoeUqemVss6gSQ4JKLn3CpzfUGxil8=; b=CEUerb3hp1PDeq
	ZfwNbCJkwrrZUtHucUJr/6sVFHnQkbe6mEzPbbaYpFFzaQMbS7Mb8UzkdPspYyb+3mq/MLtG90LEA
	Aa5iGWCyJrUAYLZSOCmEXYPlg1cZcZHjLUpUvpnN7fU3+pKLWPwLyDoz4t29tRYvOrmOgZgVsDbi6
	tW5CFnlaWvqGj8nI5ZbbXtQkKk/rZJROyXx73kkkQqcFM5tDxyxDZOPcKZLrUPVDNIOHi0fMtOuL8
	/kWJiMfaaEEBJhZlCvv6ZECRObFiKffuMV7TYwr3P+jUvMFLJNAzGiznreKUkGv3ISGlA+DVTLt8V
	pwPWKiaAXFQ2GHfD41wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7po-00000003RFb-0PT6;
	Tue, 25 Jun 2024 15:11:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7iE-00000003LkE-2e8W;
	Tue, 25 Jun 2024 15:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DAF0C614A2;
	Tue, 25 Jun 2024 15:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952C8C32786;
	Tue, 25 Jun 2024 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327841;
	bh=18sWPiMz/2PRxXCIvtfcK7spgh5pr5ZrfaiB3z+47E4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L/22fLgnVrCDuOa9AvI6QdbD1mU2fPLWMyOny0LJICnsPQ+OE/mai2HAC7OkLXWrJ
	 pcjmdvOHUArp132IpQ/J7Z21Sv/jOjoC6HDAqdUKWzSDHPvfBs0pcnv8FRQWxrb3Sr
	 FraOwe39xbpr7uXa7BJ61D/F5eof33J8kY9ZTgInPA47/sgIlBPg/f8C2pZayWI2YR
	 nrWC+5A2Hs6TAQQZSCany+TRS3b/filwuFp/OmO63FLC5Pow0ctynPP+i3tlzxgMWn
	 ycNQHDCO02rxEI6Wbb971VZMdfryYPFOk1DSQOosLTixKz+ahicdLElvrOaKYhN9HJ
	 TYvGOxzLrD3vA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:56 +0100
Subject: [PATCH v9 28/39] kselftest: Provide shadow stack enable helpers
 for arm64
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-28-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=broonie@kernel.org;
 h=from:subject:message-id; bh=18sWPiMz/2PRxXCIvtfcK7spgh5pr5ZrfaiB3z+47E4=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhrSq2x0KqV3vs2a/V1Pb7Be8+t4u7WmabwqCORe9/xTgHr+8
 zNa2k9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYiHcj+292TZ+CQLdbi9mYW8zEN2
 X1LjihftFL8fvMrGl2EZzskwXMdeZ+eBMrWuqa2borvMb24hZlk386KTFbd8ltvyeVsXVOUuDr1asv
 5ZQFu/QfNL7cmbnl1obSPh5WI7muxXX+i5PSXV4x/kwPf7jnbGuQWhhDb1TwV5+nwho3/2t21fw80T
 +/J3pniDibQTHbr237989ZsoBNX6Ly+1zl60weQQfadrmbdbHmndF47pjSx75Xe2qA22mzq809x4pu
 SvLH7TaZ1mPz6YWxRt70D7HrehQD3Njlrr2cmpYzdT2bxNJMr5m6ejY8x25oC3rm7/86pfBzBmdA0f
 namwlBHDZhJpa9tqHSxU6cK8oB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080403_029472_7B991F2C 
X-CRM114-Status: GOOD (  10.04  )
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

Allow test programs to use the shadow stack helpers on arm64.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/ksft_shstk.h | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/testing/selftests/ksft_shstk.h b/tools/testing/selftests/ksft_shstk.h
index 85d0747c1802..302957a0bbd5 100644
--- a/tools/testing/selftests/ksft_shstk.h
+++ b/tools/testing/selftests/ksft_shstk.h
@@ -50,6 +50,43 @@ static inline __attribute__((always_inline)) void enable_shadow_stack(void)
 
 #endif
 
+#ifdef __aarch64__
+#define PR_SET_SHADOW_STACK_STATUS      75
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+
+#define my_syscall2(num, arg1, arg2)                                          \
+({                                                                            \
+	register long _num  __asm__ ("x8") = (num);                           \
+	register long _arg1 __asm__ ("x0") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("x1") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("x2") = 0;                               \
+	register long _arg4 __asm__ ("x3") = 0;                               \
+	register long _arg5 __asm__ ("x4") = 0;                               \
+	                                                                      \
+	__asm__  volatile (                                                   \
+		"svc #0\n"                                                    \
+		: "=r"(_arg1)                                                 \
+		: "r"(_arg1), "r"(_arg2),                                     \
+		  "r"(_arg3), "r"(_arg4),                                     \
+		  "r"(_arg5), "r"(_num)					      \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_arg1;                                                                \
+})
+
+#define ENABLE_SHADOW_STACK
+static inline __attribute__((always_inline))  void enable_shadow_stack(void)
+{
+	int ret;
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  PR_SHADOW_STACK_ENABLE);
+	if (ret == 0)
+		shadow_stack_enabled = true;
+}
+
+#endif
+
 #ifndef __NR_map_shadow_stack
 #define __NR_map_shadow_stack 453
 #endif

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
