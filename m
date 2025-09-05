Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E34BCA1013
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRyWC7dJa2punh23CiTn+elil2Vg02sIbTbh0DjdulI=; b=vHjwMC+B967V9A
	8VEDcnzd+HVVBX938U+LjDnx/AzpsqTGEs9rFjtHjRGMjQ013nfiU8s6WIJwS3eLe4scr7hEdtqOf
	xqU4B9TIe+EcyjlFTQW55XS7dNlLmmuKgfSWnbbBQEwwXQsa2yJ/26I93ouyy8aaC5zvCDKv9j7Fl
	HIQNwWVO3k2Qp//1g4s0s7RM4fI8Y/LpAGeDPjNqlWUZjJvxvMXnTAEEMrI2/2FFm2cf/y8bejGFK
	blC9BxYTOHVepNs7nIjOrkUsS/d/bwNUwZ668ek8U2ldXpGDl4ITCinbYUWkBHXdYIQtdiyfPDumk
	vf7rRwiwJ699Ajl9bB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZp-00000005Z7A-0lDS;
	Sat, 06 Sep 2025 00:14:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugJa-00000005OAL-1yft
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 23:57:59 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-32bab30eefbso1869227a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Sep 2025 16:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757116672; x=1757721472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pLX9mNLE1Old2BsaUGh3Hjem0q5L//LE3ZX0hufywI=;
        b=Tqv8ivgHySJnLlg+RPHmcyLXc21qsI6oaPhOBFB/PcvR3a3YwDICQiejWNJGhqYIHo
         xFxXEUZgqMJQINwQB1rVpzZG19FhvvV4y2Q4zX/i9yI7dCxOPRPNE+z9zdqR5pBxo8tr
         RMkL2XMnYWkIZRcXKO79BWogAYf76GSfEEeyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757116672; x=1757721472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pLX9mNLE1Old2BsaUGh3Hjem0q5L//LE3ZX0hufywI=;
        b=DRSqwKZbIC08Mdv9d6NXR4OdhXUPtzu873eVuThs2i/cTQoHfj5BXbQNQGLqtj13sX
         Ioo6CNJstQyomLPHWWoqdFusgoq3YPcrw18p/SqYawhWQyhSGvbo/3HVgcLc7gU05dX3
         jWA5saWxLnZovE8eRH2t4gCe/2d7gcfb1UDHqj3YPiZjN2+VwSJX7EUEErtgn3jlU2lo
         95q7XXjxj4xVl8AyLCo+w6VrHuahay4RgUicF15/ZlmCYD1W5HHWCsLndReGLuOYs9aW
         iiGZMZ8xyACoTCKFamOJ7KaRFNW9bhD8AbvBlFMu4zyPzGd3ob0JMKLneBkQTtc4PKSm
         Z3FA==
X-Forwarded-Encrypted: i=1; AJvYcCX2v8WKk3KUxGvba6KM7ZeCyFfEcp7Hh/yz+kDcf9FXSLXO4eT3xNwM4cG7PKZyM7gpne7z95M0Le6omQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFTsaKljxuxfAB3Sce6dbVBYpAysOyRfvd6syiij2Hp607rLL2
	N+uvs0I60EeVK2u+RdQ54TJ6SfZJmXlbAZ6Zw3Bji3YLfrQmpsMo7aQy3wHYbNoVBmx83CYBzWf
	a7yg=
X-Gm-Gg: ASbGncsMe68Zb7cn8tGBmx8+ULzPkKWNA3BhMvCFhFX66pDei+A/wVRq+Qogg+DXB9t
	cmDtMIw0CLPCUHHo7WO4c5tXczed3GVZOvV7UONKXYB3KeP5hCPnzBBYwjK3bz15B2zzhLRSHfM
	qIak9N8k+9WuxsyG8RNpjLGhSDyGBnjqetXdKP1wzKAYBT2o3ec6rHRHZ4MmDYznBFqZPdqeG4E
	iFF62MlzrcObI6308VbyX9DD/g9Ydp4m44rUevn8NzYxiy02M9oQZIHMEk5ZT15nTGHEyMuVnY7
	SOngOqDqGqFQIz4Tn5jZwc/MbXWoPNoDO079pTjrsWjBuPZSGejPnkycZ+VfODEODLoxok6jG4B
	EeRsGOchx7724P6It+mGCnPGgDvf9lqMvLsGemlVBT+hohJ4vCSkozBRjECVXyQ==
