Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F8CC47073
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSZgvaRu0QvX2sS+K2fCvNtNSqUVZrMEO1FB8AZnoyw=; b=gNSfw1aKk8uZ0k
	v3kFrVqiPel4nvV84fACVc8jmIaIMXvka2KgKl6Eb6HOgwN8Jo1r5agqN/7bjjNAndtbFvoDJJwfS
	E7q/nZO5bI9IOgKp51bYV3+WggxmovdcUTNn3/uZURG3CSz/nEdybjeO3lCIWGHs5Ro+5J8dknZtg
	dwxtxwIf4cMVQbIzntPzQ3NZHLVdafzX6wU5aGsqRxfuLlOVbYSC/vd40MTfX5KFWCES/D6rklGcL
	m8Xq87GQ+93D5yPhNKhg/rQ6FUAb+z5+g26EkK8rTxEe/LZlnYEX1ZhFAbGS0vxB81cZhkdHitwNm
	/PQYWhXMsYjvd7lOsnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmZ-00EdST-0c;
	Wed, 10 Jan 2024 23:14:47 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmV-00EdOO-0b
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:44 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3608bdb484fso11499075ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928481; x=1705533281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpN1MW+95i3F5wasxziCwuSYEcNzMGQOQLUR8+9YpL0=;
        b=P94H4jR/tnEuhxa6M99cFWf6Xi/V9wJdFhWwuclDl5a0yEJrtecgjDFxaSssQdVi0C
         GzbFkx5/OJfU9Kh8/Xbt4KAGvPOFpCLbVeFclLxdbsrMKbCmtjorn0uQCjhmSIx6f7Zw
         7FPq34160hDQP28VknQ4iX2evP6yp9WXn5HL18iENyA9eNV4nhqJGnyLMy4Stx7cAJ0d
         4cXpiAAbRKKUVQaLSWsh91OpWxN0Tdt+NwkH0xOtr8xv1ABDYBVdipIXQ//Ot2aXYz2v
         s9hhz5ofrI2CfDRXUYDKH19B9XwykFtJ2IXeyHZoKGUqrqY6a9lb0fOUW8uU6aNZ9gL2
         8lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928481; x=1705533281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpN1MW+95i3F5wasxziCwuSYEcNzMGQOQLUR8+9YpL0=;
        b=bWVP8yjbIKvjwBT1B22HK8Tt7CIzg/IzTUoMo5AI+S2qjFjmVudKARaMABrDAVTywG
         nYi1UzgmAaMHZd7bbbAigoaI8L/TsyNKIdn8uLEMvjoKGCrA5cKtGCYv5PrYflVdU8e3
         tbQKCOqNLXhh2q3AZc918p04hEs75F79y/UOPL9DYLkug1xBDPZijQycsd+LnwVOtZV5
         s7WWZBztPVTMFkz4V4afOa+rgw8mwz6IfP+G9U48ouBxm+us1k4O9AV7MzTcx2gfraVS
         WFoSpWYLsyU1m9gfP6790XZF5AW47xVgmORPhJojvrPNJsyGxohYBXAfR7WuZztKFjUr
         yF6w==
X-Gm-Message-State: AOJu0Yx/Tv3iyYFKBQdtQO+oU4q87RZMqh/hV0fp3K/fuAYyL+4/vlLf
	R2LG520PRm6Cr+kqmh3sPpnt0Y1WHSncdQ==
X-Google-Smtp-Source: AGHT+IEerfI4D/HCt6Wq/EDTg532UTtpPwmlvQqg9CrVuB5160up0pSpFPO/ZG+KXWk1i3x4xdcmZg==
X-Received: by 2002:a05:6e02:180b:b0:360:7947:f14f with SMTP id a11-20020a056e02180b00b003607947f14fmr650893ilv.17.1704928481341;
        Wed, 10 Jan 2024 15:14:41 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 02/10] RISC-V: Add FIRMWARE_READ_HI definition
Date: Wed, 10 Jan 2024 15:13:51 -0800
Message-Id: <20240110231359.1239367-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110231359.1239367-1-atishp@rivosinc.com>
References: <20240110231359.1239367-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151443_221877_3EB32F48 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 added another function to SBI PMU extension to read
the upper bits of a counter with width larger than XLEN.

Add the definition for that function.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b6f898c56940..914eacc6ba2e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -122,6 +122,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_START,
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
+	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 };
 
 union sbi_pmu_ctr_info {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
