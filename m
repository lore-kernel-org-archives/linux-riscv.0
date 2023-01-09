Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876ACC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 08:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/dOCxCdHjRqnh4e06f7TdpKN5ckyzBwUns62KpPG8I=; b=id1d0H2Rjk6e35
	LfItnjOi0+mUYFTODHRoGYkkzoGGoSXzYBruBVFN5DN7AZlmgGaoMAkWcx0bhB9pm7DvdM04XVqZ/
	gZUIq0JRTHo7/TcvDUq5UtIKWsFjl2lSI+m1UwFSyS3Z+iRdmZsdM+Ga94vbJd7R2cjzLfddVhwSd
	/+Rji6+WTkre8b93E5hjsA8jgUcl1jxhzcYU5GVxys5yz6Q7AEKW9GZHYiOVzNTfrfysszE+qtE4+
	CJwgTUx/mxbL14JiV82rewk1shXvHph5yATeczs5p4yf2aYFrhGeNTY65+VCnOf9nQiy+VduJ4/Lz
	2bjkwFJunalUzmYCgIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEn6x-000JTT-Vb; Mon, 09 Jan 2023 08:02:28 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEn6t-000JRo-En
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 08:02:25 +0000
Received: from [167.98.27.226] (helo=[10.35.5.156])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pEn6i-002B9T-9B; Mon, 09 Jan 2023 08:02:13 +0000
Message-ID: <2b544772-8ff6-1b8b-05b8-7864f0e9bde9@codethink.co.uk>
Date: Mon, 9 Jan 2023 08:02:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] riscv: dts: fu740: fix size of pcie 32bit memory
To: Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
 palmer@dabbelt.com, krzysztof.kozlowski+dt@linaro.org, zong.li@sifive.com,
 linux-kernel@lists.codethink.co.uk, sudip.mukherjee@codethink.co.uk,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>
References: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
 <167311996687.855922.17515622188982373442.b4-ty@microchip.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <167311996687.855922.17515622188982373442.b4-ty@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_000223_522446_A16C87CB 
X-CRM114-Status: GOOD (  14.84  )
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

On 07/01/2023 19:37, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Fri, 06 Jan 2023 13:44:56 +0000, Ben Dooks wrote:
>> The 32-bit memory resource is needed for non-prefetchable memory
>> allocations on the PCIe bus, however with some cards (such as the
>> SM768) the system fails to allocate memory from this.
>>
>> Checking the allocation against the datasheet, it looks like there
>> has been a mis-calcualation of the resource for the first memory
>> region (0x0060090000..0x0070ffffff) which in the data-sheet for
>> the fu740 (v1p2) is from 0x0060000000..0x007fffffff. Changing
>> this to allocate from 0x0060090000..0x007fffffff fixes the probing
>> issues.
>>
>> [...]
> 
> Applied to riscv-dt-fixes, thanks!
> 
> [1/1] riscv: dts: fu740: fix size of pcie 32bit memory
> 	https://git.kernel.org/conor/c/43d5f5d63699724d47f0d9e0eae516a260d232b4
> 
> I checked the numbers and they look correct per the v1p2 doc.
> I added a T-b from IRC for Ron, added the cc: stable and fixed the
> fixes tag while I was at it.
> 
> Thanks,
> Conor.

Ok, great. I'll ping the fu-sdk people as well as this is probably
useful for the next release.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