X-Google-Smtp-Source: AGHT+IGNNC0w7RYXYOpW5hfyfE/U5H3BQs6Bkt7QpqHrM29CfH1fqeqy0nLgzTNUWXU4dv2Zb9uyUA==
X-Received: by 2002:a17:90b:58c4:b0:32b:a311:d1ae with SMTP id 98e67ed59e1d1-32bbe104e70mr5907239a91.10.1757116672218;
        Fri, 05 Sep 2025 16:57:52 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32bd182256bsm2629824a91.23.2025.09.05.16.57.50
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 16:57:50 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32b92d75eaeso1771484a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Sep 2025 16:57:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtb7WT1M753lydA9rJ5D8bB0UMlLFtcrN3I/IWeHICM+QTp4OP0W0a3d1rA45NFuNMGDIw2jd9/6mkWg==@lists.infradead.org
X-Received: by 2002:a17:90b:4fd0:b0:325:15bf:4dc2 with SMTP id
 98e67ed59e1d1-32d44f86e71mr623965a91.0.1757116669514; Fri, 05 Sep 2025
 16:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
 <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com> <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
In-Reply-To: <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Sep 2025 16:57:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
X-Gm-Features: Ac12FXzUu2N-pcZbzJSHRvrPWYA7cVEhjyHs0eCe7xSTQbillcbYzLxLmPy77G0
Message-ID: <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_165758_545097_7CC91676 
X-CRM114-Status: GOOD (  29.75  )
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

