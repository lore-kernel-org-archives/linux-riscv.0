Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08360C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 05:11:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A726613CD
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 05:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A726613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version
	:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	From:CC:Message-ID:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lXhMtG1bnX48Nfd/05A09mC0WXd7J95MvSpo1XT/CLA=; b=oI+Nu2Y9YvZJdP
	D149NNSweVV2v3wlr4x54yk/JX1XguMUywcjM4Z79AbF7KKLqByhfUw2YBL2I5YphjHkRvSiVo046
	pWqvfXeHJP15TdbLdIl7gGeNBu0dW/T/0Q9Rp5YeMAZwJKQRcjuNIQqT7SM0N+AYGGPVhm2DjFo0+
	qrQ6bqrhjJ7p9+pMtMq2Ipxread6SBX6eRNd2tmhlZwQ5/v3dcEMZyoZEVwREnTI1UC1k4k4OU1pG
	HloKS+okBd5KkMenzMXBRuKSzCYme3HL2sxvzrDKJAJUF6oPju20EuLwFw4QIAMUtJDUuABv3Dp96
	PsYjs0bieJss/BoggXTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZo5g-000eXv-5Y; Fri, 23 Apr 2021 05:10:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZo5b-000eXk-Cf
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 05:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=To:From:CC:Message-ID:In-Reply-To:
 Subject:Date:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:References;
 bh=wv06ln7jUx5RhDbCP3yp9Aqv9te0/cVOv02q2bnuehY=; b=A9CTqU0n/fLMESl7/2iUdv230k
 Ir1EuY0Zh7BPQXAZKeO+u4M90i/i2oNsxFB/tz6Ejw5Gek6P9dE/uZjtZr1Aw4fQ4/7C/0pvAa33P
 PEv/Dh396Y+G6W///bM5yfZ+AbgzcJef3nSVMgMGxAWNNHPcbLJ0g5kRQZuGnfzCDHA0u5DZ54jM8
 61MgRxBNMhS75dlT67jcFpQS4tgyOdZK8uRjuaYBEslfQHgjmeq95n3c47RavA9L3CYXBh4fi2ln4
 wQTWicHQHzLaLCg5Ar3a+rujVoFbL8fqQnCFFc8OAc9sgv//s7RkcO3S0ll3jUe1m7xuv1/rKKlKT
 TeQR9NSA==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZo5Y-00E9p4-8V
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 05:10:50 +0000
Received: by mail-pg1-x52d.google.com with SMTP id p2so18968560pgh.4
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 22:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:message-id:cc:from:to;
 bh=wv06ln7jUx5RhDbCP3yp9Aqv9te0/cVOv02q2bnuehY=;
 b=g8L5eXN96akk8Lkciek2Sc0gsTJvNnKVFJHZfByuKNxnTF709JIIdd1RvDUwe0Fotv
 uOrf1P0hSbehB0KgZ8nYI7bCZnuPK/WfGayN/8XW+ee3EOFU77ib+pPbhYPlf38BuLQI
 6iAoHlfMq91h33qEw7vJh72HvkBw10cAc+zsMucNTFDQulPKFsWaAieKVrIj30doGYEg
 x1/B0qDkMht91pk2+ny4eO2XXyd5qqJC9gIhfwpeKaESCT7M98mHALmsvu2MAUIkFW/8
 VNChTnpZreSFnuKDuzAlTgzvSy2JRMwW87dkQjuhELi3wdjFZFuX3/MuG7omwQXg3R0Y
 c56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:message-id:cc:from:to;
 bh=wv06ln7jUx5RhDbCP3yp9Aqv9te0/cVOv02q2bnuehY=;
 b=Y79hhyo7IotQs5jeqDojKt71DzxwsRUlRsJxmRKesfpvu9GY6Ki1f21SZNLIggTWJB
 q9YvjqiEd3iyIZoeMZuY7pevBJ1U0hG1YolQI/K/Fwyzx+2GveCmA7Es5ioGkraJFVXA
 /wYD44aBe6uOh6BpEK87lXi61GQLcVMZStKp+pVZixVzVw41FW2oBDUOt0dvAmfHQmzU
 Dp9VQk9SKCpKL0B6EEUp9KTNsBgv71oRzKPA0oUiYd7iDJWQVipZPxhxPgT98XT+VzSt
 3qvnw6u/d/AslefYcYwxP2ezAs3gMqR/LuoHrMo5RyF2KO3dbwtX9lxt7jUs9p5SprpW
 5ZhQ==
X-Gm-Message-State: AOAM530mktKZSp7b+Wbofew+TH/ilGMkoKNYux4pFlE0xqgVs0bAJG9L
 I+Du3LEGzRz6wgUJBZwDbsHI1A==
