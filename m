Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5EB10854AA
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 22:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=72tDSEWdEDNVwDvbu3DItr822VitwGtx+sm7izPBj+4=; b=P6ci1w3QGxPJdb
	074DkJsce+yN0v66UCIYUEAePpoxTpTdkqneizHdAXZ6HivyEU+IN1o8dOSfpdACHKAne+mDs04JS
	lT9uRu3mPxQ84c4HNz2plDimqJZ/ijZRzWhpyL1yc3ag03LP85Wj0uhuVl4Wgxjl19kluQTFTRz9N
	z249W4CzZ88qIkgZZvxEJoantrchuMgf6bPlfWN8DdDjMzek9qSSTnZnK64mEhP2GuD9p5JaFxThy
	Ngf13xEkdxgAdVPzmxcPVriDhTRQ4EZEdbSyEkVzvvxXHNbIazAc632nnjGEH/JzFBSnFlPIIoqAx
	hJJejg/C2SywTfpEKbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XUP-00000002D3e-20SO;
	Sat, 14 Mar 2026 22:29:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XUM-00000002D3J-1RFM
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 22:29:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43b3cfc38edso445634f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Mar 2026 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773527379; x=1774132179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrFd10CMHTUngJ+QOak22idMJWYggdJEidQTQ1ilrUk=;
        b=DvjlUAYMoqb3sC6MIIMPXVyvPiJeCnVeKY1ONsCftkCQeNxx9C1QJB1h6U7PS8oZld
         OHZPTLdvp+sVNk4nAW/S8iB9WymUoiksiNpVGeTgoF+o+fNpLG9peQHLiIXThzqw+qXg
         XiviB9vmlyW5r/nhXqUnoRpetJedspw5gkn4MprtCwAnAm9wiYvG+LdiYRrhTlfN3f9k
         MF5oMXy3hvGaFU+POfWoRxf1mxcgFHZdwQNL8/ftg2gHn0AI7Hh40oBMeOiywwpoA/GS
         XxrhY0pWC7q+B8HJ8h6eS7sxZxuj4X6nbbzVzJQ9dK2mfSveN08VYPXXxPoaqgRepnXU
         4mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773527379; x=1774132179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrFd10CMHTUngJ+QOak22idMJWYggdJEidQTQ1ilrUk=;
        b=mZLY0JUoQolyImZMarQvYgeDhtWdEq8F0gajRLDFmzxqN+mPvJsrXwE6xWtbzGz1Yj
         Vk/HQBIB8mjyBGb8vcv/IpGEptVHjdelggPtWcM6K1Flz7VzjxTpKO9uOIfxksBB5GtA
         2KFpKJx2mYecVz04LrV/KHH7Dwy/K9a8NeEIPAMcUs6zzDI5IjoKWTh9IgLJcFxN+kj2
         Mpi9x4/Ed2PG9el1m9M/tP/UviB4syaMqj7B25FPD5iTui37PwxjyOhiWxJ/aBQrOcf+
         08FD7EJOpkCicYiX3HA+OQYbUsgL0COTWCgtsOPLiG77Ifk3Zpw66IjVAls8wzKpd6ef
         F/KA==
X-Forwarded-Encrypted: i=1; AJvYcCWy+BVbfYcr0fVnnkw2CoewH7N3Vae+vfD3yNysKsH0YiEBpfK61397XWwgbYbNXPlFxmhnmgNYDf13Og==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyob2mgFcqDGryxhqKaQmJSN6z+/0T+caHsUccyy92bnJpBI7Y
	/i6bHDUqoq3TCXa8vr3DxPy1QVNvTKWQuqkA5AyH6Ap51v2QNbauNw0g
X-Gm-Gg: ATEYQzwSFE0+t59NX3f6MxERV8KEAicHWzxdG0DFXJK/htizPK+b3RnToDRS3JraGFa
	xYS2Hw+EJvs3azSiBrwuAUSoMoTeb/AEgmU82ZO29VFFnsjXR9WJBtCi4ttocm2HZHh9Gx/kiwk
	N3wNOX8cNgvEWpIi5qLu9lYaxAerPPDCUfn+HFHF68vCwYuQyqk5DbbdrAZsJXD4MmaNrPQXzKi
	pLjAg9wluB1qozhAIHUfVfJKPelkHQrs2FE8jovHfvOaLjA+wabDzbfNujYnoMb7V43SB5YV8qK
	bIv/uq/X+0YaNqrko5NZPlqmsy0UpOBwkH9WNRlJjL7LSR3uV4lvYgIrosMP4iJXeUbPZhjed+Q
	EEtcQpvtU5R69v7ek2OnOTnCO6LS0jxYN+0957sVEyTpp7bCDVeKk/Pk0OsBR62+FN5Z286w4W8
	xF+zo/ppnCzTc0M3BKDhaJlp/JfX3Nf8h6InKOvDoKjbkgJAEb7C/qTm3Jlxk=
X-Received: by 2002:a05:6000:1863:b0:439:bce5:6519 with SMTP id ffacd0b85a97d-43a04dc0849mr14418218f8f.39.1773527379315;
        Sat, 14 Mar 2026 15:29:39 -0700 (PDT)
Received: from osama.. ([41.238.114.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c0b4sm31185193f8f.25.2026.03.14.15.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:29:38 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: add null check for find_vm_area in set_memory
Date: Sat, 14 Mar 2026 23:28:14 +0100
Message-ID: <20260314222815.153203-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_152942_388111_2B574FC0 
X-CRM114-Status: GOOD (  10.05  )
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

find_vm_area() can return NULL. Add a null check to avoid potential
null pointer dereference, matching the pattern used by other arches.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/mm/pageattr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2769..46a999c86b26 100644
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
