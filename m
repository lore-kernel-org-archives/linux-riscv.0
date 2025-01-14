Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21166E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7XPb4B7VaAGEA92tgQGTZtk37NwdQmeISQcbewv6kM=; b=ItxS02lO+dpG2b
	MIxi8ERQIYlmsaRaoyjk0OHzZUKrjWiJ02S7elv+WXSwtjhJLoCw1c52jpayRZ7TSyH4cRRPSh83k
	oJ27ErsWbcQalsanhMdr/wDOLFQ4thnPiGdK8BXPAWbp0TiSziXlJpv6BzAPPzcfyQhnpGn6Meq78
	l1D6271TLATKCh0fEGR4Yrn8u5mDTkDyxwgS57WuA8axbKpgDV8JMpVC4hGS6av89VcZwphpWRjnf
	kBRT7UfRQ958ySNFU29JErse5vsvWW4zg2oeA3oOvCgOyWWigxQHenDECwYZvIrQySQ3DXQybUADD
	KRsjN4FJEuXvLooc1bog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfsR-00000008N3H-0UlW;
	Tue, 14 Jan 2025 12:18:35 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfrC-00000008Mnm-0EuY
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 12:17:19 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2a3c075ddb6so2770749fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 04:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736857033; x=1737461833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4INfH/TpDecneo+NlcBviw89emu+iz2WYGUG/aV6WRg=;
        b=NhnCniRQrasJDrjDSn4mjGQ6meG9AKRyJwZ0SsHoLkL/2qkZ2QLgpe4y/gy1jEFkk8
         cf3H1lTDB4F3qqqZm5vHdu1FA9wHpBFSePQo31qQRqJAT2Fvx2BsFixcYDqdyVckbsqv
         Htyk0zZdUtvL1Prh7fDazl95niPjqgSpwGuxqWfERXUQqhUKCVLoABu4qvXBAhQJt2FO
         AWE+heCULiKAkFtVhvcjNCFlXecmsqAIGf1YsnmykbXAsrLpDy3iS6iSIJe5gy4nFp5u
         vkhECZiIFS9TBRkgspIgEPBJLCZg7+BXgvdMOyj3V77XhGqAQOtkBewp7O3kxBAIW26W
         EnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857033; x=1737461833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4INfH/TpDecneo+NlcBviw89emu+iz2WYGUG/aV6WRg=;
        b=d4O3q+2SlsTt/Jdv3kTZIogVT06DXxhio1y/+5v6zQeh7ZxeQw0io0swPqj3SYz0QA
         ONyN5KCFlIt8Zpc1S01/Ah0OE36ggx3eDiber8NExbG7G7BJW1/SI2HBAGCybmqGOMOG
         F+ykbYUwo+sXRb8wGfgrlyblkUVqrbFr5ts7WtVZOdfByDazKsA07Inng0mirDB1sxRR
         ah24MJh3ihdg2L3+v3WID/uNgo1gc/Pwb4TmH3yKnLx4hts3SFN5HibyMMJ5p50Xl/M3
         r1dihtCipdyL/SQzislj/a3DuR6wy6xGck0TIPNGPNBqkfJzRPRonpulK707Mfcrml0y
         c5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXZu2bZ2Q4g0sFGXCx8FibBW6WQ+O/v9ZskQf910sMxNBaYixNVOpyNVxTscPln06I2ygnklSPp5xdq7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLdkVfO0tS6yjZXM8O/MhJdj9c/l9eNYi3O1nT5i2JC4Vv7vWk
	aQt8nrpiPYeRzVuGT7obYnINm0u+tak+f6HDKuy4aJTB3E1SaZqrl6POD2Zq6cNnNt5CTgrLoj0
	RthTF+C6qfUAgBG1klBM2ouSE9TQLt6Pyy6RBmQ==
X-Gm-Gg: ASbGnct7O2eIsZgqhF+EWag5XMvIT50Eb+tt3cuuwkx26ixDHverPPn/CPBC3Y6+203
	viWDOQBv3cSOf6SI7U/6QYDPKWb1TH/B+aYMy+BZn
X-Google-Smtp-Source: AGHT+IEHZGO4c+aev0xCDPbWA8bFqbqbN4JnHG7sydhDT0QCnIP1LpjWakccU3G6ykFeEWt7fgi7ZuQ99Z3j1cufJsc=
X-Received: by 2002:a05:6870:c8c:b0:29e:55c1:229a with SMTP id
 586e51a60fabf-2aa06678512mr15178648fac.14.1736857033256; Tue, 14 Jan 2025
 04:17:13 -0800 (PST)
