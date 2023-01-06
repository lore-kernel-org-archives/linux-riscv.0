Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE40C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0Iy3pGkTbP7YEtOEBm4zDLDN7y50HXud45X8bgdAek=; b=L1ciyjRaDNXGYs
	wmYkURtdr4OE5x0Cydg2IGLThiUeYL83nEDcT69E7i7Mda3mthO0JBE0XPVsgpYzEjeYA3agKI5Bu
	bCJgiDnjIsYO/JwJ0XppmfgpSHx+JTwZchsi5qEIriLMhHTz4ez5RNONBpN1JUQJSsB9a02ZN8qtT
	kf6X944EXCv0sXO7eW5atrMMnR8G+Q7/f7/nLGRYhdqmK8EBZwWzw/6k0WNeAs5jZRWa9krzYLo+4
	Rw+c8blmhe5zY3y417Xit2eTHisL9rv3A7Zr68L3NrTuKeEONknJ4H5pbmqByfhEyAhRkxTYjxYlT
	qFCu380ZI7zxKJQCI9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDo51-008wf1-QG; Fri, 06 Jan 2023 14:52:23 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDo4z-008wdi-24
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 14:52:22 +0000
Received: from [167.98.27.226] (helo=[10.35.5.156])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pDo4t-0019kh-GG; Fri, 06 Jan 2023 14:52:16 +0000
Message-ID: <43d8108c-be59-c939-6d3e-d1afd28f7f77@codethink.co.uk>
Date: Fri, 6 Jan 2023 14:52:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Linux-kernel] [PATCH] riscv: dts: fu740: fix size of pcie 32bit
 memory
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: linux-kernel@lists.codethink.co.uk, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, palmer@dabbelt.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>
References: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
 <422275a4-b082-2951-71f2-04f33e036438@linaro.org>
 <b64bfeff-e1e8-02d5-0a7d-c2a0a905da5e@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <b64bfeff-e1e8-02d5-0a7d-c2a0a905da5e@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_065221_127805_51D064AC 
X-CRM114-Status: GOOD (  13.90  )
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

On 06/01/2023 14:51, Ben Dooks wrote:
> On 06/01/2023 14:07, Krzysztof Kozlowski wrote:
>> On 06/01/2023 14:44, Ben Dooks wrote:
>>> The 32-bit memory resource is needed for non-prefetchable memory
>>> allocations on the PCIe bus, however with some cards (such as the
>>> SM768) the system fails to allocate memory from this.
>>>
>>> Checking the allocation against the datasheet, it looks like there
>>> has been a mis-calcualation of the resource for the first memory
>>> region (0x0060090000..0x0070ffffff) which in the data-sheet for
>>> the fu740 (v1p2) is from 0x0060000000..0x007fffffff. Changing
>>> this to allocate from 0x0060090000..0x007fffffff fixes the probing
>>> issues.
>>>
>>> Fixes: ae80d514808557018e44190 ("riscv: dts: Add PCIe support for the 
>>> SiFive FU740-C000 SoC
>>> ")
>>
>> Don't wrap lines.
>>
>>>
>>
>> Drop empty line between tags.
> 
> 
> Thanks, will fix.
> 
> Does anyone have a chance to review and/or test this, it works for me
> but I've not got a large number of devices to test with.

I forgot add that if a couple of other people can check this over then
I'll cc stable next time

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
