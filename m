Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354C6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzIxLgnnwEiAzoYE+AA2q0zrWpuxNv67NoBU8BDtJAc=; b=MHCeE93PS0TeQ0MRaKdLhE//MO
	bDaPh9xB/3pyko/2OWrBlwd8mFO+0rLD0g4tETU/svuKhXdSSmxS5bk6QRMvEBofOfPbBa6OjZxaC
	kOXn2hj/aMe6M8S5ZIMlprBVrA+9aJvedJCwJm3On+Ui4YSeExzyULyBmQ++ynvzt47zZeip/2b+l
	KoqsZ/qnatc32gpxwWxgOhHDimZU+4V/xxtszBHyBITk+7XjBRiB0avmKvu1Up/0JnjYN2DRddwLb
	BiCX8ZNUnmyI431zrCXKVJ3vH5/5vnaxOkguqJBk7Dgc9D+DtEpDgmgtam+2aP31rp6Yw/zJTGTM/
	NwBreudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njGwT-00DSjQ-Ei; Tue, 26 Apr 2022 08:53:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njGwP-00DSgC-Ex
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 08:53:03 +0000
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KnbDr2r5kzGpRl;
 Tue, 26 Apr 2022 16:50:20 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 16:52:56 +0800
Received: from [10.67.110.237] (10.67.110.237) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 16:52:55 +0800
Subject: Re: [PATCH 1/2] riscv: ftrace: Fix the comments about the number of
 ftrace instruction
To: Guo Ren <guoren@kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil
 S Keshavamurthy" <anil.s.keshavamurthy@intel.com>, David Miller
 <davem@davemloft.net>, <jszhang@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, <liaochang1@huawei.com>,
 =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>, Pekka Enberg
 <penberg@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>
References: <20220426015751.88582-1-lihuafei1@huawei.com>
 <CAJF2gTR6hL1DfaGpPqfVwtmCHaVYK1nz_-W-h_mye34UjeeAcg@mail.gmail.com>
From: Li Huafei <lihuafei1@huawei.com>
Message-ID: <3bf77687-61c1-6d05-eea8-afe11a268421@huawei.com>
Date: Tue, 26 Apr 2022 16:52:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTR6hL1DfaGpPqfVwtmCHaVYK1nz_-W-h_mye34UjeeAcg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.67.110.237]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_015301_741835_C2C3D4C2 
X-CRM114-Status: GOOD (  15.59  )
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


On 2022/4/26 14:22, Guo Ren wrote:
> On Tue, Apr 26, 2022 at 9:59 AM Li Huafei <lihuafei1@huawei.com> wrote:
>> When DYNAMIC_FTRACE is enabled, we put four instructions in front of the
>> function for ftrace use, not five.
>>
>> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
>> ---
>>   arch/riscv/kernel/ftrace.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
>> index 4716f4cdc038..63f457650fa4 100644
>> --- a/arch/riscv/kernel/ftrace.c
>> +++ b/arch/riscv/kernel/ftrace.c
>> @@ -73,7 +73,7 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
>>   }
>>
>>   /*
>> - * Put 5 instructions with 16 bytes at the front of function within
>> + * Put 4 instructions with 16 bytes at the front of function within
> Yeah, 5 instructions are for mcount, -fpatchable-function-entry=8
> cause 8 16bit instructions.
I misunderstood, thanks for the clarification.
>
> Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
There is no functional fix here, do we need to add the fix tag?
>
> I recommend just delete "4 instructions with"
> - * Put 5 instructions with 16 bytes at the front of function within
> - * patchable function entry nops' area.
> + * Put 16 bytes at the front of the function within the patchable
> + * function entry nops' area.

I agree and will use this modification for the next version, thanks!


Huafei
>
>>    * patchable function entry nops' area.
>>    *
>>    * 0: REG_S  ra, -SZREG(sp)
>> --
>> 2.17.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
