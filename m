Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59FBC04A94
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YdLFNoUdoppKeYfFrYyEQ2JZSsoC/BuViREKOsNKc0=; b=esASNWVXBd4RUj
	arS0oIZJthgfmoxmBKcpGGnIPnS+y5m2wbYWBpsqpfLP00OYp6N/lyT7HceEK0P2MNBhIsuNlKoCN
	Bbr6aUr3Vvyn5/c1Y9yy8sOWWhmVdZeuDxifX0gdAsJvZhpgzGfvDzwlsn+CkI36aGbnHl7+MtR1p
	ZFXtEWVMym7nWT359zfExjbyd2UDuzX0uyl0aTIhQ7P9qX3Mjb6tZGdh4q/P+mJIlB05b1XEeFpDQ
	gRp3a4pood6MsWmm0ybsHbK+3G7LCHd+IdRc6uX4qZkCQJODkCo3IZwof0w1KksuKFQuAdltjyJyM
	DxPrSIrWrjUeg0wTFo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGo0-00AELl-01;
	Mon, 03 Jul 2023 10:29:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGnx-00AEIz-1R
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688380154; x=1719916154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlvpH6Xm6+MOzW5Be3nDxaw7VDFR2DWfMxe6iwnHKZg=;
  b=Ifs6FsWgX4TxI/iteko4RkpA4okIclQD6Yssl6ooeBtiXdjnYywn1v/L
   IFe7jb5IqxAyipXg7NqTzU5oNY5USVO4o8akVzD/q4bcXPfZM4J5j6AGT
   JimvhoirSIqkwtQs84cF5jUPV82hTKzwhHq2j2uMHTWpzjr00prHgfZD2
   JXDZzKKlvOkBm5HoUqemwmoxMqnKpCdqhyl6V/CL+GOY47twgBZ563kmo
   ihgRK3YgVtfxCJMRGvdeZAPBlELa2ufotg4qw5ZVwtDn6I4x13jBTJvRu
   ukkuLpk83cFt2qlsXCB/jAlPyp5y9QtVSeOttb974bqxrnQgpbf8pRj6/
   w==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="221754612"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 03:29:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 03:29:00 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 03:28:57 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v3 01/11] RISC-V: Provide a more helpful error message on invalid ISA strings
Date: Mon, 3 Jul 2023 11:27:53 +0100
Message-ID: <20230703-girdle-underling-880f633c4c73@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2842; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+bRFRksq4E/zZsOtWw6wSdHHrAYVmkRy+ubcPZthJh0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmLFq10Cov7dPDi09wCQ+UCrV9yQn/UzzA3/pofq3bpoZaZ 7sTnHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIRnaGf1Y9v3boC+6SM9OuzPq4Kr hpuZ3c3q1LWBLrT5jMmFjNsZbhr4DkgluPooNnHHc/5fAz7cmqpSfu3dz5o3yirMkMtW2Rc1kB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_032913_498227_096FD2C3 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Right now we provide a somewhat unhelpful error message on systems with
invalid error messages, something along the lines of

	CPU with hartid=0 is not available
	------------[ cut here ]------------
	kernel BUG at arch/riscv/kernel/smpboot.c:174!
	Kernel BUG [#1]
	Modules linked in:
	CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00096-ge0097d2c62d5-dirty #1
	Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
	epc : of_parse_and_init_cpus+0x16c/0x16e
	 ra : of_parse_and_init_cpus+0x9a/0x16e
	epc : ffffffff80c04e0a ra : ffffffff80c04d38 sp : ffffffff81603e20
	 gp : ffffffff8182d658 tp : ffffffff81613f80 t0 : 000000000000006e
	 t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff81603e80
	 s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
	 a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
	 a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff816148b0
	 s2 : 0000000000000001 s3 : ffffffff81492a4c s4 : ffffffff81a4b090
	 s5 : ffffffff81506030 s6 : 0000000000000040 s7 : 0000000000000000
	 s8 : 00000000bfb6f046 s9 : 0000000000000001 s10: 0000000000000000
	 s11: 00000000bf389700 t3 : 0000000000000000 t4 : 0000000000000000
	 t5 : ffffffff824dd188 t6 : ffffffff824dd187
	status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
	[<ffffffff80c04e0a>] of_parse_and_init_cpus+0x16c/0x16e
	[<ffffffff80c04c96>] setup_smp+0x1e/0x26
	[<ffffffff80c03ffe>] setup_arch+0x6e/0xb2
	[<ffffffff80c00384>] start_kernel+0x72/0x400
	Code: 80e7 4a00 a603 0009 b795 1097 ffe5 80e7 92c0 9002 (9002) 715d
	---[ end trace 0000000000000000 ]---
	Kernel panic - not syncing: Fatal exception in interrupt

Add a warning for the cases where the ISA string isn't valid.  It's still
above the BUG_ON cut, but hopefully it's at least a bit easier for users.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..3af2d214ce21 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -66,11 +66,15 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		return -ENODEV;
 	}
 
-	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7)) {
+		pr_warn("CPU with hartid=%lu does not support rv32ima", *hart);
 		return -ENODEV;
+	}
 
-	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7)) {
+		pr_warn("CPU with hartid=%lu does not support rv64ima", *hart);
 		return -ENODEV;
+	}
 
 	return 0;
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
