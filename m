Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D42C6FA8E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 21:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Rl8C9R7G4/xjYbzZnuyWf4WcTI49sI/3TA/kAHA8jSw=; b=lHim3ntLwuO14CNwREl/OcZi22
	yrjRCjNP1dnaZlQTu1glyWBZttOtQx500W1416Db3dUtyfdVaQcHmYBJIX++7iQ1QurpRrPTqp33L
	DpT6y1uYZ1ObmbwuNDNx4pccI6wUmQ+SxlvgAtz7QxQhV+DfOe4h6XMVhv0T7OAvH5UmTBPVI/nS0
	P1s7W9ziv/t5i4rtoZBObUllmlOsI8Tm3vm4jtAxmkk/l02x7R4H2eW19VJCrhkrWzQQQVhJzbW9j
	UQDWWpaPf9LCCDmj/uq+7p0A4cbkdFzm4DQhFPL4UIRyxmtVuIHyp7aUqt8vi11dmd39m8s2D+F8G
	+MHbTdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVffh-003zZc-Su; Fri, 24 Feb 2023 21:32:05 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfff-003zWf-2z
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 21:32:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so581688pja.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvJN8dmrmNJu4tTYhdlBrzcRSinLAy+Jhaplp/kCRiA=;
        b=wh807lSO9v29Yu6tO13IzDLOgiVo3Y9CLLlEMCaN5Bfph5SWKk/ief3r4cZyouTDq3
         ekQ8BZiAaegZvDAKUQ41D41hsAmetgk6oRbzZgr5tZ8Ebv6rouEL0se6NNr8O8vuHMuA
         Y9E1KcrrOfgbPedMh8QVliNBmDLSSk306iIqsN5Z3WjNY4Kf8EbTZS61IOkrrZWWRWux
         SIrlqYQU9Ed7MRpv4GK6gK/n40iENTbOVq0sI7jnPIv4ay32p0xTWuzO+r4e3KUxS3Aw
         mV9fpIWYF+zc1nWP6gzHkwKwUixXjTuaac3chNZcBChKKjLuR16rINK9a4ShFPJKhkRy
         dJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvJN8dmrmNJu4tTYhdlBrzcRSinLAy+Jhaplp/kCRiA=;
        b=FIjOQULCwI2Dta02sN+uNTJzKEhYFOHjSSpjFE+Za0QMO2AGlFX1o/copfbu3VuPOT
         NikRrnKPCuM4NGIzKPY8qSdw5LUh1G0Pq+Bs/08NQyZ8oo+gmIYAzqEQML6x34ofYdGK
         7nBitlXs13AUaytqAsGYkEckMjAnZnE/R1fGFpgpfiFp76/GifUvB/KPq77/v0EL3ITJ
         zXrElEJNqYHl4r0Bi52vzDZZ+IUSqLdxT9lQvQdrzsahj0sKkmYKODH4vHVF67+BdqOp
         +HmOZ15W/XscHelplQdfZTqQizoO4whmhnj7Z+CfUtfefxEPm7TqWklUqPWa1Gw1wEpw
         Z66w==
X-Gm-Message-State: AO0yUKX4pC2sks4k6MIbLaM0KakvKZyjabjOIzGc7DHW7y4ZsRfYRqnw
	1kEP1z22V76jEvy6Rh5q1ZcH0VUXHRWmCewZ
X-Google-Smtp-Source: AK7set+inR9Bfe356VnjZRrkMmucPTHHx4QOqBABEwJbFOr2cvrtN9y1cnMB0g/q9qfmCnSJDZEm5g==
X-Received: by 2002:a17:902:d506:b0:199:4d25:6a4d with SMTP id b6-20020a170902d50600b001994d256a4dmr997355plg.10.1677274316335;
        Fri, 24 Feb 2023 13:31:56 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jw9-20020a170903278900b0019a7d58e595sm6071070plb.143.2023.02.24.13.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 13:31:55 -0800 (PST)
Date: Fri, 24 Feb 2023 13:31:55 -0800 (PST)
X-Google-Original-Date: Fri, 24 Feb 2023 13:31:09 PST (-0800)
Subject: Re: [RFC 0/2] RISC-V: enable rust
In-Reply-To: <20230224133609.2877396-1-conor.dooley@microchip.com>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
  Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
  boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
  rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-f429a40f-1869-4c5b-ab4f-e7eec94489e8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_133203_337963_8631B67E 
