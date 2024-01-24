Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE48C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4snhLw939ktGymF3H6y9z1bxVMW92+kX5QBiX4wMcsY=; b=B/S8/VtoEx0twR
	DszC4NZgUR00KhTHgGevlW0doz+K6WsSeSz8+Q7WfoXuov+PBGKw4VFqph0dnznnpTssup/ag3fTD
	Ks6bai+zFV3/L/ShLrio+u0EIbnDdnQiPRKudr6M0sVaIdi9ABOal6gZxKc3tBUHZ1pXxFxxZPYXw
	NOvshsxx3jp/7v1nlpLhGzlov71VVoFkJYL8J3AULit04mPTv7DyO1/1YPYjt3jVatVIo8PJ7bvbN
	wQS8jmfWJ6OtSZoUnnkUaXy3KXN6CI/7VmpnAFBOBFfZjcF3bdhUAMrpcrDK6waYlNK+Bvx8CiANy
	TyocHce++6D9UwJHNiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiQZ-004mkw-3C;
	Wed, 24 Jan 2024 18:56:47 +0000
Received: from smtpout.efficios.com ([2607:5300:203:b2ee::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiQW-004mjO-3D
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 18:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1706122599;
	bh=fDgg8tctrn6emEkzshBFTOOEhEUdkdDODjW+wwsHgnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GIqZE93qwRmJH38eufPCxDmBlobXjUjtf9LO71Cd6BqdAn3+KILbVJqzUUuIQ+t8r
	 50enT+rOVnRPsPWiDuVJ3PfVyRZBTgwuYT5B6E+0DTnKDrb2Grg19TjQGhApoaFTiu
	 xOJFpG7FAwVXjMVJ9gYR2wFYFGm8oJ3tfx2cpp2UQWjW2hvynNgoFAPtnt/5Gsxt8J
	 1Xj7OqtUEM1zq3tQqe79mpmZu23v0vPbxppiZ4t86pVWE7sNana2YjbFjymgJ3CcF4
	 v5sDKO1R1TQ2gDlxEYeIspgjjzH1pYwT7MYrLH0fo/ocSoXqQvQYi2LvnDpJcFFgnI
	 53aOA3D0lNr4w==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4TKtTz2L4CzV7C;
	Wed, 24 Jan 2024 13:56:39 -0500 (EST)
Message-ID: <e4e1ee4d-b96c-47c7-bf81-5f4d3b0ce5dc@efficios.com>
Date: Wed, 24 Jan 2024 13:56:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] membarrier: riscv: Provide core serializing
 command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 paulmck@kernel.org, corbet@lwn.net, mmaas@google.com, hboehm@google.com,
 striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-5-parri.andrea@gmail.com>
 <aabea058-0088-41bb-822a-402669f348bb@efficios.com> <ZbFahHxi5laA6CbI@andrea>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <ZbFahHxi5laA6CbI@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_105645_321378_1D3F16AD 
X-CRM114-Status: UNSURE (   8.95  )
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

On 2024-01-24 13:44, Andrea Parri wrote:
>>> +# riscv uses xRET as return from interrupt and to return to user-space.
>>> +#
>>> +# Given that xRET is not core serializing, we rely on FENCE.I for providing
>>> +# core serialization:
>>> +#
>>> +#  - by calling sync_core_before_usermode() on return from interrupt (cf.
>>> +#    ipi_sync_core()),
>>> +#
>>> +#  - via switch_mm() and sync_core_before_usermode() (respectively, for
>>> +#    uthread->uthread and kthread->uthread transitions) to go back to
>>> +#    user-space.
>>
>> I don't quite get the meaning of the sentence above. There seems to be a
>> missing marker before "to go back".
> 
> Let's see.  Without the round brackets, the last part becomes:
> 
>    - via switch_mm() and sync_core_before_usermode() to go back to
>      user-space.
> 
> This is indeed what I meant to say.  What am I missing?

Would it still fit your intent if we say "before returning to
user-space" rather than "to go back to user-space" ?

Because the switch_mm(), for instance, does not happen exactly on
return to user-space, but rather when the scheduler switches tasks.
Therefore, I think that stating that core serialization needs to
happen before returning to user-space is clearer than stating that
it happens "when" we go back to user-space.

Also, on another topic, did you find a way forward with respect of
the different choice of words between the membarrier man page and
documentation vs the RISC-V official semantic with respect to "core
serializing" vs FENCE.I ?

Thanks,

Mathieu


> 
>    Andrea

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