MIME-Version: 1.0
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-3-cuiyunhui@bytedance.com> <7c181d03-b0d0-4b81-bbd0-06943a58a287@sifive.com>
In-Reply-To: <7c181d03-b0d0-4b81-bbd0-06943a58a287@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 14 Jan 2025 20:17:02 +0800
X-Gm-Features: AbW1kvZgoWRu28_ou5khJ-oDrc4uTs3sOn70Kk7VVMM2aZm0JHVssnRohhN4zrs
Message-ID: <CAEEQ3wm7-O5U3jjbQ1+XgVvk+G7csMPAxzGoV=K5WczCOsbQ5g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
To: Samuel Holland <samuel.holland@sifive.com>
Cc: ajones@ventanamicro.com, alexghiti@rivosinc.com, andybnac@gmail.com, 
	aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com, 
	conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net, 
	evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_041718_242419_8C0061D7 
X-CRM114-Status: GOOD (  23.47  )
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

SGkgU2FtdWVs77yMCgpPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCAxOjI44oCvUE0gU2FtdWVsIEhv
bGxhbmQKPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+
Cj4gT24gMjAyNS0wMS0xMyA4OjE5IFBNLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gRXhwb3NlIFpp
Y2JvbSB0aHJvdWdoIGh3cHJvYmUgYW5kIGFsc28gcHJvdmlkZSBhIGtleSB0byBleHRyYWN0IGl0
cwo+ID4gcmVzcGVjdGl2ZSBibG9jayBzaXplLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1
aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDYgKysrKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od3Byb2JlLmggICAgICB8IDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oIHwgMiArKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2Jl
LmMgICAgICAgfCA2ICsrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QK
PiA+IGluZGV4IDk1NWZiY2QxOWNlOS4uMGVhNzc1NGIyMDQ5IDEwMDY0NAo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+IEBAIC0yNDIsNiArMjQyLDkgQEAgVGhlIGZvbGxv
d2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4gICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9F
WFRfU1VQTWA6IFRoZSBTdXBtIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKPiA+ICAgICAgICAg
ZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFBvaW50ZXIgTWFza2luZyBleHRl
bnNpb25zLgo+ID4KPiA+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPTWA6
IFRoZSBaaWNib20gZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKPiA+ICsgICAgICAgcmF0aWZp
ZWQgaW4gY29tbWl0IDNkZDYwNmYgKCJDcmVhdGUgY21vYmFzZS12MS4wLnBkZiIpIG9mIHJpc2N2
LUNNT3MuCj4gPiArCj4gPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8w
YDogRGVwcmVjYXRlZC4gIFJldHVybnMgc2ltaWxhciB2YWx1ZXMgdG8KPiA+ICAgICAgIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0tFWV9NSVNBTElHTkVEX1NDQUxBUl9QRVJGYCwgYnV0IHRoZSBr
ZXkgd2FzCj4gPiAgICAgICBtaXN0YWtlbmx5IGNsYXNzaWZpZWQgYXMgYSBiaXRtYXNrIHJhdGhl
ciB0aGFuIGEgdmFsdWUuCj4gPiBAQCAtMjgxLDYgKzI4NCw5IEBAIFRoZSBmb2xsb3dpbmcga2V5
cyBhcmUgZGVmaW5lZDoKPiA+ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9NSVNBTElH
TkVEX1ZFQ1RPUl9QRVJGYDogQW4gZW51bSB2YWx1ZSBkZXNjcmliaW5nIHRoZQo+ID4gICAgICAg
cGVyZm9ybWFuY2Ugb2YgbWlzYWxpZ25lZCB2ZWN0b3IgYWNjZXNzZXMgb24gdGhlIHNlbGVjdGVk
IHNldCBvZiBwcm9jZXNzb3JzLgo+ID4KPiA+ICsqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tF
WV9aSUNCT01fQkxPQ0tfU0laRWA6IEFuIHVuc2lnbmVkIGludCB3aGljaAo+ID4gKyAgcmVwcmVz
ZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm9tIGJsb2NrIGluIGJ5dGVzLgo+ID4gKwo+ID4gICAg
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1ZFQ1RPUl9VTktOT1dOYDogVGhl
IHBlcmZvcm1hbmNlIG9mIG1pc2FsaWduZWQKPiA+ICAgICAgdmVjdG9yIGFjY2Vzc2VzIGlzIHVu
a25vd24uCj4KPiBUaGUgbmV3IGtleSBuZWVkcyB0byBnbyBmdXJ0aGVyIGRvd24sIGJlbG93IHRo
aXMgbGlzdCBvZiBwb3NzaWJsZSB2YWx1ZXMgZm9yIHRoZQo+IHByZXZpb3VzIGtleS4KSSBndWVz
cyB5b3UgbWVhbiB0byBwdXQgaXQgYWZ0ZXIKUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1ZFQ1RP
Ul9VTlNVUFBPUlRFRCwgcmlnaHQ/Cgo+Cj4gUmVnYXJkcywKPiBTYW11ZWwKPgo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gPiBpbmRleCAxY2UxZGY2ZDBmZjMuLjg5Mzc5ZjlhMmU2
ZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+ID4gQEAgLTgsNyArOCw3IEBA
Cj4gPgo+ID4gICNpbmNsdWRlIDx1YXBpL2FzbS9od3Byb2JlLmg+Cj4gPgo+ID4gLSNkZWZpbmUg
UklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDEwCj4gPiArI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9L
RVkgMTEKPiA+Cj4gPiAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X2h3cHJvYmVfa2V5X2lzX3Zh
bGlkKF9fczY0IGtleSkKPiA+ICB7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmgKPiA+IGluZGV4IDNhZjE0MmI5OWY3Ny4uYjE1YzBiZDgzZWYyIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4gQEAgLTczLDYgKzczLDcgQEAgc3RydWN0
IHJpc2N2X2h3cHJvYmUgewo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVf
RVhUX1pDTU9QICAgICAgICAgKDFVTEwgPDwgNDcpCj4gPiAgI2RlZmluZSAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9FWFRfWkFXUlMgICAgICAgICAoMVVMTCA8PCA0OCkKPiA+ICAjZGVmaW5l
ICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9TVVBNICAgICAgICAgICgxVUxMIDw8IDQ5
KQo+ID4gKyNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPTSAgICAg
ICAgKDFVTEwgPDwgNTApCj4gPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAg
IDUKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5L
Tk9XTiAgICAgICAgKDAgPDwgMCkKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BS
T0JFX01JU0FMSUdORURfRU1VTEFURUQgICAgICAgKDEgPDwgMCkKPiA+IEBAIC05NCw2ICs5NSw3
IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1NMT1cgICAgICAgICAgICAyCj4gPiAgI2RlZmlu
ZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1ZFQ1RPUl9GQVNUICAgICAg
ICAgICAgMwo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05F
RF9WRUNUT1JfVU5TVVBQT1JURUQgICAgIDQKPiA+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZ
X1pJQ0JPTV9CTE9DS19TSVpFICAxMQo+ID4gIC8qIEluY3JlYXNlIFJJU0NWX0hXUFJPQkVfTUFY
X0tFWSB3aGVuIGFkZGluZyBpdGVtcy4gKi8KPiA+Cj4gPiAgLyogRmxhZ3MgKi8KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX2h3cHJvYmUuYwo+ID4gaW5kZXggY2I5M2FkZmZmYzQ4Li4wNDE1MGU2MmY5OTggMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiBAQCAtMTA2LDYgKzEwNiw3IEBAIHN0
YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4g
PiAgICAgICAgICAgICAgIEVYVF9LRVkoWkNBKTsKPiA+ICAgICAgICAgICAgICAgRVhUX0tFWSha
Q0IpOwo+ID4gICAgICAgICAgICAgICBFWFRfS0VZKFpDTU9QKTsKPiA+ICsgICAgICAgICAgICAg
RVhUX0tFWShaSUNCT00pOwo+ID4gICAgICAgICAgICAgICBFWFRfS0VZKFpJQ0JPWik7Cj4gPiAg
ICAgICAgICAgICAgIEVYVF9LRVkoWklDT05EKTsKPiA+ICAgICAgICAgICAgICAgRVhUX0tFWSha
SUhJTlROVEwpOwo+ID4gQEAgLTI3OCw2ICsyNzksMTEgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9v
bmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ICAgICAgICAgICAgICAgaWYg
KGh3cHJvYmVfZXh0MF9oYXMoY3B1cywgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aKSkKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IHJpc2N2X2Nib3pfYmxvY2tfc2l6ZTsK
PiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZ
X1pJQ0JPTV9CTE9DS19TSVpFOgo+ID4gKyAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IDA7Cj4g
PiArICAgICAgICAgICAgIGlmIChod3Byb2JlX2V4dDBfaGFzKGNwdXMsIFJJU0NWX0hXUFJPQkVf
RVhUX1pJQ0JPTSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgPSByaXNj
dl9jYm9tX2Jsb2NrX3NpemU7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgY2Fz
ZSBSSVNDVl9IV1BST0JFX0tFWV9ISUdIRVNUX1ZJUlRfQUREUkVTUzoKPiA+ICAgICAgICAgICAg
ICAgcGFpci0+dmFsdWUgPSB1c2VyX21heF92aXJ0X2FkZHIoKTsKPiA+ICAgICAgICAgICAgICAg
YnJlYWs7Cj4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
