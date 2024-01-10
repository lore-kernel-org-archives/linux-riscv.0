Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61B5C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxZ8rpKDojI8nYf3E5REO3qJzb7szBvdhy0i0qtT9K8=; b=igYgw+HOhkfZr4
	gXX1XHqsjBnlBvWJhIdPAc1xCwV+7I9z8wrpGyRSus3FP24PCUWfx7D3qZvZSZdBH4zw0asNozezr
	SKR4d5okvzSzB6A6eYP1ZyHP9blyQsxS2RxjupWJ3x2UZl8G0A7kljPmmGy59PfgmM1AIOTtBQR8H
	QXhww3ErTDqs+usr1bzLUTkv9vjneXpu5PeWGbs3TyGiAW22l7dzpnsmUG86KL3SwTQDyUtlbBMlC
	9XbutrhPBsw6U1Vjt89SuZSdiODuRy8If0f8rheIW0zkPaUek8+tT761gwj0eF+ois4GVpE3vXqJG
	C1GdVh46jKiFFgAYAiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmW-00EdQi-1u;
	Wed, 10 Jan 2024 23:14:44 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmT-00EdNS-2N
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:43 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7bb0af58134so217779739f.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928480; x=1705533280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzYVT3U62jOpimrVBwbFtsr3YzUGPIXyIVj0onyqTs4=;
        b=ZL7H/nErA57NB0Pl1tGtC2czBtnoMktqyqz+lFRaiFS19bG6QAI+NYDzRti8V+PFfd
         Vhx3FV/W6OVI83yqzGIgRYSr5MmTnR1lcfHgmts5S0W+Ari4/adVRAFCwlu9PXY0FCma
         x0OZht7CinmM9xkD4WnL7R7DJf+ugSNUBi0zNyekmo5+ZWZWluKvE9aHtG0x5nu7RDif
         zezvqeNubs79Y6ibNUODERSSTYmkKq/1/WFsCBRhPdobMe97dx2nRSkW1fN1R6ZLmBoA
         YlHQz0JyCZVKUBqHANhQKKXVNawqaeBmO73ILAxpLG3e2wWZGk4ApelDMqk34xY5QlSp
         /ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928480; x=1705533280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzYVT3U62jOpimrVBwbFtsr3YzUGPIXyIVj0onyqTs4=;
        b=ObkcQd43x0m00+jsqhMOaKiv2pg0jWy4m9EFvIK3If1QViWPZCPu1W3yDUVw9M90w8
         8hK0BBjJo+VTM7Au9wlpr3u9rZkLZ7jmuQUfmfWsWrQvvlNewiRxjJY25PP217DLOnz8
         kl3F/666t6K08aKdMOv7WduRMcxn0tvYYQK97H47ui5fKWaQGg8Nff6fbpACLQZQLKs7
         SaMtpeNVDedzCvAVPheD3nb81ypdW2UTuWXJUkVcXZEe1ou6MfRWvk5UUHbANLdnxV3r
         Q4XXHKtgpzZee0O9ASGiHCzi0QpAc0/3jFzcTYy6n9Fv/svbCjrhmakQDaVsI856fWOe
         slAg==
X-Gm-Message-State: AOJu0YxWjUdFboYUJqbUYG8Ct2cYtxwobqe4NSiTMa9+yBfTlnCybcrJ
	A74TrkiSjByyE9FX6PzYeEZFbNNP3fXNWQ==
X-Google-Smtp-Source: AGHT+IHBtYFpa0Fm4UJ7oZUXxQPb/ffVF39Gpk3+VL2e9dxmW6edwLnfASayEBNATNo0KU8KYSyH6A==
X-Received: by 2002:a5e:dc44:0:b0:7ba:77f3:b7e2 with SMTP id s4-20020a5edc44000000b007ba77f3b7e2mr364158iop.42.1704928479976;
        Wed, 10 Jan 2024 15:14:39 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:39 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 01/10] RISC-V: Fix the typo in Scountovf CSR name
Date: Wed, 10 Jan 2024 15:13:50 -0800
Message-Id: <20240110231359.1239367-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110231359.1239367-1-atishp@rivosinc.com>
References: <20240110231359.1239367-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151441_776194_8A009CEF 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The counter overflow CSR name is "scountovf" not "sscountovf".

Fix the csr name.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h         | 2 +-
 arch/riscv/include/asm/errata_list.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 306a19a5509c..88cdc8a3e654 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -281,7 +281,7 @@
 #define CSR_HPMCOUNTER30H	0xc9e
 #define CSR_HPMCOUNTER31H	0xc9f
 
-#define CSR_SSCOUNTOVF		0xda0
+#define CSR_SCOUNTOVF		0xda0
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 83ed25e43553..7026fba12eeb 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -152,7 +152,7 @@ asm volatile(ALTERNATIVE_2(						\
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE(						\
-	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
+	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
 	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU)				\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
