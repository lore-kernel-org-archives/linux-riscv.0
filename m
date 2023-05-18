Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596E4C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlMugP7cWWD6jmIlry/GNa9IHYr6Yy/myz5ZnV+Q0QU=; b=cCwDh1t33lDlrL
	75jK5gppEhp47EbMtqALpcUbM25WVqHDulTIujhIKBDPrNcL5uMWgDESUxjGU3hLkktXCm5RuQ+zt
	IvcsQ1nfPMO94YBTfdN+lBDDLOdEM1ojxxxEecW2cU/+jBm5kixNljXSx30KxX2lXv01uDMwkWry0
	4tc0vB5ym3e9y7o+6QYnk42DMJq1eBREsabV2Jd+v6AtBLBabdnnWkPQmPXTsMRHwPUWbyJdsFfsX
	aQKVMPWjrb54+sGTu/sZa4E3ojY4aGOOqaIJVVvNXEUNsCJEMa1bbgFteK9SzRSl/tuJDkAe+XBuk
	Ss3VtWVwEptwON0cSVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdPs-00D27L-1X;
	Thu, 18 May 2023 13:11:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdPp-00D263-0G
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:11:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CC1B64F4C;
	Thu, 18 May 2023 13:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B023C433D2;
	Thu, 18 May 2023 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415492;
	bh=kwYbV+xRqnM3gD5wja5IP2IYhT3BPYOFw/sxTmqeyds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tebfDu2ciCGlWfmOzk3QjqBAf9k6FxRFj7jmur4lv4YYgmCqMwYndQMkm/TX5ALdr
	 ahSuRZujS7dWo/DAxOKxBUAyoU2L7N5xr8A0BvnwSqYyibaEpV8BhHb94puApoRjfN
	 0wJpP+cKegCUiSc3U4UPwgoIzrXWQze32a23f7IDPdtkunSTAJgoYFkRL1ycW0/Isq
	 3t+c9hz2PtbDnszFGKOPxXjZgXL1mfQWMblibSnBovz/83Borj9U0Mf+6/2KifouyE
	 oz7PCD3ulfIeKgtZ+BrOCR8DT4EGQCxUw0Wvzb6d8X1HWDulB2UMy5eHOeJnNkulsN
	 fb9+hL6VaPVCA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 04/22] clocksource: riscv: s64ilp32: Use __riscv_xlen instead of CONFIG_32BIT
Date: Thu, 18 May 2023 09:09:55 -0400
Message-Id: <20230518131013.3366406-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061133_162129_8FC27B5C 
X-CRM114-Status: GOOD (  11.21  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When s64ilp32 enabled, CONFIG_32BIT=y but __riscv_xlen=64. So we
must use __riscv_xlen to detect real machine XLEN for CSR access.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 drivers/clocksource/timer-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 5f0f10c7e222..459a634012ce 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -37,7 +37,7 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	csr_set(CSR_IE, IE_TIE);
 	if (static_branch_likely(&riscv_sstc_available)) {
-#if defined(CONFIG_32BIT)
+#if __riscv_xlen == 32
 		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
 #else
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
