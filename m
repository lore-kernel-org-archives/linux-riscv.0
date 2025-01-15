Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E682E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 03:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TcEEzW6U1NTbKGqwVHQ2dtyRuHY8WVfNIxUsldm4HRY=; b=E2nfCq/LTkmZIy
	RXzD8MY8pMcjtbPUG2K1jlpzSseERMT1qrGkSNwQAOPS3igxkqc8xGZqxjE/CaV4rjrmx+fFWoBtK
	sUm9Lrh0UjtYrG8hQ94OGqA1zXl/Naftpf8Mq3Dh8mshNM0U1fOA47gWyuXrsstG3o/of17edoDC9
	Ul+pEErNvV2ZgvQClFBbaJeBtGSx0pkjUr9AOssAzn8pB7clHfSjnfqf6qL9tdZAR/lGnk1KG75hq
	e4xGKqlwfB1WdLRNnWWftJ9LXK0V7Wq32pKMCS7tdArnHLMzEwjv2OY7WQuCmLs3TsclEWW5IXPB4
	6n1fwErw+vj1NAXjx9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtgg-0000000ATV2-2wiF;
	Wed, 15 Jan 2025 03:03:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtge-0000000ATUi-2g5g
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 03:03:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2163b0c09afso114207655ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 19:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736910199; x=1737514999; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pFOsksjub0O6BKOG2DctEoxnB4foUbo5c3Iev//NN8=;
        b=fXVgpa7+a7K/QguqaWO2ajvwXVBEDpu9e1BbryG0VwhOMtZssbJabAz+hDNA7HTDwn
         WQHYNqdaiERc96xg+no64z+LPnOdX0W6BAX5f8NpycNdruOWXC3FL1jRvRep5VoiejUA
         8l2TRyrk1YTAilGlxqiP2JM308kU6Ne21t89EY3jJKj0JQylbmXEpQbM0Q5giGEMxGsF
         /kZVyaZQI7NOu1lx3Nhs97YX8tBrQ8Ph5IY7mo73LyhenVKM23YJoEJlSy96zMRPexcl
         VvhODx+xPHIk4rZ832e8c0UVpbhkUFAangc2Y8pwYRgvjCUTCVJ2g6hz4N2MPbe/zE8K
         qcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736910199; x=1737514999;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pFOsksjub0O6BKOG2DctEoxnB4foUbo5c3Iev//NN8=;
        b=eXLgOg2+gNUN1/K38/2+sW6Y7adlL7mXwRKBxvuu6PqUyCtgAOvIxtDadotHYZBo6Y
         WYD5uD/3MsF7N/IqNteQZxfHdhqrlC+WdnB4616vSJg0GSr5vL+QH+TBgG3W5tNSOY/t
         Rw5n7FqJ/AiQsQ3muVkN/F7XDXpvpFFtumYy7phuf7GgfkAFVtu5qrRoeWxnlQd+7fOz
         1HdwDvV+sA55N8sPgQ4d0EJrxUxPtnaqra03DAVWLLtPaODxfJ4okJR4UO/HB4tK+NRs
         YJ/Z3L9QQijiQgm/fc9/St8EshhdPyPjASW0V6OcO4plzqS3hgPRQKW6pB2M/GCBP8P8
         1kBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn8/8cAVXj9RzaIMo/YPRZ7c4MgAK8x6oQFk3O5WqluE9dbHelSbktkEjfp/ebxMwu5hG2xh3iOurs1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3IZNsxCZwTlx6pc38vyCingZcE8D/NiczQxFbRikPe2BOcBZz
	w4/yNPdu0upqzhtuwIl+EsbGmVRXatvNunZytQGkITdFxRfsiYDYjElTkAnCIPU=
X-Gm-Gg: ASbGncutWD/L2pdMHv7oKtA14RZeao/+RJGFWudI+zjv7JZ75cEbQzr3aof/peaHcdD
	XSuKp72HFfuHB5fsis9rKGDuHkcUgkUNqdiAv+PVlnMb6Cw2Z1VJUY/jxqtih0f382I+IVp187S
	nF8rWyv1iLTyvaU+8y22+UYG2MOEvBya55f1PqHqerhERSgyFNNmDMkmmj7O6BRRwP7VYM4nEGS
	muYwEZN14FzkfBom+v5SDin0y92L4J5mU0jWf0EydfFuu3AymIVh8m6Uv79pcSvFbQVFhyFNFC6
	Y+U=
X-Google-Smtp-Source: AGHT+IHW/OudNH8nKEGYTcmbRjkDHNnTx51q5XxoGDRShfAUh9zNbosxSEMnJSoL54yuXDXA3J9w9g==
X-Received: by 2002:a05:6a20:c799:b0:1e1:72ce:fefc with SMTP id adf61e73a8af0-1e88d11cb13mr49342319637.22.1736910199248;
        Tue, 14 Jan 2025 19:03:19 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40568dccsm8123668b3a.47.2025.01.14.19.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:03:18 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/2] RISC-V IOMMU HPM support
Date: Wed, 15 Jan 2025 11:03:04 +0800
Message-Id: <20250115030306.29735-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_190320_697873_A1FA6036 
X-CRM114-Status: UNSURE (   9.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This serie implements the RISC-V IOMMU hardware performance monitor
includes both counting and sampling modes.

The specification does not define an event ID for counting the number of
clock cycles, meaning there is no associated `iohpmevt0`. However, we
need an event for counting cycle, so we reserve the maximum event ID for
it.

The interrupt handler needs to be a primary handler instead of a
threaded function because 'pt_regs` is empty when threading the IRQ.
However `pt_regs` is required by perf_event_overflow()

Changed in RFC:
- Rebase onto v6.13-rc7
- Clear interrupt pending before handling interrupt
- Fix the counter value issue caused by OF bit in the cycle counter.
- Invoke riscv_iommu_hpm_disable() instead of riscv_iommu_pmu_uninit()
  in riscv_iommu_remove()

Zong Li (2):
  iommu/riscv: add RISC-V IOMMU PMU support
  iommu/riscv: support HPM and interrupt handling

 drivers/iommu/riscv/Makefile     |   2 +-
 drivers/iommu/riscv/iommu-bits.h |  16 +
 drivers/iommu/riscv/iommu-pmu.c  | 486 +++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c      |  65 +++++
 drivers/iommu/riscv/iommu.h      |   8 +
 5 files changed, 576 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/riscv/iommu-pmu.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
