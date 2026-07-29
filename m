Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB0CC54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46ezVGC4XiiLybU0HfuQawL45u8BAseTZ/qV2zH2trI=; b=jbde7BhrZlmbhi
	/qZ4xWiN5YrVQqI5uicojjARJx7k2Mp4bwGPFuY0UjoLDZY7MaslLEVkMx2OpoQYuPFGRtvJw0F/B
	bYEWo0ZseNRIUoHTyNZLghAs0xxk+f/VK+2jdkgGjaiJPGuwcjodMvCQJ5rxktRtkboSKLwEdCT2p
	s2EK1oGKjZlKeKb3Dh9EP3+ET0XD4lu6kiDzNeBfN+MhdnmYuBgWxrrLINiipxvRtOrVjZAeV1wKy
	497xZmg4+bPuBn6YdGq3Vmr9ycsPp0NloPOhQbXQdPTyi9+2rS0PQtIVbuvX7Y4zcParjOfAkCNLl
	IEKnUKgIk8KqV0E/1zPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0m7-00000007PEs-3vlC;
	Wed, 29 Jul 2026 09:40:31 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0m4-00000007PDM-42yg
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 09:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1785318000;
	bh=6JutlRpMF2GZhC2lvsYXiSLked//G4vutb8ZF7y6E8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RSzCztt2IWqTYIFfh9noNOZcXN7H64bMob7rzm6kp8FHcntymwdt42OSJ4n1V3lC6
	 /kwmGlUjw14qUbcUDrZ4AZ0IlYB0SDFXV3pKOjehX4fY3+bUQyrPt8VbCM+2XeSrFc
	 0Ra0v6oRDyvrZVj8zp1UCwEPvn9/fvlIQXzcWRTD6RVu5R88m/Q4LBv5mqNQPAMhfc
	 bFEs3KY5OnB+Z4S+JrWDz2MMXILb7iL9fJPitnsf6SzLowj/4jcE3IV6sz+UUjxwP+
	 qf6Ayf2ET+V7yFE4KzRFdbpRu1VGjMCKe1RpE6r7qQDBuMPCTHKYySH78YT017/hNf
	 8hUDx+FwhPnIg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 3D763B220F77;
	Wed, 29 Jul 2026 11:39:59 +0200 (CEST)
Message-ID: <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
Date: Wed, 29 Jul 2026 02:39:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 Ilya Sorochan <k0tran@altlinux.org>
Cc: Conor Dooley <mail@conchuod.ie>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, heinrich.schuchardt@canonical.com
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_024029_460565_707D29E4 
X-CRM114-Status: GOOD (  15.45  )
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



On 7/28/26 11:02, Conor Dooley wrote:
> From: Conor Dooley <mail@conchuod.ie>
> 
> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
>> Add bootph-pre-ram to mmc1_pins clk-pins.
>>
>> U-Boot pruned their overrides recently in favor of Linux which broke booting
>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
>>
>> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
>>
>> [...]
> 
> Right, I am going to try this again. I don't think there's actually a
> valid technical argument against it, since it just affects the stage at
> which configuration is applied rather than configuration itself.
> If the configuration is wrong, and more devices don't use this configuration
> than do, people need to move the node to where they think should be. That
> shall be done separately.
> 
> I don't want to hear about the politics about whether or not Starfive want
> to support it or reverse engineering of binaries etc. All that I care about
> is discussion of the hardware itself and which boards need this and which do
> not.
> 
> Applied to riscv-dt-fixes, thanks!
> 
> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>       https://git.kernel.org/conor/c/42c57c049054
> 
> Thanks,
> Conor.

Second NAK to this being applied, again, do not apply as-is.

As you're not interested in the technical discussion, then you won't
have one.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
