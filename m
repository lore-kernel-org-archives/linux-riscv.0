Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC347C54E49
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkmveTYMFfZF1nTUugiRACOn5b0cPCh2IlGIxiPxVm0=; b=pz+Lj+Z8tSawhs
	fCy8fnLl76i7w/nq22B30OrLjnxN3T/wUMJhoK5aNl+UeL9Nx0S2L5ksgKS4+R1YeTy4pIPZU619l
	ru/w145IeCkOUgObNl7Ql7xhCHusVnK0OOQquLac3Fpq6Tf9RhfpeOjHnNgH/u3bA2ikod1C6acxY
	HkLwRIiACEPcP05WbYqx5XCm15f91/px6EO34NwYwYvBzopOqzNzvQbc6Ts/mbxs1sRHpOsud38zC
	y6m+KKSSu4hTCBvPiOjftRzuxJup5ZGKSMypPDJIem82twFRc/DwzbCnz9dChfmsyxR4UT0Pr+5fh
	/Cl2BE2YnwP8LsMGdpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFKS-00000005By3-2pJq;
	Thu, 07 Mar 2024 15:06:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEM9-00000004w70-49ua
	for linux-riscv@bombadil.infradead.org;
	Thu, 07 Mar 2024 14:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=71v8gbBOdtXGvo9g+2jtAQQQGBX8E4yEXl9JiWYqu5c=; b=CEbbQqI6gdLvmsWJiCNIahBuuD
	e5kKEHVvcSEm1JGKatjy1KOr102oxRBufd+HPeL+aAh0G6WJEqJJs1T/ntC5brMVzTPC42yWDyjmy
	Ke8c6RH7RaVuc+N35iJ0f3xTm5of4sbKy89V30jvTfWPD2oJYQs5T3hLtZDhhnQjVEUBez7LqGf95
	we3B4IkXiUUs7zA0pZsJXUp7lc0esrCvanAKPhMBk5g5JgeAePDVpTqfwfsDgJ5XN53bp+/lZwWgK
	wQXclKqO1A1Yw5cAtAXGk2Gjxk37QRKTWKCwtEWHPRq6SgQiMRhOZt8ujy6dCMryaN9Q6LnR4rz2U
	/rzRnt6A==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riELy-00000006gc8-0AKN
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 14:04:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dd3bdb6e9eso6520705ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 06:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709820247; x=1710425047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71v8gbBOdtXGvo9g+2jtAQQQGBX8E4yEXl9JiWYqu5c=;
        b=g8I+Y55hXrzLJFC/X6yfV/JGTBV/CVBMTcptp5xZR/GTEyZXP7ODp0OhCreUoffd9W
         AP+76JQ+p3KvrsfJickmyOULa11uSV3KBhQrhNslubAomjcMwDduqMYMJA7I4aoWCFP8
         NBfIjfUBJpTxX5o8MxZ+qXIffj27JxT8QTIs87NjAOFZqUPD7B/LIpySF0WNyqFGrl/h
         yXVGvCTSeMKZlP20DKbDWS9lGwzWg4AE+mUfbEqku48nzMaCmbjVYXmCROAHX3rZwTYk
         V/o+1h6tyxwNCnXq34lTpBstcU/2EtecBJZDBvvaM5AID2zBwUCH4YwVsnPuH6dAg2vD
         1/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820247; x=1710425047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71v8gbBOdtXGvo9g+2jtAQQQGBX8E4yEXl9JiWYqu5c=;
        b=OTjzA9Cbe7clfLLsXMuEfvTzlfLnnlhJQgM0pmfoFcb8JUgAaWpOT9y1lSbwYNJj7c
         ThrZYTC+HB12aM4XG7gf6P6TySZqI+/wIfIHjVnV8mJztw++7FvU4wdQZ2xD9s+cvnxq
         Ofi51ANn3gLhbjYxY1r1ZHTxPDSKm0McbWtT16aaMifsbLDqL8evDOo+4jjmCHlSbmTD
         h60bVu5wHY7EohAhZd7ZkuwZ4uBtppn8IwwISklVb+RiMigIL2C/HBmeIpqBrw6ONAjJ
         Llv3pdT4yqPwlv5I63n1PcQHzDUF6bMur7NpQY/hvgSopzwxOSMQZ8TI4+IVB1NlxU0E
         y1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV1pWOj59PvaeoXCxn70Vrh6swxLB8WEq0KB6lz5iffut63RdUHHyIcB8wA9nN6D6mrOs7i6cCDLiF4b1m7ZjUFe/JPmorSUpiqbHnIT88b
X-Gm-Message-State: AOJu0YzFBl09MmgsslPv7qoGqiR3jJ2PAX/muTWJY2EgZ5aQx2jHV01u
	AwGL1G24BG0utf4macC7tA4QmqdFyRj13rTGaz0T+lZbywIcSDQkfgn6Zl5Jg5s=
X-Google-Smtp-Source: AGHT+IGjk8k6lJiQgWsvoA8in7WgIeDNUhDqU2DUJ8JobYGSXor9EPcP/3FIsc4mVQbbZjN70ICcsw==
X-Received: by 2002:a17:902:f7c6:b0:1d7:8f22:62f5 with SMTP id h6-20020a170902f7c600b001d78f2262f5mr7040701plw.61.1709820246971;
        Thu, 07 Mar 2024 06:04:06 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.79])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709026f0100b001dd6174c651sm386228plk.149.2024.03.07.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:04:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v16 8/9] RISC-V: Select APLIC and IMSIC drivers
Date: Thu,  7 Mar 2024 19:33:06 +0530
Message-Id: <20240307140307.646078-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307140307.646078-1-apatel@ventanamicro.com>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_140410_458387_68636C88 
X-CRM114-Status: UNSURE (   9.16  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and quite a few RISC-V
platforms with AIA support are under development so select APLIC and
IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..569f2b6fd60a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -162,6 +162,8 @@ config RISCV
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
