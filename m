Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A34EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YtjQHhLFZSnRT11F1HOZv6WzO7CYJ8TSs0s1zrxLHsY=; b=H9Alu8EeNIrJSn
	k5AH22D8o241yLLFbCsiB8iTe6og72pxdym4XQBco4tdduliCMfCtE/IX98RkhkdCtPIFdYeCbGQr
	iB7z0xCzLQmSJ/S507oitY+WHbtD7AxS1zbiM+A06/AtB+1/GyaimsyPfdzEjGA+VAkUXkGRZb+HL
	z1mjLd81+rRv5wdKXWR/1OWWqSga0muOKxqO6dBp1yn7Y7cLWVPyBMgMDK7HkFWpyO+rFIqnIAbh2
	RougfKHR4JJq+EmQehULxCV/1XoAlngigmh79eV8Rv5lAVdNhRYUlUVpopMiMGzRUeCi1opSFnQpY
	I1+zNc6t6VEuiqxDb2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEpv0-000y4S-0I;
	Thu, 29 Jun 2023 11:34:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEpux-000y3h-0R
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 11:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688038470; x=1719574470;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TIXlb77Vldu/k4xXf2Rn1EKOVFLkgolbpbynCDAhAXE=;
  b=GFZPGhPz1NzMqukod56OrXFD+96iwKlftGzu+OlcS/tuTfDECiOv/Wsr
   OQ6lBxO9DAH/LWq8s6q4b/q8at3dv2WxgqMz9K70wTD5hoRYmuDw6LAji
   2TocV9WfZEgYMtbC28dMRFM0QeBRqigzC6ghZIWlpOIFK3V7+2Cz1abHG
   m7UqS6fQH/cFJL6a3ksMZaV/m60FYssJ0reJfUU5zWHUFDjd9vMxiI3M6
   FZZKwheEtKK9JDsbOYEWu0Rdh1gH0qJBRM+oc9cnSsuOvZicY2l/Axj5f
   ks2eGIJaKQ5eilB/iJjRaUjJVbWx3gL2nLcDDepAijKqGtLrgPzKRFi56
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="232863351"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 04:34:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 04:34:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 04:34:19 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1] RISC-V: drop error print from riscv_hartid_to_cpuid()
Date: Thu, 29 Jun 2023 12:33:34 +0100
Message-ID: <20230629-paternity-grafted-b901b76d04a0@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TIXlb77Vldu/k4xXf2Rn1EKOVFLkgolbpbynCDAhAXE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzc7g/+9/KSeKQE4wvvHjmyA4nm5QFEUcCs7Z9/GBwwH1L Q9S+jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEwkJorhDydTdOF2oybZTB//0zP8d2 xau+AAtwq7raS45n09L9snmxgZzk5k8Ph4ye7FYU+DCQsrmqyT0h508Z36I3XsYbj60wk/mAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_043431_298552_FA0FCB0C 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: conor@kernel.org, conor.dooley@microchip.com, Paul
 Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As of commit 2ac874343749 ("RISC-V: split early & late of_node to
hartid mapping") my CI complains about newly added pr_err() messages
during boot, for example:
[    0.000000] Couldn't find cpu id for hartid [0]
[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller

Before the split, riscv_of_processor_hartid() contained a check for
whether the cpu was "available", before calling riscv_hartid_to_cpuid(),
but after the split riscv_of_processor_hartid() can be called for cpus
that are disabled.

Most callers of riscv_hartid_to_cpuid() already report custom errors
where it falls, making this print superfluous in those case. In other
places, the print adds nothing - see riscv_intc_init() for example.

Fixes: 2ac874343749 ("RISC-V: split early & late of_node to hartid mapping")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Sunil, the acpi user of this function I was unclear about. Could you
please take a look and see if disabling this print is okay there, or if I
should add a localised error print on failure?

CC: Sunil V L <sunilvl@ventanamicro.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 23e533766a49..85bbce0f758c 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -58,7 +58,6 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 		if (cpuid_to_hartid_map(i) == hartid)
 			return i;
 
-	pr_err("Couldn't find cpu id for hartid [%lu]\n", hartid);
 	return -ENOENT;
 }
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
