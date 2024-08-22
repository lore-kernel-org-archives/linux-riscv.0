Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C44C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 04:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqpnWAig2upYsGaA7ZQk/YP6p/BSNBHtzql0Tt9SXUs=; b=g36lDWb6T5WZfN
	zlDiFnQGeB1e9HdzOtM+Qu35S9VLqba+hJLfYzEk904fYPz07AqatlxHcGh6j53fJYio88VxkLRiD
	7y1HaZQbiqBkWrjnPBp1UwHg2KKZjFdrJNOtmw3KzoRgzwk4sdL2POc/F9OZNcdSJLmwYLLsG+5EM
	tw67ZzGj/K0Thv0SeS4UK6bCgQmD4c/ewC+TQd7JY5xCHshXbc8aJLOS2H8EFSJm5Z5a5SkRHT98E
	kY3L0zfKiGlB7XgOFAzTZ6iDr8Pg+V86iQBTF3Zfq14C+cwc+9Fl2C4wsp4NMcHr5dwtF1ZelN2tY
	M4sEe4mdyP3GKpCyHWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgz0K-0000000BIRE-3kvA;
	Thu, 22 Aug 2024 04:00:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwWK-0000000AtLH-34GY;
	Thu, 22 Aug 2024 01:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3983611B2;
	Thu, 22 Aug 2024 01:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C90C4AF10;
	Thu, 22 Aug 2024 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289707;
	bh=oHs0edHK2ZH//P9wlXUiorha791DOO+hA3lq1vKIHRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i2jJ8j7yO5ZxaxcgqkfrVoOX1ioF/kpI7DKJFezNvjCQnlVOinULY8Zjak9ELFf9g
	 7+6uhM3r3wLXETAStuORju7Yf7rkffQS5BOOAlApFwtSO1KPWev4UPd1mHu5oh8PFU
	 JubPSf9+gWhnfejdO34HXSUwzypCNvnm3sjNO/xtiB6WzkLhfFGXOIWaWYvVQ4zjNV
	 ZD3s9WFpYW/F1nxM7G4JOt/B015t+ByXRQgyifr92N8KVuDLjFzhkn60I66kqPUy8D
	 jIhqv+traJMxxpKdDso4fEgQBnhI9PsrSymhZA0wP7gyuPUkZ4ALZSO4Yi/uEpm8Ds
	 kvvnZvB7c8HpQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:31 +0100
Subject: [PATCH v11 28/39] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-28-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oHs0edHK2ZH//P9wlXUiorha791DOO+hA3lq1vKIHRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpE5VVU3mpFKJ3hhjwa1thDydHnqMetxvpjvhVp+
 8HDjHUmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaROQAKCRAk1otyXVSH0AsLB/
 9E1Fcy2IXhvd/JhwhLRd+hrphvNVZfzJt505FwMtQNrnZzVixBvseWV9X6QlBFErh6ouCP81vIrMCq
 t2rSdIK/pY1jXzvzGra8yMdPJynAThpNy0Iz8l8hiyQrFOZR2cR7LkWqS4r7PwaBUdZlwXy165+Kqq
 1VJIDF3fOjOgWpZ/UVwApLw+/dJIZhKvZtrCUrndbg0vD6sUyQuW/OD6q4MkHZeyxMoDCJK1wOhtJl
 tJ/3fzsjZ6SivGFUbnlwr+8gmS5VtzX6PUNQwOmZh3tcaaCuSIUt+4UP5lYhIOJl8gQ4EbSff1Qzj+
 rqDAauZOO0JhY7bXmhQBlbkhQv7v/a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_182148_975825_D853B220 
X-CRM114-Status: GOOD (  10.78  )
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
