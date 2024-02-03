Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E75C48295
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUiBZLQTI28S04mcgWBgmvgWzeV6Cyucryz4qIrKUSs=; b=nXqCPp+/TLB4mu
	Q7RLccvyBbe+uO45lKH+Rw9MZ78g3TkbYZ3BBj+kuNxCvm9gZDTu7fk409pEN5qvqwp8nEqQ+NDK+
	ES8uNGFc4NQ/7SggcHe7g/TqbSqVeZcYuWs22KCiSZQQUJHn0TF1XRsRtVrhscHE22Gv2VBKEu1+l
	W3oiLvdaE3uqgCy2YRc3n6yAksXFyyk+hKukynB2L7eYUL0oD/HDL9wRThzpSIv0GzS1X368LnPoq
	LIWXkkbZfeAk4YAvVyO21dFGvpU+kG/uJHlJShDApWpBWdtvYTbnAZiXoQZUaClPTKY/dxNfqWJlY
	9H5ru4S5dKktMdXK1NXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFBM-0000000GJUs-3H0Y;
	Sat, 03 Feb 2024 12:31:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFB5-0000000GJEv-3CCY;
	Sat, 03 Feb 2024 12:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC82D60959;
	Sat,  3 Feb 2024 12:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76763C43390;
	Sat,  3 Feb 2024 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963482;
	bh=SOryHjVIlgZ1JzHo1eglrB3GwKsbU4uOkVzAaVwK36o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LBzqHFbZSf4IojU2mYT5PdaKo3RqZ98lYCkCpHUmMGBQDlnrFqzgAhvm4yy4Osh/Z
	 2w/dLtyyR32j82cfU949TKIjVFY1mh3yO/UlyinHvXR9RRq/Dh/Yu+XcdUm6xEyULV
	 nllxHfO8Qun8oyPC60Q9rsJxl3U2/bYfqvpxHw6BCY8xTnFq4xbK5LAwuvogYh4yGk
	 au6CEmtQnhy/hpMlH6HjeylGql3e8pc9Ykdofk51Qi4ErIfq34VjGKV2TS270WI7d8
	 seMs+Q+/7N8R3iBTtgfjWVQqWMUhe3lRcMt3vbptXdF8k2l2aLntzUhJZbp7P1SYna
	 vu3XsnNmYM4cw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:41 +0000
Subject: [PATCH v8 15/38] arm64/idreg: Add overrride for GCS
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-15-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
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
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SOryHjVIlgZ1JzHo1eglrB3GwKsbU4uOkVzAaVwK36o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDclBuniik/q4u/ervUzd+okMuWp5AjhSh39Lb9
 9Xsh3cmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w3AAKCRAk1otyXVSH0F5OB/
 4uqaKGanf69ot/yRkqmGZUZo+A1IPA+Hp6Hzc0E9LVUH+wkMK3HYompmNM4Gv59SoAyj0VHtXefAxY
 l2iQ/eNIjwYSbUBBMqUWCm95kwlHsnTjYGNRmOLBda027Hz3zGNo3cmmISaIWI+GCt4oCRUEX/0E/n
 TXPNIEy5QwDu+ZJxJ/22TMNVaWHl5P+fzxzp/BA00Gd3gWgLa2KlkNOihJ2gRLwsQMybU/O17hTzqL
 r0eLU4D++pmUwwqO+75ravav8mrgjy5ZQlEPZtpl7ym5vzIdSFxOOq+NlrU5H0uNRv95hz4w7R4hDP
 3zt3co1Euu5EtzjSu+2Ham+nO8Av6o
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043124_381193_88713DBB 
X-CRM114-Status: UNSURE (   9.70  )
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

Hook up an override for GCS, allowing it to be disabled from the command
line by specifying arm64.nogcs in case there are problems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ++++++
 arch/arm64/kernel/idreg-override.c              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 31b3a25680d0..e86160251d23 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -429,9 +429,15 @@
 	arm64.nobti	[ARM64] Unconditionally disable Branch Target
 			Identification support
 
+	arm64.nogcs	[ARM64] Unconditionally disable Guarded Control Stack
+			support
+
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
+	arm64.nopauth	[ARM64] Unconditionally disable Pointer Authentication
+			support
+
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
 
diff --git a/arch/arm64/kernel/idreg-override.c b/arch/arm64/kernel/idreg-override.c
index e30fd9e32ef3..00bcdad53ba9 100644
--- a/arch/arm64/kernel/idreg-override.c
+++ b/arch/arm64/kernel/idreg-override.c
@@ -110,6 +110,7 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 	.override	= &id_aa64pfr1_override,
 	.fields		= {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
+		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		{}
@@ -190,6 +191,7 @@ static const struct {
 	{ "arm64.nosve",		"id_aa64pfr0.sve=0" },
 	{ "arm64.nosme",		"id_aa64pfr1.sme=0" },
 	{ "arm64.nobti",		"id_aa64pfr1.bt=0" },
+	{ "arm64.nogcs",		"id_aa64pfr1.gcs=0" },
 	{ "arm64.nopauth",
 	  "id_aa64isar1.gpi=0 id_aa64isar1.gpa=0 "
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0 "

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
