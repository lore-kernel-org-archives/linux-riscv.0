Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C7DC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4rZW7RbVGOf25OUXkAMklC8/8r+SmP2I8lagzlWCPc=; b=bjeYYsvxyUw+U0
	t99ucX4FZAikynUyGAOf0hnvDWQHK932oc9Vn3p5PDVQ4F3nIaAbBJbiW9RoKGs50UWRvoJ3RbhlY
	vi6PCwVy3mdEcopfq82Ie/hq941sDHUE2qdgdOxGGYeMgKGkghLKqITMfaYLPLlyIfjTkhvYz0Pk2
	iDNF2j5Fg7OaKrzjKWqKNt69iCqH3ycjWQfFDVuNyZXoTJFFfLMcnTpPLkE8foiGo90ZO6Y+hMiwk
	3xvYWpNMgpzNJhLhb/LhCZJ2wBB1v90eqYPNBNLyZ6Oln4ZeXTjBfuy0ndP8bk5AUafKqm6SocvbE
	Hkk3AqSz+rHE2BFpZygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuzw-004IUQ-09;
	Mon, 24 Jul 2023 12:49:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuzG-004Hws-2e;
	Mon, 24 Jul 2023 12:48:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 485DA61150;
	Mon, 24 Jul 2023 12:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCD3C43391;
	Mon, 24 Jul 2023 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202910;
	bh=AFWazg68H0m9wjDZ4noTEGRptXvqnY78FqkUfPNC3A0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=giuhfGtTPG0MOomEevxhotfg8wlauxtR9gyPrLU6e5/NzOyb6ForplAHWdYl00/he
	 CKr1enrMhwHVwHWi3HU/hR7mGrP8NBfok1v2sHJUkNSZ5IIi5ldwdN5hNA6+sxiisM
	 6R4APr5a8OOQWu1UtHSHhvrsGsniifPUxi5pp87nFJcwpcNZy3x2QUnF3N8+Kxlb4s
	 cd+P3dtimdv2l8gNyyRDzx4oM4ucz8Smd2ReEoNR0R5noGN1u6vJBQPgnQ4g0p6Ra8
	 UEYJU4OBnzWP2QzPerL279F3hl2Yt0OXLv89s/ymkHvOA9UtDGCN9bNeC3Gg8p+zMM
	 xBBItdsS3mLJA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:46:01 +0100
Subject: [PATCH v2 14/35] arm64/idreg: Add overrride for GCS
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-14-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
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
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AFWazg68H0m9wjDZ4noTEGRptXvqnY78FqkUfPNC3A0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKU81Pk2edCICz2OW5guwGvRbaa0LykvA7B57zE
 9f8cZ1WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5ylAAKCRAk1otyXVSH0DpMB/
 44QJS1fhFSBn6QCa10Pi5llBAjbCj5l+DxLBybjlXmZIVF9/Xxvlp/lvRw861TcivaJG9o7rw2HKuO
 T1W3aOoMeDss1ZfzbGMq1uKQCDI3IwhlgYpv+wvLH9Zf7NEZGTh5dHwnaUD86hiaD15PGLj92be/1r
 UxlK6RgWcTn3W1ESGqWcuffQFfcSL9nGqb5BTJJtN5CWoI1b188aMmZ5gSZJxOt9ZmQYSptKCzS8K5
 /DxdxR47IhqcL96zOjX2ST3lAQK6b2UWBZXulZlYoEFJRdwRlnsOpIVbdt4RZWzQtcMAj1CC0VGXEz
 33J0SQWPhy4JgPLaLHttjqP/Enp8qw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054830_950075_653EEB04 
X-CRM114-Status: GOOD (  12.14  )
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
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/idreg-override.c              | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1457995fd41..86662eed3003 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -418,6 +418,9 @@
 	arm64.nobti	[ARM64] Unconditionally disable Branch Target
 			Identification support
 
+	arm64.nogcs	[ARM64] Unconditionally disable Guarded Control Stack
+			support
+
 	arm64.nopauth	[ARM64] Unconditionally disable Pointer Authentication
 			support
 
diff --git a/arch/arm64/kernel/idreg-override.c b/arch/arm64/kernel/idreg-override.c
index 2fe2491b692c..49269a5cff10 100644
--- a/arch/arm64/kernel/idreg-override.c
+++ b/arch/arm64/kernel/idreg-override.c
@@ -99,6 +99,7 @@ static const struct ftr_set_desc pfr1 __initconst = {
 	.override	= &id_aa64pfr1_override,
 	.fields		= {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
+		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		{}
@@ -178,6 +179,7 @@ static const struct {
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
