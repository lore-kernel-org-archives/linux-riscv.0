Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85084C531DE
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 07:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9aXIi6z14JrVvjtMas1sWJNRVJdrQl/0QnaMILrRng=; b=Zp4taXsHrakxN4
	BsBnfCeR+6dF93VZqHy/Lru5J0bhHZ2o8Zx/9e6rbGZR2T6LxzhPkX4sOnkwcRtthEq6AykwmEEik
	GRurORY9fbLQuoimEl05f2cjd2tZ6pxNyzpwoxlu1TYSMUXdKqITHBxFe12Vu3g3F3pl/ZljoEPyw
	Pxect7ih76f3UcgxSdD4AsnCs+o4Z/pymvbbf49jKAC/9GgjplyPGYEtC+2DGbqmA6GQXIe55cbsH
	i8QJHsGqz3Ju/9X6OkMCS0KVTpJd9lexle08GrmMK4PishZ3pQjJkGajOi18qucVr86D2A2MKQ8tr
	Hh0WYeMKoqFZgLuv0Cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ser5L-0000000C2R4-2HMv;
	Fri, 16 Aug 2024 07:09:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ser4o-0000000C2Ep-0W9H
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 07:08:55 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7c3e0a3c444so1162033a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 00:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723792125; x=1724396925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw60AMQmDUGOq7sBB5Z5rKu5bDKRw5A77nRIXJhY5Ak=;
        b=FDgWqhRfHfHSxJgBLz74BGGkOHhQM4/QscXV30Ym2F6ZEsntDv9TViMQvctqTzM/IB
         at9cbcxFUD/N8Uh71DlEOpoduP5fTByFSHX4DPSc1U5BPjyZ6Lwz1W6hBJh6momfqpJF
         Hi0QZB/ERNB7rRFSDPKOCRNNi0PDuntBEqZsjuIIYE4ZlQ58LnF+PA6LVVcG1+reZ+o+
         PVn9rVC1NUP/L97FbQiVYTsnrR6cmCIZqS+CZTFLc6ak1ve1EFOJHeCtNXtwgpIefJPf
         oFOeW8QhpGGVJqu72HAlxvuNhSCHC1VCpBmH172WBd02sysZSzU54bYxgXN+TcAjLcMG
         IkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723792125; x=1724396925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pw60AMQmDUGOq7sBB5Z5rKu5bDKRw5A77nRIXJhY5Ak=;
        b=UZt8jQBFYElAmssmQq5OvVQaa7z74KSx8Uj5wd6awecdkutwFG5WdMOwS8VbzQshDy
         2MSJgDgRhoB61IoHonXeL3bfb2Zbfb0giXInBJqzZ5v8aot1Y8gEoi/rbdBxR9MJnUUM
         I0QqgsQArYGzdSoXo0bBYCJqAtzHyWvQFnsg6Vs+B4qdOsHo9ZUq1jCT1qUwYoYIQnkQ
         DChzLrhD5VuYn53sFwIv1H4Qcdw0eVQoSVmwgalRy1OQqktd4c88n7Cryumiptn29ob2
         Yn3lrgMcBg/INE0YYGc6J5MSGZruFg5xy6kuxUYmmZUf79ACR+jTmVENr9BrdhOy8iNR
         CNfA==
X-Forwarded-Encrypted: i=1; AJvYcCVunYbUWFSQwM+SKnmmGQk7iagm0rbxtZS1R5JfhC3EBHTI99rThf3HkKHMlDGQuCwNea4YvszprM020g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKWBNdo5sqjylZhpoS5xtBIVzIwEl0hW0Hkk4n9PPMegM3uHPl
	we0u0hZgt1iRxbEOkdvTquzNUe61pCR3Bcu3R3l0BxB7bbMh8hpZxtWUee2V1NU=
X-Google-Smtp-Source: AGHT+IGfPiFtzcHt7xqywSUtWik5isvNee8OUxNOoMhtzMTbtl8SwHVtQ2tadLTbV6ViRAikB2BvDQ==
X-Received: by 2002:a05:6a20:244b:b0:1c8:aa88:f10a with SMTP id adf61e73a8af0-1c8f85f45e0mr7807946637.10.1723792125575;
        Fri, 16 Aug 2024 00:08:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b636bcabsm2293792a12.90.2024.08.16.00.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:08:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Aug 2024 00:08:09 -0700
Subject: [PATCH 2/2] RISC-V: KVM: Fix to allow hpmcounter31 from the guest
MIME-Version: 1.0
Message-Id: <20240816-kvm_pmu_fixes-v1-2-cdfce386dd93@rivosinc.com>
References: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
In-Reply-To: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_000846_226688_4796CB96 
X-CRM114-Status: UNSURE (   8.93  )
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

The csr_fun defines a count parameter which defines the total number
CSRs emulated in KVM starting from the base. This value should be
equal to total number of counters possible for trap/emulation (32).

Fixes: a9ac6c37521f ("RISC-V: KVM: Implement trap & emulate for hpmcounters")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index c309daa2d75a..1d85b6617508 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -65,11 +65,11 @@ struct kvm_pmu {
 
 #if defined(CONFIG_32BIT)
 #define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
-{.base = CSR_CYCLEH,	.count = 31,	.func = kvm_riscv_vcpu_pmu_read_hpm }, \
-{.base = CSR_CYCLE,	.count = 31,	.func = kvm_riscv_vcpu_pmu_read_hpm },
+{.base = CSR_CYCLEH,	.count = 32,	.func = kvm_riscv_vcpu_pmu_read_hpm }, \
+{.base = CSR_CYCLE,	.count = 32,	.func = kvm_riscv_vcpu_pmu_read_hpm },
 #else
 #define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
-{.base = CSR_CYCLE,	.count = 31,	.func = kvm_riscv_vcpu_pmu_read_hpm },
+{.base = CSR_CYCLE,	.count = 32,	.func = kvm_riscv_vcpu_pmu_read_hpm },
 #endif
 
 int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