X-Google-Smtp-Source: ABdhPJxAXNMAM3pbHXlafBsbQ1tQ98EYr8RHKCZNVARlwL9Xm7cohhJFdzcmZgPH8Ggl2r6bDRvi5w==
X-Received: by 2002:a63:3d48:: with SMTP id k69mr2050932pga.239.1619154646285; 
 Thu, 22 Apr 2021 22:10:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id nh24sm3535434pjb.38.2021.04.22.22.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:10:45 -0700 (PDT)
Date: Thu, 22 Apr 2021 22:10:45 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 22:10:08 PDT (-0700)
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
In-Reply-To: <mhng-f3dd2202-8d2b-4e17-9067-c4521aac8125@palmerdabbelt-glaptop>
Message-ID: <mhng-41850660-4a95-462a-9b1e-33dfc67815a4@palmerdabbelt-glaptop>
CC: greentime.hu@sifive.com, lorenzo.pieralisi@arm.com, jh80.chung@samsung.com,
 zong.li@sifive.com, robh+dt@kernel.org, vidyas@nvidia.com,
 alex.dewar90@gmail.com, 
 erik.danie@sifive.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, 
 aou@eecs.berkeley.edu, sboyd@kernel.org, hayashi.kunihiko@socionext.com,
 hes@sifive.com, 
 khilman@baylibre.com, p.zabel@pengutronix.de, bhelgaas@google.com,
 helgaas@kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com, lorenzo.pieralisi@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_221048_367851_719A7F31 
X-CRM114-Status: GOOD (  19.03  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1485011171807859474=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1485011171807859474==
Content-Type: text/plain

On Thu, 22 Apr 2021 21:43:03 PDT (-0700), Palmer Dabbelt wrote:
> On Sun, 11 Apr 2021 19:37:50 PDT (-0700), greentime.hu@sifive.com wrote:
>> Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> 於 2021年4月9日 週五 下午4:54寫道：
>>>
>>> On Tue, 6 Apr 2021 17:26:28 +0800, Greentime Hu wrote:
>>> > This patchset includes SiFive FU740 PCIe host controller driver. We also
>>> > add pcie_aux clock and pcie_power_on_reset controller to prci driver for
>>> > PCIe driver to use it.
>>> >
>>> > This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Radeon R5
>>> > 230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched based on
>>> > v5.11 Linux kernel.
>>> >
>>> > [...]
>>>
>>> Applied to pci/dwc [dropped patch 6], thanks!
>>>
>>> [1/6] clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
>>>       https://git.kernel.org/lpieralisi/pci/c/f3ce593b1a
>>> [2/6] clk: sifive: Use reset-simple in prci driver for PCIe driver
>>>       https://git.kernel.org/lpieralisi/pci/c/0a78fcfd3d
>>> [3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
>>>       https://git.kernel.org/lpieralisi/pci/c/8bb1c66a90
>>> [4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
>>>       https://git.kernel.org/lpieralisi/pci/c/b86d55c107
>>> [5/6] PCI: fu740: Add SiFive FU740 PCIe host controller driver
>>>       https://git.kernel.org/lpieralisi/pci/c/327c333a79
>>>
>>> Thanks,
>>> Lorenzo
>>
>> Hi Palmer,
>>
>> Since the PCIE driver has been applied, would you please pick patch 6
>> to RISC-V for-next tree?
>> Thank you. :)
>
> Sorry, I got this confused between the Linux patch set and the u-boot
> patch set so I thought more versions of this had kept comming.  The DT
> is on for-next now.

I spoke too soon: this actually dosn't even build for me.  It's the 
"clocks = <&prci PRCI_CLK_PCIE_AUX>;" line

    Error: arch/riscv/boot/dts/sifive/fu740-c000.dtsi:319.20-21 syntax error
    FATAL ERROR: Unable to parse input tree
    make[2]: *** [scripts/Makefile.lib:336: arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb] Error 1
    make[1]: *** [scripts/Makefile.build:514: arch/riscv/boot/dts/sifive] Error 2
    make: *** [Makefile:1388: dtbs] Error 2
    make: *** Waiting for unfinished jobs....

I'm not sure what the issue is, I see an anchor for "prci".  Do you mind 
sending along a new version that compiles on top of for-next?  If I need 
the definiton of PRCI_CLK_PCIE_AUX from a PCIe tree then it's probably 
best to just keep the DTS along with the rest of the patches.  IIRC I 
alredy Acked it, but just to be clear

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!


--===============1485011171807859474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1485011171807859474==--
