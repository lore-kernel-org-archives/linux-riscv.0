Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F2CA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bkpXDYVx8ZGNCkBDpE015iyyiFm2o7GNaS0nie3Hzk=; b=aKkaNa1h6Vb28K
	yfimyc/lFVv1yGMwqh+hvvHJGrTOblI+knRztDhlVLuhciDnJ4HgvquJNHdS93fYzzZDIKEGDBRnK
	BgYgbfyNkxZtzfunNtbE8mS9KjADnLvG0tdUZkC6os1a30pXDZGQaertiUbNG5THb62GAipVkeqUL
	H1sZFCxG+J28ixqAsVol9vE7iSqaziMa56+JQCxWA5p8CB+S90l+UICzy5DET+45QTHSnDCLSH7zc
	NwVEoPfNf8T7GT6NvUHRw1ei2DHZclL4QzMiQBNZtc4bFK9KVXwnF8DkKabAmi+/ovrhHJh0dN8lD
	8MOuUFImhE8XqX35Sfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbpN-00000008xA7-0ocU;
	Mon, 25 Aug 2025 18:21:57 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbpK-00000008x99-15Vb
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 18:21:56 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-61dd3b5cdd7so465605eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756146113; x=1756750913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBWcU3cSWIrOv8SEdohQlNa+9rh4cGJiQvp8mNokO0E=;
        b=LpoCCM2lMO/elbarpHf8BuZejlVku1I1vDgGUUA8o52b3VDbT9JnC6OLHVkBGr12sr
         wD9T4DpRM+QybG4cGMC0mx6OGi3AiYs6RkOsZZViZsKpPy+lNjDJn1KAPADmAKOxy2ny
         iXkkspcG7S/irWNeF892CGMrGbAZtOsqhiKASPMuC8Lo8VwaRm2zfW6cqJVMZOQEB+Jb
         XWxqBxlkEWwMR0B9fk6gnygDoIZVXKkYQDA+yGTN+eQFh3Jx6qSkndCF2DF3LiHcjWnb
         wOQ0vvPurfIO5vW7IWSNAIiLkhGuSL1Z/lkAIDJqE4P0lJSk3lWuKxUpRnnyfaGMvq/N
         ymBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756146113; x=1756750913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBWcU3cSWIrOv8SEdohQlNa+9rh4cGJiQvp8mNokO0E=;
        b=G/ITyZLNzMv+wbjWesXEX2mOA+tX4JlPdLGMDB1+YaGRfrJMFB4juiIFofTHBUGXvd
         FOJwYJjbeOrNGYssd5Wve4mB5c06+T3TH1YVGQLCOo4QlSMx8zKX1WnTEYISDLZeFvSa
         3bXnjDE49G6GiDWKI1NRBjmGrXunTa2NzBX16HuP6gdI7SG0UHziRddfRgCm3oEJvRAj
         y9I2xmw4Y1cKWAbXf9pXWGcyPhaF0c4+T4zjUD94ndLp2tfNaGzrk00BF1IhQ1F0jnnu
         hUywc2HGUDbjNMYADsRBxAgh8HT9MWTIXHTaLMhozEKJuhK/+oYDf8YSGzcCqew1LHA4
         enbw==
X-Forwarded-Encrypted: i=1; AJvYcCVD1KhoZ3O6wQFMnjkeCpd1rUWFz+fGlp8mf6Cg4c77R+BBYWLv/DFHfXr9r6h6YnCiQs/07yVwYDSCfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI9DQcDdTTOlc/FuviQbGffYR9UICogU48sybWG9kzeMyCsabi
	jl1AC8E0g50Yrd5GjPW+BVYfdwPFWxViqjsQgKDUiyA6P3Gws1e9zjQPBfaZzS7jQCdeg8pC4g0
	h4b5AnWTpmoWx6RBhz9QFqrVFdlxNJrA=
X-Gm-Gg: ASbGncvHxpitH1FL8fELurgB3sISrBcdRHyebi0XUDFFxjCmgdYYSI31kvNZ+O0p0RM
	wVTca6AjlsdN9oVmfv/Si3jtBG4IvpCLzq0dqdicGRavVZCD/Qnm7yIQbok6wPA9Nu3E0qUtWHF
	5nR29l4BjZFhmqicKdWg+2ugxvoHeyzxsE+pDtgY0atH866GfMOnkx0G52cpP/h7Bcjg6Mpgd/L
	DeuKm1XDg==
X-Google-Smtp-Source: AGHT+IFskHmvwXj8mMcFosVYtY+vw+7NM41X2/qi91Cw233062th5AEOuPmRoCdCeKroHQKACJ9/26YoouKPLyTBfJI=
X-Received: by 2002:a05:6808:a586:10b0:437:b094:383c with SMTP id
 5614622812f47-437b0944231mr1150598b6e.2.1756146112878; Mon, 25 Aug 2025
 11:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
 <aJ-ScOp3ZCG6PQmD@google.com> <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
 <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com> <CAP-5=fWCGa+R1O2sL1anJGznkprQyP2RrsUZfzmrPJ2y-WsEvA@mail.gmail.com>
