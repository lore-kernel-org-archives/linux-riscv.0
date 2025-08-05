Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A7DC87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 03:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2Xr0zq8Vo/JZ3gP1b9wur6mxuv2T7nf5mdnyqZmEm4=; b=R9bjO7fleeZRiK
	7gigINNAFckD15H6bIHscDipXyHxPQu8JOqT/UOLVwf1JmtdnGaMwkNkOeGf6hS/G9ilSUJWqVXOz
	TZPFmNjNkzcz0VeX8dkB1jurStm1KB27Cp1SkhMReTRMapP0P+nZ965MAz74lfjMssUm1cAotQZx+
	eKAr9GzNtHxmyvP9bVZTS73ReMTMmEWzIJadvyDuTjjDd6kOIijLaom0fn7bOGjcCCm5hbAWxIm05
	eaAogIGG0TKrPnt9ApJhpAfmxrtkH4o7BGOE9+CWPtwRPt253u0GPcB9E5wfVxDHHbvE6Dy+Lz7H9
	2Ay9MauA/s5iw4/uREXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj8Vl-0000000BhDg-2sO0;
	Tue, 05 Aug 2025 03:38:49 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj8Vi-0000000BhDI-3P3S
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 03:38:48 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso3468311276.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Aug 2025 20:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754365125; x=1754969925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POVkbC6m0FbsZQCVqqY6DRqPTZCsdOevFhpQTRfzR3k=;
        b=Rp8eglZeRF0QJoa4qqYD6HOlPjqYcXuVbVmCNr+KgrXgF3HKXq9G9UWEyMSQbj0cG/
         kRrBV2tagA/9DRwuscivaVdqjWpYOzrYztxudo9d1F9ZqQqZSgdQApfWS4tQ79Xy8Qyt
         LDzadOjBiRxK+qOQte3qzssKHW+fXJ9kqMAvhiPZkgKQu3rRRJXPfT0xKzgJjJfMz07w
         i+/dwj0Saw73twMMoAhCpvNnaqbAI28PvEBMANGZfPMyHznCazxfg5B4mvb8Ysx+YngF
         TNEHY3Ys65esdcy5UCOXU1oI5WbDNFfmUNd3InZBJLutvYfaeDZoc2xiYDqELEbzKObb
         Paew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754365125; x=1754969925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POVkbC6m0FbsZQCVqqY6DRqPTZCsdOevFhpQTRfzR3k=;
        b=as5iEp5ewIlQBVAaYndKFyfoYik668eor8lGBKkKuVvGQJ1fr/b83iCRT1G5YvRW0J
         YYWbyMxKV29AeKAaqfTVA5k8YVJDs7zZRKyGZ1mXHuLlJp/PFHd2C7FqmZHEpQ1gF3SM
         Qm9DyT7AqP7jnSJaeKZ0RZDfdDfkPfiGVGE6y5eOuJC35MqplcdhQWF0H8zQtxKob4hH
         H+v0MhqjxueFk9TlxLKg03OGaQwBi/kNQHU2XDUuAKOm/j+JX5YvoiJ9ucDX3RhlGgPX
         uoRJ73hVd/A+zVnnU77VtGuc32RhU9HssJWiJfQK9OnK6wnTosDvqhL4H8zU1mrpummr
         Q3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVj4sFJnk0itrUVN6Hch7qBKBZ3arn+GGsqz0qffQ3bEozeQQPg8NEuU3hite3yWgf2fZy618I+PV+6Og==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ6LGio2MXBLU5TekLAb0vWaNjeyKBy3gzzynQazG7wJ8qg7b9
	YI0Z7pzkTnW6D8BdpLId4YFr2leMsPFg6J982oFGXouq35Aj58SIbpSRPKZm1g66SmalBDk/Wwo
	VQAAEuR/k6A/MzUNRGA2ZU9NPEui6mhnd8uREqqP2PQ==
X-Gm-Gg: ASbGnctRr3OxzhZhfEbL8HgzxSgsYwXKGDrIPAkdMtmxhF1hRapylCJx1M/0jqqr3O0
	tkr7JjcWaCRr8T3wj/shfIvlXL2xr7Fq1nD+Yuts4dQqhgVMV9REp8scUrBtwalBoBOHByDUIW5
	O0yrYVrAkKsUfaGVllBamfnGJJkXrV9CkJPCPxMmF7tfLfzZWcXH5oqHiwy6GLiYRGMOUmjCZft
	oEo61Xyx3p1++xq8k3p
X-Google-Smtp-Source: AGHT+IHQC+FWa/sBV6PObYXRFHKF0ipC8ClxXs0v16B6xElYzTA11LPuJqwPvrY3kuC7CE6fdD+FC5kTAS4MnOQ2ZQY=
X-Received: by 2002:a05:6902:4187:b0:e8e:288d:1f53 with SMTP id
 3f1490d57ef6-e8fee03324amr14194932276.26.1754365125300; Mon, 04 Aug 2025
 20:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250801070112.12071-1-nick.hu@sifive.com> <20250801-lunar-stream-0fdb3f0febec@spud>
