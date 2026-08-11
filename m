Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A30C5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tstMbLPxXtttEfGx9X99ZkI27F6qMw3RmwymBbsRxqU=; b=NV5ScBFjgLUe4x
	uEgRNHlKBg5Qz96vTi+3wiSRFUC4wharB5C74kTeV4Ks72xnVhE3jX72h1DDW3/K6jZc370pV/gOE
	aD8vnMFakFjWXUKkQvazdX2v1Us2H/hQb7kJyyl4W0HzOrdFP0T30w/Q1mczSPKBdG+aLPhrUal8b
	6KkoD9bDuElLsHG+wxjTRrUcFt6SXdLwFXJHusw9IGBaX8zex4OQCk86lJu3z7SxmohmAT2xrFliD
	NSux08SSUS3+Lrl2q7Oyi4tLaPy9DX3ybh1grO5cx4ke6Fq69azL+hcD2ooBSfau8rZBNFnpU15q8
	l6J2xl9IchKJTQLzY67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtljX-0000000E2IF-2ya3;
	Tue, 11 Aug 2026 12:37:31 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtljU-0000000E2Gm-3dKw
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 12:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786451811;
	bh=5p2pm9Jm0AFkA3Cv7lfCZGznIrlmzdC8UCeNECr1A+M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=penboPlpom5BeaBCWIcgoh0epe2gwf+/lLVq+0G8Lniy4X4MGY8c/+SKKI5OLIAXG
	 NYJHBIiWtkY1Ui1d7hS4mzq/MiC1REyfU58WFig3f/lg9LmFO9hAUFR2ECNgSL72R1
	 5BzE3IxBRa3XHKmlbDIwWb+MrUSBxzwrk1Vh2OQE=
