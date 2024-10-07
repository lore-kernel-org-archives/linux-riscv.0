Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A60CFB43F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTowOCCLNcvEdg5hzsPHBAMiJgACsbl5cIVvIydXBpE=; b=rZlqeFJN1oF9ba
	AjWI6ooxbkoERMEw5GvVLEwYJe1OnhqFsd3jF+FshX0aN8L+xeH5dXf8mhhnLPa2l/mG6lZHly86K
	JUzea3QG7+FZ1o1uVG02eSeMcy4x4My7f9rxr1G25ScQ9526PwPTLt2jxPUt08YbQ4z2FFLV8jQmY
	HDcuuLWPNHo0vK4zOUWIBO/nzZTxnXC0oU5rkj1iXSb6vAO+SnoAgl6RtKKlGQGmvPhMdTrhtSZ+O
	nfl2ykAssz6bvmaotzcrcIr/alVUgQ0f7T7gcx8np5BmfPedDzlLyLfEEUkgfjbtokGGy8ri+kugL
	bsvdIHpU2IGd3vNvFlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxm5S-00000002CkN-1oAA;
	Mon, 07 Oct 2024 11:39:38 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxm5P-00000002CiZ-0CLF
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 11:39:37 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 497BdLM1064118
	for <linux-riscv@lists.infradead.org>; Mon, 7 Oct 2024 14:39:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1728301155; x=1730893155;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=590uzh9aLzLznOyhna0jGhP/FiZRHlR8TiU5dwNYA6I=;
	b=MJYOtxH9Div6bQIZa9NK4X/T3QCqEu/1zVp0Uf277XRKoosoO8RCB/cJ6siwUSNs
	vA09F1Q9A5BB0lbpdC9I0fcpzLpA2PQk0S8QXqT/h8dmANwqL/M2sfxMDwQbtm1L
	8Gb44nMSHLKubZhqhsdzIFRa5A3OJ8yjL6HjZSeM/CuFOFYzG3d5l0Bpr3HD8p+W
	eUwuJE7JFTcG4Nqn/jw+kOtuEVGcOsj0m3qHofknxZH/T85+yB4QWNAPYnsVoNsp
	1QIHGL0deo6+9TiGt9Yf8d3PJ4xZohNGJc7burJHD2OhNdmGxTDHUNH+9ZF0L3Ux
	3+zuIvuvCG09PQLaltarbA==;
X-AuditID: 8b5b014d-271fa70000001e4e-26-6703c863c44a
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id D3.43.07758.368C3076; Mon,  7 Oct 2024 14:39:15 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <21feac2d-24e9-43f4-8a1b-728d4af6c4c7@ics.forth.gr>
Date: Mon, 7 Oct 2024 14:39:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: make ZONE_DMA32 optional
To: Christoph Hellwig <hch@infradead.org>,
        Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
 <e8f6ed93-d47c-4c07-963c-8f16f498abed@ghiti.fr>
 <VI1PR09MB2333FEC324AA0B3E5F1D7F98947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <VI1PR09MB233370D7BD8553E7891EF46F947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <ZwN0l0Y_oUfDX8jl@infradead.org>
 <VI1PR09MB23335FF3B1274ED13F24AF06947D2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <ZwN-E279o4bUQG26@infradead.org>
