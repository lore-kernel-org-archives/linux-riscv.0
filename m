Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACB7C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/tNxqV0KBUwPL8rRY67zNR25k7854J4Gwec18Of/eg=; b=DBIRSdcmvNZfPz
	IFdstzfrGqxnDVdZN6FKdrI/6CRG0J9BKQEZqxAER14HyoQY+0+4+ng+mpgdjTt1yFLQXnAI1YS+j
	QkLVieHbcwJCOwGo27w4wlXj9XKPsarZHefMS3btMcs5qVK5rNwiLBO15aHF/CdH0x4HWGIDrz7rz
	E8g4kgw7xmxCq3BLC9o41uxgYEEKSxmG5yOy3VP6be+J2vCTHp1x0xEXs+h2cikzYZ0ZVE9h4Em0H
	0BnmOuxgqHyqnHGMffr20uYe1xCvTGjdaZWlkkIKDLa4RuiVmOrgyOcVVIGd9+rU9uxil7Snq49+m
	vNE2nWIGfR+GPU92Qjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNGl-00Dwld-1H; Thu, 02 Feb 2023 00:16:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMHs-00DrKo-OZ
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 23:13:13 +0000
Received: by mail-pj1-x1031.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso130169pjb.4
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swsmclp46MJMZpiJNbVkRXfXbIV9+a/sdi6Y4jP8Qv8=;
        b=OJbXUBOr/ZlbJi7vQRyGb87sk7661p12dXbqByJt3JiFMJPd5GDWQu6i0CGaYXFJVw
         gqSpEQmlvRYM5k+7UEA5Acq29fe4BmqSKqBgJwCY6BwMZKcQmNwDylgmwk9rJ1NwnHhm
         BakwRqHpr77iAPFGS2XevYsZUhcpvTzk80E1GFspOTZriMbbfL8OKI63RYOlYhcqgDL3
         95ZYAdVWl0Bu+CNjm9gG5/NDsCdoMtj0I2Yj1y5pB9vwolZoGjbS7cTJqI2cZAydchne
         pKZQ83gPDuYtrOmk0UyUhSk9/6zfn0qVOD+2p3oJ6/BCH2Co+ERnrrTVEEBFyY5mwA7A
         KXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Swsmclp46MJMZpiJNbVkRXfXbIV9+a/sdi6Y4jP8Qv8=;
        b=CjqFrYwHFf+fP+63EbYCW99rWszC8ThoGPnofLlYy+Hs/EdoOKleUQDDQQLRtzyPJV
         BcfOjgg58uSjfp3j4zOqjjdixZuX4pEo04hl4/MZjCyX4+Tccrxf8zLxpiCSxnnF59y/
         66DKQTC6M36FO0BzM18AP3kV2tO6OuzSbX1zK9ibnKNwF74pJ4MGTd8cC4Rxk9/xAxu3
         zNsHSt31euwgAOkXq+Z74/07V3entt5haBeZekt8O+JqsptHRhj1sgbaGDF9Py+/rjnc
         sR8GF0yCAGjwZ7DOBzHZtYq2TnVczbl+ZF1VRlCdjd0mx9J2nmjk72ErZ9K1h2WoLV/R
         an2A==
X-Gm-Message-State: AO0yUKWI9w3scFyCmC7YZwi8wqNNnWsdeJ3JNjxXyy6c6UGphMZA1hTC
	+PJccfCgns0gscFI8pB54PDatg==
X-Google-Smtp-Source: AK7set9yHunZIISJKCkgU5VKiMMbq92U0RM5RvdeJ6AGpEJExx4sxV6qe6tRixhTqggVjicyO0Ao7g==
X-Received: by 2002:a17:90a:3dc5:b0:22c:816e:d67d with SMTP id i63-20020a17090a3dc500b0022c816ed67dmr4309913pjc.24.1675293175608;
        Wed, 01 Feb 2023 15:12:55 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:55 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 03/14] RISC-V: Improve SBI PMU extension related definitions
Date: Wed,  1 Feb 2023 15:12:39 -0800
Message-Id: <20230201231250.3806412-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_151308_838135_76FFD7F3 
X-CRM114-Status: GOOD (  11.54  )
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

This patch fixes/improve few minor things in SBI PMU extension
definition.

1. Align all the firmware event names.
2. Add macros for bit positions in cache event ID & ops.

The changes were small enough to combine them together instead
of creating 1 liner patches.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4ca7fba..945b7be 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -169,9 +169,9 @@ enum sbi_pmu_fw_generic_events_t {
 	SBI_PMU_FW_ILLEGAL_INSN		= 4,
 	SBI_PMU_FW_SET_TIMER		= 5,
 	SBI_PMU_FW_IPI_SENT		= 6,
-	SBI_PMU_FW_IPI_RECVD		= 7,
+	SBI_PMU_FW_IPI_RCVD		= 7,
 	SBI_PMU_FW_FENCE_I_SENT		= 8,
-	SBI_PMU_FW_FENCE_I_RECVD	= 9,
+	SBI_PMU_FW_FENCE_I_RCVD		= 9,
 	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
 	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
 	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
@@ -215,6 +215,9 @@ enum sbi_pmu_ctr_type {
 #define SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK 0x06
 #define SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK 0x01
 
+#define SBI_PMU_EVENT_CACHE_ID_SHIFT 3
+#define SBI_PMU_EVENT_CACHE_OP_SHIFT 1
+
 #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
 
 /* Flags defined for config matching function */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
