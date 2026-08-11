Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8828CC5B574
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iWinf4lRVkqRKl9xC7eGzItUw4JIix9ukngEjQqA8BA=; b=o46CFR2u5z26aF
	cMDbNoxPo4382bxR4KgD252ZdMiTeYsDwPtSvVEA2+qYwlbtGR6NbQxum3on57ot4QM6YVgOP4SaX
	LWkeL7EJNwL64/t/FISWICMNHQ5mpXhQxDf6zNQbULqB4iCCIJpuA9Yw1Wahl7TM42CvNQdSQW7Pj
	YIrRj2PkGptlb9Y6W+M1v3f6DpozlD1O0Ctk4VSyPlYz5ASJuj0VNF8HDyCsBdpnmVVpE7QLDqo8S
	3OdPnbBSVgwwlST+TvsqecZYdV0AiIl8q8qBLHQES3ozUqq1YX0YkTiL3olPQff39oXm5vEUwuy2N
	oFaNeN5iNaIrlHzr5mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthex-0000000DaQv-3vCl;
	Tue, 11 Aug 2026 08:16:31 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtheu-0000000DaOH-01GN
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 08:16:30 +0000
X-QQ-mid: zesmtpgz3t1786436116t68c28f83
X-QQ-Originating-IP: KwozMtLivmaHSdjO8icB+0MUlw25DirYX+lIRW7ju24=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 16:15:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10710046789896365889
From: JinRui <jinrui@haiwei.tech>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH] riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present
Date: Tue, 11 Aug 2026 08:15:13 +0000
Message-ID: <7190E4DB338251C3+20260811081513.2849980-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NMMSTmykDl9bpnBj1QsZLlwk7SWVrM7WbOjPYC1/utVrArvdHEnrofvu
	n2AkrE1+AUQ0gN4vOICS8HY3VC99G0ENluNAw+wM5TjYA5MBiQdNelg97KEtZ3qA6+KC5Eo
	nDwaPYjOoxL35IHxu3/ET6kEc7u7Z0SNQ6l4nrkOHlZN4aRNJAl51ehd0DxZ5gwgmVNMdab
	BNQJVAugUNzj6L48QdwKs5MxVuhBXuOCLJufBXla+7Y8LmWaCYqJ81NYjTY7/KqLAPZX3/T
	VRkvf77rWCk2CbzXFM+5oiU0kBJTQDg3pUklH3Nv4E+vq1HNRmGEBwzK/ptjqOP4/01p4BM
	qa4qv54/N/CAlVWyPm0tG0wdN1yDdOCTxT8uYjXJs0QQ19Gw88WUN8+mn0/LYqn1mo8NXlh
	GjBkpLMwNttWO8g0mus6ERSC163gpXteFfp96JTDYSV1zeWPapTNEF5vNd0w+Zywlel8oVd
	xam4lf99/XIKlOnAgXhH8gFZN+sk0JiNZfsje+evhq5U/r3oVB99iIws3zrAj7tUL7cOoPl
	WRXyINshDTJdkNLaHm7X8yERLn3oZqqam9SZ0zFWG71BOUmufGFi2Ae1F246y7Yr1nun1Dn
	m9FQeD5k243RbkqYT+HXKuoSmRbeRVeuEwSOK7TrNUyRSeZAPvz9p0JfjrLQPtyzUyqYMSy
	GbIczwhPB9etonv8Ao5wXWh7G1A6gRwKJRBV/dLq7r1jIYXaEgRlCksf6ma0LCqPWlY9BGi
	IyVQzxxac8kN6zQdVTaHS9wua1gPn0r8ij4E4carsbB4MdwqJkyWCjY/fAGb8F1vFfhTL8Q
	xMoCyBXkY3XjCZGcKwZGPp6GS53Ro0d3uokFKxdikvHaoRpDCkR82qOWOugyWb4z6lTnuiE
	WIA3KmKpmdM28g72xqPvfRIAZlNvG93PBgnwhmIif5aI4juO7HQxKXsSfi9hLiiqD2DGW15
	u51KolY72QJ/guPN8ajFInmXKiV0gXfflpuCMYz7RvTBdMa11gUwqkXon
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_011628_464811_88C3D3A5 
X-CRM114-Status: GOOD (  15.58  )
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

The RISC-V ISA manual specifies that Zfh implies Zfhmin, a normative
rule clarified in
https://github.com/riscv/riscv-isa-manual/pull/3070. Zvfh likewise
implies Zvfhmin, as stated by the vector extension specification.

The kernel currently reports ZFH and ZFHMIN (and ZVFH and ZVFHMIN) as
independent hwprobe bits derived only from what the device tree
declares. Platforms that declare just "zfh" (Zfh being a superset that
already contains all Zfhmin instructions) therefore report
RISCV_HWPROBE_EXT_ZFHMIN=0, which breaks userspace RVA23 conformance
checks (e.g. snapd installing core26 on riscv64).

Use the existing superset mechanism to set the implied subset bits:
  - zfh implies zfhmin
  - zvfh implies zvfhmin

Add a hwprobe selftest asserting the implication holds and update the
hwprobe documentation accordingly.

This is complementary to the rva23u64 base behavior discussion: the
RVA23 conformance query proposed there is derived from the
per-extension bits fixed here, so correct EXT_0 reporting is a
prerequisite for it to work on harts whose device tree declares only
"zfh".

