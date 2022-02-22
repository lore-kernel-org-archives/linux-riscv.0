Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AECAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdQp/mAn4/3DsMohHa0rdKbeYLOpqpaBta8SAZRrCvU=; b=Bq24bsQDZu3Bib
	jN0f5zLAKJWLlfbFwVliIg3KFsYdsSDdmccmlakcMXzXs9YRVcqB++38kF3UywGqc/o0UNhAo+5aS
	VM6OzttbsKaltot5hq3vhLkdMem2Fg3TWOIqA0kR7CtfYrP0/MY6Qv2ihaj7+5PpM8RR9ZpPETtqb
	KmaYHlgBk0i6dIHDPPN+ijnI1V7p07X1SqVRg31b6/NzEvFhAAZqbMZPXJhSEffkbga/UOd8YM5HH
	LIaMPMljf7JuVH/sereyp31B8jNoc4CTjSvvYeRFB9+9hqKQR8dlalOO8r3k1miebEEXBrvn8ioFS
	qHNkYe8Fcn9sasz8aOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMSS4-0093w1-L6; Tue, 22 Feb 2022 10:31:24 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMSKh-0090IK-4q
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 10:23:49 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nMSKW-0005am-Cx; Tue, 22 Feb 2022 10:23:36 +0000
Message-ID: <48e917d1-c012-29bc-d3be-b9ccb876a074@codethink.co.uk>
Date: Tue, 22 Feb 2022 10:23:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [[PATCHv3]] PCI: fu740: Force gen1 for initial device probe
Content-Language: en-GB
To: paul.walmsley@sifive.com, greentime.hu@sifive.com
Cc: lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220221203803.1333012-1-ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220221203803.1333012-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_022347_249527_CE79FF98 
X-CRM114-Status: GOOD (  10.71  )
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

On 21/02/2022 20:38, Ben Dooks wrote:
> The fu740 PCIe core does not probe any devices on the SiFive Unmatched
> board without this fix from U-Boot (or having U-Boot explicitly start
> the PCIe via either boot-script or user command).
> 
> The fix claims to set the link-speed to gen1 to get the probe
> to work. As this is a copy from U-Boot, the code is assumed to be
> correct and does fix the issue on the Unmatched. The code is at:
> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c#L271
> 
> The code has been this way since the driver was commited in:
> https://source.denx.de/u-boot/u-boot/-/commit/416395c772018c6bf52aad36aca163115001793f
>

Apologies everyone, messed up sending v3 so re-sent as v4.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
