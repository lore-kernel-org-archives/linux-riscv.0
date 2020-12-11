Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504F9C4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:48:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6E32312A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6E32312A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rKFDv31yZTkduTWne/Mdleh5HsgvVRcIf6uD1YSLBwM=; b=Yht6gelx+9Z1wlaGca7Kph4Tx
	QchtlkD6Rtr04Z20QxbGqx3hpAXeh4JVRH56bGVD17yBsn/h8JrWxlLTFebvr126jAmY8j4iO9F6I
	ngg/DgVeN2jyg1TxKd9Es/1KQQ+H6TEZ5/7Rflz3RMEn5cdY75We3O9uLWM5DjJZ8CskiB7OP+NNX
	h8kTNBawlnsWAge2MD+sPdbWcFBY2askfriDQmwCy7Vpd/bbL5YM7Cnn5EIVYkZHF64iuWxUtmn82
	GvSF9KcKzGwFGZImuJcAB70H6eBKkjglFfhu2DEqmqHb79GbYA/dlkgcPQAUIfh+mZ1HQ8r52haWh
	ccNh6qGZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXXP-00038D-C4; Fri, 11 Dec 2020 01:48:03 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXXN-00037q-2P
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 01:48:02 +0000
Received: by mail-pf1-x444.google.com with SMTP id i3so5984489pfd.6
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 17:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fA3qErY5xWtluykmP171Qn295o/oLmlgFbu/oLQ6EYU=;
 b=BkB8McS41LHbQfbR5XFx7gpaMm0wLA8+/dGBqOeJ/bO6i8JBz2Jm3oNfR/o/pumZfg
 FUj7RcMwZ4VDu4qIb2lbTqzMgEp45T0zL4UcPh4/oYuIH4at+9rScAnKQcuDTrhD5pN/
 xf0z+tS+jRmmQnwuQTjVo+twinS6+DP28y7h/MV5HDRTKvZ6h4Ttc3JBMB0XTBvi2IBu
 stnZDYdWgwRy6juvNby4nGOaHJZIkrGx27VybvEbXyyzR4uIphqmYPdh5NUJRdVleSLV
 0nhrP/EjMS//IUzXWOGZX28goJlNHl8pZv+YG5JukdpPtziVxNkP7jxOzb4xr6NcL/Jy
 QTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fA3qErY5xWtluykmP171Qn295o/oLmlgFbu/oLQ6EYU=;
 b=rfj7TqEMNfbeqBqvKRaH3a4VO2vXvr5AVKEPKQ02hTmRK0hik2SlHIpVVX5tjwUfn5
 G02+SSr8M0Ji13pe/CZgjcvSBCq3R6VPLsYxGC3qV3UHMrMT0vesGFw8cGSZ7s3KOwqK
 3F7PnNc96UFlMLAOOXwvUo66LqBKWc9F+6Dp/fNtx2uoMlGVLkqvLdUnzGFTUI2jEIff
 NHckEwttxAUXUraTDxq+XPS9N+7fIBCojlclYkyG3TxYCh28yEH6N7EHAt3F7KlHUm9e
 Bru1hY9T9kny8IbNcPnJvJSt/P2HFYahUJ34K6PJtwDViMjMy0uOjocVhQDDRNgFZc7N
 cvhA==
X-Gm-Message-State: AOAM531CKBb9fu3uuqrNtjE+O/oVa4mt+NYDVieqyLIDtQrw9BkqIqG0
 3/LhxelbbAC8DXhD8qmisau1qjPUFKKWj8Nj
X-Google-Smtp-Source: ABdhPJw2xx8Obho74Imst8OWUtZv32cQkKCQwZoys+cHZFd+IuxekDBxbleOpirENmy/BAtWF3VKfg==
X-Received: by 2002:a63:4c41:: with SMTP id m1mr9306781pgl.427.1607651279205; 
 Thu, 10 Dec 2020 17:47:59 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q23sm8007344pfg.18.2020.12.10.17.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:47:58 -0800 (PST)
Date: Thu, 10 Dec 2020 17:47:58 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 17:47:52 PST (-0800)
Subject: Re: [PATCH] riscv: Fixed kernel test robot warning
In-Reply-To: <871rg0cajt.fsf@igel.home>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-0e645b05-d32f-42ea-874a-4c91273f5bb6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_204801_170818_35FD5035 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, jrdr.linux@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Dec 2020 12:22:46 PST (-0800), schwab@linux-m68k.org wrote:
> On Dez 09 2020, Souptick Joarder wrote:
>
>> On Wed, Dec 9, 2020 at 1:21 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>>
>>> On Dez 09 2020, Souptick Joarder wrote:
>>>
>>> > Kernel test robot throws below warning -
>>> >
>>> >    arch/riscv/kernel/asm-offsets.c:14:6: warning: no previous prototype
>>> > for 'asm_offsets' [-Wmissing-prototypes]
>>> >       14 | void asm_offsets(void)
>>> >          |      ^~~~~~~~~~~
>>> >
>>> > This patch should fixed it.
>>>
>>> Or rename it to main, like most other asm-offsets files.
>>
>> Few asm-offsets files named it as foo(). Does a rename to main() will
>> work straight forward ?
>
> Calling it main will suppress the warning, but other than that it is
> completely irrelevant how you call it.

Ya, I think it doesn't really matter so I'm just going to take this as is.
It's on for-next (being a bit paranoid, as we're so late in the cycle).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
