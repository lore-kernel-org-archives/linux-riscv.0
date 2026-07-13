Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781A5C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkSjWGsIT3KhSRNn9ClqptgChi+X4KbV/pHnLL48Txo=; b=LjUi7w7y0wMlpC
	QE11ZnzBN6xiGFglZTRASi3byYEkk27xl5s/zs1v96jl2xoAaikSCJE3O7WH6+gv7MpKu8RGo7zya
	PMWWBdTdHfyyrO1dU43UgSHHro0aHbZCRpmUMArfPxZ5ln5/b4SbupMxgqVyWa0bylLpbMiAzSJib
	BguQtyrc+4g5EBzCbG9wJXEQrCAnta52cEnRLKIjSDg1n4Td9UtUxo64gtJXIdWgyHshC6mpIp3D1
	AyRvwmWEuaJr3f7gLCIJwDgI96ipBL38R9TUkbK9kTh2sE0cx5tHXRJxOkbPha+/RdGbmX1W4+UUh
	ZC+8yodKA6jEepKT1duQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFmk-00000009CEy-3Eqx;
	Mon, 13 Jul 2026 12:29:22 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFmh-00000009CE8-1f8l
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 12:29:21 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-81e9f7491ffso16828797b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783945758; x=1784550558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJPh3725ldS/I69LwFe7D4tI91unCJJw6+m/zaHdJkA=;
        b=gQM0h8tYhHFw5BvVdnrasJAXo+hLtOeTmR6VDiDksXGItu+vAqS0ytefPyMQPw78C5
         BSvlY5y8mjuQK42lQrC2lLRHQIdXHn/QUFh2IprS4FsmqkAF2Hf5Z7AA8psF+x1Q4057
         M6+IHBm+P33DKVyNaLruMDfmxRNIBXR7Yt+aXq29APSOcyGXpeD+u/0McUblpu3jpLde
         bWRby03eGVWKeHhyuyIa0qO10vgRBnhgJOvLaoqJFTgpBbE4usqBBG1Hiz1jINIginSt
         9i+fvudRWAZkTPiLjEK2NjV7vCUOuEPib4Ah0AkHjyPOTtNXI03iEAultndfh0oG38pK
         LUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945758; x=1784550558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJPh3725ldS/I69LwFe7D4tI91unCJJw6+m/zaHdJkA=;
        b=KDUNXCjeGH7s33GN2rzLIY6oDxQflJlZufHw9ANVIMVX9sChnTDqh/R9EH5WfIso6T
         35tQJGmyGKT9yOc030vJzoxFCaxQ3QI2m/rZGzTeN5ph179x5X4I8GSX8IedW//uspsb
         Uj3psMsgNESn5w73Jr5v1LLkHp617wAnnez35ff6U0SmbyTBKgM7UfYXdjdJ+3VtLBn8
         9cHIyTAPjykJBOUQ7EEAmjjMUSeZ6LM7FVm3JnWOle3ToMJA+lZSuw+7MEn5ADqky4m6
         dWsfQ8Pqh3xYhYy8vTqLW2sXVcqMoJAJDeFHgh2DaYS+75gbHxaZ9MAlvM4CaCm6P6Ko
         gsnA==
X-Forwarded-Encrypted: i=1; AHgh+RpFrvCj6GW2zWm7WtyLHmJnA+hWnARX7uU7ietT43ojLSQQto2jn5oN8jRB02tP5IxbLTmVcBfHCz1nJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn22zAOfv7sjfScp+65lhYYPbgdpcSKuGZ8zlF136ys5KQJJ2d
	6ORiL0qvvSy9Pwa8V/qemYtxwj97vX1Np1kCMPCpz3lLbUEA6bEkcG5FRkzloisHy0s=
X-Gm-Gg: AfdE7cmTkABcBggGs1loRqHWV88llRKp+UWPuWHC2JRScf10IK5xJvRQ6KBV+ndHBUg
	rK9d+t08ued8Ds0SSuHKHgxFnhmv6Pp4rke7pBG8vflewVPljEqM7KPy1jxyfWpO8zL2KhtmfL9
	+V9+Lr3S1XCBs8rAKEhF3aYC79ZpnG9HuyJepY3/i5CInl8WlUuwMtSYKFc+BanS8qg7Yi1434o
	Kq47vaQC0P+KHzaNWnJsYaapU0iesd7QnkqK/UiVVOsnJt8aI4tWum+Vaf1STpftOi/YJnroxHK
	VpebblQ51vEE4PJD9OwioEQ8NVX82A394sG7+RmhhAn2ftY35SwYdkU8G0c2ITfUNn+S4etzIHM
	fxMfoJeF8zDSpN0sIQDWNhNiw/LJqom97SrcSSLWPAk7Mq6PrZDu6bdCK1ySIuoNBzT0cuGKABt
	4f/R0w744Qs3oVAxzg8ReUag/zhBltHFaBwmxZ1+4wJEPlzRkwSdz+CTD0Iju08BMDNiWBJoim
