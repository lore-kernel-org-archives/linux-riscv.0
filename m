Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBECBC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpYfZ/Fhrr7oX3D1RMZhAsVIa3JZQCEa2MKO8wDi6vk=; b=vrIAmMlo/g0YdN
	xnfPYrCgvUCZjChxto4A3aG3pEmtuWX+pYMDiJ1WiZoLS2dvj80ZrsUl0vkqR3Twh2cf6n9Gn16zc
	ERzko5o0vtx3oCk/aVYaEE0Mcw9jXv5aDvSGxpOxzvT0qVsILatOgjHrTdaHk/YSqT3i/eAa/zKb5
	HWBIqpJdw824sH0RPNbjlHqn2BT5syCjHzQTYE2MZWDKQ07C4KYfA7QH7Np/cDbg1nMqyQLYkIO75
	JpdypzlTrSIrA8f8gXcZbeVbt5WCebX5ZN21i5jafmniLD9ArpnvnKrxFtSuPKqzAZN0hMPKssKj9
	OSOZ5cLJPHlEhTxMZg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kz5-001V6B-2u;
	Wed, 22 Nov 2023 11:01:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jor-001J1w-0C;
	Wed, 22 Nov 2023 09:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEE1961CD1;
	Wed, 22 Nov 2023 09:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8857C433CA;
	Wed, 22 Nov 2023 09:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646410;
	bh=T2ruSLpA9W494zUv5Qepx8+aOeVctWYAUnjtvSwySvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PZ1Wx9TkLoV/X+IrvGpvBxm3p6Izmd9GqK9jyOJc9sy1HNqn/hpBB9IDGY/YnItPC
	 FxNsykRf6mVt0YMlfyr+sN6Ms9T7RVQaFkNsTC97fEZO+fUPVL3W+m9G0jzYB6qJvU
	 fcOq4KiCnX3OIM7tYWZAgS1Dfpg9op6/746si+Kwinx4ZMTj3QHxm/4lY+A9etL2tm
	 3tDVaZcBXqr6AloxwT6VSntqHTUxAhWdYRr3+uHHBcI2CVZGpeWf/WO77bzijAhQMP
	 IgOKUS9jtIu55IdkUoQbVxx5C6B0g0nizVlIJwBO2KFoLMsKjJTn1z7CT9vjorguIK
	 mbuF/n9+xD0Xw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:40 +0000
Subject: [PATCH v7 30/39] kselftest/arm64: Add framework support for GCS to
 signal handling tests
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-30-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=broonie@kernel.org;
 h=from:subject:message-id; bh=T2ruSLpA9W494zUv5Qepx8+aOeVctWYAUnjtvSwySvY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0NR2aczxjlGYq03aKOVjt4W10C6p38XrK+J
 oS87f9vTxSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NDQAKCRAk1otyXVSH
 0Ad/B/0VsxBXosT03kzkufFFapLPj6qQjPHPpPO24L3muhblnM2KlRjG3UB0MkKu0OEUIMVyUho
 SY91EGTkHNCVXdHw/Lpc1koXFKbfRMmvqbBknEVQQu1QuaxEHVqSeecnRQ8PvGmxep+HblX3Qgb
 KR3G5zVXW9eN7I2W5giFJfKIIVQ8LQDfzz89bwRkq7w/kCa7nvvQSOYd0aY7jokuRUL7OrvZL6W
 jk+8SBvujVBd0652MR+Sut6kI5bVnfQMcKoXiaAFeUEuhmIbkk7sG3L2Kd3VY6lOxsTMibSGZL+
 UgM9uLhNy73cMheqzSwzPPmyYw652KL+eUp2gxUIYbYB5b4J
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014653_268230_D4460DFF 
X-CRM114-Status: GOOD (  10.12  )
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

Teach the framework about the GCS signal context, avoiding warnings on
the unknown context.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 7 +++++++
 tools/testing/selftests/arm64/signal/testcases/testcases.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.c b/tools/testing/selftests/arm64/signal/testcases/testcases.c
index 9f580b55b388..1cd124732be4 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -209,6 +209,13 @@ bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err)
 			zt = (struct zt_context *)head;
 			new_flags |= ZT_CTX;
 			break;
+		case GCS_MAGIC:
+			if (flags & GCS_CTX)
+				*err = "Multiple GCS_MAGIC";
+			if (head->size != sizeof(struct gcs_context))
+				*err = "Bad size for gcs_context";
+			new_flags |= GCS_CTX;
+			break;
 		case EXTRA_MAGIC:
 			if (flags & EXTRA_CTX)
 				*err = "Multiple EXTRA_MAGIC";
diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.h b/tools/testing/selftests/arm64/signal/testcases/testcases.h
index a08ab0d6207a..9b2599745c29 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.h
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.h
@@ -19,6 +19,7 @@
 #define ZA_CTX		(1 << 2)
 #define EXTRA_CTX	(1 << 3)
 #define ZT_CTX		(1 << 4)
+#define GCS_CTX		(1 << 5)
 
 #define KSFT_BAD_MAGIC	0xdeadbeef
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
