Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209DEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=771vEP8qMYc6szL2iYcITiKgai0bSqE3X2qIs5IQtug=; b=I/8/ECc3wLUIS+
	b7xNU91R9m+wlp0K0ot+2Ee3WG0IXeJeZ3EoPe7baUlWMs/r5gZm5aQvzSOi5BBsmwg7b87p/0y3c
	51VYKOiRkcWyYXz28COKSJ5Gql5PsszlaOvTMajeGkdGgjiEcxRYydAFYkqK/Auz+5kOdxqlQSKE7
	dLtNMeDb9ZVvroXHLPWq0vBLZJK1SmR0TgRasQLLaikrN8IMpQbYzrGoIGCk4sNNLMHR5HLajQcZx
	haF/0vtR7FzOcB2ouA5vDqTSwIda7VpP4wB2qqMwtfQjCaeK2hTbgA95RbNTHBM5aTBeM2H3LMB58
	RyZDB3yil/DCGyI2KSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD06b-0084Bi-TQ; Wed, 04 Jan 2023 09:30:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzzR-0080if-UE
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 09:23:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C50361620;
	Wed,  4 Jan 2023 09:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113ABC433EF;
	Wed,  4 Jan 2023 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672824196;
	bh=8Nio75pRnguUldoMBvKssmpiVY656R5TJYi2km9hpHU=;
	h=Date:From:To:List-Id:CC:Subject:In-Reply-To:References:From;
	b=Dl40jAfb0bAzXiN+4O8wnsocGGC+3Jl1+BEd48BzdXvQsDmz2HDtWBv8P2TPmugRy
	 OnI4bHyeefK584AuavsZaZGI5dDMmOU9dD9FWLAmaU+EfWoibogzx362P2K1nFKD7u
	 P1dbdTymqyYjc2UGVBLnY4lWzyfwtYQCLISKAS2gp8XFJiEFYXrEBaTqa2RELzfmQa
	 l674S/6hnp5nc3HRJCajbi0wszsLdv5/LrMiwH7YJSesdUv+1e6AGE8Y+d0WaVRN6o
	 G2YhZrAh6vw7cDuznIgQhZxYIMk3GHvbkSGfZYqZj5GJSYHV3Y6lCO/h9AqNuoPzay
	 xy2J5+cwvkbMg==
Date: Wed, 04 Jan 2023 09:23:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, guoren <guoren@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
 Jisheng Zhang <jszhang@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 soc@kernel.org, Daire McNamara <daire.mcnamara@microchip.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v5=2E1_9/9=5D_=5BDON=27T_APPLY=5D_cache=3A_si?= =?US-ASCII?Q?five-ccache=3A_add_cache_flushing_capability?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
References: <Y62nOqzyuUKqYDpq@spud> <20230103210400.3500626-10-conor@kernel.org> <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com> <Y7TBh+CJdZPJ6Xzl@spud> <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
Message-ID: <CFB874A3-3E6F-4C5B-B47D-381EB1E07C02@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_012318_132234_71E1AF4F 
X-CRM114-Status: GOOD (  20.77  )
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



On 4 January 2023 08:17:41 GMT, Arnd Bergmann <arnd@arndb.de> wrote:
>On Wed, Jan 4, 2023, at 01:00, Conor Dooley wrote:
>> On Tue, Jan 03, 2023 at 10:28:19PM +0100, Arnd Bergmann wrote:
>>> On Tue, Jan 3, 2023, at 22:04, Conor Dooley wrote:
>>> > From: Daire McNamara <daire.mcnamara@microchip.com>
>>> >
>>> > SiFive L2 cache controller can flush L2 cache. Expose this capability via
>>> > driver.
>>> >
>>> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>>> > [Conor: rebase on top of move to cache subsystem]
>>> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> > ---
>>> > This commit needs more work, and a way to enable it from errata. I've
>>> > not gone and done this as PolarFire SoC has archid etc all set to zero.
>>> > So we need to go figure out a workaround for this, before adding in
>>> > errata enabling code for this. I've included it here as a second user of
>>> > the cache management stuff, since what's currently upstream for the
>>> > ccache driver does not do any cache management.
>>> > ---
>>> >  drivers/cache/sifive_ccache.c | 45 +++++++++++++++++++++++++++++++++++
>>> >  1 file changed, 45 insertions(+)
>>> 
>>> My feeling here is that the cacheflush code is unrelated to the
>>> EDAC code and it should just be a separate file. From what I can
>>> tell, all of the existing contents of this file can simply
>>> get merged into drivers/edac/sifive_edac.c, with the newly
>>> added code becoming a standalone driver.
>>
>> Sure? I'd like to do that independently of whatever is done for the
>> ax45mp CMOs though, don't think it's worth holding up that platform's
>> support on me splitting this out.
>
>Right, no need to touch the existing file as part of this series,
>it probably just gets in the way of defining a good interface here.

Sure. Can leave it where it was & I'll sort it out later when it's errata etc get added.

Btw, would you mind pointing out where you wanted to have that if/else you mentioned on IRC?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
