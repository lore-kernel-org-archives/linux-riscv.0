Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A614EC46CA0
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FV/xIiCyuRZXb905cE3MiklG22/fN2cj/oQi2ZJtKo=; b=HlPVKvDOZ2kOf0
	P23rwocZHXW50GVmh4Yo7ojm+Vzv4guXSiCKmX1fKwoDjau+et8cdXOPkqVCnu3DzmoUwEaijSgNu
	yESTbR6t8McpM1NV/P5Cd/lEn/xwJ6pTQlxtDc15u4ACiwFSD8Tpushfz1x/lnmgvlHTVCsMZcpGY
	A69k461CV2xbGUynd/2A12v3BGbOQ+CFiwj9Q4qF/4P5pqQqrzZkFE0H5fbs1J3m0Sa9Sa13Ky1JJ
	bVOWED4meLNIyhou/V+VuoNWYjahmhuNfoZTZ7bpbjMb2o7yhHh/lHtbPbfFeeIHkuRftNpknbk87
	uLRuZxH6SHxU3tMmAEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPV-00641O-0Q;
	Tue, 05 Dec 2023 02:43:45 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPP-0063vB-2T
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:42 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d84ddd642fso2807748a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744217; x=1702349017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezsx5Eqv7C1IIJcHeXVdQzYdP4PWuNbr/jfR9i9uc+E=;
        b=dewugUlC7ZH8bdBaTFiV8qFEWU3WFWsYgPvc15evwt2K9N1TvoeWu59P5UI07IcPwr
         hKn8cKh/knTFZn3Hv9ZatVQoK+sqLLVtODjRP/tPXRblKTThQwEJztylz9Xf/VAjqWaU
         9JPiS/MGZSaSpKtg18P1ifdvp3LwVyJTrt6t1D8qeBxnBO/AHfonHlGFlFYvLzsa05sC
         fCJESufsNfLchMLPxeOmPVSYOWvLWa2hh9mlohGH8jI7F1sZ9rfuEEgC4MaHwNvnorkA
         iDons8+4+vuA2/dD7theWkm5BBuJNFv91/3R54+ccK7JC1CWDKOWDYsd2p2juna06G9f
         ChsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744217; x=1702349017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezsx5Eqv7C1IIJcHeXVdQzYdP4PWuNbr/jfR9i9uc+E=;
        b=KrOYPVXWjfwFD4s5xFqDwvCQvMsmilb8mwhULvoZR6v0NOTrsYN69tsmfPcW/okFU8
         D/sIUuo/WZBiT43xckVyRUASOiBPjkAVGbTNDvghrh+JKG0n/jX5WLXIn2X6xYUBdzyT
         sst6jYzmxWPHlItsVZniV7vKt3LmTkNefnhZ4h0VgT1OxdmTRXycU5LqQzWMCiMzahnw
         NIHk/ILk4QcWxX/bS820+6oDSQ/NF2q9t/wuSlsP9gTxGdcXuOs0++mpg4VUoKEh4DlO
         smcDEbDk6/rCYzhDsaRqmiYFsj8i2sL5MIH8JjLocTFvg1NmDAagbmE1BXedG/qlGhHN
         9I1Q==
X-Gm-Message-State: AOJu0Yw7UZbWMf47Qw3GL3CdAbosBUl908pWEujHokipvphnR0Lzgjs2
	1S7Qb1memokQmGXzT9yA96CmGg==
X-Google-Smtp-Source: AGHT+IF8HbmBfGcwhzrY8QgNBoAV0D9dftfiztmlrc9uBoUNExR6eq192ybD6wyNke0oHa4GT14FGA==
X-Received: by 2002:a9d:6398:0:b0:6d9:a17c:237 with SMTP id w24-20020a9d6398000000b006d9a17c0237mr2375646otk.23.1701744217652;
        Mon, 04 Dec 2023 18:43:37 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 4/9] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Mon,  4 Dec 2023 18:43:05 -0800
Message-Id: <20231205024310.1593100-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184339_822266_117DD6C2 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 introduced a explicit function to read the upper bits
for any firmwar counter width that is longer than XLEN. Currently,
this is only applicable for RV32 where firmware counter can be
64 bit.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 40a335350d08..1c9049e6b574 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -490,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 	struct sbiret ret;
-	union sbi_pmu_ctr_info info;
 	u64 val = 0;
+	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
 
 	if (pmu_sbi_is_fw_event(event)) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
 		if (!ret.error)
 			val = ret.value;
+#if defined(CONFIG_32BIT)
+		if (sbi_v2_available && info.width >= 32) {
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
+					hwc->idx, 0, 0, 0, 0, 0);
+			if (!ret.error)
+				val = val | ((u64)ret.value << 32);
+		}
+#endif
 	} else {
-		info = pmu_ctr_list[idx];
 		val = riscv_pmu_ctr_read_csr(info.csr);
 		if (IS_ENABLED(CONFIG_32BIT))
 			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
