Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED652E75420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soEkZu6s/gThKRU8VYHEyp6WGwrG+JaMEYzwgz+Er64=; b=mHliNmARYeuNxm
	/tjEaJ0toQPHOYf8/clBKoKj7GDKyWup1X1NGf5anpUe0ilTBdUf5KWocBxKeJC80btKoBnGqs8oJ
	Qtf67fkMsKYAba5dEQciq3IvFMaKlF8lFr2rj2y9nlq0tcYsxY87T55zkFQbzS4+ULVNJI7CsOWfh
	4fU3hFDicilG1r4AUapoLDTQ8DB+MAP9Gm1sQBHEHv3dxu9oLlg3UpA6W8v+MqEf6PoQNJVEy2VBX
	ylOgMFKgDRoavHW8TGZrKekx+icIpITAUraXih/bjEZp6pDKXKiQD5csXcbMTMHIWo0P3mcDEJiO8
	n0SpKXBYHJxh1hCmImRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXIA-00DoW1-19;
	Tue, 03 Oct 2023 04:45:54 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXI7-00DoSw-1t
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:45:52 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-57bb6b1f764so302463eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308349; x=1696913149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yTTiHhEWIYYloan0CscIp/F7E/ZlHNo/ergGTsj5g8=;
        b=AMzaskLG5dU1bHYqNSMMba5FwzOUITonwxLFG32digc5eO3zISRhb6tNrUmBsRvH7Q
         6pXxoF6B67noLZ53nt2CHwy3fHjxM5DFbXsZ1DQHiWgljs6LQh5Qb/TWv1sqQpAY/EOs
         NFu40noZi3HWAbBav/4AfWsZw9RnE/WlERdrOv1IAv/10mQxPINO5VkCoaTLUXekUDU5
         kXx/fKHBSpvu6sNXE2Z9iKgw2jPOnQIGipqw6g0eYRC4R6veSrCyzMVcls++kJy3g3fW
         J8/eU7S7D/FMam5daz+s5k7vOJTcoQEcpBQEtwdwLGm+mSQBZbDFBCDa0bGs1EW5DySu
         A0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308349; x=1696913149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yTTiHhEWIYYloan0CscIp/F7E/ZlHNo/ergGTsj5g8=;
        b=OjN4g7tV3yxQv53MtUHXuKqHu8aryx4Pj/wq/SwA/5DfFqJjijgZGTP8HfFjidRqh4
         kpsmFhfPJN/+2p5ff+1w8c1DTm1Sqk6kVf3UAXlVTkDCYvztjzPGIkqTS3HnfBD2XZVn
         HzZl/jCHN7Sdi8DcT0dHUGKmCoLfY7gZcdlIqpjWNvx0BrTkZVpaRpImFKkRswq+TCf8
         yyj0QO+hDi7ko+ufKoVkvMt0bBfgSxJAUC5Eyw3B8Ft3e7lAJQumUu7+Az6+FbO/SQwu
         fI0mHfNbPpiUr9VYvB2igv5IC4oNZri2BiC9nrcnnU/Qpt2oRhdpl8Xe5FDcleAEarxw
         Rh0g==
X-Gm-Message-State: AOJu0Yzg+7faMmcRBlvxAHRMUyrDuH1hI2ZjsgVaL6rRyhbhlD6qdsjX
	0lzugl1KfS2r4unYKE4jPoH6Mg==
X-Google-Smtp-Source: AGHT+IHLAJgEPycqczoH84XL+AoZbMmX1MwzyCnQamOo/lGbqhEbvHIiPeGFR2Gb/Z6v/Ae9L3Buhg==
X-Received: by 2002:a05:6358:d048:b0:14d:b8d3:97e8 with SMTP id jb8-20020a056358d04800b0014db8d397e8mr13502205rwb.16.1696308349196;
        Mon, 02 Oct 2023 21:45:49 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:45:48 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 15/15] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Tue,  3 Oct 2023 10:14:03 +0530
Message-Id: <20231003044403.1974628-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214551_624214_499A93BC 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for RISC-V AIA drivers including the
RISC-V INTC driver which supports both AIA and non-AIA platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c335ff64ecf1..89f0e7905b59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18412,6 +18412,20 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V AIA DRIVERS
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+F:	drivers/irqchip/irq-riscv-aplic-*.c
+F:	drivers/irqchip/irq-riscv-aplic-*.h
+F:	drivers/irqchip/irq-riscv-imsic-*.c
+F:	drivers/irqchip/irq-riscv-imsic-*.h
+F:	drivers/irqchip/irq-riscv-intc.c
+F:	include/linux/irqchip/riscv-aplic.h
+F:	include/linux/irqchip/riscv-imsic.h
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
