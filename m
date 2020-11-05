Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05E2C00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 04:40:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3778B2083B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 04:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XGFRkQ6R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ABLFXSo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IH8Fh+0G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3778B2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=14z8ql2cHaL0vBGUTdBbDDnOdNBo8/cimV9vJ5fPmuk=; b=XGFRkQ6RW1DXaHctnO5nF3Rus
	LObV0TGqY6S1JX1j0aO2dDBiiSbEifXUGErzb+QTOJmpvw7uftLzkPYWrnXD6h4slAA3ISvTjrhKC
	2HTcTjYDOrJsrqCqOS47/NFtm7eok1GkozNnuEHVs7Q3bsh+zv47tFA4StBcKUex1/0MWlnFNf2MP
	LDf+3PEKx7AOT0kIGnMIOkNil9nW28u5IHE0D019GuhD6D8ylWybCrbwHi+Xzpsc3X67O6GorXWG/
	QtlWRmiYGYqS8xQhzjFSlqrkBHu9Am5exu3tbjkc2LL73TOW77zVErKN2UXDU1irCtPkDgyVmiicg
	FRI3+zIbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaX3s-0004r6-Rn; Thu, 05 Nov 2020 04:39:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW3h-00016k-KF
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Yix9Nxjh1Xub+F3SenFW1weuytdKPwDVZZ82eZsbV6w=; b=ABLFXSo8ZtRv/f1A8Ac5cU5eXU
 1WqhfBpp900kPIDrsxzE1VRR2AbCITrW3+tEZVw88TWwfUjTC72+fbjU2rlaU2lnrB2K3FPVogiDz
 pmm9r8zwKgaqUDc+gwcVOc1bx5wWjrRY7A3cHC46aliYdTunWzuAnVRfWZb+qH1PFfEEEcgaC+DBC
 CA7HyCal4JXEvCdVj9C4EDn9/J2OSUAZUyWs6GGxrbhnj2PjfLUeEx6EGUuPTSwg0u4BhPn+zPJCK
 zKgTfOXuPLJ32zYzOA9tFi4QXkKYs47SzjAC6itryXilUAKlBb3/wrT7Copm6vNk0I8Da0aKu682E
 fKqusisw==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSmx-00012o-T4
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 00:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604535664; x=1636071664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ttVV2l8xgC8cKeR325K+BCZa+k2eu3E+hvY1gbVjr5M=;
 b=IH8Fh+0GDI/htX80Chfe5U3b+7jEFIL0hRZzfNL0uwllERLG3wtho4DD
 wx3GLwNesDePhZPcJPucQJIOQZ7vmuJkEJb9q+nmD3kEzKgEggGzKCzI4
 v3ozr41FdofMCbVaN/zeKUjMaQKbsIa8vjdibchCv+rPfnLa9zGSIjrjk
 Nqf/CXheqwnIWY5RsHgnwgUNeSt17vuwP93DQTwp7u8+wB26CFlZcDcDu
 K3jSVeAOjgpA1TQaZcFFOFBYaBUkEZPvW9XDP9+UMpVqXLcAos5NJ0Wlv
 bNs++RkM8POsPL8IWZB7lB66UuQF0q0t/Nx3fXxXtoceZW7mhpsUGBBUh A==;
IronPort-SDR: Ma+d1xmU7e3esK5vRcwrBfgJcphg2RO6sWd+nS9LZt3zISkNfgQF55C417pC5Il/OuaZxdYfA4
 Z0si+hepnf1hofmhw9/9K6HIgQSmkFTWpT4iSH14nab/iGl5IbAkfn4G7Z8c5pRd58XRcmINtM
 6Uds1f5P+A+6xfNIcuYw/ljI6cAgfODuPRIIAjjFbyvHQPp6ntjh1bZiFcJuGOvC8XqJ/P3T9k
 LRsM0+IPXaQWAdJMYEa0xdorcp7Zs1hP8TYY0b9YfGlgZ5KILP+8/DMFAuJAXpo908u5unJWEL
 xwc=
X-IronPort-AV: E=Sophos;i="5.77,451,1596470400"; d="scan'208";a="255394933"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2020 08:19:30 +0800
IronPort-SDR: T2CsAqKIcvql7uX2XBuY7FmVEJF2p54PIP9pT7Jbf6/hZwL1h9fAzKK3OgUXykUFuH4vNC3Y8O
 G+8ry5eUGKBYhzWK7i++rTg+Q/KYcfDYS/qc/3TSj4NJD8Pgiy6Eb1INWVqZpDOkCojXW42c0K
 t0XTvHJme22Hh2UMBK9TLlygN+JWMENlxIWY/bS+P+/Lgg39WxLgiCorvbAyhVAOnlJLqH2qTo
 lSR++j/HcqwUtpuxDaLLwG4bwjlIhm9rLTy0IHKdqT6f3hpNSYIkYA4MeBW1BOEkubCVhCKCx0
 kdZxXscPA/p01ZrI6XoUEOb6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 15:51:09 -0800
IronPort-SDR: wyMNVYV728fyoW/gmDgVHH2wpGT4PFymlkeJ/1nIAqM/+kcHUw2irYtuuYStoMjWTgbPMT+1BC
 c477GyP6me2NQe9sScODAfQyhkTMiNu6JDL4PmMHsiA2YjCxBQ9G3qLk84BOCP3HsYWweotSso
 7w06B4nZ5fynamnfg4mBDAY/8VhghC51TRZENylZDQW3lg72x1zVge0zEOwOCXnXtc+5EPB/SE
 sPnQO/UaMgVggSj3CXZgfViJfvzvqvMjyAqA7zBP6K3x/LYavGbjhSZ/OD9cVcNlEM9aT7pD6x
 ERk=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.117])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Nov 2020 16:05:02 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] RISC-V: Move dynamic relocation section under __init
Date: Wed,  4 Nov 2020 16:04:39 -0800
Message-Id: <20201105000439.1491243-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105000439.1491243-1-atish.patra@wdc.com>
References: <20201105000439.1491243-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_000604_380108_DF93F420 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <ren_guo@c-sky.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dynamic relocation section are only required during boot. Those sections
can be freed after init. Thus, it can be moved to __init section.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index ca19ee5acd0a..de03cb22d0e9 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -85,6 +85,10 @@ SECTIONS
 	}
 	PERCPU_SECTION(L1_CACHE_BYTES)
 
+	.rel.dyn : {
+		*(.rel.dyn*)
+	}
+
 	__init_data_end = .;
 	__init_end = .;
 
@@ -116,10 +120,6 @@ SECTIONS
 
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
-	.rel.dyn : {
-		*(.rel.dyn*)
-	}
-
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
