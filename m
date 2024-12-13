Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C1AE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 00:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=US/GJc/euPs9UqtS//47YbRhTIUuEjeBpfc0ciqiMY0=; b=JNyrQgdFHLNSFt
	FPJHmu3oJmuSebvOZfUIPyV/qVuE6MKd9Sms+ESehiBvpEGuQeLKG2S1TJ5cQzBVF7b2s9mtLJ4vo
	EDV5NBQPh5FOmWrBdFn80atp0rD8/atiyWXGLgnXqMr/MUxjnDgKRGcj+ceUdN5xNeSuGD491KF1D
	Ohh6nv/W5u4rPrAkT5c3EaR73Ap67Rb11XvowUCJ8x2N98bNCIMsnUsrdAvJOrNk42ljmGUlWG2ZR
	YSyd+7phltoYIsDX2b3eGXFoBaqgnifhMvO8dPv9kJr+IF/htWTKRhO00c/J04DtJK/aqQMnwZ8ML
	mA98zQ6/KpUozlhHZZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFc-00000002Fmh-3QCD;
	Fri, 13 Dec 2024 00:09:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFa-00000002Fly-0YgN
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:09:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-728ec840a8aso1351007b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734048585; x=1734653385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKpycrpAm/2Z4OIP+dAI4fHeHhUuh023l0NFrl2ztmQ=;
        b=bE9SSJX2RQFduZuwBrc854CTEs472mKqsgv6XB3Grio1B9l94YLHj3avAyOB8LFPYp
         vR/2tpwrYKpfYHZTbZNu6o1CQ2CGujPylmx4q3Kk7629NCexSdnOjSQwplZWY0odNQgJ
         JmSFdmJegqyWs0rN0xKsemxds/JxG96y2f5WyLjNnjvD0blD+6hKcqGvmVa0ZFt6wCCs
         0J7p+FS0wD13sp0F0r9jZ4eIP3rEwCxGUp5ARDyjAtOk+nhEuNdRtMIVQvM9LJtgrhyF
         D5vIdyk/bMnlsuSolFJjVjXGIMdbExlyntlznqNKPHAq6Ma12cVPO4tguXSe3joRahyB
         9iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734048585; x=1734653385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKpycrpAm/2Z4OIP+dAI4fHeHhUuh023l0NFrl2ztmQ=;
        b=vQlcBcD7E18hTb/gGctdV/KoaXJeGvVtYL5obM1zdR2MwVPDgVbbvYs4R8nGAi45ZK
         R60rYeoE0lyd3oVFm1Kejv+xOwmHGvA9B+8AYHipxGZhCERZplytU4t8btVLtt1e3CfV
         NJOerkKaVCamOunfvgAt12Ytob97MPui3YD53envtZBdLgV6DYVM86ph6gB6Unnkj4ht
         WPmh1vS4I8CnXxghOP+LyKxn30CYQ7HPPcT9MrZRsT0WwneKtkvcuvY94t7N4Puo6If6
         SjqH898oOuYS8kJNbLsl4TovlbmbBQI9QrdcRCRqjiB2QM9AkfqiyI7QnXz1rzt6oaB1
         0KOA==
X-Forwarded-Encrypted: i=1; AJvYcCXd/Li8XZDfct2D/a/vqY5jqCRy93UIYVmeXUleCHMeascxETeN2buvpCOpmBRRyfwH0nKPbuBjQ9bo9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6YHVma5VUMBfJcR6QbN7mXr/wQ0iIc7QFORM5is91c/f8boXZ
	cWIHkZEf55HXJl4YDcHx6kfvZGidfJ/0l30GPeX2a/5EPlVnv0dUwutHuzzC1aQ=
X-Gm-Gg: ASbGncurJUb+RSngZd5HI+8ioKjvVbeeYw7nx3FnuMjo/Je+wBZLc9kOsfbhMD1tiLO
	XckP/RBxkUEkKPq4Za9TFvCtAkszZE4OMJdRXCdAp2jwQdDbmWBy0qpLF39RmRPfJd9t6s78WgQ
	aCeFxM6yznNFw9IlCxZKF2qmCJikWe9W/T4PvCmTTKzMakcZBVTLAkMiuO/HgCnciWp1odbkVER
	E8YSiO6JYNJOckwUolaIPgpkFD5/pA4HB//Ls+pHHKLTOZI+qgvgcv/JUYnlRiNlKiT3Q==
X-Google-Smtp-Source: AGHT+IE5j/5Y5d7tWNO+kILk+qFgEl6eIe6LD4J0VHaW3xwow9/AiwKc2ul435G3UAea8bcO75mrFg==
X-Received: by 2002:a05:6a20:244f:b0:1e0:d4f4:5b39 with SMTP id adf61e73a8af0-1e1dfd9433fmr735097637.24.1734048585651;
        Thu, 12 Dec 2024 16:09:45 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f0a0779dsm7441455b3a.154.2024.12.12.16.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:09:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 12 Dec 2024 16:09:34 -0800
Subject: [PATCH v2 3/3] drivers/perf: riscv: Do not allow invalid raw event
 config
MIME-Version: 1.0
Message-Id: <20241212-pmu_event_fixes_v2-v2-3-813e8a4f5962@rivosinc.com>
References: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
In-Reply-To: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_160946_174652_3832D7D7 
X-CRM114-Status: GOOD (  15.04  )
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

The SBI specification allows only lower 48bits of hpmeventX to be
configured via SBI PMU. Currently, the driver masks of the higher
bits but doesn't return an error. This will lead to an additional
SBI call for config matching which should return for an invalid
event error in most of the cases.

However, if a platform(i.e Rocket and sifive cores) implements a
bitmap of all bits in the event encoding this will lead to an
incorrect event being programmed leading to user confusion.

Report the error to the user if higher bits are set during the
event mapping itself to avoid the confusion and save an additional
SBI call.

Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index da3651d32906..194c153e5d71 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -536,8 +536,11 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
-			ret = RISCV_PMU_RAW_EVENT_IDX;
-			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
+			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
 			break;
 		case 2:
 			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
