Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB24BC47073
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rjX0mb1Wc7rb2G0JNM3ASTAWGUpgRk1BTi2r7GuxAU=; b=4YlIq8QhhcxluL
	aYaujJl6BkLnRbDmoK/QTGAKUdflrSktXKDJlkmWJ1KNB5LbYQPGE+xSUE2NL3IOmBlracOOR4ihu
	z5DQgS0Oz7GnIxSdVtF0UWlqSZzuL+PyXrsV/L3wD2h4Ep7QGIq1Qn2C97izJHrjluN3PsErQpnsZ
	BbcENEUrvrg3UCAf+uSKsWlhg4qBM3dh1ZHQN4/DRcmgZxXJ8cwgNoAcraFgCqVZy0ZerITKKNQIb
	hHcWt4F5B9qh31YYrXB+rlvi4zWH1h8Od6LdbGXw19/uF+cAzAc21M0OPnATabctPsOPt0BhdzKeY
	eLlK1pZdYWGaVTV9PYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdwG-00Dbmb-0s;
	Wed, 10 Jan 2024 19:08:32 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdwE-00Dbl8-10;
	Wed, 10 Jan 2024 19:08:30 +0000
Message-ID: <a759c808-a14c-4370-b47a-7db908fa3127@infradead.org>
Date: Wed, 10 Jan 2024 11:08:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] membarrier: Create
 Documentation/scheduler/membarrier.rst
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mathieu.desnoyers@efficios.com, paulmck@kernel.org, corbet@lwn.net,
 mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
 charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-3-parri.andrea@gmail.com>
 <63046420-264a-4e7c-b45c-17f0486ba4d9@infradead.org>
 <ZZ7qiIDFDEMEfNiS@andrea>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZZ7qiIDFDEMEfNiS@andrea>
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



On 1/10/24 11:05, Andrea Parri wrote:
> Hi Randy,
> 
>>> +MEMBARRIER_CMD_{PRIVATE,GLOBAL}_EXPEDITED - Architecture requirements
>>> +=====================================================================
>>> +
>>> +Memory barriers before updating rq->curr
>>> +----------------------------------------
>>> +
>>> +The command requires each architecture to have a full memory barrier after
>>> +coming from user-space, before updating rq->curr.  This barrier is implied
>>> +by the sequence rq_lock(); smp_mb__after_spinlock() in __schedule().  The
>>> +barrier matches a full barrier in the proximity of the membarrier system
>>> +call exit, cf. membarrier_{private,global}_expedited().
>>> +
>>
>> What does "The command" refer to above and below, please?
> 
> The term was meant to refer to any of MEMBARRIER_CMD_PRIVATE_EXPEDITED and
> MEMBARRIER_CMD_GLOBAL_EXPEDITED (from the section title); FWIW, this seems
> to align with the terminology adopted in MEMBARRIER(2) for example.

I see.

> Mmh, unless I get a better idea, I'll expand those occurrences to:
> 
>   "The commands MEMBARRIER_CMD_PRIVATE_EXPEDITED and MEMBARRIER_CMD_GLOBAL_EXPEDIDED
>    require [...]"
                                                                            _EXPEDITED

OK, that's better IMO. Thanks.

-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
