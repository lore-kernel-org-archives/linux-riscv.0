Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950DBCAC583
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 04:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYv/o+Wwy/wQcDj+wfKjVDuiavjNmrpr21HrTICM/rg=; b=oT4JY5ku5kYyqfV84zexpEbt7V
	/YXihUXSaxuZK4m/7TRkL5hXHVOBzAFb9i0RRUI69owT354f/g9SwLBKCySfc3fvj+C0czDdOvR5F
	FslFy9d35Z1xqOjVnstjlDWXVuug17v2NHnZZ1N3SlULelQGoGXjaE8h51hvvn3iuv3W/Xw6M4UPq
	+EcE6Y2eaY8DC/MDBge6O/YWKfC8TW6+AuNG2l7iUUTFzUcbyhX4VVSGt+daM5dq8izQRdoKzNmkc
	VvPpOjvoy+MuaxxRXhzCz/zDOK93lPtTDhvpN+oUkg5msTmvfxXxYbHV6e4JVDz+4+f4vLu1nMA14
	Fz+3R63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZCI-00000000rcg-3dzC;
	Thu, 11 Sep 2025 04:46:14 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZCG-00000000rbp-2zRH
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 04:46:13 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-71d605c6501so2231627b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 21:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757565971; x=1758170771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1OFQORNmMyhF8NqnLlI7wxOYnlK/yXDebbJxZdkpHcc=;
        b=RYgvajBqAzoSSAaPI5WjCT5CFHlUyMj532y10cEiRghqsGQq/hJ7nYvaY3CLTVu2JR
         kS9iWv9tinQ9MJHMzaISrelmgjdSiuVsSHI1nU5kSJ2rXEl5ZW9swhk6Didy8prkbm7b
         s0B/9kEW23aUuIFRN4VCaVdNVF+KZbruzwjiAom/2HaXlNP09gBxr3W1IMtdRpsD0TnE
         JJI6jTQe0rQ9ZYu2RpcvEXfjMVkuQT23GqF1RFrk42DG76wvto2uEUeEQF3hFYttaVbm
         u4qgwaCd3f8FaYTc3id+fjZUe9BZNj5CPDqeRtjDdis0DKzrdDY1gd5MGTyOaR9ZSNUg
         atdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565971; x=1758170771;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OFQORNmMyhF8NqnLlI7wxOYnlK/yXDebbJxZdkpHcc=;
        b=fNXuDSOg/7Do+/PZGgPxBA0EZuO3GgZM8vyMKk5XiGwqF4db8/A/wIKW61xY1GedM1
         PItqtTF6FvCFl90qTsikIXJAL7P9CIH0ZIARpG4gUrBk3bgJ7RQ9t0mGH9gE6FNIE0aB
         WIdf2k49DPsqfU4l6x5q0jZkXN+FiX02hAEWZPLdETZf/BBkUC1lGc19Q1KBCkApbvsq
         IDh0MLtQmd0zo9WzkyoDXu79N8z/De+6LaShWoIysNnasnsI8g4Kx5HVBuLhsT7SF4d1
         vBkRimQ3OJj+b6HPP/7e9+J0U/r8LrrDRbJqyiz4YTyaKdUz0qmrB97JPb2HYqeeit+Q
         +LqA==
X-Forwarded-Encrypted: i=1; AJvYcCXCmaQ0IpU6YLthC9dgXE1vX7t65BhHHfHCU9kp81/wRVxCIwJqeu6wEEmbRiokWHkmmSqoqGKbiZee6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxxh3M8/ptmdsAjFdx1g9cobR2nrY4id1QpFCxn1PPH2fxcz4m
	HzSb2Wd8VOTm96z4f6fQyGGgsa08M4ry2bN88+qlxXTewqOZIVDDovJW
X-Gm-Gg: ASbGnctcWQ6Agk/YTLY1tOCFpQL9+ior5jbVPI6FKUH7W/HDRFU+WqcScYKvzhtAlTv
	PFoTRB4wuGpei5dytktpivvl0Vy7IcBD0yeHcxJmRLvjWWMKes1fXCsH3NnXpL9+Jqd5YwImLu9
	Z7f1THvkW+p/fa2tigDerdGA33ikJQqrw8AtKj45me3hWv9RymOoXlh4vUxVt37wuiwc/mfkKbA
	Wc957QDBOGjXPktP6z9sAO67P8eMWeO/hlUzre8u3BH54sOlCS6GYyEGA4zegoZwTiBlbzWcV2F
	yCAb9d9mSlOisV3humTHmC/HCJGa1YGnDEGY30HeNwzeZnReGe3twkcwC8DyUgxRy1zf6FkohwO
	CNT5iev5PIGW1aK/9+O0ds75KrWk4IfrdVHMLRJ8rQ4fea6nIs0l0sNjwn8hH5TYKFbTWtUyngg
	==
X-Google-Smtp-Source: AGHT+IE09XmvpU67NiXH7rk2LbrDMhUi3e2OWnnlWTn7trnF2NMGewy0hktXoxQgahi3Y4iKLHRnRg==
X-Received: by 2002:a05:690c:6309:b0:722:7a7f:5358 with SMTP id 00721157ae682-727f28e7503mr153782967b3.4.1757565970388;
        Wed, 10 Sep 2025 21:46:10 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76c28400sm1130767b3.30.2025.09.10.21.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 21:46:09 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <6bceca9d-44cd-4373-a456-7c2129b418e3@gmail.com>
Date: Thu, 11 Sep 2025 12:46:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <20250910-harmless-bamboo-ebc94758fdad@spud>
Content-Language: en-US
In-Reply-To: <20250910-harmless-bamboo-ebc94758fdad@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_214612_783602_E318155F 
X-CRM114-Status: GOOD (  13.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/10/25 10:27 PM, Conor Dooley wrote:
> FWIW, this --- breaks git, and anything after this line (including your
> signoff) is lost when the patch is applied.

I used b4 command to prepare and send the cover letter and patch for v2, 
not sure what happened.

I see that other people's patches have a [PATCH 0/n] email as a start 
that describes their patch series, this is called a cover-letter in b4 
and git-send-email right?

> The riscv patchwork CI stuff is really unhappy with this change:
> init/Kconfig:87: syntax error
> init/Kconfig:87: invalid statement
> init/Kconfig:88: invalid statement
> init/Kconfig:89:warning: ignoring unsupported character '`'
> init/Kconfig:89:warning: ignoring unsupported character '`'
> init/Kconfig:89:warning: ignoring unsupported character '.'
> init/Kconfig:89: unknown statement "This"
>
> Is this bogus, or can rustc-bindgen-libclang-version return nothing
> under some conditions where rust is not available?
> Should this have 2 default lines like some other options in the file?

This is because rustc-bindgen-libclang-version can't find the bindgen 
and returns nothing. Sorry I forgot to mention this, it's another reason 
why I wanted to separate the script, in a separate script we can easily 
fallback to return 0 when an error is encountered.

Adding a second line `default 0` doesn't work, I'll try to fix it. BTW, 
when I fix it, if the diff isn't too large, do I need to open a v3 
patch, or simply replying to the thread just fine?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
