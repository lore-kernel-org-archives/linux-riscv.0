Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA27C9830E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWgKtu5M1QZeHpc/4D10yJWU98xpE6/1HucCq7q9Yl8=; b=IxT+Ys0O56L7w8
	+p2xtt62TCnxWkBuTpk2Xb6BfQl7KhTiEdrF5ucAnUflckk/6H/6n3Ds7xPmYzoofMR0DWu0N7ec9
	jB0tU760YwdxJiOoE8/T2zKDltFYXerHZl3OZTfckb9AnIr73PcvcUNjIRIulTEBEQ2hGXGEYF+Z8
	EXydSe2Yx05Y5C0WUVFEpXcCemxrRUyrnhaya/8WscZ55oDgUmyEFQ+VXnjAQOCj4eM+aEQoMV431
	LG1CMvLi71/d9CvaMh3o9kfBV++1+l6Nd1Dr1vDwnXXem5c1sw/cG4zjHxHKq9PHznKahCme4eXRw
	aimqZCHc+beL6KyPB9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo68-00000005BvD-0tSW;
	Wed, 30 Sep 2026 06:47:24 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo64-00000005Bug-3DFI
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:47:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hbGRKAiN+M+DetjoSs0ixVYVBfZRXUSaMrHD9zTQRGY=;
	b=FCiyFpLftKLenUMsnY89EHh+viyyMUrKQXs528WFnizT89rpnmODxyJ2kKnzO65B06fkKBG7m
	dDVvwZ5V/GTKou3Xnh+XKxp/+q8l7vQ25wu0oHxHWb6Q4M+N9Nt2eXvU5aRTQ+WZtZyX1cCXT0h
	lPWeaZ0pwv9Tzzh810fYPYM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hvldt5NxRz1prLV;
	Wed, 30 Sep 2026 14:34:58 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D43640537;
	Wed, 30 Sep 2026 14:47:10 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:47:09 +0800
Message-ID: <e887cfb6-8f68-4a0d-949b-cdf5584b1834@huawei.com>
Date: Wed, 30 Sep 2026 14:47:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 0/2] riscv, bpf: Support indirect calls to bpf
 subprogs (callx)
Content-Language: en-US
To: Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
	<eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
	<emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Puranjay
 Mohan <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
References: <20260929085450.1852617-1-pulehui@huaweicloud.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260929085450.1852617-1-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_234721_268197_74969506 
X-CRM114-Status: UNSURE (   7.58  )
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

This series fail to apply, I have resent a new one.


https://lore.kernel.org/all/20260930064928.1909085-1-pulehui@huaweicloud.com/T/#t

On 2026/9/29 16:54, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> This series implements support for indirect calls to bpf subprogs on
> riscv64 and enables the corresponding selftests.
> 
> Meanwhile, this series also resolves the test_verifier failures
> previously captured by riscv-bpf-daily due to missing callx support [0].
> 
> [0] https://github.com/pulehui/riscv-bpf-daily/issues/11
> 
> Pu Lehui (2):
>    riscv, bpf: Support indirect calls to bpf subprogs (callx)
>    selftests/bpf: Enable callx related testcases for RV64
> 
>   arch/riscv/net/bpf_jit_comp64.c                      | 12 ++++++++++++
>   .../selftests/bpf/prog_tests/callx_func_ptr_map.c    |  3 ++-
>   .../selftests/bpf/prog_tests/callx_rodata_lskel.c    |  3 ++-
>   tools/testing/selftests/bpf/progs/verifier_callx.c   |  3 ++-
>   .../selftests/bpf/progs/verifier_callx_rodata.c      |  3 ++-
>   5 files changed, 20 insertions(+), 4 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
