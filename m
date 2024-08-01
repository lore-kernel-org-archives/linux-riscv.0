Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B612C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8AHkOAWdUIrrKOWBw5Ig0QCKR8E/7o+e/TjIx33qUI=; b=w2093DhXiuZOvd
	kTmApY0N6qpP10m0AsM65TR2IyAV++fcEaCVCYsH8zEEa2vZEOJevBUla9YAUFKlw4+IWTudzk34S
	rwSELso8H5JyE9SaNteVeqrhkhO9ZSL8mvKzD+Wl4exxmBX2n+jxbz4vZxDDdgsqv99E4/OYKqKu1
	8HCkxULmW6EGMeWOgBEP7l/r1fbLZnhgNI4ceR7Fc+GZoWWnRsIKAsPJummPY2bI9EzBE82CeHKNb
	B/K7STq3X1lXl38bB+XrO33TXOjHjM85VetBlQtJgnrtpVZr+TrjS3A/oDRBLbDi+ZNAuolmzPdgI
	HVCM6xlMrOd/Q478A2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVdL-00000005RM1-2W5l;
	Thu, 01 Aug 2024 13:14:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVQC-00000005Jps-1ZeK;
	Thu, 01 Aug 2024 13:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C891062864;
	Thu,  1 Aug 2024 13:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AEAC4AF0F;
	Thu,  1 Aug 2024 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517243;
	bh=b9Gx7QUiEPIAdR9RNFo057BasR3/TeEIE9B40jmDJ/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BeDPSC+svn9jwZ5HO/dupvJkJ+PBmmW9gsAmHLvayeZzSX8Pr0bdYPgA7jak1loAG
	 B+uFxjpvPSKnLe9VaN/Hlx7dl+x/cqqPwzW7yFwl42FezkGYJiZN5RCg9+cL1GKlel
	 hyNKn4hrTImC+r+ryQAO+gyOhsxyza1wdGUrMl+hMtYqKJ3sctWYb+MRxx9F8lf/hq
	 AnucC0+Di4cr2GDyoAFoNgeWce0gSe/fC9ceMx9WMu0F+SYnoIrtWWV67/YXMXM5zH
	 dzBjJNaYYqVheTGKdo3bvH2fiTYpPrhOSPFpxnXYKzNJKXaUHR2l72RHB5pjJrFUXZ
	 msXrY9gmhemOA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:56 +0100
Subject: [PATCH v10 29/40] selftests/clone3: Enable arm64 shadow stack
 testing
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-29-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b9Gx7QUiEPIAdR9RNFo057BasR3/TeEIE9B40jmDJ/c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YcGlhpOj6DsmlrQLB9sFNjFcmtR7a/7hcuDPJi
 1WPfvR2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGHAAKCRAk1otyXVSH0N2DB/
 4u1y7NKCOY37zU67JkUPEpNLsIl+VxURgETEUY2dZxEx6yYfE1aGAywt3yaSnGUEbwMW6edKYAUchr
 4lX1kFqnAkhrcwH/nHkE9EbHAp4S4onx5plRdvTdDXwbgmz9ElwxH6PAqrgAMAIjlcAemgMh1vsL8Y
 Jg0/iFzW4BJk+Rce85J3+MBPkk3olEf8DTdwKM+HBVHKZp7ROhXC+Nae32yoRdbOhKnyP9M7hapDmf
 uhlvd8GF7sxAUK3Kn9pUCmdB6uiYGekqzCCdForvtzIVTGBYp26p5Q3D2VBstoD/ZA/AUXheARDpJB
 N5WUxquIwZz86X9UXY/FGZfGSvrPm7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_060044_577839_EBBDEAA4 
X-CRM114-Status: GOOD (  10.90  )
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

In order to test shadow stack support in clone3() the clone3() selftests
need to have a fully inline clone3() call, provide one for arm64.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/clone3/clone3_selftests.h | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/clone3/clone3_selftests.h b/tools/testing/selftests/clone3/clone3_selftests.h
index 38d82934668a..e32915085333 100644
--- a/tools/testing/selftests/clone3/clone3_selftests.h
+++ b/tools/testing/selftests/clone3/clone3_selftests.h
@@ -69,6 +69,32 @@ static pid_t __always_inline sys_clone3(struct __clone_args *args, size_t size)
 
 	return ret;
 }
+#elif defined(__aarch64__)
+static pid_t __always_inline sys_clone3(struct __clone_args *args, size_t size)
+{
+	register long _num  __asm__ ("x8") = __NR_clone3;
+	register long _args __asm__ ("x0") = (long)(args);
+	register long _size __asm__ ("x1") = (long)(size);
+	register long arg2 __asm__ ("x2") = 0;
+	register long arg3 __asm__ ("x3") = 0;
+	register long arg4 __asm__ ("x4") = 0;
+
+	__asm__ volatile (
+		"svc #0\n"
+		: "=r"(_args)
+		: "r"(_args), "r"(_size),
+		  "r"(_num), "r"(arg2),
+		  "r"(arg3), "r"(arg4)
+		: "memory", "cc"
+	);
+
+	if ((int)_args < 0) {
+		errno = -((int)_args);
+		return -1;
+	}
+
+	return _args;
+}
 #else
 static pid_t sys_clone3(struct __clone_args *args, size_t size)
 {

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
