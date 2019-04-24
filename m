Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9E3C282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F0FD218DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gy6ACKfl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="faZQMjYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F0FD218DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trH0o7Kwsvpj9IHdXxpD/6FvKF1Eds8b8yjVd3iAdO4=; b=gy6ACKfl3M1p1W
	Zw9EzvtLlh4S39k2kgnGdexE4T7twEa0+jcdwkB9aPawgQAciS2nZvcZQycqNTVr8tWQIxiRMJd24
	if8k2nyJ0qk1IaMIKgxg+8BeTfGXAO+vPY3Iwph91lqi3sEVYPiGWgM1iljZs2lv5Z1A253qMvcS9
	EQlaysQuSKqkFFNac3Y6eE0rKjggCVp77wTl30e7fjK+PlfygMHnXzpIEt67DYfBWq7xCL+SGTwIH
	m+HUofbbMGzC/uL6mrp86L8MCbWnDUMn81pxkkRjWICT8QGHBIyBVzO9tMrE4CJnEqQQzDNmcjdaa
	XvYdxOp8JXpjlFLm0ADA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ5Mx-0006L0-R8; Wed, 24 Apr 2019 00:02:35 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Mr-0006Bk-5Y
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 00:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556064193; x=1587600193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K0mjdmCfdkrn3w/zT4aJMYOdZrUml3L58iZRwDuQ/Lw=;
 b=faZQMjYdtZx1xE6eTXL9IuiSEV9MMekZvrP2BwkDHynVB9x19PE8FDvc
 NY0d/7QLxbJotfcF1LqSIruCijvbTffmCINHvOqMZ9dLQmHIfXuGAXKOD
 MvdAXMXLKUWi6JcjqG0o8B/xbimt9KONwKXfyQlZBQJzcozDbYr5Vpdjy
 7neGF8xJhf/gSYDpJGh+81n5fZsaHiiifQjvbIqXkoINrafY1SoNZZKZJ
 HOxLvecz3lfDj1QC1f37BKdxoXfR7aF/ERyWghZ3jLH9SW0mhtMfkSQ9V
 KWtZKqmGn+yVXfgIuf0Ewy468MdUQ1aLCXK/IKuqPMl+EDXwmyRmLw5Y0 Q==;
X-IronPort-AV: E=Sophos;i="5.60,387,1549900800"; d="scan'208";a="205772520"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2019 08:03:04 +0800
IronPort-SDR: NRl+bAOzPRe6cgZgUgbgxYPmG+8qFxowo02ITeM2zE/0dsBVVcYLXp7lsliQeVm7SdMM1cyr5B
 tbAVfDapX4pBSe3bwWutQiCadP36P9bVBwmJl9a7YlTsGw9lhASZx4zWivQ+m8d+Pg0ilrov2H
 7wprxZJu2VA6eRE2lKBG4VI0Hp8B8U5Jk8ea4YG0ulzWPi/q1yshqLZzjcr1yMgRbuK0aA4wFP
 msjPSCtyrMgwyMVaoVxZQCcITE/YVp/UCsbRmgLANIm3tI6pyYutNDLniM/YGsGb1U+wog9VKo
 b0nF5SAny9mXQL10rAhACksQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 23 Apr 2019 16:38:55 -0700
IronPort-SDR: vLxFqYKRUEO2Hyzjha/t/tSa7wtu+8Bjtkknn7qkd7Pfg7hK26rXSp/pUuMj332f7QCLldAZCL
 bMZ+M8zqf/osPxKB2CaFEk+UaU5/QIBrQet2r8+IxGXh4f4xRcfJ1EOfwo+Vn1u7/tYcnKK/PH
 OQ9fU/MA3ldp175wqdWGT3ZxJFPMrCo+1loyho64iijURyU37AcvZnG3DzK3LBuswcgQnPfvp2
 cY6d17rnQqtblP0Od3oiZRatNJynbfa9EG/sIg3MzedQxPgvtiFmOJA3rb2JpTD9yg0wylIJ2P
 yd0=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2019 17:02:23 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] RISC-V: Support nr_cpus command line option.
Date: Tue, 23 Apr 2019 17:02:27 -0700
Message-Id: <20190424000227.3085-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190424000227.3085-1-atish.patra@wdc.com>
References: <20190424000227.3085-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_170229_445299_960E30AE 
X-CRM114-Status: GOOD (  11.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

If nr_cpus command line option is set, maximum possible cpu should be
set to that value.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 10 +++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/smpboot.

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a8ad200581aa..7a0b62252524 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -84,11 +84,19 @@ void __init setup_smp(void)
 		}
 
 		cpuid_to_hartid_map(cpuid) = hart;
-		set_cpu_possible(cpuid, true);
 		cpuid++;
 	}
 
 	BUG_ON(!found_boot_cpu);
+
+	if (cpuid > nr_cpu_ids)
+		pr_warn("Total number of cpus [%d] is greater than nr_cpus option value [%d]\n",
+			cpuid, nr_cpu_ids);
+
+	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
+		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
+			set_cpu_possible(cpuid, true);
+	}
 }
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
