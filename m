Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38711EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMNOkZmhMavdVQt9eKbq48BOU9Hx96foPc1Wp0NsQX8=; b=4loTk53zpjRVnp
	W0gV5OeSgF0jk8aLE9owo+pJ74mKe1adsXcZCIaBv6pw4Zs8TUCvgzUP8gFJEdSkXeuyi3bW6d+sx
	QrBiTlqJ2cUyy8xu0Ofy/p/ZeeMOhvfit39DrqGJgB5qlZyXo+iYr4ImatfI13pIYeXSpwnzIQ3qq
	Y1kPQsCDt4hya8mbWRJoi88GQ2+q9uDFDWM0ZeuJIjfbFmf+Jv/gE9V0CqVaedrKxTnvOjjjF8Va2
	xcoOv0Q6V9PqDCU7oep+JoK7/xhVTtBZb0Mk81aEZEOhMBltGo4E4mW03uInaN4J6DxD15uYsDgyi
	xFjONValp/GEEyk6DkjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInRf-00B5X7-0i;
	Mon, 10 Jul 2023 09:44:39 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInRc-00B5Uf-0c
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:44:37 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-76c64da0e46so131495939f.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688982274; x=1691574274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nImulFWj8VTnTfSKoHJB+uK3WiURTzzmP3Vx/VbcYKk=;
        b=VTXy68xec4bhmW9pDxJRs7Lxt4uPbC7gF4LMj48mQK3wzfGRHYRnzhEHcFqOuN0a2Q
         8D2W0e4Muoehc49zlwPInLGIs+XsV4/kiCUXtwsP1YDKg20B7wWOfsa9dEGXl4+Bq7C0
         NhT93td4VQlVckeX/H97oSdJA0ZOupz6weZwf4kDr0xjcrsaNcOxU6QK+4JEgxLqxMU5
         auXrDbsIrE0Jr+veAXz37+wx5eNLlgg9+Kj9rVlJ525lyXnji+xE4Cfbvf6PrmZxJi7P
         1Mot6oS4PHEWsZeObMD6K8UXixOEB/DyGZr70ywvLq4PHsZ2LIrZkVA15LRUzY+Mw8kX
         h1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688982274; x=1691574274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nImulFWj8VTnTfSKoHJB+uK3WiURTzzmP3Vx/VbcYKk=;
        b=e2BrI10YiAc1efVtrDIeed3O2fpxE/1+sLzZCQeerFZ8hYQkVDog0iDUNSiFdp0LAr
         JP5L7BeASAdEvNwn0bJVv8yxkBzgSBc5yeoatmE1xJcRvjCYkKSUwNFxsBA2p8LUGLqx
         F3E3BW6Xb3/pwkgxUGSnEJuU4fAm0CmezGnUItfAZoXutda1Dr7J0Vv0fm+sOs64TEhM
         XlnDUYYNZ9xitqLUBRqxZLDgLE12mSGqtgQgdr8/aOSJ0y6jaS8xA5ItL3riCkErMjBu
         QkoVxSXlcIskGJY5apMhe/Ibv31AoC5y3MQFy+qfSzhauVQIKr6y/RZgsROvmSiUGiSM
         aOwQ==
X-Gm-Message-State: ABy/qLYDEHHtOyJNXN0cJOFcXrMByfTpE8APJ0i2i9b9kvbvb3yTRZWQ
	HY7nzPXD05CxJc12C1plLmycZA==
X-Google-Smtp-Source: APBJJlEmg7w6H1qqHwnL/IRaN/E1TKRmVu1FkXayf8dTKGHPqVsNKfhgmgebsAz2pwfoUW45zxPWcw==
X-Received: by 2002:a6b:fd0c:0:b0:783:62d0:88c with SMTP id c12-20020a6bfd0c000000b0078362d0088cmr11520021ioi.19.1688982274020;
        Mon, 10 Jul 2023 02:44:34 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k1-20020a6b7a41000000b007870c56387dsm936938iop.49.2023.07.10.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:44:33 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 8/9] RISC-V: Select APLIC and IMSIC drivers
Date: Mon, 10 Jul 2023 15:13:20 +0530
Message-Id: <20230710094321.1378351-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710094321.1378351-1-apatel@ventanamicro.com>
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024436_268190_BB5CBC92 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
