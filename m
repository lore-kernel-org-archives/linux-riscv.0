Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A74EC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6bojR6+nAL8QHqcn92QHr4ldjPFoiV+HCUec0h+Xew=; b=YupfVsZLNcTvTP
	hBbM0L31RnHc2b5FekqMt5iwflNGToopxsRQdTf2N/fWWAiKfBM9tgFF4dgapXvLsmO82suXsPgfZ
	mu5UjeoVcIuoNsVKf+N1/tIF4NVMUY2BOM1ohct5D1SwWFd1T8k0Kwio5zD3WtS8VJzH7dyNEbcIN
	L3ADREpC7fOWXQspbWuQBuLhdfS5/qpo+KcuGqpa2+rmrakKFCRpwOwMDD1Ua118JOpAF1BuDl07L
	BCsqe0LKkvqSh2YLDpgCIGC2k9DG/mTz7b/uSVdGh5D96We4bdBBk3FlLjiEWGRX+quJ0YVrgkdeq
	0pe6Ww3NXlI06mEZIqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Zn-00000000Krz-3XTb;
	Thu, 25 Jan 2024 14:19:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Zm-00000000KrS-0HK2
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oOzAf62Q5EQWJNHfwm0u23zGJZG4Xz8s5DNGaCHvSkA=; b=QNLNnUW4ixpatZmC8SvbVm/54N
	KVECIsQz7LB2d6fEiGXEuQzbH8WUkD7//d1mpVM691xNbE7MGT1pUkyfsVMVuizSooJNDSqK5qKwj
	diijV6dFlUZ+CoOrMV9TFCvW3ccKWG98qNLVM5mI0Nx8BQTjslJ5W6uRsdJEWzBmxVH4aWPqDHrWS
	OcYxhHE+0nAeDzQKNYnu4elVIJqIvvLyaYaLIrfLCjZvri9UwHTHM3XAh1yepgu/nBiPDaghWkpep
	z4EMKptv94RKsshj0/4Ra6IJXN12mtrxbhUP51tpVvbyIV7/0oU/I8QveycVmFhlCn1k7jtEbRRwK
	96oF+nUA==;
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSzCS-00000005Ltj-3Yrs
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 12:51:22 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5f69383e653so65846717b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706187016; x=1706791816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOzAf62Q5EQWJNHfwm0u23zGJZG4Xz8s5DNGaCHvSkA=;
        b=liQfsfgRF06KFlvsGX13eWhkoDl3pAE3vxQaf6yee1gjz9VW8JaN+aHZEQu04n+W2k
         56V4W8FnPLurtb66zYHfuVIexPcp7ZYBj02Gvlvj6eTP/H9YJQH1akWWVcBgI8X2MPJ7
         JO3Sj+KT2tgMyRDf20UCR4h1R18QWGhjQfO01bYdwMZT4Dc0WoGD4g1klS4gkVNS+Ez6
         LPCOcqT9tBnJE7VS14rW3wZTzq1+LJ7EyMIQDrB79PoTDslwg9r7+Pdr86k1/ktLH8hU
         nS+rthWaQ06VHVJTkggxo2SAXAGQCn+O+u0m0SJPgJlUcjcj7wPK7uv/VrYby4ZUTs9/
         lArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706187016; x=1706791816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOzAf62Q5EQWJNHfwm0u23zGJZG4Xz8s5DNGaCHvSkA=;
        b=CO9dpYoY1eprjtWJifiRVMAmyZ1ZDc122CWm1Gn+NWgBgM8YdMQ+2+DOg3IZ84dVuB
         43iL7jrEEe/NlbPHt6Ydeo7rpk7oHSza6lBksyCwEUh6kAATzkalWCmWtLUbpNGfkr0I
         2tqsSQn5n6emtm1GDHTfnA4JLl65zc8SAyMDFpz9hHJlJp1o4NuO6jLShaNMJI0w408h
         LgdfbN4vh55Z2TtfYox60zlZnTgBxDMZEQs8hzI5VUDtymnkHPxOC2lig0l679l2rg8z
         lA7v+MYggwgaGKqo3V+bGiRgVcXyM0ZRXybmiO3XK72/09x65K0jVAtoSH4XtfRsUJs1
         9V+Q==
