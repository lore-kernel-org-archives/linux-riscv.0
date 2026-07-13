Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C136C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 06:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNAs4F4fl18+Fi/32tf0QG+kHjhlmv7d65ySgD3B81Y=; b=LZgSqZQGv0NoPQ
	uqYtnJXWNAR7Kq0EfVYxcMsTO6//p1fR42TZeWJKiwUDmpRMixjx1aI6PTBwUUpKufW3NoIMZH0As
	rA/xGxjiKuDRIfvoOUGEXadnEFb8qpvRZOW8F0NAZ/rUzZMO1CNSuZWXasRxrW6uf++7F29/vamVQ
	dVUCdmqPgb0F315ZyIVrsG3XmfgpvN9q51pgaiWoK8jYQHFHOlyZH3chdWf5JlOe7K1X73b/2gnF6
	IRJJ4npjaOQAZSS88EROP0uv/wypeg1v+YdOmD05CZxb9M0AtePcPIp1NmYPSq1rNLMJvz2zTyrBT
	Ogu/giv1Drf15+uvKQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9r3-00000008CUH-3RgT;
	Mon, 13 Jul 2026 06:09:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9r0-00000008CT9-2eJ8
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 06:09:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-381b831d535so3214904a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 23:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783922958; x=1784527758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRVFbRCCSU313/FdRD3Vin4a5GxhaG0qQy0/ly3lbz0=;
        b=b87E/9BHqiIz0GtJfBLiwSi4jKIgDhI0yVsmF6wK3MVFDWd9v4TQz0YXRgu6jN26yU
         Qq10FyTY18IWS6xNtzhh+qeVEVJPlEVLySoV6c06NCNtI74TP8TezHTAwonI8cOfYARB
         SnOtHe61swoGzICoyNx7Mo9SNFWLkN+RNEw9wHw3ZWgz5cViaOzfCbwkl2jlY1GgN4bt
         sg/QyJTERSkzTTjZK8atPs/ZAkQSyai8Di+mO2mNKzwGWMVAY5gL/0ZK31xABT3o6e4g
         SOa22isaybe3Z/3+/ALhisrjO7uwqLqtwEEbBLnynDS8sFgPRdkNHtzVhpvHOQ/bOy1T
         ZkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922958; x=1784527758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRVFbRCCSU313/FdRD3Vin4a5GxhaG0qQy0/ly3lbz0=;
        b=AREVvJOcYDykmwDeg7dZzgDoj4ysG35tUDZMIf+2n5iDQCtt/dLtKOihqQDutn9N2Q
         5es7Wl0kmuXIYdspw06JV50vo9V7JWqEHO5n3pi9XUHtweVx/H5LxrznsqeDNU8Dz3bl
         yzDC+gcRf7LYDG6RPOAP4vbDSzwEn02LG0iwE/AmCsyqpyuusgzFBpicZtzjpOPpUkGR
         3s7bqLGhm0euCFgGZ4q1fhifPPOO8s0H0xU637T8nCZH/VMKYNX2b/Ox4nF5slQRNXQb
         w9fsHi+6GsWa4I7pUYp+dhKX3pa2WI/RPFr05BnrXvbAg1U07LlTveUAbGj2fib6R8nk
         w8vQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBap/fVFaZc7rqzOaYpvQnCqlTCVim+quHSRAHzUzTaSKkMDfyjDyYfpVYPqP+pZYsYa73gxbj408Unw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxmYbOm3eTjUXIKd9SZpP9puIuo7aHpNPLqBws8nDVm9050Och
	XU8hBDuS5aLqAzIt/jr1vtmc/CtOKUDuHeTu1YoaaNygywpmzGHWBy6KuM+i5454+Ls=
