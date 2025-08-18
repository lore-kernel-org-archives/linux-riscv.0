Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42749CA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVczVLGgGdM3LoFVnpLUcz4E1DMPZbe+AXOadpYaK8U=; b=0OvZOI8EvMMouD
	AP4yF63eLWjU07w662QiE4phVT9Ua65huU2NiaQebz6HXgB2sSJhxWrKHZR3qzvMvO2ZJPq+tYbDs
	UzhrRcCpQopA0zh63qJN+PqBKOcQ0Of0JtMek/IXdWnXYFy+6WwELp8VW9FCwCaWlnvy7Yu6XCM1e
	rLr6hBl6TOcp/ZTNDOtVyjnFQFHa2GCJnAkUQwDqOAqVHf7KqEhWRTgHv4ZkHYTfneLmix4WDmE0w
	4qGiwmOy1ZvbSDjlPJP2kIFBnN6FjdS/Tmu5N3CUJyDIG4nEY3uusj6ssd4xgXO8O16ELldZ8FRfI
	BnYC6Ls0R7IiiTX9xQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hC-000000088Wh-3uVI;
	Mon, 18 Aug 2025 17:30:58 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0yi-00000007lzU-2tRO
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 14:36:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b471aaa085aso2406372a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755527811; x=1756132611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQbiLTQGi4sOYDMKTFgGpWiNF5qAYuHZ+4Lz0Qn0zrE=;
        b=Kl1Umtu5qPEciLkFTpYLjB2btB8gA15JJBzNlsPTXhMSJzbqTvPnzFLRGspfv+WWhZ
         K67f4exMidEjoaDKN9e9ggKCTwsdU2JhG2iGWcRdNtOkC1JmGnmZ4aWwmxsn/uVHmHs/
         Zb6Kasw74b0FIACr6tBQFUIaXm+Pd+DCB5pnaCBigNOuSi8Cc2MpyKx6/DEUwGzIXvqQ
         C6UG2A3o0hU0g3Tr8wkmx/ahAVljxj0HjDeQz/xJrCxuFZal4XfVSmb0ct+hBD+efWaD
         8BgT44+E2R+W3M0yJ++RooQaf5kKiJUUSXn1iqXWg2Rt5SwvmOdQe5VCztzvITJMP4dR
         ad/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527811; x=1756132611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQbiLTQGi4sOYDMKTFgGpWiNF5qAYuHZ+4Lz0Qn0zrE=;
        b=CBYOD50G73Wx2UuIfQvVHUAPbBMkCJUcDfAeqq+he3cVRHGqKrZ+QxHUm/VUlEUiaa
         w6GgyrFXkqdQ6+yZxPjdesnL/IiKChXcx7zDYGmp8kuXnQEgwVio5G9f1qc2CqvFsB3l
         3i7UlHEBcE4XumRXjO4qdLSYa8Fm24L2/Y/XJpOLmt6lxgj/QM3VAFyQHb0ljk63Dg0a
         bHtWXaLeWTkK7LoKl24SU0YTJuCNm5I0s5A1Me9qKO+boY+nsMXgoe9WmMNDxv0g7s71
         R1WK3z9mUJM9mYdr1HX217kCxtpTulKtvrsfBG5qkemAb1tmwGLu7wnRoUqFmMAtbLfz
         iyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHj9CYUHMj6O8sHc7GQ5k98kmEWqkMe3W6RxCESOzfp4iWwSRFw3AVMObodm6ZC8QF2W+HJUkS6LEYcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHamb/9rrM/NR59A8tH/zMJY/hsaoB8SHMrRsR8kW40QAYobM+
	sAUFKwHFr+nBp8iLoL6ll6c+dkXb4k5H2uGFT3A1kjWZWGn60eA3LcFO4GWOkmB1aDI=
X-Gm-Gg: ASbGncu13OltTa2wgoT5M9PRj+HSqNtfFc7WNd3ZDSGgUjhd2DsN4IJgkhPO+zu97Kx
	hvjiWKC3hY/W4LZ0QitT9/E1kEi8OyC71cSEEYeQN1VUDAn2SOjCBhPBOBuLC6yODQTaGMRLzI1
	f4enL8iJsn+zUB+X22YWGX0WoPO9EpmdzFQ+xoI8lS0A7CgCD92iSGHKCXCsM8JvhRBEfiA9hFP
	mj9eia5CXuggZZ8ZQyBODyoaKqm81LwMTAq5Oj2DZr/EwMaRqa84gb6m2hlPiVhit2za2S+Ueg8
	qOV3JEnbkUoE4cOaQ1FzAEYY4ArWy2NaHd2wcoPRyBPqWqfCngq9XnlRebUM8vQGmPKbTJBWg+U
	PK2ySjgE52jA09iXl3/3s2idD+snIjmYBPjGiVdESNP4yLmEkpT6v/68=
X-Google-Smtp-Source: AGHT+IFPjTGWX0YkyeszTwSPraUCxDH1MMY6bmni9f8pZnvxHNb7k5FK6QV/gsCMcRTABLOy2Tdaqg==
X-Received: by 2002:a17:903:b07:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-2446bce41cbmr181639185ad.1.1755527810969;
        Mon, 18 Aug 2025 07:36:50 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm81704945ad.75.2025.08.18.07.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:36:50 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v2 1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
Date: Mon, 18 Aug 2025 20:05:59 +0530
Message-ID: <20250818143600.894385-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818143600.894385-1-apatel@ventanamicro.com>
References: <20250818143600.894385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_073652_724868_B649E059 
X-CRM114-Status: GOOD (  10.65  )
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

The cppc_ffh_csr_read() and cppc_ffh_csr_write() returns Linux error
code in "data->ret.error" so cpc_read_ffh() and cpc_write_ffh() must
not use sbi_err_map_linux_errno() for FFH_CPPC_CSR.

Fixes: 30f3ffbee86b ("ACPI: RISC-V: Add CPPC driver")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/acpi/riscv/cppc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
index 440cf9fb91aa..42c1a9052470 100644
--- a/drivers/acpi/riscv/cppc.c
+++ b/drivers/acpi/riscv/cppc.c
@@ -119,7 +119,7 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
 
 		*val = data.ret.value;
 
-		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
+		return data.ret.error;
 	}
 
 	return -EINVAL;
@@ -148,7 +148,7 @@ int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
 
 		smp_call_function_single(cpu, cppc_ffh_csr_write, &data, 1);
 
-		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
+		return data.ret.error;
 	}
 
 	return -EINVAL;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
