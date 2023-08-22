Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3D8EE49A3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DieKd0OyHNtPk5DXq3yE43DTH3sO2lKL+EwiDgP2F68=; b=BGztLZDkJhBiFL
	oy4GihdNgcL+cL34qO6GmSTRKiCnwEf1Ah6/6MZZP5prdQSJPxTwXIpShV3crd52vJYBVa5U+cGvu
	ThWBRPT4x1W+Ca1rGZr9FkvbQpXrSCC2uoR+Pt/GiivA6CnlYH0mB4BNRszV6RuZycvXbkteB/e3U
	4Qt5niFqxzN/NPT7wFLXRRMPU/+YhwU9y/+JyrAis5BLK0malW+q6y+jFmtfl7IStu9frJVtM7aJs
	Wrb9U5aak56AuIAIHXXbWcU6tFp5maxa5Up1S0oU4p//yiwlGw5Yx6Qx6RHa0e18K3ZvIYlwtSUic
	UUZKSe9147PNrV4uSt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYT6N-00GLd9-0W;
	Tue, 22 Aug 2023 15:15:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYS0w-00G8K9-2Q;
	Tue, 22 Aug 2023 14:05:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0A1765443;
	Tue, 22 Aug 2023 14:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EEFC433CD;
	Tue, 22 Aug 2023 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692713145;
	bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dIUxNRrQkD1AC9FBGH+9l0U9ZvUnTLslHNuzmoBYliSNiMjoHbh5dJU/cPaxEgnvQ
	 fMyAmRdE1xxwHRmv2U0FDuaP0YabymuRE8p0HIUJdDHdd18evke32ASlni9odJAKqm
	 kJOGYpk59tFXT22PC74wYB0KIJoWfCpeiU5hhDWUB9vH/IwGogNDkAhhlDJaR2e373
	 LaFNUIb/I4uzxYcTrr/taSDf1/Nn2KftPmQOmW8Q1wQ8E6JrC7klyzXff58QuUzCTL
	 c3dqlJL3znAzBR6J4dn2qXFtJNYquax4v2ho5W2IWp4/tesIKEI19VWSJXP5CLEOMF
	 0fTJUjT2+MvZA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Aug 2023 14:56:59 +0100
Subject: [PATCH v5 26/37] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20230822-arm64-gcs-v5-26-9ef181dd6324@kernel.org>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
In-Reply-To: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk5MAEgUhGnrifDQTFSNQG5IJMFO4vUClMyRD9oH4B
 Sm9h0T+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZOTABAAKCRAk1otyXVSH0JoWB/
 4ztlxfSdMS7IVWSbChfjGpFHRePzfGZHEaisYlp3k0kgZx8bcwjiV3o02hzm5zftIak8w79jWQSmd3
 aN3YkxU5jhpqq63aESrUMuKSdYOeIUwRDsu+s8slntzbARzAKK5Efjuzees8q/RKdd91jRnEOBAxgD
 HUsvaCGLSybMULc1imROdMfNWAef8n0HAHB6WQCtfcoBe7Pmv6V2eFz++vPOyyYRthGKShLfjHO9CF
 joqJBr0GX+lqZ//ckS4sVPKa8Aop/jc6SHwCaKJ1UCZx+6yMg1Q1o1EuCa3Mad1di9PSbfEMe6d6Qf
 5Zt2G62F0VAglOrKBiG+LBDf7/bObx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_070546_918789_0D7535AD 
X-CRM114-Status: GOOD (  13.10  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2511b30d0f6..b5ef1a698770 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2093,6 +2093,25 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
