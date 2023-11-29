Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D180C07CB1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqN1mq4/5PYQMb1aIzAPmEi71ZP3EBOL8snfrgSrFOs=; b=l5iDdl2kJdhATS
	TCsBYyRYybBH1MSkYkc5Lb+vHeOnlo3cAyfEigAbseRi+k+MPMH6/Q/qL6b2NLhXkApqw489UJcXj
	Wih2CGI+m9Sd5k9gVrqYf5s10cU2MD0PgOysNdY1OP5o0djNGjLovwSYTmvwepILFsJsvv3qhxw67
	lMrcxOCk3xeSr2KpWk/DvF8NlXFV+vFfC2rNx9K/GAhmXwYg8bEY+/Gdb/VTSR3/gC9qgz7KDqUCP
	zZ/xwqI5oIHDfETu/09n81HmFJ0n+QHviQx6rhrx15KeVpineGsjGw0VsXRUysCoXKcL4wY/GVIUQ
	faD0VLVhGOIxVeHAuvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8SBD-009LYD-04;
	Wed, 29 Nov 2023 21:33:11 +0000
Received: from smtpout.efficios.com ([167.114.26.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8SB9-009LWF-2F
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 21:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1701293563;
	bh=LSXDfD/sqdOhTH1XnVwusiwpVp5vzDTVZfVELkC2Sro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wxKmwBxa+iiwRH/2QL9Bi98Jbog1A+86OCXxAJLa1nxR/LfGy9TbXtWBoCS1ddW62
	 rnb4WxDR43OEllPusZdHQ43CzNDfNnotQJWc6KO+d5XZyUfa4sf7x1MpDm18X/LxGN
	 Kc/ZZQH0j4WNohI7FNq2mtwCViaXU+FWRn37NVsBEQvF8L4vmMbMz3mQ025DMXdx+C
	 ASlQUkZippwkzAcdLfXTVjp1kiALG8FtZBE3KNK3zaMSz5447XsZFZSyaUmLLwI5Lv
	 lCDSXHnZ+Qbcqb6D2G8t4tSyAJqkP+ZxTOS05YdwEXuZaO89eIGiTr1IKuZrTNDNck
	 DXgqEBsQrk00w==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4SgXbv2vBJz1dpY;
	Wed, 29 Nov 2023 16:32:43 -0500 (EST)
Message-ID: <041c83e6-1ca5-4953-bcec-03571135165d@efficios.com>
Date: Wed, 29 Nov 2023 16:32:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
 striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-3-parri.andrea@gmail.com>
 <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com> <ZWYDtB/otYvTMZWd@andrea>
 <0a84c0e0-2571-4c7f-82ae-a429f467a16b@efficios.com> <ZWeDF0eHyOc/b9UJ@andrea>
 <53aac2ac-46ae-46b8-9fdf-34527b79a63b@efficios.com> <ZWesWCRAPV3rZlx9@andrea>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <ZWesWCRAPV3rZlx9@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_133308_072879_F9430F65 
X-CRM114-Status: GOOD (  18.74  )
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

On 2023-11-29 16:25, Andrea Parri wrote:
>>> As regards the Fixes: tag, I guess it boils down to what we want or we
>>> need to take for commit "riscv: Support membarrier private cmd".  :-)
>>
>> I'm not seeing this commit in the Linux master branch, am I missing
>> something ?
> 
> I don't think you're missing something: I was wondering "what/where is
> this commit"?  Sorry for the confusion.
> 
> 
>>> FWIW, a quick git-log search confirmed that MEMBARRIER has been around
>>> for quite some time in the RISC-V world (though I'm not familiar with
>>> any of its mainstream uses): commit 1464d00b27b2 says (at least) since
>>> 93917ad50972 ("RISC-V: Add support for restartable sequence").  I am
>>> currently inclined to pick the latter commit (and check it w/ Palmer),
>>> but other suggestions are welcome.
>>
>> Supporting membarrier private expedited is not optional since Linux 4.14:
>>
>> see kernel/sched/core.c:
>>
>>                  membarrier_switch_mm(rq, prev->active_mm, next->mm);
>>                  /*
>>                   * sys_membarrier() requires an smp_mb() between setting
>>                   * rq->curr / membarrier_switch_mm() and returning to userspace.
>>                   *
>>                   * The below provides this either through switch_mm(), or in
>>                   * case 'prev->active_mm == next->mm' through
>>                   * finish_task_switch()'s mmdrop().
>>                   */
>>                  switch_mm_irqs_off(prev->active_mm, next->mm, next);
>>
>> Failure to provide the required barrier is a bug in the architecture's
>> switch_mm implementation when CONFIG_MEMBARRIER=y.
>>
>> We should probably introduce a new
>> Documentation/features/sched/membarrier/arch-support.txt
>> to clarify this requirement.
>>
>> Userspace code such as liburcu [1] heavily relies on membarrier private
>> expedited (when available) to speed up RCU read-side critical sections.
>> Various DNS servers, including BIND 9, use liburcu.
> 
> Thanks for the information.
> 
> So I should probably stick to 93917ad50972, which apparently selected
> CONFIG_MEMBARRIER on RISC-V, for the Fixes: tag in question.

I think it goes further than that, because you can explicitly
CONFIG_MEMBARRIER=y, see init/Kconfig:

config MEMBARRIER
         bool "Enable membarrier() system call" if EXPERT
         default y
         help
           Enable the membarrier() system call that allows issuing memory
           barriers across all running threads, which can be used to distribute
           the cost of user-space memory barriers asymmetrically by transforming
           pairs of memory barriers into pairs consisting of membarrier() and a
           compiler barrier.

           If unsure, say Y.

Before 1464d00b27b2, riscv just happened to set it to =n in the defconfig.

I suspect the initial port of riscv merged after v4.14 was already broken.

> I'll look into adding the membarrier feature you mention (as a final/
> follow-up patch), unless you or someone else want to take care of it.

I'll be happy to review it :)

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
