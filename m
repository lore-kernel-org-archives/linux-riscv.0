Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31689C8303D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hT8pZ8I49V6CaRBxus03WgZ4PgeboidJHqFR8zQhdIQ=; b=MMCS1UADkvh0nW
	RhqiW3gI2NcD4TsMn+/Joxhn26AWpzh6r5aLel7GNQuEL7G/egZ1lHhoxlz9uo7u2rv8w/LONVzy3
	YboBszEAB3aqi6wBDcpeTe9i+uBGKENj42QZF8UpD8wEMgj3EAcw1mcZ2r/rarzA/L39FTA0A2TM1
	YctFZXKFIRiUPROOtiS62HPXfgvuhcI2NV/e34Azb479sy8v8a1hlJdmuQ6kRDfT0k4Q0JJYECbIW
	J/xbqJga0dc6Bisrc5sQp8xM5nY3vBuihZnwzRo35A+DEtitorEx/IJG6/QXdud2xKx0mDl/8fQNt
	pQU77jaZOjYYFEiUFsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiW5-0000000Eqru-2MLk;
	Fri, 04 Jul 2025 15:39:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiV6-0000000Eqcu-0UHL
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:38:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-747fba9f962so883099b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751643535; x=1752248335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp7uD1poiW059gGzU86bprSx2F9Pa7gwCpaEXnEz8mU=;
        b=Kwbn9sg/CqprvKLPuaPfmZvFgOmrRaex8WRCDvudqzCU52vf7PaqdrxYnG6Mp2UsX1
         p3j+APsT0Ie70zsRZ9QqnZkhpUyXExJR2PDk6xj8QHC+qm79jY+QG3aVFBwoWg+UcHJE
         Wf1FCF38BUiw7rL4WBIS0Wtc4VXNfWS7DJ5BSzloz5KZaY/rAjfUWd6A3LC2PU/N9AQi
         iqPc2AiGCZPYGDSjh9f9TTeQvhmwj0Qzzcf3OPLb0aBR8zKNUr/HmnU0uABoxxi9sc0O
         eTG80umyNX3Ld8/xqwkiIB2yaPInFZcKKzApAOGGAfOHaTo/yMpAaNGOPR4eZw3UH7Gk
         h9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643535; x=1752248335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp7uD1poiW059gGzU86bprSx2F9Pa7gwCpaEXnEz8mU=;
        b=CgCDM93eHoQhoJAxCk5zg7/1xWzUkrfXyB7FKeRsG++Waqay0PWyeuhKD2sFf+lXbh
         4dmtAkdV7aIJqAqYIFPv3d/9OM2/B7MOr1kAO/+mlnIEnAmW59lQGdR1bDEfECcVrITA
         aCY1sjP0gCjfX6vDimtxTepE9jmJxf5uRuIang6RZszBvtYje6eeplJo33sT1LlBXPe9
         krcA88xmw95WcAzIEm4nZlHWXt2Li6+kl7QK7FnvocjSqQeFWWiCnBN+A66DG1SFKPk+
         drMety6CXVaKO9QGdYCtnJFo/6pNGAe2mk1IaybbWDX1dj/5ZEs8Z0MCOCYc6cK7qNll
         xGyA==
X-Forwarded-Encrypted: i=1; AJvYcCXF+NiMplPqNdfT+AJJylWViuLHAT+20tRShjHG8Hm6HNsWxmyKvbAI/krwQVG4NphZoDr8hw4d8hL5UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBOQWNK8/nAd6EOYB83mWxJD2YfL2Z0HpoM6fm5MlwSH/Gptre
	rCoHAtR4nisZGj4yoNWDcoTqIodqQerPiFRVMI6ydJuOFGmNSfbZI8c4F9QpZrKKHnY=
X-Gm-Gg: ASbGncuQTZZfucEUNOdbPRDycvEqucDnrTcokF9sLvAjheRPkHvojN7ZYACSDltucR5
	+ENXGjOj3IglOn5+d+Ud5j7lI3+nMyzMSVJyuSE4wYZnfpwORODGboKkOWK+6qWAGPmk1B9vVqG
	NaONeEf+B0u6/JNHIlRh25whfHf6Skzd22U2NWWghYO5uisjURZItfFyp/eYhcDdrZRIYoizHxu
	bW5liLm3MZpxg9OzbhlI6AH/1jFm1ZpG0XjaJB3QLgbb0n9XKrnDfSnsF66zAGuxfzhOLBOLut7
	TqF89rlytMVdIFMc4dobT54jn6zIZ+ad9UeRisdpg3a0ZVVvM3a88boeVWvSmHricqrLZkXo6q3
	suN9/Xr05JoQrjOMCl4E=
X-Google-Smtp-Source: AGHT+IGIXVrx9PSDrG3EEvpjwpw1PdozZsTf2OUe+pqrmlHyZJisYpgboZx4tCy5PCWnKNZpHdxUDw==
X-Received: by 2002:a05:6a20:a11d:b0:220:3804:f3d6 with SMTP id adf61e73a8af0-22595173066mr5303101637.2.1751643535243;
        Fri, 04 Jul 2025 08:38:55 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63003bsm2084818a12.62.2025.07.04.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:38:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/2] RISC-V: KVM: Disable vstimecmp before exiting to user-space
Date: Fri,  4 Jul 2025 21:08:37 +0530
Message-ID: <20250704153838.6575-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704153838.6575-1-apatel@ventanamicro.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_083856_156760_8B6FA712 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If VS-timer expires when no VCPU running on a host CPU then WFI
executed by such host CPU will be effective NOP resulting in no
power savings. This is as-per RISC-V Privileged specificaiton
which says: "WFI is also required to resume execution for locally
enabled interrupts pending at any privilege level, regardless of
the global interrupt enable at each privilege level."

To address the above issue, vstimecmp CSR must be set to -1UL over
here when VCPU is scheduled-out or exits to user space.

Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Fixes: cea8896bd936 ("RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc")
Reported-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_timer.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ff672fa71fcc..85a7262115e1 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -345,8 +345,24 @@ void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
 	/*
 	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
 	 * upon every VM exit so no need to save here.
+	 *
+	 * If VS-timer expires when no VCPU running on a host CPU then
+	 * WFI executed by such host CPU will be effective NOP resulting
+	 * in no power savings. This is because as-per RISC-V Privileged
+	 * specificaiton: "WFI is also required to resume execution for
+	 * locally enabled interrupts pending at any privilege level,
+	 * regardless of the global interrupt enable at each privilege
+	 * level."
+	 *
+	 * To address the above issue, vstimecmp CSR must be set to -1UL
+	 * over here when VCPU is scheduled-out or exits to user space.
 	 */
 
+	csr_write(CSR_VSTIMECMP, -1UL);
+#if defined(CONFIG_32BIT)
+	csr_write(CSR_VSTIMECMPH, -1UL);
+#endif
+
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
 		return;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
