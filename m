Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF3BE95A9A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QP6/zY/GQJN5Cmn39xrDHtpeRHW/gbnzAv9XgYzd4Iw=; b=jWyoD18t/FZDGq
	OYA/sKUYs2qcY2TesTYPZmCHorMTN5l0mgePrjbOMWf7LbkQGssmqXvI94s4HY3oQZmlkGq2ZXvow
	MTR4SlAup9M72lvLR+evS31JFFIKWl1O2q2CAOQxTV8GweeMDsAU7zfPmXwrGJ3gzPWI/LIU8zhcz
	Co7HiLPcE54hL8DU7Md+XJfsONOJ212W7lZx931lAZmH+k1P3DQ/I5klLsAGp45rbMzDeHI8pGnQ1
	iq7WLYpcNYonQc8a9lwdyNG+rWi2EejJVrBe6yJOBK1s2c2VokW0pikJ1IeUf290IzBc5YvMy2mCg
	aBHN333KZ9UZ0qlVutlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp9Y-00Acoh-0Y;
	Mon, 09 Oct 2023 12:14:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp90-00AcFe-1c;
	Mon, 09 Oct 2023 12:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B598A61120;
	Mon,  9 Oct 2023 12:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A219C4339A;
	Mon,  9 Oct 2023 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853633;
	bh=CQJ0Nn/FrNQwik1UANJ8xSGTPojw3dSDEOcln7FrjBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NeKlb9iqE4AGE1VnnuuEDi9x2qHDhG39YDOtQOygNJGcp/7puO71yjWwEgjDhH3Ok
	 EsjeQrTlMbsE9cdsW802P0C4KwKQrLhXCAVPvYoMyhwdzLylGiRYrjWH/2pZ60L35S
	 a9jKGbTd5a1hArbwkwropJxQO7vTjD7c0Xx2znQT6EoNdzaeRtiC4g26P+M7uLgWrS
	 b3oQO2OsLcUn+5vvhhOIDKBd0jOw7N1t0STVQxilRLL4vRA2LTeFElBL2WUiAMl4Hv
	 HOWchYwqBex8aqYopW1sVnLkcj0J6hahyC/X4knAzKLC7SCmnLWKhbRz/SG+nIDF/N
	 IhyAEtwkn59tQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:09:02 +0100
Subject: [PATCH v6 28/38] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-28-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CQJ0Nn/FrNQwik1UANJ8xSGTPojw3dSDEOcln7FrjBk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2nVuVBXqjsn2LJUIT0YQm3p4RqL6b7G3kTo12X
 jK0EkTuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtpwAKCRAk1otyXVSH0DpxB/
 oD/2yjl18oaUFoxgjlXboHnU3Vdbj18snA/U+HNmjP8ycDMAla/rlRZJTMobzcc6q3xUzjBw6Qby42
 XQwsre3+1XKPZXNnbbU4/AE729y6HgZeTm9fQ6OYXPXHqyLSUC70l8Mo4jdi6hLBwPh6S8TQSHX7NQ
 gwp1jXGMDhHgNWm9OEXmFTt5+FD7DPoWDWt02MDae8YapOFbDrFRg5urZTSdSJLdZnCDJ77TJT4QQP
 vhmv94GFddGFi32RfpOmDdfT0/fr2hdAfocT2Sv6jv7q5XCYP8ofxBQ1QvfGbrhqxoMKQwleOK6puP
 vrqiRdibSz+Kgt6dLzej/2YoOwjid2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051354_777638_F0F9DA53 
X-CRM114-Status: GOOD (  10.96  )
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
index e3d262831d91..785c9a4ad666 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -63,6 +63,17 @@ static void fp_sigill(void)
 	asm volatile("fmov s0, #1");
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
@@ -327,6 +338,14 @@ static const struct hwcap_data {
 		.cpuinfo = "fp",
 		.sigill_fn = fp_sigill,
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
