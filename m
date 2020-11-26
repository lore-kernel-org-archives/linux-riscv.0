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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8635C6379D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 10:02:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B10A2145D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 10:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oLNqTgwY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LAo7PDsp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J6tpgYEs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B10A2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5AWZqKsSa8qWBbZI9LSMo7EQtOYcOgOFEwZXxNac4Pg=; b=oLNqTgwYUYfs5ELJC/ZQrvYKY
	7X7zBddFIg+KXLRG7I2idSbDbFLU6VHEZoCFBgd1ERkSva+afF6bolk1bbnaYeuDG7gNh95UgtLT5
	zcnjm1e2441HuX0HTLstJe5clumzaUmCIThHji76AYTbW4gO68uSPYgZ48BZj5cbxuc0e2RcZHLm+
	Wkfo/kSNkcu4bfmZAaej6cP8p862/gsYvUyB6XmjCpJIPoa/OQ4bW6LOOxnplCfVvj6n9Zv8ph+6W
	F7WE16DY3Nco1HJWzdIUA+GstDVkZR1i+VNxzUTFpG64ASPowkNJ76tn6Ua01PRgyzxGjWlLpL4NE
	7TindGiTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiE6j-0000Mz-Pv; Thu, 26 Nov 2020 10:02:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiE6h-0000MV-Es
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 10:02:32 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606384947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2qit9PkXxg14UDk7jOPp9fXICEg92L6laUwiDD8YMJQ=;
 b=LAo7PDsp9ozV4VuqR9/2rFDbQPZQHhFnGhWL6Yk3kOz0m10CfqeDF3P6M5CQZgaK8sWyyj
 +GA7AC9BAKXQG+LasQUlnLuRl1EdY6pWiNX6nmQ2HzU6CW+fnYzX+asfnhEO6SRBFnJrTo
 O3wlkd+ONn8TTWGz1SMHHKpvEvT/6F8d14aG1nBihwn8DLjR8+aIo/khC2V82bPtzfaYHx
 l1m8hMLiFqnTfe1oTmam1Hp5aRKomAhFgQ3H9Bi4Ik7mw8vsrPPdSRziuIbKx4UGeJn9v5
 XAOmgV87+pTzQlgOAckTEYc4azM8ZnhhVsRKfesltGq9GizBS/gh/isNldoiaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606384947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2qit9PkXxg14UDk7jOPp9fXICEg92L6laUwiDD8YMJQ=;
 b=J6tpgYEsL+02anV8qVIMn71h9RO1bJclL44zJJi/HBVvdQQIosNypjius68PynNB5ur59E
 s/9AlJ7xIqSoiOBw==
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH 2/2] riscv: Fix __show_regs printing formats
In-Reply-To: <c60a5e75-96a5-2fb7-4089-1e3b777c6b0d@huawei.com>
References: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
 <20201124112054.106960-1-wangkefeng.wang@huawei.com>
 <20201124112054.106960-2-wangkefeng.wang@huawei.com>
 <CAOnJCUJH7AFYNsyFzwzHApZhfx_1yiEj+zkQDxryD83zac6f2g@mail.gmail.com>
 <c60a5e75-96a5-2fb7-4089-1e3b777c6b0d@huawei.com>
Date: Thu, 26 Nov 2020 11:08:26 +0106
Message-ID: <87d000cu6l.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_050231_681915_88551B82 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

+Petr

On 2020-11-26, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> On 2020/11/26 6:58, Atish Patra wrote:
>> On Tue, Nov 24, 2020 at 3:17 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>> Using printk directly and align the printing formats.
>>>
>> Why switch to printk ? IIRC, pr_* is preferred over printk for any new code.
>
> The stack output is strange, that is why I move to printk, and the old
> kernel looks good.

This is just a quick response to let you know I can reproduce the issue
and I am investigating.

@Petr: The proposed change and output difference is here [0].

John Ogness

[0] http://lists.infradead.org/pipermail/linux-riscv/2020-November/003320.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
