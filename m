Return-Path: <SRS0=SgWD=ZD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70558C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 17:20:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421852184C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 17:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nXuc3lbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421852184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=325IfQVpDY37Jq1fQhqtQqXvVsfIFHHBtkdzVBbKLVo=; b=nXuc3lbOrtg2Fj
	hqQaQKARV69y6UHL1/EChn0B2XcaEmGRwww4YepOEEorpdcBaUlDCumDig93mfVM6m87k9WWhtej6
	hwdrLEQDKiEkfZAuLcZElhNKAbdnW1zh+WvSiKE42E3M/Fp4JxNZ3vGtD8Zk2AMsJo/v1hRSg812d
	9XnMYib6LfzwA2RHGRJA/+GyBFwHZ8TYyxv1cgt6agSANQ3ebW5tXPYJctV3ofXOKe4F5ps+G3NzK
	MXZ84F9QskjmFxBVHGJdHDDP4wGT1Umn5To4OPg9Uc0tBOiYwJjx6lbSwZPpE3b5nMThYU66eTjZF
	WH9tgg06FcDwGVEFawjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUDMr-0006Hr-Ds; Mon, 11 Nov 2019 17:20:45 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUDMo-0006HK-DO
 for linux-riscv@lists.infradead.org; Mon, 11 Nov 2019 17:20:43 +0000
Received: (qmail 588 invoked by uid 1019); 11 Nov 2019 17:20:41 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 11 Nov 2019 17:20:41 -0000
Date: Mon, 11 Nov 2019 17:20:41 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: QEMU RISC-V virt machine poweroff driver
In-Reply-To: <20191111161217.GA19157@lst.de>
Message-ID: <alpine.DEB.2.21.999.1911111717320.32333@utopia.booyaka.com>
References: <20191107212408.11857-1-hch@lst.de>
 <CAAhSdy3SGAkOFMhx320KJdPDh6c=qcKqCZ=qrXNKBGtejpZwSA@mail.gmail.com>
 <20191111161217.GA19157@lst.de>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_092042_525869_75384E29 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Nov 2019, Christoph Hellwig wrote:

> On Mon, Nov 11, 2019 at 05:06:24PM +0530, Anup Patel wrote:
> > We really don't need this driver. Instead, we can simply re-use
> > following drivers:
> > mfd/syscon
> > power/reset/syscon-reboot
> > power/reset/syscon-poweroff
> > 
> > Just enable following to your defconfig:
> > CONFIG_POWER_RESET=y
> > CONFIG_POWER_RESET_SYSCON=y
> > CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> > CONFIG_SYSCON_REBOOT_MODE=y
> > 
> > 
> > Once above drivers are enabled in your defconfig, make sure
> > test device DT nodes are described in the following way for virt machine:
> 
> Oh well, that is a lot more churn than a just works driver, and
> will also pull it dependencies like regmap which quite blow up the
> kernel size.  But I guess that is where modern Linux drivers are
> heading, so I'm not going to complain too loud..

The core issue is that putting random register writes in DT doesn't match 
the hardware.  And the doctrine with DT has always been that it's supposed 
to represent the actual hardware.  On FPGA bitstreams or ASICs that have 
the teststatus/testfinisher IP block, there really is an IP block out 
there - it's not just a bare register.

If you update your driver to note that this is a SiFive IP block rather 
than a "RISC-V" IP block, I'll ack it.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
