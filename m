Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D75E77173
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMzK+1kg6raLPixBMFACVQTKQH6cG8dccCsAUDTtfpQ=; b=h8Y8p8kaL0f5er
	lrRWVJn2X34FC85xVe4cdSbqrHBLSRnNJIJzvaK66xTi+/Ese8l4BS+2T2SWqzcDqh4YnBj7x3vcz
	9D/DWtn2WYT90l7rmIKPAblf8hBqhPK9xxE8Cz33mdGV/yh/T9EZ829pHvSWkflfcdV1vAPNTIeVe
	V929O698m6gKrHAGDoBliU0QPEnpkcg4rhfH6LaMzCW6QzixEM4hE8qYtBG1R9KhYPOuxuqOQbNRD
	X9nAN5t08rbaHJ6zEwiwp5rBsX9n8Svt9+nH7fsCaDa03ULBxynfFH35uVIi93OpyC7aDh8NwkZaw
	34T0WrVAPJuXmOE9HSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9M0-0000000Fadu-1dS0;
	Thu, 05 Dec 2024 10:45:04 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Fx-0000000FYOL-0vaE
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:50 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3ea411ef5a9so479350b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395128; x=1733999928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x95dczg6H/IuNQfp1VlRQgQwszamKCGOevCsmbhARnA=;
        b=j6+8x9Qmw+ZXtap2yXGivdLBlQMPrtTi/yNA3I2mwPEMs/9Z4RO0CGZa9v8Jmzl4ra
         LtJtbRxj35v72m+TMCnFCCyDhjupi6M7HtY4qRACp39brv1Orvhh/8nw6VGOSG1A6I2j
         VEXdoYlQMS/NCKKPWH2FUxIfZu2vKAwQOD7pzOr2sWnLUofshU7GFsq6YcPpbSqIr5Kp
         lhQZtYXidPSUfC5BNfZ9ThertS3dCMKwXXzW5qeojZist8CoC2QMi8JO0c/FduiD2tuw
         TPWrwq5NEwokIjwkLJsI/O5o60DZ2/amn+h/ObibZZcfhGijuWx2Ta9kMlzdt8karhJn
         2AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395128; x=1733999928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x95dczg6H/IuNQfp1VlRQgQwszamKCGOevCsmbhARnA=;
        b=Pfg9HeimaaDYF/UwgkKHLZ7j0NqffxREc6D2r+A2IQVsZ84+xIpebBzpRZ2eOSFYpo
         7xAwvizPTUIxm9UNASIYWPXsqkJVH97eO3QE21qClQGo/GGRciNHanPEdcXI2AyI/Vui
         rmKW5oB38L/rHh6N9YXDHB1171RrBHtTWQVKYaB1m67m37F3G8c2uO6pBtHpAGhVtE/2
         PgYRjOZAQTXOFwRxSk6xzrb0wa/8ovLXiQ9H7s9enOg1c6wUbSz4UY9D55Hr4x/wXMW4
         FL/muT3QlS2FD3QaZhORnFsQF8Ki/i7bHWraaXhtRJajrlDc8Swv0Z05RMrkD+8zxM9+
         yglw==
X-Forwarded-Encrypted: i=1; AJvYcCWlLEoj3UfSmjWDhBWuFu74Pn+l43L9kCjK5f/xVyzf2IVuEI+aqxkRf9gLt29kVrJh7tle94ZzPsmrzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw20Dhw4HEJchnnUNFjrWiejAwtYrEzBmFcrEzKROIMAjETgx+/
	rWx44pgiaIkVeejl0KaommwUGxEUCKb7CUD+2s5QpMy2FjgpeAvtqMxyTm72H+Y=
X-Gm-Gg: ASbGnctRsXKGhjCF82BC2X+Cmik8k+7eYiQm3TSiyodgqW1aRY1MxmvN5sdNTS3pOZn
	mtpSuYhttACyGz0Ta8Ha66h8BAGwoudUaQciI3gvg3UfPUDEgRbM+KV7G9ZnmNdNms1L6riVeEr
	xDU128N+hJIXkKsf8C7nX1ebdDkjc3/HDnp8Kt8tXf3FMvLLDrrcB3Zc1oRUXLlcwiQlejIsHm3
	xG8Bt6+Y00DtnfFnvM5/LNNMCl+PL6TCDQZvq8UBDmPCSndTJp23VyJSYht9dJBYUNE+THXnNW8
	c21oT6bb2glsX/3CeR8u7JNMFeiZQvVE
X-Google-Smtp-Source: AGHT+IFzuODYxPZb1b0Hsra5aByVGtGgW30pbNXl6TXKG3vo0iIQP7jLbPRNzxf3m6EfJtUU2ofomQ==
X-Received: by 2002:a05:6808:bcd:b0:3ea:49a1:cba7 with SMTP id 5614622812f47-3eae50c5186mr8718922b6e.41.1733395128040;
        Thu, 05 Dec 2024 02:38:48 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:47 -0800 (PST)
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
Subject: [RFC PATCH v2 17/21] riscv: mm: Apply Svnapot for base page mapping if possible
Date: Thu,  5 Dec 2024 18:37:25 +0800
Message-Id: <20241205103729.14798-18-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023849_256421_81DD89A3 
X-CRM114-Status: GOOD (  12.65  )
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

All hardware pages in the same software page point to the same contiguous
memory region (the region size is equal to the software page size) and
has same prots. Thus this commit uses Svnapot extension to optimize the
mapping to software page to reduce tlb pressure.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 16 +++++++++++++++-
 arch/riscv/mm/pgtable.c          |  6 ++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5b2ca92ad833..9f347e5eefeb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -483,13 +483,27 @@ static inline unsigned long __pte_mknapot(unsigned long pteval,
 	return pteval;
 }
 
+static inline unsigned long __pte_denapot(unsigned long pteval)
+{
+	unsigned long prot_mask = ~(_PAGE_HW_PFN_MASK | _PAGE_NAPOT);
+	unsigned long res;
+
+	if (!__pte_napot(pteval))
+		return pteval;
+	res = __page_val_to_hwpfn(pteval);
+	res = res & (res - 1UL);
+	pteval = (res << _PAGE_HWPFN_SHIFT) | (pteval & prot_mask);
+
+	return pteval;
+}
+
 #ifdef CONFIG_RISCV_USE_SW_PAGE
 static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
 {
 	unsigned long pteval = pte_val(pte);
 	unsigned int i;
 
-	pteval = __pte_mknapot(pteval, order);
+	pteval = __pte_denapot(pteval);
 	for (i = 0; i < HW_PAGES_PER_PAGE; i++)
 		pte.ptes[i] = pteval;
 
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 150aea8e2d7a..0bcaffe798d5 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -11,6 +11,12 @@ pte_t __pte(unsigned long pteval)
 {
 	pte_t pte;
 	unsigned int i;
+	unsigned int order;
+
+	if (has_svnapot() && __pte_present(pteval) && !__pte_napot(pteval))
+		for_each_napot_order(order)
+			if (napot_cont_shift(order) == PAGE_SHIFT)
+				pteval = __pte_mknapot(pteval, order);
 
 	for (i = 0; i < HW_PAGES_PER_PAGE; i++) {
 		pte.ptes[i] = pteval;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
