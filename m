Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5700CC10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2362C2084C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAZTWlBO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bOzKdDFt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2362C2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=78L8cTJnibO7SrImBZzj3vZPyB9IgNuhlYrFUxPOY7Q=; b=nAZTWlBORPXwvT3ZfSdKes1nV
	Cp1W75Y/IbDOrXw6YCGsBpFdRpLOXqljLRTh/OJjmCFb59eIkhEn7/j1kc2fJz65jSvxrsIArPW0+
	PLfD0VlmQ+UQoMCnN3MSSYWfTLyB/F8wgXSD40lnMi3lfWjJNSzVmjZKG8mNC0aUCETFKv341c6XN
	TvtoY0dXgA3IbchiPgwEnyVqEqAONwbp72KMvkqlhQbD6QT4LKH/gkUqlU9dT/38gYMEmfAUiM/8a
	p3WZ3CCULZvBPe4ijUb8hco+Qc2GM3/v/UoN0cpGsfsV/WJx/vsk3AH30YhhBVdbym8oZKMMS0Zbl
	TT/t3dDug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBV5v-00061P-A1; Wed, 03 Apr 2019 01:53:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBV5s-0005xz-Kb
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 01:53:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id w23so4244241ply.4
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 18:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3CznAXgbWAy8cet+DPIfCAt6imohkshG50j1bnfx7Zo=;
 b=bOzKdDFtYgsbKJVvzus2QoUU1PS4a+IYHkwKuPcUzrfn/3r07tSsc5DqrJyO2qjFJL
 GPLkIpZZXyfZmHyCroKG+VHblcaKUpPeCunJzl51Pt/YVfpfkDWO6LKOzSRZntieKouK
 1eKTak1yLk0nE2KcaW2HrvXvnkO7VXEMNYnN6rQhIDiLx32s/M3BFrEEi/fGmQ4cuMUE
 TFhXNCBnKje/QBqYbU5rANCxFp57WKhgoE9UZVkRJo42X1onRV98FkGqcUPFcEitFoml
 IENJdm8YFhZWdYIp3QIdiuHiZsemseWtQVAFhZ6U+YWT4LWEiQxFNNrYOMHMNDBxspA1
 fYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3CznAXgbWAy8cet+DPIfCAt6imohkshG50j1bnfx7Zo=;
 b=eZXf7hqCfBYfFW50Q43L/Ka8MX6O5xbpqqhqduUNNXsWjVvGi4VHXcNTLswv0RdhsR
 Xf7AE6UYodDICdxS2r89R5i6FDajhN1lTTnHWzXMtMSkAkC++T2AS7h60AEWdEgAX+p6
 QYujj9unZAQ+FUdVRy+uAmXZR7kCHtfY5uF9hh3zI5WcB/f0b2/yaOrhwZtjnE38cpWW
 Yljxl6dusWVPJ1Vv5AfSpvdAtabOkstxn+CHygCu0PBuSt9lPvGbjJU0j8nfPzM9lG2M
 C+f3HFE7OoNcR2GbnY1wUn9+5a5Z/x5Pg7i9Lz1ip1/2k/7QIg07Q4Hrtu9q7U/GjsfN
 ZnQg==
X-Gm-Message-State: APjAAAWhu3VuhdblKHY0rrzs5ObqXO40JkktepfnwlYDPMKN2YC/hp+l
 FU6XzwvzrJT/t9RzXGEmtscNNQ==
X-Google-Smtp-Source: APXvYqyJwAW11dBevL9nFWrtXpPOxFqoMdk66yOigfneCn5W65PphSw02it84ToHKE4hegXf3UqTuA==
X-Received: by 2002:a17:902:16a4:: with SMTP id
 h33mr37484105plh.23.1554256415667; 
 Tue, 02 Apr 2019 18:53:35 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t190sm24650141pfb.33.2019.04.02.18.53.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 18:53:34 -0700 (PDT)
Date: Tue, 02 Apr 2019 18:53:34 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Apr 2019 18:25:36 PDT (-0700)
Subject: Re: [isa-dev] UNIX-Class Platform Specification Working Group
In-Reply-To: <CABwTF4UW8YePYr9Ad65VSvef4-Y42VEvNUs=hPWyWcyH295zCw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: gurjeet@singh.im
Message-ID: <mhng-0d3fa726-2ae0-44d4-9024-9c321c466e50@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_185336_856824_E4C7E11D 
X-CRM114-Status: GOOD (  23.34  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 sw-dev@groups.riscv.org, isa-dev@groups.riscv.org, hw-dev@groups.riscv.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Apr 2019 16:42:30 PDT (-0700), gurjeet@singh.im wrote:
> Not that I'm interested in participating, but just curious as to how these
> officially approved groups work. Is there a mailing list for this group? Is
> it open to public? How does one request to participate in these lists? How
> does one follow along in these conversations, that is, where are the
> mailing list archives for this group?

There is (or will soon be) an internal RISC-V foundation mailing list.  You 
sign up for it via your RISC-V foundation account -- I've never quite figured 
out how to use that, mostly because Arun handles it for me.

The tool is called workspace, which lives here: 
http://workspace.riscv.org/higherlogic/ws/public .  If you're a RISC-V member 
then you should be able to log in.  I can't find the platform spec group, 
though, so I may be screwing something up...

> The list [1] seems to be for this purpose, but it is not hosted @
> groups.riscv.org so I'm not so sure.
>
> [1]: linux-riscv@lists.infradead.org

That's the Linux kernel mailing list for RISC-V.  It's CC'd here because users 
on it may be interested in the platform specification, but it's not the 
platform specification mailing list.

>
> Best regards,
>
> On Tue, Apr 2, 2019 at 9:50 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> Atish and I have approval from the RISC-V technical committee and board to
>> start a group to manage the UNIX-class platform specification.  This
>> working
>> group will start by defining a subset of this platform specification that
>> both
>> allows compatibility with existing implementations and extensibility for
>> the
>> future needs.  The contents of this first platform specification will
>> include:
>>
>> * A versioning scheme for future versions of the UNIX-class platform
>>   specification.
>> * A specification for a platform-level interrupt controller that is
>> compatible
>>   with existing implementations of SiFive's PLIC.
>> * A specification for a standard SBI that is compatible with the current
>>   implementation in Linux as well being extensible for future needs.
>> * An SBI extension for CPU power management.
>> * A specification of the interface between a bootloader and
>> supervisor-mode
>>   software.
>>
>> Since this working group mostly consists of standardizing existing
>> implementations, I hope it can progress quickly.  As such, I'd like to set
>> a
>> 6-month deadline between when the working group is started (ie, today) and
>> when
>> a specification enters the 45-day review period.
>>
>> --
>> You received this message because you are subscribed to the Google Groups
>> "RISC-V ISA Dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send an
>> email to isa-dev+unsubscribe@groups.riscv.org.
>> To post to this group, send email to isa-dev@groups.riscv.org.
>> Visit this group at
>> https://groups.google.com/a/groups.riscv.org/group/isa-dev/.
>> To view this discussion on the web visit
>> https://groups.google.com/a/groups.riscv.org/d/msgid/isa-dev/mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74%40palmer-si-x1c4
>> .
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
