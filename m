Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE8FCCD187
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 00:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Meqqkv9aqni+u+I6/i3R76ZWS1ZwtJ8WWb43zVAfnEE=; b=3Qr7GDw6TkafYe
	89VNbHf1v8TlQljAh5tgPWF7sv8KNjHFfsoKmuPJgM+yRnkDHM/wJoZUmUCBXtjUfAUTzH0QIJ3kN
	4O0N0uP/fuQIaqd425RrLNj18R6DfgwyP8yH2QB/Io9ZmFbqFtbxWylCtQJsrffiQgHPR46ZIpzxG
	JNL5YiyFYqVGiDAaAQ562QhvvGJGqPm5r3LPVmvEcKy8r5gZu8k18Fj7+IGZEefksAu49uSuadigx
	gXZtfKWPBoDC8VA9af34/jeE/6olyIcwEx4JYXyw7DKs8gKuyG4F3mlsyedCnp2ky6mtdXiX7qUl4
	LT7uH0orvmtYwW++iJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86S9-0000000BzeG-0fUe;
	Mon, 13 Oct 2025 00:30:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86S6-0000000Bzdw-33Zd
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 00:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9BF044E44
	for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 00:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FEFC19423
	for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760315412;
	bh=Ftqnj4KaATzLCXTBXiHFa8DQwKVVMfZ4GfmyMx/ZjEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XGyqI9Sm66vBEFhZpDoexjnIsKxIQaemKUhG+yrFcf989TLgbGfnjR8v/+TBNu3DB
	 MwTNm6jINMRxiHpxKt+RzwI+SghoXdxYKwyot7XC4bh1fXRJNY5SCMDYVnrzMP3d0/
	 EcEJ5glyvPWLKgO7nquwTsKtfDT3jayyfHi6psy/WqbUatafKqdNYwJngQpRnYwoj5
	 XKz+aeLMisqCUTzIfyGi0RJQjBXtGXVasofModjF1WfCnOmMq6XFu8JoR/zAxzJXhJ
	 m+MhKqEDSELVByzu09xhtliLQIts7mhDQLqxZFSSOZpHvnYUPU7hPeSaXaCfYGG05B
	 hm09HfsjLRYhA==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f44000626bso2558507f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 17:30:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqq35pYMmmPNg/zwXDxAiuDm83qZOFSUBKXDShQ8S+numYg+cxLYxF7q3neLFawh1C/tUrYiwbDYGJsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+hhr03hy4t9kF6Lkf6rEdT7sYkUHFZpfqR8L5TpZoM5RtU0pC
	IOuqc71lG+TJw4Nl9wh7S1G29tOODViYna47xRxuF77UigRIB7qbM5KSrI2F5bO8lPdAYSYKdt+
	Ls2EQrOIpSAaxf2IwmrrC6DKIoX/bHtw=
X-Google-Smtp-Source: AGHT+IF28hGFEYqy29BMAFT4KFXlhAWSW7TtE/VIwFlQvB8Cdfl8PzF88CzrL2eeItCVIJ5zgOvuDFGeYxdYMM4z/hs=
X-Received: by 2002:a05:6000:2891:b0:3ee:1523:2310 with SMTP id
 ffacd0b85a97d-4266e7c203emr13067865f8f.27.1760315411080; Sun, 12 Oct 2025
 17:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251011155746.1558731-1-guoren@kernel.org> <CAK9=C2UrYg+sHsDqkmz7f7KnaREU7hXF4rbON002cnAti_pDXg@mail.gmail.com>
 <CAJF2gTR9VbOcBQOfF6Tqsp00289mypYExi2iGeKhwTu-iDS+aA@mail.gmail.com>
In-Reply-To: <CAJF2gTR9VbOcBQOfF6Tqsp00289mypYExi2iGeKhwTu-iDS+aA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Oct 2025 08:29:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRwW+0-nAvagfBf8U9vbUWocvCaNfYNVrCN+d2hYxdBYg@mail.gmail.com>
X-Gm-Features: AS18NWCS67Vw69jJgG0u0GE_175z0kD2HPQ7-bp5JgDUnjIYl49Fw2qPHcn4IW4
Message-ID: <CAJF2gTRwW+0-nAvagfBf8U9vbUWocvCaNfYNVrCN+d2hYxdBYg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add pgprot_dmacoherent definition
To: Anup Patel <apatel@ventanamicro.com>
Cc: samuel.holland@sifive.com, david@redhat.com, yongxuan.wang@sifive.com, 
	cuiyunhui@bytedance.com, luxu.kernel@bytedance.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_173014_866833_54723820 
