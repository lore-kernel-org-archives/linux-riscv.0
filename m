Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17290C04A94
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 22:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHTQdqSJlr4c2hgA53+p2BDhnQIAfK8Ac/l7REpKUWg=; b=F7awIMKz1aRfoJ
	1D2VttKNSdvgNZumWEISV4lHI+t6SsqHygjIMG7Bi+h5MvIWnZV79qc4WqbGky/cSdm1W81zomtxp
	IwzELSs4cLaUfiFsa9YVC+5CHnGFPnI+wdBBNaeuvBYDmoT/fiGl6wV611tIFhdW+pCHvAvIvtsOI
	oxOuYIpOvIfrOedPWEq2FLCQl2TB7y/hzGO3l4vAV8MpXVnuoHb/19+WBDoNvCUc03fZPmaPJHzYb
	is5Aw7g38u9aEYdWX70zsEPs3FLFhP/ClFUpgwznx+1X5Y6CEa4AG26GJux0r8ly2U7vkP+mwPYQk
	9lS4JJufqHWn59LNKONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9mQ-00FwZG-0V;
	Sun, 16 Jul 2023 21:59:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9iI-00FtO9-1R;
	Sun, 16 Jul 2023 21:55:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDAFA60EC9;
	Sun, 16 Jul 2023 21:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94855C433CA;
	Sun, 16 Jul 2023 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544533;
	bh=pU/Cpaxis09XYO6pS+Tm9irl4OV1fzcTdHAFs+JXaiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rWGbpHGpAPUGRkeHBlxB3u7YFF02VUBqBH3DDfi/zq+uR3bo5c9/02qDMlbROcq1a
	 TOxZq+swTzl/Cn9rsFrq0fkp5SOMZ9rQdBdNmFqBC1WAmool8nFYx21GlscpJIPaX5
	 Hj4VHZuaIdAexXk06rf4SIr9g7kTQlHiAqUekjYGnvRjB0F6hrvpboYOjI/7sNGzH6
	 vO0/Sk0ndEyBZ5Xb7JXIentYaOHaqbRU2SiE/17mQ8tYAWW9MdndQvzgrHI+Gte1+R
	 I25r1VajxxALbkW5eIIXj+twrpfKo9XBumj5mL0llLHJuRgO6RoUYB0fbwIFe2mCnI
	 xdT5wxQd/9Vww==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:51:22 +0100
Subject: [PATCH 26/35] arm64: Add Kconfig for Guarded Control Stack (GCS)
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-26-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
In-Reply-To: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pU/Cpaxis09XYO6pS+Tm9irl4OV1fzcTdHAFs+JXaiE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktGajNEQmje9r0OAkZ6IXOyAN5ruAxFmeetfHxjAC
 LDyTfAyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmowAKCRAk1otyXVSH0JhGB/
 4uEom4k4x+430HQzhyHP2BDhwiv0Xo2K1mTO20ue7Lk8Wti2gS+bFt3j5ucEpMEwtZzUpbv9aFHg8g
 yVDFSa62TJm4VnlCyDGJgQ8tJrySIzQDdUWaW4NsZkCYMvzaHn7Io9BSwTN7Zseo4HDAFXeuVN+KcI
 6W/YOWtqN+FpSOZSkAOtNDCCtHC+Bnwr5v6a6FDSO91/wXPICZ9z5JG71wr/l8ddWrbzhdD+2lp/5O
 sqSoPHL3zXgrAcCHuCXDKtfj+XAC/YXjHy8TdZgS0bh4tp9AbE5iob7yXE/SpJfC8W3JOO8pyrZA3r
 LZHn0cmojWthyoDyKu+QYIQJkyHsLU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145542_417167_B38596FC 
X-CRM114-Status: GOOD (  12.96  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7856c3a3e35a..e1aeeda13c52 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2091,6 +2091,25 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
+	select ARCH_USES_HIGH_VMA_FLAGS
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
+endmenu # "2022 archiectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
