Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CFEC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqhizFnJtphQGGkVKaFuedgSsJdzrTe4x87AAdrQ50g=; b=3Iq8oT6qfolUFo
	uRMyUkeHQRu3fBw4jL3nOGdNZFM/o6hTk4xRxXt7GgmWWXskJIFOTTiD8VCNseItdZJh2x92CUlrT
	0XGGtDHKlTZ52F8M7hl12SjEMCVh1rB+F+58IINKqfU8flyVd9hQuu/ZViTtEUNf5se2IzXl6IYkt
	Ttkt3IDbe95mPU5e3Al4cpLPT+4HWvoM3VzF8yNI7984fqkhpd8pCkfHtz4AsaIT8HpZScc3lgRSI
	TJcDvefBi+E6QzrgGRr5QgAgPPxvtbquOSsN0RTLPpQ4UozlTgbdEfZyAtVazBNSK+ubTw+t0H+qi
	VOU5+eP7ZWS1VrIqUiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJ2m-0036W8-1O;
	Fri, 12 Jan 2024 15:02:00 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJ2i-0036VF-1O;
	Fri, 12 Jan 2024 15:01:58 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-598a2136259so372045eaf.1;
        Fri, 12 Jan 2024 07:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705071714; x=1705676514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkosH+fDx4uydKCIfas+gX+lZQ+YATp8/cxPr7LCjXQ=;
        b=vHxmDzwc+pDPfTPx2pNsoX0i4pBYCOhsxQBDZjzxdFYRGDwSN+nrdOyzYJ1nPpZ24L
         843BP9bJBk9mhQ9DrI6/LRwTy/iEqqCC7AZiul2KPbEip4FynKTWxPuKkueDLrzFC+wF
         d5tlFNbgCzL1NZ1+5qBFJpFxyhUeJ4ko7bgXPgsjlYAOyd3252X3Qu/grGSpu0Vlf/5p
         3MilHxGSU1TUHBc0MiOdjLljIzDvAbgugsnfXv3k8zgiWBeApWaYojuVrkSNMdVrZP0W
         YJTjrCDhPCfSG6jBDRfaPdsJ/aVjNH5eGryDrBQ0xpxF/DMk0bNlOBer5tE5cxNjGXy2
         J3mQ==
X-Gm-Message-State: AOJu0YxFAMkSic460eFe4Pk5yDTIfRMWxIai8WQuD5F1yW1CUza91FeD
	3BNkue9aeowJyWa1rRN5U6AGXL29N9DqfvNB1Vo=
X-Google-Smtp-Source: AGHT+IERQpK6tU+v/yvWRcm25F/amqoeR5fMDTcAHWek3SJqIecgzoDoVF8A5t7OAIKhoJcTR5teFvLzHtkulu/Qeec=
X-Received: by 2002:a05:6820:510:b0:598:c118:30d1 with SMTP id
 m16-20020a056820051000b00598c11830d1mr2644001ooj.0.1705071713471; Fri, 12 Jan
 2024 07:01:53 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
 <20240111175908.00002f46@Huawei.com> <ZaA3l4yjgCXxSiVg@shell.armlinux.org.uk> <20240112092520.00001278@Huawei.com>
In-Reply-To: <20240112092520.00001278@Huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 12 Jan 2024 16:01:40 +0100
Message-ID: <CAJZ5v0g2CFPrSfNzHKBz_Spwt304QEQtR6w57VR11i5APPrD8Q@mail.gmail.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_070156_470419_DF06C9A5 
X-CRM114-Status: GOOD (  36.91  )
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

