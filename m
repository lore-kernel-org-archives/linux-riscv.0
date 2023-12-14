Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C4AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 18:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMYCJOHT7x7CSKVZpS9VqDY31uxWXayNCHkAlCAIJK8=; b=wpv3t0Fj869qAJ
	+1fqSmjr8hyrPmki1JC1dL6B7h4lQB0AZ8yNFL2efD+XYOWY3Vr5kjZ+mKVRbMEtO0L73sl83/tV3
	X2fTAxyNleAigt8IfP4Ybt/f8Dh/Enpc1C8sAxPGlquOT2I8xklh0PTxTg0Iw3T9wl0mBFZD//NsD
	1OGPzwLBKPDJW3w7VvXv6bV6zV3u4+Nanl2l4EjFSUwCu98tt7MMZX6RpkDOZCWT5IhPtnQZEuj6A
	7ECJ2NXefAGEkf8ogutPW4moJqHtg3eZKhcoEmVTRP/29PB3J9Cs9dPzbs2RrI8EHw/+R5AwPbxIL
	SG7kaCT5HjBP11i6DpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqaN-0013Jj-26;
	Thu, 14 Dec 2023 18:37:27 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqaJ-0013Iz-2O;
	Thu, 14 Dec 2023 18:37:25 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6d9db92bd71so1362895a34.1;
        Thu, 14 Dec 2023 10:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702579042; x=1703183842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqDz+iAKQeDij2eq7OD06mj+eeeCJzCcbsR1GzAidN0=;
        b=G8rxDHH5MKRHf7tXKpeVRVS7/adgfNwxSZuL6FEC/AZTp5TY0lFGRPJvJyEkvoswYt
         44ZtbJaakHm1RpdZenA1m+hX+6Ud2lpc46SAPvrzazwwbPPh3bMpnIueRTds62mkD0vj
         nVWG1L6H3ExYmAbYU1Mw6wzE3RNKKKyLmwY7P8N4URSv4QYB0vZ+el8B27IJRvRqIs40
         M61otfVWpz18GZF3L7STwvV2ZOiwH+N65rBsIeF66qSn4QyeL/8McFjaclgNZkITbIMS
         pSmFP3CNxN09AalK8Dn2KOdcj/CyGus4XlkW7Cy+F0uqe5f0du2wgjbfN6f8iTQexmSW
         MRwA==
X-Gm-Message-State: AOJu0YyfMCct+thovbPojq+9BC/dYlTdF+HLF9vN4utjJ18sZ9JmMIsu
	udNzZdVnOL+jfiEojEdrcVQO2CGDZUWAYkCKMv0=
X-Google-Smtp-Source: AGHT+IH8dSvedIux9d+NZsh4BTm5s5Qcmw1364ii+UUrmzx3iZ4v2EO7x7vwseaBvGWSY8WP8bGNCshWcK/LSOMs+p0=
X-Received: by 2002:a05:6871:2284:b0:1fb:648:5207 with SMTP id
 sd4-20020a056871228400b001fb06485207mr19135855oab.2.1702579042101; Thu, 14
 Dec 2023 10:37:22 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOfs-00DvjY-HQ@rmk-PC.armlinux.org.uk>
 <20231214173241.0000260f@Huawei.com> <CAJZ5v0jymOtZ0y65K9wE8FJk+ZKwP+FoGm4AKHXcYVfQJL9MVw@mail.gmail.com>
 <ZXtFBYJEX2RrFrwj@shell.armlinux.org.uk> <CAJZ5v0h2Keyb-gFWFuPsKtwqjXvM2snyGpo6MMfFzaXKbfEpgw@mail.gmail.com>
