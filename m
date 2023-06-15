Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366FBEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebASc3MrWutI3xaznDmpeRRtqUY7yf8c/ClaJHxAp/4=; b=rgCzUUA6kTHBsZ
	P5NO4FsQawK58UOnvcRjZ6sHEo3uE5SfE2CgXphakHOOGn7RyZkW4lbwuTi7pCPRYo1cEZp1lX3Vq
	uI+dZcbS8elH9ia0d97JZ45IT0bZi5fjFZpVWA4w7OILVE2hNvQr+UOGD39WRr/TWxg2Ang4Mbhhm
	UGqa4eHSIEbjP2g9LeLH+s7VG81UwuEQC3WdBV1K2zUBYQxwld5g1WzE/oxd9PwVezhnvugDllNg6
	Bkix6DwmFor5hjTo4RFapIUqMQFFdbFjMgmVWKfm9KWEYr21DRGZbBxnaxrWhCu1xLVFD7f52Lkum
	NvpI8F/WW0YNVyhKRLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jm9-00EObE-0N;
	Thu, 15 Jun 2023 10:00:21 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jm5-00EOZW-03;
	Thu, 15 Jun 2023 10:00:18 +0000
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBCA64000B;
	Thu, 15 Jun 2023 10:00:01 +0000 (UTC)
Message-ID: <653f51b6-9f6e-12f1-9165-541922bed7a9@ghiti.fr>
Date: Thu, 15 Jun 2023 12:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 08/10] Documentation: admin-guide: Add riscv
 sysctl_perf_user_access
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
 <20230512085321.13259-9-alexghiti@rivosinc.com>
 <20230531-0707dc46df8078cd92711314@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230531-0707dc46df8078cd92711314@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_030017_316620_BA267727 
X-CRM114-Status: GOOD (  20.36  )
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


On 31/05/2023 17:07, Andrew Jones wrote:
> On Fri, May 12, 2023 at 10:53:19AM +0200, Alexandre Ghiti wrote:
>> riscv now uses this sysctl so document its usage for this architecture.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   Documentation/admin-guide/sysctl/kernel.rst | 24 +++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>> index 4b7bfea28cd7..93cd518ca94b 100644
>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>> @@ -941,16 +941,32 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
>>   The default value is 8.
>>   
>>   
>> -perf_user_access (arm64 only)
>> -=================================
>> +perf_user_access (arm64 and riscv only)
>> +=======================================
>> +
>> +Controls user space access for reading perf event counters.
>>   
>> -Controls user space access for reading perf event counters. When set to 1,
>> -user space can read performance monitor counter registers directly.
>> +arm64
>> +=====
>>   
>>   The default value is 0 (access disabled).
>> +When set to 1, user space can read performance monitor counter registers
>> +directly.
>>   
>>   See Documentation/arm64/perf.rst for more information.
>>   
>> +riscv
>> +=====
>> +
>> +When set to 0, user access is disabled.
>> +
>> +When set to 1, user space can read performance monitor counter registers
>> +directly only through perf, any direct access without perf intervention will
>> +trigger an illegal instruction.
>> +
>> +The default value is 2, which enables legacy mode (user space has direct
>> +access to cycle, time and insret CSRs only). Note that this legacy value
>> +is deprecated and will be removed once all userspace applications are fixed.
> All modes can access the time CSR so I'm not sure if it should be pointed
> out here as if it's an exception. Maybe we shouldn't point it out at all
> or we should point it out for all three?


Ok I removed the reference to the time CSR for the legacy mode and 
instead added a note stating that this CSR is always accessible whatever 
the mode.

Thanks!


>
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
