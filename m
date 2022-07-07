Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EB2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 12:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt1uwXEQxPhfEuwl72jwwzuZVOJbBIiUbmIiBRrJdlM=; b=KTOGwwqwtw3BvNKoBIfayRrm+i
	+ptMEQdVZgFJHvjKR9hIkoOAsR/QIwOm3B9YcZlRcmz31g/xsgXqBKlfXib10Gpb8mqka4k9Ee1ws
	5i0BAacgeT4KvSAwPenBjD11JoYTCwWcrshskaWBzzTfKnnBWsa1Avw72PvoP5QS2DLkHfKmreXpD
	kYjRJtn8s0szzl+dgMc2ofyKN5b7aOrdQHwZ9KqWodf6dFfOgDsqw24690B+TNZxedSrbjcsVvG8P
	GqOhOFKyuis7MCCPbcvlPkrJczhEccH9dN0L9ijlASr/YumSxFdSpWBZbver8FwtwVYgXjGuOthjT
	iaWzx/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9QXG-00Fz4q-8c; Thu, 07 Jul 2022 12:23:10 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9QXC-00Fz2Q-Ou
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 12:23:09 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LdwSr2t55zTgjS;
	Thu,  7 Jul 2022 20:19:24 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 20:23:01 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 20:23:01 +0800
Subject: Re: [PATCH bpf-next v3 4/6] libbpf: Unify memory address casting
 operation style
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Daniel Borkmann
	<daniel@iogearbox.net>
CC: bpf <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Networking
	<netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Martin KaFai Lau
	<kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20220530092815.1112406-1-pulehui@huawei.com>
 <20220530092815.1112406-5-pulehui@huawei.com>
 <a31efed5-a436-49c9-4126-902303df9766@iogearbox.net>
 <CAEf4BzacrRNDDYFR_4GH40+wxff=hCiyxymig6N+NVrM537AAA@mail.gmail.com>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <38a59b80-f64a-0913-73e4-29e4ee4149c5@huawei.com>
Date: Thu, 7 Jul 2022 20:23:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEf4BzacrRNDDYFR_4GH40+wxff=hCiyxymig6N+NVrM537AAA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_052307_193106_EF815494 
X-CRM114-Status: GOOD (  15.15  )
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



On 2022/6/4 5:03, Andrii Nakryiko wrote:
> On Mon, May 30, 2022 at 2:03 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>>
>> On 5/30/22 11:28 AM, Pu Lehui wrote:
>>> The members of bpf_prog_info, which are line_info, jited_line_info,
>>> jited_ksyms and jited_func_lens, store u64 address pointed to the
>>> corresponding memory regions. Memory addresses are conceptually
>>> unsigned, (unsigned long) casting makes more sense, so let's make
>>> a change for conceptual uniformity.
>>>
>>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>>> ---
>>>    tools/lib/bpf/bpf_prog_linfo.c | 9 +++++----
>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/lib/bpf/bpf_prog_linfo.c b/tools/lib/bpf/bpf_prog_linfo.c
>>> index 5c503096ef43..7beb060d0671 100644
>>> --- a/tools/lib/bpf/bpf_prog_linfo.c
>>> +++ b/tools/lib/bpf/bpf_prog_linfo.c
>>> @@ -127,7 +127,8 @@ struct bpf_prog_linfo *bpf_prog_linfo__new(const struct bpf_prog_info *info)
>>>        prog_linfo->raw_linfo = malloc(data_sz);
>>>        if (!prog_linfo->raw_linfo)
>>>                goto err_free;
>>> -     memcpy(prog_linfo->raw_linfo, (void *)(long)info->line_info, data_sz);
>>> +     memcpy(prog_linfo->raw_linfo, (void *)(unsigned long)info->line_info,
>>> +            data_sz);
>>
>> Took in patch 1-3, lgtm, thanks! My question around the cleanups in patch 4-6 ...
>> there are various other such cases e.g. in libbpf, perhaps makes sense to clean all
>> of them up at once and not just the 4 locations in here.
> 
> if (void *)(long) pattern is wrong, then I guess the best replacement
> should be (void *)(uintptr_t) ?
> 

I also think that (void *)(uintptr_t) would be the best replacement. I 
applied the changes to kernel/bpf and samples/bpf, and it worked fine. 
But in selftests/bpf, the following similar error occur at compile time:

progs/test_cls_redirect.c:504:11: error: cast to 'uint8_t *' (aka 
'unsigned char *') from smaller integer type 'uintptr_t' (aka 'unsigned 
int') [-Werror,-Wint-to-pointer-cast]
	.head = (uint8_t *)(uintptr_t)skb->data,

I take clang to compile with the front and back end separation, like 
samples/bpf, and it works. It seems that the all-in-one clang has 
problems handling the uintptr_t.

>>
>> Thanks,
>> Daniel
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
