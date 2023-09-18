Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C777CD37B4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 00:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjbYlVf3a0+SBY8aKosKolA8kONk8skCEaoVZ3Is5g8=; b=hwqzSbhBU7bOhb
	nmSLYV4R4IJ7+eYDprNkztPr4QWrMRgy2ZfcWtSUbjG1RabzLbWf/3+CHDK4Qcxg1ecFPYQKEZNQW
	EWAua2UmKzrpKdfYiC5+dnVwixSz5enjheSCkdHlpBsEvrdBZuuZbPsM45bw5e7bg0G6vQZvA6USc
	YrvSxWN/aA39juGpAuH9DgyG4qwj+kIvMqiLAGbbehyiqMuXANAp4TqmH9DI5PPFaVaKqEt4iDEN9
	vkSZX5zv+0ClVNquTXKJQRWSUnYD7qLFC8thR7LcQ3pDfnTHy32tJl5kdzyufcbSA7rIp2tqoc/H1
	GQGF9ivpXl5mcwidTQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi2CA-00EAMW-0d;
	Mon, 18 Sep 2023 00:32:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi2C7-00EALl-2d
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 00:32:57 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Rplzw07rpzVkHc;
	Mon, 18 Sep 2023 08:29:47 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 18 Sep 2023 08:32:41 +0800
Message-ID: <1708aa5b-78d1-486c-99b1-44d35b4c2f5e@huawei.com>
Date: Mon, 18 Sep 2023 08:32:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 3/6] riscv, bpf: Simplify sext and zext logics in
 branch instructions
To: Simon Horman <horms@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>
References: <20230913153413.1446068-1-pulehui@huaweicloud.com>
 <20230913153413.1446068-4-pulehui@huaweicloud.com>
 <20230916144742.GB1125562@kernel.org>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20230916144742.GB1125562@kernel.org>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_173256_048303_09841A05 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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



On 2023/9/16 22:47, Simon Horman wrote:
> On Wed, Sep 13, 2023 at 11:34:10PM +0800, Pu Lehui wrote:
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> There are many extension helpers in the current branch instructions, and
>> the implementation is a bit complicated. We simplify this logic through
>> two simple extension helpers with alternate register.
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
>>   arch/riscv/net/bpf_jit_comp64.c | 82 +++++++++++++--------------------
>>   1 file changed, 31 insertions(+), 51 deletions(-)
>>
>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>> index 4a649e195..1728ce16d 100644
>> --- a/arch/riscv/net/bpf_jit_comp64.c
>> +++ b/arch/riscv/net/bpf_jit_comp64.c
>> @@ -141,6 +141,19 @@ static bool in_auipc_jalr_range(s64 val)
>>   		val < ((1L << 31) - (1L << 11));
>>   }
>>   
>> +/* Modify rd pointer to alternate reg to avoid corrupting orignal reg */
> 
> Hi Pu Lehui,
> 
> nit: original >
> I suggest running checkpatch --codespell over this series before submitting
> v2.

Thanks Simon, will check this in next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
