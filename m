Return-Path: <SRS0=LGYn=NG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E60AC46475
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 01:35:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D6820834
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 01:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="midcjrsm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iQpHM4RC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D6820834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7MM0rGZbIqDoReijPaqYEJUIHLLL9gx0nhKfaLr8La4=; b=midcjrsmivXwGWDD4o1yWGYvO
	/b3KpDOLOc6UNFrsYxMrzpWj0ne7P3QCAha4nTqylCcC9DK7GyclYmjZeRM/dzBNRGqJ1jIAwYAE1
	JyFZUPPUqkWcSjOLQgsuw+P9lkuUoHj8l0bQq0SM1bV6SjCsabT1Yr80bTJEsHzJM7TdWtSsa8EAl
	XuzjMxB3qdXfh/od8d1HUGbKoZxSlvCncfiNUzk06h3XzkDTCH0555L6EE0Bvs/FR9imf7qCwL69a
	8WwF4lpqT6JfMjlcuWbrJj8sHZeQ8fcynw7AH2rxX/Szj9l/UFLNezIJOVWQo5PUoxx7/gtRwwd07
	+kzdZJfiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFr2Y-0002lV-Mi; Fri, 26 Oct 2018 01:35:54 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFr2W-0002j0-4X
 for linux-riscv@lists.infradead.org; Fri, 26 Oct 2018 01:35:53 +0000
Received: by mail-ed1-x543.google.com with SMTP id x2-v6so10221887eds.3
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RR8ONRD0zi5KJgJIqCODT4yKmL6LHh5tAw8DXxRpczw=;
 b=iQpHM4RCBVJaM89e4arWB6GzIrq3SIVXtmwsLkIZQNKnPoQkyyzsyCnymjrL9GKqAt
 3//z1o/YaxYFV98z0NvNf3YLaD/SrVRryCa+VyGEGjIIMo8CtbTQMob5z5uqS6fncGAL
 FSECnjHJkXGdaYB4SQt8LAnhzgktmp3UzSWg3n31654ojeSJWf7DowsjkTb0ZnVwLN/+
 UC5pksJsh0s5v9Ik6pi639AVrfP8RRZs0JL5hMhTNbGvcVqLYm1sz6lECgejBRzBm9PX
 w45NnUqw3ruOsZigXJadTbdc5X9k0Y2+hsNREf8E3rjIALFcpSD+udqemd1nqcuQYVAU
 cT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RR8ONRD0zi5KJgJIqCODT4yKmL6LHh5tAw8DXxRpczw=;
 b=ruMfKvObxguoITVC0I7tIblIENymWe0OjYNzucFJO9VONgYpYAFxra+lNiP49aVnH8
 3WTymmoUlTju62U597IrZlaTRlsIKIE2aDYDlhL4+smh8Sjn5UlLal4UmBhAUXSQc5TW
 uKMB6486qQ9jNBtfbnfeXAyzra0/DWsuL6MUclFMLTuIZ8+0yqxfFHwh80q1B/WTof3Z
 z3NwhEdmHgOe1739zMTr/NAiEKuY0LRsT44ZnTXZsvjSEhaM7RymXR9G6WODEngfSbbo
 sETmttTlXEuUmxUOCT+fey/rUpImPhbxnwjNQ6Rj3m8TjCsNY6Xl/PBw2WIoAPspZTFh
 5BZw==
X-Gm-Message-State: AGRZ1gJ9gF5z/eivkZUVxuhGKhPyWCtEN2jbdksJy7DAztGMwEQL0+9E
 ntddIEPN0QiylOQYZ1JV16/0t0Uhpj4=
X-Google-Smtp-Source: AJdET5e7a8w3mSlkejlIIU9K5icK3HFG5SO/fqbDiVmO1nVZr0ui6TOAnZ0K4kMjPbUPp9vraiKwmg==
X-Received: by 2002:a17:906:90c6:: with SMTP id
 v6-v6mr895795ejw.214.1540517739840; 
 Thu, 25 Oct 2018 18:35:39 -0700 (PDT)
Received: from [10.1.6.225] ([185.15.205.146])
 by smtp.gmail.com with ESMTPSA id j2-v6sm3497557eda.89.2018.10.25.18.35.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Oct 2018 18:35:39 -0700 (PDT)
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
To: zongbox@gmail.com
References: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
 <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
Date: Thu, 25 Oct 2018 18:35:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_183552_207587_30DC29F1 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org,
 palmer@sifive.com, Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181026013538.5ybxxceCgw48kOUUNC4bvsYm6ErLxCxL6gCs1JYqehA@z>

+ Zong Li

Zong,

On 10/25/18 6:12 PM, Linus Torvalds wrote:
> On Wed, Oct 24, 2018 at 1:42 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>> I'm pretty sure this is our largest patch set since the original kernel
>> contribution, and it's certainly the one with the most contributors.
>> While I don't have anything else I know I'm going to submit for the
>> merge window, I would be somewhat surprised if I didn't screw anything
>> up.
> So I'm not entirely sure this is a screw-up, but it does have some
> signs of being one:
>
>>        lib: Add umoddi3 and udivmoddi4 of GCC library routines
> We have *actively* tried to avoid needing umoddi3 and friends, and
> have so far succceeded in doing that across many different
> architectures, and many many years.
>
> And when we _have_ added it, we've added it as architecture-specific
> optimized routines when people really need it.
>
> The reason to avoid a full 64-by-64 divide is that
>
>   (a) it is really expensive
>
>   (b) code that needs it is almost always actually wrong
>
> Almost always, the 64-bit divide turns out to be entirely pointless,
> and the code can be written as a (much cheaper) 64-by-32 divide
> instead using the functions in <asm/div.h> instead.
>
> Does RISC-V _really_ need that disgusting full 64-bit divide, or was
> the addition of that simply a "we didn't know better, and didn't
> realize just how expensive and wrong it is"?


I believe the request for those routines came from you:


https://lore.kernel.org/lkml/779b0b25cc96101a525402f38053db5e2f360d6f.1538535528.git.zongbox@gmail.com/


Do you in fact need a full 64-by-64 bit divide in your DMA driver, or 
can you

get away with using div_u64() et al.?


https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/math64.h#n123


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
