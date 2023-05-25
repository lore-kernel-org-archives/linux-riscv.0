Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FB5C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0g1h/0kE/w8LPS7Mj71IIzbPLXO9Nz5c5B+G5YIfDtk=; b=SgAnZzV1rvfB6V
	yZLjyprEJ8Z2A4dddLA4QzXiBoAjTRyZs8Gt7BP3fVQ7yn66cy9OCNs6lPjZIbnnemAe6kh2iHG5k
	TZjsTnVzoXYAt1rvD1eVy1xkGs7cDAUigAVGvKXUVeHE+xI5Hfmf64qONeBI+kxDi7ZNbh3UYEolA
	sz9WmUnAHT7Di8vbtCXL/dr7iJjtmm4dUUOW65ZqdymziVFl2g9wv3LtG88MF0eGsw24GODPnj7Dz
	F+90lFLCjRHdN52Rluy7yu5A6EW4P5mWF/FPB5kB97Byf6S3GocQlfnu3L7fcxUqZ2W91xTl3qWi9
	XCc3P8Rs9JW6QeDvl6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q21Av-00FJZy-1k;
	Thu, 25 May 2023 02:58:01 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q21An-00FJVR-1v
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 02:57:55 +0000
X-QQ-mid: bizesmtp63t1684983425tx9azvf6
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 10:57:03 +0800 (CST)
X-QQ-SSF: 01200000000000303000000A0000000
X-QQ-FEAT: jXjag1m6xl7WyIELRssET5EuttbKJzokSNielpVbJR2OiTpJeAJqTrFwO96YQ
	tokwilre7FqbTP0hnGE/ppzEy4bGUXKgRio2t+VIoMM2VWauzbUnGHa+Sipa1RrbyDuNOKx
	tqcxBrmnAFQ73StoonTBlSrKXKjl2PLQBKsga30zCSInjh0TED/zIWvq4tMsNQNAnCpkJ2b
	+LvFTNStGcpt/ubUt0VFOLUKlIk15QK9A6SIzGrTD+Bb5fa5C0POkIA6UXLqL4PbE4H4BGq
	tOb3wYkj0Rdial2N4ncNiCkaWFc0j00Ympqcu8Vo4UNBJiJsNZUxhCfOk3pEyLldJqjsgn2
	wZqYEqOCnSmEcXUyeWpuM2qnQwOAUhUxLO5sjkUPYvR0+BKt1ZNLxG/7LKvYg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6696857243706674612
From: Song Shuai <songshuaishuai@tinylab.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	songshuaishuai@tinylab.org,
	steven.price@arm.com,
	vincenzo.frascino@arm.com,
	pcc@google.com,
	wangxiang@cdjrlc.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	jeeheng.sia@starfivetech.com,
	leyfoon.tan@starfivetech.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/4] ARM: hibernate: remove WARN_ON in save_processor_state
Date: Thu, 25 May 2023 10:55:52 +0800
Message-Id: <20230525025555.24104-2-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230525025555.24104-1-songshuaishuai@tinylab.org>
References: <20230525025555.24104-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_195753_932172_4B528C47 
X-CRM114-Status: UNSURE (   7.38  )
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

During hibernation or restoration, freeze_secondary_cpus
checks num_online_cpus via BUG_ON, and the subsequent
save_processor_state also does the checking with WARN_ON.

So remove the unnecessary checking in save_processor_state.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/arm/kernel/hibernate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
index 2373020af965..84abccf3221a 100644
--- a/arch/arm/kernel/hibernate.c
+++ b/arch/arm/kernel/hibernate.c
@@ -33,7 +33,6 @@ int pfn_is_nosave(unsigned long pfn)
 
 void notrace save_processor_state(void)
 {
-	WARN_ON(num_online_cpus() != 1);
 	local_fiq_disable();
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
