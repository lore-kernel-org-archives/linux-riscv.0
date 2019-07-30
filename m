Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2FBC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 03:42:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F70120882
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 03:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pYYQuglc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F70120882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=1WTlq5R4nBZ6ZCNa9dv3POlyIUNNFaEFRwI/VYLY1As=; b=pYYQuglcb4b2Vfl1Kf/LTf3dA
	JfkFptYx2KIfkz61UJECJHV1A7HPfU4Lx54XVjPbbYk+M7DkbUpNYfj5QfzxfMYPZUOZTuGdPRAE7
	KWeRDa8bZ352AEAGtNocRbdAfhtd3NIEUJ0juoayKcUeRTqZo+Fux9fdWz7BU4xjmb73ON3HcQB0g
	d12E08BrxwHF1e63grZ5Q/qeLfXMZsDVuG2K6auT+d5kKtpJ2/0LAnqrj7fa8W7DfDbDcWHjpWVm/
	bOfGiY1mY9svbF9YloV57/n+0xovsoCV0vjLzv4/WLoDJmiyN0HiAw5toWaX/6Q/RKRzYEm7fQdzZ
	52mkFp5cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsJ1x-0008FA-9L; Tue, 30 Jul 2019 03:42:29 +0000
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsJ1u-0008Eq-3C
 for linux-riscv@lists.infradead.org; Tue, 30 Jul 2019 03:42:27 +0000
Received: by mail-pf1-f194.google.com with SMTP id y15so29082602pfn.5
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2019 20:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KzQ2d5or7VQXiah+3vlOrWNhkXWwOjknOlmw+s8awSE=;
 b=QkUYOSw3PDuDvK3Y1WWelEYn+hP/hLn38vtpMebxoPtfbeajhhhdoUUbFpzTyC9Y48
 xcEiz6o7eiQw/FV+3PweJnpNrbcTdB6pIiwLagrQmytNVii85Q9SEmS05SJgURpG+IER
 1GognlBGU0CmWv7Gr8eDeItTzpq1jrsfU4ZKMc/0MZPvo2fQn3AU5rXZx4KY870huGcp
 jbirdGRsMwHDWJQ9KtJiNKfp6xOol+H3lApN1ZG8f5mC1cgT84Udec7Ydgjo0w/yeF3Z
 zo9yZH7JeSWGWlbHl7/kdh7Dce5SyUMEh6fh/oXmy6orPOEink5blHf9uputgx/usJ3Y
 G4vQ==
X-Gm-Message-State: APjAAAWo+//YFIFJt8zONVuyq+nMDbIB8kWmRrhtpNoHDacDIrVPydLx
 jewkj3x4bYG3fBkoF6BqleX0haj1JCg=
X-Google-Smtp-Source: APXvYqwKj0qOQ8BC7cbBgbpIj+BoeQaVMscqGRy6D2jtBXUOCNRZ23A9EbKFb2h/fUeGkeVkieBEAg==
X-Received: by 2002:aa7:82da:: with SMTP id f26mr40058645pfn.82.1564458143949; 
 Mon, 29 Jul 2019 20:42:23 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id o35sm54590057pgm.29.2019.07.29.20.42.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 20:42:22 -0700 (PDT)
Date: Mon, 29 Jul 2019 20:42:22 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Jul 2019 18:25:40 PDT (-0700)
Subject: Re: [PATCH 3/4] RISC-V: Support case insensitive ISA string parsing.
In-Reply-To: <a8a6be2c-2dcb-fe58-2c32-e3baa357819c@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-540ae5bd-8e5f-4054-9192-4e4e73cbce21@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_204226_143060_653255B9 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, alankao@andestech.com,
 Greg KH <gregkh@linuxfoundation.org>, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, johan@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, allison@lohutok.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 26 Jul 2019 15:20:47 PDT (-0700), Atish Patra wrote:
> On 7/26/19 1:47 PM, Paul Walmsley wrote:
>> On Fri, 26 Jul 2019, Atish Patra wrote:
>>
>>> As per riscv specification, ISA naming strings are
>>> case insensitive. However, currently only lower case
>>> strings are parsed during cpu procfs.
>>>
>>> Support parsing of upper case letters as well.
>>>
>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>
>> Is there a use case that's driving this, or
>
> Currently, we use all lower case isa string in kvmtool. But somebody can
> have uppercase letters in future as spec allows it.
>
>
> can we just say, "use
>> lowercase letters" and leave it at that?
>>
>
> In that case, it will not comply with RISC-V spec. Is that okay ?

We could make the platform spec say "use lowercase letters" and wipe our hands
of it -- IIRC we still only support the lower case letters in GCC due to
multilib headaches, so it's kind of the de-facto standard already.

>
>>
>> - Paul
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
