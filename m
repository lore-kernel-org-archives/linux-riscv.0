Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A79EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 18:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TkSMyf4UaeW3bWp2eOL+7/0a1Wee6cjDOQoHuGnC+4M=; b=WAU8iePykBa0X4ZK7QH876oeFy
	qorx3oTQ91e99LnXY8P0wUS3xY7AKdWPF1QNP2KrZWpaajjNT1Z1yZ5KpZsuv+nzlRN9tvqaSNxfY
	8JIHPZ7dhSHgPbU9O/vifoow8VTaSOzOvnCarFoQwJdg0amppX9XH+nJpgcarCBLOPbLhOBpr47Ws
	I9TWf+/TQN8myGCgdYuaMp5+KXzOT2KtClrhwctAPqvNeGUEaUWamweZDiAogVw+DRFqzxP+xabZO
	Htha3NNkHA+OW6nbIaDZH4hNKRAkkSalgBWky7Z5cWoVIbKcc5BXmdseB6CkXo0eQoxgSZIFSGf01
	DtHlSfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwq7V-00AxBK-Ns; Mon, 13 Dec 2021 18:32:17 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwq7F-00Ax6f-Td; Mon, 13 Dec 2021 18:32:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 613C66D;
 Mon, 13 Dec 2021 10:32:00 -0800 (PST)
Received: from [10.1.34.138] (e127744.cambridge.arm.com [10.1.34.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 494113F793;
 Mon, 13 Dec 2021 10:31:57 -0800 (PST)
Subject: Re: [PATCH v1 2/4] perf script: Add "struct machine" parameter to
 process_event callback
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, John Garry <john.garry@huawei.com>,
 Will Deacon <will@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-3-german.gomez@arm.com>
 <D6A3A8F3-9946-44FE-A70F-42977C6F38A1@linux.vnet.ibm.com>
 <38fd4992-63ae-4871-ddfd-27d40b5c48d2@arm.com> <YbePfOMaiJjoDb3b@kernel.org>
From: German Gomez <german.gomez@arm.com>
Message-ID: <73ecfe08-f38b-1308-40b5-a1a778323bf5@arm.com>
Date: Mon, 13 Dec 2021 18:31:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbePfOMaiJjoDb3b@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_103202_037553_62E41C90 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 13/12/2021 18:22, Arnaldo Carvalho de Melo wrote:
> [...]
>
>> Thanks for the suggestion. It looks like we can skip this patch if we
>> can get the arch value that way.
> So the first one is already upstream, will you post a v2?
>
> - Arnaldo

Hi Arnaldo,

I sent a v2 where this patch was removed. The upstreamed patch (1/4
here) remained the same.

https://lore.kernel.org/all/20211207180653.1147374-1-german.gomez@arm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
