Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F75FC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSe/uf3w11BAdMpqCncw7ZhjYbrk8EwApOP8H48kgVE=; b=j0TcL9BqFfqeEJ
	N0UqhUhfP8/nSp5T+N42D4WsgLcvGZPQ+i6tce+5G6OR5ghKQoPlEzZBn6a0CUiP/B82y3NAaNUlt
	NbpoYYtigWJ1U2xxWPwmEh/iMY3lQbmHz0xgEVrXBhY9tYMlUNB4DUWYeQ9/hgXGBl9amnDzEsN4l
	0MDBrHJLgbL5N0RlRYndjjLGuv7sgDS/AQMcJFtAs2aJTZdSEJYWf8VqO06gb3RKmK2Hs+m1ePG2L
	7CPsAR8zVa84X0MsiUBSkheEOh1Xi7ZNQviZt6FNhY6miihMw+lt/F+JbhsvMUjT968xj0ucGcvPl
	4UuzKyxtzDrru5eFzrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeEm-00F3w8-0g;
	Tue, 19 Dec 2023 17:50:36 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeEi-00F3tG-2M;
	Tue, 19 Dec 2023 17:50:34 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-593f182f263so114964eaf.0;
        Tue, 19 Dec 2023 09:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008230; x=1703613030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIdikjM2NM0B5fwp5wKpgGui6ScB4p2R3IMX5NwS0ok=;
        b=JGcfN995QseKDKxBbR/AzCHhHz5T6Tq5yqcCNHjfxh9tJaO6AP617yM6oC7PL/SXMH
         dUapE0tz+g27dKM7fUl3lpUqtSA/ItokElz7Q4VNLibNqcBEYlyEvucs4tGStKBc+QHi
         vYHVExuAQHMIff6QEqHF+IUAVCp4ojViQyrjRDVExp4mvKUna920jS63fP3G+DPYT7k3
         3qt/CGdu0Tnl9cjj99kYjwLKcbQsCzogqUXk6ULxvBqFZ/QdRAR6JECtCFerOQYUOseg
         URlaccSD3HzHntbVJ8YNi7/D3HJw5nKkE1c/VtopVy+5hf8gX7aSpAPgiqXPC4MRZtKV
         jEzw==
X-Gm-Message-State: AOJu0YyThbvJO6/H3xNPPb1UZ1cRu0gwvUf1eJQkal10CJSuxIAa2lpo
	9zah7/Dei9U7RAo9CtfrHspC59Ou47r6K0dMci4=
X-Google-Smtp-Source: AGHT+IFCQvZAgqrtipbyRJTOVOETMEvHgFW0NX7bvW4mXju3ST3yT0F/qBGe1Vu0qs7mI+XzxyVbVlBQ09EqkNHkiTo=
X-Received: by 2002:a05:6820:2a18:b0:590:9027:7ab0 with SMTP id
 dr24-20020a0568202a1800b0059090277ab0mr27147443oob.0.1703008230114; Tue, 19
 Dec 2023 09:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 19 Dec 2023 18:50:19 +0100
Message-ID: <CAJZ5v0j6Veze8xDFKTbVZ5=WAfmLdeJ8NXRnh9kwCZgyaDdgew@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/17] RISC-V: ACPI: Add external interrupt
 controller support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_095032_774176_179E6EC4 
