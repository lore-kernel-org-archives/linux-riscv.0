Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75387C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3NhroBSNq/ov87Km9JgGvg82b8l3AWHJsReb2LaDdI=; b=vxkKlDTvLkDUsC
	P3dyMkXLPeqKkLws0hUr2uq071luaZbdtA7fjXco2RcfMg521o0TLx8AM8ASN8KQ+3pPu+H2WthRj
	RWSS3igoXG0hTvwOc7H1mYqIrsASLCPCBRkDMTrlE/qbHIOtLjlnJLQcuQ0LFM2Rd3+2AZM7pgJ9q
	fw2W/Uxsa8o6idrXNokbtVe9izFkZ7D7FAxKI0ORMWkAHBmxDV1NxnpRShd4r2vwF56zuBzBMBX/z
	+I1xtWVEsiJmZ/iJzMJvEoa5PfKeppLcJPMBfdzTkd2Xqj610kcDRsLjzW/ZfUjQQhysDjzu5Do2s
	wCYL0Z0mT6C4c/GmKb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkh-00000003nUi-1CpC;
	Mon, 17 Feb 2025 08:45:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkc-00000003nNx-32CD
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4396424d173so38463655e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781913; x=1740386713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPqGeqDxSe+aOIAEww9m1M//H8GA90MJiJy6W/MxoXw=;
        b=cNFpYyJ/GEcZddWnyfOY2ZaQUQHv3CvOnSwKRCcuR9jYW4FITTXhigOYByj0ZlPV8Q
         lRSpWWWSx5ABsGlJkUEvt53i5eVFwMPpzpcFVMXzha65oIYH7LpXY1d85shE5tFV15hQ
         wH8n3RP6ZmD6adXvFCOSO+GpnLbqqvxQl5pXZG5EVO7aPkESUTHKhH3rvAXzJlZwat+V
         WuRpbvqM10tg3vGxShRLrmFennaNXTnDT3jHA9mPvpztDC0HQx9B65fKJLXN9lxOz+PC
         v+QCQxQon8rOqP9tm42kv2PNzBwI0QX+ft3ZG5k59TrBTm1tL1zUNDD/5kJuAYH7zHu9
         36ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781913; x=1740386713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPqGeqDxSe+aOIAEww9m1M//H8GA90MJiJy6W/MxoXw=;
        b=nmFOIWjEWesFb9WZmL7BWRtVVmj6Ru08+THzIz0Kh/3t2x1S9xRI06Bn5kK8KTOKKx
         9L5Uxt/tOvrMW2mwcUYhwKYz+9Ia9YDj0fC5N2iSVbp7yAg5QlIVP1djsgXx/jdbjnBz
         3vJiUpl2/e94W80CWAguPtD5FF1HoshVMk6FWyiVL7Z3pnAB1xgsdz45CqP/MhmpxDat
         j5UEiYISyl+rSxYoBfyFDWkpn2J41Ga8X+4GRPR0Fco/1KLJ15Op3beMlm3WAPXQhuEA
         bid6qbZ89ehC5vLl5FmBP+UQX4w0iNKlh148M6ddCoNzoM0hI+E2aaNLa+i3EjII/ONU
         r1+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjb4SlGlkAp8e4EtS82yJnedF9TuNwwLoIYcpiYe43eFDeP8XYvAxPWFHI/RBOYl6uWVwApkfWsdsojQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4xeZ52J4aBeHguEPjf2fYPPxwz3x+SxIf6jEtIhiW9DVRL8Vc
	5DP4giee9J/1ICpYJ6LomNMOotNOnGOzPz6OFuGGSen4H5dYRtVwqbDDDCNg1K0=
X-Gm-Gg: ASbGncvwQ5SJR1lzg+Gxvl3a0rS4lhmKFvaOmB8X+vRDRdEfkY6UsAD7YdvJgRKo4Sy
	Du5wCE/4zN7mH7X2Axk4mH0UixZBUWQfZch0yKLRdta8+6ohFka37vDZakaiMgiiGVBHM94t9B1
	emI3/HEl1bEmhPcIO1KvM4opmTNSxvPHEoLYsJIa1mmJnXNjhEu5mUuQZtvOOFP2OnkOabArpnM
	x4PJwFp5Mwp1X+uGey23Qbrb+wHSgubm2G/+Seyns15Y3/t8s7QBCY3J4cqYWr0Ul/fLj1RAkg0
	f68=
X-Google-Smtp-Source: AGHT+IFw2SQlG3mEiHsZKLXfCIe42+z2FtTbwXKzNb64tTScHuV6pXuwf02llElP/bUJfKsa7cfpqA==
X-Received: by 2002:a5d:648b:0:b0:38f:31fe:6d12 with SMTP id ffacd0b85a97d-38f33f295f7mr8268862f8f.19.1739781913174;
        Mon, 17 Feb 2025 00:45:13 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccdccsm11661079f8f.24.2025.02.17.00.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:12 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 4/5] riscv: KVM: Fix SBI TIME error generation
Date: Mon, 17 Feb 2025 09:45:11 +0100
Message-ID: <20250217084506.18763-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
References: <20250217084506.18763-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004514_762520_7B28F103 
X-CRM114-Status: GOOD (  11.12  )
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

When an invalid function ID of an SBI extension is used we should
return not-supported, not invalid-param.

Fixes: 5f862df5585c ("RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 74e3a38c6a29..5fbf3f94f1e8 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -21,7 +21,7 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	u64 next_cycle;
 
 	if (cp->a6 != SBI_EXT_TIME_SET_TIMER) {
-		retdata->err_val = SBI_ERR_INVALID_PARAM;
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 		return 0;
 	}
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
