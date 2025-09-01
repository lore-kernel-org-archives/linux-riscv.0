Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE144CA1007
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=076QCawV5s3xXCC15p6blp4mrB+8W8jFtP9nZZc7c9U=; b=j6cXr5gMJEm7hbStNkkAkIDiql
	m06FgNgz6D5LIBcHWvgGls/9IbW+nLcTzDzuc7xjOqQjkWQyqWvktLBBgF3DuDyxmcDRmaWXMOQEA
	w4YDPj64aeW1SkiHNHr9oDdbwUmemlR/QKtk5XK7TZnEUY51FIs9nk9Cla2+j4UMz7f+pQU/KAucz
	yg8vQa9Lf/6WGyWNMdQ/X1jFoY4qIC5ozXoLE4G4T7TCf4g+2y/FiHx0KHJCx0kDfvg8C+SBvz3ng
	mxnrBQnjjuVyz6vuYsMZH9oOk57q9+g9D4A+Q1PRvI7SE0addsYnjN9xBDjfaLRfVfFE8/ISomgDi
	M7v4elTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDmv-0000000EHld-2Exr;
	Mon, 01 Sep 2025 23:18:13 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8C7-0000000DRJG-3Hyf
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 17:19:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e96ee32f86bso3939102276.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756747190; x=1757351990; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MCdLhHwAOZzd1sHfXyw7j9lNMlwcIlkxo40u1/PlOt8=;
        b=DxkaFHx7bcYJYgmWEpL7spmOMKLrEjqkxNjHogQGbW6jn82EKap0MMVu2khfCsj3Mz
         z8lpa0vfEJg4sgJ0XLPxI4pIZCrKLMKwQ9yretAjuqtB06jTXZAiO0Qh0ycbF25uwRKn
         MAnZlANgSwjeTMioWHhw/lkIkulDdkWh9CvmiEWj0jpYTo5vzBq0d7EQmSGUi9yZKi/g
         kil5IXWTg2DBwLMBaxuTG085pAbInzW1bmsFgVpsNBKcjdgCDK3jCkC4Se6f+JWSAz+I
         AHer8AojzIcjb48lFuWI21bAE+6ldMebDIIVvg5GMi1IchrikkRj6H2/Q6TpviI4Z1q6
         kbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756747190; x=1757351990;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCdLhHwAOZzd1sHfXyw7j9lNMlwcIlkxo40u1/PlOt8=;
        b=Xb54sDbeM4vcLcb5NF5H0Bwpy9G9nxpHUyR/RNpIwTdgBwuvK3B7wo0ylfCVlYqlUd
         NX7O4eRB+ZgvD2J3YYemFlKci5xa2bu8CSPUJVJV9h0g3v7Lb8Nvi0p781KBvSCxgg8t
         3cdpCM3Rog0KXmx/qiDBlxh9Aq7xGz7IEtO6YHnbPfbif4SixVqQ/Jki0VUeP2jTpiJC
         0QiUD7HdlsQ/LTEeJpoJNYWwUYBvblm8ov9FnW1UW/CBPkRpweDPOyiucIPWYObOEo0j
         juLo/9bhGqxIuYCgL/M0PYpl38KfrqzxwYV2L5qiXyuWHwkuq55LGaagwirT2HUAtNbK
         S+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa9pZkTPpw1oaMUqTxdtPdZ4khhPPyGrz9hzxkxPugQd3UsjMhKo6z9iCLKf6uOzcde81/w8j/g3d3xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb4Nrc3iZf96RQJAjZnaL6eKJeXy15fCUOnl/kiUG6IL3GCH9p
	MnUKLfYMwWXzrCcQKR3DYbmr258z7ZFr9BOE0ZZkS1Fk6JXdc4Ka/t4M
X-Gm-Gg: ASbGncvKze4eSWckjNbQIQmqLPl/u6yHKS00RsBmW5diSwla3MO3om58vQ7JgMrTHht
	PNDwDhtmAO0OxF4GK0yKSoBS3kc7RrCFeaMf3SdjWu5D6a9C5VLqbW4BXtIWHqEfmee3pdBt2On
	ITYj3wVNJwSyB0ejz3dHvC79OEz2PjwIcu9HhL9ulE/sj0aKkz4FNtiL8apyDKd3JZmHOfUaUJh
	dURgpT3I7T23ELx78H6WK9LfEnsldKSFK62V3TlFcAwB92Gw6n2y6cAeCyIofWgPG9KqxixhOse
	oH9Ebe2Et746nrus3dUNidZXzRpIdrrRbP585EmCwZyS7ZRPNKw2Gv6zSLZL4fBk76UxQVn/xBj
	db3iryAtkGLZD1Ne1D/TfwN4kyBqixkCr3jK9nqqekbOJ6sVP1150
X-Google-Smtp-Source: AGHT+IEZ8EMPkHUraaN8N2Ftj2JKXXwZhHK6AIOPsA7PriSSOqQ557kpQqGWlv3cm91Il3PyctomLQ==
X-Received: by 2002:a05:6902:1204:b0:e96:dc00:300f with SMTP id 3f1490d57ef6-e98a581bf26mr7108819276.30.1756747189693;
        Mon, 01 Sep 2025 10:19:49 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e98ac466a13sm2171372276.14.2025.09.01.10.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 10:19:49 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b1734c45-42ec-46c7-9d4c-2677044aacab@gmail.com>
Date: Tue, 2 Sep 2025 01:19:42 +0800
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
Content-Language: en-US
In-Reply-To: <20250901-lasso-kabob-de32b8fcede8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_101951_842047_FE186089 
X-CRM114-Status: GOOD (  12.42  )
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

> For example, there's a check in the riscv Kconfig menu to see if 
> stack-protector-guard=tls can be used via a cc-option check. If that 
> check passes with gcc as the compiler that option will be passed to 
> the rust side of the build, where llvm might not support it.
If I understand correctly, the `-mstack-protector-guard` option is 
already always filtered out by `bindgen_skip_c_flags` in 
`rust/Makefile`, regardless of architecture. Therefore, we don't need to 
do anything more, right?

> Similarly, turning on an extension like Zacas via a cc-option check 
> could pass for gcc but not be usable when passed to the rust side, 
> causing errors.
That makes sense. I might need to check the version of libclang for each 
extension that passes the cc-option check for GCC to ensure it supports 
them.

> These sorts of things should be prevented via Kconfig, not show up as 
> confusing build errors.
I'm working on a patch, and intend to output an error message in 
`arch/riscv/Makefile` then exit 1 when detecting an incompatible 
gcc+libclang mix in use.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
