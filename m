Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA24CF3189
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfECoMbgPLBhg35lrY//MtFU2Mo4n3BGRYe1qfVui6U=; b=fknzsSXcwL9v/p
	wfyRbcKHJIk392RfenLjw3+BTc3KjMC+P4DXnThfbVK2XBD3V0Cdl/Ex1kd7zxZ+yAAjuiDmi8StE
	SMgQhmueIOMYDUP73X9aNe1Yc/CUuDrX4vovDZamnONhwV3Sh+L8iNBBtUAcLwjEeq3hc2QH3vz30
	ZBr7RuaOKKI5Xs5TnyonRpA872CfS5mLpQl5AehQdLTYxQldB+OjAEuaWx8uFfq5uaqpbmVD9hNCi
	R4mzKnAGVtedh6VLg9eCF2p4q3Yq9wyAdd0KO8vdJpgivDmdn+Xsdm8SpARzG1o6zqN1z62V1VIIj
	TKQ0hM3MTbE0nMK3zTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svlwx-00000004Ifk-0GbL;
	Tue, 01 Oct 2024 23:06:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlrJ-00000004GDD-3RKh;
	Tue, 01 Oct 2024 23:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=t9JhsxwzGO3El7z9ZOgaTR+4+wFgEhQCbca7NK97jpc=; b=TII6NYM2LXD1GxYBrjclyBMrQ7
	Hw07x7ZW9KdzLQtr4hh+xyKbtuwGKiQmLxUaZpxRQCsws0uF1vDj6jkXIOi4usDNUN0wxrfONqMKX
	SB6+q85pxj9rfskZqKT/phTuHeYG9VTNsbuD0GisyjBOaUEe0D+FL4rY2LlQgMPY0LdzCKZbOEfz7
	PjFERLf2qFbpwHGdx8JOgWg+0OsVWsOOiokyZ72YiGXoSf7BH5Nrp5GqmEeb7G8S58NjOb7iGhoLK
	X+xQEQzgEGun3m/AQBO9Vzjvj0xPv3WMHF8It8aNvnyTGCiqET0+T8jEne2syYROlNwgHAizPVv9b
	XYGTPHvg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlr9-00000003KjP-0ghH;
	Tue, 01 Oct 2024 23:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D9185C555E;
	Tue,  1 Oct 2024 23:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3DCC4CEC6;
	Tue,  1 Oct 2024 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823631;
	bh=is0r9uSxnBrJsURPndZS8euUNnh9hat0c9erNc615eY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OzU3C8wBK2OXHIrGHnNZpdo/rQ6MSb1jHODyDJAoNGG9AyZNy5xOhOnImbc9d60wE
	 qSXmDByXxXOp7Ghp9V8hGG6xCGWGNhmsxXa6baFwojfTnq9JMUn7NQgzr7ymCVQr9M
	 xQzltE3MEY3qlx7wv2dUGT9EHgsMa2EePeQK3qEgp//bYFWGY2XK9BHxnCXxy14lsW
	 y6hOpdEVVsRQOy2lqROKkzEl3teZgHd64wyHyPEWP29kxwJ3TVQ7xEfvLf+sSEt1u3
	 0tpfKhhLduhLswCXEr93fOz97JzdTpXZH9WZYuRAlc/qi7p3danUp/VqXou6eelRs8
	 /UTfMxcLCXHGA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:42 +0100
Subject: [PATCH v13 03/40] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-3-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=is0r9uSxnBrJsURPndZS8euUNnh9hat0c9erNc615eY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7GKNZdsoQOiuGpwbETH3V3HnhsUT9brBj4a8sc
 0mwQI0yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+xgAKCRAk1otyXVSH0OpuB/
 9pWeD6rdk7JLYO1MPcZh358jd/19/BInjhws/y8H6gPcPEhXrqV3svABMXzkhapPykA0FPynYWJ3Bt
 CVWT6h4z/az2texWxSamLzYf+NpFxo0KTA6Xs3FbEQNSLhX6NVP5ShtTxUTRPPqC8WQDiw2//sVF1q
 A/RTUy4F7OXGB7G2mAcnlkzpyemeS4Jdu5U3o6EafIil48jzkrO3jeu/jQIfS8xwQf5UOFkbK7CXEY
 QU452e6zmm0e9iAjhYcZALFD7pZ3ZjVBk0ZI4cEGACD5cU1doG8qkctAhdvnI0j0Tz4DLaIJl5HJWh
 sJYxu/Wz7X4HBFgP9tyB+yg3XUAKpC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_000035_769726_B5C4F52B 
X-CRM114-Status: GOOD (  11.89  )
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
index 9e39217b4afb..03b790fd0ad8 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -62,11 +62,17 @@ static inline bool arch_validate_prot(unsigned long prot,
 
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
