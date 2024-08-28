Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BA0C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xzvz1HUJzn1AiXcrCfarUpWFoc1aLU1DbF8F8fADsmw=; b=HGTuQ3v+KBtErs
	p7vuOyCakHyVDACuHeeChlHrSqDtfaRSv6ySBeXWGgE0OB4f2eG2JB+aEZasVjOaQZKrLr5BSyVqg
	+94hABv72m69ZuZ4U501PVfpkTcLP9cm31wrW2KlUDx8FbDojby9j1fNd0N0d06YELWCz8zUuJss0
	wf903WXez3egxc9Y+kmiUW49WDph68i0+ycflaBU2wZ3WD0Vv/rEK6j7ooHRaioP/flxrGAEJzUWu
	YiTh/Zd+vcpkLFlFPua2PcI4t8tpB7zfWq35utO+HFTcZExJvMlJf3PjwdpMChiJQQkzdh2IbjiKX
	dvHCvmSanLbD5HKUvV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS8T-0000000HN32-1p4e;
	Wed, 28 Aug 2024 23:31:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS5n-0000000HLWk-3sqd;
	Wed, 28 Aug 2024 23:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F30DBA4376F;
	Wed, 28 Aug 2024 23:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCED0C4CEC0;
	Wed, 28 Aug 2024 23:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887726;
	bh=pHfZEKDzLLM4lr4zoXfluscujJ3LYl3h2pXq/J8hLlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rq++GcKRSvjv+PpuihZSyX+jI22rkXN+ahaJ3t3y5r8tOhGSsG32bALwOyi6zYXN+
	 eVkgXBG41Uv68iVxp4/e7dy2O7x7R9RL6V+bdhoGuS7S8B+ghf22V7W/Ls/kWbdLBo
	 7Is1GwWxO6TaQP0Tj7x6lsCbVCGUfXijCHMn6tEsRacuyEEVSbx2WXVHBZ96pD53Hf
	 pmT3dpjzta4JENEwzaXB5sa+L7S1NKJnQCHIsWXQspmurerFzOEyKIifOvm+NSlcfW
	 TzFOCynF53a2oPN11SQE0FwHZZfiWDjTdsJtv/mxFkMVO9x8PjMxmTb8sZsdxPuGhG
	 +pVfHFtUnOF6w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:18 +0100
Subject: [PATCH v12 02/39] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-2-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7J6RoofHrvZefS5vfHSrIx3ilH92it2YpD+C2sU
 TzTMMvuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yegAKCRAk1otyXVSH0OzJB/
 9Gab3WMv/piiW9sI/VMmkzs26eYy2nciOZlr+bDnZbXBO3RS2k7ZKTA3UXP8pw+WP6f3OTrK2JMpfg
 ycY7eHztFNrujRTDsA1Fbnp4LEYMTUqMdaDxVz54T1PND+NB3VCmbCLle67gDrxjBhI0d/2ZdiBMlQ
 WlCVUNCOU4/GRZkhQPjvJpMhnxtqZ868DYBfql4xwV4z+fedBMTIIwQLcAO/sLgPIoTYb+If2GbG+R
 SnPQARoQRW3QsGmVzONtxPqheal1fPNH30HxTnD56qvbXOnHngyg3z0/KOYD9Zh06RHyr1ixJg8tZT
 ++7YZqvjMHAD6oGk6OoVaK0+39aOZh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_162848_240455_48F1E9B7 
X-CRM114-Status: GOOD (  12.02  )
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
