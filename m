Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFE9E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKbGSXLy/76KlFHrIPK0uz1kbE6vufVjKVbgKLgZK5k=; b=hpVsnJNXcG9cc8
	qiyjM2OBS15z3jkYPhxzCfdhYsKWPVLdnvBiaNRw99A1CdNrB/kB66nh4gVeA/MXFiMA0eVUJuc3K
	mV1srll2a9+6jb5m+/8a55eFGX+1fu4XQlCt1815zDJrGmUrHhIt61l/5ElAa1gXe3ceyYpqXsJog
	K5qxFfiWCajytp3vbMXkgm7UYFrG/KN6gQDZa2FGWfSXlljq9XBRxSoCIPPrDySQb3PeugGbt+C2k
	yMLW0zcFYs/BP/wch85wdZFjqE9g1gZDHCRgL3jL4dkjurRv6tUbyCl/B69gewo+aHjH89kNo2A04
	lqNI5QscpCNZSzkarPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp62-00AZEA-1x;
	Mon, 09 Oct 2023 12:10:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp5y-00AZBo-0W;
	Mon, 09 Oct 2023 12:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89E0561077;
	Mon,  9 Oct 2023 12:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26B1C43395;
	Mon,  9 Oct 2023 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853445;
	bh=pFAvrTvTUMO0xGKH/cMXrv1R9nlyUOOKoHgSKri2XFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wvv+8fQiJLsDyPC0NnM1Q8ZyuLIaTwYxmV4/n6iYyTSFm2c3s/lXYiIujtfqegWR5
	 i+6r97yeEFEr4SuiSg43kWLmH09n7ZR/ZCXoWJasjIzJx+djDmQqsidBxXjLgKIpdW
	 USEzih2i0SA+mKWoVY+bWCbYYsuCJH+HUplm5UojKv0lL6UF4DGA5SDT+CacuA1WA4
	 oSm8tkPSZp0qife0Ths/W9nGm12sWcn2q+T/WK1q5JrOai/DPDX9Umpa7nqzfrVypG
	 J6NVP/nkQzGEuN9PqjtaHLmak3br43uZpGnq2WynrJw6MMDSVcTWuk4mRX6DuUaqiF
	 +7pCIfTCF7+SA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:35 +0100
Subject: [PATCH v6 01/38] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-1-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pFAvrTvTUMO0xGKH/cMXrv1R9nlyUOOKoHgSKri2XFo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2RRGngkj18F3uCpZZfRd1ocU0q8HRquWAvC/i8
 MLyCK6+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtkQAKCRAk1otyXVSH0IgWB/
 9nEEL548GJxcwR1LGdSjepOH5kHepxay1tzf82bn7l9zh6fQGxR6ix+aOPOcIC0mVUG3uBo/OqUafc
 JHsz6EEkKKkT+8LEz51beTFl4qVhh1Ow5Rk0OEWXlvnnu8ZQObqqFwMY0PNRfSmOtzpFrAOF+7cpg3
 Sj0Yycn8U5ODSu3bIWtjprRbW0HeaYkWpU1J/rMGOVpT+VVlXY/Tac108UyzCQmmIro7sCHuaLNBpW
 UxSMVsEAelZ5K94QPG020QQcQvtmVVBOG1zhZOUIWPgeZ9WuB8xrR237xwNy7kMbaxY9AWSb7Jaazz
 bt/kuflV6ao5nlq/P4VKE/AulNOgZm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051046_284130_D467094D 
X-CRM114-Status: GOOD (  12.06  )
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
