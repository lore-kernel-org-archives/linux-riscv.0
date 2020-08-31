Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C891C433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D30920738
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KPjPK9cN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ImDaDzcW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D30920738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SwWATvxs1z4oeALYlMSrtU1vWrS7u1c4tZmxj4osvAE=; b=KPjPK9cNUQz6NYw11yTyko5btG
	LfHBAFIQfASyw4FH816yOPtH0t3EuX+93S8HDpDxCiToTxlNO94nheMF/G68hKbRJ0yPQNQha8H0E
	5hS+7QCj/hwSf5gkthElXu3xjFBiRgUfUNePgEbS431LUR/WhL8Txm9ZVLOvj3bKvcBws1he1ZToo
	Gu7VWoFZyDVGelpfENLG9hzpYqaS8J9bkyblrpP60BVABZqnrA+D9ae0dVDag9i9PTcD3jP89ZMMp
	GMpE4/nwABeWg0mvyNJck/LzeFJSpZFJJJDDvA0nSwyznDlMu8XvZ6LK09utnP9jh0gsMIHwF6KjP
	JSay+Meg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCeKE-0008W2-Hp; Mon, 31 Aug 2020 07:33:58 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCeKC-0008Uv-0J
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 07:33:57 +0000
Received: by mail-pl1-x642.google.com with SMTP id a8so2630243plm.2
 for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2020 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZSVVlzCnMPoR4b5u5OMpuptMjmKI3KwnmPpyqImBpQ=;
 b=ImDaDzcWK/4IInTiJ2oAvPHYIu0YQryEKk/fy8tssE3Ltr6/P/ijFD4XLwmfExahz5
 CN5fnhgN0m5B8+MH0JbreZf6BD9Yg+H3nlcevR8kNTQr6KzmYYZ7dQ8lv1ZwRM6lS71q
 mahzsLLg2VX8y6ldWR3y1s4yARiNNr+ShIv0rDlrc7rW5pGN5Yq+v7VXGEgNHfasB5py
 HVDpl7am9OetRZL/psTh9wSMTeQAlNuSPDJ4rxteMNsDPKk6HbmVsaLgWJ/GiwLpo+ze
 aIYmdAikpsFMtYz1EWGjspUybSbavWuO0aiNUtM5e2IOH8D56JhwAYqX7HDJqqTQPD7r
 OQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZSVVlzCnMPoR4b5u5OMpuptMjmKI3KwnmPpyqImBpQ=;
 b=T3l6kn9PXgftcvtrNPrwTfwvMdpZDXpbDu23D06zSYm9nsx9pU5+yI2I6ak4i1uMIa
 dpmuTHgJowVNsxLvuiEDaPRvtKueM5QUa9XkA6o675lNdDhlOJ9X3J9WBDUsWksEWCWR
 xautImTld2MCLr8XTDDEsojUFtkiTPe3U94soIoZTbmaY+UE9cikSWvXqkRI1X5lb2Qq
 R0EWQJeh54v7IGrabUuvpx1rxB1xKY3zwH5CNO50d4e0sapnt2aJNFH8ckUjgALLR6c0
 IkXFBRlIBPdE13nJP9vgePAvDKSVz61eooe0qE72IKU8TYy7eiMEIrKR+QzS0eKDi9S8
 e2Bw==
X-Gm-Message-State: AOAM533M49MHhS3tLqdV/38MAL/wabhjaiYMVG4D9R0zGT02ZQpTpFJZ
 j2ILsraL0jZJwa8gZ0p32ELfgQ==
X-Google-Smtp-Source: ABdhPJwMVEHHX5MwUgGnmy7sotXz2c38b13YD+1A9xPCFVHxe7VjzTGF2tMmeWi8CszDKrNDK1Y9OA==
X-Received: by 2002:a17:90b:1098:: with SMTP id
 gj24mr235879pjb.55.1598859233588; 
 Mon, 31 Aug 2020 00:33:53 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id m3sm6065979pjn.28.2020.08.31.00.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 00:33:53 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Get cache information from userland
Date: Mon, 31 Aug 2020 15:33:47 +0800
Message-Id: <cover.1598859038.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_033356_183352_9DE93204 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are no standard CSR registers to provide cache information, the
way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
could use them to get information of cache through AUX vector. We
exploit 'struct cacheinfo' to obtain the information of cache, then we
don't need additional variable or data structure to record it.

We also need some works in glibc, but we have to support the function in
kernel first by rule of glibc, then post the patch to glibc site.

The result of 'getconf -a' as follows:

LEVEL1_ICACHE_SIZE                 32768
LEVEL1_ICACHE_ASSOC                8
LEVEL1_ICACHE_LINESIZE             64
LEVEL1_DCACHE_SIZE                 32768
LEVEL1_DCACHE_ASSOC                8
LEVEL1_DCACHE_LINESIZE             64
LEVEL2_CACHE_SIZE                  2097152
LEVEL2_CACHE_ASSOC                 32
LEVEL2_CACHE_LINESIZE              64

Changed in v4:
  - Check null pointer before use.
  - Re-write the code for readability.
  - Rebase source to v5.9-rc3.

Changed in v3:
  - Fix sparse warning: Use NULL instead of integer 0.

Changed in v2:
  - Add error checking for parsing cache properties.

Zong Li (3):
  riscv: Set more data to cacheinfo
  riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
  riscv: Add cache information in AUX vector

 arch/riscv/include/asm/cacheinfo.h   |  5 ++
 arch/riscv/include/asm/elf.h         | 13 ++++
 arch/riscv/include/uapi/asm/auxvec.h | 24 +++++++
 arch/riscv/kernel/cacheinfo.c        | 98 +++++++++++++++++++++++-----
 4 files changed, 124 insertions(+), 16 deletions(-)

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
