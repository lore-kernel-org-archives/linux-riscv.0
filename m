Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0786C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnOBzwQJqzkwJUYomgQelYEvdQ2nuqnEnNI+w3P/WfQ=; b=peR1E73J4zWZQw
	brGStgKdMJQBhT1qL7bB+tvkD8t0Wyjy26mhxbqbqDP9VBMLrTJsO121pUIMtMDk1iA267cMP/M5s
	Nmc374+UAMCx9cqbMcGWipMFJaI5cQtAOXZd4mYX9mceffMO7tPpEOXuQharQny7mc6QgP2qL/euJ
	6qtqTHgqRxM496AYgHXJfx8e0gr3YmPb84J8eZ0GNDpEQzEO35raY79DIUsNNowJeWZ0oxZA+uLkv
	gnmYw9zi3dE3k9uS+1BGjfe60s0iIakeeRTu0HRYmEcaUAgsD4jVIQn6/UP4mnE5gQM2LiMRZmKVq
	qiU55koPzgBO7NaDhOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc8c-00000006aaV-1CzU;
	Tue, 02 Jul 2024 11:57:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc8Y-00000006aZY-30Sz
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 11:57:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WD1W63GRVzZhJF;
	Tue,  2 Jul 2024 19:52:50 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id AB824180A9C;
	Tue,  2 Jul 2024 19:57:22 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jul 2024 19:57:21 +0800
Message-ID: <ea07cb5a-da1e-4ba9-b895-1a12be224962@huawei.com>
Date: Tue, 2 Jul 2024 19:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 2/3] selftests/bpf: Factor out many args tests
 from tracing_struct
To: Jiri Olsa <olsajiri@gmail.com>, Pu Lehui <pulehui@huaweicloud.com>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Puranjay Mohan
	<puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20240702013730.1082285-1-pulehui@huaweicloud.com>
 <20240702013730.1082285-3-pulehui@huaweicloud.com> <ZoPfSe-CvdEwlxjo@krava>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <ZoPfSe-CvdEwlxjo@krava>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_045730_960119_8BEEBCD5 
X-CRM114-Status: GOOD (  10.02  )
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



On 2024/7/2 19:06, Jiri Olsa wrote:
> On Tue, Jul 02, 2024 at 01:37:29AM +0000, Pu Lehui wrote:
> 
> SNIP
> 
>> +
>> +static void test_struct_many_args(void)
>> +{
>> +	struct tracing_struct_many_args *skel;
>> +	int err;
>> +
>> +	skel = tracing_struct_many_args__open_and_load();
>> +	if (!ASSERT_OK_PTR(skel, "tracing_struct_many_args__open_and_load"))
>> +		return;
>> +
>> +	err = tracing_struct_many_args__attach(skel);
>> +	if (!ASSERT_OK(err, "tracing_struct_many_args__attach"))
>> +		goto destroy_skel;
>> +
>> +	ASSERT_OK(trigger_module_test_read(256), "trigger_read");
>> +
>>   	ASSERT_EQ(skel->bss->t7_a, 16, "t7:a");
>>   	ASSERT_EQ(skel->bss->t7_b, 17, "t7:b");
>>   	ASSERT_EQ(skel->bss->t7_c, 18, "t7:c");
>> @@ -74,12 +95,15 @@ static void test_fentry(void)
>>   	ASSERT_EQ(skel->bss->t8_g, 23, "t8:g");
>>   	ASSERT_EQ(skel->bss->t8_ret, 156, "t8 ret");
>>   
>> -	tracing_struct__detach(skel);
>> +	tracing_struct_many_args__detach(skel);
> 
> nit, I know it's in the current code, but tracing_struct_many_args__destroy
> will take care of the detach, so no need to call it explicitly

Alright, will resend a new version. Thanks

> 
> jirka
> 
> 
>>   destroy_skel:
>> -	tracing_struct__destroy(skel);
>> +	tracing_struct_many_args__destroy(skel);
>>   }
>>   
> 
> SNIP

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
