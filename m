Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B771C83F0B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 08:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWBpiv+x4x6Mlh8HBD1dkwrVzCLyPN0NX5O6w5qQyxU=; b=Nc3HYBqG/zKQHS
	yKAveYxVp76HvcscVSLzd66xzGp0vWldVMvS5UzbCeuNhaooThV+454If85oGV/V2Wr7uBBFhWc1+
	AkuxVrqDWnIyaJSwNitbdqWDWjOusCmKhEMsJ+kEzRAfyEwhvZNQveLm5OYfCEpDH6DvhO0EI1H8w
	XUVbGEl0Rkg+B4ydOvnaGP5zCxS7Tkp8SDAINodDNfrffF8QX6GWdjtEJ5+m5SiIZoZmJrAs8PbqB
	4EQf+pa5xsMW8FFoYhlbj5Vb1ddKsY/rcvzopkU/04yirVl1AdQpavd8ytXM+Ph0BZJksEW97msKJ
	vTTXtFQQTJZmxzsYfopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbfo-0000000DiMP-2jHm;
	Fri, 04 Jul 2025 08:21:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaXX-0000000DWl2-3dLG
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=; b=DKlsF24S7rn3J67OkmqJGTAehP
	mdBXFQkhWJiw2Xir1sdt25L0HKIlb5E5Qn7tu6xONL9qWhsLLrBiqJ7JVffIRl2jRmgEaKb/0hli/
	IQ9e/t8VTRlezBj2NTkMxkZlslDHbMwyXztrAIFx02nRca9AdP8SAhBGK+3wNMpQdhL4k1ZGOBPAL
	FpHX5usZsH2avGjOpmdSeDmlF8rZYI0X5f1mDfRFhvvuDJau40GWH1sV31I0XRt4/G2q8pSV/skQd
	hRmUY0BkG37+TTeTMo/Z2bie2TOS1fX/akW4Gru/QTFKgl4ALF4vMZLmCnC2dohZhnfST1+wY+kS5
	TP+7SQ8Q==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaXV-00000007ng8-0Tu8
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:08:54 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so682523a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612931; x=1752217731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=XIth46OenjNaOOQyCZPQ5j2DievYn7WGTWB11vz8U5n6m7pX7uhnMDPEVHCmACMGMT
         O7gyBF5gMBFkY2H2OwRDbN163PFd00iJECYgAXkaR2Nl4WOs3GFAH635ztcU/7/I4OKe
         Jayw7gUB1yh6JbN7VYdJQ2zWxCRAfaVK5egagIDeVTch43JCEsSQQEwzzZQl7kaPpS6m
         QDTxyDyFo8rx0rNPJ3PXOZ1lVVWkDUpwnEgwhfrr/ll3s0G+UPUo+Upj2fdfs3OsTVeU
         vG2Tq/SSqYGTYKuogzH+IU+vYAO0/oHxP73AMXNHvgCuoUMC6zMRH71YJgl3B4s1ys86
         mEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612931; x=1752217731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=oSTa26acO5YdvdvWHsfUplJMEWl+2cSdSMquE7xMMzQt52Vk34vWs2kAnduVm/z/01
         68+xpsnOuuc7q27iCfDxzkgsgnjBeBF8qyvLtqGnSH3VO/HchSgaH7PG4KUsCHB6kulb
         JXeiI9b9Nyd6MM8U0kJCPYeJkMFSCmcwdrqt6geT+32UGHRaAmKjFKtpBcd6TVq2ixcE
         rybhMBFahEW/oHpbsSCTFAVNZXlcsbFGPmoDqrndV4O2vBqpL1NWR9yLdydvZm17c713
         5QYRUspD0EdyEkD5jZHiqc55yeZ9+ROeozv/fHS/UlaKLvHCZ27ez3ZgcQvBF+eCU0zA
         0Zuw==
X-Forwarded-Encrypted: i=1; AJvYcCUVLB1sQ8o8qsygQNa2X+TGgp7QvYs6b+eGZt/PO2Fjg67LfPIhv511pNoMIOBmm46Q4b9azH2+3cIEMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeypfy4oNT9UaMMe59/LxGyHnPcOLrL5xqvlanSjzvhq5Va9nZ
	kGzV9mFgdvBhOhVSUtp7ZoL2s8uBY55Ph2DKlh3k3j1WrblzExU5tii9a3ab8uaOE/U=
X-Gm-Gg: ASbGnctXZKijpI/yl412SDbbkmJffPvCMmYxg8VzCua3WkAmq83uISkjE95DyaonvUA
	DCZDHKg1DdKY1QkVF6g0fj3AcPJDvC3I5nSRLlUd3H/33JtwS9Ags9iKIOPOC3lTwD1TxmrlCtw
	KhbasxhuKSuBhzwLBNo0V3kJZc9Nfvro2A3J1cgkUfwhy6bmrlN0pwzqkQChTcpAYnye6VnIbEk
	aPzVWFyGE09dBHyOmkAU8ci4Cg1sdkAF09kIP4pvGocBLFL7I5y2l8DBwv/8f8oTHaXrYkpMCF9
	VgSExHXjwIjw9sscv+MWpKty6wwKnrxugNqtf6jJlH1q88vTCyjM0HSUK/PH+PP4Echcin/DJ6I
	MP8rSYD6BD7+thM0WlRjJkxrVmg==
X-Google-Smtp-Source: AGHT+IG39MvNAhukPFseFzyGr10vQC+nwykVpIMjUKJlMsDap7lt+awygLPFDJM3EBPrK5lNZv4S6A==
X-Received: by 2002:a17:90b:2647:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-31aac433b33mr2347184a91.1.1751612931087;
        Fri, 04 Jul 2025 00:08:51 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:50 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v8 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Fri,  4 Jul 2025 12:33:56 +0530
Message-ID: <20250704070356.1683992-25-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_080853_275118_EDBE2782 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64..c22434a2756b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,21 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V RPMI AND MPXY DRIVERS
+M:	Rahul Pathak <rahul@summations.net>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
+F:	drivers/clk/clk-rpmi.c
+F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
+F:	include/linux/mailbox/riscv-rpmi-message.h
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
