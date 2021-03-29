Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F62C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:11:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D206192F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D206192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgCkveXcleZ29Gbp5mo7gsdXLTQAwCjYCoDTN472NGA=; b=cKb2v5/x5H1E7+
	F4tZj265c2Nsqcie142uMlHeOCW50np4D6uRuuk2QhCmx3jfaqOil7YPdLZfrwGl6I8H9vkoGJfTd
	b4KFu0L3JxCSYC/LKIHc/DFMikAqUyinVJeTei3LFzb/X1a98fKneRYk5BKDLMskX4Q5MJ1jqwG6q
	zdE4i9mA4XuL6msswxE2+a8a1Ni8dKoVur/OIFzxuhHSFilwCnNMIQQ2fOtV/FXGks6N0cEVG3udP
	8hlWzZrlXYCHvMxenjj7u+thCveykpI0nCZuW2xizGtOkYNukzlDeBWyH6cgztOpKr39m3ik0W4Ar
	zYYENiIkmaZWYLFL+0Gw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1yD-00287X-Gj; Tue, 30 Mar 2021 00:10:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQxJ9-001C3O-73
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 19:12:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55B8261981;
 Mon, 29 Mar 2021 19:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617045129;
 bh=Vc2qS5hN4gZcx9XVb4kiJ5C2Wd27YQis4mRFE/m1Yi0=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=fV1LNkzXGn9Mc3Fw6yeG1RGnwBl2WsKC+w4QRKp7Y6UuilQaL/ElEbExswvzSGKcF
 XRpur9mkXWS2+CYUagZyNrfQoHv2HvQPw84Zsxdd5ZHn9HQt3XgA0MtcWEKcdwxovS
 O9Ax0FSHhjwRz0OzabCYph24IIRRdY1UwvWt6kNzP31rEm1H2FnotG6oP92K3FUrZU
 PGRpPxvQfJ1HD4ik8UADPr+WNu9lEcCwGoBKXAm8buLNa17z3wFfO3By+hSjWmmDXI
 Hz7476i8jjwwRMvblxSGWQqp6y4TwfJ4/kFYZbLX4VRpTfxykg+llkwvg6WMKXPXci
 /yEQMAOLlKh6w==
MIME-Version: 1.0
In-Reply-To: <cover.1615954045.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
Subject: Re: [PATCH v2 0/6] Add SiFive FU740 PCIe host controller driver
 support
From: Stephen Boyd <sboyd@kernel.org>
To: alex.dewar90@gmail.com, aou@eecs.berkeley.edu, bhelgaas@google.com,
 devicetree@vger.kernel.org, erik.danie@sifive.com, greentime.hu@sifive.com,
 hayashi.kunihiko@socionext.com, helgaas@kernel.org, hes@sifive.com,
 jh80.chung@samsung.com, khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, vidyas@nvidia.com,
 zong.li@sifive.com
Date: Mon, 29 Mar 2021 12:12:08 -0700
Message-ID: <161704512808.3012082.7539298875497991635@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_201251_548693_0085C5B2 
X-CRM114-Status: GOOD (  10.67  )
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

Quoting Greentime Hu (2021-03-17 23:08:07)
> This patchset includes SiFive FU740 PCIe host controller driver. We also
> add pcie_aux clock and pcie_power_on_reset controller to prci driver for
> PCIe driver to use it.
> 
> This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Radeon R5
> 230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched based on
> v5.11 Linux kernel.

Can I merge the clk patches to clk-next? Or is the dts patch going to be
sent in for the merge window? I'd like to merge the clk patches if the
other patches are going to miss the next merge window.

> 
> Changes in v2:
>  - Refine codes based on reviewers' feedback
>  - Remove define and use the common one

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