In-Reply-To: <CAJZ5v0h2Keyb-gFWFuPsKtwqjXvM2snyGpo6MMfFzaXKbfEpgw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 14 Dec 2023 19:37:10 +0100
Message-ID: <CAJZ5v0h3WWtvrbxRpaGfq6c756k+L1SzZ1Gv3A14JxXHNcUMKA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or functional) devices
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
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
X-CRM114-CacheID: sfid-20231214_103723_774591_865D2E38 
X-CRM114-Status: GOOD (  32.63  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNzoxNuKAr1BNIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZh
ZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIERlYyAxNCwgMjAyMyBhdCA3OjEw4oCv
UE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6
Cj4gPgo+ID4gT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMDY6NDc6MDBQTSArMDEwMCwgUmFmYWVs
IEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+IE9uIFRodSwgRGVjIDE0LCAyMDIzIGF0IDY6MzLigK9Q
TSBKb25hdGhhbiBDYW1lcm9uCj4gPiA+IDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCAxMyBEZWMgMjAyMyAxMjo0OToxNiArMDAwMAo+
ID4gPiA+IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VA
YXJtLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUb2RheSB0aGUgQUNQSSBlbnVtZXJhdGlvbiBj
b2RlICd2aXNpdHMnIGFsbCBkZXZpY2VzIHRoYXQgYXJlIHByZXNlbnQuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhpcyBpcyBhIHByb2JsZW0gZm9yIGFybTY0LCB3aGVyZSBDUFVzIGFyZSBhbHdheXMg
cHJlc2VudCwgYnV0IG5vdAo+ID4gPiA+ID4gYWx3YXlzIGVuYWJsZWQuIFdoZW4gYSBkZXZpY2Ut
Y2hlY2sgb2NjdXJzIGJlY2F1c2UgdGhlIGZpcm13YXJlLXBvbGljeQo+ID4gPiA+ID4gaGFzIGNo
YW5nZWQgYW5kIGEgQ1BVIGlzIG5vdyBlbmFibGVkLCB0aGUgZm9sbG93aW5nIGVycm9yIG9jY3Vy
czoKPiA+ID4gPiA+IHwgYWNwaSBBQ1BJMDAwNzo0ODogRW51bWVyYXRpb24gZmFpbHVyZQo+ID4g
PiA+ID4KPiA+ID4gPiA+IFRoaXMgaXMgdWx0aW1hdGVseSBiZWNhdXNlIGFjcGlfZGV2X3JlYWR5
X2Zvcl9lbnVtZXJhdGlvbigpIHJldHVybnMKPiA+ID4gPiA+IHRydWUgZm9yIGEgZGV2aWNlIHRo
YXQgaXMgbm90IGVuYWJsZWQuIFRoZSBBQ1BJIFByb2Nlc3NvciBkcml2ZXIKPiA+ID4gPiA+IHdp
bGwgbm90IHJlZ2lzdGVyIHN1Y2ggQ1BVcyBhcyB0aGV5IGFyZSBub3QgJ2RlY29kaW5nIHRoZWly
IHJlc291cmNlcycuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2hhbmdlIGFjcGlfZGV2X3JlYWR5X2Zv
cl9lbnVtZXJhdGlvbigpIHRvIGFsc28gY2hlY2sgdGhlIGVuYWJsZWQgYml0Lgo+ID4gPiA+ID4g
QUNQSSBhbGxvd3MgYSBkZXZpY2UgdG8gYmUgZnVuY3Rpb25hbCBpbnN0ZWFkIG9mIG1haW50YWlu
aW5nIHRoZQo+ID4gPiA+ID4gcHJlc2VudCBhbmQgZW5hYmxlZCBiaXQuIE1ha2UgdGhpcyBiZWhh
dmlvdXIgYW4gZXhwbGljaXQgY2hlY2sgd2l0aAo+ID4gPiA+ID4gYSByZWZlcmVuY2UgdG8gdGhl
IHNwZWMsIGFuZCB0aGVuIGNoZWNrIHRoZSBwcmVzZW50IGFuZCBlbmFibGVkIGJpdHMuCj4gPiA+
ID4gPiBUaGlzIGlzIG5lZWRlZCB0byBhdm9pZCBlbnVtZXJhdGluZyBwcmVzZW50ICYmIGZ1bmN0
aW9uYWwgZGV2aWNlcyB0aGF0Cj4gPiA+ID4gPiBhcmUgbm90IGVuYWJsZWQuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+
Cj4gPiA+ID4gPiBUZXN0ZWQtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUuY29t
Pgo+ID4gPiA+ID4gVGVzdGVkLWJ5OiBWaXNobnUgUGFqanVyaSA8dmlzaG51QG9zLmFtcGVyZWNv
bXB1dGluZy5jb20+Cj4gPiA+ID4gPiBUZXN0ZWQtYnk6IEppYW55b25nIFd1IDxqaWFueW9uZy53
dUBhcm0uY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUp
IDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gSWYg
dGhpcyBjaGFuZ2UgY2F1c2VzIHByb2JsZW1zIG9uIGRlcGxveWVkIGhhcmR3YXJlLCBJIHN1Z2dl
c3QgYW4KPiA+ID4gPiA+IGFyY2ggb3B0LWluOiBBQ1BJX0lHTk9SRV9TVEFfRU5BQkxFRCwgdGhh
dCBjYXVzZXMKPiA+ID4gPiA+IGFjcGlfZGV2X3JlYWR5X2Zvcl9lbnVtZXJhdGlvbigpIHRvIG9u
bHkgY2hlY2sgdGhlIHByZXNlbnQgYml0Lgo+ID4gPiA+Cj4gPiA+ID4gTXkgZ3V0IGZlZWxpbmcg
KGhhdmluZyBtYWRlIEFDUEkgJ2ZpeGVzJyBpbiB0aGUgcGFzdCB0aGF0IHJhbiBpbnRvCj4gPiA+
ID4gaG9ycmlibHkgYnJva2VuIGZpcm13YXJlIGFuZCBoYWQgdG8gYmUgcmV2ZXJ0ZWQpIGlzIHJl
ZHVjZSB0aGUgYmxhc3QKPiA+ID4gPiByYWRpdXMgcHJlZW1wdGl2ZWx5IGZyb20gdGhlIHN0YXJ0
LiBJJ2QgbG92ZSB0byBsaXZlIGluIGEgd29ybGQgd2VyZQo+ID4gPiA+IHRoYXQgd2Fzbid0IG5l
Y2Vzc2FyeSBidXQgSSBkb24ndCB0cnVzdCBhbGwgdGhlIGdlbmVyYXRvcnMgb2YgQUNQSSB0YWJs
ZXMuCj4gPiA+ID4gSSdsbCBsZWF2ZSBpdCB0byBSYWZhZWwgYW5kIG90aGVyIEFDUEkgZXhwZXJ0
cyBzdWdnZXN0IGhvdyBuYXJyb3cgd2Ugc2hvdWxkCj4gPiA+ID4gbWFrZSBpdCB0aG91Z2ggLSBh
cmNoIG9wdCBpbiBtaWdodCBiZSBuYXJyb3cgZW5vdWdoLgo+ID4gPgo+ID4gPiBBIGNoaWNrZW4g
Yml0IHdvdWxkbid0IGhlbHAgbXVjaCBJTU8sIGVzcGVjaWFsbHkgaW4gdGhlIGNhc2VzIHdoZW4K
PiA+ID4gd29ya2luZyBzZXR1cHMgZ2V0IGJyb2tlbi4KPiA+ID4KPiA+ID4gSSB3b3VsZCB2ZXJ5
IG11Y2ggcHJlZmVyIHRvIGxpbWl0IHRoZSBzY29wZSBvZiBpdCwgc2F5IHRvIHByb2Nlc3NvcnMK
PiA+ID4gb25seSwgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4KPiA+IFRoYW5rcyBmb3IgdGhlIGZl
ZWRiYWNrIGFuZCB0aGUgaWRlYS4KPiA+Cj4gPiBJIGd1ZXNzIHdlIG5lZWQgc29tZXRoaW5nIGxp
a2U6Cj4gPgo+ID4gICAgICAgICBpZiAoZGV2aWNlLT5zdGF0dXMucHJlc2VudCkKPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gZGV2aWNlLT5kZXZpY2VfdHlwZSAhPSBBQ1BJX0JVU19UWVBFX1BS
T0NFU1NPUiB8fAo+ID4gICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2UtPnN0YXR1cy5lbmFi
bGVkOwo+ID4gICAgICAgICBlbHNlCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGRldmljZS0+
c3RhdHVzLmZ1bmN0aW9uYWw7Cj4gPgo+ID4gc28gd2Ugb25seSBjaGVjayBkZXZpY2UtPnN0YXR1
cy5lbmFibGVkIGZvciBwcm9jZXNzb3ItdHlwZSBkZXZpY2VzPwo+Cj4gWWVzLCBzb21ldGhpbmcg
bGlrZSB0aGlzLgoKSG93ZXZlciwgdGhhdCBpcyBub3Qgc3VmZmljaWVudCwgYmVjYXVzZSB0aGVy
ZSBhcmUKQUNQSV9CVVNfVFlQRV9ERVZJQ0UgZGV2aWNlcyByZXByZXNlbnRpbmcgcHJvY2Vzc29y
cy4KCkknbSBub3Qgc3VyZSBhYm91dCBhIGNsZWFuIHdheSB0byBkbyBpdCBBVE0uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
