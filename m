Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EE3C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIXHlQ9jj9uioWrVsI0ux5J/PfSsB3ifNhB96Jp9wg4=; b=BDD2n8tm2EjAgm
	WJtD73E412h72TAMfxIXsKYvOAifZzVzyxah+WL2L8Yw+r0Ybd2gV6moz2x2R+R8ov7FWvZjSVIag
	+LinexXq433eM4KlM9BuljXmbO5YH0GsK+Ta1D409RyXnlT6SqqcCGTto1mlo9EOE0g71Hm+6vuj8
	I0gciFLU4PS1Ms56kVNavoRncnsuG11AGmCNTXFPuSjliamlWSdOgKtyhkIcWkaZSG4ZPkqWHkzMr
	gQpFCRA50ObJdobqkFoXDVrE50M/el9WzsmraNIzf9lTglv9MhAUleLntqcGLeMei3Gm3qOSWRqmF
	XJGT5U1gG0RDSzp1/KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJRc-00HF2L-2R;
	Tue, 23 Jan 2024 16:16:12 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJRZ-00HEzx-0y;
	Tue, 23 Jan 2024 16:16:10 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dbc2bf4e8dso902860a34.1;
        Tue, 23 Jan 2024 08:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706026566; x=1706631366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJEIU7VR+3J2Yia1miwsBzYF1liLE8jqQNwwQ3tqywA=;
        b=EqdHtanYpBHXxqLUQGkR1JhiFSTT9G16yjQl9KkpRuNzlfQ/kjagqFd0ekoc0WCeku
         tCc8ty/aqaANjo1nEG0h+Aqj1QaminOASPV7yPSveLY1DI79sze8nf/kD9vnDj50dxss
         2Ob6B7UNQk+l70V+iPtpEWzBmJXEjSZN834Sfcdpnjcl7zxd7NfeF34YAxnjEJG9eZea
         31OPoxGvIJWdTvzTJHtiiG6rWW2PLR2TyADNkYplsP/tD+TKx131cfFgeTJJ9ixfQid+
         Klj8LsUfUX1DM4DXMX5p/Nx09OsvjV1f53jAY2666UozwN7j8Bp+V0quJ0OtSuYYAh9v
         PUoA==
X-Gm-Message-State: AOJu0Yzbg9/G/pJ40eHumkVe8CC/+TzMcqvq9SBpSWvnhx5ONs40V5iP
	wSFYskGe3Lt2teIlKXXqlS2N74POBYdcZSsmNx+Njy0aNU099Wli9T8kehUyk7y+IGvH6K+DRyc
	aG9oNXs04ou1rA1qI9xn0aCIPkRg=
X-Google-Smtp-Source: AGHT+IHQzsBW5twpX6SIjbULqATUBQ0vqIkaZWwGQH4D7Ygegig4qDUNFIf/V4v9BHOfqKgEoP5iIqbc4ar0eQw6LMM=
X-Received: by 2002:a05:6808:f10:b0:3bd:c5eb:451c with SMTP id
 m16-20020a0568080f1000b003bdc5eb451cmr2255072oiw.1.1706026566440; Tue, 23 Jan
 2024 08:16:06 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
 <CAJZ5v0g9nfLrEf9u4Ksw6BOWJQ9iv8Z-O8RsLU6jR5zk0ahxRw@mail.gmail.com>
 <20240122180013.000016d5@Huawei.com> <Za++/11n5KA1VS3p@shell.armlinux.org.uk>
