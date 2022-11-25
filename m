Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F0EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBwMXu10YIa+MrEdSEW1VcURhagF/y/d8bmob6EH5h8=; b=v82GO9Er3/F69u
	j4RlWNmK9OMjpDHVWFpxpRXY3ouoXK/ciW45BUk8zLbSDvugu66fSeKwU/Ko/0XH3c03Q6zUF0BiR
	49LCYSq6Lxr7KJjG4z3HNwTHc4Kvtr4SbGS19J+zKY1hD+Uij8RrkEt6i2cxTEadZTXilQkKtfV1h
	ZUIQawiws7l9oRPyH60Y6bxYifW96xcT2ZiMyTu/afXkPaf228FWBh77PesIzW74WOwpfSbLzI2PX
	kNgP13NgyOLqrf/91cyDdG7j+pVo1KGoi54uRoDQrlzrJ+ZKBTuPricD3Gk7UD0qt+i+zpslNVGuu
	f1Xjer80pVbcBR3WtfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWnr-00G3ik-TD; Fri, 25 Nov 2022 11:23:31 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWlz-00G2TB-Lf
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:21:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id k5so3446456pjo.5
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu6gMWlGL1798v9tVBYC6q+OA3VeKQCQFwAOJPQbKO0=;
        b=To90HQsu+nRhrpBaf8hoVduWXUfZ1tr9GO8p1fFwpVasAb3QZFs9HML/Qrn1vrBE7C
         3vsuD281OG3+H1XN4yvrHCeF683B/dTB9o68D0P0JqmhXXS2OFvmXp/ayHdWWhlLbFA1
         1CD37gIN/DfDUk5meIAc+lAmcFJmB+nbYa+m+YwDLmYAr9PqnpiIWCEXBAe3MZzVSM4H
         6tAdLsJNKS8hamjUTFwrq+Td+h8NOuRo1Z9pgDp60Do59P+x/KYvKWLXjQWiYLdYLzcP
         rtHK1GwJdups2WWAH6HJ4p+1l+tYOGlUGE0dwQI1jI5Y+xS1T3BdF1HEvknSqfc7YIHL
         QyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu6gMWlGL1798v9tVBYC6q+OA3VeKQCQFwAOJPQbKO0=;
        b=n/B5WU+PafxpH+IyTFB0LINbV2PR75+YFGQgYrrRtJ4udQitId97YzMu0aAmJ10uzi
         OajtWf3ISa3iboNPouPifMbRjLhDCmHc7uOKG/apYAdimPM0nHszod136vckI5F/4IwE
         uFs++wZubrqn4Ldh16CdWv8tE4/DnRUSSx5r4IM2G7R/UkUqwGK1tV/Kb5vG9qKQ2vdi
         7emNkjrujDpsolvHCbhFGGQjyhz0UbOTr8xpE+nStlO8/WALO5huowO7ux+k48vCdgrj
         mJVTe513+x797o3OoK6vonmOtOB50w7YUPGxS/RMbups3DHov1cX0xrfe0AMu51x8L9K
         gh/Q==
X-Gm-Message-State: ANoB5pn2cdBenI0w1nJSK7Wxw1pXwPOc61i6M1wwQFYlWGqSzZIFJWRz
	T+N29fBbpwc3RiHwRTM3zSmE5w==
X-Google-Smtp-Source: AA0mqf6g24tHjlg8F5EfnWXfFlEVrgU699VXSpbDgg0ghtBXNTb315U16mtrNFdCP2BZ6q5QaQdR2w==
X-Received: by 2002:a17:90b:1d45:b0:218:6db5:fd98 with SMTP id ok5-20020a17090b1d4500b002186db5fd98mr41313988pjb.164.1669375293993;
        Fri, 25 Nov 2022 03:21:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id e66-20020a621e45000000b0057488230704sm2834335pfe.219.2022.11.25.03.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:21:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 1/3] Revert "clocksource/drivers/riscv: Events are stopped during CPU suspend"
Date: Fri, 25 Nov 2022 16:51:03 +0530
Message-Id: <20221125112105.427045-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125112105.427045-1-apatel@ventanamicro.com>
References: <20221125112105.427045-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_032135_743177_C2800BD1 
X-CRM114-Status: GOOD (  20.72  )
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

This reverts commit 232ccac1bd9b5bfe73895f527c08623e7fa0752d.

On the subject of suspend, the RISC-V SBI spec states:
> Request the SBI implementation to put the calling hart in a platform
> specific suspend (or low power) state specified by the suspend_type
> parameter. The hart will automatically come out of suspended state and
> resume normal execution when it receives an interrupt or platform
> specific hardware event.

This does not cover whether any given events actually reach the hart or
not, just what the hart will do if it receives an event. On PolarFire
SoC, and potentially other SiFive based implementations, events from the
RISC-V timer do reach a hart during suspend. This is not the case for
the implementation on the Allwinner D1 - there timer events are not
received during suspend.

To fix this, the C3STOP feature was enabled for the timer driver -
but this has broken both RCU stall detection and timers generally on
PolarFire SoC (and potentially other SiFive based implementations).

If an AXI read to the PCIe controller on PolarFire SoC times out, the
system will stall, however, with this patch applied, the system just
locks up without RCU stalling:
	io scheduler mq-deadline registered
	io scheduler kyber registered
	microchip-pcie 2000000000.pcie: host bridge /soc/pcie@2000000000 ranges:
	microchip-pcie 2000000000.pcie:      MEM 0x2008000000..0x2087ffffff -> 0x0008000000
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: axi read request error
	microchip-pcie 2000000000.pcie: axi read timeout
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	Freeing initrd memory: 7332K

Similarly issues were reported with clock_nanosleep() - with a test app
that sleeps each cpu for 6, 5, 4, 3 ms respectively, HZ=250 & the blamed
commit in place, the sleep times are rounded up to the next jiffy:

== CPU: 1 ==      == CPU: 2 ==      == CPU: 3 ==      == CPU: 4 ==
Mean: 7.974992    Mean: 7.976534    Mean: 7.962591    Mean: 3.952179
Std Dev: 0.154374 Std Dev: 0.156082 Std Dev: 0.171018 Std Dev: 0.076193
Hi: 9.472000      Hi: 10.495000     Hi: 8.864000      Hi: 4.736000
Lo: 6.087000      Lo: 6.380000      Lo: 4.872000      Lo: 3.403000
Samples: 521      Samples: 521      Samples: 521      Samples: 521

Fortunately, the D1 has a second timer, which is "currently used in
preference to the RISC-V/SBI timer driver" so a revert here does not
hurt operation of D1 in its current form.

Ultimately, a DeviceTree property (or node) will be added to encode the
behaviour of the timers, but until then revert the addition of
CLOCK_EVT_FEAT_C3STOP.

Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98/
Link: https://lore.kernel.org/linux-riscv/bf6d3b1f-f703-4a25-833e-972a44a04114@sholland.org/
Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
CC: Samuel Holland <samuel@sholland.org>
CC: Anup Patel <anup@brainfault.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 969a552da8d2..a0d66fabf073 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -51,7 +51,7 @@ static int riscv_clock_next_event(unsigned long delta,
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
-	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
 	.rating			= 100,
 	.set_next_event		= riscv_clock_next_event,
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
