Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,
	BUG6152_INVALID_DATE_TZ_ABSURD,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INVALID_DATE_TZ_ABSURD,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70319C56202
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 11:55:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E98FB20678
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 11:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f/bRkIQt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JqL2oXb2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1UFMJWXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E98FB20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qjHABYYeUsUD4fx6gmrK8aSFsb3y4kjvsAFkEdsDGl8=; b=f/bRkIQtXSG2p5J1A1YUhf3HK
	FnAd0I3rkVvypJ8+aXimGYnjrqXq8wagskhYexB4+epqggjqjCv8PTyc/R4Vep0ExQRKBfMvnl1qY
	IVPA4Nf/RS5keLW1sf3k6xg01trcP9IVXF8sP7vIgOGY07qHW0C2eWP7QS/q4eOVy3ZlR1CR04W2/
	z5Cm1lH+Sp7ONF16CIEE692k5vfGku7hfWWR2A0DUgtjKaqWDYVjboc8pGAbo+uvfRFoW/TN0e8e3
	NUnIuTDbeGZUPNgo8qm7J83sdgWbh0tn+HWaSDIlFG5DVbPw12SiwqZur8msXelbeIBffAU00cLkm
	lmnpqSFPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiFsI-0004Xv-3M; Thu, 26 Nov 2020 11:55:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiFsD-0004V2-IW
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 11:55:43 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606391737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=USdZ8j/ng0viEFfQzzTA/cOwLPN8cugbi0RldZSuXOs=;
 b=JqL2oXb2W9U//3tZa3VgLnpx46uGDNzYaSDcZJmUXhPEq5UnA0u00g9dax2IfsLPzjrVGf
 2l1Yf4fy9517ZRssNvxCszDD+A8VIVFIYoJz/9XuSUzDScdnVJtG7n8DmFlAX2y+N5joQn
 eaa6UILEXItvnPgzIFeYS/F5Yg7XLUuwyN3PDLYkC+sGEx2XAyctSttBi6ZPxN2L4Nb53U
 0Rpztb8aPRQitmm6WitXnPVQ+F0RSz7+txAC3FgwZlZr3KGtNj7lAScE2N6/QfIuaNwKpC
 4VQFoPLGmpzi++E0CIoTgxj/h0l/LiG7QIGaDyT7ZoF6S8gZFM8nnf/mE1NAVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606391737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=USdZ8j/ng0viEFfQzzTA/cOwLPN8cugbi0RldZSuXOs=;
 b=1UFMJWXvvXFQ49q3Qyd4r612Vby5gDQcWm8EFK3fgs/WCUgSHMkKQ7owIPuFb8SEv/umG6
 cOAfr/DNe0yXCOBg==
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH 2/2] riscv: Fix __show_regs printing formats
In-Reply-To: <87d000cu6l.fsf@jogness.linutronix.de>
References: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
 <20201124112054.106960-1-wangkefeng.wang@huawei.com>
 <20201124112054.106960-2-wangkefeng.wang@huawei.com>
 <CAOnJCUJH7AFYNsyFzwzHApZhfx_1yiEj+zkQDxryD83zac6f2g@mail.gmail.com>
 <c60a5e75-96a5-2fb7-4089-1e3b777c6b0d@huawei.com>
 <87d000cu6l.fsf@jogness.linutronix.de>
Date: Thu, 26 Nov 2020 13:01:37 +0106
Message-ID: <877dq8coxy.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_065541_903608_F6962907 
X-CRM114-Status: GOOD (  12.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Petr Mladek <pmladek@suse.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-11-26, John Ogness <john.ogness@linutronix.de> wrote:
> On 2020-11-26, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> On 2020/11/26 6:58, Atish Patra wrote:
>>> On Tue, Nov 24, 2020 at 3:17 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>>> Using printk directly and align the printing formats.
>>>>
>>> Why switch to printk ? IIRC, pr_* is preferred over printk for any new code.
>>
>> The stack output is strange, that is why I move to printk, and the old
>> kernel looks good.
>
> This is just a quick response to let you know I can reproduce the issue
> and I am investigating.
>
> @Petr: The proposed change and output difference is here [0].

This is a bug in continuous line handling. I have posted [0] a fix to
LKML.

Note that a pr_cont() message with a trailing newline will "terminate"
the continous line so that it can no longer be continued. Having a bunch
of:

    pr_cont("...\n");

lines is technically wrong. If you really want the full block to be a
single message, put the newline at the beginning of the pr_cont()
message or add some whitespace after a newline at the end. For example:

    pr_cont("\n....");
       or
    pr_cont("...\n ");

Although I would suggest making them separate printk calls. With
CONFIG_PRINTK_CALLER it is still possible to sort out simultaneous dumps
from multiple CPUs.

Thank you for reporting this!

John Ogness

[0] https://lkml.kernel.org/r/20201126114836.14750-1-john.ogness@linutronix.de

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
