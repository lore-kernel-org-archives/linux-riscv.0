Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32261C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqU6HugndAWeTQbQqwqLMQOV/9YyD3ZxkEpwyxHb0Wc=; b=XzgXWB63OGu5kk
	LtDqqeZ3/8or6/hCbtjv5RvIt27eug9AzI7HtFndzkzcR+vtCrYPXblLk9KQ6XxHAyFf1/k+mR4Yy
	doOs88II1IwsqwKyriV4jZST8Mf9IR+/N3x5Jtok4UMQZ47srj4xlDaLsoFG1U5lbIeXbR11/VRXO
	Jdj7pjS1V4hTht88IPdUqmRobYQXRSjATSkA759FUHN4aAaJ8SZzAiOnR2R6mD8oYx7sJRasdQQo9
	8F70Zl8ixzybYSA3RZZFKloc0KSAPUFNXHxPEXU8EIFInXCFNjgtwjQvZ3QlrRYLDjtPtemo16zaH
	supUTqcuxO+l0Y4l6NRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvicz-002ZoY-6B; Fri, 10 Dec 2021 16:20:09 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvicm-002ZlZ-4v; Fri, 10 Dec 2021 16:19:57 +0000
Received: by mail-qv1-xf34.google.com with SMTP id jo22so8379396qvb.13;
 Fri, 10 Dec 2021 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=tMMxFmdx6MfMkYIe7s/tX2fGsd/7SaUGLt53xeNBSto=;
 b=jHaNUOm+bAFT/71ZTymVQb/kmN4r5rYXWFg+VqSDFuvYGhNE+xv4y1Y+bnH2sb+fhj
 NV919Z87+m+44Qr4B7KsYG4OujDtURNuCUuqHDtU3xv4d/RbPDoPsRgyllsKOLKHqNiq
 ufBBokrSbKEDD8kj0nZnTl3JaT8Nstvuxfev+U0iEv6QotJD7DRirfQMLB2KI0CvSOS/
 vDTh9L0/QWze5Aqk8HRlsWW8O5Aa5sVaj4QDc2+PH7Fk454q3wl2/k59cshgL2mBYhvR
 kWFDXIgne1fyDDwJnK4lufmM9r6u+SOrZ6Llz6vhyOOauwgoFnbav/nHigDNqgPed3l+
 sD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=tMMxFmdx6MfMkYIe7s/tX2fGsd/7SaUGLt53xeNBSto=;
 b=wWosqx49LJ+HldJoNz9iJukLsd0ZBrtNXEcGEZxISZZusFpM7tHg/8PH03XQIbEhOL
 A3aoweIPgqE3E/efYFOFsRGvCnoBoInOmf5rHiP7D0e6OJdvedu4opEa0gPVS21jPIyL
 Umt1MEmiKfiBAPInfuEk8iJqTw8j7bUX1Lagzq7KySEUlxYhyrkD390b2CjXNr1AwTbF
 dXMbQIMtKNIltQ6hzcj8v4vWKkRrOYESBbZYiwQxvDQw1ru5gwpEOwlIu+nZV4DkQmGc
 9KMql+t8FLWfQZiVxKyZ7FP+VBNZFdYpKLVw8Bk8VO8+QiWbmJtJEbwLoEMEwmbexy5d
 RJXA==
X-Gm-Message-State: AOAM533+PNzfmswNCm5OskRllQWErjo1j/iylcr26Jg466Lv55z2K4q7
 V/G5pm9SG6CQYilonEwCgPk=
X-Google-Smtp-Source: ABdhPJzdk7VpNonY+bRlvorAlgEXJPEuVKPvG89stBQW6JD1wHoFdSsWe1YbNMAuaoBBJCFP3aNM4A==
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr25674296qvb.112.1639153193232; 
 Fri, 10 Dec 2021 08:19:53 -0800 (PST)
Received: from [127.0.0.1] ([179.97.37.151])
 by smtp.gmail.com with ESMTPSA id t9sm1379657qkp.110.2021.12.10.08.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 08:19:52 -0800 (PST)
