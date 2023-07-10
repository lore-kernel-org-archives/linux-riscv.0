Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BDAEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIbahr7cz1s2opCflnQfnoYm33SCQgaIl9TnYd0IEyE=; b=kM++whUbLJZyPb
	Rt4RYMu8SMzqbpeLytMhwNdhzJaFPEbiDoo6UfkhuMt2FZN67ML4OVWyast//O5qeUWp59AIqQX8P
	V9P4VYanK1V1EsxJ34hMaFqkoaGPsa4DvwiSTHEAYXWl34t66x8jteGdbM3/tAnbRarbuO/wEeGzd
	YjczlILQ++8mFJX1rE9enRS2jv1O4l7CT7YLyLZ99buBxqYSP1Vrd1umYFzV3btBrs1NRdSlmqrZ+
	czxseOrNfgirsPBL6LYxB/rcdJKmJK4iLNpaV2QM4b+ZjKdhlrrk9hREDk65PFW5ZK41NsKA9vtMu
	Oaqod3zR2+yfbi9QkNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInRl-00B5aM-0L;
	Mon, 10 Jul 2023 09:44:45 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInRi-00B5YJ-25
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:44:43 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-77a62a84855so131857639f.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688982280; x=1691574280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ofm6ZZqXNuqTlD7ApqCkKz5DMt6TsGfpSNKkfwssKPg=;
        b=HcWz9mfkvs5FdQY6JwaYRUd1x8Cydw6tK0ZbXGUcKgU982e37q4E7DEL8SMpbHVCek
         M18eeY26JQfb8yLWtVGnb/mbiBhz7bDi6Jt7gUOzTDJk1z0MaOriGxYSWXQG4bzGYKev
         v4bOEb0eVuyxFcLta/fAS25xXCPi0L59bz+N3v4Xk5kGQEv+evkmjnbtfi7htPVyWmTO
         0zojqgco6pcgUMwp8ayE+uk7yZs4xUExX2EKBkM9YIAHTQrSGx+FPvH+ExJXkvVYV+be
         +5z4fAaaipT4bwaa+qmU6zBhN2PB7VC8HwD0qBM5R1QC4D/yN7BgfG3DalcrQEWjquqp
         sKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688982280; x=1691574280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ofm6ZZqXNuqTlD7ApqCkKz5DMt6TsGfpSNKkfwssKPg=;
        b=RFirztyF22RVNSh1PgIOKDXPtDBecfXBTaGXIS8Yb3d3F03xAQ59h2NFl59agDL7M2
         PAzIRYoFn5XZaRcDmOqUwpcQt+eOa/3pv/ofMM4bg9YcFltvNJxztL2LLsQmdYJYW7eP
         s7OaqeryuG2Sg3ePNeVzlzz1ErlbD7u60XqhP/Swul0Y4d3BVJFdJZpVphYzej3zyLsH
         HT7iONBHr1MDIp2y7mwj1zQMQu+aIno4ZYtf546O14FPoO722C3HCcq7WyfiUS++li9V
         vJWSEnU3APkt61pxmFajjqFTnrZ4N9KqOtZQq5UDlWe57A0LjmaL5z5feSd36G2pV73a
         kYZg==
X-Gm-Message-State: ABy/qLb4EhyKE75rTXLVnhQQU9RSAQBtclPue5HkSl1tPQ4sGcb+FRYj
	L0RBGH124+cVLh7qTc4gPtgfhA==
X-Google-Smtp-Source: APBJJlEvN/kXRYuvvzZyagkj3gVCiXxnv/KMPVlBOAwwPNxqHe9Zm6PU9NkVs/vOaNFxbKR3Q+kpMg==
X-Received: by 2002:a5e:c910:0:b0:77e:3d2f:d1f4 with SMTP id z16-20020a5ec910000000b0077e3d2fd1f4mr11945598iol.15.1688982280420;
        Mon, 10 Jul 2023 02:44:40 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k1-20020a6b7a41000000b007870c56387dsm936938iop.49.2023.07.10.02.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:44:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 9/9] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Mon, 10 Jul 2023 15:13:21 +0530
Message-Id: <20230710094321.1378351-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710094321.1378351-1-apatel@ventanamicro.com>
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024442_683594_C826D2E5 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for RISC-V AIA drivers including the
RISC-V INTC driver which supports both AIA and non-AIA platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3be1bdfe8ecc..a85fc0102179 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18245,6 +18245,18 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V AIA DRIVERS
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+F:	drivers/irqchip/irq-riscv-aplic.c
+F:	drivers/irqchip/irq-riscv-imsic.c
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