X-Gm-Gg: AfdE7cnHcPtITSgJ3doOJA/nVmdZAyOLoIqfM5y9Cew8tyQ6rInkyM59uLSXJ5aU+ys
	pPTKtahYh/0dY2TX3Kx0Zw4xhmymdSsuCE8VyWtb2xvAmTgNb4iM2rLFcXD35CsUsJpR3Qga9dZ
	l0sJLGqc54A+KWk0iaWGjyF0XLgOymEOL7JmioB8r+DYqm2SgmZHqmcqLsIFnx/4j7oXfdwdtp0
	/3iigUEu5gqTKKLguDoDLrGRqq0S1EWULyQNHaKHrBELEfDi0bjaerltftxd9hHzmTaM33njHqG
	rgClaaow+l6PzVKtpSkvX0sCLEtRZkdUhkTLDTuyW0F/tTd4rZ9AaqEIg/IHCKkwWIQQuLh07UU
	cVSJorKOWyAeoq12kz+bKgMR/GbddxtHaWiWUfnOEiEdUABKJU5axC5Y75myNZXlxmVfq92yDSZ
	N8corirjf7qzsn1JXSv+Elj7/xuVlXXhLF4qGUs9v2P25RLfuHljrB0xC8ltwgOQ==
X-Received: by 2002:a17:90b:5863:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38dc73bcfdfmr7418132a91.1.1783922957998;
        Sun, 12 Jul 2026 23:09:17 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5564f58csm6035548a91.8.2026.07.12.23.09.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jul 2026 23:09:17 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v2] iommu/riscv: Use 32-bit MMIO accesses for 64-bit registers
Date: Mon, 13 Jul 2026 14:09:02 +0800
Message-ID: <20260713060902.15161-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_230922_679661_F0E0E60F 
X-CRM114-Status: GOOD (  13.45  )
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
for ordinary 64-bit IOMMU registers. Poll DDTP.BUSY in the low half before
reading the full register from high to low. HPM counter reads require a
rollover-aware sequence and remain outside these accessors.

This follows the 32-bit access direction proposed by Guo Ren [2] and uses
the generic non-atomic MMIO helpers suggested by David Laight.

[1] https://docs.riscv.org/reference/iommu/
[2] https://lore.kernel.org/r/20250903144217.837448-1-guoren@kernel.org

Suggested-by: Guo Ren <guoren@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
Changes in v2:
- Rework the patch based on Guo Ren's earlier proposal [1].
- Drop the build-time option and use 32-bit accesses unconditionally.
- Drop the global lock and use the generic high-low MMIO helpers, as
  suggested by David Laight.
- Poll DDTP.BUSY through its low half before reading the full register.

Link to v1: [2]
Specification discussion: [3]

[1]: https://lore.kernel.org/r/20250903144217.837448-1-guoren@kernel.org
[2]: https://lore.kernel.org/r/20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com
[3]: https://github.com/riscv-non-isa/riscv-iommu/issues/765

 drivers/iommu/riscv/iommu.c | 18 +++++++++++-------
 drivers/iommu/riscv/iommu.h |  9 +++------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab1..14b572058ed 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -668,12 +668,16 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu)
 	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_PQCSR, 0);
 }
 
-#define riscv_iommu_read_ddtp(iommu) ({ \
-	u64 ddtp; \
-	riscv_iommu_readq_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp, \
-				  !(ddtp & RISCV_IOMMU_DDTP_BUSY), 10, \
-				  RISCV_IOMMU_DDTP_TIMEOUT); \
-	ddtp; })
+static u64 riscv_iommu_read_ddtp(struct riscv_iommu_device *iommu)
+{
+	u32 ddtp_lo;
+
+	riscv_iommu_readl_timeout(iommu, RISCV_IOMMU_REG_DDTP, ddtp_lo,
+				  !(ddtp_lo & RISCV_IOMMU_DDTP_BUSY), 10,
+				  RISCV_IOMMU_DDTP_TIMEOUT);
+
+	return riscv_iommu_readq(iommu, RISCV_IOMMU_REG_DDTP);
+}
 
 static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
 {
@@ -1501,7 +1505,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
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
