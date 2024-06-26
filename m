Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07382C3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24kkdLlviqd6Q9EIhjeJSJxllAJgCmwLUEKBgSv7gUg=; b=VWREkssduUz8jV
	pBOoz/vKGPdwFzWXhxtVjZ4w3nXVVFqSGelDglUuQQW9qTD+9D0PJD+WpEwuCS+bxDZohBPCOyg32
	Fe7AMDPTmY+VkGEdId0XLTgzl7UjWsaJ+xONTjiPL8WnjH8oY9ITC33tidt28d7Ud9GSW2bNJwlO5
	HlZ9HGKejz8N1sBQzzR9jB1uvZhRCyDCHQGq9V0aA+bR/iF8Ue0VDX5KmZT8s7eJC4+vXX3F0RSUJ
	Iae2EAqH0oHchHckMwg5VUwcp60ej8C2tyJlwEQugFQSY3AMSFBJR6TzS8iURuVSirr0/QonM8vKd
	/OwQCLzRy2S/FQ/PQwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN17-00000005ic9-0IeR;
	Wed, 26 Jun 2024 07:24:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN0s-00000005iUo-2hac
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 07:24:22 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-706683e5249so3130264b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719386657; x=1719991457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8anUdf9RYagj+8dVpBIC/eX2xYMTPOXrNSg/TEplCt8=;
        b=Nnx+9rPZ4vToOcxPwqdKlqBM6Q0TfJeRMNJTc880EwG5HnAEqQ8VlrVyvSD4Axi9EE
         iNn+iot7iE9LrGcEKBkC1IHxVehxd814sQ8xuVWBdBI9PYUbliPw9o2IWq/VYYor9zGX
         yLOAneFKkCOH+hHiaTF2nsyHUybPYgAn+EOz/Viz912ZwQKox0skooTyh26yppb3knEm
         XIFHcxJPEOLQkz5QJMSam0Li/Y6PWDFW658wb+YrE5GtxCfnfyvIc3igwrKMtLXpemFh
         XVFd2YgKeaxTBHAj7GZwQxczFkLnRgqSK7vhlRf7lzNFvZNt98x45u2WmskUUeS9yJdU
         ETrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719386657; x=1719991457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8anUdf9RYagj+8dVpBIC/eX2xYMTPOXrNSg/TEplCt8=;
        b=uR+2s2rJKroPqDRS8Ri/b/BMru0WSTSf/zQY68AjwY3NAMkSB9e/zWFYhYlMxmqkx4
         0BgvQeqK9McotM1LtjdeWd0SZFydp3rE8V79qZGphia0K9NULZfFWIhCP4Ny/0zznPKF
         V2eMGMenHlsNxTRhC0JUNzIFZblR5Qdg+mxRTtBXj1eLPMqTN5pPX8V7qo3og+lF/Ymq
         vwwWo7v5TfeWlES+1B4UREYgZyPpACb+Fqr+UxRZMN+KcErawHDiY5PNrloC74ci64Q9
         Rsbd5SK17BxeVabUP5rdWjkYvwy0GTqHGKY4GUJiN7AQ3gYsP+wS54edV3bpkfjR2C66
         N44w==
X-Gm-Message-State: AOJu0YzyzRMgy8oGErs72JlJ7HNsKdZ7NumNQw+xd4k0IEConvgJdklb
	67SlicaFoI0YDnn2GlrRNqTj/pyOrMUoNLqSq6g0wyfrtT94DJYdFNRImILtnzs=
X-Google-Smtp-Source: AGHT+IG/ltx0PscjisU5QEngpWeqUQrsUK17QM5DEDcSKzn36CUqRKBVIIjNHW6RZ5CQaoW0qeXI4Q==
X-Received: by 2002:a05:6a00:bf0:b0:705:9aac:ffb8 with SMTP id d2e1a72fcca58-70674582b1bmr8915411b3a.9.1719386657496;
        Wed, 26 Jun 2024 00:24:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706984a721csm2692218b3a.37.2024.06.26.00.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:24:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 00:23:01 -0700
Subject: [PATCH v3 1/3] drivers/perf: riscv: Do not update the event data
 if uptodate
MIME-Version: 1.0
Message-Id: <20240626-misc_perf_fixes-v3-1-de3f8ed88dab@rivosinc.com>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
In-Reply-To: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, garthlei@pku.edu.cn
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_002418_891645_8090C896 
X-CRM114-Status: GOOD (  14.35  )
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

In case of an counter overflow, the event data may get corrupted
if called from an external overflow handler. This happens because
we can't update the counter without starting it when SBI PMU
extension is in use. However, the prev_count has been already
updated at the first pass while the counter value is still the
old one.

The solution is simple where we don't need to update it again
if it is already updated which can be detected using hwc state.

Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Reported-by: garthlei@pku.edu.cn
Closes:https://lore.kernel.org/all/CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn/
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 78c490e0505a..0a02e85a8951 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -167,7 +167,7 @@ u64 riscv_pmu_event_update(struct perf_event *event)
 	unsigned long cmask;
 	u64 oldval, delta;
 
-	if (!rvpmu->ctr_read)
+	if (!rvpmu->ctr_read || (hwc->state & PERF_HES_UPTODATE))
 		return 0;
 
 	cmask = riscv_pmu_ctr_get_width_mask(event);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
