Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D75C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrHQb1IM7d6XAdoeUqemVss6gSQ4JKLn3CpzfUGxil8=; b=K8SFc3xPBsHgG5
	5RGvl7ZF0Oqd7e5MdnrtTwo6Ypq36j3Q1v9PNjjEeLB+VCJv9sIGEU+H52CET264lGFl7xbOt77E6
	jUKYIOo+2va6WPwnDS3WjYbBAr9cVKfiJlXiRwblGmkdqtFDuiNfwJO8rUSlJ672SRlPdk7IigObK
	sH0IKUPPSz7Y83pQiXlEg6q3sCPwm0NOMGx4YFClW0if9Y7NsThyON4cs1wHZWbpXxk+feqfOWL5m
	afaMjnMl3wb7b5xYolkm2sMxGGaHe6pWYEflfXPQx5PflkeDTXfcebfMsR1+Q7HTG0xslI4Eq7MMp
	Il9sgm30flEyLoeIWhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVcr-00000005R6u-1WQ0;
	Thu, 01 Aug 2024 13:13:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVQ5-00000005Jjf-2MJr;
	Thu, 01 Aug 2024 13:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 082DA62850;
	Thu,  1 Aug 2024 13:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ABDC4AF09;
	Thu,  1 Aug 2024 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517236;
	bh=18sWPiMz/2PRxXCIvtfcK7spgh5pr5ZrfaiB3z+47E4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LLg1OHA31BGAOp+FcPmnJJOjzfR45mz7vsAtPMUFCrp3V7jiNukUbotugAHXE9tfV
	 aIcA8L9FYxshLmS4g00Xcx4OAeSAXMA7Cx6hpLIH3QZnSQCt8YXedBHO8JI/yttRb9
	 JpkHjxdKoSHdhI9vBqBIdnPygpaZJ95EUystul9JiKsQD6DkVqldmjSesjTbLv0sqm
	 NikT1hoabasrT4HukGBspGC81nPLvOcQeycfSnyUlng10ZobRMGQEKzhITf55ljibS
	 VtYKfgXcpzqVAaAmo+gfDKDoKfc1vsoY8HVPiXk+19EWEoJEiduwxjrgaCrru96J69
	 z1MECEs5pWqoQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:55 +0100
Subject: [PATCH v10 28/40] kselftest: Provide shadow stack enable helpers
 for arm64
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-28-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=broonie@kernel.org;
 h=from:subject:message-id; bh=18sWPiMz/2PRxXCIvtfcK7spgh5pr5ZrfaiB3z+47E4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YbFMDh5Ckm74QVwECa6WtHKMFE+UgmODNhyXqy
 jR+iB0mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGGwAKCRAk1otyXVSH0P71B/
 9V7hV3CQrkTFd7jDYY3vyp6DGdl60ANtDN9HiUq6OdnYyjo74919F2XR8dM7OFco4J0gWHLqcHOJMQ
 mCqdEM4vB9PQSvpXx2GH03cxvxIqdqfE55+qgXzqgNbizwwLZUpwdgD5RHVNHSFRB9W/bjx+JZXJqE
 PKyTwIymZZopYRk+Y7ejaWLDSbbzDu0NF6S8j6E5VbD9oU0rsQLaLyqdWH6OjAzZA3A/kzW6XVepic
 IbfLQ4Lre1T22ts5jLylYp9CPZR3M4w4IURa3eyhuBgX98WzddCT/kBy8n9tPazpRw0cDNsaEqUins
 yEg+6uGOgaqj7quxk0iWHDXsMAOH09
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_060037_741150_04BAC129 
X-CRM114-Status: GOOD (  10.52  )
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
