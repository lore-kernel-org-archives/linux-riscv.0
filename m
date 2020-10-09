Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4921DC43467
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0112C2240A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wPbRCSdF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XUHSmS4B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0112C2240A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uveNxkAGHn86qitI/mCVEnGEsYrmU7oI9Ofi2ZLKLBk=; b=wPbRCSdFygZnhkBAJ5FL84Ieo
	rPL6M3/nBT9fqVNNSyb28fpdZx8b9/FnxQ+6jEALW2j7oKTLh4ywBIWxne9FhPEtOrPB9I4qFtlR7
	r0y/kGrbksM2XF4y6oPiQW1EKnZRfosW7S6Fy1I7iG2C0zXf0Zuna8bAYmyhSHDwdlXL6g48l3URf
	AvC6NxpEWDcfGLeVF2PLjgneYRN/yfQGYYapS/T0fQ1La90rRvEOvik7cliuGH4d6exYGcnp/5sHG
	4JsrVwgRjS5BJL9H7AQx5oVcIzeCdiKJyUOUhzDFsQ4iIbDOeodBxgwdkxcucoAMIgG2fEADGln1p
	juGhg8z2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQziB-0004mj-AP; Fri, 09 Oct 2020 21:13:59 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQzi8-0004kN-C2
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 21:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602278036; x=1633814036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/QbUqQmeMLjTwBzMbaBF9lCBuT7lct8fLe+m4vUDssY=;
 b=XUHSmS4BmrjOYDcZRZiytRQ8eDZPaU3+K1MCnWI0DK4c4Dau2yrJ6sCS
 FiXrGggvYrTn4jhaDV/MVIJtBzUmadrKjbVHE0PY6ZZ0A3wxKje77MbC0
 4WvKn5SiIyDp1tFmWI1uNzVwzuUhHJ2JR27rW5hLSijIItEEbmBp0ThmQ
 aoO73iT+szNEPk2PU1ErDWI7tF6zdBU6mlyDBkoa4y+HQQcn1ztGPb4rh
 RXzqDEPJvqEiaXmIQ0Qcgi/2tXMQBn79a2p090JjfWFrETyyB41YXWDwB
 SyguGUMnyNsDmGJvu1vcfRwzmNdn5i/NMZSgiQqMB4a9m9aUbznAsaSVX A==;
IronPort-SDR: iaJ3cgYsMRYvhb8kOmrEs//5vzb0YDslKp/cJqtendqpwTtq5lrjLVz0jfP1UnxxB/xz13QOQk
 QermcOtio050D7glUi5HO/R9XRk+9mCgs+1Gb6p5blRb8J/1Yzt+2HV+ry5kWOYJXhdvQyoAH3
 ZlFQxyLCNSs21XPeQq19ucyMls+x1X65SlLrmtcBiDGTbppk6zrtWyyxO5Z4/GTgGZSC5z6ID5
 GfUDbXSRLvhgRO2dJp3H/gZOczdImDFKFelOFTMO+iURo1vIZeOrfSx1RHiDXKrfVPDa3HMXyr
 xdY=
X-IronPort-AV: E=Sophos;i="5.77,356,1596470400"; d="scan'208";a="149406012"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2020 05:13:53 +0800
IronPort-SDR: gF0bHf8z3Z4uroL+T04r4xJtOP/DkKeAib9jbD5NlmJvhf9fmTINhzNw9NUsqv2lONuMFlAnCe
 tZL1lp6jgU0/MaTFIpxwLoH8xzBVFN8MPbmh+zd6kSudUOVwlsUUus8x+lFKunQSQSjy7Ee+ub
 KPsBtbgdFWdyOCZtxFwmqL4FxrrIu7ehprhs+NdDUZ9LLU/dih1eWoZNb9I8AX7a6YIbBlbiY3
 cYuywf2QrZ//Y4zNMIZbBlTKGalB2pm7bbwReb2zYGbelBT/mjkm4GkWNDWzcW/D3+XLwILpI7
 Q82cr2ugE9VtLTzvBwjwzUaN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 13:59:41 -0700
IronPort-SDR: DpNNZ5QX9GY5e4Dv4bfNJw2Zednqrf5wkbR/vJKlJyg8CCbe3aBt1YYFjjIY93YGNCX/Bv0hD6
 OMi72XUnj78eYponFLeyS5CjqiV5CyauHbxPhIoGTODjsCGH4pu2DKx6MI6AWzyP17Q283EfiZ
 s/xPfPLrNk3M5jA5RtoLPgHW6XEOFTW774UAKVo3TBIUzQ4wbOHWeLuH0ryZ43idOgBb7cI4AF
 VBZoRioUS0iai5b8kyxfB3VVu4T8YtAeJFUAtqwAVlzkc/fl29HQl6TdpF6qqAkS717tWe5kkZ
 s4c=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.38])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Oct 2020 14:13:53 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] RISC-V: Move __start_kernel to .head.text
Date: Fri,  9 Oct 2020 14:13:40 -0700
Message-Id: <20201009211344.2358688-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009211344.2358688-1-atish.patra@wdc.com>
References: <20201009211344.2358688-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_171356_537299_9B2AF72A 
X-CRM114-Status: GOOD (  11.63  )
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
index 3631147732ee..e820b0c09528 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -178,7 +178,6 @@ setup_trap_vector:
 
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
