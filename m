Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBDCC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToW6zYOtLia5RMPHVlBnNNWN0OgOYguPeBpJnMTzwXE=; b=YtcdrLOe2OcxOR
	9nK74yN8HNIhxh9c7tulqJUHmsRJF8ev5fYE+Km1YDQz65GBDR0h4JDpWo0hs4e9fx84wia9D4nRn
	7SNiz/uY3LaVRxQRotXiMEePy+mo1S/rHFb9/mHPehK0k6biir4I0fPCzlMHL3+9FkLv+V1W7E4Nx
	7qbrr5qpXgzqKDSyJaUvfI4x85e83SSdz2rIL3DEuagaLmadwQTmgdqAW2bPELil6W8qOkBLRnbZs
	gPyt7hLK35gFHO4tB1x4byVD6L4mHmMfKcD8ol4rsXlSC8P0mhqBlLfdYbT+xRN1UQ0Vmv3AcNskm
	3BQIcxaEgyfmXivxZF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkqX-003Hv6-TM; Tue, 03 Jan 2023 17:13:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi49-001rpP-02
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:14:58 +0000
Received: by mail-pg1-x536.google.com with SMTP id f3so20211289pgc.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=195vKHGR+QakKYu5xEQ6bJmupoltT/5fZUVnyxT/JS0=;
        b=bJSAHr4quvhyCBCcMOee2hkHJrxJWiPH0TiFcKcUx6zEBGO4/nhdtcWPMD2IpjnROZ
         PyQaBBpPodBYpT6wCf79SU6hylJMOcugKM2f+zbOPerQGKaDKbEszQ7D6MxnOtF3vGlA
         1he26shoOo4EjTS4RLWUTnA1fBfHOW22CTeVq5KdkAae1LMSCcF3Scf8r/N8kcSM/wwv
         NFi24qFJPgGSkxRZ8PSTIGReMJCph7ryWq6G2o0vTCZ2siHVbz5/bBErm31yrdTs9gJP
         49RwUqzcP2HV0/LUgFlWGYuHoLLVdPZdQOvHxtp7W8BFojgkCuRZv/SEhCv+chU9keX9
         uJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=195vKHGR+QakKYu5xEQ6bJmupoltT/5fZUVnyxT/JS0=;
        b=RWlQByUr6jDt8aRTkGEjQiBv4jw2Av0zqTBpnWA93rlfmMuB2XtbTklZXL2cG7LpA2
         e9GArG1R38tLMWfLBWn9pe9kkSkV7ntPcxDB9oKC2nx6RmeswGFgcenuO9JSJ4NnAARe
         eYtple104Uw6nPXjvSyz/YwQoU7BTUM/HFvMENSRJraadbg0QQa6RPMqJtwd/hnlD6pv
         0VaxPcrSZ1LFGHfgyRU3Ydb+aOPV1AbA0DgRYHidRC+iBEwqrdfgDdI9cgQV9+8Bkya1
         PQccFEtsAYQjfd+ESLJ8pqkwHpgxqOAYPcOsYz6IEpjkP1IAAvN6BubN/oQOSfwcwFvn
         TwdQ==
X-Gm-Message-State: AFqh2krPvLAyilYL8/dbsSNr9yKQUU0IykJS+PNYPE/lmcFFH56fgtiP
	ZpQdXUTDRFEkDSMYURzlaXme/A==
X-Google-Smtp-Source: AMrXdXuIbWO6Ed/ZM9fAR5Tl3UhF7v8lrhmEy+hu1Tl0m3zImIUpzgFLQe+RTWo7etI4V9mqPpMYaQ==
X-Received: by 2002:a05:6a00:2164:b0:581:2f69:87ed with SMTP id r4-20020a056a00216400b005812f6987edmr27557486pff.34.1672755294609;
        Tue, 03 Jan 2023 06:14:54 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a628301000000b0056be4dbd4besm5936035pfe.111.2023.01.03.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:14:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 8/9] RISC-V: Select APLIC and IMSIC drivers
Date: Tue,  3 Jan 2023 19:44:08 +0530
Message-Id: <20230103141409.772298-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141409.772298-1-apatel@ventanamicro.com>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061457_133103_AF9C9267 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and we also have
quite a few RISC-V platforms with AIA support under development
so let us select APLIC and IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d153e1cd890b..616a27e43827 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -127,6 +127,8 @@ config RISCV
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_MSI if PCI
+	select RISCV_APLIC
+	select RISCV_IMSIC
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
 	select SIFIVE_PLIC
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
