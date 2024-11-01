Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2320E6F064
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlE6OyQ/eJP+ii+TZAL9ygqU4Kor5QmBYIGpc8jepQ8=; b=FqD4bVs6EIbgLd
	UT+TVoVMghIQnAopZNdUq4Fxlkyj4VFnXKVasPkgYUCfYBLj1TCh/MZN/elJ8hM1y8TKqPOkja5Cn
	Nb1QWGGAcnXto0B4YsJrrqDOtOHlpOgCIyyEIbTI56gUMA3MbOp7Y2F1228vZy0Kj+/ejaxjUojZQ
	gn4O8P5JsgTrZs7X7+wWyGJ1HANTX8ksxrW/nf3Aj2s6/DcMeQC3SWIKj7UVwCbM41nG6bSLbOozZ
	yLBCbFmiXmrUdJr0y9gS/LykK1Q9LY8CzNKnqGsNKXSsw4rqa48YBL2MSV2T8x/vYZsEwXuXz1rQf
	z9RpVesfwukoWBe4CL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szI-00000007OpX-1GjE;
	Fri, 01 Nov 2024 14:50:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sfI-00000007LSq-2At7;
	Fri, 01 Nov 2024 14:30:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c7b9087c4so1339395ad.1;
        Fri, 01 Nov 2024 07:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471414; x=1731076214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKAtd4Xz8cLFFFmnHPins+tJ+Mfne7qr3bvUedak18U=;
        b=IkN51zij/iJdNgC+4CkVLbSE7FQEMfI7rM76DEwa3Nm2B33jjvISrg9if2t2+AQ1N8
         sLVmaDb3bKSXZ7UULFdUVJx3iGquuwaWprnHzII4uspciotMXwYcHHKo7CvA4y1TALAI
         hUBK+2YzuXWUWC8aipR8aASn1spUEsrjYoPnNmOrLqFmmw9nlkQVC75AL/l8sETygpzW
         529h+feWC4QAZbvK9UIT7kNPlc/khmKsTBC1y086ZGU9wCY4uI1ld7LUlwPmxn/httSX
         ufGKUO6C/uBR5lRHacizTvLEcgH7bAhHDVAovcifsOvhWm5NGJrPC/R1iM6E5pBptqoK
         QT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471414; x=1731076214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKAtd4Xz8cLFFFmnHPins+tJ+Mfne7qr3bvUedak18U=;
        b=VvwY39OMfzya41qaF4rQGVdbHe5QxiOv1BsxjshMwfay9urNb9gk4EbNTo/DRpewW1
         xCb4xUP76llTXtzbkkM2nMDJ/9Cfc+kM8fZVOvh4N2nRvwh3hwNRnySmszMbb1FBasoo
         vbs5S03jRg8mb0Ckjoq8a6d6K/FuWbfFdhl+iMO2dEV6FH5mdhC+sQ3aOhmV44UMNJP5
         51OsdPEPkfUYfeq87v2tMoYbKbyCTEc6RE2xZiDMtWT4GlYqEukm9d6Ci9xMRcUAXoQN
         OXVDHFaA3qPuXMbnrIZae6/ozoix3c3wFkomPNVv0CouA4OtEdQauO8UIPW2mSjVaUl1
         LO0A==
X-Forwarded-Encrypted: i=1; AJvYcCXOovDrkPukNHLj/WPx2ELq0RfXOcN8A0jrvHVkmqlba94aPnYTfOUJf8aCd1Jamv2RMeura69CpgBUWSNbKURE@lists.infradead.org, AJvYcCXTTZj6hW4JhcrDlJIw4heDoyI+qVI2Ac1tOMS209evQKwPTgGUeIwmM8I5O0PHanJ7HkYeF5Rgh6Vy5gI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFBoXNhHTlZnSzAn0ZctgYcpWI+71uUEszrZOfW31dyqg9OH3F
	piho3hAylU9w/8ctmGW5rmO5bVL7/opRdqiF+bSdBK+6fGcaRUvFRsIs4WHRzw0nZtwa8Fk2PoI
	SUBDFkT9+VTTXBjG2Kcw2u6j6D8o=
X-Google-Smtp-Source: AGHT+IGOQhefEp7FLZkdniAIiiIsTLBIszMwpP4/Ctt+MCmEaSNoKLq4eMcSMtSjAgS5QbXUeuU5N7LkDLjPkosOQVw=
X-Received: by 2002:a17:902:d50c:b0:20c:5da8:47b8 with SMTP id
 d9443c01a7336-210c689759amr141323595ad.5.1730471414470; Fri, 01 Nov 2024
 07:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 Nov 2024 15:30:01 +0100
Message-ID: <CANiq72ndWJtzSQSFYuVkRPhdan_PvNpvGEhQXKAZKESnt7JVAA@mail.gmail.com>
Subject: Re: [RFC v2 00/13] LKMM *generic* atomics in Rust
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, lkmm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, dakr@redhat.com, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_073016_584825_9CC30A48 
X-CRM114-Status: GOOD (  10.72  )
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

T24gRnJpLCBOb3YgMSwgMjAyNCBhdCA3OjAz4oCvQU0gQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyB0aW1lLCBJIHRyeSBpbXBsZW1lbnRpbmcgYSBnZW5l
cmljIGF0b21pYyB0eXBlIGBBdG9taWM8VD5gLCBzaW5jZQo+IEJlbm5vIGFuZCBHYXJ5IHN1Z2dl
c3RlZCBsYXN0IHRpbWUsIGFuZCBhbHNvIFJ1c3Qgc3RhbmRhcmQgbGlicmFyeSBpcwo+IGFsc28g
Z29pbmcgdG8gdGhhdCBkaXJlY3Rpb24gWzFdLgoKSSB3b3VsZCBsaWtlIHRvIHRoYW5rIEJvcXVu
IGZvciB0cnlpbmcgb3V0IHRoaXMgYXBwcm9hY2gsIGV2ZW4gd2hlbiBoZQp3YXNuJ3QgKGFuZCBt
YXliZSBzdGlsbCBpc24ndCkgY29udmluY2VkLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
