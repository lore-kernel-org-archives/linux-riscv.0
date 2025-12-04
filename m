Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF71D1F9D4
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6NCyF89lpMvkRVhHFslUMtrqRMvmyR6jhR7tE3Tpzk=; b=BBQ/bJ13vEL8vGY0dUEflHIHsr
	WRvLI5i18uuqcK7zpUsGq5/zLGUgYAmF/t3G7XlJ4NzcI1C/Yiz120kHMazFF24oQlwJuezDpT2Yv
	J+kc6BZZMuy7zPqplwWnic4eI25xxdfrAPPXuDMuORAI3NInYpPHCFsgQWkq8j3tHrV4D4USIU5+5
	5Habf67AD0zwQddvf2y1UMvxmcAbrX1redYPQ5BG1/cg6gR6FPtTISOw91RlmK/SRrGbUBFlL1o13
	aFo3HajnYCnqvzWkyQkNRLMuu2BbiSaHaFBqgwx4+IiHdyYN5Ytl+4MWmG3z+53b1Tv4GwZpvj8s7
	FhAQ4Dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8eB-0000000807a-2ru2;
	Thu, 04 Dec 2025 12:41:23 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8e9-0000000807H-2XE1
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 12:41:22 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-640d8b78608so699221d50.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764852080; x=1765456880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=FMPI6PWUO0qhNyolHuEfdgaiwtUYNAkrvbQvLgQz6EwbzS5E1TlRZO7o105Z/XXJNn
         FodYnAQO5EcsZhyOQJOVVHThA4eFr8fk+fqmTcmTJfDGwzvNGxQJI2EVX4UPTbVWT5Ir
         0hfoRBgrdeCJT33oYrDvoOT1dJE9lUtLV9azBjYCWO3PWUgM6b8tUFeKU1j2Q42p7bRT
         ELyUsnNEF8zNDiabXJDOC6lVYgDyNHd61NykvMNf4jYjD3uNi3rHLb1pvkE0ckPePeOI
         Sbc1mc70Urd9gXJNJbHW4M+7VqjhLVE/aNcJ6GFMrSwOBAYws9OpG7xX7Hsnv1NTUTdI
         e+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764852080; x=1765456880;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=M7SQWQrZJXXLgB3P0rMs46OLHEuTKlqAH9YlJDIsijjwjFekdiT3rGIcDhliLS180t
         qUiyX1TGBKB5Ar1kf51lCqBZkOqLnEhqgRvarQhiRL8XHcDUzhb4M8EJRLvNlYJwZimn
         IOCUy4CgDDZOd17h7C2yvVo0DMCdROHU5ptRV6+LlBsbr2j9wBFZdUTIFQ212yVM337B
         kaCDlfq9C4dFFd+wKVj+0L5ILyIRRU0xBWc2OUL4kDKqtXHhwx7wYAbYdzzEnpNIiauj
         zrvWdqJxKtbHmf2nfr4XQpRpQRjE8bxqTcNFvyZTPJTy1Rd/VBwftEi5b2AVcofp/Z/U
         W/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWEP/Mo/CzUHyw2UdOgFkCX1C9u3sRw/BL30OKa30zQgZbSVSYg+5N973TAN3Q/LLgb3pHad/VcosNstw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw640Ab7rRFGACD9Ga3TrKHz+cMgI2z0dEQseetjpwcaGsL6Ezr
	1Jf18N+PiT287jezlEBEAPUa1kje46y9WLNGP/fFpw0xDVcbpbZ7B36c
X-Gm-Gg: ASbGncu9iotcdjNGTcJXzbavNdo0inqdZSdRWUAGxqFykMj5lQIOGixKRqom8N5mSiw
	JmI/DvGzfS0yuk8kxf7u3cMGPvGuw3GLdu+hy7mSKUBtbBuOlrq2l/AnEO3w28jQNwxunLpcu69
	ArZ0JD0ihpXsP9ErNfyu/jCRIOdeVdpQdJbnmzDsxiTtT6SuZ/A9m6cSUN7ybEJW+wSpGP/uUCF
	grn5gnFLHU/0CYnaGwzYrjlMcEiMxjsra0iToqlZ+XpQ0y4w2+poUr/L73Kd+8A9jVCpFOwWVSa
	SAcSbcLqkLis/b1ml52IMzSBHNR9J86QKvC2tW+la5DBMmt7Xk/oJmL9S1tZW3Kyqj3Mp9wq5Dh
	TZGlR0YKTea7GAWFdp7RF+fEV2TY8RO+6ckfI28pzBNZeLhB5KcnpAdwCp33lMlzgXxxPem2BYO
	Jd2OAieEQBwTquCOQSUQB2pTIyZZ1Nw99Ap+TjMQK/
X-Google-Smtp-Source: AGHT+IHJA60ZYQi9bh/oeg3T2d4XWf4TlPAq2CBo9e/gVJnloBN9DiCKQRpeQyWtcS1RPasu2wKg9g==
X-Received: by 2002:a05:690e:11c4:b0:640:caa5:57bd with SMTP id 956f58d0204a3-64436fe7dc6mr4661174d50.37.1764852080011;
        Thu, 04 Dec 2025 04:41:20 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b78e892sm4782487b3.44.2025.12.04.04.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:41:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <0c63bb4a-6aa0-412e-aad3-7ca3ecb1361f@gmail.com>
Date: Thu, 4 Dec 2025 20:41:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_044121_650118_8DB92C91 
X-CRM114-Status: UNSURE (   4.39  )
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

I noticed that RISC-V CI bjorn/dtb-warn-rv64 [^1] is failing somehow due 
to the error here. I'll look into it tomorrow.

[^1]: 
https://patchwork.kernel.org/project/linux-riscv/patch/20251204-gcc-rust-v5-v5-4-2d4f20d86c24@gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