X-CRM114-Status: GOOD (  30.87  )
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgNzo1MOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFN1biwgT2N0IDEyLCAyMDI1IGF0IDExOjUx4oCvUE0gQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgT2N0
IDExLCAyMDI1IGF0IDk6MjjigK9QTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5l
bC5vcmc+Cj4gPiA+Cj4gPiA+IFJJU0MtViBTdnBibXQgU3RhbmRhcmQgRXh0ZW5zaW9uIGZvciBQ
YWdlLUJhc2VkIE1lbW9yeSBUeXBlcwo+ID4gPiBkZWZpbmVzIHRocmVlIG1vZGVzOgo+ID4gPgo+
ID4gPiAgTW9kZSB8IFZhbHVlIHwgUmVxdWVzdGVkIE1lbW9yeSBBdHRyaWJ1dGVzCj4gPiA+ICBQ
TUEgIHwgICAwICAgfCBOb25lCj4gPiA+ICBOQyAgIHwgICAxICAgfCBOb24tY2FjaGVhYmxlLCBp
ZGVtcG90ZW50LCB3ZWFrbHktb3JkZXJlZCAoUlZXTU8pLAo+ID4gPiAgICAgICB8ICAgICAgIHwg
bWFpbiBtZW1vcnkKPiA+ID4gIElPICAgfCAgIDIgICB8IE5vbi1jYWNoZWFibGUsIG5vbi1pZGVt
cG90ZW50LCBzdHJvbmdseS1vcmRlcmVkCj4gPiA+ICAgICAgIHwgICAgICAgfCAoSS9PIG9yZGVy
aW5nKSwgSS9PCj4gPiA+Cj4gPiA+IFRoZSBwZ3Byb3RfZG1hY29oZXJlbnQgZGVmYXVsdCB1c2Vz
IHRoZSBJTyBtZW1vcnkgYXR0cmlidXRlIGlmIHRoZXJlCj4gPiA+IGlzIG5vIGFzbSBkZWZpbml0
aW9uLCBidXQgSU8gaXMgbm90IGZvciBtYWluIG1lbW9yeSBhY2NvcmRpbmcgdG8KPiA+ID4gU3Zw
Ym10IHJ1bGVzLgo+ID4gPgo+ID4gPiBUaGlzIGNvbW1pdCBjb3JyZWN0cyBwZ3Byb3RfZG1hY29o
ZXJlbnQgd2l0aCB0aGUgTkMgbWVtb3J5IGF0dHJpYnV0ZSwKPiA+ID4gd2hpY2ggc2F0aXNmaWVz
IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGFuZCBwcmV2ZW50cyB1c2luZyB0aGUgSU8KPiA+ID4g
YXR0cmlidXRlIHRvIGFjY2VzcyBtYWluIG1lbW9yeS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+
Cj4gPiBJIGhhZCBzZW50IHRoZSBzYW1lIHBhdGNoIG9uIEF1ZyAyMCBhbmQgeW91IGhhZCBwcm92
aWRlZAo+ID4gVGVzdGVkLWJ5IHRvIHRoYXQgcGF0Y2guCj4gPgo+ID4gSWYgeW91IGhhZCBjb25j
ZXJucyB3aXRoIG15IHBhdGNoIHRoZW4geW91IGNvdWxkIGhhdmUgcHJvdmlkZWQKPiA+IGNvbW1l
bnRzIGJ1dCB5b3UgY2hvb3NlIHRvIGhpamFjayBpdCBhbmQgY2hhbmdlIGF1dGhvcnNoaXAuCj4g
SSBkaWRuJ3QgZmluZCB5b3VyIHBhdGNoIGF0IGZpcnN0LCBzbyBJIHNlbnQgaXQgb3V0LiBXaGVu
IEkgZGlzY292ZXJlZAo+IHlvdXIgcGF0Y2gsIEkgZ2F2ZSB0aGUgVGVzdGVkLWJ5IHRvIHlvdXJz
Lgo+IEkndmUgYWRkZWQgdGhlIGFiYW5kb25lZCByZXBseSB0byB0aGlzIHRocmVhZC4gSGF2ZSB5
b3Ugc2VlbiB0aGF0IFsxXT8KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FK
RjJnVFJmTHpycUhvWXJleFM1NUFUM3NqbjVWYmJOS2YyV01FR1dydzlFUlJMWVlBQG1haWwuZ21h
aWwuY29tLwoKVGhpcyBwYXRjaCBpcyBvbiBTYXQsIE9jdCAxMSwgMjAyNSBbMV0KR3VvJ3MgVGVz
dGVkLWJ5IGlzIG9uIFN1biwgMTIgT2N0IDIwMjUgMDI6MDc6MzQgWzJdCkFiYW5kb24gcmVwbHkg
aXMgb24gU3VuLCAxMiBPY3QgMjAyNSAxNDoxMTo0MiBbM10KR2FvJ3MgVGVzdGVkLWJ5IGlzIG9u
IFN1biwgMTIgT2N0IDIwMjUgMTg6MDA6MzYgWzRdCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI1MTAxMTE1NTc0Ni4xNTU4NzMxLTEtZ3VvcmVuQGtlcm5lbC5vcmcvClsyXTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvYU90UjM5cGw1eGp5WUhuMUBnbWFp
bC5jb20vClszXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBSkYyZ1RSZkx6cnFIb1ly
ZXhTNTVBVDNzam41VmJiTktmMldNRUdXcnc5RVJSTFlZQUBtYWlsLmdtYWlsLmNvbS8KWzRdOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8wMzEzOTVGRS1DNTFDLTQ1QTctODVB
My1DQzRBMjVFQjYwNjZAZ21haWwuY29tLwoKSSBhbHNvIGFza2VkIEdhbyB0byBub3RpY2UgeW91
ciBwYXRjaCBhbmQgZ2l2ZSBpdCB0aGUgVGVzdGVkLWJ5IHRhZy4KVGhhdCdzIHdoeSB5b3UgZ290
IHR3byBUZXN0ZWQtYnkgb24gT2N0IDEyIGFmdGVyIHR3byBtb250aHMuIFNvLCB5b3VyCnJlcGx5
LCAiYnV0IHlvdSBjaG9vc2UgdG8gaGlqYWNrIGl0IGFuZCBjaGFuZ2UgYXV0aG9yc2hpcCwiIG1h
a2VzIG1lCnNhZC4KCkFueXdheSwgaXQncyBhIHZpdGFsIGZpeHVwIHBhdGNoIHRoYXQgcmVzb2x2
ZWQgdGhlIGJ1ZyB0aGF0IGhhZApleGlzdGVkIGZvciBtYW55IHllYXJzIG9mIHN2cGJtdCwgYW5k
IEkgaG9wZSB0aGlzIG1pc3VuZGVyc3RhbmRpbmcgY2FuCmRyYXcgdGhlIG1haW50YWluZXJzJyBh
dHRlbnRpb24gYW5kIGdhaW4gbW9yZSBUZXN0ZWQtYnkgdGFncy4KCj4KPiA+Cj4gPiBSZWdhcmRz
LAo+ID4gQW51cAo+ID4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaCB8IDkgKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+IGluZGV4IDI5ZTk5
NGE5YWZiNi4uMmE4NDQ3OWRlODFiIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaAo+ID4gPiBAQCAtNjU0LDYgKzY1NCwxNSBAQCBzdGF0aWMgaW5saW5lIHBncHJvdF90IHBn
cHJvdF93cml0ZWNvbWJpbmUocGdwcm90X3QgX3Byb3QpCj4gPiA+ICAgICAgICAgcmV0dXJuIF9f
cGdwcm90KHByb3QpOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArLyoKPiA+ID4gKyAqIERNQSBhbGxv
Y2F0aW9ucyBmb3Igbm9uLWNvaGVyZW50IGRldmljZXMgdXNlIHdoYXQgdGhlIFJJU0MtViBhcmNo
aXRlY3R1cmUKPiA+ID4gKyAqIGNhbGwgIk5vbi1DYWNoZWFibGUiIG1lbW9yeSBhdHRyaWJ1dGUs
IHdoaWNoIHBlcm1pdHMgaWRlbXBvdGVudCwgd2Vha2x5LW9yZGVyZWQKPiA+ID4gKyAqIChSVldN
TyksIG1haW4gbWVtb3J5LiBUaGlzIGlzIGRpZmZlcmVudCBmcm9tICJJL08iIG1lbW9yeSBhdHRy
aWJ1dGUgd2hpY2ggaXMKPiA+ID4gKyAqIGludGVuZGVkIGZvciBNTUlPIGFjY2VzcyB3aXRoIE5v
bi1jYWNoZWFibGUsIG5vbi1pZGVtcG90ZW50LCBzdHJvbmdseS1vcmRlcmVkCj4gPiA+ICsgKiAo
SS9PIG9yZGVyaW5nKSwgSS9PIGF0dHJpYnV0ZXMuCj4gPiA+ICsgKi8KPiA+ID4gKyNkZWZpbmUg
cGdwcm90X2RtYWNvaGVyZW50IHBncHJvdF93cml0ZWNvbWJpbmUKPiA+ID4gKwo+ID4gPiAgLyoK
PiA+ID4gICAqIEJvdGggU3ZhZGUgYW5kIFN2YWR1IGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJlaGF2
aW9yIHdoZW4gdGhlIFBURSBBL0QgYml0cyBuZWVkIHRvIGJlIHNldC4gQnkKPiA+ID4gICAqIGRl
ZmF1bHQgdGhlIE0tbW9kZSBmaXJtd2FyZSBlbmFibGVzIHRoZSBoYXJkd2FyZSB1cGRhdGluZyBz
Y2hlbWUgd2hlbiBvbmx5IFN2YWR1IGlzIHByZXNlbnQgaW4KPiA+ID4gLS0KPiA+ID4gMi40MC4x
Cj4gPiA+Cj4gPiA+Cj4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgoKCgotLSAK
QmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
