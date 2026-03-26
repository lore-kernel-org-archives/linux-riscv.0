Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6976910A62F3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mikEN5krioJXnXKmXLtjLn2Hl858CJErUxSiv2fCIrc=; b=VpBwFGJCe0dxHa
	mQML/uXQ2RjSmQJQxSW8XusNyKWKcsghVdu0cdFMDfKYMNUUr7hbI6MIvPa5rQVyCrwYGE78IB1rv
	pQHwBnJLOfbnIric4/m+he+SrC9gUW9hi/GZKL/dwTyNUkya90sm+6cXl1RGaq7MbHae7lzHj1oum
	9qAvtrufx4YB+Kv10+PinYU81IrYOL+Cr0a/U6LBRCWDrKY4YAI3ayjqne0tu0QcfZfc2G2uRH9EU
	p0E8TR4erxhSkI4J3I2A30RVuukfEtKU2zVXQqZ3rs94ecdhP4dqp+YjbhQxsCrEOVK+RhN5cwAp7
	gJqJyzxOzyO94uLKTKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lpA-00000005fHq-10CI;
	Thu, 26 Mar 2026 14:36:40 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lp7-00000005fHD-0U4G
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 14:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1774535771;
	bh=1Lei1huVmK0jk2taTPA5pPS2SS/y9aUYJzZJfAWZZpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VohLqe3mXfhCHB6mZNGLhvm/bK+AfU5l5FHx+Rf5FDDAlSnppNndHEHrL9mhK99VU
	 Xhr2lG1PoXqPBuJyFZDRPKtM3a4bREPX3uOlqEwHlHufZKToAsc06AVnyiDMiA49QU
	 78S2R3XnFLFsoFAmnR+XYiXqSy/65Zg63WFodfvshT3eIxBVOPokvNYkelFSuiVupp
	 ki0YB+rPB9dnnn2/YrcqXNkNaAYGZZaimKJeHTAfGQUIpJjb9tXl7ibYeSh4OhtReV
	 h02/tiHtX9LOU0SG/WFMm00+HHmZsSknx0R8iBQ6E7eVuXTadnVJni0L49VDm5Imle
	 wNtf0MFg5l9GA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 84C28B220B6D;
	Thu, 26 Mar 2026 15:36:10 +0100 (CET)
Message-ID: <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
Date: Thu, 26 Mar 2026 07:36:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: Conor Dooley <conor@kernel.org>, soc@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260326-astrology-rephrase-836ec663228b@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260326-astrology-rephrase-836ec663228b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_073637_598122_2EB74BA8 
X-CRM114-Status: GOOD (  19.83  )
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

On 3/26/26 04:13, Conor Dooley wrote:
> Hey folks,
> 
> Please pull a small fixes PR.
> 
> Cheers,
> Conor.
> 
> The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:
> 
>   cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v7.0-rc6
> 
> for you to fetch changes up to 305f2865bd034146b2eebc77c27fc50d8d79778d:
> 
>   riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card. (2026-03-19 16:00:13 +0000)
> 
> ----------------------------------------------------------------
> RISC-V devicetrees fixes for v7.0-rc6
> 
> Starfive:
> Two fixes for the SD cards on the Mars CM Lite.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ----------------------------------------------------------------
> Heinrich Schuchardt (1):
>       riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
> 
> Ilya Sorochan (1):
>       riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
> 
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 1 +
>  arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

To be clear the "riscv: dts: starfive: jh7110-common: fix jh7110 SoC
boot from SD-card." commit does not affect Linux whatsoever, there is no
problem to boot Linux from SD Card impacted by having or not having this
commit. This also is not common, so should not be in jh7110-common, as
more JH-7110 SoC products by-the-numbers have transistor logic replacing
this signal selection to the StarFive loader in BootROM and so
precluding this from functioning.

This ignores the wider discussion about StarFive both deprecating this
capability (for Secondary Program Loader i.e. U-Boot SPL) of StarFive
Loader in JH-7110 BootROM loading from SD Card being deprecated
officially in the latest StarFive JH-7110 Technical Reference Manual and
StarFive JH-7110 Boot User Guide documentation, and the ongoing GPL
non-compliance by StarFive for use of GPL 2.0+ code in the JH-7110
BootROM; the latter being important if we want to accurately attempt to
support this deprecated feature set as a community (even when ignoring
for the moment this copyright license non-compliance).

I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
BootROM, and openly invite anyone that would like to help get this
effort to 100% is welcome to so that we may publish and refer to this
for technical competence. I do not object to the community supporting
this deprecated capability if there is any real documentation not based
on rumors and memes; but no one has offered to do take a moment to do
this most basic of fact finding. Evidently the StarFive maintainer(s)
have refused to support this, GPL non-compliance persists and only a
rough description from Hal has been written to the U-Boot developer mail
list that does not match my analysis, all while complaining about the
capability not being supported going forward.

I object to this PR it is NAK from me on the basis of stuffing this in
sideways without technical justification or review. Also I do object to
"riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
wrong way around, it does not describe the hardware; if some external
carrier boards cannot deal with the capability of the Mars CM
system-on-module having card detect line then that should be dealt with
as a dtbo per-carrier board and not be replaced in the dts by a
broken-cd, although at least we had this discussion and Conor made a
decision with all the facts and discussion available.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
