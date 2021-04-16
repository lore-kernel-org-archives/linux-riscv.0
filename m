Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04897C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:48:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6726115B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C6726115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fDWpJiQq04Bxp66s/vdHWrHhlg3wtDBMCfD2Lss1Roo=; b=X0S9JKqN+QhwAeXBD8c7srYAN
	8zhbKaxk1h+uQECRjSK/T3ls5WUB2mygdhYZxgGCcz8VDl5UymD0HpjLAH5w6IVoCHLdeycnGn5CS
	icIH9OEbBD0OshF6mBEfObbydkc7IphpbRuFza+MY8mdg5Wycj/qJPwedm5vypk8Gu1I+PzokT3cl
	03WB52nJGlbbyp1uOSsyFtnQ/MEfe2XO4EYBB23k7W13Yn0xUsS/HCcgEDeTaGOqBbv/VcHQIoCNg
	xsGG8dFxVSY9FSqYNuBPGyq2rjwuW6obGaVm8/alwe12FqVcIjZU01rvFcfWApVThM6Nd5mHaoJii
	B98QTBgNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXM0j-001n0k-AV; Fri, 16 Apr 2021 10:47:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXM0Y-001mvk-3J
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 10:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Nb4eAVWb/jm8f0DTNdfSUaAZRgWKjTREkrcPE0XfuQs=; b=JdDYEU5sUYY+Fla65EH+VQtDSJ
 62tx4FSzEkLOAesl1n8alldlfX5DIugfb7j1/181An4iNL05/axS7NbMzNNrKZE2OikKxLfXu9LOs
 +RuYvoQmfu+xxE7cp6OrOwe2HVW5Koor2eIaM72Dx06kQy0Qk8yompEEsYEdNgcQRBBZJfm05hKbV
 X8N5Uqq9CtSZAH0APyt8MdAlhhuDJMM8ZhrF+mQ+M9chDIHcH1b4m3Dbq4ZXhJT4pzzq1uuwFWuSJ
 xpai8uKbeZgGMeheQeqE9eaMuZt8pnUljebe/dDdv1GATQYMiMPASnd1LMAlHL7cPkfzp5B1s8tIi
 BJVOWYcA==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXM0V-009Hut-2q
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 10:47:28 +0000
X-Originating-IP: 81.185.167.252
Received: from [192.168.43.237] (252.167.185.81.rev.sfr.net [81.185.167.252])
 (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 62B3840011;
 Fri, 16 Apr 2021 10:47:18 +0000 (UTC)
Subject: Re: [PATCH] riscv: Protect kernel linear mapping only if
 CONFIG_STRICT_KERNEL_RWX is set
To: Anup Patel <anup@brainfault.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-doc@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-arch <linux-arch@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <20210415110426.2238-1-alex@ghiti.fr>
 <CAAhSdy2pD2q99-g3QSSHbpqw1ZD402fStFmbKNFzht2m=MS8mQ@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <f659c498-a273-f249-a81b-cab1ed1ba2bb@ghiti.fr>
Date: Fri, 16 Apr 2021 06:47:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2pD2q99-g3QSSHbpqw1ZD402fStFmbKNFzht2m=MS8mQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_034727_282903_0B227E61 
X-CRM114-Status: GOOD (  19.73  )
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

Hi Anup,

Le 4/16/21 =E0 6:41 AM, Anup Patel a =E9crit=A0:
> On Thu, Apr 15, 2021 at 4:34 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> If CONFIG_STRICT_KERNEL_RWX is not set, we cannot set different permissi=
ons
>> to the kernel data and text sections, so make sure it is defined before
>> trying to protect the kernel linear mapping.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> =

> Maybe you should add "Fixes:" tag in commit tag ?

Yes you're right I should have done that. Maybe Palmer will squash it as =

it just entered for-next?

> =

> Otherwise it looks good.
> =

> Reviewed-by: Anup Patel <anup@brainfault.org>

Thank you!

Alex

> =

> Regards,
> Anup
> =

>> ---
>>   arch/riscv/kernel/setup.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 626003bb5fca..ab394d173cd4 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -264,12 +264,12 @@ void __init setup_arch(char **cmdline_p)
>>
>>          sbi_init();
>>
>> -       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
>> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>>                  protect_kernel_text_data();
>> -
>> -#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>> -       protect_kernel_linear_mapping_text_rodata();
>> +#ifdef CONFIG_64BIT
>> +               protect_kernel_linear_mapping_text_rodata();
>>   #endif
>> +       }
>>
>>   #ifdef CONFIG_SWIOTLB
>>          swiotlb_init(1);
>> --
>> 2.20.1
>>
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
