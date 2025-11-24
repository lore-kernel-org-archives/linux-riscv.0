Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73391CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 01:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVoDIHvLbO8bxdD7zNPRJjplW7Bi2zasGzyuY8uFBWY=; b=UvdFu/p+W89ZUE
	BJzPkcBeoQIvbOgu5N1/KH6IJRDSubMNo5dieCyj8dhkgP1b6eWQcvRGR0C8vZHk1cG+9OqB5CIBo
	r3CrF309wif8ywrkkXRRB3Y+rj5Uawwm/IS0YVx0KvhvgIv8cHLYqWwB4ZNwHPse+mWJcDU8SO/IP
	6qhPmz1wGxNCMQo6eBH/CCnxetxVBCKxIZ2FdQAYeY0dr5szaHEECEmyxXqb6ilY1/tyCWR+f+1q/
	vmdhpR81LJXqcgBeKThblbwRUNNA5SF8hzejTF99XLdaq2FGyVakE2rv5ygNkWPD6tF9Oqb0/Gwuw
	Z0jr2ZTRj4OyzzMwponw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLhC-0000000AwqK-3aQA;
	Mon, 24 Nov 2025 01:48:50 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLh8-0000000AwpQ-04jD
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 01:48:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-bceaaed0514so364293a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 17:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948925; x=1764553725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=nqfAXycC3Hv/ohdhGj2/z6Hk2NW1PwJpY7RTdCxGorS1mxiEZXR2ia6KwxZgnMHTM7
         jaJU4lzZ5IIaUTlmMa1TMWnSs2bimnzJFvYOGSSwyOBiZn6B0El0flr7eoma/uZ37OWZ
         3bFe9rbi69srCkqsG4UxKbR+iK9BrAebdP0keqeP22h+6Oxbi31TITkXhW+igByZlOQO
         F0ofkkxrMGKV2V4C/agObmdENH8IitffKenZh6gl99gHg2V6ikdtNZ7/lxqEz1eIb2L8
         3gbelECO0LNjQQa82wY+d22/yQg7oH3RYQjma8EBWEXvkDFCp0vLMCwFdjL4J+QrdK+m
         VjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948925; x=1764553725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=raiAKvBMVadvxQemK/pbFj2eieIbTILKmANwHse85Ny84v9cDeRjiZSJesWatd+VFU
         uuOzSrpj6KqFCOGnSi4ckzo4VocQHMl7FEt326Rtx8F7opZX15AXv1IP9ns51spHqyBr
         7jQAddLOa5Ghyani4ka/m9HWcsy1JHCDSafmBC1+tKBAnzZiiAScecwMJotbsgs1aiFg
         x4WJ29plWmIM92MM4vGdQeEsH/z6DW6LCFNvekJbMfzLWhtUQ6+0ddw+uoMbiqfzDMPc
         PGc3Nuu/OI+md42YhFEwAqaz+OVpcyWLi+QDZwjs3t12ba572Pv3pxV3NjrkIxmsroGM
         a07A==
X-Forwarded-Encrypted: i=1; AJvYcCX39qIBuJt9Xs5D57x9MaaiR5TN1YddJ34qc21nsX660uUA+wcnV2dJB7rTI6pPoCenm2KNWg3WodXv8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo6p2GmxAqfdZBJjZKOH3nin6GzjWt26yi4pcq95J0S+Hmfjsv
	FvQiNCKSfMVNoB3L/nwHGLp/Omg1lOlY0LcfbpN0oSaO52Xb90e3WweDWspP0lgqkbsSx4iHjVl
	jLGNgoF6Zv/aPwvfXcsHGE4qZ6/rbcvU=