SGksCgpPbiBXZWQsIFNlcCAzLCAyMDI1IGF0IDQ6NTbigK9BTSB5dW5odWkgY3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBEb3Vn77yMCj4KPiBPbiBXZWQsIFNlcCAz
LCAyMDI1IGF0IDE6MDTigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+IE9uIFN1biwgQXVnIDMxLCAyMDI1IGF0IDEwOjU3
4oCvUE0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBIaSBEb3VnLAo+ID4gPgo+ID4gPiBPbiBTYXQsIEF1ZyAzMCwgMjAyNSBhdCA1OjM04oCv
QU0gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IEhpLAo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgMzoxMOKA
r0FNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBNb3ZlIHdhdGNoZG9nX2hsZC5jIHRvIGtlcm5lbC8sIGFuZCByZW5hbWUgYXJt
X3BtdV9pcnFfaXNfbm1pKCkKPiA+ID4gPiA+IHRvIGFyY2hfcG11X2lycV9pc19ubWkoKSBmb3Ig
Y3Jvc3MtYXJjaCByZXVzYWJpbGl0eS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4g
PiA+ID4gIGFyY2gvYXJtNjQva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgMSAt
Cj4gPiA+ID4gPiAgZHJpdmVycy9wZXJmL2FybV9wbXUuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAyICstCj4gPiA+ID4gPiAgaW5jbHVkZS9saW51eC9ubWkuaCAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAxICsKPiA+ID4gPiA+ICBpbmNsdWRlL2xpbnV4L3BlcmYvYXJtX3BtdS5oICAgICAg
ICAgICAgICAgICB8IDIgLS0KPiA+ID4gPiA+ICBrZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiA+ICB7YXJjaC9hcm02NC9rZXJuZWwgPT4g
a2VybmVsfS93YXRjaGRvZ19obGQuYyB8IDggKysrKysrLS0KPiA+ID4gPiA+ICA2IGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ICByZW5hbWUg
e2FyY2gvYXJtNjQva2VybmVsID0+IGtlcm5lbH0vd2F0Y2hkb2dfaGxkLmMgKDk3JSkKPiA+ID4g
Pgo+ID4gPiA+IEknbSBub3QgYSBodWdlIGZhbiBvZiB0aGUgcGVyZiBoYXJkbG9ja3VwIGRldGVj
dG9yIGFuZCBJTU8gd2Ugc2hvdWxkCj4gPiA+ID4gbWF5YmUganVzdCBkZWxldGUgaXQuIFRodXMg
c3ByZWFkaW5nIGl0IHRvIHN1cHBvcnQgYSBuZXcgYXJjaGl0ZWN0dXJlCj4gPiA+ID4gaXNuJ3Qg
bXkgZmF2b3JpdGUgdGhpbmcgdG8gZG8uIENhbid0IHlvdSB1c2UgdGhlIGJ1ZGR5IGhhcmRsb2Nr
dXAKPiA+ID4gPiBkZXRlY3Rvcj8KPiA+ID4KPiA+ID4gV2h5IGlzIHRoZXJlIGEgcGxhbiB0byBy
ZW1vdmUgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRj8gQ291bGQKPiA+ID4geW91IGV4
cGxhaW4gdGhlIHNwZWNpZmljIHJlYXNvbnM/IElzIHRoZSBjb21tdW5pdHkncyBmdXR1cmUgcGxh
biB0bwo+ID4gPiBmYXZvciBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWT8KPiA+Cj4g
PiBJIGRvbid0IHRoaW5rIHRoZXJlIGFyZSBhbnkgY29uY3JldGUgcGxhbnMsIGJ1dCB0aGVyZSB3
YXMgc29tZSBkaXNjdXNzaW9uIGhlcmU6Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL0NBRD1GVj1XV1VpQ2k2YlpDc19nc2VGcEREV05rdUpNb0w2WENmdEVvNlc3cTZqUkNrZ0Bt
YWlsLmdtYWlsLmNvbS8KPiA+Cj4gPiAtRG91Zwo+ID4KPgo+IEnigJl2ZSByZWFkIHlvdXIgbGlu
a2VkIGNvbnRlbnQsIHdoaWNoIGRldGFpbHMgdGhlIHByb3MgYW5kIGNvbnMgb2YgcGVyZgo+IHdh
dGNoZG9nIGFuZCBidWRkeSB3YXRjaGRvZy4KPiBJIHRoaW5rIGV2ZXJ5b25lIHdpbGwgYWdyZWUg
b24gY2hvb3Npbmcgb25lIGFzIHRoZSBkZWZhdWx0Lgo+IEl0IHNlZW1zIHRoZXJl4oCZcyBubyBr
ZXJuZWwvd2F0Y2hkb2cgZW50cnkgaW4gTUFJTlRBSU5FUlPigJR3aGF04oCZcyBuZXh0Cj4gZm9y
IHRoZXNlIHR3byBhcHByb2FjaGVzPwoKSSBndWVzcyB0byBzdGFydCwgc29tZW9uZSAoeW91Pykg
c2hvdWxkIHNlbmQgc29tZSBwYXRjaGVzIHRvIHRoZSBsaXN0LgpNYXliZSBvbmUgcGF0Y2ggdG8g
bWFrZSBidWRkeSB0aGUgZGVmYXVsdCBhbmQgb25lIHRvIGNoYW5nZSB0aGUKZGVzY3JpcHRpb24g
b2YgdGhlICJwZXJmIiBsb2NrdXAgZGV0ZWN0b3Igc2F5IHRoYXQgaXRzIHVzYWdlIGlzCmRpc2Nv
dXJhZ2VkLCB0aGF0IGl0IG1pZ2h0IGJlIHJlbW92ZWQsIHRoYXQgcGVvcGxlIHNob3VsZCB1c2Ug
dGhlCiJidWRkeSIgZGV0ZWN0b3IgaW5zdGVhZCwgYW5kIHRoYXQgaWYgdGhlcmUncyBhIHJlYXNv
biBzb21lb25lIG5lZWRzCnRoZSAicGVyZiIgZGV0ZWN0b3IgaW5zdGVhZCBvZiB0aGUgYnVkZHkg
b25lIHRoZW4gdGhleSBzaG91bGQgbWFrZQpzb21lIGxvdWQgbm9pc2VzLgoKWW91J2Qgd2FudCB0
byBDQyBmb2xrcyB3aG8gd2VyZSBpbnZvbHZlZCBpbiByZWNlbnQgd2F0Y2hkb2cgY2hhbmdlcwph
bmQgbWFrZSBzdXJlIHRvIENDIEFuZHJldyAoYWtwbSkuIElmIGZvbGtzIHJlYWN0IHBvc2l0aXZl
IGFuZCBBbmRyZXcKYWdyZWVzIHRoZW4gaGUnbGwgbGlrZWx5IGxhbmQgdGhlIHRoZSBwYXRjaGVz
IGFuZCB3ZSdsbCBoYXZlIG1hZGUKZm9yd2FyZCBwcm9ncmVzcy4gOi0pCgotRG91ZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
