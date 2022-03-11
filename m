Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A637EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/fEDnb43a67ywxnevvEuVxvtchG8e7kHm5kUNFbxcM=; b=yPpzzjK9/ff6rI
	LGPH/Yi5SVPjptdhfEGlDZILojETy3gXkurA11hpDSGLXQ6mBfJmZO3BPfSmg0Ii7HEOIfD5xBgpv
	/QsmkO7s5HLAppzKqIdj24rU+PYWqFVz/CQr2yKJRxpntRozfdNoS5KElOfUMkEC6vuPEsZ5kmDZW
	oAPv6aedxXFDgYXpLrhoNwcskO0IuBNCSy8Eu9faalZVCoZr533rffr+NM08mlYFM9kuSlJr18jKN
	JrxaWKc0NONb0HG3rUp1iCfnjuhObn+WlXyJ2IC6ZbTYJrnAOdBWfavgrZxJe7o0/s5nXzt2PTJ3M
	x8rRT6O4pKwliSNR6I8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSf2f-00GSXq-5n; Fri, 11 Mar 2022 13:10:49 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSf2X-00GSTp-VZ
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 13:10:47 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bt26so14991289lfb.3
 for <linux-riscv@lists.infradead.org>; Fri, 11 Mar 2022 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1zLYRFICp/9YNZ3C/JM0L5WZ5qjBhMXFH4zYngCLz0k=;
 b=ipz8gco+55GK0rSfRsuzxgY9EQVCMIwj2GHWKxq3MizJnLDEkxPQljV15yw764Zm8F
 XmLgGYBG1v9yIcweK/5W8k2o7O4FpjTEZXoaYvL3FqwfXVRtz/KhaNphSB7gHFiub9Dm
 XGJMd22wCooz8mO0cXNEqoLu1lAp/DICy8o1EVFD5JRC4B+Q9GqoejI9zH7thQz/W6eS
 P/Pre2BkamthiLAyFOy5V0xMoVsHsTQDjTndFhyT8aH/0I3n1SBmGAov6GMpps1QKVW/
 sAuhPEUuBOpVXngOk45pQo6rui2tJNa6mQJmMU+M1jlzovIOAqjsPpEDmK+pex1Hh+gq
 FWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1zLYRFICp/9YNZ3C/JM0L5WZ5qjBhMXFH4zYngCLz0k=;
 b=DJ3SrcsWzbz14AINzU53TEXSM+KGoI7xfcwL6OF9mHAb+GeLTN25HkrqxCqclx9jT8
 F3aIrkJVJUnE4kqgIjJIdw6OFVRe9sF3zYbpMRDk+KV3D4lcx6AcPOGKYb1oIgCizf+f
 KU7exvGmFppUKdYqrC6cKU7Srydfv+QVc9NafECW/fGCwr1XrGMoKriBFsLe6UifY29Y
 pTuuSP3BvUER6MRsdRzbMe2lZUcNnaRIHXxYy/GFSNHY4ZUOUPGpnPm4NTexe1++FFmj
 ++RSsBJ7jy9HhScHBVhIczyrhFrXgMIZekf5TcXGDtxjDr2p5TpGtWa/WE2TCFNxl1J4
 sNag==
X-Gm-Message-State: AOAM532Ld1vFBKHJY1NvOrOugQ1Kq7DecFQBAgbG/jlGQPPpCmqZkwqJ
 3P7LGRZrQsfNjP2y4p2rdeDoG7KvVul9De+ld5uWmg==
