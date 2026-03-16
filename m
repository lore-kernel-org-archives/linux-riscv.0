Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB44D58B07
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEcWVCjGp8ebJ/PRoUnsZmZvFRPrEtkBKHvvguZVW0c=; b=w/VmuQUt9fusgs
	tCSSYgGH9Ht8KTYgvR/S1wqfgj2jYPcSmrKnTwPe0vZhzizl9KjJWY62/OLoVQiiL3qj0ao90/S1U
	IGMMjCQ8dBlv8NMhManSR8/sffsOQk8ErlneEZuW1h+VqNk2Va/Qlwr1TG0yM7vUpCQ2i2R3qaZ+X
	GH3IcaoB13Q6sxML/N8zaimFkkI+1pdkeJKguPsu++F53Hd0VjQOBiw/W0gtFOCDz489cUUR4VNi4
	qIutFGVDNjEhSJQT26skB330gl56B5Jlwi41g57e75ddGDb0kTScDJc+pscc9g2SMQIH26za5GhFg
	jJx/WobCjZDYna5Jli4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pf-00000003vHI-3Hgu;
	Mon, 16 Mar 2026 12:14:03 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pc-00000003vED-3Uns;
	Mon, 16 Mar 2026 12:14:02 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id 98A1E20B6F01;
	Mon, 16 Mar 2026 05:13:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 98A1E20B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663240;
	bh=1tIeJ9SsYHVdstCDU1TnP5bpNkiYnZ9fn1VYje8AQcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDcEUB6im4iHNa8UvsB4S4VtwoaL8MA54GDurzLy2wS1TLb6GLd7swVaNI/GDOj3O
	 DgRGqXyFlAmfNAeDLRqe/DAoy5Ya+8ntTJ1+stBVGLZAFrGKlkQUTRptJ2qkiwZjVv
	 6HcItX5fK4bfExTmAX7cU7AX7sm8X1Uy4UYy1+1s=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	ssengar@linux.microsoft.com,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 09/11] Drivers: hv: mshv_vtl: Let userspace do VSM configuration
Date: Mon, 16 Mar 2026 12:12:39 +0000
Message-ID: <20260316121241.910764-10-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051400_896725_16D4A8B2 
X-CRM114-Status: GOOD (  12.23  )
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

The kernel currently sets the VSM configuration register, thereby
imposing certain VSM configuration on the userspace (OpenVMM).

The userspace (OpenVMM) has the capability to configure this register,
and it is already doing it using the generic hypercall interface.
The configuration can vary based on the use case or architectures, so
let userspace take care of configuring it and remove this logic in the
kernel driver.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/mshv_vtl_main.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index c79d24317b8e..4c9ae65ad3e8 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -222,30 +222,6 @@ static int mshv_vtl_get_vsm_regs(void)
 	return ret;
 }
 
-static int mshv_vtl_configure_vsm_partition(struct device *dev)
-{
-	union hv_register_vsm_partition_config config;
-	struct hv_register_assoc reg_assoc;
-
-	config.as_uint64 = 0;
-	config.default_vtl_protection_mask = HV_MAP_GPA_PERMISSIONS_MASK;
-	config.enable_vtl_protection = 1;
-	config.zero_memory_on_reset = 1;
-	config.intercept_vp_startup = 1;
-	config.intercept_cpuid_unimplemented = 1;
-
-	if (mshv_vsm_capabilities.intercept_page_available) {
-		dev_dbg(dev, "using intercept page\n");
-		config.intercept_page = 1;
-	}
-
-	reg_assoc.name = HV_REGISTER_VSM_PARTITION_CONFIG;
-	reg_assoc.value.reg64 = config.as_uint64;
-
-	return hv_call_set_vp_registers(HV_VP_INDEX_SELF, HV_PARTITION_ID_SELF,
-				       1, input_vtl_zero, &reg_assoc);
-}
-
 static void mshv_vtl_vmbus_isr(void)
 {
 	struct hv_per_cpu_context *per_cpu;
@@ -1168,11 +1144,6 @@ static int __init mshv_vtl_init(void)
 		ret = -ENODEV;
 		goto free_dev;
 	}
-	if (mshv_vtl_configure_vsm_partition(dev)) {
-		dev_emerg(dev, "VSM configuration failed !!\n");
-		ret = -ENODEV;
-		goto free_dev;
-	}
 
 	mshv_vtl_return_call_init(mshv_vsm_page_offsets.vtl_return_offset);
 	ret = hv_vtl_setup_synic();
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