In-Reply-To: <20250801-lunar-stream-0fdb3f0febec@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 5 Aug 2025 11:38:34 +0800
X-Gm-Features: Ac12FXwV9XevZuRxzcMDGn197rKxsHebzj--29n5CzxP2OQ9om678fcPueT4y3Y
Message-ID: <CAKddAkDMd27icz6sa5xONAiWGcb8Un8CddHKyX1=jQzH7DCvZA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: Add SiFive vendor extensions description
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_203846_888396_8625F219 
X-CRM114-Status: GOOD (  20.37  )
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

T24gU2F0LCBBdWcgMiwgMjAyNSBhdCAzOjMx4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDAxLCAyMDI1IGF0IDAzOjAxOjEyUE0gKzA4
MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiBBZGQgZGVzY3JpcHRpb24gZm9yIFNpRml2ZSB2ZW5kb3Ig
ZXh0ZW5zaW9ucyAieHNmY2ZsdXNoZGxvbmUiLAo+ID4gInhzZnBnZmx1c2hkbG9uZSIgYW5kICJ4
c2ZjZWFzZSIuIFRoaXMgaXMgdXNlZCBpbiB0aGUgU0JJCj4gPiBpbXBsZW1lbnRhdGlvbiBbMV0u
Cj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5zYmkvMjAyNTA3MDgwNzQ5
NDAuMTA5MDQtMS1uaWNrLmh1QHNpZml2ZS5jb20vCj4gPgo+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+
ID4gLSBVcGRhdGUgdGhlIG1lc3NhZ2UgdG8gaW5kaWNhdGUgdGhlIHVzZXIgb2YgdGhlIGV4dGVu
c2lvbnMuCj4KPiBUaGlzIHNob3VsZCBiZSBiZWxvdyB0aGUgLS0tIGxpbmUuCj4gV2l0aCB0aGF0
LAo+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
IGFsdGhvdWdoIEkgc3VwcG9zZSBpdCdsbCBiZSBtZSB0YWtpbmcgdGhpcyBhbmQgSSBjYW4gZml4
IGl0IHVwIG9uCj4gYXBwbGljYXRpb24/Cj4KVGhhbmtzISBUaGF0IHdvdWxkIGJlIHJlYWxseSBo
ZWxwZnVsLgoKQmVzdCBSZWdhcmRzLApOaWNrCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmljayBI
dSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBp
bmRleCBlZGU2YTU4Y2NmNTMuLjU2MzgyOTc3NTlkZiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwK
PiA+IEBAIC02NjMsNiArNjYzLDI0IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgaHR0
cHM6Ly93d3cuYW5kZXN0ZWNoLmNvbS93cC1jb250ZW50L3VwbG9hZHMvQVg0NU1QLTFDLVJldi4t
NS4wLjAtRGF0YXNoZWV0LnBkZgo+ID4KPiA+ICAgICAgICAgICMgU2lGaXZlCj4gPiArICAgICAg
ICAtIGNvbnN0OiB4c2ZjZWFzZQo+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAg
ICAgICAgICBTaUZpdmUgQ0VBU0UgSW5zdHJ1Y3Rpb24gRXh0ZW5zaW9ucyBTcGVjaWZpY2F0aW9u
Lgo+ID4gKyAgICAgICAgICAgIFNlZSBtb3JlIGRldGFpbHMgaW4KPiA+ICsgICAgICAgICAgICBo
dHRwczovL3d3dy5zaWZpdmUuY29tL2RvY3VtZW50LWZpbGUvZnJlZWRvbS11NzQwLWMwMDAtbWFu
dWFsCj4gPiArCj4gPiArICAgICAgICAtIGNvbnN0OiB4c2ZjZmx1c2hkbG9uZQo+ID4gKyAgICAg
ICAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgICBTaUZpdmUgTDFEIENhY2hlIEZsdXNo
IEluc3RydWN0aW9uIEV4dGVuc2lvbnMgU3BlY2lmaWNhdGlvbi4KPiA+ICsgICAgICAgICAgICBT
ZWUgbW9yZSBkZXRhaWxzIGluCj4gPiArICAgICAgICAgICAgaHR0cHM6Ly93d3cuc2lmaXZlLmNv
bS9kb2N1bWVudC1maWxlL2ZyZWVkb20tdTc0MC1jMDAwLW1hbnVhbAo+ID4gKwo+ID4gKyAgICAg
ICAgLSBjb25zdDogeHNmcGdmbHVzaGRsb25lCj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+
ID4gKyAgICAgICAgICAgIFNpRml2ZSBQR0ZMVVNIIEluc3RydWN0aW9uIEV4dGVuc2lvbnMgZm9y
IHRoZSBwb3dlciBtYW5hZ2VtZW50LiBUaGUKPiA+ICsgICAgICAgICAgICBDUFUgd2lsbCBmbHVz
aCB0aGUgTDFEIGFuZCBlbnRlciB0aGUgY2Vhc2Ugc3RhdGUgYWZ0ZXIgZXhlY3V0aW5nCj4gPiAr
ICAgICAgICAgICAgdGhlIGluc3RydWN0aW9uLgo+ID4gKwo+ID4gICAgICAgICAgLSBjb25zdDog
eHNmdnFtYWNjZG9kCj4gPiAgICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gICAgICAgICAgICAg
IFNpRml2ZSBJbnQ4IE1hdHJpeCBNdWx0aXBsaWNhdGlvbiBFeHRlbnNpb25zIFNwZWNpZmljYXRp
b24uCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
