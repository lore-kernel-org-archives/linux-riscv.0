Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307BBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTPmTg5WzHh/GKRpklAGqKofvlyboDZQ+GfKMlRb2xY=; b=K3qLGW5ZKsuiKa
	tB21PcI1/7z90DKbls+CsBqirEP7Ni0sWL0c0aIEN1fEb2MgUljzWjVx166Ctv8QquGYTKC7zQQGk
	FRt/UWJqrfLDlv3Mp+1Jqdkg5zBGKigvxH6ZicGrBsRol5IYu2DBbGvocd2AOYBFy+APHA1uL8sPg
	VAKMrn3k043vRY9lHUlSn4yAwKAoJ5jbApGZ1LsKsYthoOTPeGgQayWm8gpLH+ningcA/KvE+7ruf
	gFeptYm5C+2mOmlT28f69XTPzF5mhorSE1iwPGZ9GbgTQw/g26AZGAf7LNlj4npxI3+PD0ag0KDYT
	TPgYd2V/Ahd87ti7P2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwXA-003meh-VS; Tue, 30 Nov 2021 06:22:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwWx-003mb9-JB; Tue, 30 Nov 2021 06:22:21 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J3Bvb1MkNzbjFD;
 Tue, 30 Nov 2021 14:22:03 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:22:09 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:22:08 +0800
Message-ID: <35e4a4cb-29f2-2de6-6350-1358d4968a54@huawei.com>
Date: Tue, 30 Nov 2021 14:22:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 1/4] mm: percpu: Generalize percpu related config
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>
CC: <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <tj@kernel.org>, <gregkh@linuxfoundation.org>,
 <cl@linux.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
 <x86@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <20211121093557.139034-2-wangkefeng.wang@huawei.com>
 <YaVV38QSn6LEBKH/@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YaVV38QSn6LEBKH/@fedora>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_222219_862883_E821948A 
X-CRM114-Status: UNSURE (   9.18  )
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


On 2021/11/30 6:36, Dennis Zhou wrote:
> Hello,
>
> On Sun, Nov 21, 2021 at 05:35:54PM +0800, Kefeng Wang wrote:
>> The HAVE_SETUP_PER_CPU_AREA/NEED_PER_CPU_EMBED_FIRST_CHUNK/
>> NEED_PER_CPU_PAGE_FIRST_CHUNK/USE_PERCPU_NUMA_NODE_ID configs,
>> which has duplicate definitions on platforms that subscribe it.
>>
>> Move them into mm, drop these redundant definitions and instead
>> just select it on applicable platforms.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/arm64/Kconfig   | 20 ++++----------------
>>   arch/ia64/Kconfig    |  9 ++-------
>>   arch/mips/Kconfig    | 10 ++--------
>>   arch/powerpc/Kconfig | 17 ++++-------------
>>   arch/riscv/Kconfig   | 10 ++--------
>>   arch/sparc/Kconfig   | 12 +++---------
>>   arch/x86/Kconfig     | 17 ++++-------------
>>   mm/Kconfig           | 12 ++++++++++++
>>   8 files changed, 33 insertions(+), 74 deletions(-)
...
>>
> This makes sense and looks good. A series like this is a little tricky.
> The latter patches change the contracts so it'd be easiest to run it
> through my tree. We'd need to get explicit acks from each arch
> maintainer to make sure they're fine with this.

Got it, I will resend without RFC and hope to get ACKs from related arch 
maintainers.


>
> Thanks,
> Dennis
> .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
