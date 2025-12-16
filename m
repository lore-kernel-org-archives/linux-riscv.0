Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AB2D5B87A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kx4tU501g0S9pAi0NPOhYqbh2QY7UEBGvAo+oSCHYvs=; b=D8d3+h3GdtXEE5
	g+MtUofHXPiuP7cWHmpQyKGqBF6meQH+833twVDn5LsxAyKWY3SCvsXvaxNCYsL/gpnsY12vwnb+G
	rpb9RK1qEgK2iz6VErdH1AY0+1FAlTYhebKMfQdqZ4QogPiBiNwbjwHnXV/6mkCugZjxQQ7z0yvgV
	pqwBesnxxRVo2gt40TEAoMVvqfRivDKI1IWGi1E1AnCayC/4c4If3veqTx/wPPYp0Np4aeHOAoWur
	jZxpJ2evdwq3vrDlWkCpKOngaUW0LaP6L9Lo/DI5k5vTaGMe0GvRRjI5Ab+q594jo3KF9xtFkOAXy
	KN/tAN+/d6PixhYG0nMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJjW-00000004UDC-3YNs;
	Tue, 16 Dec 2025 01:20:10 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJjT-00000004UCT-2XLi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 01:20:09 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6446704997cso3570857d50.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 17:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765848006; x=1766452806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4D2fKjhV+xXooGe5GhIIOsVNBVoSb/WsPEzHiyDzi2s=;
        b=Bo5WRxWuq5tKh2hBmQMU3SXJs+URGndI216C2uBs0Kxh0bNSuUkpLobVyoBtHPXE86
         AmyjPRO92oGHYEQfZM3wWr0d1qfE5Pbwl8VQY/cZr2ocmVOYgBRBqzMdHGzNTB2O/fWl
         8auMdWh9cj+d+ABwV6MpICVqh575y1tn8PdOICToVIqGO9A185yL3nB1fkyBA8QPa6Po
         5viosWyLmpBHp7FOX0J8x8F3bneNSSohPXzEHArni14btTyC/lcbEtXerCwBM6znrcdJ
         IMkKcZ8J/A1cNyA33by+7xT/sKcZ6UABQ7BrGr9YNAWXAGcp97AjnE9uDzRoyASqXeNS
         j6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765848006; x=1766452806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4D2fKjhV+xXooGe5GhIIOsVNBVoSb/WsPEzHiyDzi2s=;
        b=FJFhp0Nip5ZIIuaFEtUQbf1HXqiE85E1M8NHRFh6vGkGykcuCOmSyB/uzqHsvFexFe
         pLaC1QX/hnIE6EOl158K7GR86R7chwJN0yF5aGm+WUEIhQbpMQPMhQX3+RneyKKtMneP
         tlquQzDLbxpE+FFLGUVvhpSKWvB6oZNHKOe5440t1NXof50EeG71erHEYQ1aGSDs/rKE
         998vYlprOr6W9pp0Fktsnj9n8s1U5T05DI/KptRKHwvwQRHMxnHUMTZ13pk91DSoK/Hf
         YcX3TadgRJA9aGKHodFJm4j2xc5XyLbdzrjMJ0ETO0S22cJJhweFBR8q/Wi/CyIYzfYv
         whpg==
X-Forwarded-Encrypted: i=1; AJvYcCWkZpKpAWOSkfyHlBtSMLHc6GGDZDavIndn+B2OXa9L0c9spVa6chkqY0TZRI6mCEqZJ40naZv4A9A/Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTOLaQyYeRRt9gYrGRuVsDFCNlEr27RpDCbcLUvOWJ4aPcYa5
	gHlKu8V+F9T8x6UxMQwX44upUnK1anSuLSVP7hOKKdKbwPxYtmflE7EG
X-Gm-Gg: AY/fxX56LH9+aVrZYwb5DqGqQLCUGdnpE9pqiOLX5uUaOKwtxzNA3f7Wuu/x2AWPLa+
	JPLmXstpcMt5R+EDYtHMtVJIvRfCYi1MMBvm/oRIeGEN2hBBJ7CWZRWPFy2AXexuf9VYwIyESWN
	UosKb+kr1CjG1zowx7x5Ke6XoFoxIgs/spkF7dNg9Cux2pmKuTerJmu0TcL+BNQh9eDPLGLlTvU
	4I4weqPpWzGMEdT4dg405jsSYVejN4w2XCy7Q+GEKiIMPPxw6gli5Xsiv9vdyGRWBGg5syS22tm
	IArL68Bi2wdivQDLG5QYv7jjvwI+t3YelAb0x6xemBtXMqvMB6/whO6lZ7dtXchjfFuAeb7EPOA
	wyEkE3jvqqSmSgaRfRCWH/kKMTxSoHcFhH+Q/6QG9MW6rGr9OL1EMjiSGO4z5iBT33zynZA1iPh
	2MPHaesg==
X-Google-Smtp-Source: AGHT+IFfmvm90rdPTujJGHfPtnqhB1WsV9zGN12cd9dzeHQbXYRNvb06ZpPINTYrYrF+Tfl+/bGheQ==
X-Received: by 2002:a05:690e:1a44:b0:63f:9cef:d5f4 with SMTP id 956f58d0204a3-645555eb79emr7067344d50.36.1765848005823;
        Mon, 15 Dec 2025 17:20:05 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6b0:1f10:bc87:9bd7])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477d58416sm7082747d50.10.2025.12.15.17.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 17:20:05 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH] drivers: perf: use bitmap_empty() where appropriate
Date: Mon, 15 Dec 2025 20:20:03 -0500
Message-ID: <20251216012004.341288-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_172007_695720_A4C511C2 
X-CRM114-Status: GOOD (  10.86  )
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

bitmap_empty() is more verbose and efficient, as it stops traversing
bitmaps as soon as the 1st set bit found.

Switch perf code to using bitmap_empty() where appropriate, and
correspondingly use boolean types.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/perf/riscv_pmu_sbi.c         | 2 +-
 drivers/perf/starfive_starlink_pmu.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 7dd282da67ce..9dcc22fd48ef 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1244,7 +1244,7 @@ static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
 {
 	struct riscv_pmu *rvpmu = container_of(b, struct riscv_pmu, riscv_pm_nb);
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
-	int enabled = bitmap_weight(cpuc->used_hw_ctrs, RISCV_MAX_COUNTERS);
+	bool enabled = !bitmap_empty(cpuc->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	struct perf_event *event;
 	int idx;
 
diff --git a/drivers/perf/starfive_starlink_pmu.c b/drivers/perf/starfive_starlink_pmu.c
index 5e5a672b4229..964897c2baa9 100644
--- a/drivers/perf/starfive_starlink_pmu.c
+++ b/drivers/perf/starfive_starlink_pmu.c
@@ -450,8 +450,7 @@ static int starlink_pmu_pm_notify(struct notifier_block *b,
 							 starlink_pmu_pm_nb);
 	struct starlink_hw_events *hw_events =
 					this_cpu_ptr(starlink_pmu->hw_events);
-	int enabled = bitmap_weight(hw_events->used_mask,
-				    STARLINK_PMU_MAX_COUNTERS);
+	bool enabled = !bitmap_empty(hw_events->used_mask, STARLINK_PMU_MAX_COUNTERS);
 	struct perf_event *event;
 	int idx;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
