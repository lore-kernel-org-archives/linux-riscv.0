Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5649DF589B0
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFRyWfr4Ha9z3RnJBPQAkREJcLBW9MdgFSIoCjl9Z9Y=; b=XOVVIfiEM4clY3
	UHNjbBz90ANiMMP9ba2ql7ieRDOzzSCcTRSUyjAa6FydHZYH4uGBpDUMdiawsWUJJhy3Siso1p++e
	HPToO8RZ9SNebL79WSeeJM/S+5O081xCMbqUnZ+kEy/VrMXfzRYJck8hR7TaP8k4icAUpYYE9E7Q8
	JNGzOnotXwsNQewz7ieCtFU8QAo9n6kxzIjZ15cG2oZctFWx8WH4XYKkkHfGGsbnI3IEqWJdsXU6O
	L14gD8IJCbVrC3qMSYneu3TIro8jBCGGIIb2EQd/UA66G2tTXo+00j3Hjdwr4v74mqUBKLlPTFhAb
	+08UKYYZcQVrkbbDJqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPb-0000000Berx-32Ue;
	Thu, 23 Apr 2026 12:44:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPZ-0000000Beot-2rgT;
	Thu, 23 Apr 2026 12:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KqEEuEXQvpD/kvIiGjagKYi0LOOzLGoRJMfm2FtbD3c=; b=fueYgY70M0Lr+C3f6brJTIVOls
	87R0F6k5272uuByhuh5cLUD4mZGWIDiLP+FVyf4PM7pZeh3H5Q2gX1Q2bvPxKceKkGI1Npn4/pUTl
	skJcq3ijV7l707gTIV8nDHETHw00kzrklPIN1Lyjijn4zMMLtsKbIDfQp8s/NdpdgPBu4zseRge+O
	Nkr5I+jiDQJVrST7r4my96+Ka/uJKTL4ser1XJsFy504K/TrImk2OdlH6ec7QR6KNrkyzaStCefQr
	LFx/oPLzZWZbLH9Is2zqeoZRhMycozs8lRGa8nMDtF3UHo6deqialcFHfzyUNZGCXG92dus59H+9Q
	iLp1KvFQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPM-0000000D3Hi-2tcn;
	Thu, 23 Apr 2026 12:44:04 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id EF51020B716B;
	Thu, 23 Apr 2026 05:43:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EF51020B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948232;
	bh=KqEEuEXQvpD/kvIiGjagKYi0LOOzLGoRJMfm2FtbD3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YxO7hPzNELzGH9P0Z2ujovLhGRHcJDfzVksL8WlejF6Q0UKhR2rFbwJGoIu8dXiV2
	 MYu+15iX7h+FJfSOE3IiGnlOzUBYnjy3nkG/aE/HMExXqJdFMKYcIjIOfsVZ9M6lw2
	 YyVElBj/tFqH5GtAW4RPqFMZ6+qEIS6LP4RrqOH4=
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 11/15] mshv_vtl: Let userspace do VSM configuration
Date: Thu, 23 Apr 2026 12:42:01 +0000
Message-ID: <20260423124206.2410879-12-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134353_076395_91D322C1 
X-CRM114-Status: GOOD (  12.14  )
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
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Roman Kisel <vdso@mailbox.org>
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
