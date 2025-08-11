Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56180C87FDA
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 00:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dFn2uuBOOmJVQtDS7TAalPxtSyMon+TvuJ8ViCZ+fEA=; b=vyCECSJ8UoLxVr
	RfEDwls5vwhZQ0hcTSzbLP3kDmhSpNQ3BGqwlLoh2q3LPbK2kSpkWMwRPxza0GwFUFkOA20CKA8KE
	nAVXTo3wUy9x3KDGwgs3ptUoQejAfsl1SLEA3zeaMzXRynZs/208NchwqNRBknz7MU6YmWqpPE0sw
	OB+1+T77+oww6TqZEwSmMEjmzbzqKH2KiKmzOm5bWMCB0RPbsQfr48zkTEecn0uRItuzhE71Vp6L+
	n9cX0WEDjg8LVmoUrUoZ8zSJVZpfcvd7o6Pl2yURCUlCIRb4y+3Jt4ZUpbJ0quRI32rKm3cmciisK
	T2mulKwO3FnUbmaYMQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulGSV-00000006EOT-1CYv;
	Mon, 11 Aug 2025 00:32:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulGNq-00000006E7c-2kji
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 00:27:27 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso3920957e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 10 Aug 2025 17:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754872045; x=1755476845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=le03LPNNHn04eLr4/u77ZQYFIPVReUnHNpLLeRwxm3s=;
        b=fdVcF+n/S+fas+QcMR8HSVPvKD8xsEZVEmebjcIuFhd1l50HBek5KmokdaWZ3bkOZf
         zhLibfdqpZHyhiiEfx5cQfuxLfpq6RswKVLQGQl0co4GCRXwcA9zQoLUU3NTV9oK+xz2
         dD8hofn6ELZwQGpqPjIE91uBDAX5f+GUnVcqAKJhja4aLdJmQte+YEFylabiRac7MBzp
         MIxwttz+Go2ZIt8Bhr/YZ/i8NDrtnUpTjo1KPt4zlyNJiBc9qyMg9eJpl8yfpkyTvjZR
         y7jCEYyGRBuwJlVyWrhdB54ivXcXJPfA/lbHrAmLD09F9eK7rvr7/mlQ7B9tEx+11nz5
         LfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754872045; x=1755476845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le03LPNNHn04eLr4/u77ZQYFIPVReUnHNpLLeRwxm3s=;
        b=hbOPFccnyFsDvf3G5MrQU+NhUB4K8s9EOCTzluanzNQlvmrPidqokvexwr4I5PNqx7
         MJiFj7H487mt+X8atshYxneg+fsYXrLwFGnw9iaXoKzwo0+GU77rKQyi3k3naD8aXV+t
         q1qKgOli+Ibpn8t5nweZIzNQgBtH7aGDJPKM7MwmFKYocA+IBWmVuFwN02UVj7brEAED
         ISVtdOHei6dYaCZVtkuJGRLo9xE7V2iVUFNSWfq2McT7EtmArJpaA4ar3ymPr5W6BDHT
         XbltupZLB7w3zvCJsTLlUYB25e9KwI3btem7rkQTmqIbxqFMDjPxUS4g9P1948R/mDXu
         +7sw==
X-Forwarded-Encrypted: i=1; AJvYcCU9iAFlBJHa4D7/CFyKE1ngP8k+aJizNmaSgthsjSNItAQBcBQycYoGsTtgB/hmOqvUDZ2JipoAZJx9VA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydPW4ipKqtHThRJT/3KqFreCysGcEAr3O9qcYxyk50Oi/B7WU4
	ygRjUcuH94EYUKhdtcb50ZGB91AgyYDzIv+OAlkNRjyTuvg5wFGnRLWf
X-Gm-Gg: ASbGnctTOQecvFYH77/mEawimLZXNtAsrfHHbiSKTQDp4Wf77VZl3pYRabe9it2hMj9
	lPXt77OkX/zvTN1nvgHTBNE3qVYEopE6/NxCm89bKQwr9iXaDuMOFOYnOsRQ5GefIbrhyc5F+bt
	FngKMvQ7lvhJvINZfQ20aJ/3qgn9b66sbRh9m+ImuuS5vLAOOIwToem0vR2aFD10yorNSn0GoRL
	iqyXcyIUSzJ8Z6vmM2+5ORaWwiwy//ikjh/VaS87qglMoAjNlyULsvaBQwvSDi1NKwBcskHi60s
	G7PNGm9cpZmXXjng+uja2dKeey5zHR5l8tXLDW8xT9gdoVTxLQl3v241FUR+m51ctD2CaPvg9pj
	PAsCGnoJNRlaeP+nCSy8evw==
X-Google-Smtp-Source: AGHT+IEYuqYxc29rjtoFT0RdJhS3Q9V5ytjnZYdUQkNqH7yOCrCWU+IPPq3TvkF9B3Eda73OdjdnLQ==
X-Received: by 2002:a05:6512:b82:b0:553:37da:2bad with SMTP id 2adb3069b0e04-55cc0127ed4mr2807412e87.38.1754872044364;
        Sun, 10 Aug 2025 17:27:24 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-55cd02686e3sm472957e87.29.2025.08.10.17.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 17:27:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2] irqchip/sifive-plic: Respect mask state when setting affinity
Date: Mon, 11 Aug 2025 08:26:32 +0800
Message-ID: <20250811002633.55275-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_172726_697269_572ADB72 
X-CRM114-Status: GOOD (  11.01  )
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
Reviewed-by: Nam Cao <namcao@linutronix.de>
Tested-by: Nam Cao <namcao@linutronix.de> # VisionFive 2
---
Change from v1:
1. apply Nam's tag
2. remove unnecessary off-topic change in plic_irq_disable()
---
 drivers/irqchip/irq-sifive-plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bf69a4802b71..866e38612b94 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -179,12 +179,14 @@ static int plic_set_affinity(struct irq_data *d,
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
