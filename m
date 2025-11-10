Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AE4CCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 23:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHtpTgQEYioslRsVNw3BsHdjQmtC19o5iMj7SRPeQ1k=; b=UdvIfYdmlsCSZC
	zJR0aZY0V6oByDSnaAyeknT7PmKylJolqnrzdstPsxWW1zGl9KyJ3du+fXmEuWm8RSYy9mwkV4ZxC
	5piOCRzdxOhEty7ImcLI220EF69oyiCea/CA0NDAvNq6cGKBQdEVXLhOYWQylVJ7gEiBBn9CVZJvr
	78VIyZgfWrsBGAlxFmdfJp+kfymkxysKTOfeVrVRfKHXzK0pQIPPYXNSBD+9EecUlH0uf4yz9cqVM
	qG+ZWYijxLJbGMTQaB60TGfwoSftwhoJru1la17Ukuh3SgSjU74v/jzuGGEV5/i0YH/TIQ2dp7ulO
	4hDtEyjYVficjedyXs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbE7-00000006Fe2-38fr;
	Mon, 10 Nov 2025 23:23:11 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbE5-00000006Fdb-2Lf9;
	Mon, 10 Nov 2025 23:23:10 +0000
Received: from [IPV6:2601:646:8081:9484:a4ce:2dbc:ef8e:acc2] ([IPv6:2601:646:8081:9484:a4ce:2dbc:ef8e:acc2])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5AANLvc93880957
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 10 Nov 2025 15:21:58 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5AANLvc93880957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025102301; t=1762816923;
	bh=BsN8VBFD5PAgYi4bwE42pnqSTmd+qcr29mOqQybepiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rjYuoLzlgViwlHxmQg2QGfpz9LPJDhOQAbw4/6aIGNHbpNN57PZ51RsVPdOwQA6yB
	 2eNjlZzKfZya7G4KhhWgguyHM00AgCEGTcGmu22T0V87nzs1CGXLylHaQ1B7bKomCf
	 4yz/0LhiJbU3IVmkAeDaty+clqMjGVgwRilI7qypUsrfnmUZvKS2i/+F35IPLAcw7f
	 BuHueJostF0V0GWeV+jp1PoPSmefFxcdjXd9xrdrNwYM/y51ZIXY3w9UdXd+X2Dg8x
	 SQzYlmvO8N1yVdVU38QI6EboQsWVZ7uNLIiYngGzemAcHknbmnXkOfw56rFOGv28uz
	 uQr7m3HHG+8FA==
Message-ID: <128b82ff-d304-41d6-b914-a44706d8781f@zytor.com>
Date: Mon, 10 Nov 2025 15:21:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] Provide the always inline version of some
 functions
To: Peter Zijlstra <peterz@infradead.org>
Cc: Xie Yuanbin <qq570070308@gmail.com>, david@redhat.com, tglx@linutronix.de,
        segher@kernel.crashing.org, riel@surriel.com, linux@armlinux.org.uk,
        mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
        andreas@gaisler.com, luto@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, acme@kernel.org, namhyung@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        james.clark@linaro.org, anna-maria@linutronix.de, frederic@kernel.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, thuth@redhat.com, brauner@kernel.org,
        arnd@arndb.de, jlayton@kernel.org, aalbersh@redhat.com,
        akpm@linux-foundation.org, david@kernel.org,
        lorenzo.stoakes@oracle.com, max.kellermann@ionos.com,
        ryan.roberts@arm.com, nysal@linux.ibm.com, urezki@gmail.com,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
        will@kernel.org
References: <20251108172346.263590-1-qq570070308@gmail.com>
 <20251108172346.263590-4-qq570070308@gmail.com>
 <04CA2D22-4DE2-4DE1-A2BC-AACE666F5F93@zytor.com>
 <20251109115152.GD2545891@noisy.programming.kicks-ass.net>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20251109115152.GD2545891@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_152309_610256_4A77ED32 
X-CRM114-Status: GOOD (  11.53  )
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

On 2025-11-09 03:51, Peter Zijlstra wrote:
> On Sat, Nov 08, 2025 at 02:14:44PM -0800, H. Peter Anvin wrote:
> 
>>> +static struct rq *finish_task_switch(struct task_struct *prev)
>>> +{
>>> +	return finish_task_switch_ainline(prev);
>>> +}
>>> +
>>> /**
>>>  * schedule_tail - first thing a freshly forked thread must call.
>>>  * @prev: the thread we just switched away from.
>>
>> There is, in fact: you have to have an always_inline version, and wrap it in a noinline version.
> 
> Yes, but all of this is particularly retarded, there are exactly _2_
> callers of this function. Keeping an out-of-line copy for one while
> inlineing the other makes 0 sense.
> 
> Also, the amount of crap he needs to mark __always_inline doesn't make
> much sense to me, is he building with -Os or something?

That's another issue -- unless the second instance of the function is on a
slow path which wants to be isolated from the rest of its function (unlikely.)

I was merely commenting on the claim that there is no way to control inlining
on a call site basis - there is.

	-hpa


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
