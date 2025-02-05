Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34953C02198
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqNUSlb+BPRIZkIJjlFhD7BEsiScfrZfguvQd4weanU=; b=bwk11joS3fkaxA
	8Tp5VTyYZf3KrF0LXYVzZVcBn0MJ21SYm+V/Qi2E8pMIeX4ruJsdDsVkAhUu+q9dxikXB+3A6RbJE
	7rlxfYwFMngk9BDNNpiml9ffByEdwP7zz1Zka7Yogmz4yKckjtNhGc/AkbcUzalkT4NHGJv1brLUw
	Vq7CfR5w3KfmWxY/QnyC6P7ApdnhEdhTHqkjzAGMpj5Ea0woldRZQLbHzNZvy9p4RdtlWTy6MI7eK
	o/DDWmM0gw7ekbRCkUmVMArIz5LIunqCwGkzRer5Z0/UHoBc3tmaCthcv0zf4pVJeE4aM2D4gNU1q
	BnANmSpHKvNlpRIqcLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjF1-000000046IC-39uR;
	Wed, 05 Feb 2025 17:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhwx-00000003ugM-2UD5
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YI4y6597fvQCIn2XVb5vDsJ9QdpfqiowO6Z3p3Hfl4k=; b=oyjq7BsagdFAQudJ/08+OjS2ll
	W7ZG5Z56eMAQGNUFUf1xlr2DTYBjj5smWzAKEzBopr8Iu63zJ0gOToJdKADkabsi/+5qPKEKloeZp
	eBl0vbgKRZSYQ2BGqMrKoPdgEU+bTlVFBM1ZfHhzO/Tyz4uSySlvXyknZVL3SUqxmL0v9f6ND3Szq
	MdbW/UhaloxPPdYM47bpWa+K9TuQN7z+tL5WJWBbXtffGB5O5KCuM1r5vhHw0jTKRXZAOuGU0Uwcl
	/ChYHorg/vXbVW/8oNSxQXuV+c194QPYlB/RE0U4i1d7qkH48zc4KIza93vcXLyHRDLMehb3YFsSU
	82FMlxow==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhwu-0000000Ggoz-2Nvd
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:08:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 486145C6BF7;
	Wed,  5 Feb 2025 16:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B65C4CEE2;
	Wed,  5 Feb 2025 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771702;
	bh=OpUsCuGAiwhWFhUg4CwPzoYyxVGCg38PNLAFcvasv7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BDRsHNiCJoZiVN8vwgR3TrhOJz4DqmtW3dWw4/MRM1ScVYLyQKjfPH9u3N8y6RGlG
	 pvj8AaBL3tnzV9A0M1r8UdXCOt1Coc7Kn5uksI/Cd1C0KAGjlx0CiYcMou+wTbRRLu
	 +vpeNM51Vle7b/+V5FO7adR+/YNr10TeivCEVn49Id4iWEWux1UwKTu6a26FU4lA6p
	 XA5Za+62i8BLBWOPyU6XE8CB7xnel5Z/gvuah1qp7qvutoEreCxLc1oQA+NUNMTqZ1
	 TH5RzD61Lnl33/N1sv2oT4sOG5W7f7Bl+7lThubaox5qLJwJVFX1IrCqEAKKjltgNr
	 XvGqdCl/qThoQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] RISC-V: add f & d extension validation checks
Date: Wed,  5 Feb 2025 16:05:09 +0000
Message-ID: <20250205-stifle-remake-4e497e96fd66@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=e5M7hBrbniSsnE0QrYa2OQIBkQoeZwSnzZ40MTiuFZQ=; b=kA0DAAgWeLQxh6CCYtIByyZiAGejjDyjl+eX1rBJbBES97QQk5NiPvQsNKTteY0c1eWQ28q6K Ih1BAAWCAAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmejjDwACgkQeLQxh6CCYtK9vAEAxN8h myRDv/UodgzN2EOsJGsn3+Gil3P8JlhN9YrM8EAA/3ikXzZK0qHHLekERtXLzMqq4M6Blg1zQRE VVJE0RvkM
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160825_004772_EE953465 
X-CRM114-Status: GOOD (  12.42  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Using Clement's new validation callbacks, support checking that
dependencies have been satisfied for the floating point extensions.

The check for "d" might be slightly confusingly shorter than that of "f",
despite "d" depending on "f". This is because the requirement that a
hart supporting double precision must also support single precision,
should be validated by dt-bindings etc, not the kernel but lack of
support for single precision only is a limitation of the kernel.

Since vector will now be disabled proactively, there's no need to clear
the bit in elf_hwcap in riscv_fill_hwcap() any longer.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1c148ecea612..ad4fbaa4ff0d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -109,6 +109,29 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
+		pr_warn_once("This kernel does not support systems with F but not D\n");
+		return -EINVAL;
+	}
+
+	if (!IS_ENABLED(CONFIG_FPU))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_ext_d_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_FPU))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data *data,
 				       const unsigned long *isa_bitmap)
 {
@@ -368,8 +391,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
 	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
 	__RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
-	__RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
-	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
