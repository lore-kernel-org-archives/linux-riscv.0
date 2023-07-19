Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763CBEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMNOkZmhMavdVQt9eKbq48BOU9Hx96foPc1Wp0NsQX8=; b=OuqqGoFOjlwPsA
	ZbcMMSavcTWwYinJu4zuQZO2+yjhOrLBq2FxqtPK5HZab7pWOpPPLP22Vans/vMh5hCtcbzZGjFkG
	FJus3a3L0ffWXtPIA/Uv8tjCyWW9qCi0JynPEOK3v58DtI+ntjKGDs8S2jME1eMla4lrOBCySlkU6
	GZLx23A5wT7X1Tmfky3L/cT0O4PLBrEs5vRRjgFVBFmZhNdg35IrRzQEKt9pxK13JGurh4gU9dCXq
	MjAKXHrC/yRypByUKRRngBcUfjfPW9vf3JSwM0kHCuZdjoTJpll1fd8zr6EguUWGCzwxg/IrPeUFi
	0+qxxd0GE2wMdVpkLB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5UV-007GRp-0Z;
	Wed, 19 Jul 2023 11:37:11 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5US-007GPL-39
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:37:10 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-666edfc50deso509151b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766626; x=1690371426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nImulFWj8VTnTfSKoHJB+uK3WiURTzzmP3Vx/VbcYKk=;
        b=MYnW39H5T5MAnd6loiSEn0tRROoamcE6xLYknujrcnT+M8a+JKJOLZElKjAn8InILy
         vipI9UCcxwbEIfLv9yrVl9UqjLN9sHecxgUc1tEpyfamMLJuinSCm+QTiSDl4T2qCP5v
         vxCV7InaJRCnaJgFnBTF2f2HwYzLSLQNa6Z4qOrsvT1+TrKvjbk852zE1FxAvzjz90J5
         NLgvM0YXRoiAomtp70GyPxqNJLbdq0gqE+F5qD3MihEkx0GacbzocmeDb6XzV+mVWk8Z
         VB01PJDcjO7PKW927SPgmeUok7fRW1CwrkEpKsAtKPt/oUf/IwZrTl3TLEKF6CWDVzUz
         RnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766626; x=1690371426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nImulFWj8VTnTfSKoHJB+uK3WiURTzzmP3Vx/VbcYKk=;
        b=cDDuxfwrvmg9FLuLkzIauxGqDtb/QB2w//YkFBN8AQR6S/iQMWY3KkPuAZnmErPMiG
         +ssQO0yyKJeiI+dSxDx9zVQcPfpRSptbDDlZV1gFRVFGJqRcAo8aXZGhktmBjC475Z1r
         n0WhZQZbQVAIytowkiEHHfJ30GZh8Qvwr3EJz772QVnKbzoTSWE4yOMumMWNCiH+1R58
         jTohnGeJiVZLQKruGOzERP0Ot1Xg3NhWocDy8+Igp/T107UBHd5Ancww5eAjMidvq/tP
         aAY36aX+QMOwbKG0wtQ64bfwwlRFSsqiSvb9PfIA0ZXFZgBQFFfORNClvM6n52SU8snL
         YnUw==
X-Gm-Message-State: ABy/qLbHGBFbt+vjcd67y0Jh0prQ+cBOj8acabW9QZdzC8nWbNWa1GBm
	a4qRPINxdje4HUs4XocymseysQ==
X-Google-Smtp-Source: APBJJlFOlkC6B+60bXcstYJiNUwp0bmn2Q55eSYxxeCswWeD/2SHraTfZTbvxmPCTf/1Hq5O1mbTYQ==
X-Received: by 2002:a05:6a00:1952:b0:682:ffaa:ebba with SMTP id s18-20020a056a00195200b00682ffaaebbamr2203991pfk.13.1689766625931;
        Wed, 19 Jul 2023 04:37:05 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:37:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 13/14] RISC-V: Select APLIC and IMSIC drivers
Date: Wed, 19 Jul 2023 17:05:41 +0530
Message-Id: <20230719113542.2293295-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043709_049687_E10D26FB 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and we also have
quite a few RISC-V platforms with AIA support under development
so let us select APLIC and IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..318f62a0a187 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -148,6 +148,8 @@ config RISCV
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
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
