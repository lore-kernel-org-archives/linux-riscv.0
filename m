Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B2BC4706C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 20:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7ZiijAMUTocoGu636azP0qy0hXcE44blVwB8FADxjA=; b=PrR+7zYJC5LKZ3
	+MCupRO2kzO1eMPlln/i9rsk0MN5L47zLTfeTRlOMCFFUu6Z3/FSdZAUNRBwHUz1K31u8pFbGzjMg
	BEVkKYJKnvvyYw30nhRKdty1ecG1paATeUOpO6sVCArfU8Gx0R7CepW7AqzB0M5YrTsmYjgg0juFR
	X78Vhgst4PPX7/fhQ3Sg0ZpWSx3/0//fRJOwho43LyAJnCe5OZAtJmeJ3ko5X+2Janj4/JQpzAcvS
	FgJrVW4RUCeROs485vKH4rvxh85IKN5BkpZFgJxgPvz7V12avkOho6GJb1eMnFuSarTWYh/QdCLLA
	ZmZV5Db8PcG+rmBUHM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNIXn-009QlB-0o;
	Tue, 09 Jan 2024 20:17:51 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNIXj-009Qjr-2V
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 20:17:49 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7bee874fcc2so30293739f.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 12:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704831465; x=1705436265; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvygCsnAZQSUX1OyBrWi0tyZLEH0CAk1fXUh+ZaJ3Lo=;
        b=dqgQQqgpHJU8qhijO9ZSnMRhx4bgWtQc3n65CDifykU8wDm40NuGOEyCGitx5aJ0q0
         sNBIJMcx94RhSosIj8O6iHT+jsEYOrs8hhaFP58LZJZG8B6RovWM49H6I3PyYG4CTEhP
         VxGVYurYl7SWeksAEv+PUyVJE7D3sVUwbzKg8RBl6LyV/vpwl9Fy8BMVwySRiF/iI2ug
         EIbJy6BJ5vuYqxY2nneMlxz59O5bsa1i5dbPztmyeyPTrPYVT795y/NgrBKmliGnZQ+V
         CWA7WhZuZzjAf0x/2O/wQ2ljx0qjSveKvO+fxj1SxBrbmWE6y+/RRF3gBlVlt6zyxxOa
         RpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704831465; x=1705436265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvygCsnAZQSUX1OyBrWi0tyZLEH0CAk1fXUh+ZaJ3Lo=;
        b=kaUBtLjxC/a4YJL1/HrepVuyFyEVfNhtwMJ8CqxTPj0z2Bk5u7qZ//P4LckltIADCe
         J2pwk7swp9b/Kv9uNZDe8lhAbX/IzI+tY++mzHVEShSfojgzg6BVoxKcUSMBdz2ozofq
         mBwYFL8w7MnTjC9ods890xF4WY9Zy3i2/rVNsgKLhdUrr2IgF3xhunrwHv0bZqVv7Pkj
         /UFihUs4WV0wiuc7MCOZ/Hkv944KibJ4TTl/pJ5FG9bozviP3e3eVJafvH+oUnhPKpTS
         DQpTehIfi6G+bcFIq/HMYEuIIFjZqjEkEHlZOPRod44vi/fJL0Z8hyaheRSuapZzqEbz
         wY+A==
X-Gm-Message-State: AOJu0YwRP1j5rmX+QjBTnCX2/O0QT1n8rspDEXfGrz8QmoNmiB7xZBZW
	ARnpbgttre9FL5ZwEqSAo4JpVC3smOUGEg==
X-Google-Smtp-Source: AGHT+IHJDeszorYY5GFrmlMsgPhnGqSSgFTpBWcziFxtkUG5t0gPVrqEY0fdimh0r8UPafEYZce6pw==
X-Received: by 2002:a6b:7e08:0:b0:7bc:4215:da28 with SMTP id i8-20020a6b7e08000000b007bc4215da28mr5504732iom.42.1704831465186;
        Tue, 09 Jan 2024 12:17:45 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id q5-20020a02a305000000b0046e4506fa75sm13527jai.26.2024.01.09.12.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 12:17:44 -0800 (PST)
Message-ID: <a3d7f5ae-56c6-9cd8-2cda-2d50d12be9c4@landley.net>
Date: Tue, 9 Jan 2024 14:24:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Call for nommu LTP maintainer [was: Re: [PATCH 00/36] Remove
 UCLINUX from LTP]
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>
Cc: Cyril Hrubis <chrubis@suse.cz>, Geert Uytterhoeven
 <geert@linux-m68k.org>, ltp@lists.linux.it, Li Wang <liwang@redhat.com>,
 Andrea Cervesato <andrea.cervesato@suse.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 automated-testing@lists.yoctoproject.org, buildroot@buildroot.org,
 Niklas Cassel <niklas.cassel@wdc.com>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik>
From: Rob Landley <rob@landley.net>
In-Reply-To: <20240108090338.GA1552643@pevik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_121747_814957_8CB1F70A 
X-CRM114-Status: GOOD (  22.05  )
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

On 1/8/24 03:03, Petr Vorel wrote:
> Hi Rob, all,
> 
> [ Added Niklas Cassel, who is maintainer of qemu_riscv64_nommu_virt_defconfig in
> buildroot ]

Hi Niklas!

>> Buildroot also apparently has an LTP package selectable in menuconfig:
> 
>> https://github.com/buildroot/buildroot/tree/master/package/ltp-testsuite
> 
>> But I haven't tried it...
> 
> I'm the maintainer of the LTP package in buildroot in my private time.
> BTW I spent quite a lot of time fixing LTP (and some other system packages,
> e.g. nfs-utils) compilation on some old legacy architectures reported via
> http://autobuild.buildroot.net/ I've never used in the reality.
> But I certainly don't have time to drive nommu support in my private time.
> I don't even have an interest, I don't use any nommu device.

I do, but I've never done much with LTP, and I have my hands full with toybox
and mkroot already.

> Therefore nobody who is not involved in nommu will not find a time to support it
> in LTP (support does not mean just to add the functionality to the new C API,
> but run tests on nommu and fix failing bugs). I suppose nobody is paid to work
> on nommu platforms, it would have to be a hobby project, right?

A bunch of people are paid to work on nommu platforms, and I've worked with them
a bunch, but none of them talk to linux-kernel. They find the culture toxic,
insular, and categorically dismissive of their interests.

For example, cortex-m is a large nommu platform on which vendors support Linux
BSPs, but notice how page 8 of
https://www.microsemi.com/document-portal/doc_view/132181-linux-cortex-m-users-manual
points at a cross compiler toolchain from _2010_ and page 4 says they're booting
a 2.6.33 kernel?

I'm a bit weird in that I try to get CURRENT stuff to work on nommu, and a lot
of people have been happy to consume my work, but getting any of them to post
directly to linux-kernel is like pulling teeth.

> But as I said, if anybody from nommu decides to maintain it in LTP, I'll try to
> support him in my free time (review patches, give advices). And if nobody
> stands, this patchset which removes the support in the old API will be merged
> after next LTP release (in the end of January).

What does the API migration do? Is there a page on it ala OABI vs EABI in arm or
something?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
