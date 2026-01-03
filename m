Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09343FC6171
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MakRMhqGoZmGE7PCRKkG7gnD52AbdqGMbUdEdAm7Xqk=; b=qEfimH067vkTyB
	woLzXUUBSEgvne7kof9HrIcmYnIVLPyVgnRlcMTj5NurLSX1WEiwHa1pfwzNZRqL6buyrQpKEU3jv
	8m2AjLUtOKxmxdzCJ5olv3KsQB1BeyBZEEil8IC+NoPNuwlOoAGcLp8K8MAas920bJbmu0nw0Sayv
	Q/NJ65kUJBsbDe8YUXf1mABvxQBaebny9u8MxRur4au3JOBAE7v6FBVIGW7sZ5y4zSg8KJFmSyZoF
	YGxAyaKF7NQkM5Ujc+l9sMaIVB8Cd8mFXXx+mRNNthC3spoZgM0y/f+y9FKcuGeIyI/jP8zSpMi5f
	5Oc4wxS9655pWXxvRIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIl-000000097E0-43Pw;
	Sat, 03 Jan 2026 08:48:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIk-000000097Cv-0frf
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 08:47:59 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso14367414a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 00:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430077; x=1768034877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqmOWnbBqbw0qz0iwR261elwKrPwnP+8eo7jB++6bUk=;
        b=JajogVTsE7MFPgpZ+tNUZH6Gz3IUjCua4epYqaO7hGxfZ1WRaPHmtZg5JzEtURfAKx
         xv/fnaBga4T1BgyCzJihFo27L3MF5xCNldn+hD7Ja6NZJW0i0s9pZ5TtPNcfiR9kPIhQ
         6HY8fO7b//rVYVBsQPoswyzyPqSkaPcaXA+bIKaqyzT9qYeXgfwIloWgrn3roxQFPMLL
         p0pb3QXltICxPKhNxz5MGry0dE4ZCpG0INhbTeCsd+O52s8aTY0eaa2jYeqFOiOYDFKu
         NEfCwoeq4FqyWS5FGzIjKSMY6OuCj2M8K238U+XXRXwqveOIu0+CQ/Vb3qxRgoHh69J7
         bM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430077; x=1768034877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqmOWnbBqbw0qz0iwR261elwKrPwnP+8eo7jB++6bUk=;
        b=OVz6adv9k/nZxzetvVPvzxvN/yGInaAjzxTQ48i1V9izd4RHGsCDejrAR6PbcbADti
         +/P2o9zs68q+sIAdXd10pQR8HPXIuf2lMUHStqGjYZCUy75k/l/R/xnna3dZU/JKJp8J
         zH9h5svHPSppy4RSfop4B73EC0ZfOBOcORwJcXV6fsowg5XhLVoMQ5nuB/jrnh0Dkdwk
         ZjmZM1rm2JCxawIzmTxbXgEcbXEszoYiZg7HdN0/ZQJGrgdtDuywHsFwefM6Lgfl3Ij1
         cdJRhsuWAKKARcsJsjPNHsdg2JDqSZhjd7voRGnlQZUjfWVcl11aERvN3c+TSMQ9bUj4
         MkRA==
X-Forwarded-Encrypted: i=1; AJvYcCWZalO+e29uFV5Gnst55i2tr/6bKuY1VGqaQZTq8l7P5q8XUbGPb9y/dRnHOaDL61gc1ZAUFmMiVwBsvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5G6AMyBI5vG351os705001DqkoZqLh2qRjoDQPFElNTr3h0HY
	KDlzp9yPYHFDjMIDGhybJG+wie+zDVfjM0HnUEXO1dMxDyAflylRgMyzTAYDm7fq
X-Gm-Gg: AY/fxX4q7vYiXz5QoTkkRudl4oi4R8DiZT1bheAO8V/9RUGOqqMj105ZQoV1qhoxzfx
	mLfqbvTD9Dg/ElAtH+FNVz0JjpMrQpD96+OoBX2RH3Sk+zlSRhYW45mK7a+MrNKjpDudpLU+dGJ
	84Utu0ndfII3/g+gOMCO0ds/T2/tWYxWe7Xsdt/gW4mp0ZgEsqdr7yPvlObj9rqHfUYDsIVvjPn
	snxdLt5QGvpmZRlrYlj8yj0W+IxyHAMjeY/L+E7NQXoQS2i/YH9uYuN3pCmm59Y8SaieteEAlcu
	HgYfn1a5rzfMXZcP7M0FkuJcbIFgMkTEhjJ/Ce86ZiM6v/qDrKCmYdK92RdYq8YyHzUKexMkh3U
	sMHA6TuQWyb3/qXTaSJ1TmBvPvtBNiEUCYzCNUGD+fIshdLcQSHrbECia9iUiOxh6KZ8GmafnJ1
	DGCbZIfAMt+UQsu/dMHtyc/Ttry+QtuGeVgEU=
X-Google-Smtp-Source: AGHT+IH4FDI6MNb+jt4Z9VqoK4GzC1dQlMhMQECNsnvlTczu/ydbQzhhClMmRjiO1aySaBttAjLuTQ==
X-Received: by 2002:a17:90b:548c:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-34e921e90e0mr31635393a91.32.1767430077312;
        Sat, 03 Jan 2026 00:47:57 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:56 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 2/5] arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:40 +0800
Message-ID: <20260103084243.195125-3-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004758_206949_4AB515D8 
X-CRM114-Status: UNSURE (   9.28  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/arm64/kernel/probes/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index 941668800aea..4c55bf832ec3 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -15,7 +15,7 @@
 void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 		void *src, unsigned long len)
 {
-	void *xol_page_kaddr = kmap_atomic(page);
+	void *xol_page_kaddr = kmap_local_page(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
 	/*
@@ -32,7 +32,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	sync_icache_aliases((unsigned long)dst, (unsigned long)dst + len);
 
 done:
-	kunmap_atomic(xol_page_kaddr);
+	kunmap_local(xol_page_kaddr);
 }
 
 unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
