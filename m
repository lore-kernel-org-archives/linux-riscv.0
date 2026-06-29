Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC64C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtqB9mezKTg+OQcXDBwUw9rJykKN1mXsuNTnnqkVgJw=; b=JpQa0epaq+i9aO
	y029+LzCSetRkc9ndbTUcznXVwHN0mvjE13MTPpiCOMiJLh3W38bSB7rBD9vf99AnMTVEndi3WoSD
	GgC/lcVWKRQnd/NzjySde2XuwmeITd+Z8QnmnxQV0Lm0uEkve/A2KllVdtVeUEWLsZ+pDXcSlAF2c
	xImijeEcjJ1fSy4Mi16hw2/lv+WqOFSR19gKZ0Ljbp0VAqI1qWz9LfSCQXxtnBxskk7REiR0aJOeZ
	/If08Yx0RGZM31/ZcghdM5nRlDvXAOZHQ8eeP+Ton0hD87nuvEX1AeKLYzVbSuRTgWtYTZSRaaRS7
	Y23a44xc8AaaghXb65uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzq-0000000FEAt-3MIa;
	Mon, 29 Jun 2026 16:38:10 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzo-0000000FE9J-2Srv
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 16:38:09 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84780c95e2eso837018b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751088; x=1783355888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/OCyHXptIZem7abs2ebHUlpV5sUt3WFWdltwFGFKKo=;
        b=VJtX/qVpS5iVufbxxFARVkyuYGcs05aCFeDDbsYNkyAvtOXUBHqvL7kWO2fj42o3z9
         eeqB5cPZW3AYPP8JBJ0qv+Odr49+YXtnsj1un+RPGwqrfdCmeApODbV3Buzbv1hGi+oy
         JgOR9bDA2Hsl0Vl6TCp8A3CbGDdeBzRYRVZzCnQroIaK5/clnkigglnXlnnAREbgqxkv
         NQ0ZIWXlDH65LrDXB9JM0t4/dT9ocjDBLH2TCJDL2bzaQuOgBV24QKxxVFYmqIuhVidI
         1vHptxf90oNCq5bAq5OGwG5JIfnzSGVCGuPduLT6raToxzZ1BrfL8qsFc0bQthDczH5J
         L+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751088; x=1783355888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a/OCyHXptIZem7abs2ebHUlpV5sUt3WFWdltwFGFKKo=;
        b=meLVT4N7HkQPQng41EVR6qbWKerU8+3X669DUPe9nT1Sg0DEWuXEGHXoVby2Wd4KCO
         pGK8LPSNGK+eEvTuFm43wEYUVOdPejleaFyShcfJxaVey3JlIoTOz0VEFHoLjSF5I4/0
         Llu01Y8cZPkV9gd3cYPVw2b1SU+x03w3RSOj207tg9LdPzGh/pO2Yss37DfJCLDKrE/U
         X7anp21XzR6lPJH14ZgPZQNMqZuifFv5hshCrooIy0mQlD68gmSrWAyonKbCLCgHxU0G
         0pe9LolKlQAsjh0/98Ypdtr4kU1kj98gnN9f3/Lg8Xl269O7Q6VSzXag8FUC1GQkCczN
         vu1g==
X-Forwarded-Encrypted: i=1; AHgh+Rq5Xp0L0nVRBVCp0QdYFSX5jTvDg74Uce88faza4fptaGhJJTG7BQ2k/+hzYW+OjJ9Wm82aQkv2Vgq+Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQXgmPLpHOQ95KVGnzFnOy8uTf+iTmCHUHV3/1KQTQ+d5NT/QB
	077z0dyg1JrbG15e4LVy62VGbhoZlHRRNf8KFBVMHZt1BoMmmzf1/qLt
X-Gm-Gg: AfdE7cnJWgu80xU6FbPQZT61s2WLFqVqNjYsBxozotSqywr3ZAIzl9wXcK4ZAcbPW1A
	aOMLde65aAWvfll1XpUuTMxyQRPIqo3hDSvHuw8SmLEFffxOMuV7IaXWnBkM2suUye6OCvOqj6Y
	Utk9acTEy/FCFCTFV+6d22F+qCkQ7uiU0tqzNAo/dwDzNI92TMx2CNR1KBR9pVaA0jbSrUpm+dh
	9982KNcJn0WApDj1Hf4wXFtr4L/yvCaPigN8O5RuakLrt96Y83w64KhhUxtwRj1aQEJJB+T8444
	YfG6t6bNrPH2iTXWwNkmted2DojaxXXuLWVWSddIYGRwdTQod32nTz003dzkIUFUTtAZfcRQqLR
	IZaEU25smmOehx+Ij9LZx2RAbT0bw9YSUXn1zZX6aD536+xIr6Ap0dX4yNOQ3LYkplpbg4mfSxe
	/O2Xcb/ic=
X-Received: by 2002:a05:6a00:995:b0:846:169c:d815 with SMTP id d2e1a72fcca58-8479f2d139dmr206694b3a.60.1782751087602;
        Mon, 29 Jun 2026 09:38:07 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:07 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v2 3/8] riscv: remove unreachable invalid range check in create_linear_mapping_page_table()
Date: Tue, 30 Jun 2026 01:37:31 +0900
Message-ID: <20260629163736.1606688-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629163736.1606688-1-ekffu200098@gmail.com>
References: <20260629163736.1606688-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093808_625822_BC0738B0 
X-CRM114-Status: UNSURE (   9.14  )
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

create_linear_mapping_page_table() iterates memblock regions with
for_each_mem_range() and breaks the loop when start >= end.
for_each_mem_range() never returns an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4d1..eb93c2ac05a6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1229,8 +1229,6 @@ static void __init create_linear_mapping_page_table(void)
 
 	/* Map all memory banks in the linear mapping */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		if (start <= __pa(PAGE_OFFSET) &&
 		    __pa(PAGE_OFFSET) < end)
 			start = __pa(PAGE_OFFSET);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
