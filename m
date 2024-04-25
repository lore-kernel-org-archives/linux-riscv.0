Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6D4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QCSENr1Mx4KQVy0vmv4ZIuByo38uWAJxVuo7VldF54=; b=YgwVXq3kK9TAHv
	4ALK6zF7S3eRUztt0uEaA0xkyDEbicinamTjGWVO/6oTDfI42cRzW12JfaXSd1r7CoqN9a+JiWfJd
	yWi2uatVw9mK9Dekbm6TCkQTElvj6dCBTCRXswNi2sXihHDxdpvbr0jPG3Bm5l58anUnh6ILylY5d
	G3ypZaZa/ovRAbzUkER6FO61OdFWvfTu0HuHBHxPdtEdKriE9NUOeCRWeGXd0yvmGRa1+nyOa9aNo
	X0CPm9WjopN9ZfgCGGUNH24bGAy/0AANFtbxtUKMqTdNFlvHuari0NJaoG7kyIAOh330l4cW7tJTo
	VX8NluFpJpzbwVBm/7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s04wv-00000009uzU-3o6L;
	Thu, 25 Apr 2024 19:40:05 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s04wn-00000009uwJ-3g3Q
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 19:40:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ed01c63657so1383944b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 12:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714073997; x=1714678797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwQycTSydr72l3rI7Ia2qnujI4hDZcXzi79vpal+Gok=;
        b=S++YNpnkAdEsyIVDTfsVfv7ck3v7oEgDgu7xESd/Pss3DEakte37sB/A7uGcLaZQSI
         yb5ohtKxKVpE+iDpWc1VQ9C2wQltc3bjMa08e1PJ3umPnD0U7yggOhXcZ7om22s6RPrZ
         HYQfMFqdUwXDcMBrJyPkizio+Zy4+4IVxrWXisGNIRzX4eJb94FvQSjZpc8EKn44pDom
         fQAyMwgl29XAKXVljgoKgg7N8si45ZZSRTCAHB1THRhrDUjrjHLle3ROsRq+XYMoJtwT
         OV/DzmejSHT3Y5AL0cTR6u/3TxmX4BTGgylRqIuiSe8H6cgPxuk1gmIBKDm6v7wJF+ML
         73lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714073997; x=1714678797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwQycTSydr72l3rI7Ia2qnujI4hDZcXzi79vpal+Gok=;
        b=VfjNncmgOkTRsg09SZwEQJbcJ4tKTq9cbOSKaFxB0pYfYhwz0Y3XLJAiMXjhO2OTYo
         p7r9/+5IH9OPBfre4DpMSABJrRQZoGK45r837gwC2EYPIQKGP9OjQz3Woy5nq7GQTno4
         bJZJgB8YtX5RXnHyssGDqOQiS+6khz+35sOpkkkC5QvdcsE+EOydYDsG8vM5iThKtFQk
         bWSbvazJQl5Ih38AhRMs4ucgxjaRsxLCApefiiEMSX2+siViClKMsIH2WD+hK8/kudah
         FNklrcYopnzuWsNYQ11xZdwDrGTBYAzgfx4Ovs1xVdUgv3DDDZvQOz7WzrrgfSB1mGvo
         9C4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuF6Rsr5Cxfln9eX3fvn4YzQzpMR8rzy1q8PrPryTObn1TUCVIY4NoOCj6KMCV0IkuXtyvntOXhUuU0mTc3xb8B8PXw7/RsexIdKhOux27
X-Gm-Message-State: AOJu0YxB7xTe0t9HHwVaG9rVyNpCncB2Euw99omprRsbVZueBwd8xzwG
	VMJqtIqobDgda0hqOrwyTaVEK9aUaLui5lTlIgbMdoRlJfyhPaROj2GPI5nW5mk=
X-Google-Smtp-Source: AGHT+IEthZSW1CX7a3PvofFEwe48ZsCzJG8DzRSx1GcFLQyxF4hEvHFisHhdU+teFKmXklSnLYrqaQ==
X-Received: by 2002:a05:6a00:1704:b0:6eb:3d37:ce7a with SMTP id h4-20020a056a00170400b006eb3d37ce7amr979454pfc.21.1714073996665;
        Thu, 25 Apr 2024 12:39:56 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fk12-20020a056a003a8c00b006e6a684a6ddsm13525487pfb.220.2024.04.25.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 12:39:56 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [kvm-riscv/for-next 1/2] drivers/perf: riscv: Remove the warning from stop function
Date: Thu, 25 Apr 2024 16:29:31 -0700
Message-Id: <20240425232933.4111680-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425232933.4111680-1-atishp@rivosinc.com>
References: <20240425232933.4111680-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_123957_975606_4EBEBF18 
X-CRM114-Status: GOOD (  10.12  )
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

The warning message was initially added just to indicate that counter
stop function is being called while the event is already stopped.

However, we update the state to stopped case now in an overflow handler
after stopping the counter. If there is another child overflow handler
is registered (e.g kvm) it may call stop again which will trigger the
warning.

Fixes : commit 22f5dac41004d ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 36d348753d05..78c490e0505a 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -191,8 +191,6 @@ void riscv_pmu_stop(struct perf_event *event, int flags)
 	struct hw_perf_event *hwc = &event->hw;
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
 
-	WARN_ON_ONCE(hwc->state & PERF_HES_STOPPED);
-
 	if (!(hwc->state & PERF_HES_STOPPED)) {
 		if (rvpmu->ctr_stop) {
 			rvpmu->ctr_stop(event, 0);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
