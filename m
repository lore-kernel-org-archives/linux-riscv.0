Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CACC52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KI54jcscEOaXAtXYGbuawsFMFp43RsH4SpPjncDdiaA=; b=Ux3V/T/9c4jv66
	StrbGn/oBDCQ+pZmzx5SxZGcJoUWlMm6P1nifyPvlsJm8kj7YzP/Xl5+1Q0xPpbc/PYfXUkTOMbdd
	PhiKP96UFLAbOKxk0PqYMMT60MpVdzRetqC+f8dfjfKEIjWG4VNq/Yno/bxqi9owAzjfK5FCzdC0k
	ck7S1SFvwtwbs8KkPrZXOh3QzaM+25HU8HFO5MVhRYriYGeXfU5EffV0/ti6A41yKE8AKq0QRUey7
	Q3VdMn4yJCo05DKf09L5Yp99lUoS2jAuHSg9Cy8bBtDraBIDwfEUdWdMfe4on+DgoFC25om67R8dm
	M7nffsUsCKBTw6zDi3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRj-00000007OJY-1kTs;
	Wed, 14 Aug 2024 14:57:55 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQi-00000007O1s-3KD4
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:56:54 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C1A53402EE
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647409;
	bh=EVnujh8KUTCiCooAY0SE0ZN2aSfYIbE0OsxWHQEB47A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=pnVXmcKy0S46jptl83+Tenc9qxvnrofYSGheyjS3BXk9+2LehXVq5LugNtzNK8WnE
	 6f2CaQExjKgj1u8Krja3sk1w7da2Vouwk8k8L0d3QAndW3oIRmv8Qv659Gz6HjCoFw
	 /JBTJCZVyL9T2mdlfaS9Fa5IiZgZtrn34XmpELyehbIu0m1tCYWQk5/8x5zbyio+q0
	 LZihxWis1Hikid3eSjdN8oMbyO/fzcY/dK1XQNAO/3uAroBykrI9UT+vhrVHLv8umb
	 qcFYJfdUNNaYZIA+0G7vBFQmr3EKmSD+SADPw2AITPBBPySKn+aqcQqg2KvNEA1SCs
	 PtjlOkUFZWvkQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a79c35c28f1so534101566b.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647407; x=1724252207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVnujh8KUTCiCooAY0SE0ZN2aSfYIbE0OsxWHQEB47A=;
        b=cmrH+K4X/ICVeuhbERRqY7ogMOrKofznt6s6df+EvfbJj5B9466tTD20LxqO2R0rAt
         oNyBIPzf/vUxUY1WHvgSjaXpYf7882O/fxdEOgarRgB6ceDyjayAkpidh/KIZQowopeS
         iZsWWNzsOk7rsuzUlPMOHjbcch2ObJegdl7yHhAfuS68CMXyeT3LQjNWu2bR3uPe41sb
         FoNFYCFaJxIfiaiY9HZQYeduiqp4C6yIRR+rAZY97bKJ4BW3LvkQEnkwYEbxZd6jPrqr
         WPUe4cwnXyPIt68zULWkDMu/OoU/fsfSQg4BRPHkUWIEKY9LDqL3zKCSTzAlVS915rKn
         mq6A==
X-Forwarded-Encrypted: i=1; AJvYcCUlfM8murB4A0SrusvK1F2mkEvgLkuOMHSGEpGexVUAKg36959Kc++FOB1wMyBDzhcApQm/uZWCOg+6rPMJJdsDYsyBlVi6Ra+X2VhrE1Mq
X-Gm-Message-State: AOJu0YwqgPgMIEPFxJ6HuJSdWiGECeK9GFZz/DIrLMtqUG1+2GJ3dUNv
	L3yFpvTN8g+5UFYxfpT2KSmOyYMSIzBQBpSm7cs41EsuU+yAJvWp1SnqTB8caBYYuND2Y/eUSVX
	nHgBmE6xXphlPLgLVw/5LcrQq7RDBISOF87Ms0nE3bUPXa0KA6Fl5/8sGN+U3TdvVfOCTuVBHB6
	PFepEnng==
X-Received: by 2002:a17:906:cadd:b0:a7a:b620:aa3a with SMTP id a640c23a62f3a-a8367034961mr201276366b.52.1723647406656;
        Wed, 14 Aug 2024 07:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLxomAnKFjWs6A9VwCQwHg3vLbUdpfFg+VMb2VSAn6s+ZN+y2p/gB4Mu5QbgZontrDcC2N0Q==
X-Received: by 2002:a17:906:cadd:b0:a7a:b620:aa3a with SMTP id a640c23a62f3a-a8367034961mr201273066b.52.1723647405821;
        Wed, 14 Aug 2024 07:56:45 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:45 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 2/9] Revert "irqchip/sifive-plic: Avoid explicit cpumask allocation on stack"
Date: Wed, 14 Aug 2024 16:56:34 +0200
Message-ID: <20240814145642.344485-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075653_056731_AFE6562E 
X-CRM114-Status: GOOD (  11.75  )
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

This reverts commit a7fb69ffd7ce438a259b2f9fbcebc62f5caf2d4f.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 8fb183ced1e7..f3d4cb9e34f7 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -164,12 +164,15 @@ static int plic_set_affinity(struct irq_data *d,
 			     const struct cpumask *mask_val, bool force)
 {
 	unsigned int cpu;
+	struct cpumask amask;
 	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
 
+	cpumask_and(&amask, &priv->lmask, mask_val);
+
 	if (force)
-		cpu = cpumask_first_and(&priv->lmask, mask_val);
+		cpu = cpumask_first(&amask);
 	else
-		cpu = cpumask_first_and_and(&priv->lmask, mask_val, cpu_online_mask);
+		cpu = cpumask_any_and(&amask, cpu_online_mask);
 
 	if (cpu >= nr_cpu_ids)
 		return -EINVAL;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
