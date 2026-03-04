Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BBBEDEBFF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 02:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UULp7rr0gz3OfbmpSF1Zs/5Iol+RHLbUj8aQ5bfi0zo=; b=f23el8u/pAqUYv
	2Arn/ZvDM3vg8W8d+iZNkEOvhivJg72OmHD8bM831LXzzqhZhRWIRIV60urnZxUydhZyV5gNjUL9K
	MsrthIxt153SZFrfrBR/4LfD9A+UZiWh4y/GPE8MmjypoKsFmh0QTmdiGKWjd7uGSIZARDXQJOojz
	c6WTq4vNKwUFW48Tqy14O6WuF9nuNp1Fe3rgdrOgyXNvRN2y16LjuM238BjybKt9jCrYAKe5TZVxj
	kEIF8w2q7N3+0o3/dr8gUIpzrUT0kACygRT1BDiusz1YXOYGchtkCK1SAf/Yc8lYtAoiwf87k9qQZ
	ACn/63Q1uhWV+PTuRPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcCJ-0000000GJlz-2laL;
	Wed, 04 Mar 2026 02:42:51 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcCG-0000000GJlK-3JPU
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 02:42:51 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d596a5be31so5399298a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 18:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772592167; x=1773196967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=;
        b=eaeyxiulsDtd4WoCEh5xefVAbr/megYAyixzuN6kTXvo/ZEhv5m0/tCypI0Gn37qlf
         3in8BJADLdM29zZ6EO2FWNIr+iuS3yZETZIR1t8BpssmvmMRXozcjJ+gZlsYYxaxCs1q
         IdeFi6ccjFtpYViW10HsZQ/uwDLrgaiLXuqnpiorOJgXCA28TXPDnHmavbcyUU8f+KPj
         y0Pp2gpebU4NYvFK12iXPPJnzrCvZbaFXi+VbceLhmRj4a0DcXfn/JuLGa/g55BbW3Ap
         yTMrxzTRPfpFjiFXhJExtbVkpIGt/8Zvv/bDpv73xoKyKVuYheJYujQnong52NafZAef
         QJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772592167; x=1773196967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=;
        b=fmJDmpWZzwAkFLwL5bdanORfbrjU9qLVS4EqyFn3wBrTcu8OEggyhBkKetovO6Rfcj
         NiPHB3TJc7LHDU+Yej3EKNSeQM14gE41l/ZkuFNRUvG7wU8ekHeH0UBPRjNxSqsaOrou
         EIMSLWGukRgMknjS/3bgK3gIoV4Cz8JniG5XmuIf5SiyPvmamjnDBcCTwh2tyjb07ooN
         anH49YXoEq5AhQY3uKZvwSGzvZl6yAyOFWN1X+qCjTtAXsiybKquhbSlmS9bjlTJ67na
         XPy7TZUoXWe1TBIBUgxVXfRyxLR3wwmfFA1qA6sI8xaS8I0Ei9C93A8iCgYnqgvQ1GuY
         v87A==
X-Forwarded-Encrypted: i=1; AJvYcCW6IFqGIEg6h3rm1On54pwp9MTXd8EEkG0CPbO1NpkGwW0Ckw8cSJJZSFjuqzr3pEDA00YMjkz2iM2zOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzY/CuyuXv7V1a01PAOp3nUOBqxW+CVk0294pPvyIMZi6OACCBu
	L146fQbgGbrADbWk0SfYpOZhs2WW62g1SIHnQhFzemQ6APcxW05EjodYiQsZ3ZbBrG4=
X-Gm-Gg: ATEYQzxZGB1f/1WMQ7oiiSrbCMrFg1rmzXixFIQregOryM8mw9YLByMg5BpVZChx2/A
	AUKs0pSAuyTRLYQCibv0JGOXwZrxvaUhUfk73cXL7q41oOTqrdsc04LlrIfrEZfQLo99wY26iRZ
	J6gX9lTYKQAKIaMMxmutGKiwrRDsG5aqePQUkpXUNvu5Sslx0alV5MZz0LXWQHIcBytfJKpI3M8
	AcUFNP9jKWb0M8eaDh73Ul7KH3OZFSxJWjH8f0hzRKDDBSguuEEb1GVwEZKKDN9+nKNK752nn4l
	4+miGnUL/QgIPISBPETq/3dSNbbkAXy2n7Kj48dmFKzAcxe3gkAGgZMyhyIWRsk7houeB2+6DnI
	/ilwMFJA0YHLg9/Tl2oS/QUevJhz8l7dLxjvrQg1YKmuMNxmg4/kxhOObcn5099lZsoAFvQo+cE
	DXmVNZZpbevl/bO+uURnGBPvLNVjRQQsuYFb1NgNF1AWpdiF/bkI9DR7CEV+s+K6f3Q1FPa0Okm
	kA1vePnuQ==
X-Received: by 2002:a05:6820:4a8e:b0:66a:1886:e4bf with SMTP id 006d021491bc7-67b17703546mr346906eaf.22.1772592166871;
        Tue, 03 Mar 2026 18:42:46 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm12574800eaf.7.2026.03.03.18.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 18:42:45 -0800 (PST)
Message-ID: <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Date: Tue, 3 Mar 2026 19:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
To: Jakub Kicinski <kuba@kernel.org>, Yury Norov <ynorov@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Carlos Maiolino <cem@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Eric Dumazet
 <edumazet@google.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, Linus Walleij <linusw@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>,
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Christopherson <seanjc@google.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Zheng Gu <cengku@gmail.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dm-devel@lists.linux.dev, netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-crypto@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, v9fs@lists.linux.dev,
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260303182845.250bb2de@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_184249_093786_64EA8F9A 
X-CRM114-Status: GOOD (  16.10  )
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

On 3/3/26 7:28 PM, Jakub Kicinski wrote:
> On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
>> The net/9p networking driver has a handy macro to calculate the
>> amount of bytes from a given pointer to the end of page. Move it
>> to core/mm, and apply tree-wide. No functional changes intended.
>>
>> This series was originally introduced as a single patch #07/12 in:
>>
>> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
>>
>> Split it for better granularity and submit separately.
> 
> I don't get what the motivation is here. Another helper developers
> and readers of the code will need to know about just to replace 
> obvious and easy to comprehend math.

I fully agree, I had the same thought reading this.

-- 
Jens Axboe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
