Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F129D42B82
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LBKc0dwyfvNgU2OSzOhG18RQJthGJ0leafv3nFBXj1E=; b=ROgI8Z/0HRk9ud
	XzUlibbpdAEQFUmeGc3k9etCNJ7nlN79P1qmJqiZIU/cybwo0vs8RERUUUErtwGq4PYvAuJDhbC6w
	1K2RC9CECxrBT+2tz7SGJb67I2j/ohObKOl/GB0KpncUpEeAIzLMeGOAbdK9QQGMCs8Nsqo/wdQhA
	nH+BIsggDGbZLtDKxI9cp+hvx2gIYPR7Z0yDFp9Y++euw285F3yuzWuA5Gswe2Dyl3v1IHDIcW/0X
	9M7flJqi3KY1k0IsoCDbT5MW3KxALmXdi/ieScxhPs5P00FRlbh1hxeoFn8un9M6KghGItRcv6klh
	Xn3VVqm3KDMgGKVhipqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArCQ-00000003dD3-2Ldm;
	Tue, 12 Nov 2024 13:44:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr2y-00000003bJY-2Io7
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 13:35:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d808ae924so3518928f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 05:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731418506; x=1732023306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4uQtM40V/AAVLWbsCcG0T8laTlDVPnv9JhUGANTkL8=;
        b=YEFqHbBidEAa6Al0nIvbvCG1g2cjH5KCsEHQqqGPrGlrhlSIyzuVqRsBn68gsEWwJH
         TN8sOa5V2F1AxH/zwvvmCzAsd184ULh7MTS/srrHXQ0eSxjD/JoqRST7KBTnZbTZasfY
         5Q5r+JwfcVuxlQEPcNhjSZjVm8O56OJFgaDbvTBzcG1FFHZSC7jSOwg7y+u1fPH8868S
         1zE9JIrjRFo8HzOCpBgcDO5gZ5glvvz5zCAYWD3qjZaCNBAxazY4csdSiVqGhFNFCWZ5
         aiudLgQTakAG2h29OilgLSdlm6/3ixfWlMOqvH0+SzwDqHbsAYMHQlvhiDiquFVr5o2j
         OC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418506; x=1732023306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4uQtM40V/AAVLWbsCcG0T8laTlDVPnv9JhUGANTkL8=;
        b=ai7TdYgGSrVgceBlU3h9HtzFXpsNWnUeT3UeaeQRfXg6X2vh/4ZUvyYwQXEZc53Vwo
         i+9mZ9pFC8Aoequ8xEyFaUcrHMMbwxr8dNfcwJx5xZtxjNznc8K6qA77yRz6am42rcx8
         cp6bA6fME1Ri7b4zFVxBMh0gnB7Im1sGXk+ZPaRGWJ8jdkt3WdWOnO8D0Xzvdc9RXSyQ
         EcvfZQCb1h0tGpAd2CFcnKw/8/ySoMfg+b5ih0Rpu4xu9LfZ3fTY1/UTQ5EXnqLdXy+7
         UlrtslzvJgm2GPOvDWZxG5OPJApVVM722OBq+rkqOvW2kjX/0sWr+qGGk0DYwAVB2pZU
         lN9A==
X-Forwarded-Encrypted: i=1; AJvYcCWe4++jruf6x7l5xJMViFIxd8G/X7eqf13nfuwoq7UBZ8WTvj/oiR77f9oVztbrQkcXNAHSHWjjx38Azw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUfHVLxa6hTi5SiXxFF08AOtDKgFRNiaMLr+4PG8XH6w5xkYEl
	fhkaCqBC/ywlZc1qBVqKjL7p2uONOSGGZuoW5/uXIK95r1Ur5sKutaAwNoZLSQc=
X-Google-Smtp-Source: AGHT+IHajeEER9F/q9qF7Wuph7Bji0x5a6RbiRsxvGe2BTVs4+IoqQQ9y3jR5ZA7i/VSAcSTGyez7g==
X-Received: by 2002:a5d:6dab:0:b0:374:c92e:f6b1 with SMTP id ffacd0b85a97d-381f186b53cmr14933265f8f.23.1731418505982;
        Tue, 12 Nov 2024 05:35:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b3611sm241640655e9.13.2024.11.12.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:35:05 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	samuel.holland@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 0/1] iommu/riscv: Add platform msi support
Date: Tue, 12 Nov 2024 14:35:05 +0100
Message-ID: <20241112133504.491984-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_053508_891111_912DB05E 
X-CRM114-Status: UNSURE (   7.89  )
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

Add MSI support for a platform IOMMU. May be tested with QEMU when
including [1].

Based on linux-next commit 28955f4fa282 ("Add linux-next specific files for 20241112")

[1] https://lore.kernel.org/all/20241106133407.604587-1-dbarboza@ventanamicro.com/

v2:
 - Dropped patch1 of the v1 series since it wasn't necessary [Tomasz]
 - Improved error/warning messages [Samuel]

Andrew Jones (1):
  iommu/riscv: Add support for platform msi

 drivers/iommu/riscv/iommu-platform.c | 102 ++++++++++++++++++++++-----
 1 file changed, 84 insertions(+), 18 deletions(-)

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