X-Gm-Message-State: AOJu0YzTBy2DtkKgmCgomvdqS/FxoepzDtoYg5s7mXzBeg8rzce4ev84
	C6l+aLKtA0Xb9yGPfZb6ghTCNbcphHGeyC7jdolsxEkz90axD/eHk6wMaQ7bf1TSbeGeRKcLMkG
	DPyh6T4wwUXFuoKNX/1wH+maV7iY=
X-Google-Smtp-Source: AGHT+IEAr8OYVcCCv8ykkRFWiLud/ObEU2fmDTsdYvjCgjI7xiAcQS5cp87B+9j60Ce7rUjafSwja9QMdshXEp07rws=
X-Received: by 2002:a81:4983:0:b0:5ff:638f:441e with SMTP id
 w125-20020a814983000000b005ff638f441emr571223ywa.103.1706187016606; Thu, 25
 Jan 2024 04:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy> <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy>
In-Reply-To: <20240125-bucked-payroll-47f82077b262@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 25 Jan 2024 13:50:05 +0100
Message-ID: <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_125120_956964_93BE2186 
X-CRM114-Status: GOOD (  24.54  )
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

T24gVGh1LCBKYW4gMjUsIDIwMjQgYXQgMTozMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSSBjaGF0dGVkIHdpdGggdGhlIGNsYW5nIGJ1
aWx0IGxpbnV4IGZvbGtzIGFib3V0IHRoaXMgeWVzdGVyZGF5LCBOYXRoYW4KPiBhZ3JlZWQgdGhh
dCBkZWFsaW5nIHdpdGggaW5jb21wYXRpYmlsaXR5IGlzc3VlcyBpZmYgdGhleSBjcm9wIHVwIGlz
IGEKPiByZWFzb25hYmxlIHdheSB0byBnby4KPgo+IElmIGJ5ICJ0aGUgYmluZGdlbiBmb3VuZCBv
bmUgbWF0Y2hlcyB0aGUgQyBjb21waWxlciIgeW91IG1lYW4gdGhhdCB0aGUKPiB2ZXJzaW9uIG9m
IGxpYmNsYW5nIHVzZWQgYnkgYmluZGdlbiBtYXRjaGVzIHRoZSBDIGNvbXBpbGVyLCB0aGVuIHRo
YXQKPiBzb3VuZHMgZ3JlYXQuCgpZZWFoLCBleGFjdGx5LiBTbywgdW5sZXNzIEkgYW0gbWlzdW5k
ZXJzdGFuZGluZywgdGhlIGluY29tcGF0aWJpbGl0aWVzCmNvdWxkIG9ubHkgaGFwcGVuIGlmIHNv
bWVvbmUgaWdub3JlcyB0aGUgd2FybmluZy4gV2UgY291bGQgbWFrZSBpdCBhbgplcnJvciB0b28u
Cgo+ID4gRm9yIGBiaW5kZ2VuYCB1bmRlciBHQ0MgYnVpbGRzLCB3ZSB3aWxsIGV2ZW50dWFsbHkg
d2FudCBhICJwcm9wZXIiIHdheQo+ID4gdG8gdXNlIEdDQyBpbnN0ZWFkIChvciBwb3NzaWJseSBv
dGhlciBhcHByb2FjaGVzIGxpa2UgcXVlcnlpbmcgdGhlCj4gPiBpbmZvcm1hdGlvbik6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC1iaW5kZ2VuL2lzc3Vlcy8xOTQ5Lgo+Cj4gPiBS
ZWNlbnRseSwgdGhlcmUgaGFzIGJlZW4gYSB0aHJlYWQgaW4gb3VyIFp1bGlwIGFuZCBhIGNvdXBs
ZSBwZW9wbGUgYXJlCj4gPiBleHBlcmltZW50aW5nOiBodHRwczovL3J1c3QtZm9yLWxpbnV4Lnp1
bGlwY2hhdC5jb20vI25hcnJvdy9zdHJlYW0vMjg4MDg5LUdlbmVyYWwvdG9waWMvQmluZGdlbi4y
MC0tLjIwR0NDLjIwYmFja2VuZC4yMHBvcnQKPgo+IFRoYXQgbGluayBmb3IgbWUgZ29lcyB0byBh
IG1lc3NhZ2Ugb24gMjIvMDEsIHNvIGxhdGVyIHRoYW4gdGhlIGVtYWlsIHlvdQo+IHNlbnQuCgpa
dWxpcCBzZWVtcyB0byBzY3JvbGwgdG8gdGhlIGxhdGVzdCBtZXNzYWdlIGluIHRoZSB0b3BpYyAt
LSB5b3Ugc2hvdWxkCmJlIGFibGUgdG8gc2Nyb2xsIGEgYml0IHVwLCBidXQgaWYgdGhhdCBkb2Vz
bid0IHdvcmssIHRoaXMgbGluayBzaG91bGQKZ28gdG8gdGhlIGZpcnN0IG1lc3NhZ2U6Cmh0dHBz
Oi8vcnVzdC1mb3ItbGludXguenVsaXBjaGF0LmNvbS8jbmFycm93L3N0cmVhbS8yODgwODktR2Vu
ZXJhbC90b3BpYy9CaW5kZ2VuLjIwLS0uMjBHQ0MuMjBiYWNrZW5kLjIwcG9ydC9uZWFyLzQxMjYw
OTA3NAoKPiBUaGF0IHNhaWQsIEkgZ2F2ZSB0aGluZ3MgYW5vdGhlciBzcGluIHRvZGF5LCBpbiBh
IGRpZmZlcmVudCBlbnZpcm9ubWVudCwKPiBhcyBhIGZpbmFsIGNoZWNrIGJlZm9yZSBzZW5kaW5n
IGFuZCBmb3VuZCBhbiBpc3N1ZSBjYXVzaW5nIGtlcm5lbAo+IHBhbmljcy4gUklTQy1WIChhbmQg
eDg2L2FybTY0KSBzdXBwb3J0cyBrY2ZpIChDRklfQ0xBTkcpIGJ1dCBlbmFibGluZwo+IHNhbml0
aXNlcnMgc2VlbXMgdG8gYmUgYSBuaWdodGx5IG9ubHkgb3B0aW9uIGZvciBydXN0Yy4gVGhlIGtl
cm5lbCBJCj4gYnVpbHQgdG9kYXkgaGFkIENGSV9DTEFORyBlbmFibGVkIGFuZCB0aGF0IGNhdXNl
ZCBwYW5pY3Mgd2hlbiB0aGUgcnVzdAo+IHNhbXBsZXMgd2VyZSBsb2FkZWQuCj4KPiBUaGUgQ0ZJ
X0NMQU5HIEtjb25maWcgZW50cnkgaGFzIGEgY2Mtb3B0aW9uIHRlc3QgZm9yIHdoZXRoZXIgdGhl
IG9wdGlvbgo+IGlzIHN1cHBvcnRlZCwgYnV0IGZyb20gYSBxdWljayBjaGVjayBJIGRvbid0IHNl
ZSBhIGNvbXBhcmFibGUgdGVzdCB0bwo+IHVzZSBmb3IgcnVzdC4gRXZlbiBpZiBhIHRlc3Qgd2Fz
IGFkZGVkLCB0aGUgY3VycmVudCBmbGFnIGlzIGFuIHVuc3RhYmxlCj4gb25lLCBzbyBJIGFtIG5v
dCBzdXJlIGlmIHRlc3RpbmcgZm9yIGl0IGlzIHRoZSByaWdodCBjYWxsIGluIHRoZSBmaXJzdAo+
IHBsYWNlLCBnaXZlbiB0aGUgc3RhYmlsaXNlZCBmbGFnIHdvdWxkIGJlIGVudGlyZWx5IGRpZmZl
cmVudD8KClllYWgsIEtDRkkgYW5kIG90aGVyIG1pdGlnYXRpb25zIGlzIFdJUCAtLSBDYydpbmcg
UmFtb24gYW5kIE1hdHRoZXcKd2hvIG1heSBiZSBhYmxlIHRvIHRlbGwgdXMgdGhlIGxhdGVzdCBz
dGF0dXMuCgpUZXN0aW5nIGZvciB1bnN0YWJsZSBmbGFncyBpcyBmaW5lLCBpLmUuIHdlIG9ubHkg
c3VwcG9ydCBhIHNpbmdsZQpjb21waWxlciwgc28gd2UgY2FuIGNoYW5nZSB0aGUgbmFtZSB3aGVu
IHdlIGRvIHRoZSB1cGdyYWRlLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
