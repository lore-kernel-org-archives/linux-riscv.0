Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CEFCA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oKJIrVHUhgCIjfVEZAtGk/F2bs1mGLdfHkSBwc++JA=; b=GUCKpN5OVZjTQz
	430GN1cpF0PV+GKGasE2Ss9FTDlsNMz03YAc6zZKu+Dw4FuM1orQYKN2Qq48EGPGPQ/X0JMuCfIB+
	bWV2oeGavswY7fNoE0dM0UKeUUq4ZW/hJJSaArE8jtp+xnOCCuwm9QGbHGTp3jy4APwIYpO5SADlM
	NfWI41bR/iXePRAsRSrH1W1P2mb3RJNrzg+9agGvbTuCqEw8imxwpIqePgxE0daGddrFo/OcWa7iR
	eqocLOPWfDlWfseGQZVX6gjbw+1PNILtU2UfazYC4E4UT+gfU013twARZgYI+0eBFcCA0Vi2xRzof
	XDfWnajzvHaov0om8fwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyV9-00000003ADq-2uuP;
	Fri, 15 Aug 2025 17:46:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx4Q-00000002wdf-3JVN
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 16:14:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so1657040a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755274462; x=1755879262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOTbtPDm0qsjMzwi16WVYcaH7+7/qMVJUy8rQwaf7Ps=;
        b=m/coDFHec+xFVvjMWZsEEyBa4qnvm40qKUHHT/YNYp6E80srv0Z5Tiiw5O6ZCSobT9
         vsaO0OeqTZq32XUIQ6w8mGDXPpj8WgckEos7AIn+pmi/3h9Qq1XKohGrCRmzlj2bGPEv
         C83nQCA5lfYIelM0BD7YyQIJSqf/MxUxG1obRDKmB6JMm6Y8m5mhDcSF7p8KTHMTdClv
         isqo8x6EeuF8ih6BlmWn0W86VQnBm5fMSYVWCNvwIzMGTturMLYYEh1nt6gvRmLIObaF
         8TNdqslU3RMknvz8nE5S//wd78PwREtXVXjLx+P9jzCq3QEa8ToyAdUPNMZIVNICfdVv
         S6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755274462; x=1755879262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOTbtPDm0qsjMzwi16WVYcaH7+7/qMVJUy8rQwaf7Ps=;
        b=ZsQuhtD02P6KU0OkgrMip21EktrJsmLPNBJMjw/yofKxAMGVoZp0hHSmQW0bckRj1l
         cBKw4bgvRC2yCeGIcuI7ccwH2b/YAK5dFIjMPtEbwHGWMdiBbvGD8G7/D2uR0y7Xg7cy
         h1HCEChlSX2IBJRO4KeqccdrZWKLL5BZ+LDz7eij+yVvPzgXihWfYeX53YQhhGBeeWp3
         JV6H6aIu5hxMQAawXjxNahxzfaEDu9HpBz0NMMNOoZQpucUUwOBPWgXLKcZT9viMGFLc
         2Fcwqju+6YKUJjSkxZEDIGi8NN1PwbxWnIsUblPWc74EHfz8dz7Mf3MHBMHTpcAbjG4Q
         feXA==
X-Forwarded-Encrypted: i=1; AJvYcCUNDlusIgswh83L+ElojjkmfYTIjBGgC9nB39DY4TjJlpTdn0Rug8ZndZRJpjav3XKKg+lKq9CKRVvLlw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeba5ix0F76nomIGwd46X/kREKS2VxEOCCRc6MDZONenJTsaaF
	QsT05yMM1+EiiG4Nhn5q4BcoeqfLPEWvDmLLaEzT+CJM+zWODDFuw4h9fnPB95BxCvE=
X-Gm-Gg: ASbGncvF4vX455vQtYbU8yb5f7p9hahRHHz0NY7xPNB8/wko2DR4SR4DKWAIvHiqB84
	oKtHsy/IW1DRI/yozI+Yo16eYYLKbx9SAXdpkH/3Zo1nXdzBQzX4pa9ZJS7XSx7EDFJILI3aGyk
	JbwwffzonRHv+THghd7ucFtfqsBhE4Q0wfIfaf3oqZeC/IcO5Z39EK2Zxgkw0tB1KNAiTsFlYiQ
	knSVVHeCOgUVb1sRmQjm4G/Yg79hCo5SBgUonDc0YVT7uQOaHkuJ2Qrj3FUXjeYQjnpKjZboKxh
	fMOBn72oLODlSDl8lEn/mmdRXKoUp/c3GI5gE1XIV436huWk+GMuhRsGRlPHUkX4idX8C5jlwZE
	zmrwgEPMO0VtXnbm2RD/3+Z52OX4q8WP3jiawyx2Xm15ArdUss4v0biA=
X-Google-Smtp-Source: AGHT+IHFvFTmbcxXmRN3DXHTp35ctiVVaiF6Z8YM+uVIV53DcXSsUv4K9ZPJVyFNnw7pfMwftn7IEw==
X-Received: by 2002:a17:90b:3f08:b0:31f:22f:a23e with SMTP id 98e67ed59e1d1-32342161425mr4018316a91.27.1755274461963;
        Fri, 15 Aug 2025 09:14:21 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32331123409sm4645605a91.20.2025.08.15.09.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:14:21 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
Date: Fri, 15 Aug 2025 21:44:05 +0530
Message-ID: <20250815161406.76370-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815161406.76370-1-apatel@ventanamicro.com>
References: <20250815161406.76370-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_091422_828391_CFABBE61 
X-CRM114-Status: GOOD (  10.68  )
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