X-Google-Smtp-Source: ABdhPJw8d+Eupsr/72x4wRsKG4WURFHxUpziwGdPCq7z7GnXpzTcZkwbs48/yGlotHpniBkmpww0hE2GyL2F/8YcUyg=
X-Received: by 2002:ac2:4146:0:b0:441:efd2:365d with SMTP id
 c6-20020ac24146000000b00441efd2365dmr6194423lfi.100.1647004239469; Fri, 11
 Mar 2022 05:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20220222204811.2281949-1-atishp@rivosinc.com>
 <mhng-4593ea1e-503d-47df-8e55-d2ef06f01518@palmer-ri-x1c9>
 <CAHBxVyHaFk6mx_uTUcOG1d+XGokT_-Y3_Y1kVJixAnGGmLjAxg@mail.gmail.com>
 <d8d4fedad13ef063b672aadfe2ee0aff@mailhost.ics.forth.gr>
In-Reply-To: <d8d4fedad13ef063b672aadfe2ee0aff@mailhost.ics.forth.gr>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 11 Mar 2022 18:40:28 +0530
Message-ID: <CAK9=C2WZCp2aKnFTVN0iDqDxVgV6WMFzsM+a9a1Q8Go_n6iMkw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Provide a fraemework for RISC-V ISA extensions
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Atish Kumar Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_051042_053629_E4B1C555 
X-CRM114-Status: GOOD (  36.35  )
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

