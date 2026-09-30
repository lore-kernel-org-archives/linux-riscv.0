Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06411CA5FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt37Rbjgouq45ix5OYaeTb7LThwIqjAvy65wiSAmPUw=; b=nT/08WpnWDJL6N
	3bUm+CQppMfposxfv3d2jmvRqCKPoOYxsfd+kcyuta2314AiJz3MMZcLeMr9/hzEY+CQxqLMEYCpo
	tC5a9o6lwA8KZjnjCjZOsmc8L0dkaTarUWbMuWD8JaRKthsAeLNc8xFgWovbcDEP9a4QDmJtZQGI1
	pQlRlPDckpQDE3WeGXbU0Beth/YIv5bbYsJzS/fT03+0q8k7iNoxsBjJnb8BRP/Rnpt+trH2LJr3u
	3/pnf5I7Fpi+6UNqAWSSempxEsupiyP89novipPETTdQB6MwkiNhDV03ngLpmwy6/T0VxeN0zxtYS
	eNJM1Di4uQA4nNCfiIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpWa-00000005P1w-41UX;
	Wed, 30 Sep 2026 08:18:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpWZ-00000005P1d-3D6L
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 08:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H/v8r7WAxF+ClL9lg5Ll6V9s2rSOCFEtn12e421wW7k=; b=O8b3dV+SWm+ZTnN5m3Nxx9AnNQ
	9m4RjZf3l2L8RaeHQX3F1p1elUQbJu5e8WwPrMSdpieFmAqN7BhrXOEELpOmutmKP8ZFnsFJjtH+o
	ygnYY7ES6gEE16xX6WChSIWXnuYei8A3tc4GbE07cU1SL9UKGXkOQl9ktyLQ4xkqX19tCwMZu5JKV
	8YtQex9BD+7TTaSnJy6TiX9VV2wVOp2fdxH6GDjSqk0uIOlS5qgQAmGs/L6SKlMUkO/M3fldY+TaU
	i4SgLoksbnBesZglrNtwjk33R8GY/Wj2bnMkWUnZ0LDrCqkx8cxKPQG8VfMY0XLCMnnOGHILk15PK
	mZRw/7Cg==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBpWV-00000003WAd-0Hv2
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 08:18:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=H/v8r7WAxF+ClL9lg5Ll6V9s2rSOCFEtn12e421wW7k=;
	b=31BUgC0QH5FLNXCVCICCF4YtBGI1mNCmBLH9PhuSjKoqnLZlaGaK5mx5StnxveLmG8yZNxQmv
	vsjSutx17yihJIeAupMhNcWFL3IGtdOmKQZL0KE4EY66yL1AbVEi4apjkOg8wxZeqS8ywCh9QmI
	dqIXtZQIlhOFyfYz0cvfDF4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hvng84xY9zmV8H;
	Wed, 30 Sep 2026 16:06:12 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 84CA140586;
	Wed, 30 Sep 2026 16:18:21 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 16:18:20 +0800
Message-ID: <469b2e24-dad9-4e78-a390-03f9a7f00853@huawei.com>
Date: Wed, 30 Sep 2026 16:18:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 3/4] selftests/bpf: Update qemu config for
 riscv64 in vmtest.sh
To: <bot+bpf-ci@kernel.org>, <pulehui@huaweicloud.com>, <bjorn@kernel.org>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<eddyz87@gmail.com>, <memxor@gmail.com>, <martin.lau@linux.dev>,
	<song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
	<emil@etsalapatis.com>, <ihor.solodrai@linux.dev>, <puranjay@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <alex@ghiti.fr>,
	<martin.lau@kernel.org>, <mason@kernel.org>
References: <20260930064607.1908864-4-pulehui@huaweicloud.com>
 <f5ed8c5179098109e321e1cc42ced4bf30fc4bf80603fdaeef517277f38834eb@mail.kernel.org>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <f5ed8c5179098109e321e1cc42ced4bf30fc4bf80603fdaeef517277f38834eb@mail.kernel.org>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_091843_938312_08CADC72 
X-CRM114-Status: GOOD (  15.24  )
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



On 2026/9/30 15:19, bot+bpf-ci@kernel.org wrote:
>> selftests/bpf: Update qemu config for riscv64 in vmtest.sh
> 
> TL;DR: The new '-cpu max' riscv64 option in vmtest.sh needs qemu 8.2.0+, so
> cross-runs on qemu 7.2 to 8.1 may fail; the "v7.2.0+" comment and commit
> message may be stale.
> 
>> diff --git a/tools/testing/selftests/bpf/vmtest.sh b/tools/testing/selftests/bpf/vmtest.sh
>> --- a/tools/testing/selftests/bpf/vmtest.sh
>> +++ b/tools/testing/selftests/bpf/vmtest.sh
> 
> [ ... ]
> 
>> @@ -36,13 +36,13 @@ aarch64)
>>   	;;
>>   riscv64)
>>   	# required qemu version v7.2.0+
>>   	QEMU_BINARY=qemu-system-riscv64
>>   	QEMU_CONSOLE="ttyS0,115200"
>>   	HOST_FLAGS=(-M virt -cpu host -enable-kvm -smp 8)
>> -	CROSS_FLAGS=(-M virt -cpu rv64,sscofpmf=true -smp 8)
>> +	CROSS_FLAGS=(-M virt -cpu max,sscofpmf=false -smp 8)
>>   	BZIMAGE="arch/riscv/boot/Image"
>>   	ARCH="riscv"
>>   	;;
> 
> Is the "required qemu version v7.2.0+" comment still accurate after this
> change?
> 
> The riscv 'max' CPU model isn't available in qemu before v8.2.0.  In
> target/riscv/cpu.c, v7.2.0 and v8.1.0 have no riscv_max_cpu_init() and no
> TYPE_RISCV_CPU_MAX, and v8.2.0 is the release that adds:
> 
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX, riscv_max_cpu_init)
> 
> The previous '-cpu rv64,sscofpmf=true' worked on qemu 7.2 because the
> sscofpmf property already exists there.
> 
> On a non-riscv host, run-qemu takes the CROSS_FLAGS path and runs
> ${QEMU_BINARY} with "${QEMU_FLAGS[@]}".  With qemu 7.2 through 8.1 (Debian 12
> ships 7.2, for example), qemu-system-riscv64 would fail with "unable to find
> CPU model 'max'" and the script would abort under 'set -e'.
> 
> The commit message doesn't mention the raised minimum qemu version either.
> Should the comment be updated to v8.2.0+, or should the commit message state
> the new requirement?

make sense

> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/36681333169

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
