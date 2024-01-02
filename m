Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EB9C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 05:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WY+Rh9CvCgSld2T4D+xBbxjx4UhDZm0xZEUVeEp6MAo=; b=naYTo12vUyF+Sk
	gAM1TftzHDP4GpC3lZ4g3Qv7k4npxceeUQ97AvKBtUqqWoMRQmXZHCqFebJhyATX6PNVNZl/cluDi
	LpVflxSJdQP2oKpzEHfDkffze4jR4LnBQnGGUwCMWgP6g5g0qFIERslhlLUdgzNiRlK+iG9YMtzVP
	7Pop7ZT3z3GI+/SnYBa3M8OYFDUBL7TSJk3CcyElzB1ebtZSl1MI4qszsMrTWEjO5zylIPNGbbbQT
	nFMk3RI7advbvqjjSLilWibvSbUDceASzulMZr4ERZqA5WRzQ4Gr93IB/+In4rqcTx2xWBuojY72G
	mq90/hzgKNfKV6ljstcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKX9G-00768J-0S;
	Tue, 02 Jan 2024 05:17:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKX9B-00767w-2t
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 05:17:04 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2158645a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jan 2024 21:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704172620; x=1704777420; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0+e9jXb1APHsr8+SSFKuSYagZvt9QzyAw+8MedzV9k=;
        b=Iq0T2y56tqq1E+hOvcdjyWFhnZIMYSAU8HF4F2qGjcXgQ0oEVrg87iDgtyZTR0wkuc
         iYCRBiq9aApiaxcrsqCEmn/FmSHAUNapRYdWFGOurBC01damR6FIT8+XeC0NFMjYzr0p
         dxzV5qIIHwdoIn7PeTHAkWih+6zlqvhAa6xprN1F4dKKffLYNdHgNcyo9iVqY3AyYUad
         hVOm3jVwqSBQuIpkiDikz4R/C7JXpeIt3ymjBCwptT9+hvXOqSTIhUYD6ULvKuJAuQCR
         XY/QicnhVHi/vkRjNKwcPE+PApoZ+0OuWq5w8XjgVBRh8YlmnGFbpafo+oxexXkqavj0
         eCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172620; x=1704777420;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0+e9jXb1APHsr8+SSFKuSYagZvt9QzyAw+8MedzV9k=;
        b=s4NaAq7GcDZkHD6WOInvlARkuGnXPDZfNQc75EqrYwisKQsc6e/uk1SGn+iFQHlBFH
         oXlv4r5S+MA3iTE9eld0ueZp6IMtYokhWDDNzWJMzVaZYHk9iwaAaqu9IPph7gEzLF7J
         XOuhopQbM3pxPJZX8/rqwhRrZN2wUtWfY/re5BnP67CwcyRDixX5H1UKm7/Kyze0gvRo
         As2x4gYZBxzbzFLHsadorWlEJmLSkLeKfGevmLxmku9i4EAWFSMrlIODD/ImWWuJiJfC
         oob5vIXV+t66c11Tw6S/GrZTKMz5yUhI0kM4ZFRhgJuKhCJB6DRVFtOOZrB9g1Hr8qzf
         X5mQ==
X-Gm-Message-State: AOJu0YydfE1nVSXpqosbUSIBJqzZRyjiZLvcshsTyBmA0MUP13dpuqUb
	/LR9dWsuAQSvHasMKUrNIJPzCLGTnsYsoA==
X-Google-Smtp-Source: AGHT+IG1JRqn+7/ZW5uKjjHFyDuCLIb0RjG51YBmpY/IphE+PQuOa/LY7hCZn9t+tAnGTUHZvtHBUw==
X-Received: by 2002:a17:902:f814:b0:1d4:58eb:d901 with SMTP id ix20-20020a170902f81400b001d458ebd901mr5578770plb.41.1704172620140;
        Mon, 01 Jan 2024 21:17:00 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:d389:6cac:304c:13db:9f1b? ([2402:7500:5d5:d389:6cac:304c:13db:9f1b])
        by smtp.gmail.com with ESMTPSA id iw19-20020a170903045300b001d077da4ac4sm21114907plb.212.2024.01.01.21.16.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jan 2024 21:16:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography
 implementations using vector extensions
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231230035112.GC770@quark.localdomain>
Date: Tue, 2 Jan 2024 13:16:54 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ardb@kernel.org,
 conor@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 Andy Chiu <andy.chiu@sifive.com>
Message-Id: <EED7F0DA-5619-411B-82A2-7926155E9B73@sifive.com>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
 <20231222054827.GE52600@quark.localdomain>
 <20231230035112.GC770@quark.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_211702_008690_FD4375D8 
X-CRM114-Status: GOOD (  18.24  )
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

On Dec 30, 2023, at 11:51, Eric Biggers <ebiggers@kernel.org> wrote:
> Hi Jerry,
> On Thu, Dec 21, 2023 at 11:48:27PM -0600, Eric Biggers wrote:
>> Hi Jerry,
>> 
>> On Tue, Dec 05, 2023 at 05:27:49PM +0800, Jerry Shih wrote:
>>> Changelog v2:
>>> - Turn to use simd skcipher interface for AES-CBC/CTR/ECB/XTS and
>>>   Chacha20.
>> 
>> If I understand correctly, the RISC-V kernel-mode vector support now seems to be
>> heading down the path of supporting softirq context, as I had suggested
>> originally.  With patches 1-2 of Andy Chiu's latest patchset
>> "[v7, 00/10] riscv: support kernel-mode Vector"
>> (https://lore.kernel.org/linux-riscv/20231221134318.28105-1-andy.chiu@sifive.com).
>> applied, the kernel has basic support for kernel-mode vector, including in
>> softirq context.
>> 
>> With that being the case, "skcipher" algorithms can just use the RISC-V vector
>> unit unconditionally, given that skcipher only supports task and softirq
>> context.  Therefore, can you consider undoing your change that added fallbacks
>> using the simd helper (crypto/simd.c)?  Thanks!
>> 
> 
> I had a go at incorporating my suggestions into your patchset, and rebasing the
> patchset onto riscv/for-next plus the first two patches of "[v9, 00/10] riscv:
> support kernel-mode Vector".  You can get the result from branch "riscv-crypto"
> of https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git.
> Everything seems to work (tested in QEMU, as usual).
> 
> Please consider using it when you send out v4; thanks!  I can even send it out
> myself, if you want, but I assume you're still "owning" the patchset.
> 
> - Eric

Thank you. I sent the v4 patch.
Link: https://lore.kernel.org/all/20231231152743.6304-1-jerry.shih@sifive.com/

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
