Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF95AECDE4B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 16:57:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36CB20825
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 16:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n40Twxku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TD2vljlX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A36CB20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=CCkY9xOoNv83vIFx8COKJPUe++BHUxAmEz7bhdT6uAI=; b=n40TwxkujKJ9QETsYAdSVt22X
	C1aiRuqkB3hFmcmfTAzi5T5i7KxzttfZYKLSgT0To5wtqPnF7Sw2Sq6qbAJBYva3nDGP1ujM8ysIr
	qvbJzqbEN3RliXqyACyJB3kNa5fMGRM3bV5kFFUQhWFWtULJdZ8WFBfxjyRbbxPkPrRJI6RFu3LJN
	2hiAurZiTsNIHBoCeQKNbzLfDGD23t5CPj0frEvC3z9HGwkzq8osyVWUUer5TataYFhr1VsuRfGjL
	2p2Ud4eWNpWG8Zo2Ah01UvmsqjPXDdXeVtxeBhzy/pN9u8Ge102AbE3uYcn7UBN0WU2gbSJ3T/R/X
	DGIkUFmuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKncf-0005WQ-16; Thu, 08 Nov 2018 16:57:37 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKncb-0005Vn-Kz
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 16:57:35 +0000
Received: by mail-pf1-x442.google.com with SMTP id v9-v6so7261173pff.2
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 08:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KezV1JFuoks0ChOPNTTXi/hsEFFcC46T33uZsk1QVdw=;
 b=TD2vljlX2uYHrwsacdv7Q04XUv+HDJTo/Kw8irBg/TxfFTESJUdJLOeqhpQXR31ye3
 9A4bYs+R5Sf+pHbMXTstK5qeMYVYPKmqDb/a9YLZey2Kw+g6iRlvilXKR1U6BO8LtRz3
 ElZ2aF3zEnamj3hXpHbNEKdD6PnwYQQ7TwWEaC2KmfHgwpLNJEUoOz3EXNnVWI3hjEg/
 gSP1MCVjUI1LZDJWEpw7A3v0cl7CxV96rCqX9DKjXgSAKa1sS7Q3B7CJq5Gakmx3Xil2
 eLdPJbdKKKknSMyXPLR/2QrRuczISWXxZ0E6zg61QUjIQaCPgsdO3y44WLwQnvhpPjT6
 AFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KezV1JFuoks0ChOPNTTXi/hsEFFcC46T33uZsk1QVdw=;
 b=gFniYiUkfsaUcNcRUHv3xgkb57+jczqxOViy46nt3WUd7UrUQrhDMD2xoB1oLvCyKb
 Xb0qsdhoFvFF2zv/JZT0zow+SH0XDytl2OAdgNnAwi4ybEmZvfgx67oeing5s/pUDQim
 6JtZdQo0ZdgdiY1HHJF4GgJ8RxWIktJiMczVgzgRJBpzUQtYL4nUsWXtDea0EspmOm+7
 RtCcu/po9BTCR6q6PucpUuEmBBrmVGVz8sjFUwgH7GNgYnZeu41Z+uucjIJpZjrKcEWE
 S37WBF4OpeSbxF+buwtNyjOg4K9yIAOuhndGE4p8N3/1KCb7ZfZfCvtF9hEhrVDN4bFg
 9WCg==
X-Gm-Message-State: AGRZ1gJeDhqwC4PpR9Ha7HR0x2pcVEzpKJd+cSYPsWgX/+SrfBYXIqXd
 V2G0r3bGp2WWKS8p/bqEm8tIPw==
X-Google-Smtp-Source: AJdET5fSF8rvzlqWfyOgfOgrhcdMyxEvn3zg3CJIGdSIStoro3GkzBjuZph2ZELRDgiBoK04Va4N9w==
X-Received: by 2002:a63:ba19:: with SMTP id k25mr4369844pgf.194.1541696242517; 
 Thu, 08 Nov 2018 08:57:22 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k75-v6sm12330121pfb.119.2018.11.08.08.57.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Nov 2018 08:57:21 -0800 (PST)
Date: Thu, 08 Nov 2018 08:57:21 -0800 (PST)
X-Google-Original-Date: Thu, 08 Nov 2018 08:29:39 PST (-0800)
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAK8P3a2468O=MVXVaZ8_Vq6DuOYV2iwR98upqpWOH67z9Gh-6Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-9210a40d-eee0-4600-ae47-4fdff795f0a6@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_085733_698154_B9695987 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: aou@eecs.berkeley.edu, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, marcin.juszkiewicz@linaro.org,
 linux-riscv@lists.infradead.org, linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108165721.2uYIxrc3y-a3wtpp5ZlzjW46n9TAGF9kBCTnQsv-rSc@z>

On Thu, 08 Nov 2018 02:30:02 PST (-0800), Arnd Bergmann wrote:
> On Thu, Nov 8, 2018 at 3:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 07 Nov 2018 13:09:39 PST (-0800), Arnd Bergmann wrote:
>> > On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
>> > <david.abdurachmanov@gmail.com> wrote:
>> >> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
>> >
>> >> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
>> >> > That's progressing well, with one last blocking issue related to some of our
>> >> > floating-point emulation routines before we can submit the port.  This should
>> >> > give us ample time to line up the ABIs correctly so everything works.
>> >> >
>> >> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
>> >> >
>> >>
>> >> Then if you agree I could do and send v2:
>> >>
>> >> +#ifdef __LP64__
>> >> +#define __ARCH_WANT_NEW_STAT
>> >> +#endif /* __LP64__ */
>> >
>> > Looks good to me.
>>
>> This is a bit pedantic, but I'm not sure what the right answer is here:
>> "-march=rv64gc -mabi=ilp32d" will not define __LP64__, but will define
>> "__riscv_xlen == 64".  I actually don't know enough about how an rv64gc/ilp32d
>> ABI would work to answer this: would we have "long long" all over our syscalls?
>>
>> Probably not worth worrying about for now, as we'll have to go audit all of
>> these if we ever end up with an ilp32 ABI.  So just go for it and we'll throw
>> this on the pile to deal with later :)
>
> Short answer: it doesn't matter because an ilp32d ABI would use neither
> newstat nor stat64, it would only need statx().
>
> Long answer: We've gone through multiple iterations on the question.
> x86 uses long long in syscall interfaces and tries to reuse the native
> 64-bit syscalls as much as possible. This turned out to cause endless
> problems, so for the (never merged but still kept around as a patchset)
> arm64 ABI, we went the opposite way, and made the syscalls use the
> same ABI as the arm32 mode.
>
> From the experience with both of the above, I'd say if you end up
> having to do it, use the same method as arm64, but try to resist
> doing it at all. Unlike arm64 and x86-64, there is no inherent benefit
> to using the 64-bit instruction set (doubled register number etc),
> so compared to the normal lp64 ABI you only gain a little dcache
> space for the smaller pointers at the cost of a smaller address
> space. For you as a maintainer however, the cost of supporting this
> mode is that you are stuck with three user space ABIs instead of
> just two (normal 32-bit and 64-bit).
> If anyone really wants to run 32-bit code, they need a CPU that
> allows switching modes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
