Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B2BC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xzvz1HUJzn1AiXcrCfarUpWFoc1aLU1DbF8F8fADsmw=; b=YIY0cSrbK0i/3y
	AiJxE6rOKVtcyseo80q6qJ4kf4ASBT3ij/bfKGZlAprXQD4qonRES/3/UbpBGh930JCQzJ5+b3GDC
	vGbYLYep/supRqla/Q7K4wE53aPhyV46fAvNh8KjTJ4F/uTvd8W16Ldc6Nm1HsGkz3Hw6IZfW9YxL
	vGkU69+SRjYU0LbkDroVDxIG5X992GBLjff0Vw//IGjl/QSyQaOu2QIvEWR6eCKMj0gbHGvprQJmO
	psL3Xkf/kJPmdI0XRih1AaVupXwa3DjCjxri79+XA9Khlz5WvZbLxdN34WqmO3DYKo9t4sj1egNX9
	YlLxzi2QfSPDdVTRt3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwT5-0000000Arl4-2zy5;
	Thu, 22 Aug 2024 01:18:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwR9-0000000Aqqr-1r4L;
	Thu, 22 Aug 2024 01:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCCC9A420EB;
	Thu, 22 Aug 2024 01:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666C9C4AF1A;
	Thu, 22 Aug 2024 01:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289386;
	bh=pHfZEKDzLLM4lr4zoXfluscujJ3LYl3h2pXq/J8hLlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ueVLaK2MsY/szyYEntQjZLCLmSRxuLrl1Gi44VBoYEOUxf+EFs125s4/3ol3QDM9z
	 X0uq0oLUomlTmF4IeqLnycgtWjo8hG4RUpi38YDJ2yN9GCnAIzczWfCfqV8UqCLsa4
	 LgV/BxdLzAWfYKAQhJnFfDy6vMkl3H4e1XZvscIMergMM2DXlg7qUST8B7BSL15Dy/
	 ACGCdswfAW7EXeh1gwRuId8MWV/S0yfaUQY40OVIY2GeKOKZzgB7uRR9DruoAnxB70
	 9FP0XaInJ4IhHow7mgbNG98DzxHE7VWqcv76qbyxlEY8qorNgt8+kQF6tVXk1MJMl+
	 8/GTtxPOV2fUA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:05 +0100
Subject: [PATCH v11 02/39] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-2-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pHfZEKDzLLM4lr4zoXfluscujJ3LYl3h2pXq/J8hLlM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEl9voS9PP73u8VNnhsmW4oYvOczA8/d2TEsErN
 Njv4/K2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRJQAKCRAk1otyXVSH0A4CB/
 9MXo13GBv5ic9iHD9QnaDlTvnWnODh6Vu3DTv6ZsajAlY/vDbpNjNksJ7N1/t8aGXvs4uy5ICkLVG8
 ixe/6vrw8GsFJ/VPkcB0maOlg61u65806KML6g1ycIYyHfVIcoLsGmQl2I3qPvDMqQqQgYi3OEaPJg
 r00Rl8ZYS8awDvmVP8whjypeAEPDSHoumixJLsW80rL1XqMP5IupEhOudxgROA7nkEslitEzwyBzxQ
 iiZ4Ha+a1V0f9GGhGDZH+hu/Rmn4kPGXRm3HE6dZxLZpxa9ZAgggCvVPjYL6cKjTqwdjSUt/VRNZF8
 wquclYiWd2K+Ek6E4LF24vGnbVv5DR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181627_650323_85730E40 
X-CRM114-Status: GOOD (  11.96  )
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

Currently arch_validate_flags() is written in a very non-extensible
fashion, returning immediately if MTE is not supported and writing the MTE
check as a direct return. Since we will want to add more checks for GCS
refactor the existing code to be more extensible, no functional change
intended.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/mman.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index 5966ee4a6154..c21849ffdd88 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -52,11 +52,17 @@ static inline bool arch_validate_prot(unsigned long prot,
 
 static inline bool arch_validate_flags(unsigned long vm_flags)
 {
-	if (!system_supports_mte())
-		return true;
+	if (system_supports_mte()) {
+		/*
+		 * only allow VM_MTE if VM_MTE_ALLOWED has been set
+		 * previously
+		 */
+		if ((vm_flags & VM_MTE) && !(vm_flags & VM_MTE_ALLOWED))
+			return false;
+	}
+
+	return true;
 
-	/* only allow VM_MTE if VM_MTE_ALLOWED has been set previously */
-	return !(vm_flags & VM_MTE) || (vm_flags & VM_MTE_ALLOWED);
 }
 #define arch_validate_flags(vm_flags) arch_validate_flags(vm_flags)
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
