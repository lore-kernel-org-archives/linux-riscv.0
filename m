Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46611C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 23:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO8zZNtQWHvzlj2wgzdXA9Eeywjc6vWeg7S7svJZzug=; b=XjCDV2Rrm2c1TD
	5uYK/G7mSLP/xpOuOLoqhgPa1hCUQf/2P5TLJeOJAMri+7N508VaXFEeCeiYJAhuxAedESRHBnoPy
	HbggGBUSkUKsQ+vV/XKNsbeufyCOG+b6TftjBuP+dTTOI8+QHW1V5mmZTk90Z1aWeca5ZZE7YMS8B
	3tQqU983/RGNuOkmn1sOYrs7fjJLvmvFSzi15UrzFDBdfmyIJf5eedb/RD07aJkgvjkj93R/FxOhT
	GlaWTE1EdfGjkKxintK6aaaShtUooEbHa52jO6CzuLpH4pphHn12t0sPC7ZwTM7IPOiQWxmxsPpNn
	hBp81sbsbYtADd5OSgfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08pQ-0000000Ae3J-11zs;
	Thu, 25 Apr 2024 23:48:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08pK-0000000AdyX-2kOr
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 23:48:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e2b1cd446fso12750555ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 16:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714088902; x=1714693702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqvGcDnU4Q7GXsG0msQsBmmm+QdgUC8OStzEmaKGVBg=;
        b=zEOTYiqwK7sMcmtPNsiVM54z8RNbnMlnTtGaYmdyIqZ3izTC+RvqGu1CLkgZUFaI/U
         wM0Xm5bVH8sC8al495p8FnndWYiE62xZ2O+uJv4o+APLlSlbZRA1eN4KTmr5AQC7B7oz
         i5I/GISQvCbVqYLyG89ZoedlPY+2f/ahFQkvcIOIO9j0dyXHfZQuPnDhsXhI8aga1c/3
         mgfq7SX6b1SmAP+DjoT10lTgzqvc4eIAV5RGqAlyWu9WPiCZbNMFaSW8SNxxBylB8lmM
         DMvrlVYOkhZmX2Pu+hcwNciYZc9yW6dXiSBCQA3QABYgMFUPtI8BzeGFLGB97nsdA6/2
         7gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714088902; x=1714693702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqvGcDnU4Q7GXsG0msQsBmmm+QdgUC8OStzEmaKGVBg=;
        b=pTRVD+BNt+GDnXoOb9yLYHkSx1n9illXodpNesoOZlNhCn3ySqBQxNKY4rTrbpaRcz
         tr3LI9Tehk8TEQK9l+TbgajMhV/x+bYi418jT+0BqQt/UJ8lSnP+Y1WswT7urDRkajR4
         MDpWy1oO4yuE/wVb6VHocJl/FHIeOI4+aIzvcVEER3itp3Gtpg2uFAia/iRNhHitsdH3
         GK6LfAulBhcrTp5wwFlb5oMt88mjJU/0Q0EBVyCP/PtBORoTtcz0/QWOws7DhgBodCEy
         qJFn0zq/fYs7hh0HVOt+rUXV8B3d7iCMD7uZ/wW9unxkqeDbXB8e646wADlLgydtevP+
         HEfw==
X-Forwarded-Encrypted: i=1; AJvYcCXmPlIWm5pa/jxFO566uNvEXq3WYS7nSqv/tsPGO2BBoWdCm7sEKzYosDuhs6SLNS6yTcTL0qwexL5uNiUgz2mXRslZm9f+vbErROVb14iP
X-Gm-Message-State: AOJu0Yy4Os23Hh3JJX8PZRxtXCDLttLvZD7g9lgpL32xFTMWS4Piq5U0
	+WqnUS2Xfbcc2DZZ8Qgo0P8mlvuMIurn3pv1Vnir7SGXLacMFJwPoxr9mYxTt2k=
X-Google-Smtp-Source: AGHT+IFvadHJo6CHVYlerS5YjMlarvs6SjBXIDYE60SuTW+TYKkQrVr89MpU3rNa3hW0vdQ+MjDUOQ==
X-Received: by 2002:a17:903:2b0f:b0:1eb:ed2:fe89 with SMTP id mc15-20020a1709032b0f00b001eb0ed2fe89mr12781plb.10.1714088901920;
        Thu, 25 Apr 2024 16:48:21 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b001e0b5eeee41sm14349281pla.38.2024.04.25.16.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 16:48:21 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 kvm-riscv/for-next 1/2] drivers/perf: riscv: Remove the warning from stop function
Date: Thu, 25 Apr 2024 20:16:36 -0700
Message-Id: <20240426031637.4135544-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426031637.4135544-1-atishp@rivosinc.com>
References: <20240426031637.4135544-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_164830_796454_CDCA73FC 
X-CRM114-Status: GOOD (  10.54  )
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

Fixes: 22f5dac41004 ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
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
