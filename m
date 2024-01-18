Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE6C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLnQDNWr9JcDyHxiYB3i90g6tFtDC/F6oSq+6oqFb68=; b=g5HHZVIPWdzHmI
	YHeJgYn7JDxfctv0aG+dZ3+79c+VxZWRU3eSMP01wkGNE8ZZIIQOnpI0f6dhoEU6N0CaI2QiAw8XH
	TRoD9YkbOy7YaiWEcjc7+rwA4BtDasDzfTCJV8GsYOKK+iDJHwx6rVlpYBAYg9GDvUltG6Bf6Rd18
	M95kU/Z/eZzpCm7vwKz2zKLcvms9o+wl2nZIYu+13gPZ8o18cpleHCPV47ciBFxC35jvdffrH6xVt
	iXRvEiAmJXPUyfVA2l8RlCbIqrymIpt1pyD+JKBRHobuw1vF3BdJGd1HGz2JIHfGjuhQEuYtLjjfG
	pHsWPzIQ2zW5peGE/FNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQNgu-0025UC-25;
	Thu, 18 Jan 2024 08:24:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQNgn-0025Ov-37
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 08:23:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6db786df38dso3739567b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 00:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705566232; x=1706171032; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=welEo0/WJxuhwoTNRxCpfyX7sfk5voOc4sTxJMWj2Aw=;
        b=jxTIWf4WMqOCYrc7kChVJjlvfxRkoxhHiSqrX05MAMv+KmCvq8/ZVeb/QbqCVCUoLd
         wS1pFSP++lYpNi4a86m+cQ6dP4rOpr/Y0u+lzb/nqUSKWpsx8WOflHl7d8WMeEHU69//
         3JTlZySep8E5b+UZrPx9m4OGnBzWnDK6hsZQWL/hNvAXIvKUgbrlItWKAEjNIiWztlBa
         OAucgcHGk5cWNAjOYc9PbbIhKi8aWcSTm48Z63tvmbBL7AIIpNbP8NU05TXiRBEZGnxb
         wWmwtKz0M26wD5iWXQEzB90ZSXFOQOncqQP3VVlJ+ESXfefe9Odt9LuDSBb0bQ5EHOPF
         kLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705566232; x=1706171032;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=welEo0/WJxuhwoTNRxCpfyX7sfk5voOc4sTxJMWj2Aw=;
        b=A4sR9RZNmxBP/9GNAHX487q6XU9te0Acpk95lHij6U0lMlrAeAiZr6Cfe3rtivAOWK
         F0WR/GWWSIaFwKS7VB2jpwfx47AycggFrEw4qFTWaIBxDjUUQotyGP7SrVBOZHQfGda+
         Tv7J0SRokJliB9YdLzREYwJsqo3tLRWg0jhjddjEckIgHP6pEO2+jS3S1gyWIFiphLFT
         L96za2lPgHbNL4Uy82IeX+LWWaOn1PNO3+Sm8BIr3wOUuK9UBrMkVTgfzHM3kGMf556F
         LhnWQKPnJCWNbMqg/oRgjSqKMIr32e5hsF9nkuojyCbOI5S0DkpKQUqSW5Ld0mU2Fmmw
         J6Rw==
X-Gm-Message-State: AOJu0YzTPgSXF3IdAgY8D1IqPkPFqMpd2UJVoarOuHI+70pbLSvbsDLt
	v8b3Z4bIQ6L4Dyi+KZipHAKKV7uJ+eLmXNayZR9vJJv33oVS03rEfuCobRVWdOE=
X-Google-Smtp-Source: AGHT+IGaoDDx9aDO0YNH0g7XdpqbNuTcRdbMFDYtV1SQWylCAw0oi0AjU/zcDHvavTfmpNNLtZt26w==
X-Received: by 2002:a05:6a20:43a7:b0:19b:7e77:7279 with SMTP id i39-20020a056a2043a700b0019b7e777279mr643544pzl.18.1705566232336;
        Thu, 18 Jan 2024 00:23:52 -0800 (PST)
Received: from hsinchu15 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id fc13-20020a056a002e0d00b006d9cf4b56edsm2812458pfb.175.2024.01.18.00.23.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jan 2024 00:23:51 -0800 (PST)
Date: Thu, 18 Jan 2024 16:23:47 +0800
From: Nylon Chen <nylon.chen@sifive.com>
To: alex@ghiti.fr
Cc: apatel@ventanamicro.com, alexghiti@rivosinc.com,
	catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org,
	frowand.list@gmail.com, rppt@kernel.org, akpm@linux-foundation.org,
	anup@brainfault.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-mm@kvack.org, zong.li@sifive.com,
	nylon7717@gmail.com