X-Gm-Gg: ASbGncs2s+CRnw/XDeGLlRZhzoBLFYyVR3PmDtmqcU5NX0ACpseV27s48+EiHyRK6+S
	mGhAHfRfvtq4bUgnR/eALcQHg7dMm2cx7VdrqWl1trPefINaWyhZdviZiDX+V+WEl6GKsNsY4V0
	8GDZk+oeJ8JxyzbGOCKtqeLJvMhIC/rMtadHwJl5DIilU2Yw2F5lYouNSDbNlnFtawgVytTA0Ox
	CoBM1jU40niPd19dQT8TcLXAOQVne4Qb5qy1AqA8gnFeN6KsDYxeoEryUM8BM6WbzD2qMWItqjD
	SZg3aXsPV7ZzdlAKlfSjmcI2US0CtghcJ/sX/iyYf6pIhMprePUsts4KnFj6TrahN1cMF8KhRUf
	I/CN5ZF/O10NGvQ==
X-Google-Smtp-Source: AGHT+IGn1fQWUtfuo1zOBYncWXTAQy3r5XJCczzktuyTrIF4ISG4pCB6BfmuhKsOzi4ofGGWNC1ayRtxHafCtO0nUC8=
X-Received: by 2002:a05:7300:ea14:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2a7243d9794mr3793745eec.0.1763948925113; Sun, 23 Nov 2025
 17:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:48:32 +0100
X-Gm-Features: AWmQ_bkQhmxLSFViZmcLEfniv1-_q0VIV-sH15dOpedbSpl6O0HvgiWJ0WM7vVU
Message-ID: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
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
X-CRM114-CacheID: sfid-20251123_174846_059528_26FDD89E 
X-CRM114-Status: GOOD (  11.84  )
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMToyM+KAr0FNIEFzdW5hIFlhbmcgPHNwcml0ZW92b0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gVXNlIHRoZSBgQklOREdFTl9FWFRSQV9DTEFOR19BUkdTYCBl
bnZpcm9ubWVudCB2YXJpYWJsZSB0byBwYXNzIHRoZQo+IGAtLXRhcmdldGAgb3B0aW9uIGZvciBj
cm9zcyBjb21waWxpbmcsIHNvIHRoYXQgdGhlIGZ1bmN0aW9uIGNhbiBiZSB1c2VkCj4gdG8gdGVz
dCBib3RoIGJpbmRnZW4gb3B0aW9ucyBhbmQgYmluZGdlbiBiYWNrZW5kIG9wdGlvbnMuCgpJdCBz
ZWVtcyB0aGlzIGV4cGxhaW5zIHBhcnQgb2YgaG93IGl0IHdvcmtzLCBidXQgbm90IHdoYXQgdGhl
IGNvbW1pdAphZGRzIGFuZCB3aHksIGkuZS4gY291bGQgd2Ugc3RhcnQgd2l0aCAiQWRkIGBydXN0
Yy1iaW5kZ2VuLW9wdGlvbmAuLi4iCmV0Yy4/CgpCeSB0aGUgd2F5LCBzaG91bGRuJ3QgdGhpcyBq
dXN0IGJlIGNhbGxlZCBgYmluZGdlbi1vcHRpb25gPyBVcCB0byB0aGUKS2J1aWxkIHRlYW0uCgpN
b3JlIGltcG9ydGFudGx5LCBzaG91bGQgd2UganVzdCBoYXZlIGEgc2VwYXJhdGUgZnVuY3Rpb24g
Zm9yIGJhY2tlbmQKZmxhZ3M/IFRoYXQgd291bGQgYmUgZWFzaWVyIGFuZCB3b3VsZCBhdm9pZCBo
YXZpbmcgdG8gdXNlIHRoZQplbnZpcm9ubWVudCB2YXJpYWJsZSwgaWYgSSB1bmRlcnN0YW5kIHRo
ZSBjb21taXQgbWVzc2FnZSBoZXJlCmNvcnJlY3RseS4gQW5kLCBhbnl3YXksIGl0IGlzIGFjdHVh
bGx5IHRoZSBvbmx5IGZ1bmN0aW9uIHdlIG5lZWQgc28KZmFyLgoKPiArIyBSZXR1cm4geSBpZiB0
aGUgUnVzdCBiaW5kZ2VuIHN1cHBvcnRzIDxmbGFnPiwgbiBvdGhlcndpc2UKCk1heWJlIGp1c3Qg
InkgaWYgYmluZGdlbiBzdXBwb3J0cyI/CgpUaGFua3MhCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
