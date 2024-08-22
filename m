Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC586C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDeTvm9OYZPls08tH6aYbk9gtu0wSVfUvFrAV2IYayo=; b=q20CzDA59MoHFJ
	rKmnuaajt4GhflQKLfqAtRL/XCtgSfndTmTE9+PKKGkRTSN70mBYgCVwpMRQVEwpWlPZfT+DKciij
	I+WNLY1f6UC25uhSuVy6eBZrnHNS2wxx2GdLznlJMf8RsiVgptJpiWPqL3cjpyL0UUSjnI10LMC2Z
	p9ZFD4ZemTywfnYhjmV8J02iz89fX8+0+lh06TPNAHPufKHCEXVO9MToej/akqwZQ5owqWuNJLoFU
	y67xFNJpsWvDV2WNcpW09TX2lU+B+kdu1XUrKaXwKBtde3hfdHdDwrX9KlJeNe2y1kd1a2qtYlOpJ
	FqD/iLLYSLPEvCBjieXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwgi-0000000Ax56-0SBX;
	Thu, 22 Aug 2024 01:32:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwWA-0000000AtGo-45sV;
	Thu, 22 Aug 2024 01:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F2F8CE0B61;
	Thu, 22 Aug 2024 01:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108E0C32781;
	Thu, 22 Aug 2024 01:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289696;
	bh=dtxeJFa9YuBd+oBMECBxmd/jn10TctjlQUazqWWROYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NkmOBJHKojz8DSwM6nYzZvbL6emtNKUeA7JkKQLB8uH5taYHO+I14fWAwDNwrTKB7
	 0T32RnpajPiK9jC/FzglUYmAX7r6zJ59RUqRXBuSXJOxiXwjDb/UhKmPt1EbV3ufOc
	 dABlspAytswhq3Yzqww+v8myDmkXdtcKm9zrxvD8OIuvPeFnFDZfB3cE4jYYHWU1MH
	 ABwSvvvgZs1w3wnnWqKyZr2EE4xwgT1y9mEuLK1fbheEle6qSyi79MUSXiYkZSLxsr
	 SMDNlWpcM1ouaNsCfzmPBC+6Ds78A3H+FewAEcvhF+RTUbpS8mk13nVcAVNHuCBOTm
	 zkNQ59HZYJQIw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:30 +0100
Subject: [PATCH v11 27/39] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-27-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dtxeJFa9YuBd+oBMECBxmd/jn10TctjlQUazqWWROYc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpE4HX3waWR6P/nVlIS4iaRLKyJcXdN5BJ4frnqU
 HySFidqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaROAAKCRAk1otyXVSH0EsBB/
 4ota43I49BjlXLJArTjty05r+82yt0hMdYO4E5E3AqVvSo6NYPm/EaH0sjMV4CXVYPSK7O8E5RULwI
 70ZaN0kEcZcK7zfvzjnAUtxbQzQHxSo7KjIdrxwbReqbfZPJ2pcPCSPV57KutXRs6RpslMVS5Z7BDw
 bbgqBqDLv/lywndPg1znx2CFWWtZt9YgogyB3inCURWJFCpBsXqacbrtLejVxu9M2ESDMz9qkZyjVC
 BKMU3Fnvs6t1nq3gwuX4cnK7QzcBudiUV3jP3Cyjh64/YAqArluaXS9tRZK51HZOWT1qS3x918virB
 wdZaz1Pctay537JnWPba0phAwyJKVB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_182139_396512_FE6B7CDA 
X-CRM114-Status: GOOD (  12.03  )
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

Provide a Kconfig option allowing the user to select if GCS support is
built into the kernel.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2f8ff354ca6..772f9ba99fe8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2137,6 +2137,26 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	help
+	  Guarded Control Stack (GCS) provides support for a separate
+	  stack with restricted access which contains only return
+	  addresses.  This can be used to harden against some attacks
+	  by comparing return address used by the program with what is
+	  stored in the GCS, and may also be used to efficiently obtain
+	  the call stack for applications such as profiling.
+
+	  The feature is detected at runtime, and will remain disabled
+	  if the system does not implement the feature.
+
+endmenu # "v9.4 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
