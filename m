Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6717FC001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 02:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7OSyOc5QM/IAXnhxXV5Q2g9Z8wnzNu7DJgUq4V/p7o=; b=jOskOZNc3YHnon
	FKdnLedU9s1K89y9VXWF1tSVceh2yvC6ZAz+Ug0vo/FlbP4uz/3A8kd/zXpv/iiiPaCTMCeS9kLEK
	knp2lIMVGZbjw2/yTcXe4GaAHyfURpUs8puhSC0WfqhH7eLGk/+T7RM5b8szVw+PcoUpQyk56wpSS
	v4bgSnFbdCaU05LAxju/k2G13iBa8dD/wZltDTCqob9ulScWx122ybQP+KrJPsN+tuBz11aEwbFPU
	eSHeCg9XhtqpUmrClWFeCkbYCUhi8d0CI/0mDKCpWLjwfTWVMgOz/yynBMrQHCld3KBqlIObUi0UT
	oI1N6LVdKsIog8v7bHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZ0G-003tmX-3A;
	Wed, 09 Aug 2023 02:32:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZ0D-003tlS-02
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 02:32:51 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RLDZn1H2pz1GDfP;
	Wed,  9 Aug 2023 10:31:29 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 10:32:39 +0800
Message-ID: <721de7d4-2802-7399-c2d4-2631cfb20515@huawei.com>
Date: Wed, 9 Aug 2023 10:32:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next] riscv/bpf: Fix truncated immediate warning in
 rv_s_insn
To: Luke Nelson <lukenels@cs.washington.edu>
CC: <bpf@vger.kernel.org>, kernel test robot <lkp@intel.com>, Xi Wang
	<xi.wang@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei
 Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230727024931.17156-1-luke.r.nels@gmail.com>
 <b85bcf1d-9467-4df6-da11-8f0b24165ada@huawei.com>
 <CC58CCF3-1994-4C50-B8FC-E1520ED743BF@cs.washington.edu>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <CC58CCF3-1994-4C50-B8FC-E1520ED743BF@cs.washington.edu>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_193249_396694_6BD905EE 
X-CRM114-Status: GOOD (  17.21  )
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



On 2023/8/9 0:08, Luke Nelson wrote:
> 
>>>   static inline u32 rv_s_insn(u16 imm11_0, u8 rs2, u8 rs1, u8 funct3, u8 opcode)
>>>   {
>>> - u8 imm11_5 = imm11_0 >> 5, imm4_0 = imm11_0 & 0x1f;
>>> + u32 imm11_5 = (imm11_0 >> 5) & 0x7f, imm4_0 = imm11_0 & 0x1f;
>>
>> Hi Luke,
>>
>> keep u8 and add 0x7f explicit mask should work. I ran the repro case and it can silence the warning.
>>
>>>
>>>    return (imm11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) |
>>>    (imm4_0 << 7) | opcode;
> 

Hi Luke,

Thank for more detailed explanation.

> That does fix the warning, but I think explicitly declaring imm11_5
> as u32 is more clear here than the current code which relies on
> implicit promotion of imm11_5 from u8 to signed int in the expression
> (imm11_5 << 25).
> 
> Because of the promotion to signed int, (imm11_5 << 25) is technically
> signed overflow and undefined behavior whenever the shift changes
> the value in the sign bit. In practice, this isn't an issue; both
> because the kernel is compiled with -fno-strict-overflow, but also
> because GCC documentation explicitly states that "GCC does not use
> the latitude given in C99 and C11 only to treat certain aspects of
> signed '<<' as undefined" [1].
> 
> Though it may not be an issue in practice, since I'm touching this
> line anyways to fix the warning, I think it makes sense to update
> the type of imm11_5 to be u32 at the same time.
> 

Agree. But this inconsistency looks weird, i.e. imm11_5 change to u32 
while rs2, rs1 and funct3 still u8. Anyway, our primary goal is to 
silence the sparse warning, and the current patch looks good to me. 
Let's go ahead.

Feel free to add:
Reviewed-by: Pu Lehui <pulehui@huawei.com>

>> Nit: maybe use "riscv, bpf" for the subject will look nice for the riscv-bpf git log tree.
> 
> Sure, I can send out a new revision with an updated subject line.
> 
> - Luke
> 
> 
> [1]: https://gcc.gnu.org/onlinedocs/gcc/Integers-implementation.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