X-QQ-mid: zesmtpsz2t1786451804t71d80de9
X-QQ-Originating-IP: lBUhuCmLbpREMH5EtfWFQKA2MDAN7ImFN6rulf8vBkk=
Received: from [127.0.1.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 20:36:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5807538243920040017
EX-QQ-RecipientCnt: 8
From: Peixin Xie <peixin.xie@linux.spacemit.com>
Date: Tue, 11 Aug 2026 20:36:37 +0800
Subject: [PATCH] ACPI: scan: Drop power resource references for deferred
 devices
MIME-Version: 1.0
Message-Id: <20260811-acpi-power-resource-ref-fix-v1-1-828f1c383831@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTtJ26CCVzEuSp3quKDNDAgJ4
 e6OuntfXvJvoCRMCpdmA6E3K5fR4A8NpGccH4R8N0Nw4eQ67zGmyljLQoJCWmZJZCNj5hVDju2
 57/KxdwNYodrB669+vf2t8/CiNH2TsO8fMEPaPH8AAAA=
X-Change-ID: 20260811-acpi-power-resource-ref-fix-2fa4798f590b
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Peixin Xie <peixin.xie@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786451803; l=3534;
 i=peixin.xie@linux.spacemit.com; s=20260727; h=from:subject:message-id;
 bh=PRdKIAOvw5s3CXBAfCHJZ/FPXXdZDkOZMZRgA99hHGo=;
 b=KCyo59TT+gLQT3m6fLfdzwf2cknfd3UWveLQW3AA1yXOa+u/j83cdFr0El6F+8ZL7YOKA9zBm
 G4od29h5SEpDwCPwH/RD5IIqaaZU6IOmIs4lJx3ENsKOdgvi8D9jH/C
X-Developer-Key: i=peixin.xie@linux.spacemit.com; a=ed25519;
 pk=jczO0FmEQZBoClfXslkwCsHKDmSRchQ1hQr8W7yiiXg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MwR9jyT/7fHBToAzmrtpiNFfV0iiVHDFAflihfA53OF3z9rdXnsrYVNB
	XqS1VOLnLfk7lNv6pWQT99WRaS1rR5B8GeMCRRFqP/TkyNCA3J651T6AkTtbEfilDeMYW1i
	jH2t2uIHfijYImC7S8qvrgbFKwWFHS3PL1cgWCUvkl33Gtn3kSLAgqfGGhQdkXwXSdtkN7V
	tdqbA+hXrbrQ0VbyCRJYFszcCwWj70qwUVvjpnpsHnGpaLVq+Xw6LzKB1yziqhckPWdBbx8
	Z3g/IlK0Ye3G2gcPehk7iX1K1XGG3pk7udwpOx+zdg9utiRa2rUAVtSVJVcwVRnkyjwurwg
	Ujh7myF3W9zrueuaitemG7luDA2A0EY4yd+VCSBdcOoYEvoGSxzJVI/Fn9lBYzEmCqKX5Hx
	dxJO/CfaBNjnbPIJlw5b+64iIIWpmRRL5r13xooH6kDCsQgYh2xX3Isb3UZ2b3abGNpyr1C
	iB0WWjT8SjLsTLjOZVRkL7MBETd1Z3m+ezdKcVxYChLZZZiccLnBTZDIvzB+3j/MajFUHSr
	0Rzf4ElQtDvdcmeuwozqtfXepupMZnMCiMFBE+W1QBpDq6NH2KgfKxhZtwlS/bpwVAB1H8C
	NgPtVZVNBF2kqC6JfsI3Dwu0ND4n9I2dU9a1B/SHlD/OHiEXxBXAuag78swCL32tXChnUp9
	gCE1BSzwnqE0NJViPermcCS8cMjbz1XYN0Sf1cDehoFIi3hcxjNbbX8JG/O9SHwWfRq+PtT
	k2uoDr2DDgSQT87En8U+jBM1/YTnlbPq7FBLcRvmeIIe1qV2JVntWyYbszMRdOLNC0Dc2bj
	StkklqLJ59KQFVEMYvrR6xM8G/nuv1gmTE9chfc61juQxsvu4B8Eele0yPLa48gevIUohIr
	7y+j7rXQ3EEPdXIj4o6PB4fck4aebbEZp2Ov7+YJ6j7tiJNO44s2UHCU7dpcunI2+nftIFZ
	ArYYjEyJ+1JC0FnVVlmCMCROO9pik8YTCN+Uhw7YPFYcXb/aW4/iXYVhUT7/dOv/OwENhGy
	sTdCQ2XP5/bTCALKFpyibmdC7CGcWjjZ1jbXl4R5zT0vZIu/mmBcD6t+Ui9g9zTl7afMgtF
	BzUhqMLawEb98s6BzVIewyGjsx1Tv4fzBYGAR3zu8IO7+opWr4tHUGfvgZ+cSnK+512Ohlf
	mgVe
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_053729_777608_41A8E0E9 
X-CRM114-Status: GOOD (  12.25  )
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

acpi_bus_get_power_flags() initializes the device power state and takes
references to any power resources required by that state.

If the device is not ready for enumeration, acpi_bus_attach() parks it
and clears power_manageable without dropping those references. When the
dependency is later satisfied, power initialization takes the references
again. The additional references prevent the resources from being
turned off when the device enters D3.

Transition the device to D3cold before clearing power_manageable to drop
the references acquired during initial power state initialization.

This is particularly easy to trigger on RISC-V, where dependencies on
interrupt controllers are derived automatically from interrupt resources.

Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
---
This issue was reproduced on a SpacemiT K3 RISC-V platform. The affected
device uses a power resource through _PR0 and has an automatically derived
dependency on its interrupt controller.

Before the change, the initial power initialization acquires a power
resource reference. The device is then deferred, but that reference is not
dropped. When the dependency becomes available, power initialization
acquires another reference. Consequently, entering D3 only drops the
reference count from 2 to 1 and _OFF is not evaluated:

  [    0.403217] ACPI: \_SB_.USBD.PDPR: ACPI: PM: Power resource is on
  [    0.409393] ACPI: \_SB_.USBD.PDPR: New power resource
  [    0.419165] ACPI Debug:  "ACPI USBD: entering PDPR._ON"
  [    0.424495] ACPI: \_SB_.USBD.PDPR: ACPI: PM: Power resource turned on
  [    0.431036] ACPI Debug:  "ACPI USBD: entering _PS0"
  [    0.790826] ACPI: \_SB_.USBD.PDPR: ACPI: PM: Power resource already on
  [    0.801777] ACPI Debug:  "ACPI USBD: entering _PS0"
  [    0.995285] ACPI Debug:  "ACPI USBD: entering _PS3"
  [    1.005550] ACPI: \_SB_.USBD.PDPR: ACPI: PM: Power resource still in use

After the change, the reference acquired before deferred enumeration is
dropped, and _OFF is evaluated both when the device is deferred and when
it later enters D3:

  [    0.340111] ACPI Debug:  "ACPI USBD: entering PDPR._ON"
  [    0.345459] ACPI Debug:  "ACPI USBD: entering _PS0"
  [    0.350532] ACPI Debug:  "ACPI USBD: entering PDPR._OFF"
  [    0.742054] ACPI Debug:  "ACPI USBD: entering PDPR._ON"
  [    0.747282] ACPI Debug:  "ACPI USBD: entering _PS0"
  [    0.758664] ACPI Debug:  "ACPI USBD: entering _PS3"
  [    0.768959] ACPI Debug:  "ACPI USBD: entering PDPR._OFF"
---
 drivers/acpi/scan.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 9a7ac2eb9ce0..7a8404719fa1 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2350,6 +2350,11 @@ static int acpi_bus_attach(struct acpi_device *device, void *first_pass)
 	acpi_bus_get_status(device);
 	/* Skip devices that are not ready for enumeration (e.g. not present) */
 	if (!acpi_dev_ready_for_enumeration(device)) {
+		/*
+		 * Drop power resource references acquired during initial
+		 * power state initialization before parking the device.
+		 */
+		acpi_power_transition(device, ACPI_STATE_D3_COLD);
 		device->flags.initialized = false;
 		acpi_device_clear_enumerated(device);
 		device->flags.power_manageable = 0;

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260811-acpi-power-resource-ref-fix-2fa4798f590b

Best regards,
--  
Peixin Xie <peixin.xie@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
