Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3821CCA1012
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 22:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpDGVaBqyaF8s4mfBiQZeVtWLngK3QHRhtV77UHWcSk=; b=fSDmk9fav2dYmmL5WRqLltOgB8
	BDwutdRyGBlEaePXvihwHbJ1Cw0FTw/WtK2b3foxMqbOyQ9VBuXYfdQTgHOFYxn+vW3wf4hBb6bJd
	13x2wI11cxRHx7rb4SyY0TJAMd2AHVcRXjBcQGJy4gG/aFLLlM22fBr2Y9pkBSNytWui++jCA2LUS
	DeZRnjCxhoOLm0xEYzxL1HXN3/JTzfg5B+OtNISNPLKWl+sE2kFQdBMhOJ8/EdPoZWyqM/stjosPm
	QRzI2lK2B+J7r63JQEtYvHiWhetJPTyhE7GNGJJQXhcrSS0mAml+b1ADluc38AimWb+jSKfaOgwuo
	NLY933sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwFr-00000007p2n-0DEQ;
	Wed, 03 Sep 2025 22:47:03 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsau-00000007MMj-1X8Z
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 18:52:33 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e9d5e41c670so318014276.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 11:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925551; x=1757530351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R45Z6oHkqk9vLqGO1gKSQohHaDkoJML+nxrSOmhsoQo=;
        b=jtR5QblBaOU6A+0g5YhOYX2T50xicCPV7WFVVCXEgH0Q7XtaHnP9QkG1T0Lyk7DnOh
         xggK7gzl30JdzeM8VZ+vi5xvYCoSdyqz6lTGEu+FMWmg9+xXxIaSKNXbfjvXR4xLezQ5
         F/iu048Z//96FvrMZSxanslKD6A3US+fK0X7QnfbUiNRw3UAnPshlF72ng9YZ1s3fXN3
         wCVjWQlx0vnMzk8g3BO4ovJ+rN28SP2yRBD7WRTYvnMr1mH/Pkgrw8JLiHCkPgYsBMFA
         Oys3Yn2i+UdqKk6dP5Jxk6LikSFa3M+Mb+oGJtDZqT6jP4wQxV6eZWg2lLSL/mRB71C2
         NNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925551; x=1757530351;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R45Z6oHkqk9vLqGO1gKSQohHaDkoJML+nxrSOmhsoQo=;
        b=LUyAYjMybt8NrsI1DJXrufy7ETCks83Be4+ORHUAsYIrm8hmCj6A/QHy3yahRCcSCD
         2jJDihkTLDH9ZrPcfUB/5sDqMkuYBG8lgalb+FVxOXBm4nW33QtWsB6a7k2uyP42/pyH
         IiVx7AS7Eiaq9NYauQVrLuPsJ+juxdkpPCNjWhsDjackYlLtzJI/IVNQcKppn2YQkm1e
         izAzQI0aT9/dyPraGa6kZWJTZlOWTVPBwOTbhC6x4dI+rLCSMj8/0pShdgiA1bnVAw16
         TdyUklwBwcHfsWG5ecfGgXmnlYsu1NcM0hG98tBVCKnnTQ+CKn55HtyLp8aOwEzZ47D+
         wfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhjD8uJp7CX4H1VixK8/F8nyTnF0efS+8/nCuWpClKpfEyh3fM1wDblombdVyJOdWi8ZipkR3UpgeDDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyegQCTfZEA2bFf1Sirc6Cs/0JzKcLwPIlUIhIP3mFPGsLQXzgr
	adHVQHTz8uGVDvbkvo2NEsULi6XsXqtI2Gwo5YxEBy8TSguk3X1vdIvR
X-Gm-Gg: ASbGncueXFNBGd7hGbUp0fZy3t1oQQ8iQ2vHcNgiaTQvKJfBabFti2IwIxtH/XDCVPe
	/r3uHAlXGw+8y3CHdaRov+py+7SG9trgYa0bGt847xMgOFylIyzkmZUkHihSFAG5CbL3zMIZqjX
	/3QHXloHJ6mr5L4HygdGioiRr46NeBCasZnD+MPSWpFh5PL9B9EPVhW9j8FZtpd/GQlkTM/DTVv
	E66Gq6b6B1D8mcum48i6mH2GbpzH5XEeB8K0anv0x3T5VbqgUUbNTH3IuD4s6SpHPPvBuLqz+6D
	NTkLttPcKKjiYl8qBO/YiS2Tm7guzgRI7xxIXk+No/GWquyGXApWDQ5TJedzgLg4Fu6y/XU0CCU
	3q5fLT9LzeIUN5Mszj4ej6jZwDe4R+W3cmsRs/QcACusai538npUFDdOsH4obSGAtmEw3lgP+OQ
	==
X-Google-Smtp-Source: AGHT+IGGJ3lccUdFjxKgtxsg6hLk40u6IHOHPrfODmWKQdLrprwqhBbQ6G7wrrbEZrD2Pm6WCLN69w==
X-Received: by 2002:a25:ba88:0:b0:e93:2d7c:96f2 with SMTP id 3f1490d57ef6-e98a5827ccbmr15628917276.24.1756925550645;
        Wed, 03 Sep 2025 11:52:30 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbe05debbsm1669701276.21.2025.09.03.11.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 11:52:30 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <9de3673c-3b1c-4838-a5fe-e8877a1c3ace@gmail.com>
Date: Thu, 4 Sep 2025 02:52:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V: Re-enable GCC+Rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
 <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250901-lasso-kabob-de32b8fcede8@spud>
 <b1734c45-42ec-46c7-9d4c-2677044aacab@gmail.com>
 <20250901-unseemly-blimp-a74e3c77e780@spud>
Content-Language: en-US
In-Reply-To: <20250901-unseemly-blimp-a74e3c77e780@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115232_410646_8B0CEEFF 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

(I apologize if anyone gets this email twice, the first time I 
mistakenly sent it as HTML and it was rejected by mailing lists)

> Similarly, something like -Wno-unterminated-string-initialization could
> cause a problem if gcc supports it but not libclang.
And the -Wno-unterminated-string-initialization is not supposed to be a 
problem either, today I noticed that in rust/Makefile there is:

    # All warnings are inhibited since GCC builds are very experimental,
    # many GCC warnings are not supported by Clang, they may only appear in
    # some configurations, with new GCC versions, etc.
    bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)

The -w flag inhibits all warnings, even though Clang may not recognize 
it. I was not able to reproduce any errors related to this.

I have a patch ready and will send it later. Please let me know if I'm 
missing something there. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
