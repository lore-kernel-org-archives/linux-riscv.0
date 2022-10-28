Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864B5C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=49Ww2xWTAokjDc11gcwZIZ2QTyQMd952Y75MZ0BaY6s=; b=mNjZPRjgx4Z7FA
	7tIJyqXnPM9/Y8RJpBMlV/VeqzBhHxT3EJ3jjV302mbdRHX35D0rSteoIdVWYKQnk7pULIoPFIttq
	fZepUHdbnXx2tYGBC5ZfrgPb+jqvSFXrX3FAiCWopszxjzlVZX+FE6vmgoGR3Jyk5mWH4IIkPss//
	Zlov0ZZbYzjwlBbEn1mzsuQZAevqK5hrmBC1wj3NqkfS45XlijpiYBN4Q7eN9A1h6vgzqagOdkDdX
	9+14yGB/QAU4/bVijNrc20Cfs1xuseBRkkjatMQYvXxExRuXOt7JoYwgcdOv1TRwnETVEYuGCTZiZ
	A5i3jMJFUI3VRFW/cjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMD6-00GVrh-Ck; Fri, 28 Oct 2022 10:03:32 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM6g-00GTLq-Q9
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 09:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666951013; x=1698487013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BgN+8iSWd8cYylvYK6FRliQdJ8AUyo6BZ6FMoT0gJnA=;
  b=drj5pelbVZcd4bpJgo5LWJbjGl3GM8/liMVZFj7tZsXOHmSSMTZTdV0+
   me5xIFWYX96UlX8ZUZJ+uhZ6oFf9P7IndRAcfsuFzkeV3D+13QhdO0Qaj
   XAUXfikd9/FiyIpRyaXGBubamGmRfU0qYavTeQnYwHPvBIy7si3jMFRMT
   NfnoFSLAzxqPMap7QxmaF8hE8JIaTwvQtDMBnbXEurDiiCSnXM0I30iTT
   KoDTyYyUTW9kVHbp6yCyN1LvHAhIyUXWGGIRNcJ7WjS0u20ROkWtYBymj
   ZryaHJ/JETycRvRBWtB65c2Oo3JRm8LOOOd4jiCv7269n5SsVlpTurAKi
   g==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661788800"; 
   d="scan'208";a="213258366"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 17:56:51 +0800
IronPort-SDR: aT0zW7CA4glHXCfr4lnjHey8aCYqcy64Cs+0MH+jLyQPzQVfKUyXK/nrg0r8gWp4cCB6mrOOKX
 jdWOJ7tvOJU5tyrhRwUWGpwkBQd4R6I/kftuKCBAC2y3/MYd1rY0DI8SA9El4cSz65Dqduk/yT
 b+kLMPn35OJjhpVGTOQwPbbnbjzlXCbn7wrMybCJYJP/fLf5B+3YI8DmaHh7zSlGDpLDK30M+U
 Gxgya7qvbBDxEVDk4OHhWkYrGm+Y8X7oobvGfYSHdJUc+yoWt0+N/oRtmOfiOlEeUPBEAlo4rB
 u2R6n1fuhd64EHKo79QmeqTK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:16:11 -0700
IronPort-SDR: mZl+oppFguOETZu6R4I9Wegwia0jWhGkU9zCg6pkVipAR2AMXGpNjhPMGRfZaD0lLTA/Leg6LU
 PW266sjnOs9v0VhV7MrToBqSQo8s7Xh4cNOGpUBgqLErUQYKnabzOVwMXan4yxEza3uLx9XmSn
 PV+L6ZozbiUFnYEwYAS/yySaPa4MvzeLrHiTl07x+HvQ8C2TPOKA2ecl1Zyy07SkAA35R1VHA2
 ICGvExxxJ4QmllR3nafLrRMzvvqu0oC8Lp0aAzZJ/rU2PJ7g0Zo+SWFyA0x8U5AfN+Q0SPJs8D
 a08=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:56:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MzHy81Gmkz1RWy3
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 02:56:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
	 t=1666951007; x=1669543008; bh=BgN+8iSWd8cYylvYK6FRliQdJ8AUyo6B
	Z6FMoT0gJnA=; b=TZ/OXYWLpzrktMUlmpuxX7nmfXmcysrAOvOIeAA1P47SDEME
	Nsn2uJB1Y0bVuv4nsVqqMQtvDSHF+qWcMATpJCHCqUxLLpMZbZ0ZHwAe0sMab+jB
	bD22UFay3FckIrC/gdGxKnpmvxj/nqNd5Dsl+/2XKcp3cw3sW0vgQTsT2xkXxetb
	np3kwK7Ayi8YwQVP2E2USwhd9PxIKFJ0INBvbADG87h/cH//n07GMQOKNZW9aeaI
	V2JfFboZtJ2Rtt+fRP8x8qMVenHmiBo/WtAvN+z7awVWooGLZ41iGxfdnmPePVYx
	CeReqy8D+9jHC5tJ2lhcBo7DxVReO/o6qw4MzQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IAkxBefJnJmx for <linux-riscv@lists.infradead.org>;
	Fri, 28 Oct 2022 02:56:47 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.50])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MzHxz74RDz1RvLy;
	Fri, 28 Oct 2022 02:56:39 -0700 (PDT)
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
Subject: [PATCH 0/6] Fixup perf tests for 32-bit systems with 64-bit time_t
Date: Fri, 28 Oct 2022 19:56:26 +1000
Message-Id: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025654_951943_EC239424 
X-CRM114-Status: GOOD (  12.23  )
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

This series aims to fix perf for 32-bit systems with a 64-bit time_t
(like RV32).

This series also adds a public futex waitv syscall that userspace
can use to avoid this complexity.

This series hasn't addressed the build failure pointed out in:
https://patchwork.kernel.org/project/linux-riscv/patch/20211209235857.423773-1-alistair.francis@opensource.wdc.com/
as I'm unable to reproduce it and unclear on how it can be fixed.

v6:
 - No change

Alistair Francis (6):
  perf bench futex: Add support for 32-bit systems with 64-bit time_t
  selftests: futex: Call the futex syscall from a function
  uapi: futex: Add a futex syscall
  selftests: futex: Add support for 32-bit systems with 64-bit time_t
  uapi: futex: Add a futex waitv syscall
  selftests: futex: Use futex_waitv helper function

 include/uapi/linux/futex_syscall.h            | 119 ++++++++++++++++++
 tools/perf/bench/futex.h                      |  52 +++++++-
 .../futex/functional/futex_requeue_pi.c       |   2 +-
 .../selftests/futex/include/futex2test.h      |   3 +-
 .../selftests/futex/include/futextest.h       |  60 +++++----
 5 files changed, 206 insertions(+), 30 deletions(-)
 create mode 100644 include/uapi/linux/futex_syscall.h

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
