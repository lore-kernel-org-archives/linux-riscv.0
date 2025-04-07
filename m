Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B653C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 08:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOmm+6w8ynDFVke8fLEdQ7zS/WN9uK8N6PYAkHDbaos=; b=WNA0sP5Q3xyQ7Y
	1HlFhuZ4lp7FFH5QIPFfct0S9oATK67jvM/N2UWbbjTFoYeZP1GAuz5iQS4SmoBMRPxDXu0lqBwZs
	jEIdtihFhrjcYDZVsM7XClOqvPMi2uGtoaXpoN+filp2HjbE1in5AGawQx1m5ZNorqF9BXelnWX4s
	JJK14neXDnMcqczEvN4YvuUwuAw/yR9Oqp7f+LO3DEF0qkemtPz8yDpnvYabTnOQpPnsK3LRSc9Y7
	Os3xCMfL8fVgwLJ/HaqUDzYiBVFDDnUZTwARS9HcHmVJMBe/xFaGddOmVbGIn917TTp6vgFvekwGn
	P33RtFDY278PT2is2BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hde-0000000GxPM-2FKw;
	Mon, 07 Apr 2025 08:15:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hdc-0000000GxOF-2aGO
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 08:15:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso5917586a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744013722; x=1744618522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxhNXhmOXrXU9cn3uuap3d3f1w/9DGD5pG/vOAg+GCU=;
        b=v89M4cezsMAZ/Upy8aKRFbNMOw3DC7F921t2aMtVTxl32te6iEMWGeT1SLpOVyCR+j
         A6W/edsJ0C5A/XVG9VCusr7QC/uPWvgQNZ3c60xPMQ1lCIC+emUkzRZo8h9L5m5obSzI
         +e/Ch3LiPJ9bAvQCqbXA1e54e2DL94/AL56RtIwx+JKNUNzCVNItt0y72weN6jvU5YTN
         vh1vg38ibKtmj1bS1qDwQ+k+RTh3M9os82W8XDjbCb1/SeaUghe3171Q/KGeBH9kdZHf
         laVh8xsrJ1TmA1L9xlrhbfHI3LPntjOXk3qcQwrc3uAiCAKUs/qbqPUqXZdcylFa91jF
         en2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013722; x=1744618522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxhNXhmOXrXU9cn3uuap3d3f1w/9DGD5pG/vOAg+GCU=;
        b=VupSDVjxCMC11O/7CB/zy20e2abbf4TXrNVB/KISj0Wpc6isOMm7FBKOUurJgMV7GK
         2kkJLfzaDiTY3HavXinyViuJX0MtxCG6Ge9H0I8U+pkC0nY9BBdyqa/iiFf9Zy77Pv2X
         a6LQ1044mylBKAtnU9TPkdRnzPrbhSo76RXPznA5uokLOczFV9IMe3mB+royH9f/UHL7
         MbW29eoGrqCpymqVcB7wSw5KL+77afRzDby31B569gWDkSMOIY0qlwMzK5MRSPHTBP5P
         8Ur0MfUcDrUUHa30LNBVR8AU86fKeWXROTr10OswAcukPdfeq56evElq2s7rAny9zqjg
         eIBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKqWAQOoFseu+G/j+4QeMTm0JmJbyl5vMxUHx+auoP63LC5+n/dTpQ0Bmq7jm1EjUT5lw4s3zV9nq6Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/KIcNb6uj+wJ8Dg+SzVNcqLvG9J6XzDtpwFcztnt5RJtb1qWT
	CjYqHRoDoafSWrkKo4PkLQ5Jj45gAaj7n6B6mWfVUMGoM3g4yYAe+NuP96AKJ5a671lKyoQUR0/
	mbJkr2dwQzz3pnTej6yz4ukoYG0D0d4ssuERQLg==
X-Gm-Gg: ASbGncvYoiw8am0Ek03fJPoW5VSt8BFgR8+VtS1aSItxsmWcRMQczLU+/n+VIDcEuCD
	4uXHc7xBvMDdI1UJxSYghd1kbSnsu7fII2v9S+WdbUrUMxVr3xjuEnKtyGn8GoJroHVco/sM+ZQ
	ckbKFDHgcyaSicwm/UcZeRsRtfuDImyFJ1LOpI/OtirNUd6u0BKoANyQSp
