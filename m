Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063DBC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB8120786
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 03:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vm29QyVM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="onuGgSde";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ditdmt3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AB8120786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wX4g/n6Z4vxFkVtoaai8oo26/fP6F8kk0A+XsmapyyU=; b=vm29QyVMj0Ma8heD1Ai3ONFw2
	ZHSGhKxr8miFNckEAzL6u0ie/Z3xXBeKpXeujdpqUfz/VH2K3c4he/zxj1Qqm7FzXswZ5KFdVIOlu
	H/Uk1xuzteMvJcEgwmU0dBEwwOiSz+g2aLwDU2XvfIuuO3gwAEgX6WxnQUzyy4iBoMvkozRKn6Gk/
	+928zFSe31y07axGME+UU4WHxj+T2mcXv+Wz5rDCvNMGOtGG6AydllfS9SOEeS+2fxYg9yA7QZ3T3
	f/UoiJIJE0UAl2RygaFVVjbzvJpnQ43wH004rTG1axQV2wJlemvSu1AlHLNxz3Wywr9xwe6492uEq
	kRZHJCvFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaWQ0-00016I-RC; Thu, 05 Nov 2020 03:58:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW3j-00016k-HW
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6UZc6r7anyR/Lv3/FsT5AM4VODEE/atwOoN62bU9tFU=; b=onuGgSdepK7gnRfo5hsgWyQGkO
 HH71rkxz5UDlW8ee4p5EteGaZ9jVrZQyn78m0NevQbAnW54NgGfxytdvJ0c9Gm9u6DaSvKtbIXxzD
 phmHGQ8ahp2CThC9+4V22f3U0QpJFHFbG4IRURjcXa4QTcV+QkfpqbtJ32961FS/s0ZFK5lEPGnGu
 OXE8yZ8qUEVctvQiiiE1QE/C3FGzkQjD2klMh6ENjBG44HPPD3LUKtrC1rFYVZQzzHR3aZCYBwg72
 8r15L5i9202ZD4D55Tu+WOzBUcTlsktrsM9xymUpXIi6v1cUuWs9M2cTcYMZehoEIevuEcx1mUZQT
 l6FARrkg==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSmk-00012o-Bc
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 00:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604535644; x=1636071644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qmlk0Pnoc73PLeMzxCGZ41KUAZ0XJ8ZZaWUmbVJfPT0=;
 b=ditdmt3FkLAaDZxf+QvA4SN9W8By9YxpDkhbxmwEikFrehmuN81AqsNz
 aS3IKnZDlPe4dst3YLJH3TYuILw/6+0ePAqUjQUxCZuNyew82IfwVBADf
 A0vM1yKcPFPl+Pm88K+3iV0nKkpBd7nsc00uvGyJ9nPaZlvI8NRkPzR5l
 yQ0ViaWxqZ3Qp+H2CZfuS69cByjS/DtpCkN6QEM+jAGnUjj1BY8nfIKMa
 JS6AbJUlRCwQ2UWwU1KVY1vX666uXSFMXnD3MqxUPxyNamAHxiKvFqkX9
 sj5oT6cTUtqhBI52Ccu4Bng+oJ7nsvj0kI9QXG3qNeKOC1PnSvJNAGCtN A==;
IronPort-SDR: gGS0XRcxsSX3bQZvi2oLDPB86ra9hbP6249xkYfYjbTMNUo3eyc382LjNWLT2wmYcfRCpd7x/1
 iKxZGjeB4O69zEF4Qi24sUnhPKTRG68xc4LBG0Xs3+NYTVHPr4ZzfLY4U/EsUUjIXUtpOkF7Ms
 OrcC67UfETUQ94U7+wPmWTsi03+3sjtPfQ59AQTYagNevJIEAAmh21GZo/YMhxBkKB0RbOtGE5
 XcYuH911tSFc34UcjayAPWwMOgLPU8d7llfZpPJ4FwtE/YrXKTsxq88PAoKQzIgg+yiPzhNXUf
 VmM=
X-IronPort-AV: E=Sophos;i="5.77,451,1596470400"; d="scan'208";a="255394925"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2020 08:19:27 +0800
IronPort-SDR: IIIX51xFhPbRKvgwVY3GbLj/n0wI/SNDrgkXMbCeryrC7Es2dtKOLgz4+B1hOEgdTa4ChQRNfJ
 yZuya4jI2JRGuwQMPB6u6kfJo3REluvBY2VxGL4kHI8tm3s7GdjIrmQpckcGcdvV8oqn2bSgCV
 HrFTjG8Zv5+g5mdEEd1SDC3b2ftmSbYcQXFz7REILswYe8CHtNLMr5gooZEY6rM65e5Za5viOk
 yLaXlq0+S0yntbW6RwwV2jyui386LYAlMdTfoDJtlQp8hY69Zos0LgyhKyWIulJun8TexrXvn5
 48Y/a/Gyj2g8JyePjdgMVKFq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 15:51:07 -0800
IronPort-SDR: yNvnMjXW346K7U6jCdqqm43ZAUXp9tQ4/5PWfGi0t/hoOXEOkeWMH2sqmoF9MWr15T9IecUil5
 +rIn45F+wDZ1zPspKPZR1OgHnNlozCSwSnYV9jmeblvU1tlIro7n4fjvb9uDQVgiRLZK780H8R
 ELgikQw7yv+uSv8qijoCDDSAvDaENigKnr5VKSba21lUMzC8nK5f8mBQ3dPB2a7dSMlbOV8qkE
 B6ArTygPgNdOdvhW5m054E/h+5+TA0FS6XAi1PB3rQaHPRTVd3AjgiG1vKojnvnJbm+HBGh5Gc
 J9c=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.117])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Nov 2020 16:04:59 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] RISC-V: Move __start_kernel to .head.text
Date: Wed,  4 Nov 2020 16:04:35 -0800
Message-Id: <20201105000439.1491243-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105000439.1491243-1-atish.patra@wdc.com>
References: <20201105000439.1491243-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_000550_814866_B9C9BBD4 
X-CRM114-Status: UNSURE (   9.65  )
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

Currently, __start_kernel is kept in _init while _start is in head section.
This may result in "relocation truncated to fit error" if _init section is
moved far from head. It also makes sense to keep entire head.S in one
section.

Keep __start_kernel in head section rather than _init.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/head.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 11e2a4fe66e0..45dbdae930bf 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -177,7 +177,6 @@ setup_trap_vector:
 
 END(_start)
 
-	__INIT
 ENTRY(_start_kernel)
 	/* Mask all interrupts */
 	csrw CSR_IE, zero
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
