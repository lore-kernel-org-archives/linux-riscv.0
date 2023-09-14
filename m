Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01141EDE99F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6skJ8rYengdkGy4gHGDel41HVHHSuRKaXZAhapvcv/Y=; b=wTqYkb6aLGWJNh
	JGFdmoMYpddTxDu8xnMdaxulf+fgJd+xtMZUpYGDZJfMb543m+dn9Hh970oESYjJVv5cPtLkjQcTx
	G+bZdhRBC5ckiEjiHzwQbXTkYtQYGGEy7lPPfvxv9YGmybkmZ/i8EAyz9g/z1mflLqSzlgaIMBclu
	ahP/3SiK7p7KKQHFzBcHVsuScdEIM4P0nbAzBiIEGM5dal3nKjBo03P+BPKJtJomO4FQoLQQv1AmO
	NoY4JbTIqb1OyAbVDBTYNihngR30fCtgt2gbvS38hzIbVIdlJxzd118UoixkbplujLjatjvwTU6qQ
	2Buk+RoZ7fJ7dptU3LYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjAF-007uSt-1W;
	Thu, 14 Sep 2023 10:01:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjAB-007uRi-1m;
	Thu, 14 Sep 2023 10:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NWYclCq21SD5zRFkefDJZFQ2FktRA9qrrbGwyrLJzCg=; b=Fh+T7vPQTOfZeLuGB3lBWXQx0J
	r4MQTwJYLAK4DAwUyC+9XbqxuM1qLsNj64vQU8PioYb2SumU0rcZpqLjHT41sEk5UkvgOIImXq90B
	XXq+k/8iS3mxW8iucyUVpFPWRoSCia/vBHMJLUi2M22IMkUtaRs2196D8Spb6zqk2kOeLIaAMKKHb
	yMQ9G2/Z/54rB//2TQ6eTvc1e7ISNEzqLEu+StA9oHDBVfNAd2QkQraURtILwjS24f5LmV1SAWbcE
	IcKsKNDseeRhjDmL4OPs69kiNrPpDv8B9Jj5EU/SqNEUGzjpCKklkf8pjZIAN2qDc329ZpFynpPJt
	bB1hOCqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37316)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgjA2-0003qN-2j;
	Thu, 14 Sep 2023 11:01:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgjA1-0004ev-DQ; Thu, 14 Sep 2023 11:01:21 +0100
Date: Thu, 14 Sep 2023 11:01:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 08/35] x86/topology: Switch over to
 GENERIC_CPU_DEVICES
Message-ID: <ZQLZ8XcZrwiDfABm@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-9-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-9-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_030131_591604_C66CEC38 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, Sep 13, 2023 at 04:37:56PM +0000, James Morse wrote:
> Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> overridden by the arch code, switch over to this to allow common code
> to choose when the register_cpu() call is made.
> 
> x86's struct cpus come from struct x86_cpu, which has no other members
> or users. Remove this and use the version defined by common code.
> 
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.

I think it should also be noted that this moves the registration of
CPUs from subsys to driver core initialisation (before any other
initcalls are run.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
