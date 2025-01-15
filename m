Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF79C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I79XNjeFJDqTt1htfVlvOUzQ8soYlRn1xH9ay7TRmfM=; b=K8ecCwsir4jswx
	Ztm8FX45aVDxiOdRu8JtOAz9mjfqplE+njp2pukC2C0ysrK+Z2VD0WguxxQwdTibPhW+emgNN4zE0
	zQKySJwq1jD4z/qP1HtGzhmlSplhjkHTPuLjq9PDBqQxk1BP4+0BsXwKMjb5wgK6E4gzeUEQiLpvH
	WamQamZZYy3l/BH4HIsz3b/UxUmT+yBQXDgBY+VemSy8vx2WlO5V6Ae96c/4FKwXAZ7Q3xuodb2lp
	iS5qryieUEbVK32OcwplHKACk8DCiXIDE8YzGCsNjycQtL+tG2k1ggELNSSSCpRMbs0KiAO7Sisou
	xEC83jwuNqubUffgPVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Bf-0000000Clin-0vyW;
	Wed, 15 Jan 2025 18:32:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AL-0000000Cl8e-1GwV
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:30:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2167141dfa1so1960995ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965856; x=1737570656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6MbfDRCc6A6mGBsw+fhL6wjTkBIFejSaI+SDSiajdA=;
        b=JbBJhzksa1B1U282EUSJtPqm3lhRTZChH8Mllx1Q9p+tF/FpXh07NDYX0fuZGFB0mX
         Kuu+4FpR7a/91y2HFkLTeB0L0Kr7o5Cg1BeJYkUC8viq5iUoU/mfADXaETiOLXuS7ro3
         zRXB7XbuHSzsLioxtifL4qZD7BwkFIqFI4x3kv80/SVZUp2UWxqGGmo6WLFQHK7EFPBb
         yyFXbhnhwKuxBhspALx+Gw9JBq4TFQLOGWcHRQx0IUYOjSR+MKWRhGJAT9OJJSzRnAAV
         z2SvWg8vCjKPGwE4hUT8lAgNtoPy3wzUWq6a7NjsEkozXUuiw2m42nAVcoVvD+XsReUX
         v8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965856; x=1737570656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6MbfDRCc6A6mGBsw+fhL6wjTkBIFejSaI+SDSiajdA=;
        b=AL3/crRSptJCBX5Ik9gwhWCrzqf7qGGARimj2Vt4jmnVmTrsrIlswyz/ickXiaSOrm
         Zfm8cSLNAM84RvIrhHeH+xK7R+/dtNZoaCdMbXW6eNLNxCWFjw5A5y/eqVUaLVLRdxWV
         T3OdrECOEQ16NOiPNGHFjuNEu/VwWPeIfFfotQy+gSZMQxi7LG83j5YQWyI9efQg3Smm
         otnuB3he7NdOUMdHPXRXWJGmzoE0fTFELbEwG+vSDHEFWE5N7QXIJBG3/DLsTvur2IFh
         YOoQHEFz9zUW6r7FpBGajwqK+bW/IywNIChO4FW8WvrifXp0g6aa4UnE0XfxSl6iCTUi
         Vnjg==
X-Gm-Message-State: AOJu0Yyy65zDSG8MlWoPrjqHPbm2ZHWpPx8Hx+a2GgK6YHdKHrpc6Tdd
	PIi5mPDHI75Kd5fQNhzId55ltTa9wCtTqeaUGq59dhFgD7DxBRp43R5+pWTth9U=
X-Gm-Gg: ASbGncuRrB+vUSUEkJ/a4GZOnzDkB4x/JX5Ivo8JMXeL6Y1RPvIjvDVQ/waexlsqjVH
	21Y+bAu/DX5BaSUFUjG3ynC5QKAVSojK2M4V6A7JsvahmdpSf7e+xvQ7MuuhNPcq0In/lLbQT/U
	V4k8VqVT5gOBOpVoq4MC9YxIIr0SzDMmzKZtiVbWdnL3gnzuevHC8Fo2z9JTm6qVsDGTHYRJal4
	GHLcTC4Zxz7dN2mohWA1g6YblGzlKEZwzHl58EMwc2EedhUQDO4oWGaxcbA2AyCXCj1PA==
X-Google-Smtp-Source: AGHT+IGH5/giAEf8Q/ecUlIbOiNlBZurjf3IoH6KsqiI1EGl06ksaFaVD7yVqQ1dvhjlbV18FEvXig==
X-Received: by 2002:a17:902:c40b:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-21bf0b76a12mr58588755ad.2.1736965856596;
        Wed, 15 Jan 2025 10:30:56 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:56 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:41 -0800
Subject: [PATCH v2 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-1-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250115_103057_350300_41AE6AAE 
X-CRM114-Status: UNSURE (   9.17  )
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

There are new PMU related features introduced in SBI v3.0.
1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
2. Get Event info function to do a bulk query at one shot.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 194c153e5d71..170aa93106b9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
