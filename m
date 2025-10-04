Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2534CAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Oct 2025 03:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVDe7w3TvrxZOXgaWjg61BezjhC+7QAtiOerlGbpxug=; b=lalkLP0ziDWLQyAghoJA4lYGon
	MD/IfTAqb8Ke+kX2dt2RNWK4UP1zPD2SG79VquxsyLF8R4mbAIX1kjHD4hx9MO8lz5j7wIsAcM0Vy
	6rK1xSSDQd2ypdj36TwFRiwpB/HVMWOYTEy3qHgKBaTwKFAF9IJOaG5TkrLIhGfVkcREz54dUIeVY
	vU6uP1Km8XSjMieYPRrYVuWZCDUw0+cdTUmWMxR7qfvzNYHEgIOk7I2W81M3kIO9W19KYwiVZ6Xm8
	448+WT3mmhuXjY9KgDHITD7XPrIx2YkCwI17+/rfYt8vhhoWZrqoZw/bWgaiPAnVADWQ9+etTa02l
	1JqvytLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4t7K-0000000DQPj-0F6A;
	Sat, 04 Oct 2025 03:39:30 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4t7H-0000000DQPM-1P9M
	for linux-riscv@lists.infradead.org;
	Sat, 04 Oct 2025 03:39:28 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-637dc2292cfso3286511d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Oct 2025 20:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759549166; x=1760153966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=WiNKjFh7sK9R77H7Gn73SaKYaym2vwwSQ3Ymkpp1eQrmaz+hBx7NKpLoua57k1YEOg
         tS9NrSUUf1NJl+Dx3TV0k8WUm3gvnhKZWuUQvFo1OgCEA3Pq8vAZBJCMuIIrt7z33Ghh
         JIpAx0QD8h8KSR8PbsxEAJlm220LAoOEt2Ul8bnsVdZbfUlIkwlXxgzIP+5QlNzm6nL7
         Pv4twe6af0x+XW/PKCKHiTGhdy2kiQ4Z2kwuiQfBkL0P7qOWWG9MTq/360QkMIKp3f1+
         BpffALZxoUtd8xBXdNhRStVuVHH3LO20/VFB8cTzQGo+XdsrlhwXEzhq2p1st8N+FnXB
         Nntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759549166; x=1760153966;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=bBFvFqGgXspDPxRwluQLiSFRLmTgvS0O5yCMYaVerTRC7MnZEf6aZ2raTg2bCB4YvS
         O6xmxvZf0PtYWNTW72ddHsfi0fCqEOfOd4DxbVGam2x6QxCD07W22fL/1PIb7Kyqqx1V
         lHDFzoUvztQgCRoY9tGL5TWPfvwROBE/NbskKwsLHuRlRIlYP7d5v/EZs941qPV0jM7R
         jgHN1GY3QXwdCRk2BKZiAeak2qrnccCNVI6oavU7JemVh4tVkkFcVJDI5GLcHBjUJK2u
         Glz3DwLnWT4d98dl8i+VUYSR8tdZo/77UFzRd2XBbaS3HZjnOIvwLFQeAzEir8gow4ux
         +GSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPpqf0CJea9W7ybwSihnZc+M7L6qotd1AGJgwb9RMnGFz64h7I25gKAkNo72XEpXXyNLZxS5oaAJfHYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLEA9ZEL5xfHhnlvWVnmwSIgGf+arsRH2NM3T310gqmQxPhy5X
	lPX9YmdhEHa8QpPyCh3yZrbTREM8ufE2evKBKJKdL7NlM6cTVeLU1K3a
X-Gm-Gg: ASbGncv1JQ9LifFk41sNiTKCJINYFzlSxrIM1JyPDVTV58iJ5cfj6v9GqlwPl/kyM2K
	fT9kM3PssgwlKJ6RKrTLox5dIQgOlQ6ttIhWaJppyH18htGf7jWEF8IcFcmCOCIoO9Xo3eJgU3l
	RmCkbfEgjNMw3i1aOd9r6tPz4ttqrSvQat9+1TQ5tjTcF7odAcZgLpe/dsleU2nPZMBrdF7o/OY
	jKv/E7pT186GEhy2H7ojOKYr515QS9NG9jSP04MDL732GoU9Td8nXsWWKFqftpE6SegE7Hi5sv/
	bqdwjNliboJ2aAz/pwR6ZPmnHgAGJWCtFrKXFPpxHlPVi5AfbqE3fKIRsmekAgSvRDBde6dcJI/
	C/0uRf/aZESBJsg9No7kX2AB3s50X4bBXM8D1x0FxZd7pqZbUpLWYCtKcSGD38Ick05tRLOTxUX
	qS
X-Google-Smtp-Source: AGHT+IEKZvWN4IhopDHTsskInMYzN0OVIkAxgqusRW8r17U6C+PiDNXpSR1wTVqdnpL2FZWd78muIg==
X-Received: by 2002:a05:690c:4c0e:b0:749:d874:e66e with SMTP id 00721157ae682-77f945ef5c3mr72382767b3.24.1759549165127;
        Fri, 03 Oct 2025 20:39:25 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b846c9bcdsm2324131d50.31.2025.10.03.20.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 20:39:24 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b5efc638-ab7c-4639-ae7c-c0f8f8b4e765@gmail.com>
Date: Sat, 4 Oct 2025 11:39:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_203927_386091_58845DF1 
X-CRM114-Status: UNSURE (   9.30  )
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

On 9/19/25 1:20 PM, Vivian Wang wrote:
> I think instead of testing libclang version, it would make more sense to
> feature test if bindgen the binary supports these flags, like what we
> already do with $(cc-option,...).
>
> Same for all the other version tests.

This is another direction worth trying, but unfortunately I probably 
won't have time to refactor this patch towards that direction until the 
end of the month. Sorry for that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
