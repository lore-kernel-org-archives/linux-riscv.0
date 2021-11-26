Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50958C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AefxoNBtpDxj/LMykXn88EwxZ+czmokNMCq8T8alfrg=; b=O1Vnb8Z+B4xcKf
	aDVcNjA9jM5EAQECnlQtVWwIm0yGmuQEsy6gt9VSZLSsp4ZRUOsEvDVf4X8wFvPC1ceitJBxSTNDw
	l5lh8xddmVg0h+NPupweSQvtHKlAhI8DemFdzrMutzIrIR4xF7g12jStY8i9KnZc/W2vu3mfmKs5D
	8WajDHAY+yUDANKHIUI2OqCRkD9rqggBwvtzpdM92k2FCce0EMTx7mtJiXo49ABzoWhKFOQdnmmPf
	leN0Q+VRi8NTwF2cz25vln5lOaMF8kJO14FFIHrVOsZGCXWBngun2EbEHviA09KgYgHJecsqdeMiG
	yaq1xBgLM2LLGV2S1Erg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfdG-00BQlo-UG; Fri, 26 Nov 2021 18:07:35 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfaQ-00BPR5-Vw
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 18:04:44 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1AQI4aXJ005325
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 20:04:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1637949871; x=1640541871;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MvanV+rEo5Xp6JFqBDVWF0EkA5TJE46GGGiVMEKsDCs=;
 b=FnOdAaVKWdeWfD32YJZr3dXhwr4GmvkQmb75s8DqlIVzNaxG2U+kBK2wstVT/r24
 qd6LtgsI02hUtMbJbtkA5uxduTycAwZcew7DU4NFeiN3JmF9UYyTdsARDcGAGv8h
 C3pABgRfhwllFY+KFeNSqBaq8LKraZqXjYUP3e63X0iujbodhvDpQXR2UeNk9uvi
 3oVRkMzWx6yBtpaGEcSu1+j5nIYHlY8x3UbZ+SxW75SH16MxM2Ta2dFcsRFd5ZHA
 2PQHCxlmO1GtHcPE8OgrOBMbSNX6mDRsZ5pdQgDPa5faxOwCjHgTj3wdne/Q1ZN7
 XjaBAXfsWon7gHVIWi3zuw==;
X-AuditID: 8b5b014d-9a2477000000460a-a9-61a121afd79c
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 99.14.17930.FA121A16; Fri, 26 Nov 2021 20:04:31 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alex@ghiti.fr>,
 stable@vger.kernel.org
Subject: [PATCH 1/3] riscv: Don't use va_pa_offset on kdump
Date: Fri, 26 Nov 2021 20:04:09 +0200
Message-Id: <20211126180411.187597-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXSHT1dWXe94sJEg7erOSye3fnKarH19yx2
 i8u75rBZbPvcwmbR/O4cu8XLyz3MFm2z+C0WbHzE6MDh8eblSxaPwx1f2D3unZjG6vFw0yUm
 j81L6j0uNV9n9/i8SS6APYrLJiU1J7MstUjfLoEr49cxo4IdIhU7e14wNzBuFehi5OSQEDCR
 2LJlIXMXIxeHkMAxRolry56zQSTcJG7f38kKYrMJaErMv3SQBcQWEXCXWD35DxNIA7PARkaJ
 2+u2MoMkhAWsJa7s/cUEYrMIqEocP3UJrIFXwFzi9ZbPrBBD5SVOLTvIBBEXlDg58wlYDTNQ
 vHnrbOYJjDyzkKRmIUktYGRaxSiQWGasl5lcrJeWX1SSoZdetIkRHHyMvjsYb29+q3eIkYmD
 8RCjBAezkgivc+D8RCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8vHoT4oUE0hNLUrNTUwtSi2Cy
 TBycUg1MER+P/TLYrLphzYub31+Ur9ZWmyknycvUPefvu83mymVrPP8VeLkteGZhWHwmc+6k
 D+0Hp51YfHTGS/n387zN+TbpqqZJLuyv2nPxH/OCy5M3TnbJT3207eQz33M+f6QKYhw51LZ0
 FXgpNorEWap6rowKb38UqMAXni4Rv3dJoVQBX/fMFSUcuYfKc37W2uxTcjc6HvKnz4rjdLUp
 395jejlvTRc8eBj2oEbqwU0m1cunNTqKFNcFHNGZdTuX3UDxTLhV3IGsp59fCS9Pjq/TUM55
 7WO4RbUvcs/pyMUaS+pff1ZfsDokZO/lc7ktsycumMX2j0nM++LyI9sEXz+3Zk6+XbDxs2vO
 sx+6AWwFSizFGYmGWsxFxYkAQfKrE60CAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100439_503446_4F0ADFD5 
X-CRM114-Status: GOOD (  15.21  )
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

On kdump instead of using an intermediate step to relocate the kernel,
that lives in a "control buffer" outside the current kernel's mapping,
we jump to the crash kernel directly by calling riscv_kexec_norelocate().
The current implementation uses va_pa_offset while switching to physical
addressing, however since we moved the kernel outside the linear mapping
this won't work anymore since riscv_kexec_norelocate() is part of the
kernel mapping and we should use kernel_map.va_kernel_pa_offset, and also
take XIP kernel into account.

We don't really need to use va_pa_offset on riscv_kexec_norelocate, we
can just set STVEC to the physical address of the new kernel instead and
let the hart jump to the new kernel on the next instruction after setting
SATP to zero. This fixes kdump and is also simpler/cleaner.

I tested this on the latest qemu and HiFive Unmatched and works as
expected.

v2: I removed the direct jump after setting satp as suggested.

Fixes: 2bfc6cd81bd1 ("riscv: Move kernel mapping outside of linear mapping")

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
Cc: <stable@vger.kernel.org> # 5.13
Cc: <stable@vger.kernel.org> # 5.14
---
 arch/riscv/kernel/kexec_relocate.S | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
index a80b52a74..059c5e216 100644
--- a/arch/riscv/kernel/kexec_relocate.S
+++ b/arch/riscv/kernel/kexec_relocate.S
@@ -159,25 +159,15 @@ SYM_CODE_START(riscv_kexec_norelocate)
 	 * s0: (const) Phys address to jump to
 	 * s1: (const) Phys address of the FDT image
 	 * s2: (const) The hartid of the current hart
-	 * s3: (const) kernel_map.va_pa_offset, used when switching MMU off
 	 */
 	mv	s0, a1
 	mv	s1, a2
 	mv	s2, a3
-	mv	s3, a4
 
 	/* Disable / cleanup interrupts */
 	csrw	CSR_SIE, zero
 	csrw	CSR_SIP, zero
 
-	/* Switch to physical addressing */
-	la	s4, 1f
-	sub	s4, s4, s3
-	csrw	CSR_STVEC, s4
-	csrw	CSR_SATP, zero
-
-.align 2
-1:
 	/* Pass the arguments to the next kernel  / Cleanup*/
 	mv	a0, s2
 	mv	a1, s1
@@ -214,7 +204,15 @@ SYM_CODE_START(riscv_kexec_norelocate)
 	csrw	CSR_SCAUSE, zero
 	csrw	CSR_SSCRATCH, zero
 
-	jalr	zero, a2, 0
+	/*
+	 * Switch to physical addressing
+	 * This will also trigger a jump to CSR_STVEC
+	 * which in this case is the address of the new
+	 * kernel.
+	 */
+	csrw	CSR_STVEC, a2
+	csrw	CSR_SATP, zero
+
 SYM_CODE_END(riscv_kexec_norelocate)
 
 .section ".rodata"
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