X-CRM114-Status: GOOD (  19.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNCBGZWIgMjAyMyAwNTozNjowOCBQU1QgKC0wODAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IFRoaXMgaXMgYSBzb21ld2hhdCBibGluZCAoYW5kIG1heWJlIGZvb2xpc2gpIGF0dGVt
cHQgYXQgZW5hYmxpbmcgUnVzdAo+IGZvciBSSVNDLVYuIEkndmUgdGVzdGVkIHRoaXMgb24gSWNp
Y2xlLCBhbmQgdGhlIG1vZHVsZXMgc2VlbSB0byB3b3JrLgo+IEknZCBsaWtlIHRvIHBsYXkgYXJv
dW5kIHdpdGggUnVzdCBvbiBSSVNDLVYsIGJ1dCBJJ20gbm90IGludGVyZXN0ZWQgaW4KPiB1c2lu
ZyBkb3duc3RyZWFtIGtlcm5lbHMsIHNvIGZpZ3VyZWQgSSBzaG91bGQgdHJ5IGFuZCBzZWUgd2hh
dCdzCj4gbWlzc2luZy4uLgo+IEkndmUgdGFnZ2VkIHRoaXMgYXMgUkZDIGluIGNhc2UgSSd2ZSBt
aXNzZWQgc29tZSAiV0FhYWFhIHlvdSBjYW4ndCBkbwo+IHRoaXMiIHNvbWV3aGVyZSA6KQoKSSdt
IGZpbmUgd2l0aCBpdCwgYnV0IElJUkMgdGhlIFJ1c3Qgc3VwcG9ydCBmb3IgbW9zdCB0YXJnZXRz
IHdhcyBwdWxsZWQgCm91dCBhcyB0aGV5IHdlcmVuJ3QgZGVlbWVkIHJlYWR5IHRvIGdvIHlldC4g
IElmIHRoZSBSdXN0IGZvbGtzIGFyZSBPSyAKdHVybmluZyBvbiBSSVNDLVYgc3VwcG9ydCB0aGVu
IGl0J3MgZmluZSB3aXRoIG1lLCBidXQgSSB0aGluayBpdCdzIApyZWFsbHkgbW9yZSB1cCB0byB0
aGVtIGF0IHRoaXMgcG9pbnQuCgpTbwoKQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPgoKaW4gY2FzZSBmb2xrcyB3YW50IHRvIHRha2UgaXQgdmlhIHNvbWUgUnVz
dC1yZWxhdGVkIHRyZWUsIGJ1dCBJJ20gYWxzbyAKZmluZSB0YWtpbmcgaXQgdmlhIHRoZSBSSVND
LVYgdHJlZSBpZiB0aGF0J3MgZWFzaWVyLgoKPgo+IFRoYW5rcywKPiBDb25vci4KPgo+IENDOiBN
aWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5vcmc+Cj4gQ0M6IEFsZXggR2F5bm9yIDxhbGV4Lmdh
eW5vckBnbWFpbC5jb20+Cj4gQ0M6IFdlZHNvbiBBbG1laWRhIEZpbGhvIDx3ZWRzb25hZkBnbWFp
bC5jb20+Cj4gQ0M6IEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdAZ21haWwuY29tPgo+IENDOiBHYXJ5
IEd1byA8Z2FyeUBnYXJ5Z3VvLm5ldD4KPiBDQzogQmrDtnJuIFJveSBCYXJvbiA8Ympvcm4zX2do
QHByb3Rvbm1haWwuY29tPgo+IENDOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pgo+
IENDOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4gQ0M6IFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gQ0M6IE5hdGhhbiBDaGFuY2VsbG9yIDxu
YXRoYW5Aa2VybmVsLm9yZz4KPiBDQzogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdv
b2dsZS5jb20+Cj4gQ0M6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4KPiBDQzogcnVzdC1mb3It
bGludXhAdmdlci5rZXJuZWwub3JnCj4gQ0M6IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcKPiBD
QzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENDOiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gQ0M6IGxsdm1AbGlzdHMubGludXguZGV2Cj4KPiBNaWd1ZWwgT2plZGEg
KDIpOgo+ICAgc2NyaXB0czogZ2VuZXJhdGVfcnVzdF90YXJnZXQ6IGVuYWJsZSBidWlsZGluZyBv
biBSSVNDLVYKPiAgIFJJU0MtVjogZW5hYmxlIGJ1aWxkaW5nIHRoZSA2NC1iaXQga2VybmVscyB3
aXRoIHJ1c3Qgc3VwcG9ydAo+Cj4gIERvY3VtZW50YXRpb24vcnVzdC9hcmNoLXN1cHBvcnQucnN0
IHwgIDIgKysKPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
IGFyY2gvcmlzY3YvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgIDMgKystCj4gIHNjcmlwdHMv
Z2VuZXJhdGVfcnVzdF90YXJnZXQucnMgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICA0
IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
