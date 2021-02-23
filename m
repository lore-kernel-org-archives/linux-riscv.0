Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590A7C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 05:42:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64E661493
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 05:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64E661493
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hKaM/vOee3BnQfC+t0DKLcbxdAAMD3jxQMhPTmTiyKA=; b=HdXcbPqLdwFThofa0w/yM4+G+
	VVfVfXbh+/FB+8eceO6CUgJ16+16i+zSqKmE5ukokPxmUyDTTsiGG/O+78dG463Tvn+7cbOM+5pg+
	f5onhIIubq9b4+NfWQQ6QZjaQ7LTwFS1aioGxgE5A2fxqBAlg2rSzlhO0bKhuQtb4N0zEbFCctWkZ
	088V5P4fVguINi8x7+Ig6cHVL2JHveVPtJqcYJfqMI/HM+P5TRsIv0eQCntcBlC26/JX8gqAw7v6/
	/Z/uwEIPIc04wKHZCtpDfhPHjenEcpCt5PG2ZTOwDDfO0AReelgSoZlc4RAFJOOx6eZP/WQKy2Qhh
	kipjkJchA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEQSR-0004KY-5z; Tue, 23 Feb 2021 05:42:03 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEQSN-0004Ji-Ub
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 05:42:01 +0000
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id CBC6E240003;
 Tue, 23 Feb 2021 05:41:52 +0000 (UTC)
Subject: Re: [PATCH] riscv: Pass virtual addresses to kasan_mem_to_shadow
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-ed9c69f4-96ab-417c-90da-4c03a48d1268@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <ed70634f-f578-d1d5-7543-915477466d6f@ghiti.fr>
Date: Tue, 23 Feb 2021 00:41:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <mhng-ed9c69f4-96ab-417c-90da-4c03a48d1268@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_004200_137854_86E0D12F 
X-CRM114-Status: GOOD (  16.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, glider@google.com, dvyukov@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org, rppt@kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Le 2/22/21 =E0 9:58 PM, Palmer Dabbelt a =E9crit=A0:
> On Mon, 22 Feb 2021 00:07:34 PST (-0800), alex@ghiti.fr wrote:
>> kasan_mem_to_shadow translates virtual addresses to kasan shadow
>> addresses whereas for_each_mem_range returns physical addresses: it is
>> then required to use __va on those addresses before passing them to
>> kasan_mem_to_shadow.
>>
>> Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with =

>> for_each_mem_range()")
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>> =A0arch/riscv/mm/kasan_init.c | 4 ++--
>> =A01 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> index 4b9149f963d3..6d3b88f2c566 100644
>> --- a/arch/riscv/mm/kasan_init.c
>> +++ b/arch/riscv/mm/kasan_init.c
>> @@ -148,8 +148,8 @@ void __init kasan_init(void)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (void *)kasan_mem_to_shadow((void *=
)VMALLOC_END));
>>
>> =A0=A0=A0=A0 for_each_mem_range(i, &_start, &_end) {
>> -=A0=A0=A0=A0=A0=A0=A0 void *start =3D (void *)_start;
>> -=A0=A0=A0=A0=A0=A0=A0 void *end =3D (void *)_end;
>> +=A0=A0=A0=A0=A0=A0=A0 void *start =3D (void *)__va(_start);
>> +=A0=A0=A0=A0=A0=A0=A0 void *end =3D (void *)__va(_end);
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0 if (start >=3D end)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> =

> Thanks, but unless I'm missing something this is already in Linus' tree as
> c25a053e1577 ("riscv: Fix KASAN memory mapping.").

You're right, I missed this one: but for some reasons, this patch does =

not appear in for-next.

Thanks,

Alex

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
