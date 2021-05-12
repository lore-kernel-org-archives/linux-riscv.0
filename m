Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32987C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 15:12:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6960461A13
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 15:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6960461A13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QgI6ZdNKxhENX4yQy6vD1/pIIoOEusKTGAUE0Luc3Y4=; b=XMnFqHHmizm5f/vg9Q/1i8cg6
	7+SXL5ZcETT5NZuj6NMsQ5JHteRjzGQ7ax+LEH6nc9u1I9b5UdqEF2vaCvtGD4/txX0BrvLI7nren
	2GYi1VMY6DX95ONijK7/QUIOKFTT470xs0mUgZsFvVXxqISbqz1thcY0QjTxvhsw8S4SA7A+oNYQ4
	C00aaKyW4r6SpFKWT3GeZSt+oP0NztcG3/7Vv3/SeASWYSV4hCsmJTr8B0jGnj2DgD+yW0QIZeeuS
	RWBvyrp+/UXIDx7pl5cBW5B9RjjjMP12f5c5OolRNXcH5+pVmUURnsGNk5W7RzQIhcLA6z43Nn2DV
	Ljjrp93Uw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqWe-0037zi-SS; Wed, 12 May 2021 15:11:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqWb-0037zN-Rg
 for linux-riscv@desiato.infradead.org; Wed, 12 May 2021 15:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=9QUWeEjhiFoZc2LLoBUr8iTjclPvPpM12WQb77T0ZhU=; b=DfmikNxRh35T4ThsOfxhvR3y8b
 pwqazDdsibSBrYWjz2zHJkHOdpEpRkRYfUIhRQq6nkdm6KM583dilRZFYuuwftUe45MrkkdIYDBUo
 9w4nmIlpzjNFJBneilxXJMtGZ7u8e1P9QZtmD2jydAmOydu9+q1CbKIb0JucqlUnUAdwm9/V9e3Nl
 22RLxqacC1t4spGH5QGm1LT29y8yZfUwi6sV6ouZCwpCuhAFPui7KyJVBRgXyxfgX0z+ojIh8n5ZK
 tPzXlrJV1P2cAgp2YiOj+OphWuVwF8vDnbEtvpQCAzQMD6g178Cgauf1e/kwljELnPnkfYU/UgKJ8
 Jj62Turw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqWY-00AUZB-O3
 for linux-riscv@lists.infradead.org; Wed, 12 May 2021 15:11:48 +0000
X-Originating-IP: 90.112.180.199
Received: from [192.168.1.36] (lfbn-gre-1-220-199.w90-112.abo.wanadoo.fr
 [90.112.180.199]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6C419FF803;
 Wed, 12 May 2021 15:11:30 +0000 (UTC)
Subject: Re: [PATCH] riscv: mm: Drop redundant _sdata and _edata declaration
To: Kefeng Wang <wangkefeng.wang@huawei.com>, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Cc: palmerdabbelt@google.com, atish.patra@wdc.com, paul.walmsley@sifive.com,
 anshuman.khandual@arm.com
References: <20210510115808.96615-1-wangkefeng.wang@huawei.com>
 <1bb74f75-8452-54e0-857d-7d3cf1541847@ghiti.fr>
 <771850bd-8533-c478-efd6-448d404e688f@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <f2555b7a-8f67-ac7e-9a5e-f14f78ed58b9@ghiti.fr>
Date: Wed, 12 May 2021 17:11:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <771850bd-8533-c478-efd6-448d404e688f@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_081146_939987_3592AE8E 
X-CRM114-Status: GOOD (  17.80  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Kefeng,

On 10/05/2021 16:03, Kefeng Wang wrote:
> =

> =

> On 2021/5/10 20:34, Alex Ghiti wrote:
>> Hi Kefeng,
>>
>> On 10/05/2021 13:58, Kefeng Wang wrote:
>>> The _sdata/_edata is already in sections.h, drop redundant
>>> declaration, also move _xiprom/_exiprom close to the caller.
>>>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> ---
>>> =A0 arch/riscv/mm/init.c | 8 +-------
>>> =A0 1 file changed, 1 insertion(+), 7 deletions(-)
>>>
>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> index 136d0342b147..4d08e1f7a362 100644
>>> --- a/arch/riscv/mm/init.c
>>> +++ b/arch/riscv/mm/init.c
>>> @@ -176,13 +176,6 @@ static void __init setup_bootmem(void)
>>> =A0=A0=A0=A0=A0 memblock_allow_resize();
>>> =A0 }
>>> -#ifdef CONFIG_XIP_KERNEL
>>> -
>>> -extern char _xiprom[], _exiprom[];
>>> -extern char _sdata[], _edata[];
>>> -
>>> -#endif /* CONFIG_XIP_KERNEL */
>>> -
>>> =A0 #ifdef CONFIG_MMU
>>> =A0 static struct pt_alloc_ops _pt_ops __ro_after_init;
>>> @@ -461,6 +454,7 @@ uintptr_t load_pa, load_sz;
>>> =A0 #endif
>>> =A0 #ifdef CONFIG_XIP_KERNEL
>>> +extern char _xiprom[], _exiprom[];
>>
>>
>> This place is guarded by #ifdef CONFIG_MMU and Vitaly has plans to =

>> make XIP kernels work on !MMU configurations, so that may not be the =

>> best place to move this declaration?
> OK, is it better to move the top of the init.c, close to =

> kernel_virt_addr, or don't change them.
> =


I like when all declarations are at the beginning of the file, but =

that's subjective so you can put this wherever you like as long as it is =

outside #ifdef CONFIG_MMU :)

Thanks,

Alex

>>
>> Thanks,
>>
>> Alex
>>
>>> =A0 uintptr_t xiprom, xiprom_sz;
>>> =A0 #define xiprom_sz=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&xiprom_=
sz)))
>>> =A0 #define xiprom=A0=A0=A0=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&x=
iprom)))
>>>
>> .
>>
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
