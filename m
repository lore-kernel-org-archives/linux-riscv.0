Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF03EE7716C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6e4MgXq860DImd3JMeoSHkRp/k3eOuQzm8bsN1dUKM=; b=X5SMrBZS4FKq5h
	nv3S2VB19SHae0LbUsPfzNnJSDKDBWeZOcwSDf/ZWSC+I76Z1/LfRYa9Aw38TJaqZm2cEFSbINCkb
	IhDhr18vHTPGZvsdcesXzLdpDJbUhaAwfyOQU6HKBE+xKYzODLSeJ1xLgy+xu1laxV5Kx+v1AgTsI
	Pp9OJVOZgYdv/mvw4m08k1p8w+3Z5QQFUe2VYOBhTG7EXgXh9qZbps76TjzHdsYiw0pzwvNpzMlLc
	rgqvbZjnKS0ptw7J71pC4Uxt/w2te+jZaSAb3rgWS1JsWu8ZDHqJij//9EtBv7htaKdqfDDBTwN/1
	+fa564NrBuXn8kRDp9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ly-0000000Faau-3dWj;
	Thu, 05 Dec 2024 10:45:02 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Fs-0000000FYM9-3oDe
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso1485877a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395124; x=1733999924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAxAI+FpEZPqeOtAYXtXd/fFddvtrgZvKhcRJUP9sTk=;
        b=Q7CU+EjjulTR4PWLbglsOVEvq1/05ZnqwzTHqvvP8vzBIndc8NFGUtkNtIS2oDhNOS
         F/uqhzCFmwcxvXERm+ZpJD+bXHiCVGmiDrpovxemAIAksrefXAhYHiL/PREGHek14+zv
         uAWVpC9PfVRyyH0heYB96mM76BDCzA8GhTeEMfPQrLfoeUHBWScG1Gisce+X8hyvNIRQ
         5p5QPlrOe/TpcIZeKtidrWKsaRAmYgNA+5U9h90b/shn1wA3CLW3ctkkzoCmToDjZ8rn
         gHN2JBPQTvlBtIB/WyBFR4JmKaUDrhqo756wFOESi8lAk4BQZ3H/vlNarTcHEZOpvA4U
         nlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395124; x=1733999924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAxAI+FpEZPqeOtAYXtXd/fFddvtrgZvKhcRJUP9sTk=;
        b=p1OuUINbp6Urqf5SBPvfWOUb4WkCp2XPunT+rVu7yDHHcmMT+lCdCqEeItLNEmmyl9
         Wmz3nyEUlwAs0LB6d0DRyU1uNgMG4eW9vJMipFfBIIWVf7phu8G5BsC71dIS5ekS2k/N
         5pOTKBHATdGmXXo4GgQkHtrvMtnwvXOvYCPdcuhO3t5wveYG9F6PXKbTaPRW1ymG8w7o
         KLogoIxt3FlLJWAGgBVZ8Bd7aa25UVMlzbONzgUL/cWKrCbsgDfgF3uHYLrxpti/Jk3O
         pvhFFRVfz1pu2vs4lGQg9Rq45z4rD+igOxDGkF6hmIohzF6Q5GQFPypZoXW1Zu7nt492
         qrZw==
X-Forwarded-Encrypted: i=1; AJvYcCUkhYA/rrn+nbYqZkniw89xcKGIiN8GgUVuUR0jHtHdd11Hn1Fdt/1o951DSP3JNsGzjQ+p15Ks+OWh0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAbCCGjHfHZHQHO22xGd9XkWOr3aPkz4b63lyTXI1ovoMdsEjJ
	NivQYEAtSXT8y7qh6TqsHrOTiC922LRbmbor/WRIGTPCWqq9WbVhKaKEWvFiMzo=
X-Gm-Gg: ASbGnctx0Edea7TlVZNqog12zdymkkuChmuCjyeLA6/rV7jtOPdkq2hig2l3he3fl0L
	Eo+vAiE+51Jl7c9c6fmqpo4x6Ud3n4gOAg4eNkw9X1JnPvANSAe2rVFwTNlzQPwMj94fwq13tOt
	Xtpxej8xeA/la7/R+H19zA1FcUDmrZ48+GfNOHiO1Dl1bqSA8y5unpEgbw4P36oQK27J5WQcRbX
	b22rdA2fHRlF47rxEYUdCyX10lNCangZBLhd5AXyz48E6+IAaGFbo6v6M/m5QErZNVGF16e/qB0
	o+wqDvl39I8tVNCraQWDFCDSBpGvgKDN
X-Google-Smtp-Source: AGHT+IE8309GuNeyZxITDQ1e0WzOIa0uJDO0sUbGSJz89pLUWjkP1vS9Smp96TCW7bxn3tkgM30nOA==
X-Received: by 2002:a05:6a20:a128:b0:1e0:ea70:7494 with SMTP id adf61e73a8af0-1e17d38c18dmr4437406637.9.1733395123986;
        Thu, 05 Dec 2024 02:38:43 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:43 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 16/21] riscv: mm: Adjust FIX_FDT_SIZE for variable PMD_SIZE
Date: Thu,  5 Dec 2024 18:37:24 +0800
Message-Id: <20241205103729.14798-17-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023844_946558_0A67DA6B 
X-CRM114-Status: UNSURE (   8.07  )
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

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 07d557bc8b39..5b2ca92ad833 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -108,10 +108,10 @@
 #define PCI_IO_END       VMEMMAP_START
 #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
 
-#define FIXADDR_TOP      PCI_IO_START
+#define FIXADDR_TOP	 (PCI_IO_START & PMD_MASK)
 #ifdef CONFIG_64BIT
 #define MAX_FDT_SIZE	 PMD_SIZE
-#define FIX_FDT_SIZE	 (MAX_FDT_SIZE + SZ_2M)
+#define FIX_FDT_SIZE	 (MAX_FDT_SIZE + PMD_SIZE)
 #define FIXADDR_SIZE     (PMD_SIZE + FIX_FDT_SIZE)
 #else
 #define MAX_FDT_SIZE	 PGDIR_SIZE
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
