Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D8AEEAA40
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+t8mEAl4RHLTS6oDOi6LYOPixoj/9HW7GYe0bNOCLwk=; b=TRqrVJ0lubZuT7
	RgaoD8y4kKYqim1FiIi3Q1jHhBLWGpTCIDU0gzQWlftiySI88iltVbTa6fUxYkC4Kt1eLN0xCEL6H
	XzazwQePWwsu0EEamVWu7N9Hnj0XonBx1quEAm8irGsX1m5WMhT/3gZd0cUiY9V65o7tpnuoMTDiC
	zv8i55ZnEMNuim71GuetC6c8gMuPWaTM12NQraFnlxAUzjFXd6J1tMVSY2ISDNhZxyFq3Om2gT96x
	8cemyzWvwS2dyEM5EJZAQ9Wj0dicB8Fhwj9oTyMxZV1KQC4LFey188hoEQ352t0NN9sTI7HuEHmGo
	05mYMxEYXdi6w1FCHanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmxC-008aVz-2L;
	Thu, 14 Sep 2023 14:04:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmx8-008aUx-2n
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 14:04:21 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Rmf8y1GDlzGppB;
	Thu, 14 Sep 2023 22:00:18 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 14 Sep 2023 22:04:01 +0800
Message-ID: <aacefd22-39df-6941-4d43-d47f72caa9d2@huawei.com>
Date: Thu, 14 Sep 2023 22:04:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next 4/6] riscv, bpf: Add necessary Zbb instructions
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>
CC: Pu Lehui <pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>
References: <20230913153413.1446068-1-pulehui@huaweicloud.com>
 <20230913153413.1446068-5-pulehui@huaweicloud.com>
 <20230913-granny-heat-35d70b49ac85@spud>
 <20230914-ought-hypnotize-64cee0e27ed2@wendy>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20230914-ought-hypnotize-64cee0e27ed2@wendy>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_070419_279761_0201B38E 
X-CRM114-Status: GOOD (  16.32  )
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



On 2023/9/14 21:02, Conor Dooley wrote:
> On Wed, Sep 13, 2023 at 05:23:48PM +0100, Conor Dooley wrote:
>> On Wed, Sep 13, 2023 at 11:34:11PM +0800, Pu Lehui wrote:
>>> From: Pu Lehui <pulehui@huawei.com>
>>>
>>> Add necessary Zbb instructions introduced by [0] to reduce code size and
>>> improve performance of RV64 JIT. At the same time, a helper is added to
>>> check whether the CPU supports Zbb instructions.
>>>
>>> [0] https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-38-g865e7a7.pdf
>>>
>>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>>> ---
>>>   arch/riscv/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
>>>   1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
>>> index 8e0ef4d08..7ee59d1f6 100644
>>> --- a/arch/riscv/net/bpf_jit.h
>>> +++ b/arch/riscv/net/bpf_jit.h
>>> @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
>>>   	return IS_ENABLED(CONFIG_RISCV_ISA_C);
>>>   }
>>>   
>>> +static inline bool rvzbb_enabled(void)
>>> +{
>>> +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB);
>>> +}
>>
>> I dunno much about bpf, so passing question that may be a bit obvious:
>> Is this meant to be a test as to whether the kernel binary is built with
>> support for the extension, or whether the underlying platform is capable
>> of executing zbb instructions.
>>
>> Sorry if that would be obvious to a bpf aficionado, context I have here
>> is the later user and the above rvc_enabled() test, which functions
>> differently to Zbb and so doesn't really help me.
> 
> FTR, I got an off-list reply about this & it is meant to be a check as
> to whether the underlying platform supports the extension. The current
> test here is insufficient for that.
> 

Thanks Conor for explain me lot about the difference between Compressed 
instructions and Zbb instructions. As the compressed instructions are a 
build-time option, while the Zbb is runtime detected. We need to add 
additional runtime detection as show bellow:

riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)

will patch this suggestion to the next version.

Thanks,
Lehui.

> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
