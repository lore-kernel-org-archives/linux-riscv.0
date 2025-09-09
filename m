Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F599CAC58C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Q+aQAbJqSkW7n5zEBIZcvP8tmjKh/YCq8KQxPMgvgE=; b=mGLLi2JEq83N9m
	mmhI9DDU6L49f0zb64BEgnvljFP5ouMKBorC12EYSatxOaNQNmawld7Iy+XyFrrZGGp6RwxVKkktj
	nTSxof4qu6rLplaMaLZHV7trQVULuWJoH0QgIiw/eRQa8gH5aamTty1+P8zGiOYn7Vz0deYZqCWuv
	EMhAg7W4EfUwwmiNJFlXyFw2zrhjrP8tZJQy3YFmbw6hmexw3DOGEbIsAK6LDlwLFEGDGK3MebNCO
	ahiZ4s+u/3xHCHbNBlXmbeKlLZ8FhN0hc5pGkh2bFuuNBgJ8O1ZXQckIfoGIgJCMHvNlL0s29ON6f
	JdXllRGi4H93nBAmPKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvt7H-00000005KzB-3iSd;
	Tue, 09 Sep 2025 07:50:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO0-000000051ir-3sXH
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:29 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so6785045b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401408; x=1758006208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=dtBth6TuH1/hSeO6IS3rZlS3NQ/UpOd6bE7SQbRx+cFJpVRwXUwh1zVOI0Z5p+XcLY
         lLeuxXAAlIFleB1IOs7i76IxOBxJfM8vXHF3yZUVcWMgfoFjR0ADcvQPUMFPRMHXlG6F
         MVkcZrPHwXGtpwzVHKBsOQ4iLjZ1CWOh1XUv4YktkNrsHC5ddc0L7WM+xpqQteQmqb9R
         XCjRHw2me+gu+C1HZTtjEUmzxoutX1jxKY/1ZFbXVaEoiahWtKBfyqg5WkWFRlQFhA2w
         fvRURp6cTLktMFwKfNZN746aMbbpPLiLu5iUhDXV2z0j6up3bxJA4YKk/c3RhRM7uC5+
         oY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401408; x=1758006208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=rVVUzOmNcs6scZ2W6BpdcKAgDLIpUoT7JDvLtQDdPGdC3yh44MBcj1Cji9wBY/sduJ
         QQ/GWem4uoOaiY8G1VeFtFkl3QqQavsCpVCYbVhcrV/wvKID8PioL0R8T+6qiL8ESjXy
         CBOb68KGV+YECcAwNygLzg+h0/5EZViuTLbBfCaGAXIEQpE/3Zb2a1kS0my1KkCiqHJW
         kQvvFL9BZb8WlEtYtxeFxMbSpoaw/AfOTXQegORRZsAiH64Q9/QVTpsPxte4GhSxw0uT
         8rEnYSbKxr9aG528ijunpOucLtU7tgZs5q55+fAdfbF7O4S25ajP3WU8UxgCvVwY0PCc
         QPGg==
X-Gm-Message-State: AOJu0YwJbn15cjVIJrVeXkogTD7ryrHlMm/mmYeqUJ92UyLNOPmujjac
	uhj0dahB16A4PIWHnNqZl45EpHVsgcxtsuJbKM0ONjR5ilAAYHsqs8fAD8AFami3lz8=
X-Gm-Gg: ASbGnctAkxpFpsVnKdu8EfTs/e2oEWRrDCCJ8h/YWFapHhxMdTXBELn2tat+0koQV6j
	mALgTTa4jOVdokFEgWi0OkMdMiBNt3/RDhYB/5d0dQeeFAw4hc8qM6R+IIKEI9hL8JlCfnOd1q1
	f4ZK8Q5tKKKRyHs/0arvMi+hcHvpo6pi8qAaMUyl07a+rQYGY1JFKTuw807KpUrGYKkMGMEGUm4
	/PVFP5/hr2hjNmtY2Ki/tOby+r7eyFzvLX5zO3O1mClIOdNVNO0+TIjeZX7oCskbWuLhVEsW5Ya
	xNbD1Q1xaFW+cOeoon8QrKFFQ3TVa+36ycKA/tCXXG4L+Khocg4UrPkVonqg4BqhmPX9ZbciDiN
	T9OnJi+LF347+IMnyAnLfkBazEo1lDlHKamM=
X-Google-Smtp-Source: AGHT+IGJbDnkT5SHhTAhiO5Q6ljc1ugcvXc+gcWNPs7wch9qaoN42+cmkfKz9M/HNQWQv+Jtvr6PpA==
X-Received: by 2002:a05:6a20:3d83:b0:250:429b:9e56 with SMTP id adf61e73a8af0-2533e9476eamr16763215637.8.1757401407457;
        Tue, 09 Sep 2025 00:03:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:22 -0700
Subject: [PATCH v6 3/8] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-3-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000328_956229_7F504DE2 
X-CRM114-Status: GOOD (  10.14  )
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

SBI v3.0 introduced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
