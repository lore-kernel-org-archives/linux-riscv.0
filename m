Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBDBC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:29:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AA761185
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AA761185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cS9UBjmZJ9jfxzj6AUHC4DMWKjzBAfPAW7+oxKSdmPc=; b=lnTMaoXocEbhS5WL5XSod5Vka
	lzDAGg4vHR04Wzr2c7QodVO8hzrcFr6umb+4PxviFZ2imAEiDHzc6UY3atB5hm04KBYr7brDjW57B
	ra9A4h10/qVSLi2Md3/Jcdc0yl54kmjUFDm1COTjr2ygXQ0ycffG+wNEqoeIWWq1DQJNIrZWovd4B
	jI9D+6NnNeF4MNw6cVtx0Zc5i3DkQNrEtRCat1XQuuVm8tVCULphW9vo8gVxqDPMjKZI3LiC4bzal
	0MJazBoOOuKt6FWNLS4zSfRGtHGppp63v1sYu+iQJIbaLkVsV2+b9BgZS+WwmUUqwrv5J6Ht7/U4K
	38Buf7nKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldtEf-00G5SU-1i; Tue, 04 May 2021 11:29:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtEd-00G5SA-5p
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VfYcnVU4MdwJhFkUH+NCeESS55eiaWE/Qpa45fYgsX4=; b=gU0XYJNBqjpK+/7TbrcA+qOrc0
 vI4EYnuNEZcnYYhupJI6r0+F//jPo5TCTNB9eYh1SH6V5F1V1lwHqifa2yM5i27RCTIfAVQrSd354
 7SqFitiVs4YgJGdinYtMGmVPzwNJl87+6+/aiZHIcwkmfliUgBDA7QlDZt6SJSPOzr+oDex6Su4oo
 DZS/m5SlNTbnXk8T0AvI99o1Ez3ILa54prtBdcRK/X/Z+THzPi4I1XfvtSBrX6Pe8nQ5bgnG35Uwq
 0E3rdz9tXMD2FtuyjHIx6PPea37CcdZ5w6BK576lkA1CYu3eqSWDRAodAjSSAOE0iZ7AyyDNi9Q3x
 9vZo5yqQ==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtEa-003vy0-6Y
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:29:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C159D6E;
 Tue,  4 May 2021 04:28:56 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.46.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 908CA3F73B;
 Tue,  4 May 2021 04:28:51 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, hayashi.kunihiko@socionext.com,
 sboyd@kernel.org, vidyas@nvidia.com, aou@eecs.berkeley.edu,
 helgaas@kernel.org, linux-clk@vger.kernel.org, bhelgaas@google.com,
 zong.li@sifive.com, hes@sifive.com, alex.dewar90@gmail.com,
 erik.danie@sifive.com, jh80.chung@samsung.com,
 Greentime Hu <greentime.hu@sifive.com>, mturquette@baylibre.com,
 p.zabel@pengutronix.de, robh+dt@kernel.org, khilman@baylibre.com
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v6 0/6] Add SiFive FU740 PCIe host controller driver
 support
Date: Tue,  4 May 2021 12:28:45 +0100
Message-Id: <162012762098.17915.18389066004997041156.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_042900_309582_6EC48523 
X-CRM114-Status: UNSURE (   9.05  )
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

On Tue, 4 May 2021 18:59:34 +0800, Greentime Hu wrote:
> This patchset includes SiFive FU740 PCIe host controller driver. We also
> add pcie_aux clock and pcie_power_on_reset controller to prci driver for
> PCIe driver to use it.
> 
> This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Radeon R5
> 230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched based on
> v5.11 Linux kernel.
> 
> [...]

Applied to pci/risc-v, thanks.

[1/6] clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
      https://git.kernel.org/lpieralisi/pci/c/c61287bf17
[2/6] clk: sifive: Use reset-simple in prci driver for PCIe driver
      https://git.kernel.org/lpieralisi/pci/c/e4d368e0b6
[3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
      https://git.kernel.org/lpieralisi/pci/c/2da0dd5e30
[4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
      https://git.kernel.org/lpieralisi/pci/c/43cea116be
[5/6] PCI: fu740: Add SiFive FU740 PCIe host controller driver
      https://git.kernel.org/lpieralisi/pci/c/d5f9eb3dbb
[6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
      https://git.kernel.org/lpieralisi/pci/c/dc69e229c1

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
