Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE26BCFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+bEboNdja38VwyEhp+OYN4vKuPhUz6jhpsa4Jfy2iI=; b=bZtlBlejbPP7cn
	cU/krvHrc4Ua/ra7cLvBP6zOXBkODfv5Mj9YBqGtbvKYmJIQP87Qf8zn+Ei8y+89d2izgeIFb+XcS
	oA2IRZ370AjCND2xhh68+mLh7sGR0tefJnTc60UyIqQw0NvWhMjG94JMGJnMImhmDFMemFegTOAX7
	icLzhM1YsncyDY73RKMwGok6rXWbrW7Jj1NzOxwmp3FF5hhiHBudpTzVSjrf+2y/SkDRrZAyAJ+Yt
	/h5+QOOb/MpacKv2OhC/0lmYAB+X9FBhh8Pkop0hQPGSNfPQwXWE+qIx9OMGL31BxCnPum7EAvoPB
	otISu98xp03zP4jfxJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNM4U-0000000AyST-1c3b;
	Mon, 24 Nov 2025 02:12:54 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNM4R-0000000AyS0-35iN
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 02:12:52 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b997ae045b7so370200a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 18:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763950371; x=1764555171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=bII+REHhEVLhk++Pns4v0pimPIyrz/9QSbYwp4JszkBOIvKEmwd6s87h8z0xbB5TyD
         0dqtTc3YKtbjxIHlNSGmPQXlF/WRG3mCNhrcjcME0ymVx4+DXpCCeXApcGPnqIziiTSh
         Mv2gQxvZ19e4nXbWR2lPoz91SD27w8XuVgFW9YLdQf5wJMU9L4wGpw/OSQG0jA1TRj6k
         OpBPHPVc7wcN1vcd5TUDCKNmriaNpVqrQLWPf7ybs8MpYGCWckVcEfWwKCtpwrBeQQPp
         XuBsDu0qkx89QYacP+wIptMT3wEllxmdmkyRnguaKOhpmcNw1KxJdKXdAqQdzkUPAlK1
         CXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763950371; x=1764555171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=HxVQO/nQY3XAyVfEPEeayOFY0RQTjjkI32hHcgGed1CYSdTeQILGmIEyqSIJO5uhiD
         Wf1WSnOwQM3rQdaieYDm5J1oFZl3+JQ3UgVNAS53KVQ5xoEv8Wuu/HsMzxcHahPAottF
         HJNGpw9K6p/AoIgjpFCYsFSZNpY3qmlpYbhdUCJrtI0irxmNXRMhQyWK8r7c3aFcN7xS
         SNIkAlz9lyrSzLDXAQNyKUDmvRnbhckZnGN3LN11bjRVEQfHuoO3aWVGnryQUrVa6ecW
         FCBeL5m3djz3m1CEtlah1Zfgcx10t//XGHTgaRCpFeQ3cnGx5el0uTAxB2nGSq3P5eFx
         BHTA==
X-Forwarded-Encrypted: i=1; AJvYcCXWGEAxhYjCR3e1nVjHjZIYw8IMsSRFICfbk3kLkb9tHFDrVCfFflQAuTYaSUDOaxKkXj5DhyicwH88qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwMBAiQ5U8q4Tqm0vXkwAM3TPr89WEf0SLMnH/0XDvKSouxN/p
	K7sOcVdpc9e+Cg804+WOp9p4I4Be0+8LboaFj5xKihQLjkAN3HrHfTEAnB4McHT8G1wnm55d/Vv
	FMkO0ohSil2UNIlT9yLuCrk9xKvM5fV0=
X-Gm-Gg: ASbGnctU+HN8mLqWZyMYi/9Wn2CbuwjmCCeMzSemrjE3t3+X/p8CrFc9DFMAnRIvVBc
	j+UJAh7Mq1QKPqwtj+hCipd8P8hLves/IVEBsuc7dx5rFfzRigHNtegXVe11JiPSoPMdIaVj0a+
	8rxkt67PpXMRhexZivFAWGnaCph+M9OBXad0Abi2L1WAhYa3RoPlG08KCqki/y5JPaMYakqilaY
	EPLWxg3eQpAN+VndVu1O+cWOBi/0isu0iKIwbOuDxQzJZXjzIOwXOhrsbzLVzQqh0qepMNCPZT7
	wm+N2m+/vMrx5iAAehNM5lPqb08Y1xvtYIJ9i0y5o7H2ZjjDDJU+pDRL8uniPKihrj3BUDQzetw
	4uYOZudaUeCdNHg==
X-Google-Smtp-Source: AGHT+IHMCycU2281yPoFBzJFehZlNjB/ZN9Hjei9e72GKfP8tgd3hQzDk2CQxnkWDDEZel2Cwvh5/pcBmY7xnByerRc=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr5187728eec.2.1763950370685; Sun, 23 Nov 2025
 18:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com> <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
 <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
In-Reply-To: <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 03:12:38 +0100
X-Gm-Features: AWmQ_bk9WXKruglIV497fNSKDmodqmzo_KTty7zsHwpLGLPWQoinN8LfqHHSZnM
Message-ID: <CANiq72mZ4uLqSe=WvoCtUR8cEiVpXBg2yB-7oFPf9jyu=QxS6g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_181251_800872_645C8F45 
X-CRM114-Status: GOOD (  10.89  )
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMzowNeKAr0FNIEFzdW5hIFlhbmcgPHNwcml0ZW92b0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gU29ycnksIEkgbWF5IG5vdCBoYXZlIG1hZGUgaXQgY2xlYXIu
IEkgbWVhbiBhbGwgdGhlc2UgY2hhbmdlcy4KCkFoLCBzb3JyeSwgSSBtaXNzZWQgdGhlICJjb25k
aXRpb25zIiB3b3JkIGJ5IHJlYWRpbmcgdG9vIHF1aWNrbHkgYW5kCm1pc2ludGVycHJldGVkIGl0
LCBteSBiYWQuCgo+IEkgaGFkIHNvbWUgY29udHJpYnV0aW9ucyBpbiBydXN0LWxhbmcvcnVzdCBy
ZXBvIGZvciByaXNjdjY0IChQUiAjMTMxOTU1LAo+IEZXSVcpLCBhbmQgSSdkIGxpa2UgdG8gYmUg
YWRkZWQgYXMgYSBSdXN0ICsgUklTQy1WIExpbnV4IG1haW50YWluZXIgaWYKPiB0aGF0J3Mgb2th
eSBmb3IgeW91IGd1eXMuCgpJIHRoaW5rIGhhdmluZyBwZW9wbGUgZXhwbGljaXRseSBsaXN0ZWQg
bGlrZSB0aGF0IHdvdWxkIGJlIGdyZWF0IChlLmcuCmluIGFuIGAuLi4gW1JVU1RdYCBzdWItZW50
cnkgdG8gdGhlIEFSQ0ggb25lIG9yIHNpbWlsYXIsIGxpa2Ugd2UgZG8gaW4Kb3RoZXIgcGxhY2Vz
KSwgYW5kIGl0IGlzIGEgZ29vZCB3YXkgdG8gY29udHJpYnV0ZSB0byBMaW51eC4gSSB3YXMKdGhp
bmtpbmcgYWJvdXQgaXQgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMgdG9vLiBCdXQgbGV0J3Mgc2Vl
IHdoYXQKUklTQy1WIG1haW50YWluZXJzIHRoaW5rIGFib3V0IGl0LgoKVGhhbmtzIQoKQ2hlZXJz
LApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
