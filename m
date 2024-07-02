Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A33C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 01:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqZdisUaPDR8OFS8qaeyieSfr/MzgpVJr7iwD2o5PiA=; b=ONch1KjUGOHiIJ
	Vv1txYp1mySAXBeYpvSC4D7jXYIxoS5K3VmoTy7m17Higrl1/zFceVQUMnfEFqDFIIwrMIj6VOMmT
	ymtOnglHomBuM+1RVSBwEm6ETp4vLtLp0HwvetdVfOawmdlM4tCxs8VJ1JtH3v9fC+G3P1TJFFIwX
	jY+mAZA58L2/h+dscBmJPWTZimXch/x23DcCJQWdaOVAHADy8XFmAAKHQKuQH2YAJ2bJN42Xiwcgh
	4bfaVNko+3qlyXKApZ54u08T1KtRYpl1/YsC60X4IRv90ij369YYsHdDtYeo/Zo1+MAQpcoewyEZu
	HvTh+7VL6xYY78d3/lVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSGD-00000005Gbk-47fH;
	Tue, 02 Jul 2024 01:24:45 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSGA-00000005GZI-0526
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 01:24:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WClYp1bLZznXv7;
	Tue,  2 Jul 2024 09:24:14 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id EF311180A9C;
	Tue,  2 Jul 2024 09:24:28 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jul 2024 09:24:28 +0800
Message-ID: <f0e18f46-96f9-4f89-802a-4cba349b1db1@huawei.com>
Date: Tue, 2 Jul 2024 09:24:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next v4 2/3] selftests/bpf: Factor out many
 args tests from tracing_struct
Content-Language: en-US
To: Daniel Borkmann <daniel@iogearbox.net>, Pu Lehui
	<pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20240622022129.3844473-1-pulehui@huaweicloud.com>
 <20240622022129.3844473-3-pulehui@huaweicloud.com>
 <2bbced4a-1022-aace-52b4-e0abe426347b@iogearbox.net>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <2bbced4a-1022-aace-52b4-e0abe426347b@iogearbox.net>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_182442_256126_E913D9EF 
X-CRM114-Status: UNSURE (   9.33  )
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

On 2024/7/2 0:12, Daniel Borkmann wrote:
> On 6/22/24 4:21 AM, Pu Lehui wrote:
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> Factor out many args tests from tracing_struct and rename some function
>> names to make more sense.
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> [...]
>> diff --git 
>> a/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c 
>> b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
>> new file mode 100644
>> index 000000000000..8bd696dc81d9
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Copyright (C) 2024. Huawei Technologies Co., Ltd */
> 
> Overall looks good and ready to land, one small request: lets drop the 
> copyright

Sure, will drop it in next version.

> comment here since this commit is only moving the existing tests out to 
> its own
> file which have been added originally via 5e9cf77d81f9 ("selftests/bpf: 
> add testcase
> for TRACING with 6+ arguments").
> 
> Thanks,
> Daniel
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
