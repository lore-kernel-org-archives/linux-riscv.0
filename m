Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84936C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 00:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7BjrdP4K8UboXCZaQoMHDyRcjQuonDKn7sDihqhKzA=; b=fziLOjJOxA70B1
	tDI6QQpFpMeH6cr+U/r3mOJtLvmZrxxrFEB7hSgVYuChn3Hv3eix1LdId/+PKyKdEXHx7KESOp+AY
	ptlCe/6MJcZMiieQjH8csbYZ2nnP0OKRiyxzqOqhcb7JwFuGP8B/8pcACbNRzmrr8YUW6yrN3fpyw
	aQ9qXkGk/T4E7btbMFsAzVvzk0bdll6XSj1mLrCNpp5i1sZHNr+6hz6iEtqW2LkUydZe9GoQ7MqM9
	1ReA4KHe52CpIPXu5Z2nIiGyfGYyDy37kepmBi1JQQ6o/3SLzZDD3oaC4MRWCRSXG6mZ7zfCVmCaz
	r0UKFHbiu36ObA7I9CmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVS-00BbrU-4i; Tue, 28 Feb 2023 00:06:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVJ-00BbmI-Ii
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 00:06:05 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pWnVA-000552-3j; Tue, 28 Feb 2023 01:05:52 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH RFC v2 09/16] RISC-V: crypto: update perl include with helpers for vector (crypto) instructions
Date: Tue, 28 Feb 2023 01:05:37 +0100
Message-Id: <20230228000544.2234136-10-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230228000544.2234136-1-heiko@sntech.de>
References: <20230228000544.2234136-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_160601_934884_2845AAED 
X-CRM114-Status: GOOD (  12.35  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

The openSSL scripts use a number of helpers for handling vector
instructions and instructions from the vector-crypto-extensions.

Therefore port these over from openSSL.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/crypto/riscv.pm | 433 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 431 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/crypto/riscv.pm b/arch/riscv/crypto/riscv.pm
index 61bc4fc41a43..a707dd3a68fb 100644
--- a/arch/riscv/crypto/riscv.pm
+++ b/arch/riscv/crypto/riscv.pm
@@ -48,11 +48,34 @@ sub read_reg {
     return $1;
 }
 
+my @vregs = map("v$_",(0..31));
+my %vreglookup;
+@vreglookup{@vregs} = @vregs;
+
+sub read_vreg {
+    my $vreg = lc shift;
+    if (!exists($vreglookup{$vreg})) {
+        my $trace = "";
+        if ($have_stacktrace) {
+            $trace = Devel::StackTrace->new->as_string;
+        }
+        die("Unknown vector register ".$vreg."\n".$trace);
+    }
+    if (!($vreg =~ /^v([0-9]+)$/)) {
+        my $trace = "";
+        if ($have_stacktrace) {
+            $trace = Devel::StackTrace->new->as_string;
+        }
+        die("Could not process vector register ".$vreg."\n".$trace);
+    }
+    return $1;
+}
+
 # Helper functions
 
 sub brev8_rv64i {
-    # brev8 without `brev8` instruction (only in Zkbk)
-    # Bit-reverses the first argument and needs three scratch registers
+    # brev8 without `brev8` instruction (only in Zbkb)
+    # Bit-reverses the first argument and needs two scratch registers
     my $val = shift;
     my $t0 = shift;
     my $t1 = shift;
@@ -227,4 +250,410 @@ sub rev8 {
     return ".word ".($template | ($rs << 15) | ($rd << 7));
 }
 
+# Vector instructions
+
+sub vadd_vv {
+    # vadd.vv vd, vs2, vs1
+    my $template = 0b0000001_00000_00000_000_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vs1 << 15) | ($vd << 7));
+}
+
+sub vid_v {
+    # vid.v vd
+    my $template = 0b0101001_00000_10001_010_00000_1010111;
+    my $vd = read_vreg shift;
+    return ".word ".($template | ($vd << 7));
+}
+
+sub vle32_v {
+    # vle32.v vd, (rs1)
+    my $template = 0b0000001_00000_00000_110_00000_0000111;
+    my $vd = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vle64_v {
+    # vle64.v vd, (rs1)
+    my $template = 0b0000001_00000_00000_111_00000_0000111;
+    my $vd = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vlse32_v {
+    # vlse32.v vd, (rs1), rs2
+    my $template = 0b0000101_00000_00000_110_00000_0000111;
+    my $vd = read_vreg shift;
+    my $rs1 = read_reg shift;
+    my $rs2 = read_reg shift;
+    return ".word ".($template | ($rs2 << 20) | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vlse64_v {
+    # vlse64.v vd, (rs1), rs2
+    my $template = 0b0000101_00000_00000_111_00000_0000111;
+    my $vd = read_vreg shift;
+    my $rs1 = read_reg shift;
+    my $rs2 = read_reg shift;
+    return ".word ".($template | ($rs2 << 20) | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vmerge_vim {
+    # vmerge.vim vd, vs2, imm, v0
+    my $template = 0b0101110_00000_00000_011_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $imm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($imm << 15) | ($vd << 7));
+}
+
+sub vmerge_vvm {
+    # vmerge.vvm vd vs2 vs1
+    my $template = 0b0101110_00000_00000_000_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vs1 <<   15) | ($vd << 7))
+}
+
+sub vmseq_vi {
+    # vmseq vd vs1, imm
+    my $template = 0b0110001_00000_00000_011_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    my $imm = shift;
+    return ".word ".($template | ($vs1 << 20) | ($imm <<   15) | ($vd << 7))
+}
+
+sub vmv_v_i {
+    # vmv.v.i vd, imm
+    my $template = 0b0101111_00000_00000_011_00000_1010111;
+    my $vd = read_vreg shift;
+    my $imm = shift;
+    return ".word ".($template | ($imm << 15) | ($vd << 7));
+}
+
+sub vmv_v_v {
+    # vmv.v.v vd, vs1
+    my $template = 0b0101111_00000_00000_000_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs1 << 15) | ($vd << 7));
+}
+
+sub vor_vv_v0t {
+    # vor.vv vd, vs2, vs1, v0.t
+    my $template = 0b0010100_00000_00000_000_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vs1 << 15) | ($vd << 7));
+}
+
+sub vse32_v {
+    # vse32.v vd, (rs1)
+    my $template = 0b0000001_00000_00000_110_00000_0100111;
+    my $vd = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vse64_v {
+    # vse64.v vd, (rs1)
+    my $template = 0b0000001_00000_00000_111_00000_0100111;
+    my $vd = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vsetivli__x0_2_e64_m1_ta_ma {
+    # vsetivli x0, 2, e64, m1, ta, ma
+    return ".word 0xcd817057";
+}
+
+sub vsetivli__x0_4_e32_m1_ta_ma {
+    # vsetivli x0, 4, e32, m1, ta, ma
+    return ".word 0xcd027057";
+}
+
+sub vsetivli__x0_4_e64_m1_ta_ma {
+    # vsetivli x0,4,e64,m1,ta,ma
+    return ".word 0xcd827057";
+}
+
+sub vsetivli__x0_8_e32_m1_ta_ma {
+    return ".word 0xcd047057";
+}
+
+sub vslidedown_vi {
+    # vslidedown.vi vd, vs2, uimm
+    my $template = 0b0011111_00000_00000_011_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $uimm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($uimm << 15) | ($vd << 7));
+}
+
+sub vslideup_vi_v0t {
+    # vslideup.vi vd, vs2, uimm, v0.t
+    my $template = 0b0011100_00000_00000_011_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $uimm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($uimm << 15) | ($vd << 7));
+}
+
+sub vslideup_vi {
+    # vslideup.vi vd, vs2, uimm
+    my $template = 0b0011101_00000_00000_011_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $uimm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($uimm << 15) | ($vd << 7));
+}
+
+sub vsll_vi {
+    # vsll.vi vd, vs2, uimm, vm
+    my $template = 0b1001011_00000_00000_011_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $uimm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($uimm << 15) | ($vd << 7));
+}
+
+sub vsrl_vx {
+    # vsrl.vx vd, vs2, rs1
+    my $template = 0b1010001_00000_00000_100_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($vs2 << 20) | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vsse32_v {
+    # vse32.v vs3, (rs1), rs2
+    my $template = 0b0000101_00000_00000_110_00000_0100111;
+    my $vs3 = read_vreg shift;
+    my $rs1 = read_reg shift;
+    my $rs2 = read_reg shift;
+    return ".word ".($template | ($rs2 << 20) | ($rs1 << 15) | ($vs3 << 7));
+}
+
+sub vsse64_v {
+    # vsse64.v vs3, (rs1), rs2
+    my $template = 0b0000101_00000_00000_111_00000_0100111;
+    my $vs3 = read_vreg shift;
+    my $rs1 = read_reg shift;
+    my $rs2 = read_reg shift;
+    return ".word ".($template | ($rs2 << 20) | ($rs1 << 15) | ($vs3 << 7));
+}
+
+sub vxor_vv_v0t {
+    # vxor.vv vd, vs2, vs1, v0.t
+    my $template = 0b0010110_00000_00000_000_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vs1 << 15) | ($vd << 7));
+}
+
+sub vxor_vv {
+    # vxor.vv vd, vs2, vs1
+    my $template = 0b0010111_00000_00000_000_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vs1 << 15) | ($vd << 7));
+}
+
+# Vector crypto instructions
+
+## Zvkb instructions
+
+sub vclmulh_vx {
+    # vclmulh.vx vd, vs2, rs1
+    my $template = 0b0011011_00000_00000_110_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($vs2 << 20) | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vclmul_vx_v0t {
+    # vclmul.vx vd, vs2, rs1, v0.t
+    my $template = 0b0011000_00000_00000_110_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($vs2 << 20) | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vclmul_vx {
+    # vclmul.vx vd, vs2, rs1
+    my $template = 0b0011001_00000_00000_110_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $rs1 = read_reg shift;
+    return ".word ".($template | ($vs2 << 20) | ($rs1 << 15) | ($vd << 7));
+}
+
+sub vrev8_v {
+    # vrev8.v vd, vs2
+    my $template = 0b0100101_00000_01001_010_00000_1010111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+## Zvkg instructions
+
+sub vghsh_vv {
+    # vghsh.vv vd, vs2, vs1
+    my $template = 0b1011001_00000_00000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vs1 << 15) | ($vd << 7));
+}
+
+sub vgmul_vv {
+    # vgmul.vv vd, vs2
+    my $template = 0b1010001_00000_10001_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+## Zvkned instructions
+
+sub vaesdf_vs {
+    # vaesdf.vs vd, vs2
+    my $template = 0b101001_1_00000_00001_010_00000_1110111;
+    my $vd = read_vreg  shift;
+    my $vs2 = read_vreg  shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+sub vaesdm_vs {
+    # vaesdm.vs vd, vs2
+    my $template = 0b101001_1_00000_00000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+sub vaesef_vs {
+    # vaesef.vs vd, vs2
+    my $template = 0b101001_1_00000_00011_010_00000_1110111;
+    my $vd = read_vreg  shift;
+    my $vs2 = read_vreg  shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+sub vaesem_vs {
+    # vaesem.vs vd, vs2
+    my $template = 0b101001_1_00000_00010_010_00000_1110111;
+    my $vd = read_vreg  shift;
+    my $vs2 = read_vreg  shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+sub vaeskf1_vi {
+    # vaeskf1.vi vd, vs2, uimmm
+    my $template = 0b100010_1_00000_00000_010_00000_1110111;
+    my $vd = read_vreg  shift;
+    my $vs2 = read_vreg  shift;
+    my $uimm = shift;
+    return ".word ".($template | ($uimm << 15) | ($vs2 << 20) | ($vd << 7));
+}
+
+sub vaeskf2_vi {
+    # vaeskf2.vi vd, vs2, uimm
+    my $template = 0b101010_1_00000_00000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $uimm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($uimm << 15) | ($vd << 7));
+}
+
+sub vaesz_vs {
+    # vaesz.vs vd, vs2
+    my $template = 0b101001_1_00000_00111_010_00000_1110111;
+    my $vd = read_vreg  shift;
+    my $vs2 = read_vreg  shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+## Zvknha and Zvknhb instructions
+
+sub vsha2ms_vv {
+    # vsha2ms.vv vd, vs2, vs1
+    my $template = 0b1011011_00000_00000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20)| ($vs1 << 15 )| ($vd << 7));
+}
+
+sub vsha2ch_vv {
+    # vsha2ch.vv vd, vs2, vs1
+    my $template = 0b101110_10000_00000_001_00000_01110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20)| ($vs1 << 15 )| ($vd << 7));
+}
+
+sub vsha2cl_vv {
+    # vsha2cl.vv vd, vs2, vs1
+    my $template = 0b101111_10000_00000_001_00000_01110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20)| ($vs1 << 15 )| ($vd << 7));
+}
+
+## Zvksed instructions
+
+sub vsm4k_vi {
+    # vsm4k.vi vd, vs2, uimm
+    my $template = 0b1000011_00000_00000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $uimm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($uimm << 15) | ($vd << 7));
+}
+
+sub vsm4r_vs {
+    # vsm4r.vs vd, vs2
+    my $template = 0b1010011_00000_10000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vd << 7));
+}
+
+## zvksh instructions
+
+sub vsm3c_vi {
+    # vsm3c.vi vd, vs2, uimm
+    my $template = 0b1010111_00000_00000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $uimm = shift;
+    return ".word ".($template | ($vs2 << 20) | ($uimm << 15 ) | ($vd << 7));
+}
+
+sub vsm3me_vv {
+    # vsm3me.vv vd, vs2, vs1
+    my $template = 0b1000001_00000_00000_010_00000_1110111;
+    my $vd = read_vreg shift;
+    my $vs2 = read_vreg shift;
+    my $vs1 = read_vreg shift;
+    return ".word ".($template | ($vs2 << 20) | ($vs1 << 15 ) | ($vd << 7));
+}
+
 1;
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
