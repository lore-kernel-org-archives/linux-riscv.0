Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D96C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIHGsVjXWfMJUl+3ctP/teLqsa6wFAiaqfzVl/ASqQ0=; b=o3udxLCRo3kTT9hv/YhH0RSMyg
	AzjvoCKpys4s73nO6yYAJzaTxM+zTcGAM2pbAP8RPXAjeJQhwTfBiNLe2ASACA8+JLIUMBJ3b37pZ
	LeSKA06Auz1V+0yd38NUP5GiOThFIDSpNphw46zd0/AAb4Mn1Xnxzbo2h86Hw54mvVsSvDqQOKmhx
	3I/1GCCcXwXFJ2FyDaDT7H2r6kBJkkTsYQNtbLmDXP3o3UFYPY00aMIylLEgJX9AFkKhfJ03OHMQg
	6nl8pOuiDRDUY8BK0V8Ttz+jMk3GlRrDRWSV3JoBbn6eCuNv2EqaFbyGw+DAJgJZ/fAjeBSG5dmXZ
	6/2riLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Q6Z-00FvSG-MU; Thu, 07 Jul 2022 11:55:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Q6V-00FvRT-FG
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 11:55:33 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ldvtp1QRYzkX3X;
	Thu,  7 Jul 2022 19:53:22 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 19:55:25 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 19:55:25 +0800
Subject: Re: [PATCH bpf-next v3 6/6] selftests/bpf: Remove the casting about
 jited_ksyms and jited_linfo
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
CC: bpf <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Networking
	<netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
	<xi.wang@gmail.com>, Martin KaFai Lau <kafai@fb.com>, Song Liu
	<songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20220530092815.1112406-1-pulehui@huawei.com>
 <20220530092815.1112406-7-pulehui@huawei.com>
 <CAEf4Bza4RT=KFhr9ev29967dyT0eF_+6ZRqK35beUvnA_NbcqQ@mail.gmail.com>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <09b87170-09e1-167f-4afa-ed516fa688ac@huawei.com>
Date: Thu, 7 Jul 2022 19:55:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEf4Bza4RT=KFhr9ev29967dyT0eF_+6ZRqK35beUvnA_NbcqQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_045531_900935_1C1AF657 
X-CRM114-Status: GOOD (  14.11  )
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



On 2022/6/4 5:05, Andrii Nakryiko wrote:
> On Mon, May 30, 2022 at 1:58 AM Pu Lehui <pulehui@huawei.com> wrote:
>>
>> We have unified data extension operation of jited_ksyms and jited_linfo
>> into zero extension, so there's no need to cast u64 memory address to
>> long data type.
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
>>   tools/testing/selftests/bpf/prog_tests/btf.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/btf.c b/tools/testing/selftests/bpf/prog_tests/btf.c
>> index e6612f2bd0cf..65bdc4aa0a63 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/btf.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/btf.c
>> @@ -6599,8 +6599,8 @@ static int test_get_linfo(const struct prog_info_raw_test *test,
>>          }
>>
>>          if (CHECK(jited_linfo[0] != jited_ksyms[0],
>> -                 "jited_linfo[0]:%lx != jited_ksyms[0]:%lx",
>> -                 (long)(jited_linfo[0]), (long)(jited_ksyms[0]))) {
>> +                 "jited_linfo[0]:%llx != jited_ksyms[0]:%llx",
>> +                 jited_linfo[0], jited_ksyms[0])) {
> 
> __u64 is not always printed with %lld, on some platforms it is
> actually %ld, so to avoid compiler warnings we just cast them to long
> long or unsigned long long (and then %lld or %llu is fine). So please
> update this part here and below.
> 

I found that __u64 in ppc64 actually is defined to be unsigned long. I 
will update it. Thanks.

>>                  err = -1;
>>                  goto done;
>>          }
>> @@ -6618,16 +6618,16 @@ static int test_get_linfo(const struct prog_info_raw_test *test,
>>                  }
>>
>>                  if (CHECK(jited_linfo[i] <= jited_linfo[i - 1],
>> -                         "jited_linfo[%u]:%lx <= jited_linfo[%u]:%lx",
>> -                         i, (long)jited_linfo[i],
>> -                         i - 1, (long)(jited_linfo[i - 1]))) {
>> +                         "jited_linfo[%u]:%llx <= jited_linfo[%u]:%llx",
>> +                         i, jited_linfo[i],
>> +                         i - 1, jited_linfo[i - 1])) {
>>                          err = -1;
>>                          goto done;
>>                  }
>>
>>                  if (CHECK(jited_linfo[i] - cur_func_ksyms > cur_func_len,
>> -                         "jited_linfo[%u]:%lx - %lx > %u",
>> -                         i, (long)jited_linfo[i], (long)cur_func_ksyms,
>> +                         "jited_linfo[%u]:%llx - %llx > %u",
>> +                         i, jited_linfo[i], cur_func_ksyms,
>>                            cur_func_len)) {
>>                          err = -1;
>>                          goto done;
>> --
>> 2.25.1
>>
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
