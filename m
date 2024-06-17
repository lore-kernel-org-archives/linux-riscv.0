Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11BAC2BA15
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qNxqBu4lq10Q2pckpD2YcZwn1YBDdI02VEAR/QmSCU=; b=rZHgRfwvjd9Mzh
	E9oz4raIxCh7u9NifazJvyG9v/x54R9JcXkcxN5lsc7h84pN9cI3B2aCEairt6K5+qJnJ3aJHtXNu
	caOpHKCwJ2BLWzjA8DGwwuvmXTdMrpT6Hp0SsZ7PTYH87MOJwmJr8etACd6NEce3rm3NqkxgtyFPB
	IhpvhULPa9W6Z5i4JOMYdsydz4+nX8mu4OssIp2Iz4W3YQ8PlFiwVeDmA3d7Y2n1QhcPi40Nb5wAg
	PLXWFe3UibtiozU6ZwYuOGt8DQGZp52PeDxiLTE0Ka3SagBSSvhOg4HhocRKSH4txQYyOWMfDHG66
	4jHk/IfiWjCcoK/3Y+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCC9-0000000Ambh-1Jd9;
	Mon, 17 Jun 2024 13:14:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCC6-0000000AmaC-09nz
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:14:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70423e8e6c9so3791114b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718630085; x=1719234885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqH5PnYnV4OCHciC6unnqcv3QJd6vOkUagh67OcQSZo=;
        b=f0wgU1QqQn0zySHmPL8AV9HC/Lrd+TXzDyKgBkx/lXhRPchUxB0OaU+e5IiB4l/ofG
         blSdcIAvpS3H05c26YLHlWXhW4h7cvMpqrcXw99s0vUNBpMSvcBv+f/r24a7La0zCpkd
         Gw5sAn49Yjp44570G5ZCCPvZDsZiyjxR/544D/XzJOj/1Ql73Aaq8x9Hj5zXMVOLxz14
         V2JgWtZU4wTRloVZ9qAGNT2HPBDYcJCfxELM4vprSx/XNm8BwP1mXq5exanmB4zdZ91d
         pwYyHRmhX705atKoAv0GQv9iOjjjncLaDOCijvpZTemNB3c9vmHmngqxuqOBndLs5wrR
         BCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718630085; x=1719234885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqH5PnYnV4OCHciC6unnqcv3QJd6vOkUagh67OcQSZo=;
        b=tRGbswYF6iPrdEXS/6vUiZoi9RNFb1YHoMx26wmKGACTPtr4RNrkTA6o33Im/uHuI/
         B/DVVNgupw6xACK67aagg04JxpVdBfcogr1qD5zN8OASffK/dmldSA4J9Q8PQ6BnJLYc
         os/9voqjpdZrXRtqrATuZN+9zGRCsTrFiJLU7MTH+ZBVjkovYUxRatuLB6JKbSol9sh8
         PP+mfsfKPvr0WbDxAhHKRgsGEZoExVOeffnSxg/PKRxnReQOAarqGZo6w9kNsmOZs1xd
         X9mqW+vLEPnIxhQt5a6iHoLO+L7yxc7NSKwR5HQVlwuoc7qorWIxSSDpvFIpGny7oZV2
         lqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/YlxyFKmxhLcsoxyZ9VDS2YS6ZrT+5DPZTu4b1CsWNthfkkPtwX9EM/6TtDPMQcGt7u/HedL7z2Wy/lCqSEhPRAbveQNXzSGThhQRWZ2X
X-Gm-Message-State: AOJu0YzzauGPD8fnLEsRO2Qa/sM/beoulK8s7YiM8/C2RO3XF1MFnwuG
	Ar9k0C7C6jhFuI8+jhrS5248zeAdokd3ym0un7aM2tIFx5+Shmgwj0X9E0d6ZqHyTCNL4osCnA3
	/ikw=
X-Google-Smtp-Source: AGHT+IHUp84UpJvFEPcFIvQ17kOX+r6zqro+izswgYoYp+hs6jkxCQlxN7m1kXBF5qblIw630FU0lw==
X-Received: by 2002:a05:6a20:3caa:b0:1b2:b2b:5698 with SMTP id adf61e73a8af0-1bae8243b5fmr9208865637.33.1718630085193;
        Mon, 17 Jun 2024 06:14:45 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f0260csm78801785ad.200.2024.06.17.06.14.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Jun 2024 06:14:44 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	sunilvl@ventanamicro.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v6 3/3] RISC-V: Select ACPI PPTT drivers
Date: Mon, 17 Jun 2024 21:14:25 +0800
Message-Id: <20240617131425.7526-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240617131425.7526-1-cuiyunhui@bytedance.com>
References: <20240617131425.7526-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_061446_098252_400C5996 
X-CRM114-Status: UNSURE (   7.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

After adding ACPI support to populate_cache_leaves(), RISC-V can build
cacheinfo through the ACPI PPTT table, thus enabling the ACPI_PPTT
configuration.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9f38a5ecbee3..1b4c310a59fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_PPTT if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