Date: Fri, 10 Dec 2021 13:19:47 -0300
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
To: German Gomez <german.gomez@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, kajoljain <kjain@linux.ibm.com>
CC: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/4=5D_perf_tools=3A_Preve?=
 =?US-ASCII?Q?nt_out-of-bounds_access_to_registers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <42c6ea29-5904-bb8b-d9c6-a0516c3a564f@arm.com>
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-2-german.gomez@arm.com>
 <6705021e-5b02-3323-7dbc-4b774f22a435@linux.ibm.com>
 <YbNYUC1poqzrWynP@kernel.org> <42c6ea29-5904-bb8b-d9c6-a0516c3a564f@arm.com>
Message-ID: <95E7589C-3822-4F73-A0CA-42E64654E021@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_081956_217324_F5EF508D 
X-CRM114-Status: GOOD (  16.66  )
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



On December 10, 2021 12:28:56 PM GMT-03:00, German Gomez <german.gomez@arm.com> wrote:
>
>On 10/12/2021 13:38, Arnaldo Carvalho de Melo wrote:
>> Em Fri, Dec 10, 2021 at 02:47:49PM +0530, kajoljain escreveu:
>>>
>>> On 12/1/21 6:03 PM, German Gomez wrote:
>>>> The size of the cache of register values is arch-dependant
>>>> (PERF_REGS_MAX). This has the potential of causing an out-of-bounds
>>>> access in the function "perf_reg_value" if the local architecture
>>>> contains less registers than the one the perf.data file was recorded on.
>>>>
>>>> Since the maximum number of registers is bound by the bitmask "u64
>>>> cache_mask", and the size of the cache when running under x86 systems is
>>>> 64 already, fix the size to 64 and add a range-check to the function
>>>> "perf_reg_value" to prevent out-of-bounds access.
>>>>
>>> Patch looks good to me.
>>>
>>> Reviewed-by: Kajol Jain<kjain@linux.ibm.com>
>> Thanks, applied.
>>
>> - Arnaldo
>
>Thanks Arnaldo, and the rest for the review.
>
>I did send a v2 of this patch afterwards. The only difference was to
>give credit to the reporter in the commit message with:
>
>Reported-by: Alexandre Truong <alexandre.truong@arm.com>


I'll add it.

- Arnaldo
>
>Thanks,
>German
>
>>  
>>> Thanks,
>>> Kajol Jain
>>>
>>>> Signed-off-by: German Gomez <german.gomez@arm.com>
>>>> ---
>>>>  tools/perf/util/event.h     | 5 ++++-
>>>>  tools/perf/util/perf_regs.c | 3 +++
>>>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
>>>> index 95ffed663..c59331eea 100644
>>>> --- a/tools/perf/util/event.h
>>>> +++ b/tools/perf/util/event.h
>>>> @@ -44,13 +44,16 @@ struct perf_event_attr;
>>>>  /* perf sample has 16 bits size limit */
>>>>  #define PERF_SAMPLE_MAX_SIZE (1 << 16)
>>>>  
>>>> +/* number of register is bound by the number of bits in regs_dump::mask (64) */
>>>> +#define PERF_SAMPLE_REGS_CACHE_SIZE (8 * sizeof(u64))
>>>> +
>>>>  struct regs_dump {
>>>>  	u64 abi;
>>>>  	u64 mask;
>>>>  	u64 *regs;
>>>>  
>>>>  	/* Cached values/mask filled by first register access. */
>>>> -	u64 cache_regs[PERF_REGS_MAX];
>>>> +	u64 cache_regs[PERF_SAMPLE_REGS_CACHE_SIZE];
>>>>  	u64 cache_mask;
>>>>  };
>>>>  
>>>> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
>>>> index 5ee47ae15..06a7461ba 100644
>>>> --- a/tools/perf/util/perf_regs.c
>>>> +++ b/tools/perf/util/perf_regs.c
>>>> @@ -25,6 +25,9 @@ int perf_reg_value(u64 *valp, struct regs_dump *regs, int id)
>>>>  	int i, idx = 0;
>>>>  	u64 mask = regs->mask;
>>>>  
>>>> +	if ((u64)id >= PERF_SAMPLE_REGS_CACHE_SIZE)
>>>> +		return -EINVAL;
>>>> +
>>>>  	if (regs->cache_mask & (1ULL << id))
>>>>  		goto out;
>>>>  
>>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
