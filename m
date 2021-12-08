Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B993CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Dec 2021 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgGfSGt8P0t2EpkqTUI6r1l0q4RZsuwREN6SnKpSwBA=; b=2fJBSOLKVoeEUCBw1xnxQkAKfV
	8cm58K3zar4NwD9k7ihGpH7C7IJ8iLa+vCPf3nHrbUSRQuugxcnwFoWgC//tZtLhvxvIgg+liXd4E
	jWXbJsezs3rdzyRKXZ6g8gDVO8Wy3KPr5fQl9Blf/W2TSM0AWDCIo/nrKbsO4AI1S2Wdo+N/g2P2Y
	kUzg/y4lliKOueDIYfaXGX904CbC9txB54MHRCYk4l2MC4L7aLFF5jU+F3kjfuUKmu0Vwe1YqHe2a
	/WRLjEQsa3YhRA2ZJBXTcZWj6rtoEmE4bxh5vnurfSkbbIk8y0Tl8SlrYH/KOAsEAZnn4EkUKJ8r6
	8hHR/BVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muvUt-00CJtX-4p; Wed, 08 Dec 2021 11:52:31 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muvUf-00CJno-CE; Wed, 08 Dec 2021 11:52:19 +0000
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J8Fpd2RrCz67gtT;
 Wed,  8 Dec 2021 19:50:17 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 8 Dec 2021 12:52:04 +0100
Received: from [10.47.91.245] (10.47.91.245) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 8 Dec
 2021 11:52:02 +0000
Subject: Re: [PATCH v2 3/3] perf tools: Support register names from all archs
To: German Gomez <german.gomez@arm.com>, <linux-kernel@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <acme@kernel.org>
CC: Alexandre Truong <alexandre.truong@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
 <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, "Namhyung
 Kim" <namhyung@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20211207180653.1147374-1-german.gomez@arm.com>
 <20211207180653.1147374-4-german.gomez@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <90bcce69-9585-3fb4-de89-bbf2bd6def05@huawei.com>
Date: Wed, 8 Dec 2021 11:51:43 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20211207180653.1147374-4-german.gomez@arm.com>
Content-Language: en-US
X-Originating-IP: [10.47.91.245]
X-ClientProxiedBy: lhreml724-chm.china.huawei.com (10.201.108.75) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_035217_617477_F1265937 
X-CRM114-Status: UNSURE (   7.05  )
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

On 07/12/2021 18:06, German Gomez wrote:
>   tools/perf/arch/arm/include/perf_regs.h       |  42 --
>   tools/perf/arch/arm64/include/perf_regs.h     |  76 --
>   tools/perf/arch/csky/include/perf_regs.h      |  82 ---
>   tools/perf/arch/mips/include/perf_regs.h      |  69 --
>   tools/perf/arch/powerpc/include/perf_regs.h   |  66 --
>   tools/perf/arch/riscv/include/perf_regs.h     |  74 --
>   tools/perf/arch/s390/include/perf_regs.h      |  78 --
>   tools/perf/arch/x86/include/perf_regs.h       |  82 ---
>   tools/perf/builtin-script.c                   |  18 +-
>   tools/perf/util/perf_regs.c                   | 666 ++++++++++++++++++
>   tools/perf/util/perf_regs.h                   |  10 +-
>   .../scripting-engines/trace-event-python.c    |  10 +-
>   tools/perf/util/session.c                     |  25 +-
>   13 files changed, 697 insertions(+), 601 deletions(-)

Did you consider leaving the register structures where they are while
renaming to include the arch name and then having as externs or similar? 
I see an example of that idea for arm64_unwind_libunwind_ops.

Cheers,
John

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
