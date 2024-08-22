Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A373AC531DC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 02:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFGJGAUMXWsvjLOirUhvygBpG6hKjcMp8PfhoXR9aME=; b=UDmENAMCaXbnOL
	Bc2sfbdyB7Zj7ccRT6FqKPT/+V3f17S5myzLsiJJCp91FpiUlHKq+8IVteSoWWkWL5z9okbb/w3Xb
	F9prTSuIohP21xiH4/Vyiuo3PklV+m+Dxq7N9VZJx93DL2RkBCTMxhrP/kQ7utlB8WpjtLyP4B1Uw
	TvmM4OwZrHGz8XGkMBnWjjZoHRLb9jMikmapCF5d8D8nuUJsCST8YB6scPkB7o7o5DYzXTLoOur0f
	wvCivMHbDCl/5mnoiWzr2z6OEIqWR+2lfANCLn7ZBC5O85ReFOmH1iVL9GH1lVnHqzmcPeciVxNiv
	/icdHLaVmnL3TNU84knw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgxb9-0000000B4GA-1Dmp;
	Thu, 22 Aug 2024 02:30:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwSA-0000000ArGJ-3mgf;
	Thu, 22 Aug 2024 01:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2DF35CE0F74;
	Thu, 22 Aug 2024 01:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE1BC4AF11;
	Thu, 22 Aug 2024 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289448;
	bh=4p/cwsbgBUzYKsL2fclAIfpUU9Y3uPXu2QlRekLj7SY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Unzw3jsNxdyyDEtIGbgFULuy333hOmD17NR3Hlokt62VSxENq+2yxdZcbSM0fnaVK
	 9D49lCPGa60j2YjpT8mZVjITIhthQPvvWA4uxeGd0ZfKivgnTcqgIHUizAV5vaz9fY
	 S23Xq1r4g6nE9i85Sa53p3eO8CrJUZUmOIYRbmOvGz/FBlat9dEV8Aj268VpkG4bc2
	 IsbGQ0B/0ScJtw7j4AFaJYbMPoZx553y+cjg1nI5UmUQIyjUl+2kuhtmSRJ5uYhvii
	 cNbCtaEcTs7TGjlAl4oyd4aOpSZ7I/6ySmHepzqGG0NVEyuss6FivB8NbQ0GXx67mz
	 Cz4Eh6c3AKXFA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:10 +0100
Subject: [PATCH v11 07/39] arm64/sysreg: Add definitions for architected
 GCS caps
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-7-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4p/cwsbgBUzYKsL2fclAIfpUU9Y3uPXu2QlRekLj7SY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEp3emzJFbijnCU17Q0K9SIOz60aIHS82sSFhQJ
 YD5SleyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRKQAKCRAk1otyXVSH0BnGB/
 9yAjOiAcje9naSPYMdZSES4nE6scTZSW+Adx1kpr9GXDoxaUVDWJr5DM/MLlhrRIxspzoUi27T9kZa
 VwHLkMBdQ60+0C28WkSrAZiu0hPIurM42vvhSFQmXMALp8l6QlFf3i1TYHPgRbmp8XXI2zyIGZ/6Hq
 9Dflnmsq8ebMHLxHmhTAm/IGOTdWrCW2GRpbuT32XqSNUmzmYfvkyTP5AZN6CQB4x3j2bpMryCwoxp
 GaMuj7yW8RNmMCOxFYbAr7jwBBR1EVjf8c4mkUNMW5APa/8uluyBzGdvqOmL2F/WxvmF7q///zZP+6
 e9qpNTuA76OMXiaJ2DqWoMg/6A1iHk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181731_325268_4BA99D1A 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

The architecture defines a format for guarded control stack caps, used
to mark the top of an unused GCS in order to limit the potential for
exploitation via stack switching. Add definitions associated with these.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 4a9ea103817e..b8d8718a7b8b 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1077,6 +1077,26 @@
 #define POE_RXW		UL(0x7)
 #define POE_MASK	UL(0xf)
 
+/*
+ * Definitions for Guarded Control Stack
+ */
+
+#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
+#define GCS_CAP_ADDR_SHIFT		12
+#define GCS_CAP_ADDR_WIDTH		52
+#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)
+
+#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
+#define GCS_CAP_TOKEN_SHIFT		0
+#define GCS_CAP_TOKEN_WIDTH		12
+#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)
+
+#define GCS_CAP_VALID_TOKEN		0x1
+#define GCS_CAP_IN_PROGRESS_TOKEN	0x5
+
+#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
+					       GCS_CAP_VALID_TOKEN)
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 /* Defined for compatibility only, do not add new users. */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
