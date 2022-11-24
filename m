Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1FAC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYWj+09/fMcFY3HKQXN30lq5kplJhTxVpGxhWkUUIHE=; b=OaVacCsAm/rjsQ
	I1a/aepCMDYLepHLcJlMklcPoiG8qgU4j3EPwC1Ju/bo9FVtrSnssOHIWqofyPp7IFMNRrz21G9mS
	AY5YgyBhrsfIOhkAAUAH+uDJottDxqwSFiMCZJ9jWdsDiweE079qETcSrjNn4sm8D5N0Fka/p/2WR
	S8CFLkRaqqFVbCqrNks/Ow6yc35608oeLnKAM4mZvGB3MKnQa4X4vande/whiKKfn7NYPD1JKhbhN
	/3TkcSC3/jchICXuDrFS6b7H+E471YCeMU95C93XSk/j3eji1dTGOak2xq5doUSnuppUSxCLfyMd2
	kAhTlioY/E9LqBF9ob7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGQN-00Afc1-89; Thu, 24 Nov 2022 17:54:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGQJ-00AfZI-SR
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:54:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A6C4B8289C;
	Thu, 24 Nov 2022 17:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9263AC433C1;
	Thu, 24 Nov 2022 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669312444;
	bh=He3Pd8IkhWybpRjkE2MQUgnr0yhm6m/2ss8+4XAeJEQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mxXZ8xLhnUMUDo7BZKZ1qjitMkHand9xKrfnOrc1LhD0+YmIs0C+8lGkhpT+8uyIU
	 Y3YUnrYy6puecAW7EvhucIYSZboj5N1Ho+dLMCq6h5QdvGh7ppDVPbJaYbIU/xAlpz
	 rOUtJ9kp9c/eIKh3vFcKZ0iH2DL/Dahths77alCoXqdlsioTKus2T80QMnjgi5EIFQ
	 1fUSxEL0E6BKLRQtZ7wyhC2tbPe5W1o36jKYj7wajylsB5MiKaByqvmOvhbhR9r96K
	 uiPo3ApkYRJZUSAvclVFiGNT8h+wM8FzY1YCCJD68dVY3DbXSBU2tq/Cmzs629VT+D
	 gmS6TFWqytxUg==
Message-ID: <27d0de3e-1006-dd3a-0e91-ae8025ef8426@kernel.org>
Date: Thu, 24 Nov 2022 17:54:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar Crypto
Content-Language: en-US
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org,
 Jiatai He <jiatai2021@iscas.ac.cn>, Heiko Stuebner <heiko@sntech.de>
References: <YqYz+xDsXr/tNaNu@Sun> <YqY0i22SdbHjB/MX@Sun>
 <Y385rS/5zDaDJ3Os@vermeer> <Y39AXYPFzSiBngwI@wendy>
 <Y39Lwp4rQc3Qkl0i@vermeer> <Y39blUaC/jHiOYCk@wendy>
 <Y3+mBAV8oxphjHcJ@vermeer> <c9ae9644-5cd0-29c2-a25c-bb497dfcb1c8@kernel.org>
 <Y3+rE6j/CzTpINi+@vermeer>
From: Conor Dooley <conor@kernel.org>
In-Reply-To: <Y3+rE6j/CzTpINi+@vermeer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_095408_254706_2D49C275 
X-CRM114-Status: GOOD (  20.69  )
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

On 24/11/2022 17:34, Samuel Ortiz wrote:
> On Thu, Nov 24, 2022 at 05:20:37PM +0000, Conor Dooley wrote:
>> On 24/11/2022 17:12, Samuel Ortiz wrote:
>>> [You don't often get email from sameo@rivosinc.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Thu, Nov 24, 2022 at 11:55:01AM +0000, Conor Dooley wrote:
>>>> On Thu, Nov 24, 2022 at 11:47:30AM +0100, Samuel Ortiz wrote:
>>>>
>>>>> Patch #1 is definitely needed regardless of which interface we pick for
>>>>> exposing the ISA strings to userspace.
>>>>
>>>> I took another look at #1, and I feel more confused about what
>>>> constitutes canonical order than I did before! If you know better than
>>>> I, and you probably do since you're interested in these 6 month old
>>>> patches, some insight would be appreciated!
>>>
>>> Assuming we don't go with hwcap, I dont think the order of the
>>> riscv_isa_ext_id enum matters that much?
>>
>> The chief put it in canonical order so that's good enough for me!
>>
>>>
>>> iiuc we're building the cpuinfo string from the riscv_isa_ext_data
>>> array, and I think the current code is incorrect:
>>>
>>> static struct riscv_isa_ext_data isa_ext_arr[] = {
>>>     __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>>>     __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>>>     __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>>>     __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>>>     __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>>>     __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>     __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>>> };
>>>
>>> zicbom and zihintpause should come before supervisor level extensions.
>>> I'm going to send a patch for that.
>>
>> idk, Palmer explicitly re-ordered this:
>> https://lore.kernel.org/linux-riscv/20220920204518.10988-1-palmer@rivosinc.com/
>>
>> By my reading of the isa manual, what Palmer did is correct as
>> those are not "Additional Standard Extensions". /shrug
> 
> Hmm, by their name (Z[a-b]+) they are Additional Standard Extensions.
> What am I missing?

Right, and this is where I get confused. Zam and Ztso *are* Additional
Standard Extensions, I think we can agree on that one? For those
extensions:
\chapter{``Ztso'' Standard Extension for Total Store Ordering, v0.1}
\chapter{``Zam'' Standard Extension for Misaligned Atomics, v0.1}

They're also called out specifically in the table:
https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L147

For Zihintpause however:
\chapter{``Zihintpause'' Pause Hint, Version 2.0}

See what I mean? I looked at the specs for the bitmanip stuff and for
crypto, which both never mention being standard.

That table has the caption:
> The table also defines the canonical order in which extension names
> must appear in the name string, with top-to-bottom in table
> indicating first-to-last in the name string. 

It only calls out Zicsr, Zifencei, Zam and Ztso are being permitted
before Sdef, but as I said I am not a specs person, so perhaps some
of the extensions in question are intended to go there but have not
yet been merged into the isa manual doc. Zihintpause *is* in the
isa manual though but not specifically called out.

Anyways, hopefully that at least helps with my line of thinking!

Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