Subject: Re: Fwd: [PATCH v8 0/4] riscv: Use PUD/P4D/PGD pages for the linear
 mapping
Message-ID: <20240118082346.GB31078@hsinchu15>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <CAK9=C2XJtSG2d_nsyDv7kU1v7Jj0chdevqrMc0MpJswukcEABA@mail.gmail.com>
 <CAHVXubhhxpzHDM-n91V_rceY5t_VqLvrwZj3RP_tNL2=F9mqjQ@mail.gmail.com>
 <CAK9=C2WVOpSqtt8r1U4hnzSZ=cc1PocpukgQjNyahP2XuPhozw@mail.gmail.com>
 <d0087922-4721-ccf1-80bf-9f74099d0948@ghiti.fr>
 <CAPqJEFr6MgUyARfbWAo7EeQKLVd4xRJz_LOYN68UC-kPD1Hr5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPqJEFr6MgUyARfbWAo7EeQKLVd4xRJz_LOYN68UC-kPD1Hr5A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_002354_098473_B87CBB66 
X-CRM114-Status: GOOD (  42.66  )
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

PiBPbiAzLzIzLzIzIDE1OjU1LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gVGh1LCBNYXIgMjMs
IDIwMjMgYXQgNjoyNOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cj4gPj4gSGkgQW51cCwKPiA+Pgo+ID4+IE9uIFRodSwgTWFyIDIzLCAyMDIzIGF0
IDE6MTjigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
Pj4+IEhpIEFsZXgsCj4gPj4+Cj4gPj4+IE9uIFRodSwgTWFyIDE2LCAyMDIzIGF0IDY6NDjigK9Q
TSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Pj4g
VGhpcyBwYXRjaHNldCBpbnRlbmRzIHRvIGltcHJvdmUgdGxiIHV0aWxpemF0aW9uIGJ5IHVzaW5n
IGh1Z2VwYWdlcyBmb3IKPiA+Pj4+IHRoZSBsaW5lYXIgbWFwcGluZy4KPiA+Pj4+Cj4gPj4+PiBB
cyByZXBvcnRlZCBieSBBbnVwIGluIHY2LCB3aGVuIFNUUklDVF9LRVJORUxfUldYIGlzIGVuYWJs
ZWQsIHdlIG11c3QKPiA+Pj4+IHRha2UgY2FyZSBvZiBpc29sYXRpbmcgdGhlIGtlcm5lbCB0ZXh0
IGFuZCByb2RhdGEgc28gdGhhdCB0aGV5IGFyZSBub3QKPiA+Pj4+IG1hcHBlZCB3aXRoIGEgUFVE
IG1hcHBpbmcgd2hpY2ggd291bGQgdGhlbiBhc3NpZ24gd3JvbmcgcGVybWlzc2lvbnMgdG8KPiA+
Pj4+IHRoZSB3aG9sZSByZWdpb246IGl0IGlzIGFjaGlldmVkIGJ5IGludHJvZHVjaW5nIGEgbmV3
IG1lbWJsb2NrIEFQSS4KPiA+Pj4+Cj4gPj4+PiBBbm90aGVyIHBhdGNoIG1ha2VzIHVzZSBvZiB0
aGlzIG5ldyBBUEkgaW4gYXJtNjQgd2hpY2ggdXNlZCBzb21lIHNvcnQgb2YKPiA+Pj4+IGhhY2sg
dG8gc29sdmUgdGhpcyBpc3N1ZTogaXQgd2FzIGJ1aWx0L2Jvb3QgdGVzdGVkIHN1Y2Nlc3NmdWxs
eS4KPiA+Pj4+Cj4gPj4+PiBiYXNlLWNvbW1pdC10YWc6IHY2LjMtcmMxCj4gPj4+Pgo+ID4+Pj4g
djg6Cj4gPj4+PiAtIEZpeCBydjMyLCBhcyByZXBvcnRlZCBieSBBbnVwCj4gPj4+PiAtIERvIG5v
dCBtb2RpZnkgbWVtYmxvY2tfaXNvbGF0ZV9yYW5nZSBhbmQgZml4ZXMgY29tbWVudCwgYXMgc3Vn
Z2VzdGVkIGJ5IE1pa2UKPiA+Pj4+IC0gVXNlIHRoZSBuZXcgbWVtYmxvY2sgQVBJIGZvciBjcmFz
aCBrZXJuZWwgdG9vIGluIGFybTY0LCBhcyBzdWdnZXN0ZWQgYnkgQW5kcmV3Cj4gPj4+PiAtIEZp
eCBhcm02NCBkb3VibGUgbWFwcGluZyAod2hpY2ggdG8gbWUgZGlkIG5vdCB3b3JrIGluIHY3KSwg
YnV0IGVuZHMgdXAgbm90Cj4gPj4+PiAgICBiZWluZyBwcmV0dHkgYXQgYWxsLCB3aWxsIHdhaXQg
Zm9yIGNvbW1lbnRzIGZyb20gYXJtNjQgcmV2aWV3ZXJzLCBidXQKPiA+Pj4+ICAgIHRoaXMgcGF0
Y2ggY2FuIGVhc2lseSBiZSBkcm9wcGVkIGlmIHRoZXkgZG8gbm90IHdhbnQgaXQuCj4gPj4+Pgo+
ID4+Pj4gdjc6Cj4gPj4+PiAtIEZpeCBBbnVwIGJ1ZyByZXBvcnQgYnkgaW50cm9kdWNpbmcgbWVt
YmxvY2tfaXNvbGF0ZV9tZW1vcnkgd2hpY2gKPiA+Pj4+ICAgIGFsbG93cyB1cyB0byBzcGxpdCB0
aGUgbWVtYmxvY2sgbWFwcGluZ3MgYW5kIHRoZW4gYXZvaWQgdG8gbWFwIHRoZQo+ID4+Pj4gICAg
dGhlIFBVRCB3aGljaCBjb250YWlucyB0aGUga2VybmVsIGFzIHJlYWQgb25seQo+ID4+Pj4gLSBB
ZGQgYSBwYXRjaCB0byBhcm02NCB0byB1c2UgdGhpcyBuZXdseSBpbnRyb2R1Y2VkIEFQSQo+ID4+
Pj4KPiA+Pj4+IHY2Ogo+ID4+Pj4gLSBxdWlldCBMTFZNIHdhcm5pbmcgYnkgY2FzdGluZyBwaHlz
X3JhbV9iYXNlIGludG8gYW4gdW5zaWduZWQgbG9uZwo+ID4+Pj4KPiA+Pj4+IHY1Ogo+ID4+Pj4g
LSBGaXggbm9tbXUgYnVpbGRzIGJ5IGdldHRpbmcgcmlkIG9mIHJpc2N2X3Bmbl9iYXNlIGluIHBh
dGNoIDEsIHRoYW5rcwo+ID4+Pj4gICAgQ29ub3IKPiA+Pj4+IC0gQWRkIFJCIGZyb20gQW5kcmV3
Cj4gPj4+Pgo+ID4+Pj4gdjQ6Cj4gPj4+PiAtIFJlYmFzZSBvbiB0b3Agb2YgdjYuMi1yYzMsIGFz
IG5vdGVkIGJ5IENvbm9yCj4gPj4+PiAtIEFkZCBBY2tlZC1ieSBSb2IKPiA+Pj4+Cj4gPj4+PiB2
MzoKPiA+Pj4+IC0gQ2hhbmdlIHRoZSBjb21tZW50IGFib3V0IGluaXRyZF9zdGFydCBWQSBjb252
ZXJzaW9uIHNvIHRoYXQgaXQgZml0cwo+ID4+Pj4gICAgQVJNNjQgYW5kIFJJU0NWNjQgKGFuZCBv
dGhlcnMgaW4gdGhlIGZ1dHVyZSBpZiBuZWVkZWQpLCBhcyBzdWdnZXN0ZWQKPiA+Pj4+ICAgIGJ5
IFJvYgo+ID4+Pj4KPiA+Pj4+IHYyOgo+ID4+Pj4gLSBBZGQgYSBjb21tZW50IG9uIHdoeSBSSVND
VjY0IGRvZXMgbm90IG5lZWQgdG8gc2V0IGluaXRyZF9zdGFydC9lbmQgdGhhdAo+ID4+Pj4gICAg
ZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcywgYXMgYXNrZWQgYnkgUm9iCj4gPj4+Pgo+ID4+Pj4g
QWxleGFuZHJlIEdoaXRpICg0KToKPiA+Pj4+ICAgIHJpc2N2OiBHZXQgcmlkIG9mIHJpc2N2X3Bm
bl9iYXNlIHZhcmlhYmxlCj4gPj4+PiAgICBtbTogSW50cm9kdWNlIG1lbWJsb2NrX2lzb2xhdGVf
bWVtb3J5Cj4gPj4+PiAgICBhcm02NDogTWFrZSB1c2Ugb2YgbWVtYmxvY2tfaXNvbGF0ZV9tZW1v
cnkgZm9yIHRoZSBsaW5lYXIgbWFwcGluZwo+ID4+Pj4gICAgcmlzY3Y6IFVzZSBQVUQvUDREL1BH
RCBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nCj4gPj4+IEtlcm5lbCBib290IGZpbmUgb24g
UlY2NCBidXQgdGhlcmUgaXMgYSBmYWlsdXJlIHdoaWNoIGlzIHN0aWxsIG5vdAo+ID4+PiBhZGRy
ZXNzZWQuIFlvdSBjYW4gc2VlIHRoaXMgZmFpbHVyZSBhcyBmb2xsb3dpbmcgbWVzc2FnZSBpbgo+
ID4+PiBrZXJuZWwgYm9vdCBsb2c6Cj4gPj4+ICAgICAgMC4wMDAwMDBdIEZhaWxlZCB0byBhZGQg
YSBTeXN0ZW0gUkFNIHJlc291cmNlIGF0IDgwMjAwMDAwCj4gPj4gSG1tbSBJIGRvbid0IGdldCB0
aGF0IGluIGFueSBvZiBteSB0ZXN0IGNvbmZpZ3MsIHdvdWxkIHlvdSBtaW5kCj4gPj4gc2hhcmlu
ZyB5b3VycyBhbmQgeW91ciBxZW11IGNvbW1hbmQgbGluZT8KPiA+IFRyeSBhbGV4Z2hpdGlfdGVz
dCBicmFuY2ggYXQKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+ID4K
PiA+IEkgYW0gYnVpbGRpbmcgdGhlIGtlcm5lbCB1c2luZyBkZWZjb25maWcgYW5kIG15IHJvb3Rm
cyBpcwo+ID4gYmFzZWQgb24gYnVzeWJveC4KPiA+Cj4gPiBNeSBRRU1VIGNvbW1hbmQgaXM6Cj4g
PiBxZW11LXN5c3RlbS1yaXNjdjY0IC1NIHZpcnQgLW0gNTEyTSAtbm9ncmFwaGljIC1iaW9zCj4g
PiBvcGVuc2JpL2J1aWxkL3BsYXRmb3JtL2dlbmVyaWMvZmlybXdhcmUvZndfZHluYW1pYy5iaW4g
LWtlcm5lbAo+ID4gLi9idWlsZC1yaXNjdjY0L2FyY2gvcmlzY3YvYm9vdC9JbWFnZSAtYXBwZW5k
ICJyb290PS9kZXYvcmFtIHJ3Cj4gPiBjb25zb2xlPXR0eVMwIGVhcmx5Y29uIiAtaW5pdHJkIC4v
cm9vdGZzX3Jpc2N2NjQuaW1nIC1zbXAgNAo+IAo+IAo+IFNvIHNwbGl0dGluZyBtZW1ibG9jay5t
ZW1vcnkgaXMgdGhlIGN1bHByaXQsIGl0ICJjb25mdXNlcyIgdGhlIHJlc291cmNlcwo+IGFkZGl0
aW9uIGFuZCBJIGNhbiBvbmx5IGZpbmQgaGFja3kgd2F5cyB0byBmaXggdGhhdC4uLgpIaSBBbGV4
YW5kcmUsCgpXZSBlbmNvdW50ZXJlZCB0aGUgc2FtZSBlcnJvciBhcyBBbnVwLiBBZnRlciBhZGRp
bmcgeW91ciBwYXRjaAooMzMzNTA2OGY4NzIxN2VhNTlkMDhmNDYyMTg3ZGM4NTY2NTJlZWExNSks
IHdlIHdpbGwgbm90IGVuY291bnRlciB0aGUKZXJyb3IgYWdhaW4uCgpXaGF0IEkgaGF2ZSBvYnNl
cnZlZCBzbyBmYXIgaXMKCi0gYmVmb3JlIHlvdXIgcGF0Y2gKV2hlbiBtZXJnaW5nIGNvbnNlY3V0
aXZlIG1lbWJsb2NrcywgaWYgdGhlIG1lbWJsb2NrIHR5cGVzIGFyZSBkaWZmZXJlbnQsCnRoZXkg
d2lsbCBiZSBtZXJnZWQgaW50byByZXNlcnZlZAotIGFmdGVyIHlvdXIgcGF0Y2gKV2hlbiBjb25z
ZWN1dGl2ZSBtZW1ibG9ja3MgYXJlIG1lcmdlZCwgaWYgdGhlIG1lbWJsb2NrIHR5cGVzIGFyZQpk
aWZmZXJlbnQsIHRoZXkgd2lsbCBiZSBtZXJnZWQgaW50byBtZW1vcnkuCgpTdWNoIGEgcmVzdWx0
IHdpbGwgY2F1c2UgdGhlIG1lbW9yeSBsb2NhdGlvbiBvZiBPcGVuU0JJIHRvIGJlIGNoYW5nZWQK
ZnJvbSByZXNlcnZlZCB0byBtZW1vcnkuIFdpbGwgdGhpcyBoYXZlIGFueSBzaWRlIGVmZmVjdHM/
Cj4gCj4gU28gZ2l2ZW4gdGhhdCB0aGUgYXJtNjQgcGF0Y2ggd2l0aCB0aGUgbmV3IEFQSSBpcyBu
b3QgcHJldHR5IGFuZCB0aGF0Cj4gdGhlIHNpbXBsZXN0IHNvbHV0aW9uIGlzIHRvIHJlLW1lcmdl
IHRoZSBtZW1ibG9jayByZWdpb25zIGFmdGVyd2FyZHMKPiAod2hpY2ggaXMgZG9uZSBieSBtZW1i
bG9ja19jbGVhcl9ub21hcCksIEknbGwgZHJvcCB0aGUgbmV3IEFQSSBhbmQgdGhlCj4gYXJtNjQg
cGF0Y2ggdG8gdXNlIHRoZSBub21hcCBBUEkgbGlrZSBhcm02NDogSSdsbCB0YWtlIGFkdmFudGFn
ZSBvZiB0aGF0Cj4gdG8gY2xlYW4gc2V0dXBfdm1fZmluYWwgd2hpY2ggSSBoYXZlIHdhbnRlZCB0
byBkbyBmb3IgYSBsb25nIHRpbWUuCj4gCj4gQE1pa2UgVGhhbmtzIGZvciB5b3UgcmV2aWV3cyEK
PiAKPiBAQW51cCBUaGFua3MgZm9yIGFsbCB5b3VyIGJ1ZyByZXBvcnRzIG9uIHRoaXMgcGF0Y2hz
ZXQsIEkgaGF2ZSB0bwo+IGltcHJvdmUgbXkgdGVzdCBmbG93IChpdCBpcyBpbiB0aGUgd29yayA6
KSkuCj4gCj4gCj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+PiBUaGFua3MKPiA+Pgo+ID4+
PiBSZWdhcmRzLAo+ID4+PiBBbnVwCj4gPj4+Cj4gPj4+PiAgIGFyY2gvYXJtNjQvbW0vbW11LmMg
ICAgICAgICAgIHwgMjUgKysrKysrKysrKystLS0tLS0KPiA+Pj4+ICAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wYWdlLmggfCAxOSArKysrKysrKysrKy0tCj4gPj4+PiAgIGFyY2gvcmlzY3YvbW0v
aW5pdC5jICAgICAgICAgIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0K
PiA+Pj4+ICAgYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jICAgICAgfCAxNiArKysrKysrKysrKwo+
ID4+Pj4gICBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAgICAgICB8IDExICsrKystLS0tCj4gPj4+
PiAgIGluY2x1ZGUvbGludXgvbWVtYmxvY2suaCAgICAgIHwgIDEgKwo+ID4+Pj4gICBtbS9tZW1i
bG9jay5jICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysKPiA+Pj4+ICAgNyBmaWxl
cyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+
Pj4gLS0KPiA+Pj4+IDIuMzcuMgo+ID4+Pj4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
