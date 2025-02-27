Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E57C1B0D9
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kc1ZxhzoPZfqzTdhj/24scQyhJtezCW1yqo0vyCxMQA=; b=NUXA7Uld3P+NvS
	ZzBbi+F+f3v9PRm8o75cfLSyNei1tpcKtg4S5YvxtKlMxyrmCKNxt6W+jFHLZostQyv7iOf1h0qTS
	KgvSbyJnIYlJlm7Q565kQ0G3FWOlQ08VIXXrU8BE6iF6yQBR5bmuOxJOlpLEzLgDYq4AP6cnD23zs
	h1CGnZE1q8W8RnEMovtE8qKCWvlmBG+nvMmSFemkTIirhzjJWyz6FABDkqEH5ky1SEtFYn7b9Be97
	YDuAJI4U5nilKi8+pz4mdD1GoVu/dbVcTT4w/7o585EH2347uUx4kZR1B6BOsZMqpHDzD1neS+Aqc
	LROrnpRIy0YIiTPB+a6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndok-00000007V9R-0eUl;
	Thu, 27 Feb 2025 13:20:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8O-00000007O3h-1Oiq
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:37:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223480ea43aso19851305ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659819; x=1741264619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvAemUtNRi9tUzWy4d/eui/dPAc9laFlbuC1eHj4jHs=;
        b=KTR4PujPW9aPLfi5QQVZfcIoJG4v3TRbbj4Pr+o1wCSMxCCfcaJjvNgO1nvnEQUXsJ
         vG/Jr552LFvQM2NbxrfCnfrHY8+5l2wwpNWEbsRoZR9hVKXumMHN/SHcunDIsTUrxbYJ
         kiDmR5HJb1dAO+Eqa8tOgN61bP/ijw/Wl74MPJgUXj6Pw+tUgvAFbMAw3xAaIh6hqpnk
         ZfJmaSfYzSEieElQ51ESjtFOhMZmgNBnxypj+NfMY5ibdjOOU/9D8LUM9uqdqru7yTXF
         X17X5myt8h/+QUy4MuUdWmmiJ8J104jACi5eyhTeWLF6Fqe5c//+xAWXPWCRkj7IR03F
         dWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659819; x=1741264619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvAemUtNRi9tUzWy4d/eui/dPAc9laFlbuC1eHj4jHs=;
        b=T9xJRmAZtgrPRjorr+iZ8MPcnKcyJnMqoymovojnC0VvAxR796CGg0eStLuSejL2UF
         KhfRrMoAKrf/8OvXGcC9MaXxOp/ZUBBj8WmJA0XB2awFzrpwtWe+iGbWFsPzdsOx9Hda
         +QyuZzsWXKH9tC0uL59PLu60x2mSPK+ztcG3J/Qp9JktGehglbXoUrJgGrerauof97pP
         8bfbsN7zXMhORCUzuBki2D+XgWuiJPi5hEuEo1swllEWFsBJHh/8gtVQPEtQ+FApoDrO
         GKOQeE3F2eoe4GE+gfKBHjk9SR+fS9YogNCepBrgrYtrEJZVTysEFka51ES/XF2JspPK
         jG2A==
X-Gm-Message-State: AOJu0YzCDTho6/p66iRY98t5YTtJltVzSMyTjbyBgS46BK9zlur3j2Rq
	gRkTUnK+KZd4LOgt+Dumi1CIRT/4UpV5uZgqUgMRum5fNwfdF7a5eU2jMi6a81R8thKmiTWwGIO
	uP4U=
X-Gm-Gg: ASbGncv5VIaaGu4b/vxERNl7Z7lsD08nZ02fK72ExwxLsUtErKt5aDamCzp6JwbSLab
	g6XVoqaa7gwhot1sVp5U6oYYNyrIRykfMOlqwZ3kipoN0IFaPDpib2UwwKMdKSOO0xMXRYSUAH8
	DQBgYZAhz6cNdmwXsLXmj4f5nGXTDoqDKIWICFDDy11LE+HIQk+7Oxcrt09wBFuznvTKuwfQlFj
	Ex4KV2dUxojf6LPd+Wx64UHYLKSqUejkzWvkbI3Kf82/vnazREkU1Fl/6pVWSwWud86S4xxE+Ms
	R7Pbi4aFzcudtyn/7PyqmXNDNIsnd3kVELJ8
X-Google-Smtp-Source: AGHT+IFYVtprbH9evLqNClf+RfnxGHGySs3bbzOLOoRiAZRk+G2rF8ng8rvkLS2SHiGq2QScEJQDTw==
X-Received: by 2002:a17:903:228d:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-221a0ed7e4cmr423165445ad.19.1740659819428;
        Thu, 27 Feb 2025 04:36:59 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:36:59 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 04/10] riscv: Add fixmap indices for GHES IRQ and SSE contexts
Date: Thu, 27 Feb 2025 18:06:22 +0530
Message-ID: <20250227123628.2931490-5-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043700_369050_AAD6A786 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

GHES error handling requires fixmap entries for IRQ notifications.
Add fixmap indices for IRQ, SSE Low and High priority notifications.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/fixmap.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..fa3a0ec0c55c 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -38,6 +38,14 @@ enum fixed_addresses {
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
 
+#ifdef CONFIG_ACPI_APEI_GHES
+	/* Used for GHES mapping from assorted contexts */
+	FIX_APEI_GHES_IRQ,
+#ifdef CONFIG_RISCV_SSE
+	FIX_APEI_GHES_SSE_LOW_PRIORITY,
+	FIX_APEI_GHES_SSE_HIGH_PRIORITY,
+#endif /* CONFIG_RISCV_SSE */
+#endif /* CONFIG_ACPI_APEI_GHES */
 	__end_of_permanent_fixed_addresses,
 	/*
 	 * Temporary boot-time mappings, used by early_ioremap(),
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
