Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5C0C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 17:19:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F562171F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 17:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZDyv7zr2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MvSZHNt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F562171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=752O8oqIVJqZBRDBcKlK8JKN0og8OSVcUmBbuV+/T0o=; b=ZDyv7zr2eOEfHr7vVx27j0YSp
	gpkLKdpgudYcjW1LSTq3z4SBqIGU7OfzlQxqlQ4+teCk4frEU8Ks5tAHof555dYtwMvXtYE2i95Ua
	ATiMhNMs8ZLrrMpEUEDAv2OMxF6zNHmASVlez832XuOP8Z3iwlsJzqjYiZMPYhf8PDwcD/Hzo92Xl
	HPC4O2RMDWK0JnJxFrRI7gI8CzU8uCjjY8KA4EJTsdVNAxJYm4uZUwMItOTD540zofjY6ay8eNuab
	KYK6491p2sz50adm3zvl39xovqpM1I3igDfKvs1LdK/XImwKvS79VwoFMomz8yNZAxfHcSjyAaACO
	/MBLuXtqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcCq9-0006WZ-Pi; Wed, 26 Dec 2018 17:19:29 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcCq4-0006V4-3o
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 17:19:28 +0000
Received: by mail-qk1-x742.google.com with SMTP id o125so9631401qkf.3
 for <linux-riscv@lists.infradead.org>; Wed, 26 Dec 2018 09:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hXPBEhKo6+vqETqkn0MUxjjpIvQosX8dWNSTe/yT4ao=;
 b=MvSZHNt1Pf7ZiBknpuG8T3xCIrV5SlKmcz5xOzeejWBgPDYQW4f9c5r3ImD4Q7JZMo
 Ml/yFJrqvGBQMG3bYBSooiWdvCH2u7BRpj1g0zucfWWo18DRSv1zMb+PFweH7sKBjHsc
 TAm7S+WbYop/eK/lrnG8z1Tt88+yGaS76ks/nIc0Ygqp4l4fbyY8jHo3DNbu4BCRqX7R
 6SSoQ/cnGu3gzENMRxOJGqcKnFtUMpjt/MVOKl/dRf0ajPoLiHpCPmgxDhxcISMrKxvr
 KozDvU4cge/n1B7qJ0CumG0LwgDzRkfWuANgY6Yt8E8dbsLYJcQiqEaFmP6+Z4DdTcQ5
 Pt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hXPBEhKo6+vqETqkn0MUxjjpIvQosX8dWNSTe/yT4ao=;
 b=lHqQjnK3nLCpfZ6Lh3uzbiZBKyyZafyOXuBl4v0hkg9NYK/QzkKB6IYI1uzSXOs25f
 dmqWG8z+kIr27ch12RuX3KumnYJ8xsXtsPl8CM0ytdMf99hOBV9qJA+0cb+oZdGFspTG
 as9trwXZ1C3N4YO99rura7MxAganh7w/vy4JnuN9aUMiLqIIWRyuwqcPfV8FNiykZunN
 bKcMGJZA3j/P0KMoc7aHuuVjwRPaR4goFIML+/894e28rt6KkrDYp5mZYcg/7GW0LOog
 UvXflyc3l7fvRXA7mSpW1fGg4bLePkzzA754PTOfFAjBDjiXJBXD83doWphaq7JnZTdd
 jG3w==
X-Gm-Message-State: AJcUukfv2DkeKYYqFvlBkZ+S+4Bq5gs2tOXCDM9uEBFgatu6wAhCEfo8
 KExCTbLdYps75IL//3SxF3dekg==
X-Google-Smtp-Source: ALg8bN5d5NMEmVHXrxCc4TmyKfL0p/mdDd6CQFR2jOpQqZVi5y1OZW6HZnbN0u5ZgncQg1ACpMig/w==
X-Received: by 2002:a37:6584:: with SMTP id
 z126mr17798053qkb.295.1545844752899; 
 Wed, 26 Dec 2018 09:19:12 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
 by smtp.gmail.com with ESMTPSA id v32sm16351619qta.37.2018.12.26.09.19.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Dec 2018 09:19:12 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:12 -0800 (PST)
