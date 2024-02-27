Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E131AC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0QDrZhPfelvC83MmdT0T2UeVRGNlKO6YqXL3pv8BWU=; b=JCk8HoOPO99M+2
	BXcFZYE1p//B6ktz2Xh52kt1ylRhCgFuD3dLpSnN7YkRjHWL9N0URYyn1/M2/2kCJHvVdD/xYZvYl
	wUinYoHzUGPiygyNHyMci0zWXwSFi0/9I8UhGu0f3E2edJNNL/a5pslUWX5IuqmwovxCDZZBWjFcx
	n2/cuhufbLfBYwmafz/vjLJtIsmfSsOMR7gyyMMDjflaeOD33eVkYr9wkHb+z1kPh5YIS7WNryDP5
	G/PG4BuJ6m2Jn7iN34c5ZxHYMoMUPrcuBTc5SYs1oqFKYHILmX486hdsUx1gIbXQ2GC4KEprinpvn
	ygPikK2/Woc06qpV0Ntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuzC-00000004ooK-1rxS;
	Tue, 27 Feb 2024 10:46:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuzA-00000004oni-0tM4
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 10:46:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1dca3951ad9so17761615ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 02:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709030815; x=1709635615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHyReOttpij5I54r5x4WgZ+cIyUHaBfTMin6OfRWlGU=;
        b=eMMEfdKfSehKlCvStAOO9oCJ/loNw1bLIah5A//tbr/mt8BQ9xfraVILFFzF0wyczK
         nLbC9YcKAX4VSc0H4dBleLyJyMZgHK0agUuAcQfqIGIuSPUgF3NJ7DRgFOY94V0tj2jM
         6Mnzbs/59sCsPCBaUM7ZQ3+hcmBu1BXuxjWMSNGgLFLx0UZCSn/RjeGic31fePv0w2yp
         XHu1fy+ssAaEJP4Y0pfgoQi1IE+8LzYAeAisSkcY5ZSmOUUjjl5V8YFFEsYDcUZFcRc8
         6gEd6nMmwkpdLJ3ovHr3W1UDMuhPmBwBJQ1WjHMcKeBKJg6UKtnk0pMuPjM3AOqNffsS
         yOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709030815; x=1709635615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHyReOttpij5I54r5x4WgZ+cIyUHaBfTMin6OfRWlGU=;
        b=reA2F2JgOkGzmZLvCW+KvQWKJJjyhA62SH4WRheDh/aH2FdZwVubuIlvjBB6hjphby
         PM0O2NQt1NW26rmPraJIvjwHWItkX8NCA0FZRG9Ly+OCs0Nn7dVFUfKeW7NdYleuO5Kk
         fqjmyHV7fm7W1sBjKSdrUXWsZCU3M78P6TfHLcUWCG8vFlH2uWxCcbw9C1r61MUZDMXD
         0avSGHbOLlbvlkwhct3HBV7L9sLwLDCIhX1o5dTUKrYeu7hy3jaP4ZcXefhDdgZq/VUg
         NrxX+D2b8zzaVwHFYz32DKmhmJd0BT1El41v6vtKg958Iyu01rad/TAMM9n+L4jk3mzx
         Jfhw==
X-Forwarded-Encrypted: i=1; AJvYcCUKsuKJrLpG3Skyv7cH/Ld4D0g3KofhdyrpDA3+BxmCc2DALZmmja8aOqW9EOj2UTmDFo8yrJknKmNhrFCCAwjGh0RNC2QszxiVBEqfAn4V
X-Gm-Message-State: AOJu0YwgqtrbK+uFIQpV2hGfygdYdypLBC7VaWf1Kj3X3NAZ2VFbnMsj
	P7aW6s2i9HzhxevbPiPzbsxsFew3lVce7JGqnDxBUqMyRmwb+ypzA+HyIeUqg5SdYdTeczMVaOb
	3UnomeRrzZKdfInL35PuE0oBn8sxvypmXBBY=
X-Google-Smtp-Source: AGHT+IHM+6rRS1JfIDKhTWqLKrWosGlB3CKAX90C0/Xd3mVu0FyLDdjQsn5XBbm5H/3r+xFgrsAmb7KF3ofv00QMlG8=
X-Received: by 2002:a17:90a:e018:b0:29a:ce5f:4da1 with SMTP id
 u24-20020a17090ae01800b0029ace5f4da1mr3644307pjy.8.1709030814815; Tue, 27 Feb
 2024 02:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com> <20240227-resolved-deceit-4a59a6af5b71@wendy>
In-Reply-To: <20240227-resolved-deceit-4a59a6af5b71@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 11:46:42 +0100
Message-ID: <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_024656_276285_D3820CC0 
X-CRM114-Status: UNSURE (   8.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTE6MTfigK9BTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IFN1cmUsIEknbGwgdGFrZSBhIGxvb2suCgpU
aGFua3MhCgo+IE5haCwgSSB0aGluayB0aGF0IGlzIHNpbGx5LiBFaXRoZXIgdGhpcyBnb2VzIGlu
IGFzLWlzLCBhbmQgdGhlcmUncwo+IGZpeHVwIGRvbmUgYnkgTGludXMsIG9yIHRoZSB0aGluZyBz
aG91bGQgYmUgY29udmVydGVkIHRvIG1hdGNoIGFybTY0LAo+IGFzc3VtaW5nIHRoYXQgdGhhdCBp
cyBwb3NzaWJsZS4KCkFoLCBzbyB5b3UgYXJlIGdvaW5nIGZvciA2LjkgdG9vPyBJIGNhbiBnaXZl
IHRoZSBzZXJpZXMgYSB0cnkgb24gbXkKc2lkZSBpbiB0aGF0IGNhc2UuIFdoZW4gZG8geW91IHBs
YW4gdG8gYXBwbHkgdGhlbT8KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
