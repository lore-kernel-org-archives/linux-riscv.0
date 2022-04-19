Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843D4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHDOIkM3KFHON35iDNK2lu0wv73c2MqEePQHh+EmT4Y=; b=Da5FzlAZqEFg0ca+EP3PivcmqG
	EEb63CNEMUJa2ZFWAvIg0ZRPCpkzMCRkbCZdrG4ZIqh2m/qMBMl6DqCiAbtMRDAT/kuzucGsrvIIf
	0OsFRtiFfemNkS1Felc+HquShPL+PWzwk9R2vSconPrm0OJA5eSNGWoieCjkJKdOZLdcBXqlpDi9c
	XeyRk9q+zs3pnopGoFJtuMXINXI1P64NdSFwpjiJvoOJi+M4ylF5xRQGC/bl6W3rc92WVclzpvn/U
	ta7OV9fliQM2zu8n3NIB13Vh3NKMiMIpXBreDhS7jUJ84rbc8+hNFV2gmaul61gN0wlmP4vSMte0j
	UxaExFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngoDU-003zsj-Uu; Tue, 19 Apr 2022 13:48:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngnT0-003g3F-2x
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 13:00:28 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KjP3Y51FgzFq1G;
 Tue, 19 Apr 2022 20:57:45 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 21:00:15 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 21:00:15 +0800
Subject: Re: [PATCH bpf-next] libbpf: Support riscv USDT argument parsing logic
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
CC: bpf <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, john fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
References: <20220418042222.2464199-1-pulehui@huawei.com>
 <CAEf4BzbavSC=JN=sowFY3t4yOUfe8QtVXhdG+y7a-T1YtfRqXQ@mail.gmail.com>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <ef4ffe1f-1f3b-e98e-fc5f-26150e22871f@huawei.com>
Date: Tue, 19 Apr 2022 21:00:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEf4BzbavSC=JN=sowFY3t4yOUfe8QtVXhdG+y7a-T1YtfRqXQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_060026_504558_6593048A 
X-CRM114-Status: GOOD (  17.17  )
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



On 2022/4/19 12:33, Andrii Nakryiko wrote:
> On Sun, Apr 17, 2022 at 8:53 PM Pu Lehui <pulehui@huawei.com> wrote:
>>
>> Add riscv-specific USDT argument specification parsing logic.
>> riscv USDT argument format is shown below:
>> - Memory dereference case:
>>    "size@off(reg)", e.g. "-8@-88(s0)"
>> - Constant value case:
>>    "size@val", e.g. "4@5"
>> - Register read case:
>>    "size@reg", e.g. "-8@a1"
>>
>> s8 will be marked as poison while it's a reg of riscv, we need
>> to alias it in advance.
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
> 
> Can you please mention briefly the testing you performed as I'm not
> able to test this locally.
> 
Both RV32 and RV64 have been tested. I will attach the test result in 
v2. Meanwhile, I found a small problem with libbpf USDT, and will be 
post in v2.
>>   tools/lib/bpf/usdt.c | 107 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 107 insertions(+)
>>
>> diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
>> index 934c25301ac1..b8af409cc763 100644
>> --- a/tools/lib/bpf/usdt.c
>> +++ b/tools/lib/bpf/usdt.c
>> @@ -10,6 +10,11 @@
>>   #include <linux/ptrace.h>
>>   #include <linux/kernel.h>
>>
>> +/* s8 will be marked as poison while it's a reg of riscv */
>> +#if defined(__riscv)
>> +#define rv_s8 s8
>> +#endif
>> +
>>   #include "bpf.h"
>>   #include "libbpf.h"
>>   #include "libbpf_common.h"
>> @@ -1400,6 +1405,108 @@ static int parse_usdt_arg(const char *arg_str, int arg_num, struct usdt_arg_spec
>>          return len;
>>   }
>>
>> +#elif defined(__riscv)
>> +
>> +static int calc_pt_regs_off(const char *reg_name)
>> +{
>> +       static struct {
>> +               const char *name;
>> +               size_t pt_regs_off;
>> +       } reg_map[] = {
>> +               { "ra", offsetof(struct user_regs_struct, ra) },
>> +               { "sp", offsetof(struct user_regs_struct, sp) },
>> +               { "gp", offsetof(struct user_regs_struct, gp) },
>> +               { "tp", offsetof(struct user_regs_struct, tp) },
>> +               { "t0", offsetof(struct user_regs_struct, t0) },
>> +               { "t1", offsetof(struct user_regs_struct, t1) },
>> +               { "t2", offsetof(struct user_regs_struct, t2) },
>> +               { "s0", offsetof(struct user_regs_struct, s0) },
>> +               { "s1", offsetof(struct user_regs_struct, s1) },
>> +               { "a0", offsetof(struct user_regs_struct, a0) },
>> +               { "a1", offsetof(struct user_regs_struct, a1) },
>> +               { "a2", offsetof(struct user_regs_struct, a2) },
>> +               { "a3", offsetof(struct user_regs_struct, a3) },
>> +               { "a4", offsetof(struct user_regs_struct, a4) },
>> +               { "a5", offsetof(struct user_regs_struct, a5) },
>> +               { "a6", offsetof(struct user_regs_struct, a6) },
>> +               { "a7", offsetof(struct user_regs_struct, a7) },
>> +               { "s2", offsetof(struct user_regs_struct, s2) },
>> +               { "s3", offsetof(struct user_regs_struct, s3) },
>> +               { "s4", offsetof(struct user_regs_struct, s4) },
>> +               { "s5", offsetof(struct user_regs_struct, s5) },
>> +               { "s6", offsetof(struct user_regs_struct, s6) },
>> +               { "s7", offsetof(struct user_regs_struct, s7) },
>> +               { "s8", offsetof(struct user_regs_struct, rv_s8) },
>> +               { "s9", offsetof(struct user_regs_struct, s9) },
>> +               { "s10", offsetof(struct user_regs_struct, s10) },
>> +               { "s11", offsetof(struct user_regs_struct, s11) },
>> +               { "t3", offsetof(struct user_regs_struct, t3) },
>> +               { "t4", offsetof(struct user_regs_struct, t4) },
>> +               { "t5", offsetof(struct user_regs_struct, t5) },
>> +               { "t6", offsetof(struct user_regs_struct, t6) },
> 
> would it make sense to order registers a bit more "logically"? Like
> s0-s11, t0-t6, etc. Right now it looks very random and it's hard to
> see if all the registers from some range of registers are defined.
> 
I code it according to the RISCV specification, and for sure, we can 
make it more intuitive.

Thanks,
Lehui
>> +       };
>> +       int i;
>> +
> 
> [...]
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
