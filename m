Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871AAC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqpnWAig2upYsGaA7ZQk/YP6p/BSNBHtzql0Tt9SXUs=; b=xeFltNud7BzUi3
	ksZaCKKC/0VrgKCoI6cRpzsCyeu3ULh+BIiw9HAB7DE6EndTNLDmmdPdP5t5pOiNrTcIvuK69unGR
	paBxqdgzlsSJ5kHNC3r1hjXPIEn+jNh590XZ+wPFJK/VohDxOE8nJOXnjiDuxkPtMbZs5+09WRZSn
	bSKGR3bPLLNZKbKnjoKlhwgawYXXQR7J4qKIsyO1QXTA7xNC37ngvcf7Rx7LnZPrBzEZMA3r6frAv
	EsXp1yJwrE+ow1llifosb3TjrGsonR2tlJ2DMW2wE/9TBMyXYj4H/X3jv7u5bDYbRq9vLBYDNLRtK
	Cy1FvNn4hcOBUpU0Ji9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVcM-00000005QpK-3Xgs;
	Thu, 01 Aug 2024 13:13:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVQ0-00000005JhD-1Nlw;
	Thu, 01 Aug 2024 13:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9700ACE19AC;
	Thu,  1 Aug 2024 13:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2541C4AF14;
	Thu,  1 Aug 2024 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517229;
	bh=oHs0edHK2ZH//P9wlXUiorha791DOO+hA3lq1vKIHRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tnrq9/qlz5GnEEEFFRetjGPSOWedcxCUE1yGkiFYjdws0U4itg41NBfsVY86Lvk6s
	 X+IpjSv62kIwlCfYN7eFvhz2sW+UwETmWdFlmMGMFBidDKWrg0ZHqgdbRt2HYW3gQn
	 MG0H6C/C54Id6g9ZGXA/pI+OHLR78Pd+3YU2MnbvW5YX/lYP8SuwmT0Nc9rNUHMH8J
	 QQOUeJTOom0yMSM3cBtJB4pqkkaZuDFclam5qISOmDOEzSnDQHeIdlYsrj37iRvIV/
	 3S0HHqq5YrZzkG0PsWgDt1Bg9UNBEFSgAE3wRUe8TprSjqCD4zoYzazrxW12lBGKYr
	 x3cLNAUNqLeaw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:54 +0100
Subject: [PATCH v10 27/40] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-27-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oHs0edHK2ZH//P9wlXUiorha791DOO+hA3lq1vKIHRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YaR7eUIgxap135hy7ONIfzK5DCkSb7UQJMKMtp
 D592qJmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGGgAKCRAk1otyXVSH0ElPB/
 9ZXbE8s9vC+GQ95xVWW0x7DnbqqIxaDtNFUU54+Bf2g/sdyJFD0Kv9WAVrRQ0V5fpTxUrG23xXlFEF
 J1/nVz4ngvN+k2sXHHFlopJP23BUioBPLP2iyFvBtipYkXYxoDtbDG/SdYZipAfT+j+XnW+A9umF4l
 HNyylEPIp+P/zoxBJ1R1j0+MPSQH1BAW3YC4I6It2Qij0MQL36gOOXr9/HmD/+89eFIdD45LPvQv1V
 ms1MF+qnajf1TQk3xpz5BTikAATCVwNJTZ9+Y1zsa54sW3wPp3OAnksvOzBDEsuUtusvS52+wgxyen
 dp/nWQzMiCu0D823CItebJZbVulSjq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_060032_763989_3748750F 
X-CRM114-Status: GOOD (  11.24  )
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

Add coverage of the GCS hwcap to the hwcap selftest, using a read of
GCSPR_EL0 to generate SIGILL without having to worry about enabling GCS.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index d8909b2b535a..dc54ae894fe5 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -98,6 +98,17 @@ static void fpmr_sigill(void)
 	asm volatile("mrs x0, S3_3_C4_C4_2" : : : "x0");
 }
 
+static void gcs_sigill(void)
+{
+	unsigned long *gcspr;
+
+	asm volatile(
+		"mrs	%0, S3_3_C2_C5_1"
+	: "=r" (gcspr)
+	:
+	: "cc");
+}
+
 static void ilrcpc_sigill(void)
 {
 	/* LDAPUR W0, [SP, #8] */
@@ -528,6 +539,14 @@ static const struct hwcap_data {
 		.sigill_fn = fpmr_sigill,
 		.sigill_reliable = true,
 	},
+	{
+		.name = "GCS",
+		.at_hwcap = AT_HWCAP2,
+		.hwcap_bit = HWCAP2_GCS,
+		.cpuinfo = "gcs",
+		.sigill_fn = gcs_sigill,
+		.sigill_reliable = true,
+	},
 	{
 		.name = "JSCVT",
 		.at_hwcap = AT_HWCAP,

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
