Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409ECC87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ts21uG/kiHyNzCBKxBlJTWdUR9htBAUNgS2EWdo/xuA=; b=0DZJn0PS7sgDNr
	yx0FcTDHadTchqlJ3SaggbKLIDDfxKcSTuVyWkMIMSea5YrvNCxwM7K82laCAkEZPXYW07l+hsRgU
	DY7J1ovXOVNHDvIHDLG7QzNiHajOBITTPnJ9/M4+6ohSE6yZdiKpTph4GNuNUiwcn1JXyuyvw061t
	UmiFtHGHDhnYWKQL78w18z8+nlJlBSsBXw8d+kAIWEWXN+8g2onyZ/EtOKX5J8PwK7rIYwyHUjkaj
	lSp1PBShthFRgISqZMyJRk0C8FD5fqIeM04zIE2NT0Ja7ugHcXIZY8l8Dgb8MugMm2AHtRimzG3x9
	EtJVYpbNCb1gD8jrT96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyvM-00000000OSR-174M;
	Thu, 07 Aug 2025 11:36:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujye5-00000000Lo0-06tQ
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 11:18:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23dc5bcf49eso9297845ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Aug 2025 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754565532; x=1755170332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O9fqVws7kYAGGue9oqTxhEM0PSSeHuhdnXBXm7y4cLU=;
        b=cpZKrVDnWQ8G69Z6uYAYeDDTtZ7GM22lNQH1RyM5Id46MGAXQkkcm/URbh5vqrIJG8
         vZVDOEp2SP4791iqUoWlLgd5wLdYLSreNG5zXqdrNHS9jfy8Qvm5eE5DvRIF6cMsa2NR
         tuJxXNt+6/b1GtU05r8MOyXQt+cyfVhdfslNRDyra7eknnXDhZwXfDdA86KwUq/R4nao
         KbC9bX3s28oB0svLHSMqWiYgXPSBbP4vuSxWSyPR82HKmQayQ72Kd3c4fZ+esgiBEbIL
         z5jxK2GUQLgcdK++6AbDOyhcfWobkvd9n1U99tcBHs8eflE0E8BBhScidELqc93e0xl2
         Ilpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565532; x=1755170332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9fqVws7kYAGGue9oqTxhEM0PSSeHuhdnXBXm7y4cLU=;
        b=UP8EO6MSjXdC+ppUb0wMgmMw7ISgg7q+UPUE+jMcQQY0i04XPnS/Rezt0er7osEOiE
         qJtin4bi2PnV24CuhBj+x6fK/7o3J/nX/42BlTCHqdnHBMbrOCkTjGwAFkyjZ6FySasp
         ZLXUVH35J48eBGv8oxjRDuagQHsL3Bh8nlVjZCbYmAAou5NspuFZ649kifPn8TWzZqdR
         Dj4quT/UAVBpeqV4MT2oiGVtQCK986T6OM0XbVPuEA1uqmtI/mwxYIpcx8KlLEjlDQk+
         0pgxZRxszGY2YrhOvlgvHaRvzBInya/YIh3JfLrQy6P8ukTYdU3vPGSIX1m6ijSupx01
         FJSA==
X-Forwarded-Encrypted: i=1; AJvYcCXwSJso3oF8z6U3phTuww8ECJCFCnb2x0Ls975yNCqJ5AKmF/lCJaw6qU4tEGlaxpfpnFl98Ld0q4L69w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqRPIzcI5gGqwIWATbShew/DcSTLZD7V1u5Z1z9qem2SfED+Ww
	DvaxM8OEr0eHkMF5lTcSbFujk5AJEx9h34xc8JqutfvP9tcjBq71bTy1
X-Gm-Gg: ASbGncte/qnT2sVlhMdRpAjyXNeSE1HOYZ93b1nHAhmKKI4Mrwe7cXJdgV1GgvfO0tD
	CAQOdQz040M9qud/UejYxcdN01cqhYtqKBExRXBy0jn2jo57A/HVgjJTI+5S+iy/QCbXVik+dKI
	pKXdLLYecO68BoxwSZu3cOt8c+qnn6aiTBTxL0PMbmpTTuZRhI408oKB0VQ89QPlUZfQS/dEOsJ
	40fFjmtoE6LLW3DuVeLqbPY9W4id2BceqbXeT2eQZeCsMsXeuJa7RtXVuJrAFVaZhRvJoB89XQ2
	iSahyzL3lfl3zQr2opYalP/Y4p3xkZPtmHN+W6M8YqigEAlt7e1CgnQBOtjvi7Iy4EaaeSGo2d/
	hNWNtVR0pQX+s63ymB5VJig==
X-Google-Smtp-Source: AGHT+IErv77YOCqmS6FGmRY3sGQkXE7mtA5sIwlC5bAnNvn7C+qMr+bU53xyTNSftnTRbE0oMel6Xg==
X-Received: by 2002:a17:902:fc8f:b0:240:6d9b:59ff with SMTP id d9443c01a7336-2429f5339b5mr86838225ad.33.1754565531954;
        Thu, 07 Aug 2025 04:18:51 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241d1f0f576sm181751225ad.47.2025.08.07.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 04:18:51 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] irqchip/sifive-plic: Respect mask state when setting affinity
Date: Thu,  7 Aug 2025 19:18:05 +0800
Message-ID: <20250807111806.741706-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_041853_064710_8153CE07 
X-CRM114-Status: GOOD (  10.93  )
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

The plic_set_affinity always call plic_irq_enable(), which clears up
the priority setting even the irq is only masked. This make the irq
unmasked unexpectly.

Replace the plic_irq_enable/disable() with plic_irq_toggle() to
avoid changing priority setting.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/irqchip/irq-sifive-plic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bf69a4802b71..5bf5050996da 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -148,6 +148,7 @@ static void plic_irq_enable(struct irq_data *d)
 
 static void plic_irq_disable(struct irq_data *d)
 {
+	plic_irq_mask(d);
 	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
 }
 
@@ -179,12 +180,14 @@ static int plic_set_affinity(struct irq_data *d,
 	if (cpu >= nr_cpu_ids)
 		return -EINVAL;
 
-	plic_irq_disable(d);
+	/* Invalidate the original routing entry */
+	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
 
+	/* Setting the new routing entry if irq is enabled */
 	if (!irqd_irq_disabled(d))
-		plic_irq_enable(d);
+		plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
 
 	return IRQ_SET_MASK_OK_DONE;
 }
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
