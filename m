Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF85FC83F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Unn7KJ3akRlC2ujllejSd2+1ZsZ39U6CYV6nZwHoOpM=; b=bNmgRJAH6ni/IC
	93ip9GSs5JrmXmuloEtse0Fj02OqrIz6PHgw+SMp/HW8bGl3ZcKezPV4HZ4GhCJ66Z3PLOy0MYjHl
	Q7YzCbyuXUnWO+3yzn3mKSRIzP6f/ySXlb74vS9fK5W9opUHUImk6HOAXv24jeeciWXQlruChZuhA
	pjUOesQ/NaCZSHxwraH3h301fQc49zmryTOIlG57Qvm4Ml+WE0uWtQm5xIQ8KDheUVAKOZSGwqqlS
	MCBP4Jy8xoBrq2100ODieSmL8rS/3t/eEZCS4rvCJknZi/DtMepwQK/M5hehc9FBUuQYYIlFN6pPL
	hjd/nzxYbmpufeVp14cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjgPQ-00000002Ssq-48vT;
	Thu, 29 Aug 2024 14:46:00 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjfJC-00000002DK4-1spk
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 13:35:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Wvj0M6gnyz1xwG6;
	Thu, 29 Aug 2024 21:33:23 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 1246D180042;
	Thu, 29 Aug 2024 21:35:22 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Aug 2024 21:35:21 +0800
Message-ID: <f7a7d089-3313-4c25-884c-8d073ddf54e4@huawei.com>
Date: Thu, 29 Aug 2024 21:35:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 0/2] Fix accessing first syscall argument on RV64
Content-Language: en-US
To: Pu Lehui <pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Ilya Leoshkevich
	<iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20240829133253.882133-1-pulehui@huaweicloud.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240829133253.882133-1-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_063531_453094_D48B7805 
X-CRM114-Status: UNSURE (   7.20  )
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


On 2024/8/29 21:32, Pu Lehui wrote:
> On RV64, as Ilya mentioned before [0], the first syscall parameter should be
> accessed through orig_a0 (see arch/riscv64/include/asm/syscall.h),
> otherwise it will cause selftests like bpf_syscall_macro, vmlinux,
> test_lsm, etc. to fail on RV64.
> 
> Link: https://lore.kernel.org/bpf/20220209021745.2215452-1-iii@linux.ibm.com [0]
> 
> Pu Lehui (2):
>    libbpf: Fix accessing first syscall argument on RV64
>    selftests/bpf: Skip case involving first arg in bpf_syscall_macro on
>      RV64
> 
>   tools/lib/bpf/bpf_tracing.h                              | 9 ++++++++-
>   .../selftests/bpf/prog_tests/test_bpf_syscall_macro.c    | 2 +-
>   tools/testing/selftests/bpf/progs/bpf_syscall_macro.c    | 2 +-
>   3 files changed, 10 insertions(+), 3 deletions(-)
> 

There was an error in sending this time. A new one has been sent. Sorry 
for the noise.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
