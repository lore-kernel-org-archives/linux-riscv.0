Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4930AC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH2Fg3CVyjXPG9ZwksmmTCP/5Rh2GcDKUftMnm5V5HM=; b=Hxe9YVzk3BZD9Q
	7eeuhdgc8CB/AIm6+cV/Yae/icfHzVzxJtOhsX7eUwjIE1UvpUVLfel2jRE+ky7BSITvD17/MnGWr
	NGSgCmD5996sRJca9Lu6EiT8/nFO1gri++HWoixbo3epGFRRfSDPLzmUaBjhmrmpPe456Fxcwuut6
	oBo0XYUcswP08jcwwTDZz4PnbQXkhG4t/arASCXdGPhC+PRCqk7y7Qgnge4fAuM2TZuSEWHsixDVs
	aYoBXaMmOpViWA/ye5N+aiOOqx51gUISG0NG4CJGCIKnaKoZW0U+7uouXO7FA5pZK4mTyW0Osz2g4
	U+oui9Ls+EaGmiYZNo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GEB-00GQrz-2v;
	Wed, 31 May 2023 07:26:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GE8-00GQr4-1K
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 07:26:38 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE849FF80B;
	Wed, 31 May 2023 07:26:27 +0000 (UTC)
Message-ID: <0068add0-8949-11b7-a864-2ef8bed00809@ghiti.fr>
Date: Wed, 31 May 2023 09:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230528-darkness-grandly-6cb9e014391d@spud>
 <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud>
 <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
 <20230530-polka-trifle-7ccd7a093099@wendy>
 <92d4aaa8-a1ed-74e1-3a22-df9be1ca1e4a@ghiti.fr>
 <20230530-hatchery-unifier-64d7a2ffe0d0@spud>
 <CAHVXubgG31moSNOe3fRqFzUSJK9tRWKH1KPP_BO7wRNC4WzxTQ@mail.gmail.com>
 <20230530-atrocious-control-bcb37de558fc@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230530-atrocious-control-bcb37de558fc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_002636_600230_8F659FEB 
X-CRM114-Status: GOOD (  13.72  )
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


On 30/05/2023 22:22, Conor Dooley wrote:
> On Tue, May 30, 2023 at 08:04:17PM +0200, Alexandre Ghiti wrote:
>> Ahah, I think we found the culprit!
>>
>> With CONFIG_RELOCATABLE, vmlinux is actually stripped from all the
>> relocations (so that it can be shipped) and vmlinux.relocs is what you
>> should use instead, since it is just a copy of vmlinux before the
>> removal of the relocations!
> That probably makes us both eejits for not realising sooner...


Ahah, TIL a new word, thanks :)


>
> Tested-by: Conor Dooley <conor.dooley@microchip.com> # booted on nezha & unmatched
>
> Thanks for your patience here Alex.


So I checked again if the -fno-pie should be applied to 
mm/dma-noncoherent.c as I suggested, but actually no: 
errata/thead/errata.c never reaches riscv_noncoherent_supported() in 
early boot (you can see how 'fragile' it is though and why something 
needs to be done...).


Oh and I realized that I forgot the Reported-by from Andreas and the 
Fixes tags, so here they are:

Fixes: 39b33072941f ("riscv: Introduce CONFIG_RELOCATABLE")
Reported-by: Andreas Schwab <schwab@linux-m68k.org>


Thank you too for your patience and your quick answers!

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
