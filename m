Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6332CF318B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5y/c9f78EWcRq9XUdFv+Cyh0CvPHiQ9rlgP86HxFht8=; b=4vLqilFxsMUIhS
	AIoUszLxAx2BijPdNp9C26HsgZo7WQ8CtDIIW3gMOS4bsVonjCfiSpQzNVMr8ABs4EI0hjEKs9ffj
	uKMCiezuuSE6MrkZbk2vE1XgSu6V09BdftCkW1DJ50TJvW24SzyfkeHwbZ4BmACO/lrSMWfs+2bkq
	3D/Bh88QW9rRtuzF2I+9obBpkfe42u0k2+0Ud9olUHeGyPfbBFyeMwayOxKG0yDk0p5JZBLSe4xgB
	bOR7yIegjMUOBhHp+phxD0MDNDXa+FfoZag9zjVOOPnppnKpP/XQWBa9WiC3ip7pk7T2d9oMOVxyg
	pBNF4UMKi7shtvQOqZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmQq-00000004NjT-2GGq;
	Tue, 01 Oct 2024 23:37:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlvm-00000004IAk-3kDW;
	Tue, 01 Oct 2024 23:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D97975C53D4;
	Tue,  1 Oct 2024 23:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAA8C4CECD;
	Tue,  1 Oct 2024 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823921;
	bh=GLmI6hHYoj5JZxZG0yzjYcX6pFmL0ulwYTdiG1C9KyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uJXPg19KQ4tuAtY+0FftA0aaVagRDKUP20/lvTlKZqQNQbewcQSTrzzRjoEKtm7nC
	 n2gnfGJgNbPJyhuX549Sf61XlHumAKixbFpVzyS0gAlTSOu2rOnV1rMKQCIr0OtWJd
	 I1AK5W+WInFWvg2NnDZUXd1vn4u/Dsgt+pJ/0MjdgWn+6w7MuOpry4WuIcg7X/n2yE
	 YQdkhFe/WEsOi4KYSlH3gv7VkD5L4j+ugX1LlJl/z65lw6o99jyLOVA/XqHs+nYczF
	 V7AZSwEA8Q+34VDDyEn/3lQnLrPQ6NzYFY6CrlnYSTnKIpVdC21YseK5tgwYCXHyWY
	 yRYWEbR10J9qQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:08 +0100
Subject: [PATCH v13 29/40] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-29-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GLmI6hHYoj5JZxZG0yzjYcX6pFmL0ulwYTdiG1C9KyE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7aBg3m0n8js+N3r2y9s0x83zZGeJav6qRQG+DB
 SlM8+uyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+2gAKCRAk1otyXVSH0N8jB/
 9NrJV4u3pB6B+x7xy0q+Ych1nU+TZ7sIKyruiwgrncB9J5+7CklyjjjmcPn3gOVQEtoA+/W9aZ4lEZ
 NN4iZrw584yNtE+jBySXR0AMtH/u8xnbsfg7FJ9I0Cj5hS/wV7mYGSJhslLHzjeZZ5pOKEI3ZktG0f
 rH7Ob41i25UTAnvjwOautvPOk+SBOSZU6l7PcfCJteHFeR+WWAq4qJu+Hf9SLx6YXmk3DvKSlJbLp+
 2UcwdwWpPxRIlDKjTI0I4B5yTh6lvfjpP3yw9D6OkVVwcJPuOZdwL+tuHc9v9FubA3/dyFTCAqvs8a
 VimlYJHj8X/waleY1JeJKtP3jXoEnJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160523_119958_44701A59 
X-CRM114-Status: GOOD (  10.77  )
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
Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index f2d6007a2b98..1f07772ae578 100644
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
@@ -534,6 +545,14 @@ static const struct hwcap_data {
 		.sigill_fn = fpmr_sigill,
 		.sigill_reliable = true,
 	},
+	{
+		.name = "GCS",
+		.at_hwcap = AT_HWCAP,
+		.hwcap_bit = HWCAP_GCS,
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
