Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB35C83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvRbD8KjITI9kjgsYn6rPwd9Z2Ji4PqD/HRZDoZhf7A=; b=3/ZOiIXYMF/bmH
	efcRa/nxo5xQBQa3sGGlC8E8Pa645gz9pKxf20g7r+UcUTwz6Cf4R0KVzTOgOeoeWuqJ3Q8sWWIEE
	JH93REag6z6AtLtd+xpGsZJl5jgWsool4DZQuGG10CzH+sTlyCWLnRdIeZ0OGUMS5ji/qjdBWxrWn
	UY+H1FAwDpl1esb1P3g7GuVTaFUzR2T7pt3g4w+ZX3VXPADH3wsbFyzMdzwO47HaltBTA/AUjkkvN
	z6GKE0MAD61P06orPsvfz+AmruX0+e9PqvoAWHxGePdcW0IoqBbyme84EwKAebIJQzHaLPSUQusbP
	+9qSj8AqY9QgW6KDvH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3aw-00000001AJL-1fZe;
	Tue, 22 Jul 2025 03:23:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TT-0000000193n-0dad
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-748d982e97cso4472694b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154126; x=1753758926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=fooP1swjwOSmtVGGDiKs6DY0oSLNPKjhw89u6B67jH+kk6+pOZnmI+9M/1hJglc+tE
         DC8duauvhWd+THnmpSDzjU8SqIGih7ABuntZORs3tnHQBKT0e+UGJkTe9FXDy4UuSU24
         IPTIc7xpppx/Wmn2iDAKJY7rwv1mhi9N6R58qp0oWz3Kvyq6hmfmWe1Iboy9WujVhYH6
         fvnjzFR42qDu3I0L8LCki7I31k1AYa54WjhBw3OVR3AWWv3fEIA68mAPh7MEeew0keOK
         pxNa0kO+i1po/fe13sqtNsuPzSOrFhUYJdl1A+Dmj6oeOlMvF5l+TTYkWvZ4Qfi+AESN
         BcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154126; x=1753758926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=MddJorp5gUcqpv8iaP4n9EN3Ne7ZBRX9gVCqeibQYdCXjaQBDidJaKzrmPgOfhXu5k
         H3LvpiL/ZKQX9B/i31l7uhRt420v6MG14Udj6r5bSY8hdgrCxvpnU/yxSh9cK47u2kch
         6zOnSaVcHXjxMBlPBvhJ3SrHKplEvhfs6C4nbTUupRRAICR33scZN9c4oqm8IGApdhA1
         7wSExPXi+r+ANLjPXkNsMkGOAYTAj9CR8QHkJKgmekmgmRSOTEGSdzP/nV9/GgqcTlTO
         Nsji16qntTM5dg3fxTRwXq+W2uI0+DrMKsM4Pf21Dnt9QsOvgNL4N+FlQPLWHPflXVF3
         QEEQ==
X-Gm-Message-State: AOJu0YwKekBNdS9tzW6XpvFHOAnkGj+2ZWjQI96ggdjguxVSnEi9uUqz
	CigI9TAQKLWE1Xt0xQs5dUS9s6aUklJXSJAx5vmv8HbcpkrOe3t6+waMm0/ofAuHJBU=
X-Gm-Gg: ASbGncug/lmT0knnPHi6hYZ8h2wQBs3879HdXkFbxBRfcmxllhISluNVdEvVkHYaMLM
	5IRTkVR2pwmkt86sMdBC4OOVj83MQSDBHYPUjgCe9yIqsPD+SmDdJhecdNVNjtFBbZC7cbKmbBN
	fa8WkgZdgTVfSJoIWQhOUUygFDTtFsDu4r4qtazzH9PzN/wrVP9TRLRz/XCgSTKC4RKWF+APv7G
	4f7kt5Xq2ELcBUy//rlHBhZ+Dkz2X91LJgTIOZbwL6ScwXoj3fO6vbmMrmdCxMdq2adssqwW3Sq
	DfbFQXp6k6ZnMiOmxIjGEZo8EjbDjsa7lvjMiKHK/Ii/rk9A2Ak1kX31TpCGaifx4FKWZFRVa/0
	dvx/vdMHF19LeZXDAnDFRVksWrqrqfmj00GQ=
X-Google-Smtp-Source: AGHT+IFGWxj3iUKxSSdZKPT9lOfiDcRTnkWskcnNV9b0jBWk2yItlB0Jg7U1GDfAal+i2ahxkqkLKQ==
X-Received: by 2002:a05:6a21:6daa:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-23810b4dd3dmr37662781637.7.1753154126114;
        Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:25 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:17 -0700
Subject: [PATCH v4 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-1-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201527_388111_53913F14 
X-CRM114-Status: UNSURE (   9.24  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..cfd6946fca42 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