X-Received: by 2002:a05:690c:6304:b0:7ec:592a:a75c with SMTP id 00721157ae682-81e90105711mr65533197b3.39.1783945757952;
        Mon, 13 Jul 2026 05:29:17 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1feb43sm112700987b3.40.2026.07.13.05.29.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jul 2026 05:29:17 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Zong Li <zong.li@sifive.com>,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] iommu/riscv: Use 32-bit MMIO accesses for 64-bit registers
Date: Mon, 13 Jul 2026 20:29:03 +0800
Message-ID: <20260713122903.9458-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_052919_454014_DF8D7E76 
X-CRM114-Status: GOOD (  13.54  )
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

The RISC-V IOMMU specification [1] permits 64-bit registers to be accessed
using two 32-bit transactions, high half first, and leaves the single-copy
atomicity of 8-byte IOMMU register accesses unspecified.

Use the generic hi_lo_readq_relaxed() and hi_lo_writeq_relaxed() helpers
for ordinary 64-bit IOMMU registers. For DDTP, poll BUSY in the low half,
then read the high half and compose the register value from the polled low
half. HPM counter reads require a rollover-aware sequence and remain
outside these accessors.

This follows the 32-bit access direction proposed by Guo Ren [2] and uses
the generic non-atomic MMIO helpers suggested by David Laight.

[1] https://docs.riscv.org/reference/iommu/
[2] https://lore.kernel.org/r/20250903144217.837448-1-guoren@kernel.org

Suggested-by: Guo Ren <guoren@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
Changes in v3:
- Use the DDTP access sequence from [1]: retain the low half returned by
  BUSY polling, read only the high half, and compose the DDTP value from
  those two 32-bit reads.

Changes in v2:
- Rework the patch based on Guo Ren's earlier proposal [1].
- Drop the build-time option and use 32-bit accesses unconditionally.
- Drop the global lock and use the generic high-low MMIO helpers, as
  suggested by David Laight.
- Poll DDTP.BUSY through its low half.

Link to v1: [2]
Specification discussion: [3]

[1]: https://lore.kernel.org/r/20250903144217.837448-1-guoren@kernel.org
[2]: https://lore.kernel.org/r/20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com
[3]: https://github.com/riscv-non-isa/riscv-iommu/issues/765

 drivers/iommu/riscv/iommu.c | 9 ++++++---
 drivers/iommu/riscv/iommu.h | 9 +++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab1..d647b71ebec 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -670,9 +670,12 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu)
 
 #define riscv_iommu_read_ddtp(iommu) ({ \
 	u64 ddtp; \
-	riscv_iommu_readq_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp, \
-				  !(ddtp & RISCV_IOMMU_DDTP_BUSY), 10, \
+	u32 ddtp_lo, ddtp_hi; \
+	riscv_iommu_readl_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp_lo, \
+				  !(ddtp_lo & RISCV_IOMMU_DDTP_BUSY), 10, \
 				  RISCV_IOMMU_DDTP_TIMEOUT); \
+	ddtp_hi = riscv_iommu_readl((iommu), RISCV_IOMMU_REG_DDTP + 4); \
+	ddtp = ((u64)ddtp_hi << 32) | ddtp_lo; \
 	ddtp; })
 
 static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
@@ -1501,7 +1504,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 	 * regular boot flow and disable translation when we boot into a kexec
 	 * kernel and the previous kernel left them enabled.
 	 */
-	ddtp = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_DDTP);
+	ddtp = riscv_iommu_read_ddtp(iommu);
 	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
 		return -EBUSY;
 
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd549..1b03790fbe1 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -11,6 +11,7 @@
 #ifndef _RISCV_IOMMU_H_
 #define _RISCV_IOMMU_H_
 
+#include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
@@ -70,17 +71,13 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 	readl_relaxed((iommu)->reg + (addr))
 
 #define riscv_iommu_readq(iommu, addr) \
-	readq_relaxed((iommu)->reg + (addr))
+	hi_lo_readq_relaxed((iommu)->reg + (addr))
 
 #define riscv_iommu_writel(iommu, addr, val) \
 	writel_relaxed((val), (iommu)->reg + (addr))
 
 #define riscv_iommu_writeq(iommu, addr, val) \
-	writeq_relaxed((val), (iommu)->reg + (addr))
-
-#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
-	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
-			   delay_us, timeout_us)
+	hi_lo_writeq_relaxed((val), (iommu)->reg + (addr))
 
 #define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
 	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