X-Google-Original-Date: Wed, 26 Dec 2018 09:14:01 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
In-Reply-To: <20181226032350.GA27044@roeck-us.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux@roeck-us.net
Message-ID: <mhng-856d9dbc-a4f1-47c3-a71c-d1f7ae82184b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_091926_760414_D44075F9 
X-CRM114-Status: GOOD (  22.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Dec 2018 19:23:50 PST (-0800), linux@roeck-us.net wrote:
> On Wed, Dec 19, 2018 at 09:25:21PM -0800, Guenter Roeck wrote:
>> On Wed, Dec 19, 2018 at 05:45:11PM -0800, Guenter Roeck wrote:
>> > On Wed, Nov 21, 2018 at 10:58:05AM -0800, Palmer Dabbelt wrote:
>> > > I don't remember who suggested this, but I was talking to someone at
>> > > Plumbers about all the horrible bugs we've had lurking around in our
>> > > port despite it still getting to userspace and they suggested that I
>> > > enable CONFIG_PREEMPT in our defconfig as it'll help shake out more
>> > > issues.
>> > >
>> > > This patch enables CONFIG_PREEMPT in the single RISC-V defconfig.  It
>> > > still passes my tests (ie, booting Fedora on QEMU).  Maybe I'm too
>> > > paranoid, but I still don't trust our port enough to just pull the
>> > > trigger on this without at least accumulating some "Tested-by"s on it.
>> > >
>> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> >
>> > I can only give you a
>> >
>> > Fails-miserably-for: Guenter Roeck <linux@roeck-us.net>
>> >
>> > Not the new defconfig itself, but the new defconfig plus a variety of
>> > selftest options. I don't know what exactly is failing, but here is
>> > my list of enabled selftests on top of defconfig:
>> >
>> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
>> > CONFIG_CRC32_SELFTEST=y
>> > CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
>> > CONFIG_DEBUG_NMI_SELFTEST=y
>> > CONFIG_DEBUG_RODATA_TEST=y
>> > CONFIG_DEBUG_TLBFLUSH=y
>> > CONFIG_DMATEST=y
>> > CONFIG_GLOB_SELFTEST=y
>> > CONFIG_OF_UNITTEST=y
>> > CONFIG_PCI_EPF_TEST=y
>> > CONFIG_PCI_ENDPOINT_TEST=y
>> > CONFIG_PROVE_LOCKING=y
>> > CONFIG_PROVE_RCU=y
>> > CONFIG_RCU_EQS_DEBUG=y
>> > CONFIG_STATIC_KEYS_SELFTEST=y
>> > CONFIG_STRING_SELFTEST=y
>> > CONFIG_TEST_BITMAP=y
>> > CONFIG_TEST_FIRMWARE=y
>> > CONFIG_TEST_SORT=y
>> > CONFIG_TEST_SYSCTL=y
>> > CONFIG_TEST_UUID=y
>> > CONFIG_USB_TEST=y
>> > CONFIG_USB_EHSET_TEST_FIXTURE=y
>> > CONFIG_USB_LINK_LAYER_TEST=y
>> > CONFIG_WW_MUTEX_SELFTEST=y
>> > CONFIG_TORTURE_TEST=y
>> > CONFIG_LOCK_TORTURE_TEST=y
>> > CONFIG_RCU_TORTURE_TEST=y
>> > CONFIG_RBTREE_TEST=y
>> > CONFIG_INTERVAL_TREE_TEST=y
>> >
>>
>> Update: defconfig+CONFIG_LOCK_TORTURE_TEST=y causes the hang
>> if CONFIG_PREEMPT=y.
>>
>
> Another update. CONFIG_RCU_TORTURE_TEST=y or CONFIG_WW_MUTEX_SELFTEST=y
> also result in hangs, only a bit later. I have now disabled all three test
> options in my riscv boot tests if CONFIG_PREEMPT=y. The lack of error
> reports in the future does _not_ mean that the problem has magically
> disappeared. I just find it pointless to keep testing a known broken
> configuration, even more so since doing so would hide other potential
> problems.

Thanks.  I agree it's pointless to test more, as there appear to be lots of 
bugs to fix already and this will just mask other bugs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
