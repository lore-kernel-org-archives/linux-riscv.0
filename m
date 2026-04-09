Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0AFE9DE7A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1WlPR5dnOoOUSQ80PpUiTwgxq/x1CipQuSYnFxfHks=; b=n156W/hGX9flXR
	vfjiZoUSVjzz8omlOGNm2IhFN7rAxc12zpGt9+e3GxXRs8WchxvYQ2wDmudp8sbrz/jAeRTvCD2XW
	A+WhjgnNPFX5NGQSGVmRB5eUvBeTTQf2zm/IWjr2JMmlU8n+pYFGBmg2rt6E0nzB5jumqNPxUno2L
	lW2RkgQfdIYztL75ZXet1/T2A7/jLDJl+DCUznAibCTZ30F3a6NjUdAeLJIyb2+gkw1YXmp3AO29s
	qzwTY6LXOyFslxuqscu+NbFYLBe/5vQ2mf99pNYvzeMSDqx57f0/jt1ad7C6ibaj1/QYJkKsEYDLl
	A3qhKB06TWRuuAcQpGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQq-0000000A12N-3egY;
	Thu, 09 Apr 2026 09:12:12 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQo-0000000A0zt-0dPW
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 09:12:11 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7dbccf6a23dso656516a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775725929; x=1776330729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG5rOEE7q2/QsMF7xOjPBwhp3322th365MiqXC7VApY=;
        b=nnEia6gHuYlNxNACfxUUSaJHvksX/Y0D2Fw+JGK54bIPKZInYjwWxj61AAf6jBQDb3
         +LmZfAQDg/iNVoVYH8WPG2Ak2z++wMnX2dJYFuNe7xcEsYtYaoHmtNamOpDlBB2h00zU
         pwTdp9/Fa5c4gOcJpqv2dtHqZwbHcV1aPfZkEBlo5VsSf2dPfRvJ+hz5yXObggDFU1ay
         PDywEv484uHEwn/vRHnf2+77QftabrYlKUze0+T9jxtfTMquRU2XZJxKJX6WAhd4ToS7
         PZ5xW71vj+HRzriO+ZTNKV2HsLyLnMS8NyWLaPM8k6S0A7tls619SACORjG+w2dLxeQ4
         apCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725929; x=1776330729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xG5rOEE7q2/QsMF7xOjPBwhp3322th365MiqXC7VApY=;
        b=Lv/LOiB7fYLHT9xe/pVhIJDcWuD/qITGR3pD0kHfPOMK9NCTdXSuoOA7ES2TMvgYS5
         /JNSLt6NSsDue/Fcf9nIlBJ154+dMnrV2XgMFdbrvesave073cGBs6q+tBuevUxr6Sgx
         LnpJWp5Hf3AFqYHte+YpUXgYFqE9Qh94jkbQxqDe5whHM7PKPuUxnwv2IYZg/zkHBSPq
         H5YYHilUZWNT1KOKUtUvnKanv0ZeQCEmk0JLvx27NejU0y3s7OJS+zF1ZuXvRUBK7Hzw
         mawMzv2gJ0jQtxjx3WoEp3cOP7mjRcdeJbOI6peupIa6obiT1vo72IrGAKa5FQutRgN5
         skVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn9UzyoWHNhJuckvYZF4rmfSzkD/xdU2tbGEl+oa9Scdas0YpEk41IRk4fQePRQh1zwuG6LtggsHejpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycfY1O2t/7SL311qYr8bIacMM6T/taFosiHVdnwYmQZt7JNZsf
	iLD0CR6/MjHx88h9DLh291XZwpd6+O+9hh9L9P+/dmPcffUCw/g4vPqJ
X-Gm-Gg: AeBDievrE6hH4wrE6lXjJ0FMTwqwzr5C2jKwiAv9ZBLQJ4cVaWjDw5wAjzLu+4LhrbI
	2La9fUiHeGPweBHrhn9oPsufvMJR3Rtz6W0k1JCzq+Il+G14bae1HDMe9Mco6O0LDyVWbWO1/q/
	YYfCXTbAmMnhUONe5KB7S29yIOgjIT035jS7pyj1puJiU0mYfW3gDAqWgAtqZ4oLNKRzDbfzSkj
	TvRz8gRrxafQB/iKyMJnkQiQfQ3H+E3i9O9BKUbtQb/pv+oBiYavQQ1hjcyxTCUDcRPTeGBg3wd
	EDlNsfgTsKziVHebJf15SKGREeTIQYajzlHuNDIkwd66QqGN6zMKMaDW98k/BzeikoiznvInC07
	h3CizAI7esC4hSUBrVTv6+rc6bkB6tVPkCZ51X7eIJOyF4MErmAlT4O5MTJ/Pjdij3aiLeM0149
	kWfMREQCXd+/sw6c1aYkGlV2AOh2WiTSKiJg==
X-Received: by 2002:a05:6830:d09:b0:7d7:e565:a4f7 with SMTP id 46e09a7af769-7dbb7518062mr14958706a34.18.1775725929011;
        Thu, 09 Apr 2026 02:12:09 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7184e14sm15585364a34.11.2026.04.09.02.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:08 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Guo Ren <guoren@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Michael Neuling <mikey@neuling.org>
Subject: [PATCH 3/5] riscv: mm: Fix NULL pointer dereference in __set_memory
Date: Thu,  9 Apr 2026 09:11:41 +0000
Message-ID: <20260409091143.1348853-4-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091143.1348853-1-mikey@neuling.org>
References: <20260409091143.1348853-1-mikey@neuling.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_021210_221541_169977E9 
X-CRM114-Status: GOOD (  11.12  )
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

find_vm_area() can return NULL if no vm_struct covers the given address.
The code immediately dereferences area->addr without a NULL check.
While is_vmalloc_or_module_addr() confirms the address falls within the
vmalloc/module address range, it does not guarantee the address belongs
to an active allocation, so find_vm_area() may still return NULL.

Add the missing NULL check.

Fixes: 311cd2f6e2 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Assisted-by: Cursor:claude-4.6-opus-high-thinking
---
 arch/riscv/mm/pageattr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d27..46a999c86b 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -289,6 +289,10 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 		int i, page_start;
 
 		area = find_vm_area((void *)start);
+		if (!area) {
+			ret = -EINVAL;
+			goto unlock;
+		}
 		page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
 
 		for (i = page_start; i < page_start + numpages; ++i) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
