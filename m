Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF1BCD98E1
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 03:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61MGgjh01QFRJn9wGXCCAydTIQLm9NCrXlP6X8hRZa8=; b=a91/5Agdt6nhjxTPKtVkucCnCx
	KDLYjrDi3PnEkdykqvvRzTk4dth35T8RSWaPVFOEYABpn2O2USvQjXrOwNGp3yHvI9H9f2goscLHj
	IdQrNLo8UBPaf3v/tSBWGcCp+zPt4ybJcR8ShROmzULR3A9fyNF/uldnB5sjEeHKE84B2bBh7sWeZ
	27CKg+IZ8DiTXeLX3p8stIRnbMu/YOHpBHJfF78lxT89BglNrNHOnMKODEaYqSsSv+t38SLKUAdnb
	Mu1c3EvF6+VyF86E/LvWfdIS+Ux9Ir3rxwIIERbY/MeO3cJJxtsCl7/DaW0PUv9fbSwcW7PiAYKyp
	9pSIQgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhC0-0000000GZSY-2D71;
	Wed, 17 Jun 2026 03:43:56 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhBv-0000000GZRI-3Eok
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 03:43:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9tGW59A/xDTVSUsa+VveumO8ZtEvO5di0CCgVmyKwBg=;
	b=cL6ILyW/IwlzBp1zHGKYugcxknlIBE8FhNHU6sB+FCmQZnS96jt4/fjtEpmzDOQvBji+d/S+p
	E0OAKDpZpe1k4gRNmdxVN9+Pu2GqLkV7RLPVMrMCBqpFIpTAAJ/dAeYUXoy+ncKwZfJeWnutcKo
	CfOLXhwUC5cz+GJf+oVQrjA=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gg8cy1HGszcZyX;
	Wed, 17 Jun 2026 11:35:14 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9tGW59A/xDTVSUsa+VveumO8ZtEvO5di0CCgVmyKwBg=;
	b=cL6ILyW/IwlzBp1zHGKYugcxknlIBE8FhNHU6sB+FCmQZnS96jt4/fjtEpmzDOQvBji+d/S+p
	E0OAKDpZpe1k4gRNmdxVN9+Pu2GqLkV7RLPVMrMCBqpFIpTAAJ/dAeYUXoy+ncKwZfJeWnutcKo
	CfOLXhwUC5cz+GJf+oVQrjA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gg8cq4SV8z1T4Fg;
	Wed, 17 Jun 2026 11:35:07 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 301DA40537;
	Wed, 17 Jun 2026 11:43:38 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 17 Jun
 2026 11:43:37 +0800
Message-ID: <0191fe3f-b956-480d-aef2-a4d75f9e02de@huawei.com>
Date: Wed, 17 Jun 2026 11:43:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC bpf-next 1/2] selftests/bpf: Add riscv support for
 get_preempt_count()
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20260420111516.19982-1-yangtiezhu@loongson.cn>
 <20260420111516.19982-2-yangtiezhu@loongson.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260420111516.19982-2-yangtiezhu@loongson.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_204352_113040_5BA2F8E6 
X-CRM114-Status: GOOD (  11.69  )
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


On 2026/4/20 19:15, Tiezhu Yang wrote:
> There is no riscv support for get_preempt_count() currently and its
> fallback path always returns 0, just add it so that bpf_in_interrupt(),
> bpf_in_nmi(), bpf_in_hardirq(), bpf_in_serving_softirq(), bpf_in_task()
> works for riscv as well. With this patch, "./test_progs -t exe_ctx"
> should pass on riscv.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   tools/testing/selftests/bpf/bpf_experimental.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> index 2234bd6bc9d3..e5c039bc44cb 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -505,6 +505,8 @@ static inline int get_preempt_count(void)
>   	return bpf_get_current_task_btf()->thread_info.preempt_count;
>   #elif defined(bpf_target_s390)
>   	return bpf_get_lowcore()->preempt_count;
> +#elif defined(bpf_target_riscv)
> +	return bpf_get_current_task_btf()->thread_info.preempt_count;
>   #endif
>   	return 0;
>   }
> @@ -515,6 +517,7 @@ static inline int get_preempt_count(void)
>    *	* arm64
>    *	* powerpc64
>    *	* s390x
> + *	* riscv
>    */
>   static inline int bpf_in_interrupt(void)
>   {
> @@ -536,6 +539,7 @@ static inline int bpf_in_interrupt(void)
>    *	* arm64
>    *	* powerpc64
>    *	* s390x
> + *	* riscv
>    */
>   static inline int bpf_in_nmi(void)
>   {
> @@ -548,6 +552,7 @@ static inline int bpf_in_nmi(void)
>    *	* arm64
>    *	* powerpc64
>    *	* s390x
> + *	* riscv
>    */
>   static inline int bpf_in_hardirq(void)
>   {
> @@ -560,6 +565,7 @@ static inline int bpf_in_hardirq(void)
>    *	* arm64
>    *	* powerpc64
>    *	* s390x
> + *	* riscv
>    */
>   static inline int bpf_in_serving_softirq(void)
>   {
> @@ -580,6 +586,7 @@ static inline int bpf_in_serving_softirq(void)
>    *	* arm64
>    *	* powerpc64
>    *	* s390x
> + *	* riscv
>    */
>   static inline int bpf_in_task(void)
>   {

Hi Tiezhu,

Thanks for doing this, feel free to add:

Tested-by: Pu Lehui <pulehui@huawei.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
