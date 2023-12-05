Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA01C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDB+impy5GPi5U8lFqBOKfN3cFSm3/d7VooEtGbQYD0=; b=zduDKjFJNXnef3
	CjFu748pZ6Lt4pw918rlSqJJUfjgp7Mg96E2xg6RiTe6xDjLHcHABGx+ielAjIh8IIZgqI7G6Rt6D
	hEkqk4EM50LQPLsXNExne6wr9Z32IlJU7JZlPw85W6baayC9UdeGnT/hvyLA8Hc7dz1pG19TMir3s
	Jsm3dqK0N31oVs1hxwc7RDqtSMlDedqR1AFUJt6SC5reh8qM8WhWFgXyXqViBHu083CxM1fNbEYtT
	8FRv+8xNW18R5vdYDZlNhpEokXJDcyKbuaYLweW/B1mAoH8l8b1F/AVdxBAyYtI3T3ZJWnadTfqXT
	611Y0A01UUKta78nlCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPR-0063xZ-0T;
	Tue, 05 Dec 2023 02:43:41 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPM-0063tp-0X
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:38 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d855efb920so2943862a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744215; x=1702349015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t/9Xz5DiK/wXH2NqGUZGNOtmRM2KXduxsMbe0LSN5g=;
        b=3UkuZvAGb1h60S8tcl1yWH0PKerOfVfN/57/4P6yK4DJoM1WGbr/KZ38b2i0tpjQbK
         ttlLsEnJBg0ZE1XO+y72MtCxXBw7hAnwmJzSK9uXYUtFmqIqN72Zv3O7654DpQ5SB4xi
         twLchUiXkDa4tYiNz2yyCyRJ8/T/KLl1FOhlbVqmUkOM8vBGSVXThE3ZiUQYOddPEnEi
         Qvnj+D9XVgPCpeJy/VnOzYDIkOG8oXRE3q907MxQ2scKOSCiHVMPiQvHTGoCXUys6emI
         7iBpCjeyeR9q9Qv0MHbTen9U2ln+09n1m8+xhVg6QuZyZkFjrR88sKSrxPRFsxGJUULx
         BjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744215; x=1702349015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0t/9Xz5DiK/wXH2NqGUZGNOtmRM2KXduxsMbe0LSN5g=;
        b=we/PZVWfqIl+XqhselfHM1FpxL5OpE8DWuNfJoG1D1gNaQrPE8AkqpEKyIzlaNNKW0
         elwiZGSbccm1yHxlHCrshc/Mfno2oyU+gK6AMVowIgS2uQX6OPNFmLTI3sFcEG3ZOPhc
         lYYmi6v2G/DNnhBxZwsPcLHooSeUOsnpEN50REC8Edj3SjxH5jFDeqkhSeM3mwJRE7/s
         oZzuLGoXPzpKJoirvErI6fuLXdOky2xPG2ccCuHh2F2cfzPp5fzPLk2tjGzP83Y6OruH
         v/Q3MLDhTn2A2hgqW0U6+QYH0ReceKg8lLDz++IxDAnZ5Cn672kkneYMn7VAAeIf8s5d
         K6/g==
X-Gm-Message-State: AOJu0Yw1/zLC9qeicaq7bq+qq3sk9SSBA9STg0aTk+NVZe9NIq1KWyzJ
	aSXpG/pykWCDlkqJLmiW4eX1UQ==
X-Google-Smtp-Source: AGHT+IF/knJEBDAyziZ5bGsFkd0zgoM9yPDKanU8wPN8v+9Xu+OCLihiseLcaJtMfQMkMK0rGT1qkg==
X-Received: by 2002:a05:6830:100f:b0:6d8:a456:d99d with SMTP id a15-20020a056830100f00b006d8a456d99dmr3450114otp.5.1701744215637;
        Mon, 04 Dec 2023 18:43:35 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:35 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 3/9] RISC-V: Add FIRMWARE_READ_HI definition
Date: Mon,  4 Dec 2023 18:43:04 -0800
Message-Id: <20231205024310.1593100-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184336_374662_B89EDDCB 
X-CRM114-Status: UNSURE (   8.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 added another function to SBI PMU extension to read
the upper bits of a counter with width larger than XLEN.

Add the definition for that function.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..f3eeca79a02d 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -121,6 +121,7 @@ enum sbi_ext_pmu_fid {
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
