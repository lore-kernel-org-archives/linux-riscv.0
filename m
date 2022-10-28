Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DA2ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVYLak33A1orWztOrN598rby5cfsQOyasSILaAm8B1A=; b=UE+gi1XUHnotWM
	tm7czvvoSy8/wDYl76wJGTuLOS6Lds84Tk6oOC/tg7bVP64+Wt81IgzxwEqHS0F0OY49jqpjCxQ60
	7LSLKqg0840BsTt9gVAaCumTLBtFYMSHCw/RzDVC5qNKAtTWB/xLpc4UhHd4R5Xys9YQXn6mKssNH
	qxHDHrSGVYUqEfx0UWfAGWHnHJpPqw52Y6HicSuYlG58a77VKzM0or+or16IXSqSnM5W94ex42LrB
	8GH54ZB9nbFTwsjwR3jKpROLigzYqWe3laGc/wOb2Jbu6CbvUnsqP8rRAJ9GsByaV+UfCR7l4/5U+
	5JwfaIcAh7fY/adBzW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMG2-00GXKc-Ac; Fri, 28 Oct 2022 10:06:34 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM7N-00GTfM-DM
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 09:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666951056; x=1698487056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JydiMbJm91qt7Dzdbzqgf9FuIhgVG9u78TP21lC8mbE=;
  b=BVnrFIl1Ebc1HRak6ydpe0JHAntexjYW5PDLD8sIe74JZ6c4QW6e43Sg
   GKe8Z6Y/eP7bP/sVitVOcqh5Pq6L1oi/n6DochRkaeKzURESHVimESWzM
   I7a3gGynvN/L6U0YrCqvaWCoihK+GuXLu/5R1gH4+JOvOijbx6J9lhxQU
   ltrcwADgJ1NNuSTCx6SdHm9VHj5heK3syGjZPhqe7JU/UVdwq7E4zc9Eq
   R+BkWh6KxUw4wBY8NkgEbfOHy0WKldY7bejVinKiCLRh4bNMxVqdIhOSj
   XWwiazNQnFhqOWjvPVcsBLLwwRIHpFARKW5bf1bJNSlB97El6hWIN8pTa
   A==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661788800"; 
   d="scan'208";a="213258419"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 17:57:36 +0800
IronPort-SDR: av+dagjkY6EkFnwBppv4ckRXe6zZOONdwBq1darThD3XBg7Lcq+XyZxdS/1MTL8816ggqZ872+
 n6PfJ3M4/iQR8/Cu7V+pdj2F1OtiguB54oVUnbBcYDeFnTV66wVKNwPUVMlEDvpmhD2VTDaAjk
 af/MsRJh9pA3wWuUtEI6r5kMD8T4eAiJ1LZGfVFoVas7BwdepEvZxqFrnGAg8DyTW8FQ6KhW4m
 hxKQ3opH8dNYK1p43v66gTEXFlJFquTGeOjqQmkebCwV7BbyfH5WF4ZnxH3qDKsyyt666QPG09
 ZiQ5J621PYMJ6Tj4QtAoa0fy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:16:56 -0700
IronPort-SDR: Ufi+IF736FoO6ZywYMfrwn/UnA7ZubsCn5rgVU928LkfO/hRRLP6WN7rMXeTZ7cEIAZncoha2M
 cKaZdEBeB5QsxCjv7Aj9DDD38NNeWtvnHAMlaoHuGhBLKxiw6aDORaKlNqH1vPpAOO7yc1Ktxs
 17LqHdyYDtRhAZdy6dhVb+aMZVeQCssJZafe3p4urrh5ahHURzNQrUco2EK8iNFqhNV0OqX8Aw
 jX79hs6nrxSfX5OeraaoBQeisS3yfHgRpOqsiERBjHNmmAbYhZ7LBImFOts7em/fsPTX4Q6rwk
 VDs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:57:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MzHz45N2Nz1Rx15
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 02:57:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:references:in-reply-to:x-mailer:message-id:date:subject:to
	:from; s=dkim; t=1666951055; x=1669543056; bh=JydiMbJm91qt7Dzdbz
	qgf9FuIhgVG9u78TP21lC8mbE=; b=j4RPkeDxD2OMqX5Kxa/3L32kWsZVpnmHr6
	BX+yIlhNHMvGj8A/k3T1hWRpUdDmrQWD7bum2uaSPmy7PgQtfwWQh9jsrpx9aLai
	twJ3Qb4KRS3qMqAY5VyHySyh/tP8wknTEYHCs061Qq7tKyih2RzCagzYSo+nsAQH
	dvvF8wU4J247DKqVq+cPiysOHuqw5sByri8/ct5ZjmjXPD6smYx/xm7TL4i5AZvh
	i539ZC1YkSepuErIJctkmpHBUR4i5HAeJgJKBBDQ/doWP8SbVzFX+EErBI3DA9hF
	vGgkNwGT29RTkowIHP/Zy/Wu4zNaPL+MlyFdv2ud1IqiEU2U1i/g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Cfz6XwZHgA2X for <linux-riscv@lists.infradead.org>;
	Fri, 28 Oct 2022 02:57:35 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.50])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MzHyy43gyz1RvLy;
	Fri, 28 Oct 2022 02:57:30 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-kernel@vger.kernel.org
Cc: acme@kernel.org,
	dave@stgolabs.net,
	alexander.shishkin@linux.intel.com,
	tglx@linutronix.de,
	namhyung@kernel.org,
	jolsa@redhat.com,
	linux-perf-users@vger.kernel.org,
	acme@redhat.com,
	dvhart@infradead.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	arnd@arndb.de,
	alistair23@gmail.com,
	linux-riscv@lists.infradead.org,
	mingo@redhat.com,
	alistair.francis@wdc.com,
	atish.patra@wdc.com
Subject: [PATCH 6/6] selftests: futex: Use futex_waitv helper function
Date: Fri, 28 Oct 2022 19:56:32 +1000
Message-Id: <20221028095632.1081262-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
References: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025737_589644_2D39308D 
X-CRM114-Status: GOOD (  11.25  )
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

From: Alistair Francis <alistair.francis@wdc.com>

Use the publically exposed __kernel_futex_syscall_waitv() helper
function for the futex_waitv tests.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211209235857.423773-6-alistair.francis@opensource.wdc.com>
---
 tools/testing/selftests/futex/include/futex2test.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
index 9d305520e849..fdc0a0a270cd 100644
--- a/tools/testing/selftests/futex/include/futex2test.h
+++ b/tools/testing/selftests/futex/include/futex2test.h
@@ -5,6 +5,7 @@
  * Copyright 2021 Collabora Ltd.
  */
 #include <stdint.h>
+#include <linux/futex_syscall.h>
 
 #define u64_to_ptr(x) ((void *)(uintptr_t)(x))
 
@@ -18,5 +19,5 @@
 static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
 			      unsigned long flags, struct timespec *timo, clockid_t clockid)
 {
-	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
+	return __kernel_futex_syscall_waitv(waiters, nr_waiters, flags, timo, clockid);
 }
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