X-Google-Smtp-Source: AGHT+IGgzEsWY+FDt77Og8y5aNWXUnnOo8nRCNX9z9AS6T2kxW12Ew+hSRh5KhztpZghUinGFQgeBKUpUrZ7kM/dDF0=
X-Received: by 2002:a05:6402:3489:b0:5de:c9d0:6742 with SMTP id
 4fb4d7f45d1cf-5f0db80a5ebmr5551794a12.9.1744013722372; Mon, 07 Apr 2025
 01:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
 <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr> <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
In-Reply-To: <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 7 Apr 2025 10:15:11 +0200
X-Gm-Features: ATxdqUF5a3kGXRp3r7uxE0Bhe9AOdQ046v-EZyv9hJ2EImaWyVHa56ABPSTHfBg
Message-ID: <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_011524_887761_2D703737 
X-CRM114-Status: GOOD (  30.70  )
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

SGkgTWFzYWhpcm8sCgpPbiBGcmksIEFwciA0LCAyMDI1IGF0IDU6MjXigK9QTSBNYXNhaGlybyBZ
YW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDQsIDIw
MjUgYXQgMTI6NDXigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+
ID4KPiA+IEhpIEFyZCwKPiA+Cj4gPiBPbiAwMy8wNC8yMDI1IDE3OjExLCBBcmQgQmllc2hldXZl
bCB3cm90ZToKPiA+ID4gT24gVGh1LCAzIEFwciAyMDI1IGF0IDE2OjQyLCBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPj4gcmlzY3YgdXNlcyB0aGUg
LnJlbGEuZHluIHNlY3Rpb24gdG8gcmVsb2NhdGUgdGhlIGtlcm5lbCBhdCBydW50aW1lIGJ1dAo+
ID4gPj4gdGhhdCBzZWN0aW9uIGlzIHN0cmlwcGVkIGZyb20gdm1saW51eC4gVGhhdCBwcmV2ZW50
cyBrZXhlYyB0bwo+ID4gPj4gc3VjY2Vzc2Z1bGx5IGxvYWQgdm1saW51eCBzaW5jZSBpdCBkb2Vz
IG5vdCBjb250YWluIHRoZSByZWxvY2F0aW9ucyBpbmZvCj4gPiA+PiBuZWVkZWQuCj4gPiA+Pgo+
ID4gPiBNYXliZSBleHBsYWluIHRoYXQgLnJlbGEuZHluIGNvbnRhaW5zIHJ1bnRpbWUgcmVsb2Nh
dGlvbnMsIHdoaWNoIGFyZQo+ID4gPiBvbmx5IGVtaXR0ZWQgaWYgdGhleSBhcmUgYWN0dWFsbHkg
bmVlZGVkIC0gYXMgb3Bwb3NlZCB0byB0aGUgc3RhdGljCj4gPiA+IHJlbG9jYXRpb25zIHRoYXQg
YXJlIG5vdCBlbWl0dGVkIGFzIFNIRl9BTExPQyBzZWN0aW9ucywgYW5kIGFyZSBub3QKPiA+ID4g
Y29uc2lkZXJlZCB0byBiZSBwYXJ0IG9mIHRoZSBydW50aW1lIGltYWdlIGluIHRoZSBmaXJzdCBw
bGFjZS4KPiA+Cj4gPgo+ID4gT2sgSSdsbCBkby4KPiA+Cj4gPgo+ID4gPiBJdAo+ID4gPiB3b3Vs
ZCBiZSBuaWNlIGlmIHdlIGNvdWxkIHVzZSAtLXJlbW92ZS1yZWxvY2F0aW9ucz0gaGVyZSwgd2hp
Y2ggb25seQo+ID4gPiByZW1vdmVzIHN0YXRpYyByZWxvY2F0aW9ucywgYnV0IHVuZm9ydHVuYXRl
bHksIGxsdm0tb2JqY29weSBkb2VzIG5vdAo+ID4gPiBzdXBwb3J0IHRoaXMuCj4gPiA+Cj4gPiA+
IEFsc28sIEkgd29uZGVyIGlmIHRoaXMgc2hvdWxkIGFwcGx5IHRvIGFsbCBvZiAucmVsLmR5biwg
LnJlbGEuZHluIGFuZAo+ID4gPiAucmVsci5keW4sIGFzIHRoZXkgYWxsIGNhcnJ5IHJ1bnRpbWUg
cmVsb2NhdGlvbnMuCj4gPgo+ID4KPiA+IE9rLCBJJ2xsIGFkZCB0aGVtIHRvIHRoZSBuZXh0IHZl
cnNpb24uCj4gPgo+ID4KPiA+ID4KPiA+ID4gRmluYWxseSwgSSdkIGJlIGN1cmlvdXMgdG8ga25v
dyB3aHkgUklTQy1WIHJlbGllcyBvbiAtLWVtaXQtcmVsb2NzIGluCj4gPiA+IHRoZSBmaXJzdCBw
bGFjZT8gSXMgdGhlIHJlbG9jcyBjaGVjayByZWFsbHkgbmVlZGVkPyBJZiBub3QsIGl0IHdvdWxk
Cj4gPiA+IGJlIGEgbmljZSBvcHBvcnR1bml0eSB0byBnZXQgcmlkIG9mIE1ha2VmaWxlLnBvc3Rs
aW5rIGVudGlyZWx5Lgo+ID4KPiA+Cj4gPiBTbyBJIGhhZCB0byBjaGVjayBhbmQgaXQgaGFwcGVu
cyB0aGF0IHRoaXMgd2FzIGFuIGlzc3VlIHdpdGggdGhlCj4gPiB0b29sY2hhaW4sIEkgc2hvdWxk
IGNoZWNrIGlmIHRoYXQgc3RpbGwgaGFwcGVucyB3aXRoIG5ld2VyIG9uZXMuCj4gPgo+ID4gY29t
bWl0IDU1OWQxZTQ1YTE2ZGNmMTU0MmU0MzBlYTNkY2U5YWI2MjViZTk4ZDAKPiA+IEF1dGhvcjog
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gRGF0ZTogICBXZWQg
TWFyIDI5IDA2OjUzOjI5IDIwMjMgKzAyMDAKPiA+Cj4gPiAgICAgIHJpc2N2OiBVc2UgLS1lbWl0
LXJlbG9jcyBpbiBvcmRlciB0byBtb3ZlIC5yZWxhLmR5biBpbiBpbml0Cj4KPgo+Cj4KPiBTbywK
Pgo+IEZpeGVzOiA1NTlkMWU0NWExNmQgKCJyaXNjdjogVXNlIC0tZW1pdC1yZWxvY3MgaW4gb3Jk
ZXIgdG8gbW92ZQo+IC5yZWxhLmR5biBpbiBpbml0IikKPgo+IElzIHRoaXMgdGhlIGNvcnJlY3Qg
dGFnPwoKVGhpcyBpcyB0aGUgaW5pdGlhbCBjdWxwcml0IHllcywgYnV0IGlmIHdlIHVzZSB0aGlz
IHRhZywgdGhlIGZpeCB3b24ndAphcHBseS4gU28gSSBkZWNpZGVkIHRvIHBpY2sgQXJkJ3MgcGF0
Y2ggc28gdGhhdCB0aGlzIGZpeCBjYW4gYmUgZWFzaWx5CmJhY2twb3J0ZWQgdG8gNi4xNCwgYW5k
IEknbGwgY29tZSB1cCB3aXRoIGEgbmV3IHZlcnNpb24gZm9yIHByZXZpb3VzCnJlbGVhc2VzLiBJ
cyB0aGF0IG9rIHdpdGggeW91PwoKVGhhbmtzLAoKQWxleAoKPgo+Cj4KPgo+Cj4gLS0KPiBCZXN0
IFJlZ2FyZHMKPiBNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
