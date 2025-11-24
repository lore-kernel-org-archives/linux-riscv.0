Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFC1CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 02:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbkH+wwWxP/pqV+xAGf8T4ZAj8mDcK6Mf9uvBQNXkyg=; b=t1DuUBdIon/1lD3vNsouhixAYo
	LLQg0ZKCZoHBnll7wZRrXOocmuuCJLkyFTwDXt4SI/R9h5mBmIuxlkKoGlzGK3O7MsNtA45ID1WHs
	Pody7LZMTpkrgM2tyTm+erU043jTFZRVPks1/rvAveN59vYg/wgFU3SYwLpJsxy9iG4Dfwkst3E1+
	G8TKhb7OiuFEfJpadEs4lEytCI9uOx3P1SI98Ckqm6uYHXs0cEvsvKxF+mThII/xyjviOxVVFrFWV
	qOLddRbddbNQ+J92OHwhixIFYsK5ccnraxfoApqIg+6tQYfGZIzAoUyGclcozEBOPFjgU0zi9RLK2
	0vjMst9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLxa-0000000Axu1-2ZqR;
	Mon, 24 Nov 2025 02:05:46 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLxY-0000000Axtb-0Qci
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 02:05:45 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso3205048a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 18:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763949943; x=1764554743; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3iOSMJ9zcmFH6xEZljPRpWDFCLxx5tCFMpn0x0652k=;
        b=fkMbTPcDhuDCKb9sv24aCu7QYX6PC0Ow8W+YWUSycopnzuRSelv10qKmfHINueG4ld
         6N/p9BxrNrXhQ+VgxckF06kfc3WBg3rDCqFYusiF2t0XssRwXHAUWBA93acU6yA8EErE
         g5rMdSe9JHL4GqG2eVCZwdR5uKA1kiEjdX5V+aCfIoNVGNcuzBT3D5/oyywB0gIqjQn0
         0CJhHWgZICPjO8fYRwv0blPx0hlqq/Klj7l3hQuFGhfJC2w5JKKBsH8PCJjEM4LOIAkd
         yflpDH+uapMYqXrAorN+TyfFF5Y7x5MUQNcFIuR0QGftxTkHjkiLCB4jXarG/ZsAIynD
         ykOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763949943; x=1764554743;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3iOSMJ9zcmFH6xEZljPRpWDFCLxx5tCFMpn0x0652k=;
        b=wPkC7IYpXHZmAvjKm6XxjRijt9OLlJCwJE1t7yb4g3cYAMoN4KcbRmWQi6h04MbW4a
         hLGr0TLqnPYu1isVceMrnJLFa0hBokOEmEBQT5i22ZViCG3XY1enYYI+gQDFc0LZqPFJ
         a/gk8sTbozrGbD5KQLFezxmIkhDTNlEJR9N22SojzPrM1sOULqdNXYr/i5lKAkrCJIhQ
         s2crTtvdtavzj2uMkknB9GgsLu3s/JuwC/SA6xnUMY6x7Gq1Q+ewcJiXLhLWmnIGEy6i
         BiYMSEW9jd+oOgeK+a2V+8kEMMj4ZcMKLIkAoiJewiGxJKA7AxpyuwNHyQIewRInz9mp
         yPYg==
X-Forwarded-Encrypted: i=1; AJvYcCVSw9YGOq6q2a+ITHy9AeGEyR95W1rhys9iYLBsVaij8yTFyT92gZVjj44yPUjpAN7Gfz2CV8xkPYbuWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh9qZy29jGdxeNe5K2+hVAwzKYc8IQtRHrXbHDIyxdwBZ23Hcy
	CSTZfZR6/opUTE8ZkKUNVVossLhIIMSSXZxobgGlJHmwXo78KSjt3Eju
X-Gm-Gg: ASbGnct99zCZK00+ID4PSCCSF3YJEtbJw+IyXCWyTOEJtUTD8V329WGb/6fTFtFoK7T
	uHR7P/FqCVyonEhEL+gXVY9+p5+f4zIIQgqZ38nXSZtePPJeyuKCx4RfZgWgotHvcHpWuGZNG9u
	w18129QQaVL2s9YdMeFN5zdDsOx4aGFF26YRBqUx/EI9uB0VTEBrxdsR7ZW4R6SR3Gtr09VOX0Q
	QXDud6T5MtruIRveUBXmi40xn4eNbS3YxPao6OT05nk2oKGztK3YsmPgccFDcueVfkazxgKXkXR
	mfSDKmZDg9aPtxbWaHeBa7E6IWEejSki6GiBfXOLcUI6TphP/A2Ez3Tr5yF70s0cbLGO2k6PZUI
	QmSVXpDFhwvVKJXx9JgP8THgwxxBP2NiXOZ6zXtKMxTz4Oyd4C0XRynhEl0bGeQqOFjicE+2oyJ
	m/jnl6vfkjaGjlXtmqkrsv6A==
X-Google-Smtp-Source: AGHT+IFKY3YdfCmC7U4vR5iWTGdpuOG0/GJ3f4HCetsCRvAfTLhehlcgrAWCqygjrtjCVf7VO3tB4Q==
X-Received: by 2002:a05:7301:e22:b0:2a4:3594:d534 with SMTP id 5a478bee46e88-2a7195369f7mr6681434eec.1.1763949942657;
        Sun, 23 Nov 2025 18:05:42 -0800 (PST)
Received: from [192.168.1.209] ([65.87.8.213])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm67099107eec.2.2025.11.23.18.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:05:42 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
Date: Mon, 24 Nov 2025 10:05:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
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
 <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
 <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_180544_152394_55B3BD88 
X-CRM114-Status: GOOD (  12.06  )
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

On 11/24/25 9:21 AM, Miguel Ojeda wrote:
>> Add `rust-bindgen-option` conditions for the availability of libclang to
>> the RISC-V extension Kconfig symbols that depend on the `cc-option`
>> function.
> This is now in a different commit, right?
Sorry, I may not have made it clear. I mean all these changes.

+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=...)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=...)


> (By the way, I wouldn't mind if we started adding `MAINTAINERS`
> entries on who is maintaining particular architectures for Rust,
> especially if there is someone in particular involved with it etc.).
I had some contributions in rust-lang/rust repo for riscv64 (PR #131955, 
FWIW), and I'd like to be added as a Rust + RISC-V Linux maintainer if 
that's okay for you guys.

For the suggestions about commit messages, I will improve them in the 
next revision.

Thanks for your reviews!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
