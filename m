Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C011EC3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 07:59:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926F121726
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 07:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BfEZQNNF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="etHhQFVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926F121726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCyiSX7HcrwJYLQPtQongj7/NxACEDtQqo+U6RsSlZs=; b=BfEZQNNFx1IE2h
	n6MVo272X7qlrlJmmwiZvyZThOMJ5LK7zzhkz7CSqj3o11NujT5dyjNmBFlH+v1KzD5CxtOvvRMsa
	WTygNuSmrsQAqh5W9JZSjO4HnBGu1kqZXemoBQkjgU0jKl/c6bi1Qzn8TCBgqiBUqpFRAJLriWpSD
	XzDvokIs2koV1T2twT8YFnd55E+DvftxV9BWpT3L2gxAOg7oDD3SNEgdo1O8mPzb1c4NCymqZDgag
	5ftpQRzgA/fErQ0c0Bs+HZH0668qKF1P6KuGAZDAx42Orx8RSEK6t0gdkv1qQSsZoja1dRftyAGXn
	AfyBC5J79YPDq0gTpLKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0i03-0000Ur-8v; Thu, 22 Aug 2019 07:59:15 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0hzs-0000Kp-38
 for linux-riscv@lists.infradead.org; Thu, 22 Aug 2019 07:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566460787; x=1597996787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zMgrwQo3ioYoX5CQO1W5apOPVVHZ8O/Xw2bhvtHvfOw=;
 b=etHhQFVUvwfhYPSOCLWtZZfFwr+1UlK1vq40YzOPMdJvhMBg08OQtsNv
 tKfhPZIjoKGdKi4NGfc4Ias0HZQdOR4RdOE0KeZdog930U3+5Fcbpwn/q
 0NyhdraE+F7cb8y+2iySBx08BWFLKqVJ/lcUg/4VLHQkiHrtQWNUux9dD
 8sskCasek7SMdieODRCHIBpjjkVwcenCV7EUNTsTGW+SbQRH+6F7UKqel
 3eMO/5FJYrPxbNTxWY5QqSyeEmCEyZgtkrbb+OZ8rAEoBYqxXidbeVBx/
 +lwJpu++qr1M/xrOyaWgZFbiUQiyEK3IerrcIMkdi8Ehwfb54vDVvZiZP Q==;
IronPort-SDR: J/JBWkEaw70kIbMeUuTB0arACo6oSxN8LSP4tOgKTY1CVb15DirSBtDH95R26yN9wJfmd+eJWP
 TWKBMmvX6fev+78Dplw2aOyR1+BjRhHgIw9iZrtVrd+syThVoZQQ/A51j6YXk9BIVZYEZW94Hi
 guEGB6UH/nrBB+q11VnJFRT6RCM6Z/uzXdRQlJR2fIHgc/ch/zlZDBpruRhl+MpR7vY+p03wmZ
 xUgITtdSGXT0t3RuKJ+CzAaM3328Yo6GUHvkaXysBZXBVhJGLWylbXus8d+Ubnv9Kmawzr2Psz
 Z7I=
X-IronPort-AV: E=Sophos;i="5.64,415,1559491200"; d="scan'208";a="216831489"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2019 15:59:39 +0800
IronPort-SDR: Ua9SbI/aYHBDxDyMfgFdd/+5ozKDd6Xf1p/KDFx+LZJ2xOZzJ9ixY2eqVR4ZYpxf4M+ftJUUey
 Fn08d8qKLQJx3hT0RMvauJYKy574vqWv9M15lF8YVQ62Ahl0swnD4d+iyanQVUXgQX2rLO+pG+
 4UX1SvlXjaVkO4jjctQJ4kkNHu04uRt7Xt5EWFG4ab+0STcHkieD+3638N1DvWWA/vOHLYe3Rw
 JzVxVHP4MmLQMlaqXNRrEoM19iVnCq4SwgXpZB/X0D9yxJNAA6Ixfd8KZfiwKcQWWGKrXJUk10
 ATjlD5op+vXzzFd1/VonKBAm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 00:56:18 -0700
IronPort-SDR: 7VJp5AX1m3dQMbgrglO08YJQbJAypaQXuQTfTNHQ3OB2+NiU57sfGAMfxX/aL2VOobx6ltblnx
 LktuVXVYN25WuohHaGZgbFHpzHBTIBkAER1BV5wVs7vtyLXxeGXzwobK/aDtd+1AXCl4bBByj8
 s/niCGcIiy4ZSwPKQLi7THnQrriAEe/6k1/YEV7A4c9LCcHQBB74I1s8jZcxTTZD4udB2oVhw1
 9Tfo8Ai5rcFo8yWnWPhXzGi8hMGGxcTyc4/qj4d+/v6bs3XmBI/YlGP/JtneDHWSNlgx/R9R3M
 Coc=
WDCIronportException: Internal
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 22 Aug 2019 00:58:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] RISC-V: Issue a tlb page flush if possible
Date: Thu, 22 Aug 2019 00:51:51 -0700
Message-Id: <20190822075151.24838-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822075151.24838-1-atish.patra@wdc.com>
References: <20190822075151.24838-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_005904_166351_0469C150 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

If tlbflush request is for page only, there is no need to do a
complete local tlb shootdown.

Just do a local tlb flush for the given address.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/tlbflush.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8172fbf46123..b1c04751bcf1 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -27,7 +27,10 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
 
 	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
 		/* local cpu is the only cpu present in cpumask */
-		local_flush_tlb_all();
+		if (size <= PAGE_SIZE)
+			local_flush_tlb_page(start);
+		else
+			local_flush_tlb_all();
 	} else {
 		riscv_cpuid_to_hartid_mask(cmask, &hmask);
 		sbi_remote_sfence_vma(cpumask_bits(&hmask), start, size);
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
