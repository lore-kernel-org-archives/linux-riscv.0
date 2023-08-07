Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134C8C04FE0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 22:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5J2YNO4zgc2Spd4dgqNmXTdhrRbw+pz5V9wwn3UIIMM=; b=JEHbbIYgzulQYD
	zSZmfpOvIaAKbNjvoTMnIyya/wSoZVsUPXmxe0qfF50vNd6560IWDZ4nqm9bU0ZVfmMum8hNaVk67
	EZbyrwX2uvenEQv6Ex++gxAHdQZlDbWqi6NdKWFFlGIziFyEF2qnXffKrN3wMrEQ5Sk75eusM+Amv
	IF48NmsTpfJvKI+TBm4F6BcSNB+TdqqDKjjyiF4H23nI6mF9vMIvlPol0nCsBq5k2HPEg9IGCo9h7
	4uJmV457TbUoPU04NTGYnO0xo3CKq2E1pCZbcjUDaF25OvAb1xclDxZs0cSRS+z3Vp0bt/PKRMDIe
	zzk5kCLk8hDbN5V3KBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8LP-000syy-2a;
	Mon, 07 Aug 2023 22:04:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8Km-000sIm-1K;
	Mon, 07 Aug 2023 22:04:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BBD86229B;
	Mon,  7 Aug 2023 22:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8415C433CA;
	Mon,  7 Aug 2023 22:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691445854;
	bh=6C9vpUKzxaC1YPufnnUpE8qHeuHqYjFB9iVUxK25t6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aNAspYX8YMDa4S1UOfbvx8zWfswbqBEz2wJe7nfM0pWFTYZgpasCip1sxspsbK1qs
	 /ctFJQYBpm7aljWAEoddRMJF5WmAQCiy0iBDZYT5uSPQXATQIPS9q50niTcPxSoYYk
	 U7X+2GqIufk6btPdrinnoTk4hj8wM7DiUAFP7dlkMqbK/aAWLB1jFFgmzAvPnQhJUU
	 oXDcFIObaNQGJy0w483/tdaMENDzBL3QS97hz+z2fp/xbLo6OxHbD5nUXVeaLIwxqG
	 NryQH3iy3EX4Hs9w39NpKQdf6CVUtGS5BHj7u+SZrrV/4S85G4qoG9XZQYOA2P/wW+
	 CAywrJ9cKhinw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 07 Aug 2023 23:00:31 +0100
Subject: [PATCH v4 26/36] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20230807-arm64-gcs-v4-26-68cfa37f9069@kernel.org>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
In-Reply-To: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
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
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6C9vpUKzxaC1YPufnnUpE8qHeuHqYjFB9iVUxK25t6w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk0WmsQXm1Nq46jBWok7xLjTNPIAVH3O++MCR+eGVU
 IlIReyiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZNFprAAKCRAk1otyXVSH0HEYB/
 0WPQNCRQxW5vYJJYV581n2TRG7EYT3pL7OPOKjvTDLv3U3bWOAdKBA69F+CMA2Cf9vB5QMcZPf8HbY
 F9VwARZ4J1JwbrXW8xotnruPFWMpZzyIdAgg8/YIU5lOzFtpFhSGm0hhnEjxK16rlpCflpZSVjVpnW
 OEQq6+W2PsvmhAgpMBYG5P2z/J1gUpUOqhoiDMNyFDYHNjd7tmG4yj+BHiaCXNRfWATS33Y1kRDx42
 XRZ3wQ8i8jAjo3JO7pX95L7caAT8EAOfI+ZGgvR+1aHYzcbx2sehURn+5lDFBzXVM+CE8PTpXIUXLc
 VfOqijnQtnB8bltlyq6L9mWoafWwPE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_150416_556919_4752C8C4 
X-CRM114-Status: GOOD (  11.52  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index d4ad813fed10..38844e4c5aae 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -39,6 +39,17 @@ static void cssc_sigill(void)
 	asm volatile(".inst 0xdac01c00" : : : "x0");
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
 static void mops_sigill(void)
 {
 	char dst[1], src[1];
@@ -223,6 +234,14 @@ static const struct hwcap_data {
 		.cpuinfo = "cssc",
 		.sigill_fn = cssc_sigill,
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
 		.name = "MOPS",
 		.at_hwcap = AT_HWCAP2,

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
