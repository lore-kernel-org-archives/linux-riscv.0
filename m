Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC92C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/SK6i2D85b/ZYLO/AjeZ0SIsXZ7Q3EVGlJLwreBqNA=; b=ryR+ocsoP7KsPz
	zCl5ptnKsKroryhR5dpuRGLnENBzAGKUzEQ78PtAVx15gxPgOldeECoi4cZq8d29609ytwL1VsVn0
	sbaIYHWJY19h5eV64tOrD2BWYf86Xr4iXt57kYdAvV3ERJt7rZlLyTLk96CxZmwQWN7FVR/060qsb
	FqJ/esS1PE+XCvjS5fa6AZWgrqf0FEO4O4nLjUqs/sF9FoNmJ5BYli0E44A9R6Y9v8OzoJfNFblIA
	cnJKnFDss3ovsYkhNCbSxhf9dlnKlojNznOAWkE+tMxM8okN0xhf4cniq31Ioa3kpUuoH/gf3+wbL
	Mjt2fwsMZL6AlTtULfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMpb-00G9fK-KC; Sun, 28 Nov 2021 16:15:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMpY-00G9cr-9c; Sun, 28 Nov 2021 16:15:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6C9961024;
 Sun, 28 Nov 2021 16:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3E6C004E1;
 Sun, 28 Nov 2021 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638116107;
 bh=rYqEjOuhGRt60uVjKCwFcGC7KuRPU2ovghUYTYMOErM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z7yBUNy4YNqqt2EydCYUmsGMQ/ojOhslhaUmhU5tXwVdmjLil5xgf0uZJ6Nbs090h
 0bW0t+JSb51IT20MZS6N4mVaCt0QaCKTvMvoy98JVknxwOhbHJ+N0WW4PIGWtNj+7s
 6XUGqtlAhdc4fFhGpspCAstMMIFOA0SDPRWIaG3knab7fSmrcKX6qInGhG9O8Yb2xq
 lgslqsIDdjtdIpoLdJ2oJSBZ0sq4rsEk91ay0iQDVkMKVGZIa+J7zVbYSq3jktSuwE
 qMITcarSVQH/s3enr6eCAxzaqteTA4HXhTp6e5ChkGL4mN8gorHKexwO2KEDAtmC13
 Dsn62e1ySBtgQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 4/5] riscv: errata: alternative: mark vendor_patch_func
 __initdata
Date: Mon, 29 Nov 2021 00:07:40 +0800
Message-Id: <20211128160741.2122-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_081508_418288_1089A22E 
X-CRM114-Status: GOOD (  10.68  )
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

The function pointer vendor_patch_func is only used during init, so
mark it as __initdata.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/alternative.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
index 3b15885db70b..e8b4a0fe488c 100644
--- a/arch/riscv/errata/alternative.c
+++ b/arch/riscv/errata/alternative.c
@@ -22,7 +22,8 @@ static struct cpu_manufacturer_info_t {
 } cpu_mfr_info;
 
 static void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
-				 unsigned long archid, unsigned long impid);
+				 unsigned long archid,
+				 unsigned long impid) __initdata;
 
 static inline void __init riscv_fill_cpu_mfr_info(void)
 {
-- 
2.34.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
