Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B671C52D54
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hK9y7YnuQ0K2A7gfZ46J3WAPpChWHojvPBGoYcIkztc=; b=S+8+4IyYIgtLzd
	PjNpu0gb/u01dtcojsp56u5hdpNmC5/njxonsRYZbfln9JNdCMr0pxX7rLOQwh+Okp+ppMwh8Fp6E
	6FxxLrv2KgLGtznDVWNnXDB0mXhsMpXpY5ooZ7w4275tQoTm4u2HfNBk6ysFV29GNSyVyfwTinGvt
	nBXaeJjDwv2VNOnRmBIL31o2iKdqwefqxrThc3m4Hy+sSvV6BkM0uQabmOygJf489bZXKckg2WYbW
	wDODNA9g56MNfg3suQrJ5V6WssyhD8XbZk4kGPiFTojAm/JMdCaLQgGcHGa51VWnrQToLvcRWFMU2
	kwysd30hS5+bzSfgBKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVO6-00000005IN7-2JMs;
	Thu, 01 Aug 2024 12:58:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVN1-00000005Hi7-24n3;
	Thu, 01 Aug 2024 12:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A87916285D;
	Thu,  1 Aug 2024 12:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0C0C4AF09;
	Thu,  1 Aug 2024 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517046;
	bh=bsiMqAlOgEwP0cbRhsqWxUT30GAWtj7CcR/m2yEY+EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BZbXzFPNzPvbVSEL1HQGb9vwgWBSp98cTAPSVjgtfvJw92HXoTlzukkF3KirLERxc
	 bqNPNcakZeZ/4Csghs6sC/XpdJCwoczXybGu7jfJiioe7ljfYE4qxdv6Q0hGT5BMXt
	 eIqPOfLqmTZwbfvoVmaVqmAFunVsB0EF3q98WvvHeu9kip39NlikjgyNpwevVVHoeq
	 H5Ci97Hqtb2MoP/46USTpEYDzAs4bjD5CG6Opz6g2V+D7Ss3x4ldV4Do03mZti3btS
	 r8pN2FEjEAryz6qhJyFeD7V9FRQ7eboOa9BOTKFurPui97bxufWmSq7NQ2pj0rkkLZ
	 vS/O9RPKAAgmg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:28 +0100
Subject: [PATCH v10 01/40] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-1-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bsiMqAlOgEwP0cbRhsqWxUT30GAWtj7CcR/m2yEY+EM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YGqNne7baHl23QOwDNZcKGE/jpNiGj7M5xDaR7
 lIob1RyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGBgAKCRAk1otyXVSH0P6kB/
 wIOf1cMolmdce2aUsq0S+hmD8dGJDuLlSKxaFli9jY4UBL8wsQJFyiNa/OYFI8nDKrC5byoMT1dO0M
 TqsVdiKMI+P8FfRaguIINosdMj2HarIZXN1a5vv2E26G44gzwk+9wjKUMgc26wRPvP+R9Oa9FgWaKM
 jR+dEdnMkFQja9XnvYvrIpSN7VCp0GZ9n3Hf5G+tMTC/pVQibgBVYGV6j38kDUitFDpMiYJvHjFRpw
 vWH8ACdZCETPX9eigVl2ElUysqkSWWtpY+fLh856UWEVGsXYY0P/Aqm5NoC5EBRo9DP9EU2Qxcpjo5
 j0naxVNyc9NsDOrN3vlTlgohZmbE/F
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055727_860539_F4674277 
X-CRM114-Status: GOOD (  12.31  )
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
