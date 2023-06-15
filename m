Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F32EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVeTLI6GMdb34KcuCzeB5YYRV1JZbnFTkcaQNuELbKY=; b=ZjFplaDPbDdUJO
	KItvOLbioJnC75ahu30asscYjO0VVamTwByojYDt/CMy8MFhCERGyiiyCoVzi+6ndq+9mXd/CT5OE
	Etf3Wo/nvxB/vIgsw6buhT8vobBLEbBihEErHwzRb25R/yh9M9hRfBCL44v6HClgA9RkLpD4YlWnV
	6cf1Ys4wAJeX+s/Fs/WNb9pCKtaa7vZcv1TMry9PtV+5oEropKzhKXJjJvLXqarNcxcDQ5wqjCN5q
	3N6buxjItG527XX6jhm5HzLIMuO8JhFApW99O2kHqMNBvqUYzTmRhql/s8Qylt1Uyc3Fm+qH/mKnl
	1o6jFmwGBhestmYtbKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9h81-00DxKI-0h;
	Thu, 15 Jun 2023 07:10:45 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9h7x-00DxGy-1n;
	Thu, 15 Jun 2023 07:10:43 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8B5B2000C;
	Thu, 15 Jun 2023 07:10:24 +0000 (UTC)
Message-ID: <84626c83-8806-d807-a7bf-b497f70e56fd@ghiti.fr>
Date: Thu, 15 Jun 2023 09:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 01/10] perf: Fix wrong comment about default event_idx
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-2-alexghiti@rivosinc.com>
 <20230531-5678beb107af4b9805cbb611@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230531-5678beb107af4b9805cbb611@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_001041_747413_2365E245 
X-CRM114-Status: GOOD (  18.00  )
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


On 31/05/2023 15:54, Andrew Jones wrote:
> On Fri, May 12, 2023 at 10:53:12AM +0200, Alexandre Ghiti wrote:
>> event_idx default implementation returns 0, not idx + 1.
> The comment was correct until commit c719f56092ad ("perf: Fix and clean
> up initialization of pmu::event_idx"). I'm not sure that warrants a fixes
> tag, but maybe a reference in the commit message.


You're right, I'll add a reference, I don't think it deserves a 
backport, that's just a comment.


>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   include/linux/perf_event.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index d5628a7b5eaa..56fe43b20966 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -442,7 +442,8 @@ struct pmu {
>>   
>>   	/*
>>   	 * Will return the value for perf_event_mmap_page::index for this event,
>> -	 * if no implementation is provided it will default to: event->hw.idx + 1.
>> +	 * if no implementation is provided it will default to 0 (see
>> +	 * perf_event_idx_default).
>>   	 */
>>   	int (*event_idx)		(struct perf_event *event); /*optional */
>>   
>> -- 
>> 2.37.2
>>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


Thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
