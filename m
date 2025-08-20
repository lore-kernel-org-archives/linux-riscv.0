Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05320CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MKbKfcIm7YR50vZSX1eu6n+3iJ5twsZjRooxSof3AU=; b=ilEQSlxZPMJVg+
	ZPYHDFkhPdEYJrPlWdFDj6xxLLRtz9u/SfDxV3DTH2Me5aq34XXzvCSBmnFqpp3OOUoV9wZcBb4Ot
	hOdeks670rRLlvZM416NcqMaFFoLI8lTuIc14Wf4MeX55jFQ8KZdmfC/PNHDDyDimS+/NjNukp+D0
	BzHjSs8Fx/d9yjgOhA+hTPUuvuiRze3Lbw4XI642qqrcXnXSp/6A4cCldGz/WtpPxMK2Bl53CIIoF
	J+bcNBQle+WFHU3SvVaHX5tBIMD/aBLZwwvrs4AnroOLcd13aFeJlKQQykFmipWmdZMAIF9p5JbTj
	z8/WzGU9OHsM4k+4rWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogZd-0000000DGaT-1vgj;
	Wed, 20 Aug 2025 11:01:45 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoflo-0000000D6A4-3QVw
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 10:10:18 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c6MZD0GyLz2gL95;
	Wed, 20 Aug 2025 18:07:16 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 236CE1A0171;
	Wed, 20 Aug 2025 18:10:09 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 Aug 2025 18:10:07 +0800
Message-ID: <239193b7-7dab-45b0-ab13-06bfe3f96f22@huawei.com>
Date: Wed, 20 Aug 2025 18:10:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: bpf: Fix uninitialized symbol 'retval_off'
Content-Language: en-US
To: Chenghao Duan <duanchenghao@kylinos.cn>
CC: <ast@kernel.org>, <bjorn@kernel.org>, <puranjay@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
	<eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>,
	<haoluo@google.com>, <jolsa@kernel.org>, <alex@ghiti.fr>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250820062520.846720-1-duanchenghao@kylinos.cn>
 <8b836b6e-103a-41c2-b111-0417d8db4dce@huawei.com>
 <20250820092628.GA1289807@chenghao-pc>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20250820092628.GA1289807@chenghao-pc>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_031017_046851_0894417C 
X-CRM114-Status: GOOD (  15.22  )
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



On 2025/8/20 17:26, Chenghao Duan wrote:
> On Wed, Aug 20, 2025 at 02:52:01PM +0800, Pu Lehui wrote:
>>
>>
>> On 2025/8/20 14:25, Chenghao Duan wrote:
>>> In __arch_prepare_bpf_trampoline(), retval_off is only meaningful when
>>> save_ret is true, so the current logic is correct. However, in the
>>
>> lgtm, and same for `ip_off`, pls patch it together.
> 
> I also checked at the time that ip_off is only initialized and assigned
> when flags & BPF_TRAMP_F_IP_ARG is true. However, I noticed that the use
> of ip_off also requires this condition, so the compiler did not issue a
> warning.
> 
> Chenghao
> 
>>
>>> original logic, retval_off is only initialized under certain

Can you show how to replay this warning? I guess the warning path is as 
follow. Compiler didn't know fmod_ret prog need BPF_TRAMP_F_CALL_ORIG.

```
if (fmod_ret->nr_links) {
	...
	emit_sd(RV_REG_FP, -retval_off, RV_REG_ZERO, ctx);
}
```

>>> conditions, which may cause a build warning.
>>>
>>> So initialize retval_off unconditionally to fix it.
>>>
>>> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
>>> ---
>>>    arch/riscv/net/bpf_jit_comp64.c | 5 ++---
>>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>>> index 10e01ff06312..49bbda8372b0 100644
>>> --- a/arch/riscv/net/bpf_jit_comp64.c
>>> +++ b/arch/riscv/net/bpf_jit_comp64.c
>>> @@ -1079,10 +1079,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>>>    	stack_size += 16;
>>>    	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
>>> -	if (save_ret) {
>>> +	if (save_ret)
>>>    		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
>>> -		retval_off = stack_size;
>>> -	}
>>> +	retval_off = stack_size;
>>>    	stack_size += nr_arg_slots * 8;
>>>    	args_off = stack_size;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
