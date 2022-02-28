Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307DFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 23:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ge+Uin6sLA8U4N4Vy4f5yNLRlUvvI1FblUVvfjuZuA8=; b=fF+JjeZMVupplu
	SULEFGNpUM1y8FFTkVHEXk6mFQPYcVxW6OsEgcpYTcRRUFkA6ykwoIOhwTmx/o2gEoUFMHQjHw920
	OFCBT8DYNMYegqkCr4u/0MHBe2njw7LkPsrbNQr7d6KVzvJJCfietFm+vRkc9JVK7ScN7iqAEOX3w
	60pQ271TGK3gAkdkkXNU7pSfw5k/mKRvDYKVy/xOl9Tlh0INNNC/QJH475/93vVrJvD+kZaoJi7sS
	oJ/8Y/+OHfZcr8pkRFaxBDR8d8XY+II6AoY2rJSnqzFn+hWYd31odQRGJu6NudBh8cHc22uqPx4mO
	Jhlwkz4nAwqoqfLcPbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOpFC-00EMYV-DW; Mon, 28 Feb 2022 23:15:54 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOpF9-00EMXq-7P
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 23:15:53 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nOoo1-0002WO-9x; Mon, 28 Feb 2022 22:47:49 +0000
Message-ID: <023a2015-cf04-9673-8e8a-88fe88ee085e@codethink.co.uk>
Date: Mon, 28 Feb 2022 23:15:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCHv4 2/2] PCI: fu740: Force gen1 for initial device probe
Content-Language: en-GB
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Bjorn Helgaas <helgaas@kernel.org>
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220223205141.GA149346@bhelgaas>
 <alpine.DEB.2.21.2202232100220.27002@angie.orcam.me.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <alpine.DEB.2.21.2202232100220.27002@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_151551_311096_C1B357C6 
X-CRM114-Status: GOOD (  20.01  )
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

On 23/02/2022 21:19, Maciej W. Rozycki wrote:
> On Wed, 23 Feb 2022, Bjorn Helgaas wrote:
> 
>>> +	dw_pcie_dbi_ro_wr_dis(dw);
>>> +}
>>> +
>>>   static int fu740_pcie_start_link(struct dw_pcie *pci)
>>>   {
>>>   	struct device *dev = pci->dev;
>>>   	struct fu740_pcie *afp = dev_get_drvdata(dev);
>>>   
>>> +	/* Force PCIe gen1 otherwise Unmatched board does not probe */
>>> +	fu740_pcie_force_gen1(pci, afp);
>>
>> I guess the "Unmatched" board is the only thing we need to care about
>> here?  Are there or will there be other boards that don't need this?
> 
>   I wonder if this is the other side of a supposed erratum observed here:
> 
> <https://lore.kernel.org/all/alpine.DEB.2.21.2202010240190.58572@angie.orcam.me.uk/>
> 
> Downstream there's the same ASMedia ASM2824 PCIe switch whose downstream
> ports don't want to train with a Pericom part above Gen1.
> 
>   Of course we don't know an ASM2824 is there until we have successfully
> negotiated the link, so we may have to generalise my proposal if we can
> find a way similar to what I have done for U-boot that does not disturb
> Linux's operation.  This is because there are PCIe option cards out there
> with the ASM2824 onboard, so it could be possible for the problem to
> trigger anywhere where the conditions for the erratum are met.
> 
>   Also in that case retraining should work with the cap removed to get a
> higher final speed just as with the Pericom part.

Possibly. I have just been working on a patch to better force Gen1
speeds and then restore the config which is working on my Unmatched
board.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
