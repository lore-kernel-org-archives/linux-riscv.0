Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFBFC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 06:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/N7zwozR4aWKxSFydPMCu5Q/hS7Slm+Sqek8tuDWBT8=; b=argRqpr597cfM8
	sfVDa+BmdNy5JPWpYWd2IvzXMSp+bwn3E6hcvCnrVNPM4VTVci6zFlSgoAZUkyUktwTD4iIdZoJGe
	HpOIMVtgA7m9DU9ibmmjbOq4ZvVKzUoX/TBtrfomzdKBkpPjWLzb76UI0MneuLlz/Jo0n40ouSSJ6
	ZYwuURDzKuP/X09ufDA99CKI84mk7Gk9ov3fMF3xm/rCTqxQmjqTxde9YLpyrarIW2yA2FDg+9P59
	bue6dg/iMfPbbI5Z/lnxxUdrjp/PThZzHJcGup7bRYAk+X03c1JhmKx0E3SPcevJ7aXolR/GDPksm
	xfBi4gbnC97AGUdGfVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reUpi-0000000Ghve-1KOZ;
	Mon, 26 Feb 2024 06:51:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reUpf-0000000Ghv3-1PzQ
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 06:51:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc98892850so7405255ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 22:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708930282; x=1709535082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZJDZa4dE6I7qh1K4oWjwqQuf4TRNeOV/pDFBmxz1NI=;
        b=d7MlwZhSRJXcCbf3J/QK2iZnHwPLt5GtCaCh+JkN6FJDtab1ZVrAbWizolCTb/PBwB
         XBn4lc45hClbjUAc7f/V9rIueSKmL6+LrvG1VnjCZxV51b6FXF3S1JI77N5FVbQc6RDD
         vPm0GE12K4xNW5+L5gd9kbHE4RRT8Ng0fi4ndvFFGNoCqbz2NmYdpLFHDpFEnM1m1YNB
         0tuqfxb3i3vQDo/+/BMf3BiGtUNfEok4xWxcZsok1fH84nkVJnvpZF+89jwdYq1rs50f
         qr+zB0m7dPvA7KZDti3CRpYubDYwA9wxsAP2Wqu6rpdzgF+lxt3nJGRoIP3lFeTzLXgm
         6Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708930282; x=1709535082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZJDZa4dE6I7qh1K4oWjwqQuf4TRNeOV/pDFBmxz1NI=;
        b=gDMPdwJRSRPYzGKknsfpTTqd6xXJyrWgwBeTzSN2kPekUwpuWWHbA+IG/dqvjN08Yk
         2umBv9RW0/uay4+C2myHcoOuk6j0DF+s40+pNc7ca9OcxoVe2uc/o4jI5NzJqOeDyNhd
         JEQhHcjHNxuGdt6V6V+p9Ht3DsWittU/qz2HAYiBepyuXFTHNFG6pcCBS2nNR8TRuh1w
         s5tMUdlyGccMgnq5XSQxr6D75U5V1FWOL6+cmFUUknDHhFfZVIqghhhRPaXEAULXF3gw
         3s+y4jZCfVOxvcfXtOne/LEt+JfqYqzLjPN00QL7oDuuEY2VtJJEcVNTqzglSlKLcuE+
         N4GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZoRQRkRiaCb61TWwbsTRhh3HOVFsUuQEwDWigR9zr+6Kf2gnoHvY85enWdC6/LEEEFnLejFxi+jx/1ZtPGHj6ijuC290uMrOWSn1C0wR
X-Gm-Message-State: AOJu0YzulIUVp4bPXhLAxLpjJaNgmPtCRxeKWLA3am/FLKBr3Z4gSRKx
	kKC2Voa07X7avVi1QOACFopgKBk00xoBJN//bDj54BTR2ojszyN1rcj1L4IzoK8=
X-Google-Smtp-Source: AGHT+IG+iLuHhzs/rqyv0mUJKiLZSB9huPbBXlKg4PKw62MWaoX8Gy2Vo+Uwin2x0VVilQL/hJd7ow==
X-Received: by 2002:a17:903:189:b0:1dc:692:2843 with SMTP id z9-20020a170903018900b001dc06922843mr8971565plg.5.1708930281569;
        Sun, 25 Feb 2024 22:51:21 -0800 (PST)
Received: from nickhu-X1C-TW.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u11-20020a170903308b00b001d937bc5602sm3238871plc.227.2024.02.25.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 22:51:20 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
To: anup@brainfault.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: zong.li@sifive.com,
	Nick Hu <nick.hu@sifive.com>
Subject: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
Date: Mon, 26 Feb 2024 14:51:13 +0800
Message-Id: <20240226065113.1690534-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_225123_476626_1C73F281 
X-CRM114-Status: GOOD (  14.55  )
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

When the cpus in the same cluster are all in the idle state, the kernel
might put the cluster into a deeper low power state. Call the
cluster_pm_enter() before entering the low power state and call the
cluster_pm_exit() after the cluster woken up.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index e8094fc92491..298dc76a00cf 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -394,6 +394,7 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 {
 	struct genpd_power_state *state = &pd->states[pd->state_idx];
 	u32 *pd_state;
+	int ret;
 
 	if (!state->data)
 		return 0;
@@ -401,6 +402,10 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 	if (!sbi_cpuidle_pd_allow_domain_state)
 		return -EBUSY;
 
+	ret = cpu_cluster_pm_enter();
+	if (ret)
+		return ret;
+
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
 	sbi_set_domain_state(*pd_state);
@@ -408,6 +413,19 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 	return 0;
 }
 
+static int sbi_cpuidle_pd_power_on(struct generic_pm_domain *pd)
+{
+	struct genpd_power_state *state = &pd->states[pd->state_idx];
+
+	if (!state->data)
+		return 0;
+
+	if (!sbi_cpuidle_pd_allow_domain_state)
+		return -EBUSY;
+
+	return cpu_cluster_pm_exit();
+}
+
 struct sbi_pd_provider {
 	struct list_head link;
 	struct device_node *node;
@@ -433,10 +451,12 @@ static int sbi_pd_init(struct device_node *np)
 	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
 
 	/* Allow power off when OSI is available. */
-	if (sbi_cpuidle_use_osi)
+	if (sbi_cpuidle_use_osi) {
 		pd->power_off = sbi_cpuidle_pd_power_off;
-	else
+		pd->power_on = sbi_cpuidle_pd_power_on;
+	} else {
 		pd->flags |= GENPD_FLAG_ALWAYS_ON;
+	}
 
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
