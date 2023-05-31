Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F471C7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hl4On4EGWzC5lAjfMjJD2nc6h36pFH0akZCmXySzFpY=; b=YOLQ+PtAmUBqZH
	igtmUljGV98RxO8+9SSne9f4/NV46z1W9jEUpeu20IF3m+k+nhsksaT0eL02HXLRSEUhMrjCDgZIR
	j8w6O+3VIhWpOTVSSlmaceABnCX39Z1obXvzHmcoZMyGcg7Q3RUb/yxrrI+J68YEWFKY37SXouXoc
	y194fu4N+Isg/e6MCMTe78wrmADdOUytJ0OQX3GNyN6W8/tJsgqc7TPcVg3NQAYVS57jNxjA5knw9
	fmu4qr5kpl301usDUaU3mCJY2qdVlsqnsjPcilpVZ18NY2l+2eb5gGXfJ060yffl5BjQ8lz0HJlqe
	drXw/Q5oLHSEMaEa4dzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Jc8-00HC6j-2z;
	Wed, 31 May 2023 11:03:36 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Jc5-00HC5G-0r
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 11:03:35 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E54DC0006;
	Wed, 31 May 2023 11:03:26 +0000 (UTC)
Message-ID: <9a94446d-bc6c-6272-8101-d1adeec3d672@ghiti.fr>
Date: Wed, 31 May 2023 13:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud>
 <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
 <20230530-polka-trifle-7ccd7a093099@wendy>
 <92d4aaa8-a1ed-74e1-3a22-df9be1ca1e4a@ghiti.fr>
 <20230530-hatchery-unifier-64d7a2ffe0d0@spud>
 <CAHVXubgG31moSNOe3fRqFzUSJK9tRWKH1KPP_BO7wRNC4WzxTQ@mail.gmail.com>
 <20230530-atrocious-control-bcb37de558fc@spud>
 <0068add0-8949-11b7-a864-2ef8bed00809@ghiti.fr>
 <20230531-staff-pampers-0250f7f6026a@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230531-staff-pampers-0250f7f6026a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_040333_610230_989B82D6 
X-CRM114-Status: GOOD (  23.97  )
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


On 31/05/2023 11:32, Conor Dooley wrote:
> On Wed, May 31, 2023 at 09:26:27AM +0200, Alexandre Ghiti wrote:
>> On 30/05/2023 22:22, Conor Dooley wrote:
>>> On Tue, May 30, 2023 at 08:04:17PM +0200, Alexandre Ghiti wrote:
>>>> Ahah, I think we found the culprit!
>>>>
>>>> With CONFIG_RELOCATABLE, vmlinux is actually stripped from all the
>>>> relocations (so that it can be shipped) and vmlinux.relocs is what you
>>>> should use instead, since it is just a copy of vmlinux before the
>>>> removal of the relocations!
>>> That probably makes us both eejits for not realising sooner...
>> Ahah, TIL a new word, thanks :)
>>
>>> Tested-by: Conor Dooley <conor.dooley@microchip.com> # booted on nezha & unmatched
>>>
>>> Thanks for your patience here Alex.
>> So I checked again if the -fno-pie should be applied to mm/dma-noncoherent.c
>> as I suggested, but actually no: errata/thead/errata.c never reaches
>> riscv_noncoherent_supported() in early boot (you can see how 'fragile' it is
>> though and why something needs to be done...).
> I did make sure to check this patch itself, without the additional bit,
> to see if it was needed.
> But yeah, it is going to be super fragile - do you have any ideas about
> how to circumvent that?


Yes, I was thinking about multiple solutions:

- All the early code could go into kernel/pi: all the dependencies of 
the early code is built in its own way (the symbols are actually 
'duplicated'). I see that a bit like the EFI stub. My first try failed 
with !CONFIG_RELOCATABLE, I have to dig further.

- Simply do a physical relocation before any early code, execute the 
early code, and then do the virtual relocation. But that does not solve 
the issue fixed by kernel/pi which allows to recompile standard 
functions (like the string ones) without any instrumentation and have 
the versions with the instrumentation for normal execution.

- Compile relocatable kernels without -fPIE (why can't we just use 
medany actually?). That won't fix certain types of situations where we 
need relocations, but that will limit the number of outliers that need 
to be compiled with -fno-pie and it will be easier to spot (we'll still 
have to be very careful though)

- Be very strict about what can/cannot be done in this pre-mmu stage, 
and document that...

The best solution would be the first I guess. Any other ideas welcome :)


>
>> Oh and I realized that I forgot the Reported-by from Andreas and the Fixes
>> tags, so here they are:
>>
>> Fixes: 39b33072941f ("riscv: Introduce CONFIG_RELOCATABLE")
>> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>>
>>
>> Thank you too for your patience and your quick answers!
>>
>> Alex
>>
>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
