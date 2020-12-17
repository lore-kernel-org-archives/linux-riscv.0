Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B5BC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 07:49:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FBC2376F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 07:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FBC2376F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lfm0GGuTAfXWwA/LOO/EOZAgqPEqDgekhOSDar7FK0A=; b=wlI0HB/qfP3Kxo3UmZDldu/l+o
	1Jun6bYQtXfMqyIZ0g6shgLjyvOhPY4vybx12tnhN5xVSUHOdXX1UGLFzFOjwm8Ldano1j71ac+K5
	051vSxxtq6xgEbp8VTSLv6i9ydfNUYFkI+Kdw+pyE1fC+2MCF7YzoMOFnOds1z8UsBpCKO8ZANJMO
	ezRgP6Re8xtiffmzz5dmBK4RLS3ybRcJ0KdNJWrxovOdxMCzYXCdIAMgIBDEi16P6E6v34e/CFgq0
	MzRdveMfm27eu9XqGeT1W8awSC+2zmrkl4Y/53cG1BN/t6lRbBGDKiuiPm9pQGmaORCgBk5NBgQ+1
	k6FUPWiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpo2F-0006Lk-GZ; Thu, 17 Dec 2020 07:49:15 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpo2B-0006LC-KA
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 07:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608191351; x=1639727351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NTgNlYcb4X8fG4aPZr+pa6LHmqpavF30sDdmLy52hbs=;
 b=l/2oTJZM4hWk79jIiiwmeamTka3iNm2jT7Ru8MogCKjVeEcl7QZESIzn
 BXZnnbqfxEG82PW7nkh21qweWyYOnhofeRskzl4st7Bu29koS5BoYfFfv
 YELDRc0qxwAxZ6PayTMTi9P7BDqvdJGafrH1YG1dtZ+jhzfGYX+VT4xHL
 bMJDlDXdiJykM0dWwrnB4tlyuKxkanAyy8j86zYt/9Uvq4+ilx0FswJTk
 Vpi7itEzPaA8mmJ5jTdvKWbdYPe2hJnqaiYY4vWf/tn/j87ojzzpBhku1
 zvboUnOXwKCdqk6+QE+PSh7arGWgAxQZR/R7dH8rFu98fmRKw/8/SKopq w==;
IronPort-SDR: 8ejgRGgqa5qtEIy170tXr8CKGfp3D1XwnyJkT8Mc+hv6a/X4IFEImfej64ZtMrKqRh1b8c7idi
 23Rb+SOEOtI24z+fP6hbkh6/7UnkLwz/kvC7GUqjPQx4UtKbBswGBXsXvQlND9fZu+oGNDy63d
 UWA3GIH5/omY8mRj3KlGp7UPgZ0sJxhJhqj3VxPZeAmbUDwvyOLdeBOvFgPtPChpvwIOxEccqc
 L0cVnZOaxqDQduB7xu4Ah3N5rF+xhlCBXnrUsRqSYsk3gpa63S7LaNyIVBO9D6EpHR8L9rChvQ
 Uw8=
X-IronPort-AV: E=Sophos;i="5.78,426,1599494400"; d="scan'208";a="265558104"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 15:49:07 +0800
IronPort-SDR: NjzrpqSs0XLNpvpnF/lz48XAGe90Yn1bRkiRl1jqxJ5b/t/8Hj4b5MXzEUljYMER3ypk3VUzoh
 iVttCV1qmkr1vZIoq1/YyfgrzjOejBq2J10an8RxrLbF2by93gKxIGTNSDoB66+qIRaNrIkCVV
 NCvbw2IdDSwzN43G+hhNyDx5cruvK/GvaIuxi/RbGXV45+/vfkWHBfkeFLsJP0WXtuTgT7g/P9
 ZooTXap1xE7rD8lUXLGbM3pBXJ4Vg3pNCox9KY7d/3JDOKs3SnQdzlt7Nd1e04BWRB3SFPHgF/
 BJMLmBSSUISaHtMSA2oY9o/i
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 23:32:42 -0800
IronPort-SDR: h8HJiAirRgl6kkJenUcBB/tbrwZLlJ5vg/aqhDFN15CCUoqRbnRFkm9gi5bzLwQWTJ/qpRSNUF
 KZer3wH1ESeR6r986rC/fTXlCT7pxY3xd8zvwoNpEF9py0y74YyBkS9i9Q3RVgnwOq9lcek1mv
 OGIe/2QaA/xYqQtxCw+ZrKcd7hSjthbiEiICCznwS84SAFnfwCFK3vamSD1hZsaFD+ZRUnVdAI
 nDaJElXmFxgD1DEj+s8ki4h7w0Hnh+p6UT0A4dc2p6tenQmdZB0IM3EwhIkrGBKUQeKH4TP0HT
 tnY=
WDCIronportException: Internal
Received: from kelly-s-lt.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.43])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 23:49:07 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Fix usage of memblock_enforce_memory_limit
Date: Wed, 16 Dec 2020 23:48:55 -0800
Message-Id: <20201217074855.1948743-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_024911_859341_F8B9A279 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bin Meng <bmeng.cn@gmail.com>,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

memblock_enforce_memory_limit accepts the maximum memory size not the last
address. Fix the function invocation correctly.

Fixes: 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8e577f14f120..e4133c20744c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -174,7 +174,7 @@ void __init setup_bootmem(void)
 	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
 	 * as it is unusable by kernel.
 	 */
-	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
+	memblock_enforce_memory_limit(-PAGE_OFFSET);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