In-Reply-To: <Za++/11n5KA1VS3p@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 Jan 2024 17:15:54 +0100
Message-ID: <CAJZ5v0h7wsLt8d3ZoLXsK1=crAx66T42WDKNoHcg8CiHpAjS8g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include 'present'
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_081609_341055_CFF3AAC7 
X-CRM114-Status: GOOD (  39.10  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMjoyOOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0
IDA2OjAwOjEzUE0gKzAwMDAsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gPiBPbiBNb24sIDE4
IERlYyAyMDIzIDIxOjM1OjE2ICswMTAwCj4gPiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjQ5
4oCvUE0gUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4g
PiA+ID4KPiA+ID4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+
ID4gPgo+ID4gPiA+IFRoZSBjb2RlIGJlaGluZCBBQ1BJX0hPVFBMVUdfQ1BVIGFsbG93cyBhIG5v
dC1wcmVzZW50IENQVSB0byBiZWNvbWUKPiA+ID4gPiBwcmVzZW50Lgo+ID4gPgo+ID4gPiBSaWdo
dC4KPiA+ID4KPiA+ID4gPiBUaGlzIGlzbid0IHRoZSBvbmx5IHVzZSBvZiBIT1RQTFVHX0NQVS4g
T24gYXJtNjQgYW5kIHJpc2N2Cj4gPiA+ID4gQ1BVcyBjYW4gYmUgdGFrZW4gb2ZmbGluZSBhcyBh
IHBvd2VyIHNhdmluZyBtZWFzdXJlLgo+ID4gPgo+ID4gPiBCdXQgc3RpbGwgdGhlcmUgaXMgdGhl
IGNhc2UgaW4gd2hpY2ggYSBub24tcHJlc2VudCBDUFUgY2FuIGJlY29tZQo+ID4gPiBwcmVzZW50
LCBpc24ndCBpdCB0aGVyZT8KPiA+Cj4gPiBOb3QgeWV0IGRlZmluZWQgYnkgdGhlIGFyY2hpdGVj
dHVyZXMgKGFuZCBJJ20gYXNzdW1pbmcgaXQgcHJvYmFibHkgbmV2ZXIgd2lsbCBiZSkuCj4gPgo+
ID4gVGhlIG9yaWdpbmFsIHByb3Bvc2FsIHdlIHRvb2sgdG8gQVJNIHdhcyB0byBkbyBleGFjdGx5
IHRoYXQgLSB0aGV5IHB1c2hlZAo+ID4gYmFjayBoYXJkIG9uIHRoZSBiYXNpcyB0aGVyZSB3YXMg
bm8gYXJjaGl0ZWN0dXJhbGx5IHNhZmUgd2F5IHRvIGltcGxlbWVudCBpdC4KPiA+IFRvbyBtdWNo
IG9mIHRoZSBBUk0gYXJjaCBoYXMgdG8gZXhpc3QgZnJvbSB0aGUgc3RhcnQgb2YgdGltZS4KPiA+
Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsL2NiYWE2ZDY4LTYx
NDMtZTAxMC01ZjNjLWVjNjJmODc5YWQ5NUBhcm0uY29tLwo+ID4gaXMgb25lIG9mIHRoZSByZWxl
dmFudCB0aHJlYWRzIG9mIHRoZSBrZXJuZWwgc2lkZSBvZiB0aGF0IGRpc2N1c3Npb24uCj4gPgo+
ID4gTm90IHRvIHB1dCBzcGVjaWZpYyB3b3JkcyBpbnRvIHRoZSBBUk0gYXJjaGl0ZWN0cyBtb3V0
aHMsIGJ1dCB0aGUKPiA+IHNob3J0IGRlc2NyaXB0aW9uIGlzIHRoYXQgdGhlcmUgaXMgY3VycmVu
dGx5IG5vIGRlbWFuZCBmb3Igd29ya2luZwo+ID4gb3V0IGhvdyB0byBtYWtlIHBoeXNpY2FsIENQ
VSBob3RwbHVnIHBvc3NpYmxlLCBhcyBzdWNoIHRoZXkgd2lsbCBub3QKPiA+IHByb3ZpZGUgYW4g
YXJjaGl0ZWN0dXJhbGx5IGNvbXBsaWFudCB3YXkgdG8gZG8gaXQgZm9yIHZpcnR1YWwgQ1BVIGhv
dHBsdWcgYW5kCj4gPiBhbm90aGVyIG1lYW5zIGlzIG5lZWRlZCAod2hpY2ggaXMgd2h5IHRoaXMg
c2VyaWVzIGRvZXNuJ3QgdXNlIHRoZSBwcmVzZW50IGJpdAo+ID4gZm9yIHRoYXQgcHVycG9zZSBh
bmQgd2UgaGF2ZSB0aGUgT25saW5lIGNhcGFibGUgYml0IGluIE1BRFQvR0lDQykKPiA+Cj4gPiBJ
dCB3YXMgYSAnZnVuJyBkYW5jZSBvZiBzZXZlcmFsIHllYXJzIHRvIGdldCB0byB0aGF0IGNsYXJp
ZmljYXRpb24uCj4gPiBBcyBhbm90aGVyIGZ1biBmYWN0LCB0aGUgc2FtZSBpcyBkZWZpbmVkIGZv
ciB4ODYsIGJ1dCBJIGRvbid0IHRoaW5rCj4gPiBhbnlvbmUgaGFzIHVzZWQgaXQgeWV0IChHSUND
IGZvciBBUk0gaGFzIGFuIG9ubGluZSBjYXBhYmxlIGJpdCBpbiB0aGUgZmxhZ3MgdG8KPiA+IGVu
YWJsZSB0aGlzLCB3aGljaCB3YXMgcmVtYXJrYWJseSBzaW1pbGFyIHRvIHRoZSBvbmxpbmUgY2Fw
YWJsZSBiaXQgaW4gdGhlCj4gPiBmbGFncyBvZiB0aGUgTG9jYWwgQVBJQyBlbnRyaWVzIGFzIGFk
ZGVkIGZhaXJseSByZWNlbnRseSkuCj4gPgo+ID4gPgo+ID4gPiA+IE9uIGFybTY0IGFuIG9mZmxp
bmUgQ1BVIG1heSBiZSBkaXNhYmxlZCBieSBmaXJtd2FyZSwgcHJldmVudGluZyBpdCBmcm9tCj4g
PiA+ID4gYmVpbmcgYnJvdWdodCBiYWNrIG9ubGluZSwgYnV0IGl0IHJlbWFpbnMgcHJlc2VudCB0
aHJvdWdob3V0Lgo+ID4gPiA+Cj4gPiA+ID4gQWRkaW5nIGNvZGUgdG8gcHJldmVudCB1c2VyLXNw
YWNlIHRyeWluZyB0byBvbmxpbmUgdGhlc2UgZGlzYWJsZWQgQ1BVcwo+ID4gPiA+IG5lZWRzIHNv
bWUgYWRkaXRpb25hbCB0ZXJtaW5vbG9neS4KPiA+ID4gPgo+ID4gPiA+IFJlbmFtZSB0aGUgS2Nv
bmZpZyBzeW1ib2wgQ09ORklHX0FDUElfSE9UUExVR19QUkVTRU5UX0NQVSB0byByZWZsZWN0Cj4g
PiA+ID4gdGhhdCBpdCBtYWtlcyBwb3NzaWJsZSBDUFVzIHByZXNlbnQuCj4gPiA+Cj4gPiA+IEhv
bmVzdGx5LCBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5IG9yIGV2
ZW4gdXNlZnVsLgo+ID4KPiA+IFdoaWxzdCBpdCdzIGFuIGF0dGVtcHQgdG8gYXZvaWQgZnV0dXJl
IGNvbmZ1c2lvbiwgdGhlIHJlbmFtZSBpcwo+ID4gbm90IHNvbWV0aGluZyBJIHJlYWxseSBjYXJl
IGFib3V0IHNvIG15IGFkdmljZSB0byBSdXNzZWxsIGlzIGRyb3AKPiA+IGl0IHVubGVzcyB5b3Ug
YXJlIGF0dGFjaGVkIHRvIGl0IQo+Cj4gV2hpbGUgSSBhZ3JlZSB0aGF0IGl0IGlzbid0IGEgbmVj
ZXNzaXR5LCBJIGRvbid0IGZ1bGx5IGFncmVlIHRoYXQgaXQKPiBpc24ndCB1c2VmdWwuCj4KPiBP
bmUgb2YgdGhlIGlzc3VlcyB3aWxsIGJlIHRoYXQgd2hpbGUgQXJtNjQgd2lsbCBzdXBwb3J0IGhv
dHBsdWcgdkNQVSwKPiBpdCB3b24ndCBiZSBzZXR0aW5nIEFDUElfSE9UUExVR19DUFUgYmVjYXVz
ZSBpdCBkb2Vzbid0IHN1cHBvcnQKPiB0aGUgcHJlc2VudCBiaXQgY2hhbmdpbmcuIFNvIEkgY2Fu
IHNlZSB3aHkgSmFtZXMgZGVjaWRlZCB0byByZW5hbWUKPiBpdCAtIGJlY2F1c2Ugd2l0aCBBcm02
NCdzIGhvdHBsdWcgdkNQVSwgdGhlIGlkZWEgdGhhdCBBQ1BJX0hPVFBMVUdfQ1BVCj4gc29tZWhv
dyBlbmFibGVzIGhvdHBsdWcgQ1BVIHN1cHBvcnQgaXMgbm93IG5vIGxvbmdlciB0cnVlLgo+Cj4g
S2VlcGluZyBpdCBhcyBBQ1BJX0hPVFBMVUdfQ1BVIG1ha2VzIHRoZSBjb2RlIGxlc3Mgb2J2aW91
cywgYmVjYXVzZSBpdAo+IGxlYWRzIG9uZSB0byBhc3N1bWUgdGhhdCBpdCBvdWdodCB0byBiZSBl
bmFibGVkIGZvciBBcm02NCdzCj4gaW1wbGVtZW50YXRpbm9uLCBhbmQgdGhhdCBjb3VsZCB3ZWxs
IGNhdXNlIGlzc3VlcyBpbiB0aGUgZnV0dXJlIGlmCj4gcGVvcGxlIG1ha2UgdGhlIGFzc3VtcHRp
b24gdGhhdCAiQUNQSV9IT1RQTFVHX0NQVSIgbWVhbnMgaG90cGx1ZyBDUFUKPiBpcyBzdXBwb3J0
ZWQgaW4gQUNQSS4gSXQgZG9lc24ndCBhbnltb3JlLgoKT24geDg2IHRoZXJlIGlzIG5vIGNvbmZ1
c2lvbiBBRkFJQ1MuICBJdCdzIGFsd2F5cyBtZWFudCAiYXMgbG9uZyBhcwp0aGUgcGxhdGZvcm0g
c3VwcG9ydHMgaXQiLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