Tested on a RISC-V QEMU VM whose device tree only declares "zfh" and
"zvfh": with this change both /proc/cpuinfo and the hwprobe
RISCV_HWPROBE_KEY_IMA_EXT_0 bitmap report ZFHMIN and ZVFHMIN, and the
hwprobe selftest (including the new implication check) passes.

Link: https://lore.kernel.org/kvm-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/

Signed-off-by: JinRui <jinrui@haiwei.tech>
---
 Documentation/arch/riscv/hwprobe.rst          |  8 +++++---
 arch/riscv/kernel/cpufeature.c                | 20 +++++++++++++++++--
 .../testing/selftests/riscv/hwprobe/hwprobe.c | 20 ++++++++++++++++++-
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641d..379c8723f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -155,7 +155,8 @@ The following keys are defined:
     defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFH`: The Zfh extension version 1.0 is supported
-    as defined in the RISC-V ISA manual.
+       as defined in the RISC-V ISA manual. Zfh is a superset of Zfhmin, so
+       RISCV_HWPROBE_EXT_ZFHMIN is reported whenever RISCV_HWPROBE_EXT_ZFH is.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
     supported as defined in the RISC-V ISA manual.
@@ -164,8 +165,9 @@ The following keys are defined:
     is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFH`: The Zvfh extension is supported as
-    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-    ("Remove draft warnings from Zvfh[min]").
+       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+       ("Remove draft warnings from Zvfh[min]"). Zvfh is a superset of Zvfhmin,
+       so RISCV_HWPROBE_EXT_ZVFHMIN is reported whenever RISCV_HWPROBE_EXT_ZVFH is.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFHMIN`: The Zvfhmin extension is supported as
     defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602..d58d3a73e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -391,6 +391,19 @@ static const unsigned int riscv_zvbb_exts[] = {
 	RISCV_ISA_EXT_ZVKB
 };
 
+/*
+ * The RISC-V ISA manual specifies that Zfh implies Zfhmin and Zvfh implies
+ * Zvfhmin. Report the implied subset extensions whenever the supersets are
+ * detected (see https://github.com/riscv/riscv-isa-manual/pull/3070).
+ */
+static const unsigned int riscv_zfh_exts[] = {
+	RISCV_ISA_EXT_ZFHMIN
+};
+
+static const unsigned int riscv_zvfh_exts[] = {
+	RISCV_ISA_EXT_ZVFHMIN
+};
+
 #define RISCV_ISA_EXT_ZVE64F_IMPLY_LIST	\
 	RISCV_ISA_EXT_ZVE64X,		\
 	RISCV_ISA_EXT_ZVE32F,		\
@@ -523,7 +536,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zfa, RISCV_ISA_EXT_ZFA, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN, riscv_ext_f_depends),
-	__RISCV_ISA_EXT_DATA_VALIDATE(zfh, RISCV_ISA_EXT_ZFH, riscv_ext_f_depends),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zfh, RISCV_ISA_EXT_ZFH,
+					  riscv_zfh_exts, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zfhmin, RISCV_ISA_EXT_ZFHMIN, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcb, RISCV_ISA_EXT_ZCB, riscv_ext_zca_depends),
@@ -559,7 +573,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts, riscv_ext_vector_x_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN, riscv_vector_f_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA, riscv_ext_zvfbfwma_validate),
-	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvfh, RISCV_ISA_EXT_ZVFH,
+					  riscv_zvfh_exts,
+					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_crypto_validate),
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index 54c435af9..eca4441ee 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -9,7 +9,7 @@ int main(int argc, char **argv)
 	long out;
 
 	ksft_print_header();
-	ksft_set_plan(5);
+	ksft_set_plan(6);
 
 	/* Fake the CPU_SET ops. */
 	cpus = -1;
@@ -62,5 +62,23 @@ int main(int argc, char **argv)
 			 pairs[1].key == 1 && pairs[1].value != 0xAAAA,
 			 "Unknown key overwritten with -1 and doesn't block other elements\n");
 
+	pairs[0].key = RISCV_HWPROBE_KEY_IMA_EXT_0;
+	out = riscv_hwprobe(pairs, 1, 0, 0, 0);
+	if (out != 0)
+		ksft_exit_fail_msg("hwprobe(IMA_EXT_0) failed with %ld\n", out);
+
+	/*
+	 * The RISC-V ISA manual specifies that Zfh implies Zfhmin and Zvfh
+	 * implies Zvfhmin, so hwprobe must report the implied subset
+	 * extensions whenever the supersets are present.
+	 */
+	if ((pairs[0].value & RISCV_HWPROBE_EXT_ZFH) &&
+	    !(pairs[0].value & RISCV_HWPROBE_EXT_ZFHMIN))
+		ksft_exit_fail_msg("Zfh reported without implied Zfhmin\n");
+	if ((pairs[0].value & RISCV_HWPROBE_EXT_ZVFH) &&
+	    !(pairs[0].value & RISCV_HWPROBE_EXT_ZVFHMIN))
+		ksft_exit_fail_msg("Zvfh reported without implied Zvfhmin\n");
+	ksft_test_result_pass("Zfh/Zvfh imply Zfhmin/Zvfhmin\n");
+
 	ksft_finished();
 }
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
