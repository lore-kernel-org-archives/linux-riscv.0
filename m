Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB2DC4363A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40CF2240B
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FWLkckaP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cTc2IsOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40CF2240B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aszBDOHt3D19ol1x6/GJJRoivJ1athLSJP6Kx88FPPI=; b=FWLkckaP0/6S6rHVGB3/0zCSX
	w/odE7F9NshzxklXSWQC6w7sUzRab/hf2pIXh8lZ9w7W2RcIw10DozM9hc+DBFyF5zAGEIsUlWPRG
	JDikOVTeUt/eDVYojgKZKuJtbbarhdc64F2h+qW6l9dzmml0lL0JgSNtu2GF4qn5h4mN6y5STj35m
	sxVdX89NQQsogXVmUHJqnhLaqjZeQR6po8lMS+RKsKJdf73fXK2VsArAhL3m+FLwcx/UM5w2BvAsq
	ZFCp8BgtwBOckCpTkUedyAfJZHp67Rx54pBuupodgVK4jdLKp4aNFi4dZEDuy5cmAUcYU0CVplXGy
	EbopxA+Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQziC-0004ql-Ry; Fri, 09 Oct 2020 21:14:00 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQzi8-0004kW-Os
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 21:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602278036; x=1633814036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uLCpsvC/inR65HE35KjykwBVwDdqIbHHxLVflczTr2Y=;
 b=cTc2IsOvEMs47FzizyWp6PWEw16Y/VJWzJPC2AFAV1AT4KZzj0KURmsF
 PL1b6lyJW94UYV+dtEabKhbM8aORf5xGwt0NKUftt2tp4yMw0KQl2qqHk
 ZkMXKhGHOj9fuck0UFg3iryLcg1ajaeISMuhn5/xxkk8beYMM4oUis1cp
 wLknCTdjrEkVo7KA3oRv3lK5WrdJLsaDTvbkvaxPi39UGH7MJxift8Pl0
 7WBNt1qDJTEeUcAAHLyFMR63pHBKyQr2KU60Dp2LgVfzeEYbW4MoiI+nQ
 Xbu8NRrPACNTOpve75WQO/31Z0SeZK2xhNKiAJlJVQ5Z9cN/h5ClruGWV Q==;
IronPort-SDR: ruOhXMRLALHCuuXKgOtyXiac30ll57kB6oKDfRUJXsPxXGz0tLhRW2UmUDK8f/dJeMjQdMZIIH
 ej4poOC136nG+ZDpGnXAK3ah9vUVWmQc+ebiZzVE9B8Fb20bVvOoQkBQxQ3ETnxX4VeCuebfft
 ANHd14Hdqu2SEnKgLp61PNzKTeFsWfLkNLBHUqXFotbkNnFUrvcoqV10EiBHqYY4sziAKL9rM4
 jUokSb2uKGd8m6OfVVzbcro7ChM6kkseZ/NOjpZgjoINyzTRmmSWT0LVesSvu0ZTEdyiz4J8AU
 u0U=
X-IronPort-AV: E=Sophos;i="5.77,356,1596470400"; d="scan'208";a="149406014"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2020 05:13:54 +0800
IronPort-SDR: VlM1crg8hWLlQo57j5WsLW1y72REU2Rkh+oXjYHp0nIUB/9U64VfR8r4sp+tHxCZb5Ep6Bjqiu
 ZTsJDWCoOxLFAvFBSxEolEmqCLagpPAwWU8PTf4I1yf/T5D+UTTCx1IQP53fRsDxTog5uKcPHv
 me7O7cR6g+BJJjC+k1Q9dMwEAQnsZ1vAYsrrfnrEMvBJ0IoKamp9whXqoOBjHandiSIcr2IxT2
 cX7xdgdKanEWBqRZixdsSyup7nfEMPXyiZ0ElIMSvEQDElOUJVmTeo/MGWmgJMLQd3hL/XfGaG
 Qf0STdm0mx1ScUeacF6j5mYn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 13:59:41 -0700
IronPort-SDR: k7VpveUvGC2efjb8TPkb5b963i4tk0vSeShUCYhda4iG2UWjLq+U326k8Xt4PhRxdYNxbiKZlQ
 /mBkP0UVKgvqGOVYokqviIhHplcWANZ7EsinNEySw51Yn+4Ac5jV/YeNq+Zufdes7yw8VE/Zx+
 vE/MtSu5voyQ5Ycv8mdj3yTD9Q/Sd517jWj4nIxipZ5wPzDivks1gcSZ2ikOthVbWJtplBy+nP
 WQGaAG1aXjZw+VDCaMbqVrqB4Ix9O92YzSxBPXVdJsavTS4J0IZBC6pd/olzUvJb5ymWMbgd6V
 Rrg=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.38])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Oct 2020 14:13:53 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] RISC-V: Initialize SBI early
Date: Fri,  9 Oct 2020 14:13:41 -0700
Message-Id: <20201009211344.2358688-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009211344.2358688-1-atish.patra@wdc.com>
References: <20201009211344.2358688-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_171356_950958_6EF2601D 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, SBI is initialized towards the end of arch setup. This prevents
the set memory operations to be invoked earlier as it requires a full tlb
flush.

Initialize SBI as early as possible.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 1db17f37736e..a5cac440aadf 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -90,6 +90,9 @@ void __init setup_arch(char **cmdline_p)
 		pr_err("No DTB found in kernel mappings\n");
 #endif
 
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	sbi_init();
+#endif
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
 #endif
@@ -98,10 +101,6 @@ void __init setup_arch(char **cmdline_p)
 	kasan_init();
 #endif
 
-#if IS_ENABLED(CONFIG_RISCV_SBI)
-	sbi_init();
-#endif
-
 #ifdef CONFIG_SMP
 	setup_smp();
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
