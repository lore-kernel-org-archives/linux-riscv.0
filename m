Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C0ECE7AF8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 06:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8ALQb8gowSA6XwxMHWc2umiMh1l0ZIPPwgXkuGdaTQ=; b=ploKfHNVl4ehPY
	13AeGSwlJ5RL1Gc7DTkNWt8ApT+hZUaeb9m/ghlIwT8cBpBo2ICVAiSt9yQ8moFflYxA34+fOnb97
	GngktBbSMCHI3Biu243VuL3mTBOL9hOR2wlFkyEWGgNOLkywcwRNUzfsm+k6VP8veczckVZVtJQp2
	+Ycb3MrqjjfZeKn4WzNS5WraUHgSW6syF3xlfUeZ6FizleZtF3u3ss2Z/J2LMcYz0KtM8dQE1v8Ye
	PMfRCMkXJZGGMLdJtJoaoXm2eAS0dusYNOYo4xXaUS8zXyn0jkjaqHv25HzbLXxl8Xwz4jtUUVIa9
	Y+iyMT6B4KBSuviJZqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkHr-002MMf-2p;
	Thu, 28 Sep 2023 06:14:11 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkHp-002MLJ-0b
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 06:14:10 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35159e253edso13736945ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 23:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695881648; x=1696486448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=kT5orPw4YtJvWZlJjWXK3cqQJKHGq/CX5C5paRktGGg2O3ikx2/NkC7e8su9/VymsN
         +ZBT9Xvr+DYl5IsJ6nWihALiefgYxou7RRuTHtuoUqt18DPGdh52bx6o/PKrBVJfVoXq
         VYpWV8u0pt6K2cZkQDHa3C8Q8Mob9BQrYWbgaR3GJEnWOUW7iCnZ3znuDaUw0ZvVLvkh
         BmA33YC1Gjl9zk9DEh/s+KKNr8JlZK+8xKH6O8c/q1i/I0pWplzuQLapBECJneyGXoxi
         sjOuM25ss6oJiaEl4Zy6J+/k7dk+1cefU6rc94f34bfrNQXKg1IabcHHTBDyED+eBtl+
         4WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695881648; x=1696486448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=GCBnZQfqeR36NwlAeQx3Kk0GpcrtJyaJwt7jgetrQbJG+NvA+EOeXxOdj+mfAVj8gy
         LECu4zF0KJr7kU5y93K4R2NolzsZwt0qd7znnXR1u2eFZMGdEvLKX6P76SirHpnbob2s
         kvPQFMZywTKmj7mS/5aeQUi/Lvvxi5RYOxRPsFzCz6GYLJdNX6A2rd6xkMCQ+H3aRsrr
         PL/xvjPC9in502WOvCctcd/ZhgWKarlBCQmky9AJE3zBsB0G9D3L4nogSnYNiKkV2Yss
         44YhUadGGqa5c4h1g/eiQtcFUKI5HsDuhBmOnOCbREYunW4ztL/ug+Yogk4QhZfN5NhV
         NFEQ==
X-Gm-Message-State: AOJu0YyDyj67h60DFZQ2a6ibl++iaDHF57ruzwza7KW7d/ymQlq1tPsZ
	iuXjC08REisGw89/OQVVwdWwsA==
X-Google-Smtp-Source: AGHT+IFbbvM94Q+//vWERN5yhwqSCQt38ZTPmzZg3tJJpWfKRlW+a3F51L0ogbuW46vtUY7trJEjqg==
X-Received: by 2002:a05:6e02:1705:b0:351:5322:b820 with SMTP id u5-20020a056e02170500b003515322b820mr321488ill.11.1695881648326;
        Wed, 27 Sep 2023 23:14:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x6-20020a92d306000000b003506f457d70sm4774467ila.63.2023.09.27.23.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:14:07 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v9 14/15] RISC-V: Select APLIC and IMSIC drivers
Date: Thu, 28 Sep 2023 11:42:06 +0530
Message-Id: <20230928061207.1841513-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928061207.1841513-1-apatel@ventanamicro.com>
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_231409_225275_C517E29E 
X-CRM114-Status: UNSURE (   9.56  )
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
index d607ab0f7c6d..45c660f1219d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -153,6 +153,8 @@ config RISCV
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