X-CRM114-Status: GOOD (  25.00  )
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgNjo0NeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhl
IGJlbG93IEVDUiBhcHByb3ZlZCBieSBBU1dHLgo+IDEpIE1BRFQgLSBodHRwczovL2RyaXZlLmdv
b2dsZS5jb20vZmlsZS9kLzFvTUdQeU9ENThKYVBnTWwxcEthc1QtVktzSUtpYTd6Ui92aWV3P3Vz
cD1zaGFyaW5nCj4KPiBUaGUgc2VyaWVzIHByaW1hcmlseSBlbmFibGVzIGlycWNoaXAgZHJpdmVy
cyBmb3IgUklTQy1WIEFDUEkgYmFzZWQKPiBwbGF0Zm9ybXMuCj4KPiBUaGUgc2VyaWVzIGNhbiBi
ZSBicm9hZGx5IGNhdGVnb3JpemVkIGxpa2UgYmVsb3cuCj4KPiAxKSBQQ0kgQUNQSSByZWxhdGVk
IGZ1bmN0aW9ucyBhcmUgbWlncmF0ZWQgZnJvbSBhcm02NCB0byBjb21tb24gZmlsZSBzbwo+IHRo
YXQgd2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUgdGhlbSBmb3IgUklTQy1WLgo+Cj4gMikgSW50
cm9kdWNlZCBzdXBwb3J0IGZvciBmd19kZXZsaW5rIGZvciBBQ1BJIG5vZGVzIGZvciBJUlEgZGVw
ZW5kZW5jeS4KPiBUaGlzIGhlbHBzIHRvIHN1cHBvcnQgZGVmZXJyZWQgcHJvYmUgb2YgaW50ZXJy
dXB0IGNvbnRyb2xsZXIgZHJpdmVycy4KPgo+IDMpIE1vZGlmaWVkIHBucF9pcnEoKSB0byB0cnkg
cmVnaXN0ZXJpbmcgdGhlIElSUSAgYWdhaW4gaWYgaXQgc2VlcyBpdCBpbgo+IGRpc2FibGVkIHN0
YXRlLiBUaGlzIHNvbHV0aW9uIGlzIHNpbWlsYXIgdG8gaG93Cj4gcGxhdGZvcm1fZ2V0X2lycV9v
cHRpb25hbCgpIHdvcmtzIGZvciByZWd1bGFyIHBsYXRmb3JtIGRldmljZXMuCj4KPiA0KSBBZGRl
ZCBzdXBwb3J0IGZvciByZS1vcmRlcmluZyB0aGUgcHJvYmUgb2YgaW50ZXJydXB0IGNvbnRyb2xs
ZXJzIHdoZW4KPiBJUlFDSElQX0FDUElfREVDTEFSRSBpcyB1c2VkLgo+Cj4gNSkgQUNQSSBzdXBw
b3J0IGFkZGVkIGluIFJJU0MtViBpbnRlcnJ1cHQgY29udHJvbGxlciBkcml2ZXJzLgo+Cj4gVGhp
cyBzZXJpZXMgaXMgYmFzZWQgb24gQW51cCdzIEFJQSB2MTEgc2VyaWVzLiBTaW5jZSBBbnVwJ3Mg
QUlBIHYxMSBpcwo+IG5vdCBtZXJnZWQgeWV0IGFuZCBmaXJzdCB0aW1lIGludHJvZHVjaW5nIGZ3
X2RldmxpbmssIGRlZmVycmVkIHByb2JlIGFuZAo+IHJlb3JkZXJpbmcgc3VwcG9ydCBmb3IgSVJR
Q0hJUCBwcm9iZSwgdGhpcyBzZXJpZXMgaXMgc3RpbGwga2VwdCBhcyBSRkMuCj4gTG9va2luZyBm
b3J3YXJkIGZvciB0aGUgZmVlZGJhY2shCj4KPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MjoKPiAgICAg
ICAgIDEpIEludHJvZHVjZWQgZndfZGV2bGluayBmb3IgQUNQSSBub2RlcyBmb3IgSVJRIGRlcGVu
ZGVuY3kuCj4gICAgICAgICAyKSBEcm9wcGVkIHBhdGNoZXMgaW4gZHJpdmVycyB3aGljaCBhcmUg
bm90IHJlcXVpcmVkIGR1ZSB0bwo+ICAgICAgICAgICAgZndfZGV2bGluayBzdXBwb3J0Lgo+ICAg
ICAgICAgMykgRHJvcHBlZCBwY2lfc2V0X21zaSgpIHBhdGNoIGFuZCBhZGRlZCBhIHBhdGNoIGlu
Cj4gICAgICAgICAgICBwY2lfY3JlYXRlX3Jvb3RfYnVzKCkuCj4gICAgICAgICA0KSBVcGRhdGVk
IHBucF9pcnEoKSBwYXRjaCBzbyB0aGF0IG5vbmUgb2YgdGhlIGFjdHVhbCBQTlAKPiAgICAgICAg
ICAgIGRyaXZlcnMgbmVlZCB0byBjaGFuZ2UuCj4KPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MToKPiAg
ICAgICAgIDEpIEFiYW5kb25lZCBzd25vZGUgYXBwcm9hY2ggYXMgcGVyIE1hcmMncyBmZWVkYmFj
ay4KPiAgICAgICAgIDIpIFRvIGNvcGUgdXAgd2l0aCBBSUEgc2VyaWVzIGNoYW5nZXMgd2hpY2gg
Y2hhbmdlZCBpcnFjaGlwIGRyaXZlcgo+ICAgICAgICAgICAgcHJvYmUgZnJvbSBjb3JlX2luaXRj
YWxsKCkgdG8gcGxhdGZvcm1fZHJpdmVyLCBhZGRlZCBwYXRjaGVzCj4gICAgICAgICAgICB0byBz
dXBwb3J0IGRlZmVycmVkIHByb2JpbmcuCj4gICAgICAgICAzKSBSZWJhc2VkIG9uIHRvcCBvZiBB
bnVwJ3MgQUlBIHYxMSBhbmQgYWRkZWQgdGFncy4KPgo+IFRvIHRlc3QgdGhlIHNlcmllcywKPgo+
IDEpIFFlbXUgc2hvdWxkIGJlIGJ1aWx0IHVzaW5nIHRoZSByaXNjdl9hY3BpX2IyX3Y4IGJyYW5j
aCBhdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS92bHN1bmlsL3FlbXUuZ2l0Cj4KPiAyKSBFREsyIHNo
b3VsZCBiZSBidWlsdCB1c2luZyB0aGUgaW5zdHJ1Y3Rpb25zIGF0Ogo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS90aWFub2NvcmUvZWRrMi9ibG9iL21hc3Rlci9Pdm1mUGtnL1Jpc2NWVmlydC9SRUFETUUu
bWQKPgo+IDMpIEJ1aWxkIExpbnV4IHVzaW5nIHRoaXMgc2VyaWVzIG9uIHRvcCBvZiBBbnVwJ3Mg
QUlBIHYxMSBzZXJpZXMuCj4KPiBSdW4gUWVtdToKPiBxZW11LXN5c3RlbS1yaXNjdjY0IFwKPiAg
LU0gdmlydCxwZmxhc2gwPXBmbGFzaDAscGZsYXNoMT1wZmxhc2gxLGFpYT1hcGxpYy1pbXNpYyBc
Cj4gIC1tIDJHIC1zbXAgOCBcCj4gIC1zZXJpYWwgbW9uOnN0ZGlvIFwKPiAgLWRldmljZSB2aXJ0
aW8tZ3B1LXBjaSAtZnVsbC1zY3JlZW4gXAo+ICAtZGV2aWNlIHFlbXUteGhjaSBcCj4gIC1kZXZp
Y2UgdXNiLWtiZCBcCj4gIC1ibG9ja2RldiBub2RlLW5hbWU9cGZsYXNoMCxkcml2ZXI9ZmlsZSxy
ZWFkLW9ubHk9b24sZmlsZW5hbWU9UklTQ1ZfVklSVF9DT0RFLmZkIFwKPiAgLWJsb2NrZGV2IG5v
ZGUtbmFtZT1wZmxhc2gxLGRyaXZlcj1maWxlLGZpbGVuYW1lPVJJU0NWX1ZJUlRfVkFSUy5mZCBc
Cj4gIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2UgdmlydGlvLW5ldC1wY2ksbmV0ZGV2PW5l
dDAgXAo+ICAta2VybmVsIGFyY2gvcmlzY3YvYm9vdC9JbWFnZSBcCj4gIC1pbml0cmQgcm9vdGZz
LmNwaW8gXAo+ICAtYXBwZW5kICJyb290PS9kZXYvcmFtIHJvIGNvbnNvbGU9dHR5UzAgcm9vdHdh
aXQgZWFybHljb249dWFydDgyNTAsbW1pbywweDEwMDAwMDAwIgo+Cj4gVG8gYm9vdCB3aXRoIEFQ
TElDIG9ubHksIHVzZSBhaWE9YXBsaWMuCj4gVG8gYm9vdCB3aXRoIFBMSUMsIHJlbW92ZSBhaWE9
IG9wdGlvbi4KPgo+IFRoaXMgc2VyaWVzIGlzIGFsc28gYXZhaWxhYmxlIGluIGFjcGlfYjJfdjNf
cmlzY3ZfYWlhX3YxMSBicmFuY2ggYXQKPiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9saW51
eC5naXQKPgo+IEJhc2VkLW9uOiAyMDIzMTAyMzE3MjgwMC4zMTUzNDMtMS1hcGF0ZWxAdmVudGFu
YW1pY3JvLmNvbQo+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMDIzMTcyODAw
LjMxNTM0My0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLykKPgo+IFN1bmlsIFYgTCAoMTcpOgo+
ICAgYXJtNjQ6IFBDSTogTWlncmF0ZSBBQ1BJIHJlbGF0ZWQgZnVuY3Rpb25zIHRvIHBjaS1hY3Bp
LmMKPiAgIFJJU0MtVjogQUNQSTogSW1wbGVtZW50IFBDSSByZWxhdGVkIGZ1bmN0aW9uYWxpdHkK
PiAgIFBDSTogTWFrZSBwY2lfY3JlYXRlX3Jvb3RfYnVzKCkgZGVjbGFyZSBpdHMgcmVsaWFuY2Ug
b24gTVNJIGRvbWFpbnMKPiAgIEFDUEk6IEFkZCBmd19kZXZsaW5rIHN1cHBvcnQgZm9yIEFDUEkg
Zndub2RlIGZvciBJUlEgZGVwZW5kZW5jeQo+ICAgQUNQSTogaXJxOiBBZGQgc3VwcG9ydCBmb3Ig
ZGVmZXJyZWQgcHJvYmUgaW4gYWNwaV9yZWdpc3Rlcl9nc2koKQo+ICAgcG5wLmg6IFJlY29uZmln
dXJlIElSUSBpbiBwbnBfaXJxKCkgdG8gc3VwcG9ydCBkZWZlcnJlZCBwcm9iZQo+ICAgQUNQSTog
c2Nhbi5jOiBBZGQgd2VhayBhcmNoIHNwZWNpZmljIGZ1bmN0aW9uIHRvIHJlb3JkZXIgdGhlIElS
UUNISVAKPiAgICAgcHJvYmUKPiAgIEFDUEk6IFJJU0MtVjogSW1wbGVtZW50IGFyY2ggZnVuY3Rp
b24gdG8gcmVvcmRlciBpcnFjaGlwIHByb2JlIGVudHJpZXMKPiAgIGlycWNoaXA6IHJpc2N2LWlu
dGM6IEFkZCBBQ1BJIHN1cHBvcnQgZm9yIEFJQQo+ICAgaXJxY2hpcDogcmlzY3YtaW1zaWM6IEFk
ZCBBQ1BJIHN1cHBvcnQKPiAgIGlycWNoaXA6IHJpc2N2LWFwbGljOiBBZGQgQUNQSSBzdXBwb3J0
Cj4gICBpcnFjaGlwOiBpcnEtc2lmaXZlLXBsaWM6IEFkZCBBQ1BJIHN1cHBvcnQKPiAgIEFDUEk6
IGJ1czogQWRkIFJJTlRDIElSUSBtb2RlbCBmb3IgUklTQy1WCj4gICBBQ1BJOiBidXM6IEFkZCBh
Y3BpX3Jpc2N2X2luaXQgZnVuY3Rpb24KPiAgIEFDUEk6IFJJU0MtVjogQ3JlYXRlIEFQTElDIHBs
YXRmb3JtIGRldmljZQo+ICAgQUNQSTogUklTQy1WOiBDcmVhdGUgUExJQyBwbGF0Zm9ybSBkZXZp
Y2UKPiAgIGlycWNoaXA6IHJpc2N2LWludGM6IFNldCBBQ1BJIGlycW1vZGVsCgpKRllJLCBJIGhh
dmUgbm8gY2FwYWNpdHkgdG8gcHJvdmlkZSBhbnkgZmVlZGJhY2sgb24gdGhpcyB0aWxsIDYuOC1y
YzEgaXMgb3V0LgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
