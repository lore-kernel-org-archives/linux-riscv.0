Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF20BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RzDH9/FK3iv464ak0+Oe11LNRb3RmyMBk+dd0ePc+rg=; b=4QnjKbR/aXcSeqtFbb/a3EToVe
	2+Gfiqggl/6/Vs733bJJot1RPYVL4rYwnBKGYxpXuq1Mkh9LdEHMPjfpcJNzU4GNWpOh6BhFpp0h+
	07s5LKX35iTGtwubHBSxFxdBB5dKK2pGwz/I6GgPKJnCRUtW3RtEP720IP4fbd04/TIaUfkZ3VpOC
	uIZseV4KJ3t8mdNyUvEji1VFozetXO8SVbt59rEjUp0y9lPXbyIFdu516arR0dr3DIdT3b+r6TnG1
	pfAA9K4FJiMGR7V5aMr4AQtTeimH6TCTU6ke5EQvvoM6Z3FPK7R0B2W7rI/RRFRimlZVg74h3mcUm
	hReNyA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na3UW-003sPW-8K; Thu, 31 Mar 2022 22:42:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na3UR-003sOJ-UK
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 22:42:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id c23so942736plo.0
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yv9Wzw03+NukkaSaVZZG3A+e/UbaRsd8qeLIgoxYYGI=;
 b=aLtSxaTzBBfLrrs6Yqf07PKFqBsmzaPzZr4oCPxsKElf8kiRNH12fyraf+9osQPlA6
 nWW0TdKR12qeZa5fqH+vC9HP/3odKQ6hI1oAxbayxR9vaf3F1KGyttkH5lX4i6VksxXu
 0xTvzKY3GYCmzhee9Cl/y5RMFqT1DmqCZRziWA8NF3naBvhnmTQWsjPxf6EmQPRB3k44
 yPQc8Z2d9rbZTnN7tnNdq3BqES9JSP/Gno/o8Rc1w4eD3F0uNfqj6mCScR/H9U9Xbbes
 e0CBI6ZpomHJG4s4WiA4H1eBQuW+kw1whOvqnA0jEoZ7imEhea5GKa5Uo6qClnjrplAr
 vJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yv9Wzw03+NukkaSaVZZG3A+e/UbaRsd8qeLIgoxYYGI=;
 b=ucvolDpe1LIXZwojRlNIP3ZT8NowPq0xHvvRSTKUBOgiXaqVuE5NPBPPpWB12h+g6/
 ceLewfpuyz4hyUBr1/PZ1QiVxB6g5UXjFqF6kmwoKo5sNG+z0730qSJGxz5VqLq6N4lb
 KOrD9dMXLpC/hvTa4clc8M1xToJGJWDbfTCtnEuTeh65FAIjREWwrooj3L9NvVqeBKx4
 qC8MRmRlSa3VJkJX1HNdRlMFf/bkFS54Ba3MSLWFI//KxQatRJx9djOFUbOYwE5jVBle
 s0dgztNnkdp/9r3aHmobWZF+LOeEkGNlSNMfK3o1M/dSmNx968YVxvBPoxfwXAFR2wu3
 YkBg==
X-Gm-Message-State: AOAM531pPC0ojZX6O9LrvjKdBLkGhX6UN+u1VUcCX0Z+kNA+jZJ0jakp
 CvOTrAcjZneJHLRsv5q+cESd2g==
X-Google-Smtp-Source: ABdhPJxnnPsasTSwvvvGeMWLk7XXYDekjDntq0m5UMM6IsliYxKEdKVMexqOiT84oCZZ+WVMGKn/sg==
X-Received: by 2002:a17:903:18c:b0:154:9ee:cedc with SMTP id
 z12-20020a170903018c00b0015409eecedcmr44211037plg.123.1648766522196; 
 Thu, 31 Mar 2022 15:42:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 u11-20020a056a00158b00b004fb07effe2esm510368pfk.130.2022.03.31.15.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:42:00 -0700 (PDT)
Date: Thu, 31 Mar 2022 15:42:00 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 15:41:57 PDT (-0700)
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
In-Reply-To: <mhng-c6a04a4f-1e85-49e9-baee-b56b0e78c602@palmer-ri-x1c9>
CC: zong.li@sifive.com, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, 
 geert@linux-m68k.org, bin.meng@windriver.com, green.wan@sifive.com,
 dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vkoul@kernel.org
Message-ID: <mhng-5afad1be-9b06-4cd1-95e3-c21605b9086a@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_154204_019630_7C938164 
X-CRM114-Status: GOOD (  22.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 30 Mar 2022 22:54:47 PDT (-0700), Palmer Dabbelt wrote:
> On Wed, 30 Mar 2022 22:21:56 PDT (-0700), vkoul@kernel.org wrote:
>> On 30-03-22, 20:15, Palmer Dabbelt wrote:
>>> On Mon, 28 Mar 2022 02:52:21 PDT (-0700), zong.li@sifive.com wrote:
>>> > The PDMA driver currently assumes there are four channels by default, it
>>> > might cause the error if there is actually less than four channels.
>>> > Change that by getting number of channel dynamically from device tree.
>>> > For backwards-compatible, it uses the default value (i.e. 4) when there
>>> > is no 'dma-channels' information in dts.
>>> >
>>> > This patch set contains the dts and dt-bindings change.
>>> >
>>> > Changed in v8:
>>> >  - Rebase on master
>>> >  - Remove modification of microchip-mpfs.dtsi
>>> >  - Rename DMA node name of fu540-c000.dtsi
>>> >
>>> > Changed in v7:
>>> >  - Rebase on tag v5.17-rc7
>>> >  - Modify the subject of patch
>>> >
>>> > Changed in v6:
>>> >  - Rebase on tag v5.17-rc6
>>> >  - Change sf_pdma.chans[] to a flexible array member.
>>> >
>>> > Changed in v5:
>>> >  - Rebase on tag v5.17-rc3
>>> >  - Fix typo in dt-bindings and commit message
>>> >  - Add PDMA versioning scheme for compatible
>>> >
>>> > Changed in v4:
>>> >  - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>
>>> >
>>> > Changed in v3:
>>> >  - Fix allocating wrong size
>>> >  - Return error if 'dma-channels' is larger than maximum
>>> >
>>> > Changed in v2:
>>> >  - Rebase on tag v5.16
>>> >  - Use 4 as default value of dma-channels
>>> >
>>> > Zong Li (4):
>>> >   dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
>>> >     modify compatible
>>> >   riscv: dts: Add dma-channels property and modify compatible
>>> >   riscv: dts: rename the node name of dma
>>> >   dmaengine: sf-pdma: Get number of channel by device tree
>>> >
>>> >  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
>>> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  5 ++--
>>> >  drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
>>> >  drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
>>> >  4 files changed, 38 insertions(+), 18 deletions(-)
>>>
>>> Thanks, these are on for-next.
>>
>> The drivers/dma/ should go thru dmaengine tree. During merge window I
>> dont apply the patches
>
> OK, I can drop this from my tree if you'd like?

Just to follow up from IRC: I'm dropping these from my tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
