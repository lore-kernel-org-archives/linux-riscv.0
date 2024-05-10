Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72007C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd4uXRma3N23EqfefBY6fWz7rV9j64J8Bg2MIcViV7E=; b=ESXahE/w4hPiDo
	WFIES8UhUqT/ZT3IoiOHcGnXrzPPHO4YBSJ+SX/v02sCMuFxjYNQ+goH+xiMXs5vyPBlC6+vPtw5G
	yzfdn+aiWGo+VkGHcqe707wuGInd81brUCe9II0sDX0byzRVA5spgJODWd+xelMlQQ2/9+MVBKSyK
	PA4a4mbL/GufFsVQJ5TZsOzE/eTZDg1tbXkplhxOW3p6cmg+9322DA8WUTSKfMeJu3tF5D0c1k1oV
	cltD5iIzDBNok+zanYOWA7U32uzK2FaxYwWuglN617TrLcmIpukS1hS0czdVIL+FXzgDCL4EKtnTF
	Hk1aPcrrvAZQodhSRVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Kk7-00000004N9w-17sW;
	Fri, 10 May 2024 07:32:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Jkc-00000004DHV-2lyX
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:25 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uUj2+QY4yHVaTP+Z3xu9XzUVGT256iYtfuxPIy3zZGw=;
	b=hWdBlhnhnkLUsdOO7KNRM7oQJc4W7CYCCGcne8gyHRuKcWxd9y4/csOkBDMaRw6Y8yiwd/
	8gKxKXx+oJOBBClXYKFvctPy6tZz2SKVlzl56CtBVSw9WgXua5KGB086OcqtgUdxzaMuPJ
	aOh5HB8UZLD+nFMA5NSLYLyx2zcMphsIviWjbGmDLnsaX5fRdai1wzuPXcYe/WGY7K9oU7
	GtuYCvvHGBhfdYqPO1iPhFzZ0PguIr5TB/oKsWAZyoYv1hzZUuGXq1rk5/zSLIpCzqlIff
	CQQfGN7YOfkeKqp23epeYj86vA4u+eVnymcHwqoFa7AvrW4mX+UERg91zjZhiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uUj2+QY4yHVaTP+Z3xu9XzUVGT256iYtfuxPIy3zZGw=;
	b=qixzu2G5QM3S57DoFmxPWMeaaq9ODLwpMOKRAOJoVs9C1XOAR6STtUT2avMcuyMuNVLExf
	xaWP8KRJ3pp52ZDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 5/7] riscv: drop the use of XIP_OFFSET in kernel_mapping_va_to_pa()
Date: Fri, 10 May 2024 08:28:43 +0200
Message-Id: <5439a181cdd7ba185d55457200ddda2d2efa5eb1.1715286093.git.namcao@linutronix.de>
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232912_138727_33FF9B55 
X-CRM114-Status: GOOD (  11.07  )
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

XIP_OFFSET is the hard-coded offset of writable data section within the
kernel.

By hard-coding this value, the read-only section of the kernel (which is
placed before the writable data section) is restricted in size.

As a preparation to remove this hard-coded macro XIP_OFFSET entirely,
remove the use of XIP_OFFSET in kernel_mapping_va_to_pa(). The macro
XIP_OFFSET is used in this case to check if the virtual address is mapped
to Flash or to RAM. The same check can be done with kernel_map.xiprom_sz.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 14d0de928f9b..bcd77df15835 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -159,7 +159,7 @@ phys_addr_t linear_mapping_va_to_pa(unsigned long x);
 #ifdef CONFIG_XIP_KERNEL
 #define kernel_mapping_va_to_pa(y) ({						\
 	unsigned long _y = (unsigned long)(y);					\
-	(_y < kernel_map.virt_addr + XIP_OFFSET) ?				\
+	(_y < kernel_map.virt_addr + kernel_map.xiprom_sz) ?			\
 		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
 		(_y - kernel_map.va_kernel_data_pa_offset);			\
 	})
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
