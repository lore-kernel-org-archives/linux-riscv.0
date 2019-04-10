Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2A5C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0D4217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="riXWrrj5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aoLRBfmp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0D4217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXW7ziHsvA884V5EjUzlWEYX6mcjkGhRzuCC1R8oLBw=; b=riXWrrj5ssknpj
	92hWDnsE3AKPGQ4tT52DE4rBI3JwQF3Y/ccsCQKr4Js+zVCAOginp8hCxvBXi6PlyLYJUutcnENW7
	HaT+ld6q7J5foAtlrR1Z5Zr93Cjij3B0vO8k2WR/sEhdNgQOiPO3SeDeA3c79qae3Xh19akFU/lkT
	XgoPxUHqnRj7cXXbxqh0NDshi8Tx/FTRQhaemXFHpal62IhUUU4kBkhMz/U8bg+f4TlT3aK2jOMpW
	NBKvbE60wrE0P/KnJQiCkjl+i7arnFE2ExtgnaaKH/AVJJbwTfbdrZ6e3Lxo48GrF6jxRuZUcmYzQ
	uB0C+pw/bztI1HJOBYKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEMHG-0000ox-F1; Wed, 10 Apr 2019 23:05:10 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEMHA-0008Va-By
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 23:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554937505; x=1586473505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JjopVQqYQkhD6l4s3VEoAfhP+7o2iPgtr6wnHHzUroc=;
 b=aoLRBfmpbnmvj5gyR5MzQN1OPzGBG4/sBvfkB6TOzNO3bpUwUOSDhWeS
 LuUE+1IBvUzXq4y8BOg+O9Pn6VVamS/8AATmZN11ygbReDcdZYiATe69G
 nYS2p4Dz/K14IclVhIICaYjApbuqw7rUPhlyGuZ0yFj0Pl1Re76clqqvw
 CWeJWq+leOdW9d3vSkZ/opJl0bQvzWWvjfh1hGX6YX8uYeUd140efvBII
 /AShZr95C2Rvxc6D0LF92XOCO26wslgo1+l+zXQgx9fCEtYqaGC4dpBIv
 LGKNyAjaldWOF8coGPTjgdCBrARozNtaikT/zlC0VebzhJ6+X65WSjlA5 g==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="107205241"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 07:05:01 +0800
IronPort-SDR: ow2TC0TEPUDRfEgphpZd428DNzHct+sqLXw447AaVMrgSU2MRmZbsS2Q5i7npiNsjvJ6oRcS2N
 Y9rh8sPpnaUnt1t5+wsp2nkD4HlEcWDUgrHJrSH9IDLv1KxXCBg8ndwbPpmdBtQNdOUpa732wV
 2XzblMdaMLYsnjQ4YAH+JGhJoLkmW+UYqEPs/aGLJNMf75EPhgkhP+4Pia01ET/gjvZLdbVQNR
 DWwCFnq+hFGW81frpQi+iwhZwrQYOqjK6CVF0aAcQS9n06iAPANVF+NXCaCSUTlFl9BXGALlmE
 eeeNeWaLflDDC2puqzEZ5L+d
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Apr 2019 15:41:54 -0700
IronPort-SDR: 1rhuCQOXGyrTbb0RHFHg7EKFscG147dVhrFBG9rilY0kCpsui/ZWQxzgO8c8Jl6MdofD6mrrax
 f3wOq8hA7zaAnrPLK5D0oLbZM1v7s7twoqcePEr52xfKBKwI/7Naa/k1VoCFmFcv7wHPY5unvF
 lgq/WyLEtGXeGfXr/nSEFr249Fi+cFsIxHgyu6ZEaBMsPH4geSAdaR4xcu1i8k02HUZfPEu6s2
 LpJt5Kw/LGzHseboHMUGGByu6apGavWdMjVAN3qVteTzTf7GxySd4U+YVlbS8ddxCXOWgrHbBr
 p3M=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Apr 2019 16:04:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] RISC-V: Support nr_cpus command line option.
Date: Wed, 10 Apr 2019 16:04:43 -0700
Message-Id: <20190410230443.15729-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190410230443.15729-1-atish.patra@wdc.com>
References: <20190410230443.15729-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_160504_556047_23D7B91D 
X-CRM114-Status: GOOD (  11.68  )
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
 Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

If nr_cpus command line option is set, maximum possible cpu should be
set to that value.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.  |  0
 arch/riscv/kernel/smpboot.c | 10 +++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/smpboot.

diff --git a/arch/riscv/kernel/smpboot. b/arch/riscv/kernel/smpboot.
new file mode 100644
index 000000000000..e69de29bb2d1
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
