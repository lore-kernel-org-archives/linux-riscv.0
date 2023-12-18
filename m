Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFBFC46CCD
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kriHHPqman5XqL31ALV7T+CU2Ne9iAWQIzkf3m5IvB0=; b=V9jalqZqzfH/qQ
	uvG7PQMtyJZZyCuTMwKKpnXNBV+DypAmKA/ETFyAYJ1fsXPqHJvDOg2mMvqQUYYhcs/wzG4xWMLJM
	Cr0mAqdMgoVwp0OTCSc/pNTa2BBRbtB4S5c/fZy8AtXqtkJaEcwnR6sbaP1x41VAzaUVyWOMUwtVS
	k7XgII2AB4L3hOiRdTVvBRGzeLWpmLuBeRY/n0kHi8h8S0RvuzWqcMlpD0hrYKIhtJZRi5D1cIMkB
	Q4/PQCH2brfx1Qxelmaehiueg8wxDCTslJvJ+JwTD0dJsaFD6Y4FJN1JSxSUh0MBeNo3ifsSYgYzY
	uFlFZdRfwzGNeHi4b30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3w-009rLG-39;
	Mon, 18 Dec 2023 10:41:28 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3q-009rGh-1H
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:24 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-589d4033e84so2028987eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896082; x=1703500882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSo5xMz9BHWeXpc9J2d4I3sRbXRS1RJF/2qH5J8y/oA=;
        b=mkrx5Q2HMiaBB9aVIqI+pnERgoFfgqlDNyMf318ZekB3he/FtdsQqLr8MMYPq2eMMY
         h2S39f0m/ijomaYVyo5XxFrY484Rd2NiVlFncNHX9VgmeD3OZpwzrrEu8lFtdExQ567p
         imoShyTqux+/rhzt8ksBUqG9s+sjkHl0DcB8UBNdiLEec4+QhVG2x9oqvAi/bzxAS47v
         4r25H7E1NOzxntnvyC6wKPxBErZqIilTINRwNesnpgGTcrDmJ46Mikc26BgVYUOR6j2h
         dXkOjqqY38Yvwy/X419PB9X7/IeZpBETLBnQwjjR/3/09nrPPCT4+jVZ+YL5CZvtsxMx
         /4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896082; x=1703500882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSo5xMz9BHWeXpc9J2d4I3sRbXRS1RJF/2qH5J8y/oA=;
        b=Hvo+I3owXkRhuLuiZV5epZvQ+LU6QuWjYdsC9NX54xyO/KNkREYX0W3oGXqQ6O813o
         kqTa79B96I124CkHOQ9/p5q3HEfmOLDHJqMlH5SXS3VQrmK47Bm9vPuV6uayoS+wZWim
         ES6PkE1ZVZHES4bp0DvLE8a9y9ooQvA5IhItqcus5sIy/wHAN6WkbNYpYhJmrQ+EB/Em
         jRPdjP9yrOiyfoaJUhdw2u6Tp49aepKB2aA4muzDadhht5bbvalZkgdN8ZM/mTzq7Je9
         zBE8DLmrv4+/pMlHsvILf21gPXwouNDiuysLz3KXZdwoE640uOlnYu49DvGJSY/1x82e
         +SBQ==
X-Gm-Message-State: AOJu0Yxvx6rFBARVnpduonXM10dJyvSMW4lQMIZkCRxFWy8MaVp5SJOK
	KSg3j0cBrxeXRaGK3Ylq3/p06w==
X-Google-Smtp-Source: AGHT+IFCk8w9wlM+fFH3HyxpC64QXnD52t+pZZjSo3r/qSB2t69XXBqCZkM0+zsVKb4UdUBtxGWvrw==
X-Received: by 2002:a05:6820:1ad6:b0:590:8496:b5d1 with SMTP id bu22-20020a0568201ad600b005908496b5d1mr16558518oob.2.1702896081753;
        Mon, 18 Dec 2023 02:41:21 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 03/10] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Mon, 18 Dec 2023 02:41:00 -0800
Message-Id: <20231218104107.2976925-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218104107.2976925-1-atishp@rivosinc.com>
References: <20231218104107.2976925-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024122_433689_16B4CA71 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 introduced a explicit function to read the upper 32 bits
for any firmwar counter width that is longer than 32bits.
This is only applicable for RV32 where firmware counter can be
64 bit.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 16acd4dcdb96..646604f8c0a5 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -35,6 +35,8 @@
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
+static bool sbi_v2_available;
+
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
@@ -488,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 	struct sbiret ret;
-	union sbi_pmu_ctr_info info;
 	u64 val = 0;
+	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
 
 	if (pmu_sbi_is_fw_event(event)) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
-		if (!ret.error)
-			val = ret.value;
+		if (ret.error)
+			return val;
+
+		val = ret.value;
+		if (IS_ENABLED(CONFIG_32BIT) && sbi_v2_available && info.width >= 32) {
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
+					hwc->idx, 0, 0, 0, 0, 0);
+			if (!ret.error)
+				val |= ((u64)ret.value << 32);
+		}
 	} else {
-		info = pmu_ctr_list[idx];
 		val = riscv_pmu_ctr_read_csr(info.csr);
 		if (IS_ENABLED(CONFIG_32BIT))
 			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
@@ -1108,6 +1117,9 @@ static int __init pmu_sbi_devinit(void)
 		return 0;
 	}
 
+	if (sbi_spec_version >= sbi_mk_version(2, 0))
+		sbi_v2_available = true;
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
