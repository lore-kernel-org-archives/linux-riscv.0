Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A8C61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VzWRxahN2MP6iIQwGSS+lSaiUC8MClZdUY5m92u0y0=; b=hKjuL5NOh8YE6X
	OAwAOcIQ8N17zUNSb2hn7Ed/kuYnG0lVQ3DkrhRM1e/fv0+ly5n+G/uzKjj+corus8vLTmie7Xwze
	w6jEmzrRnvNo3QGS/cpUNE9N/O9Kq7pKYX6bnyafUC8YbkOaM3Z7FB+uOYrm3z0Mm/ufnAOqTf+6s
	dQqrp3Fp2D7XEvudaemCYyKAvlyHgX4kJSWjqSEXXN60Id7kiHR/9LnoA8MU4aYk9RmY409m9oZxp
	Koiwp3qs4EUhxUl+50YQCv3p/GuOGyM9hOajbE5mobPDDdK06W2cNYgSBFvp9I1dwMB0TAm4cvTqb
	4IlmjgIJNrUAsON9UWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlC-001F4J-1q;
	Wed, 22 Nov 2023 09:43:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jl8-001F0y-1G;
	Wed, 22 Nov 2023 09:43:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8085CB8091E;
	Wed, 22 Nov 2023 09:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141ADC433C7;
	Wed, 22 Nov 2023 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646179;
	bh=LBKDiUG7NBwWsYEeStbCS35c5iJdRmlcOY1N9hBogGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q2GNnt1Vg0QJQRjesae4sFYhYpcYrw8xuFx8kU7s+OytKR4wzd1yCHi8+32jxqUC1
	 AWXRxXmwzXvoYtmicILUtYBc+WxAtCvvhpW99BVlem8s8EkD4oOaigl455Hy4ZYMx3
	 iZ58lbARbqthj3Fz/zCsx8LDPev0F8etIRFBxbkiJ/7XbkI11XtDhT+FZCdf/Y/fS8
	 JPsY05zr1HGkfkKAUW1l44mtjfkf1MS4IEFL6TYiUmj3frTdbz5owGw53mqr56wpEY
	 ia86O0YKKUQGxM+0JZoc3SjjbemxCBARirVY0+Wq88KNiqBT29fwGRPlkuuiA9heEW
	 AQSiIbLnkjP/Q==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:11 +0000
Subject: [PATCH v7 01/39] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-1-201c483bd775@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LBKDiUG7NBwWsYEeStbCS35c5iJdRmlcOY1N9hBogGM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXcz3ufb4BdT3G27Wye1QtqLYalH9gsoNYB6OX
 7EyWk64VmOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3M9wAKCRAk1otyXVSH
 0HxEB/9DTjmmFbNFvHu6r1ymZm8lbbHpqTlnIGPujl+4mFYJWSjhEaVe181wljq4nhtxPsm0u3a
 dtx7lvzR0Vo0RuGiNEprMGOGHjwlvyFifKfYoG4Hx4DMRzjmHYt9ADFh8JeBcEB7b6VU+8Q54LP
 choSLtIxGB9bEyLaaFCHrXHn4bsHJebYUBC4hxEk6shMvhPPnKS5YH4sDQVR8xrEqqwA/0e0Nzc
 5tg52h+rCta72nz4wUxtrmsCeWCqAeEWxTWayPeXLN4EyGQuAeIcLmLfXs+iQZGDJHimnFgJB+Q
 IZrJy/B0h5hSoxkO3lXClEw8RP6mm5v2VaonL/9R49GDeD3t
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014302_725751_F78327EF 
X-CRM114-Status: GOOD (  11.67  )
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
