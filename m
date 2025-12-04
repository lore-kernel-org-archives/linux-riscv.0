Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C0D1CDCE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 04:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPy3wB7IsxkqV8k/slnmmhewW3ijAutc7j9xjtskFR0=; b=AkduD58FW4WTwp
	wbjJ9227oH2VJmCwCWtRx1bfTog0TWOPsbnV4Ow1WhBnzOE2QMN4jiwXPIluPaCRr/QmznO939jRE
	EfpmWD/bJoPdwySNDUwzVzRxdxaGSwpRPnW/0R3lzC8kgxzSeUisdTpyQx5RmJe+Ws8UHlMNmW1gf
	+QJ8kL58h7jbUPEl2NsGaBA8vgAY6AlhMOMnjJjpDpq+g5tqpJ1Er4vVYWveyA+sqWcvGy2PWXoTE
	pi1myUCVqpBamhdIX9GFvEiZN8uWAuOAsuoFkqxjUSrUmaMS31KW8mb5jd84boej0wg2L3CkMog9G
	hnCuo3iPksKlGA7CuHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0cr-00000007Qxx-06om;
	Thu, 04 Dec 2025 04:07:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0cn-00000007QvY-2GOi
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 04:07:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so77755b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 20:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764821244; x=1765426044; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeKq3K01IZ7jHaGYfWdN8UW5kD/x33pKcQPOgi/19XE=;
        b=BZGJIgmwKyL9/JfQLtBVi5TgycQ6W7mHevTgYhDEJMgMlREQhlgZNj7Bhr7jGnjI2q
         r8yssUvVeYqZ0CBJW/1lK3wAhFLOqJOPoWHhPb9/jCg2oQxakQoLeN00V4TGtb3oTrMO
         gNiGx6CI4GRJSwT6VwY4On4rQS3Mil5S1Nf0U+0CzgfAhpFUXq+x+pjHHKfbC2PhNCad
         FjrQhCIJr1FNasiRTsFhmSqa0hHW99hLuRKomZ52BEBhSJdM3fFvpEnVZm0laDr57+NJ
         yuF4TrVIA7sWjoubd6RRI8MWn9QF/p85Z9ZB+/bSwrohXD8ofAtU/swzSlhmWcHgBdw1
         FfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821244; x=1765426044;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeKq3K01IZ7jHaGYfWdN8UW5kD/x33pKcQPOgi/19XE=;
        b=YI6bXQetIUcIgPeSTDHPVJrTrRdDT/sWvX5PeA2/86TKc2J+ZPYo8CnjbPmB5MpMw5
         dCWLwhe9SUNldDW6QF9aAWX4I/xHsXC4v86ybAhygzU3+Q2uHZ9NXbr7Pi2VNC6phK2U
         Cf+oWIpS7Qy0kQzCfCUsgdTiHKU0seNPkOTsBAejgMnKLsedYYD/J4dJzqJ2fUI+KZHv
         a2CgNjMSPfyVRSNAfJ+zuL3DJ04sTlom3uUrjO4Ssw9UUmLmAOlzb5ySQ3ROlYE1tTMb
         9ncX2t4ELLrJxQCfc3u0qb3RpJ1l1rsEce6s3q7RLI1xM6oUR9/ew+0VdQH7tYG2PdyD
         kTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkIB812o8iSlwOb4t7KudgTz3X8/DdvZrDZKR4EnkBvL0ey0h+ldCaL4cE5KCzpcvX5INue+wzB65leQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBnJJ6jLMC+thy8ihCXlCCs8alnb3c8Hu7ZRZ3ZXhF+gNUK46h
	K95DiyUKuadlOySCCfOFDZzs3Lj0ka+cKkCcjE9v0SpmulZcZsqagp3pSNjdDF4/Zp0=
X-Gm-Gg: ASbGncs2M7CR56axmooB1DCKqPamFWUZkSalmgqJ6uQ4GIS5YnwNRiWAOZYiCoJf377
	FttdO27DPXaeYF/YBO1I5tWnE+G2Ge1HuKWG5GGdOuNoJyOtkO/R8spulXD+/Dll5xErPCPrHWU
	Iioclar36gPdtpGhfbSMsOH2hvvgtyHVwWeM5MxaT6hjPMIYObYipUVaeXLEZNxx/YF6kR75STr
	ZXk9MruTgOrWe4KKKy2zdLg3whuy4FaeU0ZE2jnFuEQf8FrKReAHabsser/VX7lrv4WaBEUxbjr
	WArioPiSIfxLqWsWXmiySuMYXju2rjZIFsjfLFywN8m49nDfw3gJUg6DqQFRDNpMEy4B647cXJe
	lKFXxao0NT9wXDcN21/vPUtNTqEXt2XK4a/M6KH5yz6L/VRLE/V+zRyxHrFNq/ka5XWUf10LRHy
	qYd2URABMKSNhY
X-Google-Smtp-Source: AGHT+IFETMXBEPq1xYCaf/E7AS0knJzl97OZORYZaw66EE6vr0bBWjN/SIxbzghX4zykOuat10Iytg==
X-Received: by 2002:a05:6a00:4fc5:b0:7a9:c64d:f717 with SMTP id d2e1a72fcca58-7e0b376a0e3mr2205439b3a.5.1764821244022;
        Wed, 03 Dec 2025 20:07:24 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7e29ff6b56esm526574b3a.20.2025.12.03.20.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:07:23 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 04 Dec 2025 13:07:20 +0900
Message-Id: <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
Subject: Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, <conor@kernel.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com>
In-Reply-To: <20251127125305.89961-6-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_200725_574240_EB62DF86 
X-CRM114-Status: UNSURE (   7.09  )
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

2025-11-27T20:53:02+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supported.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
> diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
> @@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
>  	type = atomic_read(this_cpu_ptr(&local_nmi));
>  
>  	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
> +	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);

Please document the intended preemption design for all SSE events,
because it will be a nightmare if we forget some assumptions in the
coming years.  (That includes the relative priorities of RAS/PMU/...)

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
