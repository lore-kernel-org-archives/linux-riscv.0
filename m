Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D715FC617E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dn9lGiICek/+uUfKubw1op4BExfOFrPaYaPjAFepeYg=; b=xHCf5noZO+iljk
	ZDfAhRQt0dpQo2EQzkChflZtZ1gWf2GvvzfBdaCxUciBOESFaGlNDNDplAh7ZmgtibgvtjBQGp/d3
	wsw4kzsQgDJwWbAsAwJdX3atj1m44cKODwrhvwRX9PnNR3Jh/8WFwhoMRxiSRh+OQaA19LlxHglS5
	HVJb6zbe53vzF48V7ISeIl8ERDo02zDO0+ddaltAzjbTPL5ja4Vmm8cd9phnOPwqmZJx6D4sjlOcp
	xs4ahz8ELJcRU03YTNItROwYd5YPmACl5gk++5Vz64yc7Iiwze3tDuHMVDajoiJeOCqmiC6ZBbj8H
	DobzvJKGop7AZp7R5Dvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Uc-00000009QyE-2sKX;
	Sat, 03 Jan 2026 15:24:38 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Ub-00000009Qvq-03i2
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:24:38 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so13942857a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767453876; x=1768058676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9tqN72DnRW3gbfss4TAn1MPl/pI0d3sx5WMZWESXiU=;
        b=HGOywvYx/jWil1TJGfm7H1q7DiLTX0UFzObzE2csPaZxi+GA5ou08KtSIujRmoQrwt
         GfAXe3+g2Z876TPMFNatO8vTMBrT0mLQxXSYHHjzWx5OzdL/Emu3nQ0vV0kakvoudjvR
         V2lRRkaumprY8tT6TnVg8tKvOXV2b/U0vwq99KnSLlQWdi+zmPX8nW9RZ+nQvFwA8Xit
         z9Aqn1g2PKVpNPdqt4MAJ6dA6h50pijCzb2+0i3fZe5TSxUdK38IAEu9dFB4xPImuJeW
         9IGomcGyGnT1l+GNoEBdpVhGzoAxY1ZuW2hFCtkeZAH6OZ22cKXdC8UFnGjpMUph0boq
         7Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767453876; x=1768058676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N9tqN72DnRW3gbfss4TAn1MPl/pI0d3sx5WMZWESXiU=;
        b=FwZNM572L3rbAzTTQ25hvC6NUNemwKlbp+PdOpr53eeS6SN+Ci4J0fMjrPwzSM9ZGP
         lm6UqG/lEtBTcF3Ih1XfHV/Ep9xgcTKiEp44rntTXOFMXl68VMnkq6/p3QH9PS7XEHJW
         AR0rvishNIp4UHZ177MKsF1yjyd4KaPr9kRgXcJPSYoI1qTY9QRyPHoRY1BMSC1HA/M8
         ZJcwleTm5z9RFh3d53r8Kd+ikXcgfET9fZQjJHrSVP/LgfYvoIcZ1SzXMrUgfRe4UCf5
         Lgy6l92JoZDjqVQsnKfoYSZuT0jJSuR6bdg4gOnR/LDs2Ywj1l38/7rRg4x+S/DPIem4
         5VPA==
X-Forwarded-Encrypted: i=1; AJvYcCW5zdJyftUDTkbNDsbDmXAO/2g3NFHZScxyKDrK+ya3eXmkPzW4Qkc0IZnxtOOHuOaQYuk4pxCeaB4aBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0us89RK3ZTjjOwIJAePd11/KKNUNrn1NLIn37PIo9eHoXLE9c
	NOUab8mVcvqIBXQNEkMho0zAi3/w7dRiBBGjpoEKOzJnrG/WV/VPCiyi
X-Gm-Gg: AY/fxX7ZxDIO6PaaSq5ZS2W7BrfgTQSq6YHlSETJj3G95u/37dJchm4HhqRhl9zS422
	qvsCtG3IsUMTbkqvElXh4FiYzzDU59xsjgH83e2D98C5BSw7dI6Ur/JrvTOpk6v89NyIvrF3BZ4
	3qxhNDytFYDMjuACMxF83ss+lnEYmjq5/DtHH85HyeP5anCI1zdJTJHbGDidLJljGjdcZR2sqp0
	WteQNb1WQoSZbGuDox/DbsOJWnVHGoNwqWqVXSP5hwwJrq3SPhyyK3/sqZzT57NodYa4G6BYHEs
	OIH2Qrth62yPNo7fva+sbQpCP63qa2VqOwWmkijb2uN7xiNmiGhJwOxi6S9rMFQ3qmNVwkBGnT1
	GJeuMMNZSoqSjjM/jfyV1Dz6bVthqjG3gju4+Pet8/WewS2HYez467zjK+Ty6FCVBfKSXn8F9AP
	TFFuo8vxIdSvVyxkcvKJu0vtjjTIv8F8ixDFlumqePVmOaRdyOTkFb6MPx4b5d5+zXwtzPCOgG8
	Rw=
X-Google-Smtp-Source: AGHT+IHlInhhJ3xFCCOgA3SiqoyGe4GrNPNHAy5HiMlXuyqZ/J0ImxaOeRtEIO78Zh6IdYlfYS5myw==
X-Received: by 2002:a17:90b:54c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-34e921ed466mr39711928a91.37.1767453876082;
        Sat, 03 Jan 2026 07:24:36 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm2107802a91.12.2026.01.03.07.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 07:24:35 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v2 3/3] riscv: suspend: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 00:24:00 +0900
Message-Id: <20260103152400.552-4-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103152400.552-1-naohiko.shimizu@gmail.com>
References: <20260103152400.552-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072437_098041_16DA8DC1 
X-CRM114-Status: GOOD (  10.40  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>

riscv: fix timer register update hazard on RV32

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.
---
 arch/riscv/kernel/suspend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 24b3f57d467f..aff93090c4ef 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -51,10 +51,11 @@ void suspend_restore_csrs(struct suspend_context *context)
 
 #ifdef CONFIG_MMU
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
-		csr_write(CSR_STIMECMP, context->stimecmp);
 #if __riscv_xlen < 64
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, context->stimecmph);
 #endif
+		csr_write(CSR_STIMECMP, context->stimecmp);
 	}
 
 	csr_write(CSR_SATP, context->satp);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
