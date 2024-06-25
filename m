Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDB7C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFeluifzBZWrv10MIimjo0049veFh42MupCG/gyoJh0=; b=Gq8Ci4znIH2a7T
	AUwWul7YFHn3YGTZUKhhXWkOVDZT7ugUhLDWM/t2z+lBVEfo2qFvnd4EDLEWFA2TiTzJl4SwaRgNZ
	DWNw+4AiKmvHIPvsjpQ0XslrEAjMsusWWn1eL9Fv18vIRnxjhOUbZHPMDsv/Ji07sBvduhzalEA3K
	Sxi47mgDKakh/B15q0IUaE3Tq5PMgMBD2cVEgUiVPOevPBuUQK/hEOvJ2PpCo9diRBEtAj/CtuflA
	AEGGmJxwk5h2rNAEns5PsKe+LKMUTKToSbKDICNqh4VgiJATRsbNs4vzty3fRkn3HYwIC37HPll0N
	sQ4UjgMzbi2ksDMdhLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7n0-00000003PJp-46Kr;
	Tue, 25 Jun 2024 15:08:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7i1-00000003LZX-1gGS;
	Tue, 25 Jun 2024 15:03:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76A6ECE1B7C;
	Tue, 25 Jun 2024 15:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6C7C4AF0A;
	Tue, 25 Jun 2024 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327826;
	bh=fjC2QiGsrbMcCkXrGFM5RiSenF/23moS6IQnQJ7tLdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l2xsFbIETEPKGbR69SWsfYufg6rpbRn4aaptp5DtVcbSm+gRqRmpD2995e2y8WGim
	 eCRcbHiIQJ9pqY5hWpsMfCcDmmgdUqN5aJjCIFdPU70s2FqZgkpUwl0vGFg4JvUhqM
	 4R47oEbqzTI/WIzPgeKJ8EyaVVlcSIGP6vCKjtr9UfEomWTHc7ivJggF+Wsk89OTlh
	 wFjrot6UoGGCjUc+BQcPE4Hcrd/4lr2FjzLykKDT4Ars+AhqTtk0YUxWBXmBDuNa20
	 LK4zLQdD2O4gn8+MU+yZ3cskmZeebN965PyinB6Im0jRSXCXTS6IHMl5u/aRBwe8kH
	 3kXJHBn/ECzmQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:54 +0100
Subject: [PATCH v9 26/39] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-26-0f634469b8f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fjC2QiGsrbMcCkXrGFM5RiSenF/23moS6IQnQJ7tLdI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmetuGg1xlcnXPlN04dXEBbnUnfgQS+G3jS350+dWn
 /izc6wKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbhgAKCRAk1otyXVSH0KfjB/
 9KWonE6xeKtgOTtQX2JO7awYH9lQ6LkvpJLYKruT/tw3b5S8asSEMPcfTcPyEneVXId/HNouOKa9RN
 wGGAWeR7McyjYD95XpmwDqTx4zPmmme9t2V0A6LxKTGf8/Zw3LuK9L9WP/4FiItiDYbKXFHHbR1MmS
 YrBnyYjZm0vjLZMMdI2vobtYQ2xicVgK00Qyr/80i1MP6FhmpFoNNYpYplfFJ9JcDJTl6SKx0ZVoTu
 +skJQfsafa6R60XpkYGtVyB3Och3vSkyNhNc/dLNxh/JH/oW7Sp0pYRTESkaxSdnQLoMFTzY5D5H+a
 7eWD6b20Ne30nkS0CHcIRuEvSi2DB8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080349_946736_E4305A6E 
X-CRM114-Status: GOOD (  11.99  )
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
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5d91259ee7b5..248697a29d78 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2140,6 +2140,26 @@ config ARM64_EPAN
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
