Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1479AC2BB85
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjnnFDOW7qoiQi4CqfgCD0nCRWjMOy7PVXm/xX537z0=; b=gRIAVtElTSnJgs
	Bl3M0r6xrad3paiaGHEDTzF7qZNBDGqzpLvXXlkeeMoxHhZl57FfPtUjeF0JIhxz8cj3F6Mn5sSQ6
	TfFPSjqr4i7uOul8Z9Yfsdosh1KqQPS2y3NwqoOemKcnEjmbOBhsBvgdPi42LrUajH53ilFznNI7a
	Lw+KA8eJOrQI0CHSph6tiN1vwXHmeaY1WqAGl7z1yak9YazyP02ZguwaILAju/jpYHKy4BolHPjlo
	UsBEmkAwPN5/cE1lExV15/wjn96gZbnGBlkBQ9ko8OR4rau8hqgMdeSGgGOb/Ewii4Q8ZVUjO3v+B
	wzUnsx7ks+7/g8rNseSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFjx-0000000BrXt-2aPz;
	Mon, 17 Jun 2024 17:01:57 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFju-0000000BrWW-0Adx
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 17:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718643708; bh=ptOjrwdiruXfiPRbkPbyESZEkYeF5JqwOz+w8fsnr24=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=KM4OWEYXz2pBIQ0/Jx6HuePCjow4lZ4OFfv106kYW+ESlxRbiMlsMkaQ/NFnjA4CS
	 iV2gIx3qJXvdKlQACJu32IHCV5bpZskrDzoASv4zaQ0uB7vsHYYvUqPVVWWdq/s944
	 licaDwYHex6zsB1bGRw9vpu3KPe8R1iai6JUtg5U=
Received: from smtpclient.apple ([2408:8207:18a1:9700:9c85:7ae:3ee:45fe])
	by newxmesmtplogicsvrszc19-0.qq.com (NewEsmtp) with SMTP
	id 6DA4896; Tue, 18 Jun 2024 01:01:45 +0800
X-QQ-mid: xmsmtpt1718643705t949zch05
Message-ID: <tencent_296E424C52C850A3095F8CA0B07698E30D06@qq.com>
X-QQ-XMAILINFO: MziGzrjZeogZA2yb15PwWH+GJ01zzp4/qBKBYADeYSFB8UC7ogZnJZFUk1XMIj
	 fih8FkF7TT7M+PokWHjQ+iIhxR/+qoTffjDIEMjMoEzqo7jGzuqdabu0VDlSAPnGqhHExikl/WJm
	 RHdW9NR2HI89ird6Ekd9TDkVw5zR4OptUmXIG0PJ9lBT2OcVnLKVYRMbapT3rvkR2jhGDCWn7cnf
	 ooZX4xHSJP9fNRxJ/hE9ya7YZD+U4oz6MR1H1juPcqubzrqfTUMdaWHSuh+nkmShdxmtxDtkDSSw
	 si5vSgZMtHK/DhN3fbDzD4eG/mj0f53Xq2phMP7KJXTQnXa/rl15fXH/lvPmagjfuqRVXfRwl/Ok
	 +VDn/ISoVl04oW6uawIujzNLWptS1tIjchCy7d5su8KCUnPAofKUw3AdHfXZMINibQiWSFm7BVjx
	 qXQj09HHv4FNFcZTRzfce0FWsawWaz7KQEpVrNpESJDk9nLCIVvbMxu7Cl6IutueRxoJls1thVqw
	 lF9gyHeP6qFZzFzkEACeVDtP4KEu//50fhpDEDrw8Q/BM9C4N/d0tTJTiYCgGSUfasR2zBR/Gm6d
	 hWAKZpJfSTCc5XqWjTctvYXLwOv18ZUQou2WOEZ99BZhaKEcPtimU67T1B0rW7BJUayuG/tbN/3u
	 mrz7OZdG94YDFlTbJ8+EQG5zOW/EDwaHlO5u9SIo3d0134R+sZkh3FyhhwCFo1dpBeOYnBXu5ood
	 G6F3xy4GLIyzFTawgNCm7Rm7axjRGjodn3ZdZyMEuvn7nRGhvQ/ewQnkvPe53rVRs1WVnY20w0NP
	 oqautRdBiA5t0kxF++fr2XyfLLn6MKdhuyNkMh6W7dLb7lO0+deYAQCqOGWFg9avHVOHCt8d808s
	 n6bBVtLtTsl6lVuSt+ty/TJ4vXve1BHiMaYWqr3xmWDaacT9od3aNfizhr5koBU7CamalxoMmnwN
	 aArNIcH6DDhWDYMNzIFu2ZdODtE72Ed8N+7b5sCjpuAm+P3RHwPetpK7WwDqzWqy4Bxs0gPgo=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 7/9] riscv: dts: add initial SpacemiT K1 SoC device
 tree
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <ZnA6pZLkI2StP8Hh@xhacker>
Date: Tue, 18 Jun 2024 01:01:32 +0800
Cc: Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-OQ-MSGID: <BD2E7EB4-6525-4274-88D0-35005AFB32B1@cyyself.name>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
 <ZnAw9QrSD-svYqQ5@xhacker> <20240617-carat-poise-ee63ed6a224e@wendy>
 <ZnA6pZLkI2StP8Hh@xhacker>
To: Jisheng Zhang <jszhang@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_100154_498791_5E2A194F 
X-CRM114-Status: GOOD (  15.41  )
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



> On Jun 17, 2024, at 21:31, Jisheng Zhang <jszhang@kernel.org> wrote:
> 
> On Mon, Jun 17, 2024 at 02:29:46PM +0100, Conor Dooley wrote:
>> On Mon, Jun 17, 2024 at 08:49:57PM +0800, Jisheng Zhang wrote:
>>> On Mon, Jun 17, 2024 at 01:20:52AM +0800, Yangyu Chen wrote:
>>>> Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
>>>> 
>>>> Key features:
>>>> - 4 cores per cluster, 2 clusters on chip
>>>> - UART IP is Intel XScale UART
>>>> 
>>>> Some key considerations:
>>>> - ISA string is inferred from vendor documentation[2]
>>>> - Cluster topology is inferred from datasheet[1] and L2 in vendor dts[3]
>>>> - No coherent DMA on this board
>>>>    Inferred by taking vendor ethernet and MMC drivers to the mainline
>>>>    kernel. Without dma-noncoherent in soc node, the driver fails.
>>>> - No cache nodes now
>>>>    The parameters from vendor dts are likely to be wrong. It has 512
>>>>    sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
>>>>    When the size of the cache line is 64B, it is a directly mapped
>>>>    cache rather than a set-associative cache, the latter is commonly
>>>>    used. Thus, I didn't use the parameters from vendor dts.
>>>> 
>>>> Currently only support booting into console with only uart, other
>>>> features will be added soon later.
>>> 
>>> Hi Yangyu,
>>> 
>>> Per recent practice of cv1800b and th1520 upstream, I think a complete
>>> initial support would include pinctrl, clk and reset, I have received
>>> the complains from the community. So can you please bring the pinctrl
>>> clk  and reset at the same time?
>> 
>> What sort of complaints have you got? That the support is too minimal to
>> be useful?
> 
> For example https://lore.kernel.org/linux-riscv/95c20c6c-66cd-4f87-920b-5da766317e19@sifive.com/
> 
> Now, I think it's better to "model the clocks/resets/other dependencies"
> in the initial support. So lacking of pinctrl, clk and reset doesn't
> fully describe the hardware.

Sound like a good idea. In this case, we don't need to change the
dts repeatedly after a new soc driver is supported.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
