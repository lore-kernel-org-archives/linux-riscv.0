Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5362BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlNvuvsc+XT3mmynlLjHZsmKvGOIiBgqgyhZJcTChsE=; b=kZSFZE/HZ6s1Yy
	PtehU/ez7n2tEBKkw+gpLd7i+CmXjMH2C8/R+HVTWHwNQTV73Ptkd4eIWysq6sRengCPeJHpsboHP
	CchGlaPk17gOyXYce4ZQasws391L5M9/p9dFxmKV2rBZ+O8jjFt1nNHms2ZqjZh6/fJNAcigeXYJD
	D6XF7vHkMymJ2FFWsE8Ow/TQ1Z4Yei+s9GW8BIDyNZjaiqiMFu0pEKujZuv9A02WJ3a4rznJLQ1tw
	njOagNZb/gDTbPmZnFaPxV8j1BnpvT4gen8jHOaCGW84zGCOEGqHT+yf62XScisdTo9ozEuyXG8jW
	MYr8HuBkT+n4PBwvKwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVW0-00000005NJC-3XSd;
	Thu, 01 Aug 2024 13:06:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVOZ-00000005Iht-1HW1;
	Thu, 01 Aug 2024 12:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE89262862;
	Thu,  1 Aug 2024 12:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1867CC4AF10;
	Thu,  1 Aug 2024 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517142;
	bh=sqqkmEeL7tv5Wag3oPKgOfTAFLsGU8mgkKcr3MnXRIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lsWmVmR9E2WgjWn+RgLL3PyZr6vGUhI7FHJzl1VUx+yXtAGp0+vgrsnRfEzxQPGF8
	 JEge+ccT2xkgSqTTKc43BQibLAN2Ff4RkJ4PJoSfiiHq36EdVEfRfqOICFTDHlyr8x
	 GcgGDskfrMLd5JenB5QNSNHYQDdI7ih7Buhel8JcvWw7f6aINoluBytmA5D0QRg93r
	 M4g7QjLRiu/6424aiBNTfRGzdx1eRsiBF6rKOsqNcy6Q0Pje228gBVVj5rtCSH76mR
	 etppI/EaBZzCpoQY+V/GiPYFFQi1152aNx0npfmoX6t233KMZBi0w0WeQw939JZ31j
	 Qp0K++dBcU8nA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:42 +0100
Subject: [PATCH v10 15/40] arm64/idreg: Add overrride for GCS
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-15-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sqqkmEeL7tv5Wag3oPKgOfTAFLsGU8mgkKcr3MnXRIM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YRVVwOZRbiJRdOh866tHwB9fWzGXz1GHzjC2YM
 YZxFiIaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGEQAKCRAk1otyXVSH0Ct1B/
 4i8fM2n38TeqWSOYLe9SGZf9V0EGaItvppKspC2O9Iz6LH2Ki3Uhm1aT8Y/219upgO0Pj+lApVwGQW
 NJoYZbJheeyUYExsZxy/tPp8NHS5vzITfA2Uauqqqc+Le+nX15+BzBtpIlqEe7FaW868OZNMz7+cUE
 NY5EGIt/Rkcvg5lO6Zh5mhBk+ERk9BTebzF7n2p4U6EdNmoBKBDo0Dc99B9jLdaalcDyZomv2B9i4f
 cUzrB3doruk6EOc7m8qoe84G8yflvsOjTcQ4weBKJmDitZfwE3twjnQBhTvlIrzzN2Ne4Xg4t040jI
 8Txlbbf0NgH23Nmed0MqnbBcOo6gIH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055903_459618_E1B9D351 
X-CRM114-Status: GOOD (  11.16  )
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

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1384c7b59c9..3006c1bd1af0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -441,6 +441,9 @@
 	arm64.nobti	[ARM64] Unconditionally disable Branch Target
 			Identification support
 
+	arm64.nogcs	[ARM64] Unconditionally disable Guarded Control Stack
+			support
+
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 29d4b6244a6f..2bb709d78405 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -133,6 +133,7 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 	.override	= &id_aa64pfr1_override,
 	.fields		= {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
+		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		{}
@@ -215,6 +216,7 @@ static const struct {
 	{ "arm64.nosve",		"id_aa64pfr0.sve=0" },
 	{ "arm64.nosme",		"id_aa64pfr1.sme=0" },
 	{ "arm64.nobti",		"id_aa64pfr1.bt=0" },
+	{ "arm64.nogcs",		"id_aa64pfr1.gcs=0" },
 	{ "arm64.nopauth",
 	  "id_aa64isar1.gpi=0 id_aa64isar1.gpa=0 "
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0 "

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
