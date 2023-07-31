Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E23C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DieKd0OyHNtPk5DXq3yE43DTH3sO2lKL+EwiDgP2F68=; b=r6fVf/12svIHLI
	Yui7MndvT1lYKeawWzPPuB4bLWK/HLunMwuqV6Tkqn+bCdJFn24za9vuYchKXty8AxUlPyEG7bF0W
	th9hn5l+yWkMtTOYHccEFMgBYJtL3huBm9EHWFIq6VqJ3feN9OPF4oWua60HzlItM2eq0zgDB9aSr
	sVBi4KSbk2djedl2eQ8kKN4uB83IC/mxj7AJUSiPg99KABZhmWV25RyTbUHbT9SXz8QcXhVN/Bq1N
	zeaCoId7VrxJiYvJ6s6nYJByEss3I70kuLgU77bg/ku40+lBuJi3sGH/pRKooZZpbZYkc0+Fc+/v3
	6FyfEnreAoClGxxD2lbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTMl-00Fusf-1j;
	Mon, 31 Jul 2023 13:55:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTKv-00FtEU-2J;
	Mon, 31 Jul 2023 13:53:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEC566115E;
	Mon, 31 Jul 2023 13:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909DCC433C9;
	Mon, 31 Jul 2023 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690811604;
	bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nZYlPhlhjG2e1wEUfCei062MQ6Dbl9MfpeOxtlNby3v0voK/nj7N+EFE43JqQL5Wj
	 Hs+p8A2tPXTny2c0NtxjgW+c3M4oxb4wc8WIG7tYH0TvYSaeNibc+wtlNZb6m0eiZT
	 nITyOLlHdb1kCbgDuYgvG03K/DJCPIPSYtvfOgAj83T2kpc5aXM4HJ5jgHB5TEFg0T
	 6b2UTVk00oNA8JYYQ0yH6C0pGGkSz8r/rnHteFUub/w194oCNRHAYv+MI9Oe856TNL
	 qn9c0Dtz3rc7tjgn/VHNe7PhELqGqzPCzLAepLqr16IwopZhGucEbInKA25AVHiUtN
	 8fRP8D8j3smag==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 31 Jul 2023 14:43:34 +0100
Subject: [PATCH v3 25/36] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20230731-arm64-gcs-v3-25-cddf9f980d98@kernel.org>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
In-Reply-To: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx7wnodnwjqoZK4muIg3jEUoRCGxezol4tgSrjmCI
 O795jHiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMe8JwAKCRAk1otyXVSH0MnuB/
 sHfu5/n7b6sDdSTxDSHao/3yji1/B37g5tOzIcJILXPiDb3SHONtPUBN5opqReBE9DQcr+x0YI6Rkk
 jaJ4E5v3rXaHapeBP61QyIUI/8IIT146hHME6uvN2U4/budEmwshhRg+fRdusyAq2/VBIHsG0KX1da
 LZ099j1sMmvrMIKOrT2bpG0z98HXoIu3bz57PbEyiABWyHtIDeXiKt/QIStz4OVQ9hWYFZBjfNlzZa
 6/4cBlW8YGgvKS16rKNTxnMLDhROElcWbnnfxdNpw4VknEPzhsdrkvkHTxnQ4zLcFoeC4yl/NW7Swa
 c8XQF5EFbcdiyln3+fENM9B7tSzFF8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_065325_903276_6065F126 
X-CRM114-Status: GOOD (  13.53  )
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
index a2511b30d0f6..b5ef1a698770 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2093,6 +2093,25 @@ config ARM64_EPAN
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
+endmenu # "v9.4 architectural features"
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
