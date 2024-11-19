Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5903ED6C295
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROOgjRt2xEhyIyozzXAsX+4ijL2IyWPxCWf+WrIxwtE=; b=xA0b4P6pCX8QLh
	3Jqy234GdpWp+hP8sdhyN4qWUaxTcS5xZe7p2ovanlDDHW2n7J1WvIPKVV9izh8TS839lWlr1jAv5
	RfMDmW1+Cwev5KptQG0eM3qmeUxA8sWwVyrNBp7jJX7qw0y+Lbe/X8n725Y60liq7wBwHj4JV8dpA
	ehgZQt9UHjyJ9OqvSoiJZkmJ9EJSviEO0CKZDl+89DHX9rCHXr4VgtAiygT7mxNKmozR8emTeN/3l
	VcLC9mwlFBnzG5jy2ZuEToqT3E9LyjyraTJlVaeLelvT1Cxqwjyr01Vblq8Zliat8hyl3sw1sX/As
	079VYwyUJxO6YFqGVJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUvt-0000000DiOu-1lo8;
	Tue, 19 Nov 2024 20:34:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUsA-0000000Dh0z-0TNv
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21260cfc918so6570755ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 12:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048253; x=1732653053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=jVztKBZYIiwfHJwPnQll3hpJfob00hcca4cay2IdVHosnVCLnWrbjlNv5eI5ugfUhf
         ynryhK90E6MSTcvN/12GCXPM4uJ5UMhq+ssOuK8fB+z+nhkRgSLgfqWq+l/2gZMNtwFV
         izqlRdy/rUl4YWaRoksk0/hql0cpQIzNvcK6XvbKJlNa0OywHmAE1mbDjbogaN4Uwk5O
         hNs0FpJ+W/DYAs1BccwQzsa5JDet1vcy4XqfLCylbX1I1SGXrsoA+8hMO+VlR+G+s3FF
         1pZ2OLGKqTriC4BfyNQFpel2JG0cpJ13sYUm7+al7vvUizDlsOHRIUYcHZfHw/7cbtkL
         tUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048253; x=1732653053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=RaUeaf1QILoZXL2joAA5SO9chmgYUOwU38lV0S7gC3xAo9z5gxJwl+QCoyyrppCXwx
         SfxkDuThkiapTIKOqbcthqfUpnegQZOvgetno1CIjukZAzZTa/pw902BgzG4AJ9+C39q
         LM3w97RrYJkoixUfcOwsLkrvSqL949sn1iFjiWrIOpaICubolrYevMMKUzMNwkCtt8r+
         tBp7HVKo/iN148UnMAHn3SHsfPbt1OEhNy65oKe68IZHZwAaau5lod61h7fT5YPLMBLa
         A9UUjc4W5ZlStIc2T3vBbJcUAVf3TThNNjROqQVZlCcl5F4IzM0ZaEKg46kohqenvBxM
         iNTg==
X-Gm-Message-State: AOJu0Yw+NLE6ycMiV76aSasG2lnrqo/3ce2al7+VKo+S462yzD/4ndQ6
	fdefQSwn9Xo0pZfrABhhhvFBNqqy8JriCjWkSO2l0cUgCjgscDVL4nUWmSISYVI=
X-Google-Smtp-Source: AGHT+IEafgQoRfTXfxDGUyFBcxI9JgtU3iA1K006RwHi5mhUuXe4EdyQsqlE+qS4Y+FQs5c25dBVLA==
X-Received: by 2002:a17:902:dac8:b0:211:e812:3948 with SMTP id d9443c01a7336-2126a259979mr4712555ad.0.1732048253488;
        Tue, 19 Nov 2024 12:30:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:52 -0800
Subject: [PATCH 4/8] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20241119-pmu_event_info-v1-4-a4f9691421f8@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
In-Reply-To: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_123054_151759_B02F4FB9 
X-CRM114-Status: GOOD (  10.35  )
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..efd66835c2b8 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