T24gRnJpLCBNYXIgMTEsIDIwMjIgYXQgNjoxMyBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMjItMDMtMTEgMDI6MjEsIEF0aXNoIEt1
bWFyIFBhdHJhIM6tzrPPgc6xz4jOtToKPiA+IE9uIFRodSwgTWFyIDEwLCAyMDIyIGF0IDM6NTAg
UE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiA+IHdyb3RlOgo+ID4+Cj4g
Pj4gT24gVHVlLCAyMiBGZWIgMjAyMiAxMjo0ODowNSBQU1QgKC0wODAwKSwgQXRpc2ggUGF0cmEg
d3JvdGU6Cj4gPj4gPiBUaGlzIHNlcmllcyBpbXBsZW1lbnRzIGEgZ2VuZXJpYyBmcmFtZXdvcmsg
dG8gcGFyc2UgbXVsdGktbGV0dGVyIElTQQo+ID4+ID4gZXh0ZW5zaW9ucy4gVGhpcyBzZXJpZXMg
aXMgYmFzZWQgb24gVHN1a2FzYSdzIHYzIGlzYSBleHRlbnNpb24gaW1wcm92ZW1lbnQKPiA+PiA+
IHNlcmllc1sxXS4gSSBoYXZlIGZpeGVkIGZldyBidWdzIGFuZCBpbXByb3ZlZCBjb21tZW50cyBm
cm9tIHRoYXQgc2VyaWVzCj4gPj4gPiAoUEFUQ0gxLTMpLiBJIGhhdmUgbm90IHVzZWQgUEFUQ0gg
NCBmcm9tIHRoYXQgc2VyaWVzIGFzIHdlIGFyZSBub3QgdXNpbmcKPiA+PiA+IElTQSBleHRlbnNp
b24gdmVyc2lvbmluZyBhcyBvZiBub3cuIFdlIGNhbiBhZGQgdGhhdCBsYXRlciBpZiByZXF1aXJl
ZC4KPiA+PiA+Cj4gPj4gPiBQQVRDSCA0IGFsbG93cyB0aGUgcHJvYmluZyBvZiBtdWx0aS1sZXR0
ZXIgZXh0ZW5zaW9ucyB2aWEgYSBtYWNyby4KPiA+PiA+IEl0IGNvbnRpbnVlcyB0byB1c2UgdGhl
IGNvbW1vbiBpc2EgZXh0ZW5zaW9ucyBiZXR3ZWVuIGFsbCB0aGUgaGFydHMuCj4gPj4gPiBUaHVz
IGhldGVyZ2Vub3VzIGhhcnQgc3lzdGVtcyB3aWxsIG9ubHkgc2VlIHRoZSBjb21tb24gSVNBIGV4
dGVuc2lvbnMuCj4gPj4gPgo+ID4+ID4gUEFUQ0ggNiBpbXByb3ZlcyB0aGUgL3Byb2MvY3B1aW5m
byBpbnRlcmZhY2UgZm9yIHRoZSBhdmFpbGFibGUgSVNBIGV4dGVuc2lvbnMKPiA+PiA+IHZpYSAv
cHJvYy9jcHVpbmZvLgo+ID4+ID4KPiA+PiA+IEhlcmUgaXMgdGhlIGV4YW1wbGUgb3V0cHV0IG9m
IC9wcm9jL2NwdWluZm86Cj4gPj4gPiAod2l0aCBkZWJ1ZyBwYXRjaGVzIGluIFFlbXUgYW5kIExp
bnV4IGtlcm5lbCkKPiA+PiA+Cj4gPj4gPiAjIGNhdCAvcHJvYy9jcHVpbmZvCj4gPj4gPiBwcm9j
ZXNzb3IgICAgIDogMAo+ID4+ID4gaGFydCAgICAgICAgICA6IDAKPiA+PiA+IGlzYSAgICAgICAg
ICAgOiBydjY0aW1hZmRjaAo+ID4+ID4gaXNhLWV4dCAgICAgICAgICAgICAgIDogc3ZwYm10IHN2
bmFwb3Qgc3ZpbnZhbAo+ID4+Cj4gPj4gSSBrbm93IGl0IG1pZ2h0IHNlZW0gYSBiaXQgcGVkYW50
aWMsIGJ1dCBJIHJlYWxseSBkb24ndCB3YW50IHRvCj4gPj4gaW50cm9kdWNlIGEgbmV3IGZvcm1h
dCBmb3IgZW5jb2RpbmcgSVNBIGV4dGVuc2lvbnMgLS0gZG91Ymx5IHNvIGlmCj4gPj4gdGhpcwo+
ID4+IGlzIHRoZSBvbmx5IHdheSB3ZSdyZSBnaXZpbmcgdGhpcyBpbmZvIHRvIHVzZXJzcGFjZSwg
YXMgdGhlbiB3ZSdyZQo+ID4+IGp1c3QKPiA+PiBhc2tpbmcgZm9sa3MgdG8gdHVybiB0aGlzIGlu
dG8gYSBkZWZhY3RvIEFCSS4gIEV2ZXJ5IHRpbWUgd2UgdHJ5IHRvIGRvCj4gPj4gc29tZXRoaW5n
IHRoYXQncyBzb3J0IG9mIGxpa2UgYW4gSVNBIHN0cmluZyBidXQgbm90IGV4YWN0bHkgd2hhdCdz
IGluCj4gPj4gdGhlIHNwZWMgd2UgZW5kIHVwIGdldHRpbmcgYnVybmVkLCBhbmQgd2hpbGUgSSBk
b24ndCBzZWUgYSBzcGVjaWZpYwo+ID4+IHdheQo+ID4KPiA+IEkgYWdyZWUgdGhhdCB0aGlzIGlz
IGFuIEFCSSBjaGFuZ2UvaW1wcm92ZW1lbnQgd2hpY2ggaXMgaW1wb3NzaWJsZSB0bwo+ID4gbW9k
aWZ5IGxhdGVyLgo+ID4gSG93ZXZlciwgdGhpcyBpcyBhIExpbnV4IHNwZWNpZmljIEFCSS4gRG8g
eW91IHRoaW5rIHRoZSBSSVNDLVYgc3BlYwo+ID4gd2lsbCBldmVyIHNheSBhbnl0aGluZyBhYm91
dCBob3cgL3Byb2MvY3B1aW5mbyBpcyBzaG93biB0byB0aGUgdXNlciA/Cj4gPgo+Cj4gQWN0dWFs
bHkgdGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBvbiBjaGFpcnMgYXQgc29tZSBwb2ludCBvbiBob3cg
aXNhCj4gZXh0ZW5zaW9ucyB3aWxsIGJlIHJlcHJlc2VudGVkIGFzIGEgc2luZ2xlIHN0cmluZy4g
SWYgSSByZWNhbGwgY29ycmVjdGx5Cj4gdGhleSB3YW50ZWQgYSB3YXkgdG8gY29tcGFyZSBmZWF0
dXJlcyBiZXR3ZWVuIGltcGxlbWVudGF0aW9ucyBzbyB0aGlzCj4gd2FzIHNvbWV0aGluZyB0aGUg
dXNlciBzaG91bGQgYmUgYWJsZSB0byByZWFkIGFzIHdlbGwuIEknbSBjY2luZyBQaGlsaXBwCj4g
ZnJvbSB0aGUgU29mdHdhcmUgSEMgaW4gY2FzZSBoZSBoYXMgbW9yZSBkZXRhaWxzIG9uIHRoaXMu
Cj4KPiBJIGFsc28gYmVsaWV2ZSB3ZSBuZWVkIHRvIGRpc2N1c3MgdGhpcyBhIGJpdCBmdXJ0aGVy
LCBhbHNvIEkgdGhvdWdodCB3ZQo+IGFncmVlZCB0aGF0IGhhdmluZyBldmVyeXRoaW5nIGFzIGEg
c2luZ2xlIHN0cmluZyAocmlzY3YtaXNhKSBvbiB0aGUKPiBkZXZpY2UgdHJlZSBkb2Vzbid0IHNj
YWxlLCB0aGVyZSB3ZXJlIHNvbWUgb3RoZXIgc3VnZ2VzdGlvbnMgcmVnYXJkaW5nCj4gZm9yIGV4
YW1wbGUgbW11IGV4dGVuc2lvbnMgYmVpbmcgZGVjbGFyZWQgaW5zaWRlIGFuIG1tdSBzdWItbm9k
ZSBldGMuCj4gVGhpcyBwYXRjaCBzZXJpZXMgd2lsbCBub3Qgb25seSBtYWtlIGl0IGhhcmQgdG8g
Y2hhbmdlIC9wcm9jL2NwdWluZm8KPiBvdXRwdXQgaW4gdGhlIGZ1dHVyZSwgYnV0IGFsc28gZXN0
YWJsaXNoZXMgYSBkZXZpY2UtdHJlZSBiaW5kaW5nIGZvciBhbGwKPiBpc2EgZXh0ZW5zaW9ucyB0
aHJvdWdoIHRoZSByaXNjdi1pc2Egc3RyaW5nIHRoYXQgd2UgYWxzbyB3b24ndCBiZSBhYmxlCj4g
dG8gbW9kaWZ5IGxhdGVyIG9uLgoKSW5pdGlhbGx5IHdlIGNhbiBqdXN0IGZvbGxvdyB0aGUgSVNB
IHN0cmluZyBhcHByb2FjaCBiZWNhdXNlIHRoaXMKaXMgd2hhdCBSSVNDLVYgdW5wcmljIHNwZWMg
ZGVmaW5lcy4KClNwZWNpZnlpbmcgSVNBIGV4dGVuc2lvbnMgdmlhIERUIG9yIEFDUEksIGNhbiBi
ZSBpbmNyZW1lbnRhbGx5CmRvbmUgaW4gZnV0dXJlLgoKV2UgaGF2ZSBhIGxvdCBvZiBwYXRjaGVz
IChTdnBibXQsIFNzdGMsIFNjb2ZwbWYsIFpjYm94eXosIGV0YykKYmxvY2tlZCBiZWNhdXNlIHdl
IGRvbid0IGhhdmUgYSB3YXkgdG8gZGV0ZWN0IG11bHRpLWxldHRlcgpleHRlbnNpb25zIGluIExp
bnV4LgoKUmVnYXJkcywKQW51cAoKPgo+IFJlZ2FyZHMsCj4gTmljawo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
