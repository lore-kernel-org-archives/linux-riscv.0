Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBAAC001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oE+qdEuN7snzY8RLM2l0fGbcYibjnOJa3QVBiqMtKY=; b=RvN6drByv6fJnS
	dwlEzqvLm1gwcynIg5mXtgAhpfloFDInkaubNkEyrLkF7H7TpnH+s29B1SrHZA93Kz57jZvAVhb80
	JxwLLQIEUAoWmfvOOc+Np2kbFEhaGVF/lKrWfdScQODobv3K+plbyOG0UJkokikzrgx2Uuwn42j4X
	tqkRC+KaHkV7NxKjQMWHuPtZldgJ+/dUvtx1FwPolZmfGiys+uiZ4tBiDxSOQahc/BlNIl1cN6kh2
	LzwuUQtAtzHt+mB+7QavZXYpS5VmtxxvSdGX8jXZ98aJXs3Av+r2Si/Qm4vf/6tkcHMA5CW/AM2Gq
	ygMDSMA6CC2OXFzpGQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2fv-00DJiD-1P;
	Fri, 04 Aug 2023 21:49:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2ft-00DJhs-0V
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 21:49:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A275562130
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 21:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9CEC433CA
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 21:49:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LwXKQWRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1691185768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ORA3IcVhKb+rBSGklGYykuz+i9fmP5WSYPYjINBjLQQ=;
	b=LwXKQWRJpln7h+V6IAdlyyxcmH4Fo0qCLeZxzU4w6u+SKycSix/bThRRckYJJYs10cZQTn
	2aLUmh90ZLXAh3+awRNqNH+ewEmFRXRGK1OE4GvmlNe1CNGjpKcK+zfThThn7VtOXjHkLS
	XKMsqYOg2jEkcu+DcXx4WqlUAPIhMYo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d94d54b1 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Fri, 4 Aug 2023 21:49:28 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-447abf05ea4so932530137.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 14:49:27 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzb4Y8VNsv3k44x5OprzzLIHMYx9ZrZbcIcJ1GzPsnaq92CV6xf
	tCublKo3E0n6zPng/qykds3Lg5TEK3XTqXDNbSA=
X-Google-Smtp-Source: AGHT+IFzCyVxbaUUBustnrT0flW6JXDyqhc36FfiEbHPc8U+/6KELY7eBmvNw3xOVQKLjosHRbdftnWJevSh2GWotjg=
X-Received: by 2002:a67:f5ce:0:b0:444:230e:e1e0 with SMTP id
 t14-20020a67f5ce000000b00444230ee1e0mr1710875vso.29.1691185767077; Fri, 04
 Aug 2023 14:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230614013018.2168426-1-guoren@kernel.org> <20230614013018.2168426-2-guoren@kernel.org>
 <ZM1tGgcJg0silFaJ@zx2c4.com> <CAHmME9p3VoZco0+io6pZDnzKVdnP4vr4XWNaAPXGew+1RmfVig@mail.gmail.com>
 <20230804-hut-morbidity-126fc9158f38@spud>
In-Reply-To: <20230804-hut-morbidity-126fc9158f38@spud>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 4 Aug 2023 23:48:02 +0200
X-Gmail-Original-Message-ID: <CAHmME9q6YjWWLWu1N5G71TspBQ=WD-2S5Xx1B2ZdzK+Wy8bYag@mail.gmail.com>
Message-ID: <CAHmME9q6YjWWLWu1N5G71TspBQ=WD-2S5Xx1B2ZdzK+Wy8bYag@mail.gmail.com>
Subject: Re: [PATCH -next V13 1/3] riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: Conor Dooley <conor@kernel.org>
Cc: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	bjorn@kernel.org, cleger@rivosinc.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_144933_285155_328EB7CE 
X-CRM114-Status: GOOD (  21.66  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEF1ZyA0LCAyMDIzIGF0IDExOjQx4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDA0LCAyMDIzIGF0IDEx
OjI4OjE3UE0gKzAyMDAsIEphc29uIEEuIERvbmVuZmVsZCB3cm90ZToKPiA+IE9uIEZyaSwgQXVn
IDQsIDIwMjMgYXQgMTE6MjjigK9QTSBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEd1bywKPiA+ID4KPiA+ID4gT24gVHVlLCBKdW4gMTMs
IDIwMjMgYXQgMDk6MzA6MTZQTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+
ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+Cj4gPiA+
ID4gQWRkIGluZGVwZW5kZW50IGlycSBzdGFja3MgZm9yIHBlcmNwdSB0byBwcmV2ZW50IGtlcm5l
bCBzdGFjayBvdmVyZmxvd3MuCj4gPiA+ID4gSXQgaXMgYWxzbyBjb21wYXRpYmxlIHdpdGggVk1B
UF9TVEFDSyBieSBhcmNoX2FsbG9jX3ZtYXBfc3RhY2suCj4gPiA+ID4KPiA+ID4gPiBUZXN0ZWQt
Ynk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gQ2M6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBicm9rZSB0
aGUgV2lyZUd1YXJkIHRlc3Qgc3VpdGUuIEkndmUgYXR0YWNoZWQgdGhlIC5jb25maWcKPiA+ID4g
ZmlsZSB0aGF0IGl0IHVzZXMuIEknbSBhYmxlIHRvIGZpeCBpdCBieSBzZXR0aW5nIENPTkZJR19F
WFBFUlQ9eSBhbmQKPiA+ID4gQ09ORklHX0lSUV9TVEFDS1M9biB0byBlc3NlbnRpYWxseSByZXZl
cnNlIHRoZSBlZmZlY3Qgb2YgdGhpcyBwYXRjaC4gQnV0Cj4gPiA+IEknZCByYXRoZXIgbm90IGRv
IHRoYXQuCj4gPiA+Cj4gPiA+IEFueSBpZGVhIHdoYXQncyB1cD8KPgo+IEdpdmVuIHlvdXIgY29u
ZmlnLCBJIHN1c3BlY3QgeW91J3JlIGhpdHRpbmcgdGhlIGlzc3VlIHRoYXQgaXMgcmVzb2x2ZWQK
PiBieSBHdW8gUmVuJ3Mgc2VyaWVzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjMwNzE2MDAxNTA2LjM1MDYwNDEtMS1ndW9yZW5Aa2VybmVsLm9yZy8KPgo+IEhvcGVm
dWxseSB0aGF0J3MgaXQsCj4gQ29ub3IuCgpUaGFua3MhIFRoYXQgZGlkIHRoZSB0cmljay4gSSBz
dXBwb3NlIHRoaXMgd2lsbCBiZSBpbiB0aGUgbmV4dCA2LjUgcmMuCgpKYXNvbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
