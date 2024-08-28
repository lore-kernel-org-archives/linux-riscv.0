Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12B7C7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNkyHb14XOuXYr8tY9V2IJInqubH2fxSH2e7zRXFagA=; b=2uGYhr/CrKKAsW
	XHzr8XYPW8UScqY9KHjwkshTx70nd+i5Mkatf71SVPkoedbYZOitW8p4t0RQEMuUEgEr5xvkDhOeY
	hbmZZNrgdaiQkDCWdKdilW603mihO+JNZ3d7ARiMbQtd/z3POcRonQxZuviL6XYToSMKJOvXuLiY9
	yKAhPLbPq/JWh8ZyEqRcF5MIPjMJoFeiE5HXaLN+OVA5OYls+x/x+uG2U9CeUZ6yWY3RZG9OyAgPA
	ymg5AgeH02EVKkdLkWCaoiQA2P9BQOHCFcIMBavlgJe2DejPRT+Aej0fx/ktTOfTRaAEBmPB7XPCA
	FIiVBu21yqFawRI/ZQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSSI-0000000HUpG-2cym;
	Wed, 28 Aug 2024 23:52:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS8t-0000000HNIO-3Xph;
	Wed, 28 Aug 2024 23:32:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 228D6A4373D;
	Wed, 28 Aug 2024 23:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B375C4CEC7;
	Wed, 28 Aug 2024 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887918;
	bh=aFW2qvTAUk71Nq29FR7iqobh+ecvMgae9gmrzv39Zig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hjwu1NOIEmtm8Z7u72gZ6JHpkwB5gkUJwalodRKF8NUXnKJGIEb0zJUYn0XqEtVsK
	 6eir07YTJAN930R0rS8oXPsf6PMfQ9EfkaAWQ1dRKOa5wXBUnNDnZaVRhFcZay/PDH
	 o/emvel+ObwFHeJv5S51ipjvW8LPa1xdsI+eywNUXvOC5+9MncYTnDzs8Uteg4EfVc
	 yuQM05fKSpjDRx9hshHQz8ztRMRG76+LOxIH3PymqWyy4gwdHZESoB/tcfmV/26lB+
	 qTA10jQeMNmWKfhwrB7LyxLXvrqayRjUqWp7rT//nr67E8BdqSESxF6eyGyVLa88li
	 voHyn7VgIlVTQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:44 +0100
Subject: [PATCH v12 28/39] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-28-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aFW2qvTAUk71Nq29FR7iqobh+ecvMgae9gmrzv39Zig=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KOSj/YT5ssZcKeVNxIRh75CfX+1/LJGwnNPsEb
 KfxmaQmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yjgAKCRAk1otyXVSH0AjAB/
 9IIDCOoIAD9cFmgd31fBocKw1sDdzChCEINlCN4R0b5mrluwuKvPLbgBxP96AyAIXdOfycNgOfzLkX
 sEBtTYbGIRb/4+k5PT5XV+8RvrJUQOYR/upipwFuP5naV3G16qy+an11n090xuLfuaBy8W/ImD5z82
 ZIIS8iof/mQ8HEOGmIyMAz+DDNpZbIl40V+PgO8ZXNOHJjj6kCUomP4kQhbcfb/AvtUtOuo5tBYbxs
 4Wr4Lb7KhW/WNKTnUD3EBFmzIQj/TGOJTSMEw0BUVChYxdHRy+U0lpcFUxuRK30pAxHy3X06v1Pnm/
 Gmna9QTiGgP9kprUoXL7dL1XvDBs1s
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163200_063271_12BD69CB 
X-CRM114-Status: GOOD (  10.84  )
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
