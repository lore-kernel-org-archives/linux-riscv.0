Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BC5CCA47E
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAWMu+gfS0foIZWQ76a3lhvJBZPovvmgzSMrJ7FmdrQ=; b=Xc46ca9bFBNj/g
	gRVrRs4W9Szmq/LReJXYgAnomP/8fVY2eLRezEp4GpYWvk7f8vDoG7ACTX6/0LiCI792Tbm/qDOoU
	8PDno2TsmaV1IdHS+RxObEsWZPVVLO8f/PukgTXpNA0lrgavEFwKvVag2ZBWZWWjz6hZcWtL0/EvM
	EJRknweimTlkZYWb6imsN4P4x9C2/lmzt4Fxjcbr7MF7hMzHDbgMt2Z+LcmSBbYQ0/qE9x+3n+t8m
	pHVtT8CbQGasY28wgEmv/97iKFfNDd+XRdE2aS//reXqCRJh1oGjNhAF0B/C/J1TJZFJZlpbDiU2y
	lTZ8agEQiZeMEknUr5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxxw-00E8JA-0w; Wed, 08 Jun 2022 15:51:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxxp-00E8D3-R0
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 15:51:24 +0000
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJBSc3wMMz67mgD;
	Wed,  8 Jun 2022 23:47:44 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 8 Jun 2022 17:51:16 +0200
Received: from [10.47.90.54] (10.47.90.54) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 8 Jun
 2022 16:51:15 +0100
Message-ID: <cf544be3-5c83-044d-95a7-62dd3695a3cc@huawei.com>
Date: Wed, 8 Jun 2022 16:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 3/4] RISC-V: Added generic pmu-events mapfile
To: Nikita Shubin <nikita.shubin@maquefel.me>
CC: Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, "Namhyung
 Kim" <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Atish Patra <atishp@atishpatra.org>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
 <20220607131648.29439-4-nikita.shubin@maquefel.me>
 <9e981523-6032-fd24-08f9-0ef771cd1c2e@huawei.com>
 <20220608174107.7b94e545@redslave.neermore.group>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <20220608174107.7b94e545@redslave.neermore.group>
X-Originating-IP: [10.47.90.54]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_085122_062965_9E595045 
X-CRM114-Status: GOOD (  10.84  )
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

On 08/06/2022 15:41, Nikita Shubin wrote:
>>> mat:
>>> +#	MIDR,Version,JSON/file/pathname,Type
>>> +#
>>> +# where
>>> +#	MIDR	Processor version
>> ARM, no?

I'm just saying that MIDR is for ARM, so please ensure that this term is 
correct for riscv

> I've messed with --cc-cmd badly and didn't include every one in cover
> letter, sorry for that, attaching link to cover letter:
> 
> https://lore.kernel.org/all/20220607131648.29439-1-nikita.shubin@maquefel.me/
> 
> They are ARM inspired indeed.
> 
> 
>>> +#		Variant[23:20] and Revision [3:0] should be zero.
>>> +#	Version could be used to track version of JSON file
>>> +#		but currently unused.
>>> +#	JSON/file/pathname is the path to JSON file, relative
>>> +#		to tools/perf/pmu-events/arch/riscv/.
>>> +#	Type is core, uncore etc
>>> +#
>>> +#
>>> +#Family-model,Version,Filename,EventType
>>> diff --git a/tools/perf/pmu-events/arch/riscv/riscv-generic.json
>>> b/tools/perf/pmu-events/arch/riscv/riscv-generic.json new file mode
>>> 100644 index 000000000000..013e50efad99
>>> --- /dev/null
>>> +++ b/tools/perf/pmu-events/arch/riscv/riscv-generic.json
>> where or how are these referenced?
> Currently they are not referenced in this version of series at all,

ok, right, so a general kernel policy is not to include code which is 
not referenced.

> their purpose is to be used like "ArchStdEvent".
> 
> Through any RISCV implementation should have at least these 3 events.

Thanks,
John

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
