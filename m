Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE13EC4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yn96M1GJQWY7ANj9Vu/xixZCilbwrk+4PDSMAZy32yo=; b=QuYWzOxknOkf8e
	oTkTYL+BRLhjTHqDb+cTPf0MwKBDzRVeVt6HLFGisAfBj1STxjM9+TChvS7QCBz0jSA4BBE7TeQWx
	S40EdeMbl7Ov6sN5uZTjgh3TMXSrizbuvcXxaeUwEtSQoe7TWPD5NyUw8L+0PzYUZUAADIHavrx8+
	v2zk0Lxw52HUps+9SWGt/o/Ri6UkiIXka3iBZstYbVpoKy3PP6EbwTlUzCNjWELdEAaahhQ0IBCNw
	xLCDXBKkfwYXDbEbRq+ZzwBsZWrZQ5ClygtW9mRLYTJVZi5rgd1aMd3xBNFejp0oWPNWJwct2DVOd
	YNt2xVc3Fcb9s9H5dZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhma-00EdU6-2V;
	Wed, 10 Jan 2024 23:14:48 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmW-00EdPT-1B
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:45 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso75336939f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928483; x=1705533283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/Smp2oLhuu6GIJFXbIgbmjKI2p4Ava6d/2TN1s81h4=;
        b=tO7GdyX9FnhPlaHxdkPyda7QKgCBa9M0/boNQbQQw9EFcPvAcHCqbea4P64xAfalg3
         c+TekqB0RDMgE59VV+RJ2BXiMa7Lw7lA5UakMxbgA5PUDCJ3TfWIZFbsAe5ii5mmCxc6
         0sOwsJcDeeBI02DRMyqjDDZQ08VEWzemc4zjtcEfTQzCRZmEpkBiEyopSn06nPdfHuYp
         zL+qY4K0Zrxdg82mLieMrpIfh5ATfeNJV+CeBbXXk869ftLmPBRpfo3mlkRPPYwWPm0Q
         AfhbElRHeRF+pDe0CWbR0gHtM+Ko3mHU5RL3y13fh98T5hTZVx1tTpXqCvHYqNeomgQJ
         kHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928483; x=1705533283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/Smp2oLhuu6GIJFXbIgbmjKI2p4Ava6d/2TN1s81h4=;
        b=xUlca/exwHTcogc3GQ6j/ykXwGqvJEpOazFEODp1tATm6XOOJa+QRm532AHInIyExI
         v8E7REA/HxJy8azJryWDFu0uHYLcWhl4RI4LEIff3pOLPKRUROQQmg5FsOQrN6cwsyz8
         vJm5gFVPfvyXa/Yy6phj2GN/Lsm5Xrc6dXBIE2wRz5uwBZn4smNOgLtzFr+HCyIxaX3s
         Rhx0Qb+zytoOYcxHTNrYXyN+lmzKG76fk3hwrrGpoiNiJ65+cNaWSd/q5e3FABcLa+H0
         hvQdsjGCWKlfcDb/26Nc8NFnSb5jSukDCcWomHdohNMfUDHxqDu7q+qwa6EfIt7ZMUl3
         xMlw==
X-Gm-Message-State: AOJu0YwlhUq2nzRJNFn8odCq0TcyAllKhX1c9QPZ3fU4HM8VFuDKf8Zh
	JC/h1pFSp4dssuzymdWDAsr1nQOXNxbVzQ==
X-Google-Smtp-Source: AGHT+IEO+CT+BOK9YfH/14uu4wNMxjKsnPCEdlLu9xcMpHCvuY2p3WWb+zLXSonhnsccpODzARsukg==
X-Received: by 2002:a05:6602:2819:b0:7ba:85e4:f8de with SMTP id d25-20020a056602281900b007ba85e4f8demr324455ioe.42.1704928483021;
        Wed, 10 Jan 2024 15:14:43 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:42 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 03/10] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Wed, 10 Jan 2024 15:13:52 -0800
Message-Id: <20240110231359.1239367-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110231359.1239367-1-atishp@rivosinc.com>
References: <20240110231359.1239367-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151444_405647_7D1EBF0E 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 introduced a explicit function to read the upper 32 bits
for any firmwar counter width that is longer than 32bits.
This is only applicable for RV32 where firmware counter can be
64 bit.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 16acd4dcdb96..ea0fdb589f0d 100644
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
+			return 0;
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