Content-Language: el-GR, en-US
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <ZwN-E279o4bUQG26@infradead.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsXSHT1dWTf5BHO6QeNnE4s569ewWTy785XV
	YuvvWewWpycsYrK4vGsOm8W9Nf9ZLbZ9bmGzeHm5h9mibRa/xe1FL9gcuDzevHzJ4nG44wu7
	x70T01g9Nq/Q8tj0aRK7x4kZv1k8Ni+p92ibspHR41LzdXaPz5vkAriiuGxSUnMyy1KL9O0S
	uDImztvCXHBJoOLVyelMDYwHebsYOTkkBEwkZt76ytzFyMUhJHCcUWLG56dMEAlLic2fXrKA
	2LwC9hLvTi5kB7FZBFQkrm79yw4RF5Q4OfMJWI2ogLzE/VszwOLCAuYS7/svAcU5OEQEsiR2
	HaoFmc8ssIBZYu71+4wQy7YzS7xfcw+sgVlATuL9s+2sIDabgKbE/EsHwZo5BXQlVr6MgCgx
	k+ja2sUIYctLbH87h3kCo8AsJGfMQjJpFpKWWUhaFjCyrGIUSCwz1stMLtZLyy8qydBLL9rE
	CI4eRt8djLc3v9U7xMjEwXiIUYKDWUmEN2INY7oQb0piZVVqUX58UWlOavEhRmkOFiVx3hO2
	C5KFBNITS1KzU1MLUotgskwcnFINTAxTe9h4qgTe5pw68Cr5lNQRjvmmH909hHpkMwqFmH9V
	L0gTUiyzWOK/QJi/N8lpg4/+ssk+unHp6rz2jf+ON/x6UzJRx8uqzyT9ROv1ylUNevELJIVv
	TsiZPGW5zJ7uXVO/xkX/EWt54nai5b9O+abDpyZ9fML8utuxWfue5NWuOs8vahaFRlHXWBx4
	ny55czXP/c3epHvSns+XFG9sjDQ+LqfT+kak0MvjYLXypFzLZ1cZWha7FV2pWGEQcrWDreg9
	R4RNje0pmco57bKPM1ij19w6c3LBpzdis53/md53CAlZNW3moZwHSWsetlUfnuGsvHYxe8gM
	q+f7roifLn/TPn3y9YlPJ77W3tu/RYmlOCPRUIu5qDgRAJ8lHyMNAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_043935_486394_E2C2E13E 
X-CRM114-Status: GOOD (  19.71  )
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

On 10/7/24 09:22, Christoph Hellwig wrote:
> On Mon, Oct 07, 2024 at 06:17:14AM +0000, Vladimir Kondratiev wrote:
>>> Well, this doesn't get any more true by just irgnoring the previous
>>> discussion and just reposting :(
>>
>> Sorry, this wasn't the intention. Perhaps I messed with the message-id, I see my "patch v1" in one mail thread together with the previous discussion, but not in the other thread.
>>
>> Anyway, I think making ZONE_DMA32 selection depend on NONPORTABLE answers the concern
>> that was raised
> 
> It doesn't at all.
> 
> For one not having ZONE_DMA32 is going to break a lot of things.
> Drivers do expect 32-bit addressable memory.  And because SOC designers
> know this there usually is a way to provide it, e.g. by doing window
> translations between cpu physical and bus physical address.  Please go
> back to your data sheet or talk to the designers.
> 
> And if there really is not way to provide this, the right way is just
> to stop the runtime allocation that triggered you to do this if
> ZONE_DMA32 is empty, not to add a non-portable option.
> 

I agree with Christoph on this one, by the time dma_atomic_pool_init() 
gets called we already know the system's DRAM base for example and if we 
have 32bit addressable regions (or aliases / translation windows as 
Christoph mentioned) or not. We could use this info to skip ZONE_DMA32, 
or just use a command line argument like this RFC proposed:
https://lore.kernel.org/linux-arm-kernel/20230201040913.GA4959@hu-cgoldswo-sd.qualcomm.com/T/

There is no reason to configure this at compile time, and completely 
remove support for ZONE_DMA32. Also NONPORTABLE doesn't address Alex's 
point on distro kernels, since distro kernels won't set NONPORTABLE.

BTW I tried reproducing this with a recent 6.10 kernel and couldn't, our 
system also has DRAM way above 32bits and this is also on a modified 
QEMU machine, here is the full log:
https://pastebin.com/9HLcphgY

You can use this script to reproduce our QEMU setup if interested:
https://github.com/CARV-ICS-FORTH/yarvt/tree/eupilot

Regards,
Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
