Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6111CC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZ1kbZkJcDCNoHyQBCozxLZDv+rmoEZhNWd1gPFYGeA=; b=kOuHng30Jow/PC
	oauyKnnyacpvCYnzexOKxBrE9KBmUH4Y4c657eOnQy0qAEiT2f3GSJxwdvEbhk12FtMNN/jsKs4Z8
	+Zz7dxBQ8kHKZX1C1P2i5g3mkINd5vWoxvvQdSgRtHxf7pY5/xOICJ/ICrnQuAnEqCk53mGv0Mk8U
	eF5K0rFlIxd5hwOMt8MM/gKDC5GPoT3c9VD0hEatSWbJnx2AERS0d/Efi4lHkegpP+ylkRHGoLrur
	LpYPxGze+ws0cKMJcFDH2zJUbhirjCGK1Apj+4kV+fDBaRcgYEhDhs3tqdEHpDphzEsZakxQ5BWPS
	qevVGdrAxOZefRaIuYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRb69-000000088rs-2yGh;
	Tue, 17 Jun 2025 18:31:53 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRb3w-000000088i1-0Xca
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 18:29:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-acb5ec407b1so999716466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750184974; x=1750789774; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=X7nGyC9Nx6AzfitFole3W+wlxF/7QRps8kfBXZXt2DgV73FPWd9gICN/7BjL2a0KeB
         YzINjF/xoZvLZ/71RvR1I4LD0Qa94/H0ZcGnqhx0qbsUC3rGo84DFW6YtIS7HfFNYSKR
         udyaxWFJ/vdH+W7pL9OCnzGowCpTkZe2yqx54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750184974; x=1750789774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=Dr60TQ+JYsCf8drHhS9MVDKsnk5fu1ErnRL5tgruRoP6OCQam/jnJ7cQjdI3beKn9h
         gdrIzv6a6rIEh+cJqStDsBkyedkNHgw51abLeZjBfjEM0ZUieAVGgGlRg4eCdk3yynx7
         SwMjrRfHK9bvG/SKzbvFlqZsPQU9TXlcvV5T3QXfeZ/9/A0ZjS5PYKPu7LpoPBdMtNw2
         JmFl1LWK6mpBNntKSo65hw+Sn2K9SlTykMGC8q7vu7BhhVo4sIUrQbZbsOFJp4qEwDqO
         4ALc+skv6cZs0AFROcN1tC/VDBDZ9VnptJ2O8De0hfdVvV9xCdgJOxArz8Y/LDdrFnX5
         Kzkg==
X-Forwarded-Encrypted: i=1; AJvYcCUQlL/a9TGGxzl4FIE/ICMioVB9O35SSUEvWbvd4iX0vc2bgrMfIPg5M/toLmj3zM9ZCkHZFUTC6u72lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYfrSLKx9W7gzH5Y2aR+hwjgfQ/QGUowm5MOv38nO4zTYVmAXZ
	AiyfR532HSejdLFpN4rl6HyzoF6mMY8Nst9Zpv6v0f4hLzx/aKE8fsfeeY8RSnzGLIbDbzAyK3g
	wX3Yv/90=
X-Gm-Gg: ASbGnctPuxoTrQEFd3YOibTKLqWojkw1qXaq6fsnleK3Zh40wbt+ULjSyxsbgK7boGN
	u2Fc5B6qUMf5CUMbq0J8unkEx4D3RUG/DO0BwkZ4I1Di7SV+nRp/E/VoCS4g5Owz3grBXvk93nV
	eVBtbYoqehVfDojcpVgg5R5HzbaK46f251g8FluQotEZR+ssqZKW0T9YYvoRAlRnZ0JahyZ+w6j
	OG7KGlusqfHBfP3N62SjIpQChXmXc4O9//qLoWw04BiVh6bvLMQbmmXRQnUKmgYrKwt9jLnZMcl
	/JZTgsBQGPzT1pBnwJ64ktxeWqHxgIsecKF3Y9m8Qja3ZuM/XB3VwBchkrSwRVdaeFbfqZt7MyU
	GdaYLGJGJY7K6o7nJb+2/cqYW9lqrs+xtHuIo
X-Google-Smtp-Source: AGHT+IHxXdBetCbV3vsj25goZWtSKdAOle2TRAVreBSMzoXf8Sa1UwryMGFNdJhvI6g5QKoF0i+DqQ==
X-Received: by 2002:a17:906:6a23:b0:ade:438b:b433 with SMTP id a640c23a62f3a-adfad326be0mr1526241266b.18.1750184973968;
        Tue, 17 Jun 2025 11:29:33 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81b8e38sm916569166b.50.2025.06.17.11.29.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso11158455a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXADQsqCoYB5bueuDMpU1m4EpZAR3Id76W9QHm3DoqEt2l6zyJDf8YLbrI3S9i+kNTREFcYYBFZH9SENw==@lists.infradead.org
X-Received: by 2002:a05:6402:40ce:b0:5ff:f72e:f494 with SMTP id
 4fb4d7f45d1cf-608d099f37bmr12876236a12.31.1750184971733; Tue, 17 Jun 2025
 11:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
In-Reply-To: <20250617060523.GH8289@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 11:29:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
X-Gm-Features: AX0GCFsDpDEWkWJGZUHtM58JGRAX5cSPaq4yB3fqNYhO8hMv3GVq-qz3C44LzlI
Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_112936_303818_7A9B88FE 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, 16 Jun 2025 at 23:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> An additional note on testing: [..]

Talking about testing - when adding test scripts, can you do it as a
separate thing entirely - either before or after?

As it is, this code movement is hard to judge just because the stats
are all messed up with new tests:

 77 files changed, 4012 insertions(+), 1756 deletions(-)

that's 2k+ new lines of code that pretty much entirely hides the
question of "did this code movement result in a simpler / same / more
complex end result".

So in general, I'd really prefer big re-organizations to be *separate*
from new code changes.

It's just a pain to review renaming when it's mixed up with other
changes - whether renaming variables or whole files.

And that's as true on an individual commit level (we try to avoid
renaming things *and* making other changes in one go) as it is on a
pull request level.

If I see a pull request that only adds new tests, it's a no-brainer.

If I see a pull request that only re-organizes the code and the
diffstat just just renames with some small updates for new locations,
it's a no-brainer.

If I see a pull request that does both, it's a pain in the arse,
because then I need to start to look into individual commits and go
"which does what".

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
