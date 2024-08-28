Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5CCC7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tt5cDaVJi6yHzxEOuSKwMyTvUtdLWiLyHGJV+I6FAOk=; b=T+/OSiRHb7KAI6
	xFB8HZHKXE2xU+l1ScVjiAe5qKdher1ZD2jdxO7Z8LGuFW9EfEUTYMdnecmwRQyUx3fm/OAM4GOkR
	m+wu2SgEnvfrxtd9DLTvkrG5afm/BUz7963FJ3ACKGaAFSUbVU9A/zopeeHpeXL7n+KkL/GagqTHf
	3GjDUCfJxZuZiaY4fOOgkg3X6OlidrrGINE1IvGIdtvl6uB5+SoayY2Q779ISg/CBz3VNXycg1Vel
	2ykqo03GL5qzvoDeMgKtiKQlecnOlY1Nc/wpDFnoXHQxQPO26Neb67FOiypsJzmVN3lq2wZSPJ8w9
	BZx8/aaCHoQh3pq6AEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSRT-0000000HUcV-1foy;
	Wed, 28 Aug 2024 23:51:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS8n-0000000HNEw-3ibJ;
	Wed, 28 Aug 2024 23:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AC3EBAE3F62;
	Wed, 28 Aug 2024 23:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA6CC4CEC2;
	Wed, 28 Aug 2024 23:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887911;
	bh=beFDrtDyIwMIQ+9ZnRJrXKiqbsyL6F5ZUs+tNbRY4bo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cmxwoYiPlqAu3PpbAe4bGKFan0D35T9aFz1uyLOo8UJeOq5mAHsWPTyVNiP5qq+QF
	 1bJmwFkWzxk1xeCmgEZjTmbPypjyB2wMPlh4/9IEsgqdGpkxmvUz3PCfJH9PueVAL6
	 MKQBMKGgFzhwPuS8beYHyGbOiwMhjcRUsKrtqTZHRGCrVw+kmWWj1h9HXwUb6w3RWV
	 FYKB2GvPgAUY/CCdj7QhVw+qDbhnzLjrekLZU+8Q32/0IagdbBbZuMFRTV3mEFcGaP
	 m66+DiHgGeY1Hu80y6yk2xG+bH397ive8mzSUVwJSrPZmFjr4FhDO1y9KjCrF9iyRT
	 i9cYNNLgL2fWw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:43 +0100
Subject: [PATCH v12 27/39] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-27-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518; i=broonie@kernel.org;
 h=from:subject:message-id; bh=beFDrtDyIwMIQ+9ZnRJrXKiqbsyL6F5ZUs+tNbRY4bo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KNVB+3I+jq6y04asLcwgZ/MwTq5s+oa0mg+YNh
 Yfgu4RqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yjQAKCRAk1otyXVSH0BPHB/
 90dYgJUIMJYlO9HaX+ruyrHyhuRC2pGtl9VBK2lNdeGXJ6Hvqi4owpgy/8/6e5omy6rq70EJZcWYul
 POQSUjKOHIw23YuSNSZgnq/G5o/jHmK1bUc5Vbn/iSGWK+Qdd/pAYigxHAfQZv40m5SgkAm+/vKLRP
 Cn4pGEJ7bm1AL0CKRoMgGxW7lo4EIWCdJDkr6hLUENHRWN15nlW1jpIfgtrYVfTm+AN7qx8NuUyjwp
 MoSbOf9pQqmotQKVb8unNR3EsDxcpUueJxVZgR9sSM8h2vGjIfeXq6D2SF/qtFM9p7KvJAd/F9OMXD
 x31o4oXplu9qcRnov3va3/52q6tZ/o
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163154_309443_22224121 
X-CRM114-Status: GOOD (  12.56  )
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

Provide a Kconfig option allowing the user to select if GCS support is
built into the kernel.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2f8ff354ca6..3fa682151c8f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2137,6 +2137,27 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	depends on !UPROBES
+	help
+	  Guarded Control Stack (GCS) provides support for a separate
+	  stack with restricted access which contains only return
+	  addresses.  This can be used to harden against some attacks
+	  by comparing return address used by the program with what is
+	  stored in the GCS, and may also be used to efficiently obtain
+	  the call stack for applications such as profiling.
+
+	  The feature is detected at runtime, and will remain disabled
+	  if the system does not implement the feature.
+
+endmenu # "v9.4 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
