Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31339C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 01:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMrw7jE8wqGtzmX7nm/zP731Xr3nSU9MAgZzn6gNErw=; b=lmy0iQAODWd9a5
	EICoE8c+GOWBo0hmriqoq7eDVB6UtAoF+aUTXpUvcj/Mh3VYI+YTDcvpDodDITqFVHw0iFLCfzr1d
	pTkB0SzOI5/O9ApqtImUu1QJ1AQB6YjWeicAGH/eTts1nuNml8CONeeWEbHMwo/Yg1nMZJHHFiyfy
	3SkzAbdwP6+kKC+3nsEXxzUpXhu38SS2ayLU/opP8i5kSRDR89vGqrepS7QxmtP7DkST5Q8oa45F1
	ThM4fLxAFYeq8lvMBAGKuzTBoxHquHcfbYuknNjwD81oE/eMAMN8dDMD69qmZ5qgEft3s3mLpuIke
	ezPpWFVhJw++X2+TsbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngzDa-006rdl-Vo; Wed, 20 Apr 2022 01:33:19 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngzDS-006rYO-V9
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 01:33:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q12so128712pgj.13
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoHTOogFtEFyi2gNo6Vrdy4zpvF5IOVfK5C2C7jCsAQ=;
 b=MZELzdB6m/N+Tx2B2ifqHAoQt0o7GPvWBNxirhKoqDbWPYy3pyvqNwH5vc4KKtHimo
 tIJgCsRmVYwVmJq8AqCt1MbKzPF50nYZVIZKSgpuF0Uc3lsa5Mpl1BjvcEmtVfBzjcLT
 MJZfUrZY80AGXx+8axdjdEPU3FXBT6/aQosj0HVepLz6DaJjqhD24X6n5EahYw0oXaD1
 y/ryXYBtJjPVSADimqPZXceX6fXJOeNoQRUGdZzzBeIU+iqkZbypTBw7BHWUiyQoSZf2
 r9g4wdgg3jG0s2CtfZ3aHi7Ismv8AcqI/lZpZ7Nke/lZ0o1owmZOKKOgpniMEVM1yiaM
 3oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoHTOogFtEFyi2gNo6Vrdy4zpvF5IOVfK5C2C7jCsAQ=;
 b=tB6rD9iBtJBZ7RDBaVn0bG0nLJzLXI2iE+xWfmPYZ9cX9aRkLwkIvjFUqUV0NU5PxS
 OCDjff0E1SB24YGkhE0pe7t7UvZfkImO/VZnCfXonFtxw0mMMAmWulZem7gdEH2yIFRc
 35kEaZ3TDYAADS7hCluuavwYyNMJe1uE7Ny9mSxCJ+xeJe3zyHlNGc5LCPUfjYVKGL6a
 8pihv1XvEFwcTdYkABz9Iwngu62nqAUtj5A4eG3OnO4YiKXji/Hdelosy1s0BvU3Av+H
 PewGxAETprN/0f4+KgGz+56dtv4N8VuRY4DaiKFpdDrl4F9EvNjk1/aZI3L9b4hLD8Pi
 UbkQ==
X-Gm-Message-State: AOAM533KLTqnCM574PoG1QAehemkmU1HWu3hfqtjqhZzU6nIhASCGMKb
 YR18w0kVqcV5c6KA59K66XxuJA==
X-Google-Smtp-Source: ABdhPJxubNniBJ0qcUnSZUXfvxlKrtRZAvi6X+saBuEJcQjBtqfiHGpD3lEIBbsx8g8XamIAwcIrLQ==
X-Received: by 2002:a63:e912:0:b0:39d:f8f:ca7 with SMTP id
 i18-20020a63e912000000b0039d0f8f0ca7mr16851234pgh.121.1650418387455; 
 Tue, 19 Apr 2022 18:33:07 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a635d0d000000b003aa482388dbsm2484863pgb.9.2022.04.19.18.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 18:33:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: kvm@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 1/2] RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
Date: Tue, 19 Apr 2022 18:32:57 -0700
Message-Id: <20220420013258.3639264-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420013258.3639264-1-atishp@rivosinc.com>
References: <20220420013258.3639264-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_183311_034108_066E1C5A 
X-CRM114-Status: GOOD (  11.10  )
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

There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
enabled. But it should not appear in the ISA extension in the device tree.

Remove those from the allowed ISA extension for kvm.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6785aef4cbd4..2e25a7b83a1b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -43,9 +43,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 				 riscv_isa_extension_mask(d) | \
 				 riscv_isa_extension_mask(f) | \
 				 riscv_isa_extension_mask(i) | \
-				 riscv_isa_extension_mask(m) | \
-				 riscv_isa_extension_mask(s) | \
-				 riscv_isa_extension_mask(u))
+				 riscv_isa_extension_mask(m))
 
 static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
