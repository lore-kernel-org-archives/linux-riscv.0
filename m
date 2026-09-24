Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FC0C98311
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTUeSEEwclno7Sz7VltWpucRcybA9CDtbP6oiLOUbgI=; b=2jiFwEfeXau06Q
	MrEyD38LLbWiaVS0nSJYTrFeAXA2zRwyo6tKrD+6BQwWuSDsmT9nTJr2wJHMmoorLoLc4hQH6obE+
	XAbgEq87aARMpoY19X9xFhJXrbDnXU6CDbFdsiTAYvcjp0HXS37zxhToQz1ujo+ta8U18cZ4W3FEN
	BjzbS+yIwFzJSnJU/8vPUKB5tIv6jUF8rmVw2XXsqc70uAAnhRQSdz/B4GOLidEA3t8kqIi2Z9Usl
	ff7UmmkIIQiQ9w0f13I7PkqJrLxMIe91UmQoAOHwykjEAAmsz7PKf8bR2Hs/pV7ED7yKYK6T+mwn0
	uzEYqLJjrhnIocetpfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fBQ-0000000AV1F-0nI2;
	Thu, 24 Sep 2026 08:52:00 +0000
Received: from out-25.mta1.migadu.com ([95.215.58.25] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fBN-0000000AUzX-0kz8
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 08:51:58 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VMcXVA6Q//nucy9IuPEO+cpUVY2addflHX+2AAjGN8s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790239915; v=1; x=1790844715;
 b=JFPj+/WwpV+GK99lpdLKQNokzmXaHwqhfi6/luOa64C8H60i3R+Qa191jjlNu20k1qnI39Y0
 WHiu1ekU4wCvBFHf8hW0Gj9/eNhlFb1Og2nab8guypD+hx7z1Q2/Aj/uHhc2fBeZvej83b1lNB5
 0egrPQHSkJQ2cPlcFwlbe7p4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4de7b20785afd569;
	Thu, 24 Sep 2026 08:51:52 +0000
X-Mizu-Trace-ID: 4de7b20785afd569
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Thu, 24 Sep 2026 16:51:39 +0800
Subject: [PATCH v3 1/2] mm/vmalloc: fix vmalloc_dump_obj address alignment
 for last-page lookups
MIME-Version: 1.0
Message-Id: <20260924-vmalloc_dump_obj-v3-1-5bdee3da37b3@linux.dev>
References: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
In-Reply-To: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015157_388407_0F19FCD8 
X-CRM114-Status: GOOD (  11.45  )
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

From: Ye Liu <liuye@kylinos.cn>

vmalloc_dump_obj() uses PAGE_ALIGN() to normalize the input address
before looking it up in the per-node busy tree.  PAGE_ALIGN() rounds
up, which can push an address in the last page of a vmalloc allocation
to va_end -- outside the [va_start, va_end) range that
__find_vmap_area() searches.  This causes the lookup to miss the VA
and return false, degrading diagnostic output in OOM dumps and KASAN
reports to the less informative "vmalloc memory" fallback.

The upward alignment can also change the addr_to_node() mapping when
the page boundary crosses a vmap zone boundary, causing the search to
hit the wrong node entirely.

Use PAGE_ALIGN_DOWN() instead, which rounds down to the page
containing the address.  This keeps the address within the VA range
and preserves the correct node mapping.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 859e6d2d57a3..df42d8a6f058 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5277,7 +5277,7 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long addr;
 	unsigned long nr_pages;
 
-	addr = PAGE_ALIGN((unsigned long) object);
+	addr = PAGE_ALIGN_DOWN((unsigned long) object);
 	vn = addr_to_node(addr);
 
 	if (!spin_trylock(&vn->busy.lock))

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
