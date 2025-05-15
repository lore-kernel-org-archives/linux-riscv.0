Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DC1C3ABDD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2PSEzecrjuBlPHfPRDz1eIBcLr8bFrq3P4bmaoVq9l4=; b=lo8GTlCc4rBijj
	rW9GR/aOltoEX1Js5HLLMAa/X05VPb/TIhPVwEV12F8yFcgLD0bztDaBzOzEX/nQ/Qc0ENc4vZUIl
	/7FccGyLbfwk8vdJe1zWyeoWp1pcxNbucvjTPc7hLn7iBtFlo/PnQkEHSuW/pHRRXyBdxLnlKckpj
	AS43Bbsrg4wdMv9POQR4jZxseAo1hzvfEI/mMVRNammq61L51rE1es8s9xnpCEAqiA9PhgNwxaqRy
	6CQq2Df+BZWGicK2euPlJOEI0FkGF6LwTyDVAeU5cUD7/n/WfTs31E0I0stD3hEv1A39NmvU8VD/8
	F2ow4hKg46ry9N1RbQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVXL-00000000GE6-0X0r;
	Thu, 15 May 2025 10:09:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFV8R-00000000Cj8-09zA
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 09:44:16 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-73c17c770a7so918233b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747302250; x=1747907050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6FV+5tXVPlvC+Cy3Z2x3GFn7teypKn9hvM6n9ipgsE=;
        b=N3n895cphobOsVwGuL8vakbGFCBbpyISloCCgzTOPzmk0rMNfIblxoYAgvN/PixJ3n
         AeLlvoeSXK1GfJLYiPdF8mRd3jN2ou5wBfAYy18WRg4iQbjLLQueXNXtoE1l400ftgOu
         J4gdve/uSnordorrDiN3hoQBlZTU4nmOa1ltJluY59N8LMh0aRTjkMez/0a8Hn07gIji
         RHbTJ7ct/UHZVaPqdYm9zE/CEEnKvjWNK77+jWWQQPo25TCLVqAUAUXWnVr3cKOt04bg
         u0sZ67kz8bJgePW0YK2XTT6i8xLuYWHU2hMY/xftcuxr92kdB/aNZKTWCnvJm6FJJ3FL
         2L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747302250; x=1747907050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6FV+5tXVPlvC+Cy3Z2x3GFn7teypKn9hvM6n9ipgsE=;
        b=l0jiF9sii9/1OnGCN5Orx1cYmZsCmSHUOYtgLE6KgeWA19msBo5ENs8KNZqKiMetrK
         Ff3j51sO9uXV2/RNWqwhIRcVqM/d6+DYv/NblosIDG2/+UHlHSUrxrFBnC+CFvEiBXVA
         NfCGpPLgE9SQX2H8uaH0aIO2UP5U9HH+N9w17muGRNgOZCjTND+bhZ1fkP8Gm0/wjyN9
         jgyW7Prt1VQw2IdQBRckYpc9xegHKs/1CBPf9I1fhizloHGLdClisz2Msv7TdQWCsaxY
         tn0bPhKo1VmPyzRITwVwVYpMyUxU488tr+IZA4XvggXYZjnbj46wbDQ7SIY3+ZECcfff
         yFeg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ho+hMLd9NoXu9CE4/kd2IaFvSSModqcgD75VeMdeDkvoyVIaNxKS7chK0nsppMVqXDS5deat0WBMiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNkTj6bzkP/SiKzVzZucODsnRq784CpsEZy3WB4JUYCbdg7xwP
	y8Zje+YmQ+5Nt6Oiul58ghcVbALmDvytbPqZG+ZS4BtgUJGoG0JGk70TqERAv5k=
X-Gm-Gg: ASbGncsz5fa263QM3n05Gbd0PY0F4TGLbJ/fdChRk/IovZb9h2A6HY6IEQltBnIXcKJ
	AVX0HZq+LWB3jlmUZDfLWBCze69qmgbilP4gTJT92EUNw8OwQhramz2x6VBq1H2wsjoIFZ4bOex
	Wf8h/bpE8Ighm/Y1zLkp2ehOF6JWTyYNJEiDQoIh5Y+TcWE07u0u9BHrg2Nbl6g7jH9NolvU+7H
	wcr1BWp1z103852Vwj9MP1BwNsQCaXO6J8j/5zz/10ZUBnY3rvxD8Bn2dg0XA7mPlT0o1Zk/sz5
	OlPeEGdx9OM9eudWHET6c1XWodaG0z6iaU8Mid2KPsev/lwE4TPb9vJdiOSKGZwQorjOhJxhhjP
	GyW06S5Yq8D0y0nvE
X-Google-Smtp-Source: AGHT+IEh2dxMPj7kTH/MLpVyfxHPA3w9CgIogon2Q5H7XcXm3dZOwAfa/YfCslxFD2QlnH7LR4V86w==
X-Received: by 2002:a05:6a20:559c:b0:216:1476:f6c with SMTP id adf61e73a8af0-21614761195mr1115182637.13.1747302250378;
        Thu, 15 May 2025 02:44:10 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234941b886sm10299693a12.2.2025.05.15.02.44.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 02:44:10 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: sunilvl@ventanamicro.com,
	rafael@kernel.org,
	lenb@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
Date: Thu, 15 May 2025 17:43:01 +0800
Message-Id: <20250515094301.40016-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_024415_410097_C84CB083 
X-CRM114-Status: UNSURE (   9.76  )
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

Add the read of CSR_CYCLE to cppc_ffh_csr_read() to fix the
warning message: "CPPC Cpufreq: cppc_scale_freq_wokrfn: failed
to read perf counters".

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/acpi/riscv/cppc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
index 4cdff387deff6..c1acaeb18eac3 100644
--- a/drivers/acpi/riscv/cppc.c
+++ b/drivers/acpi/riscv/cppc.c
@@ -69,11 +69,14 @@ static void cppc_ffh_csr_read(void *read_data)
 	struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
 
 	switch (data->reg) {
-	/* Support only TIME CSR for now */
 	case CSR_TIME:
 		data->ret.value = csr_read(CSR_TIME);
 		data->ret.error = 0;
 		break;
+	case CSR_CYCLE:
+		data->ret.value = csr_read(CSR_CYCLE);
+		data->ret.error = 0;
+		break;
 	default:
 		data->ret.error = -EINVAL;
 		break;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
