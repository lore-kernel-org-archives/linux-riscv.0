Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C155D216A4
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo2ZzO0OxEfrrv7753fF7Ib5fknzpBdPpZxuPhVqsMQ=; b=HNojLYEB6R21LBqr7Msk8tcthl
	gqZhz6U1E05UDLGuIPU3HD+CRh/CakpxXIrBofkG/9pZNYPdZYAX8XkAhHP3dnHpXB14TrnxcztMM
	uphncgoWlJZNfUKgqutgSCCIdMOw46o3Y0pXUrCAQQhuicu0xXtfooUMO7Y8NKJAdXs+94LAdJDDf
	2ONJ0Jr9zyUvGieD00J8NFeOGRLFsFui29bYWg/cQph0DiQZ2JCngeQN9zlCzuZ0ZVedbw2at/iBq
	VxNws2JiA6utyFDH1lNPjTjqsCtsZ/mQeTddgwkWxzQ+WRxuhooPw0QWmFTIGioTPI+dCL5DjE0rl
	Y/vkjsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC7m-00000008HXR-1Z2P;
	Thu, 04 Dec 2025 16:24:11 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC7g-00000008HWA-0VNH
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 16:24:06 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate-4.ics.forth.gr (8.16.1/ICS-FORTH/V10-1.8-GATE) with ESMTP id 5B4GNfsm2300277
	for <linux-riscv@lists.infradead.org>; Thu, 4 Dec 2025 18:23:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1764865421; x=1767457421;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z7FdnME9CpKueG67QRtVsdS2KmeX0UsQdUvFsKDF7fo=;
	b=EJK4GTljSoJXYajyMsKuIWD8e3OgDKn5Rj2dNWOkCq+yCrlcP/kulKamPSV5Nq8T
	UA0ZRXPjctLvSTHQk9JSIz2luidojkKU3JcrOCKwN/Uxft1CBL2MHWpjdQJsKEqq
	eUYyu2pxqbmtN7S73m1gvrmhazcEo34YnhElChKefWaJW6bSMDGnwslKjJp8AjmK
	zR2RwwTFaNrqDBMds+TqT1hafAlyKZI5EYGjAEuD8IOP1nLGKQa+yTktJ42kWORf
	1F/DXm3xiFURq6xs8GZlqgosCBsYC7JJVbNr27n5KB51aaxEezzUYp+0S9k3jvbF
	l48yweZ0icqaNRQ/LtxjOg==;
X-AuditID: 8b5b014d-9a7b36400000a722-dc-6931b58d18de
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 14.9E.42786.D85B1396; Thu,  4 Dec 2025 18:23:41 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <41ad3759-79e7-4119-84c8-1ec532fe4c07@ics.forth.gr>
Date: Thu, 4 Dec 2025 18:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/22] riscv: Memory type control for platforms with
 physical memory aliases
To: linux-riscv@lists.infradead.org
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
Content-Language: el-GR, en-US
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKLMWRmVeSWpSXmKPExsXSHT1dWbd3q2GmweNlvBbbPrewOTB6bF5S
	H8AYxWWTkpqTWZZapG+XwJWxfuNG1oKbbBX7Fl9gb2DcytrFyMEhIWAisWRfZBcjF4eQwBFG
	ibVbJrF1MXICxS0lNn96yQJi8wrYSzz9vRksziKgInH66U0miLigxMmZT8BqRAXkJe7fmsEO
	YgsLpEp8XTiRGWS+iICyxPx7riBhIQEHiUkX/oCVMwvISbx/tp0VxGYT0JSYf+kgWJxTwFFi
	5eQedogaM4murV2MELa8xPa3c5gnMPLPQrJ5FpJRs5C0zELSsoCRZRWjQGKZsV5mcrFeWn5R
	SYZeetEmRnDIMfruYFzztEX/ECMTB+MhRgkOZiUR3jc5BplCvCmJlVWpRfnxRaU5qcWHGKU5
	WJTEeeMiHmUICaQnlqRmp6YWpBbBZJk4OKUamDzfr5Lf8Ptj2f0qroIHQls22AXMaNlweOat
	Je7aSwNfas1JDcr5sJrFa/OZ/ta2+v97Le49z7tqubjyyvX/Ok9F7VKn5sXf/780wKdUec0C
	+/52Hqazjw9+ilu6XupgwrW+VpmplTznGE1+ZrAErcw+ENjj7qC/54/Qmg22LzjvXeqcE7lP
	7dgff12b9Q+tZHenNv6ev/3edlGGrP2dPlsme3ho33notqNLuretSvFQveHUD1dDrRsW9N22
	d3cT8vlSbJJst3HeNhUjObmrF+Stbpx+XnTi3zUWHc7jF06oLXc7oKzwu1NA4PThzxNedJyZ
	92jzdvnO/atKUyWO/OPNrJNj+jfpqPZ87voupclKbMUZiUamZlrMRcWJAJT/4kWqAgAA
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-4.ics.forth.gr [139.91.1.7]); Thu, 04 Dec 2025 18:23:43 +0200 (EET) for IP:'139.91.1.77' DOMAIN:'av3in.ics.forth.gr' HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mailgate-4.ics.forth.gr [139.91.1.7]); Thu, 04 Dec 2025 18:23:43 +0200 (EET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_082405_250335_409A38DF 
X-CRM114-Status: UNSURE (   8.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/13/25 03:45, Samuel Holland wrote:
> 
> On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
> DRAM is mapped to multiple physical address ranges, with each alias
> having a different set of statically-determined Physical Memory
> Attributes (PMAs), such as cacheability. Software can alter the PMAs for
> a page by selecting a PFN from the corresponding physical address range.
> On these platforms, this is the only way to allocate noncached memory
> for use with noncoherent DMA.
> 
Then why don't you solve this at the DMA API layer ? Are those 
alternative PMAs going to be used for something else ? If the only 
usecase is to support noncoherent DMA I suggest playing with 
arch_dma_set_uncached and/or arch_dma_prep_coherent, we can deal with 
this similar to how MIPS did it with UNCAC_BASE.

Regards,
Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
