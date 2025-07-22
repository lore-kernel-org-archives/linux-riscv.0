Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23413C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZCmUXshFL3n7yDXNZC3VN1QuX6K1Yzdkcd9PER0WhA=; b=STKD0GuDjC8gsV
	1Z0rKZc7eQwV8Lv5AnDaxCXjVxjh2N3Kq8d8sU+EJ3V27PcJUBSvsYsxfR0m9vLGkVv3tDdnexdXP
	a9FzXupka5q+7iqYq909u371oEizCEZC22bK0sf1c/QKz6/RSOolXxRfrukSgHYPC9091gDEZG4r4
	MW7GWo6XWOMz2POHwoAth0/ikSjY8NqLhmblagudKlJ50r0yKSACH3ovAfYC1UHVJdGHu9bRm+W9+
	a8CFAbdpyQrWK3SWdn3f8P2vtoODR5i4mE1t/ikZ3JanfSbsTWAuLuwy3l7kNbv7ntEvoOHMDwWZ9
	N7keau6w7DEQHYYSM7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9OP-000000021a3-1yaU;
	Tue, 22 Jul 2025 09:34:37 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue95p-00000001yE5-0uMf
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 09:15:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74931666cbcso4258197b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1753175724; x=1753780524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSJEZmkPgfnKjnqaAxlDxuBrFCv+rDIHtV6Q4YGYv1Q=;
        b=TYHylipVbv2rZgn1U5EFkzKJzU2UFt4fte5LZWahA5RzklOjb33lg6OzomNMoH92gH
         BmLSeTs8B6gWnAbu3yA+cP7kp8ILnXTdspuPR240oT/vn00l2WpPk8hhpYwA0afLDR78
         iieXnja37ppeCcOSWoKb3iprZn/tVFMeXR0HsFCO7KKPRtjRlrGxE+huysmpBocqZbdo
         QKpM+c2+mEPPnB3OA4yWW3ebeSbDxcR3MBVaztXjdrJH1OWHHdyLHlq7LqYzp3to7pVc
         00Qgf3Z+jAJIJsX4vLKWhTtRtBxqW4htOimUQFudxF59zz26MExEtjD+wxGGF0ZUxNoF
         HPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753175724; x=1753780524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSJEZmkPgfnKjnqaAxlDxuBrFCv+rDIHtV6Q4YGYv1Q=;
        b=FA9IHPbToFXqnVs3LZDuChC9yB1sFXqXLpNKvXXhGkJrt/h8wVLx/9syjaRKZWmuav
         tTlsFVAHHXIk3Y2ZxvAe6SvKTA1UdQpwMjg4BICyWNe9Qtpahclcrg7wYiXDxG5t+8+e
         PBDtqYL8LyEPMC5UvmU1lB5uRMx+N/9/zAQnJYp7P/FbkJEx+GL/YHXcFfVoHWtx+kvm
         nILjhaQ0QOWuPgzjGVJarYNvvOEIyJcjqFmCmA70/PRfqprByUth+y0H9FUgPqISbGOa
         1ifXswBAIB6xSo9AdW8Z/iLY+NriY3Uzq5mIU/QmEKJWf29kVb7Hksxl2MArBL2+vV3l
         MOnA==
X-Forwarded-Encrypted: i=1; AJvYcCWrko9qLu1Z4HXhiWlhlICovHG1mbsyY+rYLFOSs2PhglQisHKc28Hpd5NjSt63o1fivhPzvSU2JNSjog==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/dGz3Zd0ZrNlJfSNzDn17MjQPleS8d8JzjefJ/cmbnmQioYqZ
	mv1aThI0h8ecGNLDJnp6Vf61PXFj1tUBam/ipZrumlAGtIpCrcUrRvytREFxlVvmx9U=
X-Gm-Gg: ASbGncuLuGb6hWsv0lMX+uZXvueZIG9yA0MTFrYmWVFNC0Z8kIpWEoJXMaPfPJc9LHI
	ldu+03taxhG265mUhEuiC1ZSOXWk+4igmyzsVIwy49H5q/dBXuVeMaInQM/2gjX0ORM4oV+xBCn
	zvmcX5q8jiJircjvIxlaJqFqo11p+W8QPISGwNQLntyzpY6i0yD5bunecMDwnOQxqBpVfxjE/Tm
	4QmKz4/BSDRDt1Drk5J+qVfBYXQczPlnxPeB7INYyc35Y9pw33R2cnsmywxVyn7ymTbmLhgEruV
	iwYHIulGlLXJ4vU9JSDuLkr/mkatoXzc1h2Qgj20iOZgr2/jP7SsKLGJe3TNaiX2ff3I54a/HfL
	2zJSkAA7LSxkhHLR0L5t5TEvOqOI6Y0+uUnklG2GEDYr/9iOOgzgs/t1e
X-Google-Smtp-Source: AGHT+IE8nn7g0sfttFkjFPlktCQQfoskYiWx8F7P7RBaYgJMDYxpTs0UIiig0ZzTsouqdeR9MRSjXw==
X-Received: by 2002:a05:6a00:bd93:b0:751:6ff5:df35 with SMTP id d2e1a72fcca58-758492e7360mr31464955b3a.8.1753175724338;
        Tue, 22 Jul 2025 02:15:24 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2008sm6676900b3a.30.2025.07.22.02.15.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Jul 2025 02:15:24 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	anshuman.khandual@arm.com,
	kas@kernel.org,
	ryan.roberts@arm.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	namcao@linutronix.de,
	willy@infradead.org,
	abrestic@rivosinc.com,
	yongxuan.wang@sifive.com,
	apopple@nvidia.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: [PATCH 1/1] riscv: introduce ioremap_wc()
Date: Tue, 22 Jul 2025 17:15:04 +0800
Message-Id: <20250722091504.45974-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250722091504.45974-1-cuiyunhui@bytedance.com>
References: <20250722091504.45974-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021525_255344_A99440A1 
X-CRM114-Status: UNSURE (   8.02  )
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

Compared with IO attributes, NC attributes can improve performance,
specifically in these aspects: Relaxed Order, Gathering, Supports Read
Speculation, Supports Unaligned Access.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
 arch/riscv/include/asm/io.h      | 4 ++++
 arch/riscv/include/asm/pgtable.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index a0e51840b9db4..09bb5f57a9d34 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -28,6 +28,10 @@
 #ifdef CONFIG_MMU
 #define IO_SPACE_LIMIT		(PCI_IO_SIZE - 1)
 #define PCI_IOBASE		((void __iomem *)PCI_IO_START)
+
+#define ioremap_wc(addr, size)	\
+	ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL_NC))
+
 #endif /* CONFIG_MMU */
 
 /*
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 91697fbf1f901..3d17399a06c77 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -203,6 +203,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 
 #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
 
+#define _PAGE_KERNEL_NC ((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_NOCACHE)
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
