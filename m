Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABE3C83005
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W56yAu/LVRqJ7nsl0qpWiYqy5l22GlKfn5QX0vKts5w=; b=hTXsEyFUxkDuyW
	LvrT5qMALYnvKRX22EqkVstXFMVOEAVO0sSrfg/A0OVJFTGFQKhvotO9SLCi2C/L9bmX+LGE85sJb
	3K0OpCG1qJbOwULP+hmmpTkoGk6c6uDlXq9LGglqpRu9PVOQJpVkZ7EIMW6w0zemjXk2uTIDdA+pV
	ZM/WK0Xijw4vaIspp4KEa9cqvOztZYvH+b/g7A2eWrqfx9spzI6rXpnHo5kpqBDc96TfVWKtl9OKg
	5F704Nkh8EudfbB4zXEJsVA8lh3FBX59au02vRKBwKaB/ERtP1EJUIevMET5b404C2LQRuJA/QnG0
	vBp77vz7pgnlu3pk21sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zmD-0077tk-1v;
	Wed, 07 Jun 2023 20:29:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zmA-0077rC-0q
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:29:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8A0C644B0;
	Wed,  7 Jun 2023 20:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E565CC4339B;
	Wed,  7 Jun 2023 20:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169741;
	bh=9oebp7azzGjLgz0ypSgYRXS/QfAFTsMr5qzXixfR5fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xn9XhSOY0lxzKI2YpbBGSwRxnCMyzAccwqx1wVCxlJiPCma0RrclvBlI8ykecj1Ca
	 rsmK/oj2CAYrxMg0t9gqjJpovCMqD7WbxximgFi2qF79R0y6yl1ml4ZWWGzuAWk13r
	 mvua4QmR9DQoLwTtIlnDLHjdPPAhuSlx1cuk1SdvXjRESGi11g9ghHKfbZIci7sbkD
	 3vE6uU/hJ3gvIb1zj6F4O+V1xZCLGL2DN1KkipsPo3d7r0TokR0Ynah/cHJAxYTJIO
	 wfVO+SAtC/FbgU2pHswZZ4Xknv4vqVHsHNaOtf5E1ImEvrwJjWOtCt9F6szJ8NIyBo
	 YCkXNFYW0wOKg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 7/7] RISC-V: always report presence of extensions formerly part of the base ISA
Date: Wed,  7 Jun 2023 21:28:31 +0100
Message-Id: <20230607-nest-collision-5796b6be8be6@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=KitXjnHxXOis6xsSJvnLbEG72mCiB4pyRS+qy+W2cAY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNL7Iuc69dHpYlr3xOmdMr1nSbUM0l1oYtAYUhk65sU BT56H25o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZv4qRYVdaX+iZ4s5lFbs2 xn44eeIhr2Hwj5cqzAcNjRNMt5Y1nGJk2FLax2Ru9VrtZob4jr38WyWvehXLpCvf0K40Ksw7OIW JBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132902_381496_6BB91F54 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Of these four extensions, two were part of the base ISA when the port was
written and are required by the kernel. The other two are implied when
`i` is in riscv,isa on DT systems.
There's not much that userspace can do with this extra information, but
there is no harm in reporting an ISA string that closer resembles the
current versions of the specifications either.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Intentionally avoided your conditional tag here Drew.
---
 arch/riscv/include/asm/hwcap.h |  4 ++++
 arch/riscv/kernel/cpu.c        |  4 ++++
 arch/riscv/kernel/cpufeature.c | 17 +++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e0c40a4c63d5..e0eb9ad06805 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -46,6 +46,10 @@
 #define RISCV_ISA_EXT_ZICBOZ		34
 #define RISCV_ISA_EXT_SMAIA		35
 #define RISCV_ISA_EXT_SSAIA		36
+#define RISCV_ISA_EXT_ZICNTR		37
+#define RISCV_ISA_EXT_ZICSR		38
+#define RISCV_ISA_EXT_ZIFENCEI		39
+#define RISCV_ISA_EXT_ZIHPM		40
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index dfb4a2a61050..6aea6412cf65 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -208,7 +208,11 @@ arch_initcall(riscv_cpuinfo_init);
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
+	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 84dc44a3e6e5..d21f7e8a33ef 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -311,6 +311,23 @@ void __init riscv_fill_hwcap(void)
 #undef SET_ISA_EXT_MAP
 		}
 
+		/*
+		 * Linux requires the following extensions, so we may as well
+		 * always set them.
+		 */
+		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
+		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
+
+		/*
+		 * These ones were as they were part of the base ISA when the
+		 * port & dt-bindings were upstreamed, and so can be set
+		 * unconditionally where `i` is in riscv,isa on DT systems.
+		 */
+		if (acpi_disabled) {
+			set_bit(RISCV_ISA_EXT_ZICNTR, this_isa);
+			set_bit(RISCV_ISA_EXT_ZIHPM, this_isa);
+		}
+
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