In-Reply-To: <CAP-5=fWCGa+R1O2sL1anJGznkprQyP2RrsUZfzmrPJ2y-WsEvA@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Mon, 25 Aug 2025 23:51:40 +0530
X-Gm-Features: Ac12FXzIW-t6fPYcoU6IlBmEWamOsApUN_OzhHIIlmzKU73aQg7rHJYgARuUrvY
Message-ID: <CAO9wTFj6o=ESbFUZmk9xAoMfGfUcCX7rQmaBzLyaPr6wNEotfQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_112154_296706_59D3CFDC 
X-CRM114-Status: GOOD (  18.45  )
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

T24gTW9uLCAyNSBBdWcgMjAyNSBhdCAyMjo1NCwgSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUu
Y29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDI1LCAyMDI1IGF0IDc6MTfigK9BTSBTdWNoaXQg
S2FydW5ha2FyYW4KPiA8c3VjaGl0a2FydW5ha2FyYW5AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBTYXQsIDE2IEF1ZyAyMDI1IGF0IDEyOjE2LCBTdWNoaXQgS2FydW5ha2FyYW4KPiA+IDxz
dWNoaXRrYXJ1bmFrYXJhbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBOYW1oeXVu
ZywKPiA+ID4gVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLiBJJ2QgbGlrZSB0byBhc2sg
aWYgdGhlcmUncyBhbnl0aGluZwo+ID4gPiBlbHNlIEkgc2hvdWxkIGRvIHJlZ2FyZGluZyB0aGlz
IHBhdGNoLCBnaXZlbiB0aGF0IGl0J3Mgc3VwcG9ydGVkIG9ubHkKPiA+ID4gZm9yIHg4NiBhbmQg
cG93ZXJwYz8KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBTdWNoaXQKPiA+Cj4gPgo+ID4gSGkg
TmFtaHl1bmcsCj4gPiBGb2xsb3dpbmcgdXAgb24gdGhpcyBwYXRjaC4gSSB3b3VsZCBhcHByZWNp
YXRlIGFueSBndWlkYW5jZSBvbiBmdXJ0aGVyCj4gPiBhY3Rpb25zIG5lZWRlZCwgY29uc2lkZXJp
bmcgaXRzIGN1cnJlbnQgc3VwcG9ydCBpcyBvbmx5IGZvciB4ODYgYW5kCj4gPiBQb3dlclBDLgo+
Cj4gQ2FuIHdlIGp1c3QgbWFrZSAgVFlQRV9TVEFURV9NQVhfUkVHUyAzMj8gVGhlcmUncyBubyBy
ZWFzb24gdG8gYXNzdW1lCj4gdGhlIGFyY2hpdGVjdHVyZSB0aGUgcGVyZiBiaW5hcnkgaXMgYnVp
bHQgb24gbWF0Y2hlcyB0aGUgcGVyZi5kYXRhCj4gZmlsZSBiZWluZyBwcm9jZXNzZWQgYnkgcGVy
ZiBhbm5vdGF0ZS4gR2l2ZW4gMzIgaXMgYmlnZ2VyIHRoYW4gMTYgdGhlbgo+IHRoaXMgY2FuIGp1
c3QgYmUgYSBtYXhpbXVtIHZhbHVlIChhIGNvbW1lbnQgdG8gdGhpcyBlZmZlY3QgaW4gdGhlIGNv
ZGUKPiB3b3VsZCBiZSBncmFuZCkuIEluIGdlbmVyYWwsIHRoZSB1c2Ugb2YgdGhlIGFyY2ggZGly
ZWN0b3J5IGFuZCB0aGluZ3MKPiBsaWtlICIjaWZkZWYgX19wb3dlcnBjX18iIGFyZSBjb2RlIHNt
ZWxscyB0aGF0IGFyZSBnb2luZyB0byBicmVhayB3aXRoCj4gY3Jvc3MtYXJjaGl0ZWN0dXJlIHBy
b2ZpbGluZy4KPgo+IFRoYW5rcywKPiBJYW4KClllYWggSSBhZ3JlZSB0aGF0IHNldHRpbmcgVFlQ
RV9TVEFURV9NQVhfUkVHUyB0byAzMiBpcyBhIG1vcmUKcmVhc29uYWJsZSBhcHByb2FjaC4gSSB3
aWxsIHNlbmQgYSB2MiBwYXRjaCBpbmNvcnBvcmF0aW5nIHRoaXMgY2hhbmdlLgpUaGFua3MsClN1
Y2hpdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
