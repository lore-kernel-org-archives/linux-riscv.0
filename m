Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC71C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59EC860C49
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59EC860C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjfpE1x0osveSTpJ31jaWvIVKIFd4vYJy5lrUV9C5mg=; b=geu+xSr1DAMjwL
	fFRxMOYFTVl2zDKBgWKS5xow7N0S8BW2CvDZXWSbNFjhsDpBC6TyPqIcG1JuIb/np67F1/Zfa0qkh
	wZ8hmlUM87K06gRrJ6g/XhidQsVns6XECvSpaE2+uisbaGdE1lqmPVfYOS6qbKVeuD2faufugbsf4
	FUalfzXpyEsLVz00S5zTzxivt6lfVeQgxxDB//6x3cw1aPmHToBCbvnAG1Tkw0ynygvwamR8Hxp/5
	VHpXKoEvz7JcAk3qHH48CNza1z2ma2groLuIzOUGFsMKYKyr9vw/7RyXdWz6UdG5fo8GIIH2ajedo
	0UBz4RrS76ooTZdf1JMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf63E-00HVdV-8u; Mon, 25 Oct 2021 19:54:32 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf62n-00HVBf-PR
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 19:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191645; x=1666727645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DAp64paU3TCuJOhu7apCE+cFKSV+lH5b3Cp62qoHD/M=;
 b=rpH2OYZZLamIRbJUulzUfvTITxsovjQYRWNkMGTc8Hd6PjqvsP6ZTjKo
 8rzAyea6Te+S/g9Kmb01cwol08SoaKuEB/JruJ+D1kFQYtqyxrkAmHgzS
 Ec4U1Lgd+yxUY0vF0f6geUJqcwUnUXKfccIgdUwl2XDz32vqOYYhJyy8J
 BlBHUJHNPVYk5SStEYlHdwTJdegR8TjgYV40qQwCS5P+f5xacHR4NGk4O
 Z2XNlOtRhI6U2f5PWb76heKDSW2NVtuuU4L7wV5sOeoIiNCaFM7GLXVOy
 +r+NGRbMLVPEXyvLYRp/FUeHQsUeEIxqnAZihxt1jcgVZBLEQMQswcksu w==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287682874"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:54:00 +0800
IronPort-SDR: SAgwOvH19Bn+I+fit1yna+agqIggK6WLDbtA8v5tFmm5dH8kE6x/4CDA9F0eJGNiulQSReUka4
 EzPaw5aIazQVQjlykviZb7snMNOetQTL6R5tsXrJjjTHlSE+cz7zjARinEFKJ0UyWNh6BN3Mvx
 sdJya3qOposdwoy5QF7hHeU7apqQkdJCNSUSDrEMHQeUkq1/eyObB0YzOlS42lPYsmG++ITcn4
 yaJ9Tdux4cnWM5QDK8pYnyljeVPlcgmARKLpkffAPp9m7fYNEWIvHQwcGgsTk1RazWadoO68YG
 v8C2HjtChtQa9STRRDdKloIV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:29:30 -0700
IronPort-SDR: YhsfOcm7t5ZjUT2XWJ2dKLP9rQUY8bpvIdSwSlepuo+dw5pfP4Jjpr1dWnNabwZcsQ0PSc3VDZ
 qSqCXA4eG3rOesSHot/1r1IC25460Ko/uRSv+jPQgXGzz25iXCwXRraa3fkrS3UfOfsyxHfMz9
 pX2UTRfMTKKps882CEusquX8tgFN73mHPurk/oBAxkYU76olCsk5eddZNukU6vsBdasmYIA5Na
 gp1MZnvhu6nRCnPTpR02qE55EkgLgNpShhtqWyI5TKH2zKHYDLm8U/Z8KkNOI/t3ZkomcmlQme
 zsc=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:54:00 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [v4 11/11] MAINTAINERS: Add entry for RISC-V PMU drivers
Date: Mon, 25 Oct 2021 12:53:50 -0700
Message-Id: <20211025195350.242914-12-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195350.242914-1-atish.patra@wdc.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_125405_944919_A99B2689 
X-CRM114-Status: UNSURE (   9.83  )
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
