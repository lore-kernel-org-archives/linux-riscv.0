Return-Path: <SRS0=Q8j1=OA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A9BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 19:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46774610C7
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 19:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46774610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjfpE1x0osveSTpJ31jaWvIVKIFd4vYJy5lrUV9C5mg=; b=ADLe5qXTjhsAQO
	rGmpZTPoontws/N2xWs50sa/TwCvwYWAGkMmVboXNDKY+x3YcZCzkpV6MO1+r4sXCOrdBM5LyNznc
	fbMUNpDu/GXQN6zztN/+XrZusRwhZi1y90hy8Kje9VMkPT+0XQtt67OWCr652pmHJmgp0VsqDIxva
	u9sYnA8W5c457gTXGYAELckeyT3bnHS3Db2OLL0BIPCNO0AMcn+2WE/5kftwmG5VlgaCIxQfHX6nL
	ppmclpg29Qj28drGN0tdAEtbJcPMIMz2tZZFRlTC5Fpw/JcY6YPL+OXQwke6HbgkZjz2WRiXKaHCC
	tDRhVxAvZ65ZddZ+tj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOmCb-00DZuh-H1; Fri, 10 Sep 2021 19:28:45 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOmCK-00DZgi-Q4
 for linux-riscv@lists.infradead.org; Fri, 10 Sep 2021 19:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631302108; x=1662838108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DAp64paU3TCuJOhu7apCE+cFKSV+lH5b3Cp62qoHD/M=;
 b=KEwQwF8EK+/ArYtdX69P9ZBTMiV99It5ToIt4wwYqaLR5d+GUPTN/R7d
 hev1B0WrfBPGMHdvL43GTXboOboSPsmtDZu7c/Zo8jplQmQxk89akLTfu
 dCBmxnJG6SJKbqBN9A/XqyGNOfQ+N5VZTTV3Kh1EVtHxyt2IFcP9/vKB9
 9v8n6vXw1K7/dr7I2lrYU1AF7Rus4BISl2XMjuxNBlP8gcoJUL/ZmvezS
 5fkkfrwxC7iADeVHTX0kwT3WhNtYZOVoWbYgxeGr7fVYwtckKdYosb0Cn
 nTFwdD3Cfuj0ysoqx+ZF/D5kPZCuqnp/XvWrn1LYxjfma7EZ+AEAhz2qR g==;
X-IronPort-AV: E=Sophos;i="5.85,283,1624291200"; d="scan'208";a="283504204"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2021 03:28:25 +0800
IronPort-SDR: TN89cIkSxs44CQ+iAUx5w+JlE4kb1Npq6noLnzIrB8yfD4yL8MWRTIOE4TO5y1SFYbiczNmq+g
 dgc1CBTlg90h10/x/0NAasjip97XBO8tsTve7cN5vzOLaY3R3a59o2dI3TZbyDzWiK6rCDGxMs
 PdgpHgQ+3QI1cHyufwNzfPGMFAknp2tRQAKmAv7UlVZTcmO5trMaztjnq0KicfBaTgR8UjS6Io
 Po5N1uLsMQIvg1WxnMX60957BReuvEhiaeC948csfG10hptAkUyNi/a26J2VFQOJmjTY0/scip
 0n8wPgWsA2AyRU3dbC+P8T8Y
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 12:04:55 -0700
IronPort-SDR: Gp6nfrIAxPnXUZWBQE8ZGO4hoQRY+xfQh7dd87UsREg+elLIcD6Iov/il9cDNn8EnJdndekvqB
 DEbII0uc7YtTV9d5KSVzCDrl8GyjA0NUplaCtybKXKPAfhubO174mcFEqvbk3ckLiuiUMmTuFe
 6GHn2iLGIAGriS3Zr6eGFL78P9oBvENYSoYbgCCCjXNSOl8Mww+xu/8VM2sI9cx33N4+gzjZSg
 /GwXXH4i1FcSgdYrpWhqg4xN3mkce+RY7Hb8pQUUTn7KHiQKztMOly/ITcwOEmLLWObpRmrjSx
 52g=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Sep 2021 12:28:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, devicetree@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jiri Olsa <jolsa@redhat.com>,
 John Garry <john.garry@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [v3 10/10] MAINTAINERS: Add entry for RISC-V PMU drivers
Date: Fri, 10 Sep 2021 12:27:57 -0700
Message-Id: <20210910192757.2309100-11-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910192757.2309100-1-atish.patra@wdc.com>
References: <20210910192757.2309100-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_122828_956593_74F6BDBF 
X-CRM114-Status: UNSURE (   9.93  )
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

Add myself and Anup as maintainer for RISC-V PMU drivers.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9af529acb6a6..6a184a4162b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16056,6 +16056,16 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V PMU DRIVERS
+M:	Atish Patra <atish.patra@wdc.com>
+M:	Anup Patel <anup.patel@wdc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	Documentation/devicetree/bindings/pmu/riscv,pmu.yaml
+F:	drivers/perf/riscv_pmu.c
+F:	drivers/perf/riscv_pmu_legacy.c
+F:	drivers/perf/riscv_pmu_sbi.c
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
