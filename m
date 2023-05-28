Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CCEC7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EHhwbD7+3mj6lrFqw8y5yz09WmPg1S9NZ0FDLE57R7I=; b=fDlamS/D2WRcKETVqCYku2yMT2
	3HzOGbiAD/U2D4osZVL2/my3dWQWditKo+AbZjLshDH+kAc00L+8Z0LOo+oW2vurEIv0T8Z5fNuR8
	XOvGABGnTH5bGXJw+yzYEE+KVDkEhpheqqT3iP6IBJucrpqxnTJIeYX4B1FxVYcVwbPuEuTUqYExz
	PkrEPqH1oawpNztTl9Lw0Iiag2RfY6kAziFVNdsV3xTaUVUdSQiIXUG/3i8FhnJOv5oMM2WmnQjMh
	q2v4/dBzyVd8LiNbftSmwXxO3bxsmkgRElAGl0e6EMoYJRXptnezKUsnAzCCvLTzqi4gUVaiw3kX/
	idmg8EsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Gie-007jT6-1e;
	Sun, 28 May 2023 13:46:00 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Gib-007jRd-0N
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 13:45:58 +0000
Date: Sun, 28 May 2023 15:45:35 +0200 (GMT+02:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685281552; bh=TNSOyj/R8fRwL21orChWBpSrPcruLGOuSxC646omTOA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CVfO9Pj1iezqL/76Vf1+9NQyZKUbHT4Arq7S+cTYS0BiJTkkMSVxTlA4bl5tDYX4X
	 gA5L3UqFK3jEuNrZaHF6lqM5nCC3mzKTwPGgTmxjPR/k+mGZGtlVvUzxOs4B4fat+W
	 Ua4VrvX3sD/pOPnEB5PRBnMLjFWeEaa0a39dhlcQ=
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com
Message-ID: <b25f79f0-a8fb-428a-ad54-fc4afe0df6ff@t-8ch.de>
In-Reply-To: <20230528103957.318267-1-falcon@tinylab.org>
References: <20230528075955.GE1956@1wt.eu> <20230528103957.318267-1-falcon@tinylab.org>
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
MIME-Version: 1.0
X-Correlation-ID: <b25f79f0-a8fb-428a-ad54-fc4afe0df6ff@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_064557_310437_74285488 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Zhangjin,


May 28, 2023 12:40:31 Zhangjin Wu <falcon@tinylab.org>:

> Hi, Willy
>
>> Hi Zhangjin,
>>
>> On Thu, May 25, 2023 at 01:33:14AM +0800, Zhangjin Wu wrote:
>>> Hi, Willy
>>>
>>> Thanks very mush for your kindly review, discuss and suggestion, now we
>>> get full rv32 support ;-)
>>>
>>> In the first series [1], we have fixed up the compile errors about
>>> _start and __NR_llseek for rv32, but left compile errors about tons of
>>> time32 syscalls (removed after kernel commit d4c08b9776b3 ("riscv: Use
>>> latest system call ABI")) and the missing fstat in nolibc-test.c [2],
>>> now we have fixed up all of them.
>>
>> (...)
>>
>> I have read the comments that others made on the series and overall
>> agree. I've seen that you intend to prepare a v2. I think we must
>> first decide how to better deal with emulated syscalls as I said in
>> an earlier message. Probably that we should just add a specific test
>> case for EFAULT in nolibc-test since it's the only one (I think) that
>> risks to trigger crashes with emulated syscalls. We could also imagine
>> dealing with the signal ourselves but I'm not that keen on going to
>> implement signal() & longjmp() for now :-/
>>
>
> Yes, user-space signal() may be the right direction, we just need to let
> user-space not crash the kernel, what about this 'solution' for current stage
> (consider the pure time64 support too):

If you did manage to crash the actual kernel than that would be a bug in the kernel that needs to be fixed.
Feel free to describe how it happened and I'll take a look.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
