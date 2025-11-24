Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC0CFD2F6
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgJVpj0/snnPbwxr0UrjY0eGLrSTgkGWpuw0sunw9eY=; b=zP4RAQ5G1tV3SuWAjPRpEIMc0y
	2osnej8s++GBSnd30m0TOmjOQ4Ukczip7xEIZCZvzSMSXMOUzllfcx/fCT6ki1n8v3zEaR4qbZPUB
	Lo6qIJyxvUo90TNt6WsiooBi9SnedDDKgYsTTt8k8X5t6daXZlrPg84pMNvORvshk//5hP+RYciSa
	YKQQieedBpJVxcY3lT3CekTAjr05HJ+wRbDGqN0+F81Ez19jj3QZ8qeOi7nDJ11/OZfigulhFF4uP
	+93V1/6wm526sR55sZ/atjqywXRbZ5hJeiibmO24F7SBn6/EzFNL5TpG2FEr1JuRBkEWAMOTpO5yQ
	mDpX3sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMWw-0000000AzPp-0Ztj;
	Mon, 24 Nov 2025 02:42:18 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMWt-0000000AzPT-2WJZ
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 02:42:16 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so2490472a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 18:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763952134; x=1764556934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=M0DoPheHHLd2TDEYrml10W1Xs7Ruc0qqSm1JgjAlfh1pDDeAkFlP81ZL2KqFQsrvXO
         lLqs64SaYyzT/RhKzRdswTZQc1jjfm6feS4Mm/a+zN/FlUOXmCKdN2zG/r35SRx5aVCn
         sAj6Ay3z7KLYR/WPJXlplXggdg+Fxl7wbVzijSHuQmntZ/XzN3bttSd+IBvx1Ieg26xO
         jv9SCfZ6jqhm0flxtNYO8jfZ6E3sgfIREb9h66YYJNiWVAvQuqS+CAtaxrM/2XqV5APP
         s+GNE/ItWr3EZr1+gKRn0o7LwTmlaAOjZgL8pCQKFmxuT58c9XbghFj7GB3ci17GHoHs
         kefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763952134; x=1764556934;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=jKbUnqKFy4KJ3gu9tFD1gedPSjf1ufBZktC6magK1R6rzi9/tDf+Da5E0Yh8SMfZ+/
         pCARo3Kc4BMqhZ2F7/XZkji/9e8cIFeDlS09uUzD4P0Suj/U7QRKQBpHWaDxtZvzV6Py
         bX8Wcpc+zGd+9HdxXDBKRt7CPnweJeiOiV+V6XzfII40eCT3gsKEZnzo7twUJu7gkU1b
         hQhuL9V+t0gQKGeszntBdg/bv86j7GxdsOxDlU/qM9SePHNtVNSHAKVYEysShqwOYHqh
         BfXApMKmSfDe+xjDHGeNhCWTO7CViJbpTIIHFv+Lf8+jCKWP4PRN+vLUZfjljed3RvB1
         lS4A==
X-Forwarded-Encrypted: i=1; AJvYcCXq38FnIlFT5kvwSi9dHMQS19ehX3fArsO/y3+IA/9s4qrq4i8cI4ARVOxK78Ao8aMkIXr2zpmfPGSKkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUNL11afkd0ZXMoB4YZBgcGphFpDj87M6SqFf2rB150ilLpYVi
	0BXSyNcjzUXEE/RQVQq4VtW/vppMZFXAvHzopKHCXBlBY2DN+7jMHA4h
X-Gm-Gg: ASbGncsdLK5oD78e8BqNfYTfWIe1kolCKJpPA8LqqaI8hLPdZrz1LgPKOx+vaE2fY4s
	w0joqDtcOrdcukbvE+EVoqzARh+Poj1uf5iU9SjyXB6AcZlw+QX8QWIo99jUz4TKM2Ee1z+CMB9
	szvUodWAwzJ9ccdKOzQ6WiNJ9j6lJf8THKLxvD46TQ/Nm6ZxYxmqUdfFQdBzcdH42yDMRl3CsRA
	HtJ9RTLvwN13AboH+zzhGBy2jqfypzVCoSpG15WU29GU02DHWSoAfFKBj1jT9dy9Fqf4TObP6F0
	3Qhh/Mzv5YJ95cP5vSglMEoE7Akh+k/HEyQz21UeoPrHpRMEUmYkkUaOhX7RxgY0s3pQEsqf9dI
	wucAyNm6+LfdlUFWY5pGMEfP7j+aURpeF8ZGg5ohZkcQI2CFJ58SOx5JQNcWYuDPRgCwnhUxoSx
	9p1kH9FKPL1GtcdufwZ8Nwkw==
X-Google-Smtp-Source: AGHT+IG1OvJ94QxB/0B5dUPh/eDPLHHoAzRcr/MIUUe+KPUWPK22zAbeB/idFdwPhcR+hgsYZWBgug==
X-Received: by 2002:a05:7022:f50e:b0:11b:38c:5370 with SMTP id a92af1059eb24-11c9d712e3dmr5385199c88.20.1763952133924;
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
Received: from [192.168.1.209] ([65.87.8.213])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm67907613c88.7.2025.11.23.18.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
Date: Mon, 24 Nov 2025 10:42:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
 <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_184215_675448_292F0816 
X-CRM114-Status: GOOD (  12.59  )
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

On 11/24/25 9:48 AM, Miguel Ojeda wrote:
> More importantly, should we just have a separate function for backend
> flags? That would be easier and would avoid having to use the
> environment variable, if I understand the commit message here
> correctly. And, anyway, it is actually the only function we need so
> far.

You are right, separated might be better.

Another reason is, in `scripts/Makefile.compiler`, there is a set of 
functions with the same name provided for use by Makefile. Since we 
currently do not need to check for bindgen options in Makefile, I didn't 
add function for bindgen there. If we add it in the future, the 
`bindgen-option` function in `Kconfig.include` will correspond to the 
`bindgen-option-yn` function in `Makefile.compiler`, and 
`bindgen-option` function in `Makefile.compiler` will return the 
selected option instead of yn.

If we don't separate them now, for consistency, in `Makefile.compiler`, 
`$(call bindgen-option,-- --some-flag-a,-- --some-flag-b)` will return 
an option prefixed with --, which makes it difficult to use.

I will separate them into two functions in the next revision, 
`bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`? 
Which one do you prefer?).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