T24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgMTA6MjXigK9BTSBKb25hdGhhbiBDYW1lcm9uCjxKb25h
dGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAxMSBKYW4gMjAyNCAx
ODo0Njo0NyArMDAwMAo+ICJSdXNzZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5v
cmcudWs+IHdyb3RlOgo+Cj4gPiBPbiBUaHUsIEphbiAxMSwgMjAyNCBhdCAwNTo1OTowOFBNICsw
MDAwLCBKb25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+ID4gPiBPbiBNb24sIDE4IERlYyAyMDIzIDIx
OjE3OjM0ICswMTAwCj4gPiA+ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJhZmFlbEBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4KPiA+ID4gPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjQ54oCvUE0g
UnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4gPiA+
Cj4gPiA+IERvbmUgc29tZSBkaWdnaW5nICsgbWFjaGluZSBmYWtpbmcuICBUaGlzIGlzIG1pZCBz
dGFnZSByZXN1bHRzIGF0IGJlc3QuCj4gPiA+Cj4gPiA+IFN1bW1hcnk6IEkgZG9uJ3QgdGhpbmsg
dGhpcyBwYXRjaCBpcyBuZWNlc3NhcnkuICBJZiBhbnlvbmUgaGFwcGVucyB0byBiZSBpbgo+ID4g
PiB0aGUgbW9vZCBmb3IgdGVzdGluZyBvbiB2YXJpb3VzIHBsYXRmb3JtcywgY2FuIHlvdSBkcm9w
IHRoaXMgcGF0Y2ggYW5kCj4gPiA+IHNlZSBpZiBldmVyeXRoaW5nIHN0aWxsIHdvcmtzLgo+ID4g
Pgo+ID4gPiBXaXRoIHRoaXMgcGF0Y2ggaW4gcGxhY2UsIGFuZCBhIHByb2Nlc3NvciBjb250YWlu
ZXIgY29udGFpbmluZwo+ID4gPiBQcm9jZXNzb3IoKSBvYmplY3RzIGFjcGlfcHJvY2Vzc19hZGQg
aXMgY2FsbGVkIHR3aWNlIC0gb25jZSB2aWEKPiA+ID4gdGhlIHBhdGggYWRkZWQgaGVyZSBhbmQg
b25jZSB2aWEgYWNwaV9idXNfYXR0YWNoIGV0Yy4KPiA+ID4KPiA+ID4gTWF5YmUgaXQncyBhIGxl
ZnQgb3ZlciBmcm9tIGVhcmxpZXIgYXBwcm9hY2hlcyB0byBzb21lIG9mIHRoaXM/Cj4gPgo+ID4g
RnJvbSB3aGF0IHlvdSdyZSBzYXlpbmcsIGl0IHNlZW1zIHRoYXQgd2F5LiBJdCB3b3VsZCBiZSBy
ZWFsbHkgZ29vZCB0bwo+ID4gZ2V0IGEgcmVwbHkgZnJvbSBKYW1lcyB0byBzZWUgd2hldGhlciBo
ZSBhZ3JlZXMgLSBvciBhdCBsZWFzdCBnZXQgdGhlCj4gPiByZWFzb24gd2h5IHRoaXMgcGF0Y2gg
aXMgaW4gdGhlIHNlcmllcy4uLiBidXQgSSBzdXNwZWN0IHRoYXQgd2lsbCBuZXZlcgo+ID4gY29t
ZS4KPiA+Cj4gPiA+IEJvdGggY2FzZXMgYXJlIGNvdmVyZWQgYnkgdGhlIGV4aXN0aW5nIGhhbmRs
aW5nIHdpdGhvdXQgdGhpcy4KPiA+ID4KPiA+ID4gSSdtIGZhciBmcm9tIGNsZWFyIG9uIHdoeSB3
ZSBuZWVkIHRoaXMgcGF0Y2guICBQcmVzdW1hYmx5Cj4gPiA+IGl0J3MgdGhlIHJlZmVyZW5jZSBp
biB0aGUgZGVzY3JpcHRpb24gb24gaXQgYnJlYWtpbmcgZm9yCj4gPiA+IFByb2Nlc3NvciBQYWNr
YWdlIGNvbnRhaW5pbmcgUHJvY2Vzc29yKCkgb2JqZWN0cyB0aGF0IG1hdHRlcnMKPiA+ID4gYWZ0
ZXIgYSBtb3ZlLi4uIEknbSBzdHJ1Z2dsaW5nIHRvIGZpbmQgdGhhdCBtb3ZlIHRob3VnaCEKPiA+
Cj4gPiBJIGRvIGtub3cgdGhhdCBKYW1lcyBkaWQgYSBsb3Qgb2YgdGVzdGluZywgc28gbWF5YmUg
aGUgZm91bmQgc29tZQo+ID4gY29ybmVyIGNhc2Ugc29tZXdoZXJlIHdoaWNoIG1hZGUgdGhpcyBu
ZWNlc3NhcnkgLSBidXQgd2l0aG91dCBpbnB1dAo+ID4gZnJvbSBKYW1lcywgd2UgY2FuJ3Qga25v
dyB0aGF0Lgo+ID4KPiA+IFNvLCBtYXliZSB0aGUgcmlnaHQgd2F5IGZvcndhcmQgb24gdGhpcyBp
cyB0byByZS10ZXN0IHRoZSBzZXJpZXMKPiA+IHdpdGggdGhpcyBwYXRjaCBkcm9wcGVkLCBhbmQg
c2VlIHdoZXRoZXIgdGhlcmUncyBhbnkgaWxsIGVmZmVjdHMuCj4gPiBJdCBzaG91bGQgYmUgcG9z
c2libGUgdG8gcmVzdXJlY3QgdGhlIHBhdGNoIGlmIGl0IGRvZXMgdHVybiBvdXQgdG8KPiA+IGJl
IG5lY2Vzc2FyeS4KPiA+Cj4gPiBEb2VzIHRoYXQgc291bmQgbGlrZSBhIGdvb2Qgd2F5IGZvcndh
cmQ/Cj4gPgo+ID4gVGhhbmtzLgo+ID4KPgo+IFllcyB0aGF0IHNvdW5kcyBsaWtlIHRoZSBiZXN0
IHBsYW4uIE5vdGUgdGhpcyBwYXRjaCBjYW4gb25seSBtYWtlIGEKPiBkaWZmZXJlbmNlIG9uIG5v
biBhcm02NCBhcmNoZXMgYmVjYXVzZSBpdCdzIGEgZmlybXdhcmUgYnVnIHRvIGNvbWJpbmUKPiBQ
cm9jZXNzb3IoKSB3aXRoIGEgR0lDQyBlbnRyeSBpbiBBUElDL01BRFQuICBUbyBldmVuIHRlc3Qg
b24gQVJNNjQKPiB5b3UgaGF2ZSB0byBza2lwIHRoZSBidWcgY2hlY2suCj4KPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvYWNwaS9wcm9jZXNz
b3JfY29yZS5jI0wxMDEKPgo+ICAgICAgICAgLyogZGV2aWNlX2RlY2xhcmF0aW9uIG1lYW5zIERl
dmljZSBvYmplY3QgaW4gRFNEVCwgaW4gdGhlCj4gICAgICAgICAgKiBHSUMgaW50ZXJydXB0IG1v
ZGVsLCBsb2dpY2FsIHByb2Nlc3NvcnMgYXJlIHJlcXVpcmVkIHRvCj4gICAgICAgICAgKiBoYXZl
IGEgUHJvY2Vzc29yIERldmljZSBvYmplY3QgaW4gdGhlIERTRFQsIHNvIHdlIHNob3VsZAo+ICAg
ICAgICAgICogY2hlY2sgZGV2aWNlX2RlY2xhcmF0aW9uIGhlcmUKPiAgICAgICAgICAqLwo+IC8v
ICAgICAgaWYgKGRldmljZV9kZWNsYXJhdGlvbiAmJiAoZ2ljYy0+dWlkID09IGFjcGlfaWQpKSB7
Cj4gICAgICAgICBpZiAoZ2ljYy0+dWlkID09IGFjcGlfaWQpIHsKPiAgICAgICAgICAgICAgICAg
Km1waWRyID0gZ2ljYy0+YXJtX21waWRyOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAg
ICAgICAgIH0KPgo+IE9ubHkgYWx0ZXJuYXRpdmUgaXMgcHJvYmFibHkgdG8gZ28gaGlzdG9yeSBk
aXZpbmcgYW5kIHRyeSBhbmQKPiBmaW5kIGFub3RoZXIgY2hhbmdlIHRoYXQgd291bGQgaGF2ZSBy
ZXF1aXJlZCB0aGlzIGFuZCBpcyBub3cgZ29uZS4KPgo+IFRoZSBBQ1BJIHNjYW5uaW5nIGNvZGUg
aGFzIGhhZCBhIGxvdCBvZiBjaGFuZ2VzIHdoaWxzdCB0aGlzIHdvcmsgaGFzCj4gYmVlbiB1bmRl
cndheS4gIE1vcmUgdGhhbiBwb3NzaWJsZSB0aGF0IHRoaXMgd2FzIHBhcGVyaW5nIG92ZXIgc29t
ZQo+IGlzc3VlIHRoYXQgaGFzIGxvbmcgc2luY2UgYmVlbiBmaXhlZC4gSSBjYW4ndCBmaW5kIGFu
eSBkZWxpYmVyYXRlCj4gZnVuY3Rpb25hbCBjaGFuZ2VzLCBidXQgdGhlcmUgaXMgc29tZSBjb2Rl
IGdlbmVyYWxpemF0aW9uIHRoYXQgJ21pZ2h0Jwo+IGhhdmUgc2lkZSBlZmZlY3RzIGluIHRoaXMg
YXJlYS4gUmFmYWVsLCBhbnkgZXhwZWN0YXRpb24gdGhhdCBhbnl0aGluZwo+IGNoYW5nZWQgaW4g
aG93IHNjYW5uaW5nIHByb2Nlc3NvciBjb250YWluZXJzIHdvcmtzPwoKVGhlcmUgaGF2ZSBiZWVu
IGNoYW5nZXMsIGJ1dCBJIGNhbid0IHJlY2FsbCB3aGVuIGV4YWN0bHkgd2l0aG91dCBzb21lCmdp
dCBoaXN0b3J5IHJlc2VhcmNoLgoKSW4gYW55IGNhc2UsIGl0IGlzIGFsd2F5cyBiZXR0ZXIgdG8g
d29yayBvbiB0b3Agb2YgdGhlIGN1cnJlbnQKbWFpbmxpbmUgY29kZSBJTU8uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
