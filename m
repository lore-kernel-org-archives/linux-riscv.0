Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB916C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmCNIwFMal9IusRHgGtMNtiMf+EW+pTV7vXq3Ng99SY=; b=CFZRpGoyAn9jJA
	9KtVYmJsg5d/+NEpBdjlWOAmx39GMjjOpUzTEdCmM6vqs71w5gI/Bb3xphbW32FRoRURDWWjvuXaM
	xdvkKkiAmI5CY7U9obAwwMwLsRtcMG9GUsKTTmV4jd+qVbGmvv6+v+CxVTarjvPOvdRy7EwpMf1fJ
	kjvjF3Pvg8r+ljQ4xH1HAaWGmkE9soYxWn+sEa+YTTPI5EIGrM5RuCW+nhXhrM+PGrsWRsLZvcm7K
	LUd8r++YyHBjH3XkRw9RfpLfRGeDoBVwVDCfm7S3G0OF2sX7azJkErgzfgukMo2vTJDmxHcp0pDZa
	v4IWCaV61wrsEkhvS2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVETe-002Gh5-7X; Fri, 18 Mar 2022 15:25:18 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVETa-002GfB-QF
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 15:25:16 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nVETX-0001qa-OJ; Fri, 18 Mar 2022 15:25:11 +0000
Message-ID: <82efacaf-9dcb-f07a-dc2b-06668b1a745b@codethink.co.uk>
Date: Fri, 18 Mar 2022 15:25:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] PCI: fu740: Drop to 2.5GT/s to fix initial device probing
 on some boards
Content-Language: en-GB
To: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20220318152105.525824-1-ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220318152105.525824-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_082514_882455_07AB23A1 
X-CRM114-Status: GOOD (  13.35  )
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

On 18/03/2022 15:21, Ben Dooks wrote:
> The fu740 PCIe core does not probe any devices on the SiFive Unmatched
> board without this fix (or having U-Boot explicitly start the PCIe via
> either boot-script or user command). The fix is to start the link at
> 2.5GT/s speeds and once the link is up then change the maximum speed back
> to the default.
> 
> The U-Boot driver claims to set the link-speed to 2.5GT/s to get the probe
> to work (and U-Boot does print link up at 2.5GT/s) in the following code:
> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c?id=v2022.01#L271
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> --
> Note, this patch has had significant re-work since the previous 4
> sets, including trying to fix style, message, reliance on the U-Boot
> fix and the comments about usage of LINK_CAP and reserved fields.

Apologies, it seems I forgot to do "git commit --amend" on the last
file save. I've now sent a "V3"


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
