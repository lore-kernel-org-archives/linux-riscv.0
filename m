Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A2BC678DB
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 14:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nT0sDgYzxivxKgiHR0x4r4sF8ZK6tzuBi+DJzvuZsH4=; b=G8vh9ot4+jAixe
	ivW+4AYSLJ+HGaYrOsU7BalQu3J2GR6TFm8mA/9FuGx9AueGL880oIWWW89R7WaWuMpjoTYz8r+5e
	sQZLjUiuAfTbpIVmrHAMxXeXNQ3gwEDau8e/PYZlcq/qWiOr24ppv7Fohl7zCDWNJm8/vqQcRRv4X
	R2/LHDudT/WUQ/B3M8UhjlG3zfMMsWUh3qKWBHeJVvrirGVIGPYHmMZXNdERfJOUJ3gVDcWhqDcCC
	E1gsGjP2ZZLa8oiGZVMQYWYQsrAmoKWHNPdUKeNiQlAjOG7v59DJO0IsNp97R+k3ZPbKPhhVlxTpL
	EnynRRCajujKWYWQwKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYTAz-0098d9-U3; Sat, 04 Mar 2023 14:47:58 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYTAo-0098bL-U5; Sat, 04 Mar 2023 14:47:48 +0000
Received: by mail-qv1-f41.google.com with SMTP id f1so3670711qvx.13;
        Sat, 04 Mar 2023 06:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677941263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeKbxzDZy3GcKkrGUofgHv5MAh6MoP5a08Lg7rMsvMk=;
        b=0Rh6sAJU+6na+OOf8pOmDcUIk4SwvO0THadIfJR0dZZI0MlxvSjE8nRFHO08ilduyA
         opIiNlpRrDg0IhQDfGpSRwwErzT5JifbAXaWK60kLSagf0iwWuv9ICzaT+i3by3wgI8b
         sisdtAk14V8v9GN9F9obWlm3FWWPiM711UKGi3oVq/O+oLBP/EkQysOEhbC2dS5pzWpO
         WmnYiyKzu8So8O3apcZf9cowF2gJORU1ngffB0PFEcQKIdFMLDqJ9y7qQxdraXCiTqsr
         x0aflTW7mqz4HO84KV+pv/zhf2yf84mK+dCIMN1wlEIsY+uB6iW05o9FEG2ZyrHnaL+4
         Inmw==
X-Gm-Message-State: AO0yUKVHBGGl3Hnh8PQ04ur05rVObY9HCJDKB/kw2M+xPeq8Ae/ejHXZ
	ZQqstFueHVh9J34/L87LkgR5dUXKhXParg==
X-Google-Smtp-Source: AK7set/ISALGia0AAI0442RT2Xs/deu7CvIyAR6xLRPUsv8uzIiQFS1/K3a5D0zTl1YtLXllhP4W2w==
X-Received: by 2002:a05:6214:2586:b0:57d:beec:9f77 with SMTP id fq6-20020a056214258600b0057dbeec9f77mr9072123qvb.35.1677941263551;
        Sat, 04 Mar 2023 06:47:43 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 194-20020a370acb000000b0073ba3fd4e4asm3891535qkk.16.2023.03.04.06.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 06:47:43 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-536c02eea4dso97776027b3.4;
        Sat, 04 Mar 2023 06:47:43 -0800 (PST)
X-Received: by 2002:a81:b723:0:b0:536:38b4:f51 with SMTP id
 v35-20020a81b723000000b0053638b40f51mr3187721ywh.5.1677941242747; Sat, 04 Mar
 2023 06:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com>
 <20230301185209.274134-3-jjhiblot@traphandler.com> <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
 <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
In-Reply-To: <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 4 Mar 2023 15:47:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdZatMYsc=367OuGotzYuo2-XVe5MAZdzh+kBs31=t5A@mail.gmail.com>
Message-ID: <CAMuHMdVdZatMYsc=367OuGotzYuo2-XVe5MAZdzh+kBs31=t5A@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: irq: make callers of of_irq_parse_one() release
 the device node
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: saravanak@google.com, clement.leger@bootlin.com, 
	Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, zajec5@gmail.com, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Marc Zyngier <maz@kernel.org>, afaerber@suse.de, 
	Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Nishanth Menon <nm@ti.com>, ssantosh@kernel.org, 
	mathias.nyman@intel.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_064747_003416_E1BF0237 
X-CRM114-Status: GOOD (  33.52  )
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

SGkgSmVhbi1KYWNxdWVzLAoKT24gU2F0LCBNYXIgNCwgMjAyMyBhdCAxMTozNOKAr0FNIEplYW4t
SmFjcXVlcyBIaWJsb3QKPGpqaGlibG90QHRyYXBoYW5kbGVyLmNvbT4gd3JvdGU6Cj4gT24gMDIv
MDMvMjAyMyAwODo0OSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gV2VkLCBNYXIg
MSwgMjAyMyBhdCA3OjUz4oCvUE0gSmVhbi1KYWNxdWVzIEhpYmxvdAo+ID4gPGpqaGlibG90QHRy
YXBoYW5kbGVyLmNvbT4gd3JvdGU6Cj4gPj4gb2ZfaXJxX3BhcnNlX29uZSgpIGRvZXMgYSBnZXQo
KSBvbiB0aGUgZGV2aWNlIG5vZGUgcmV0dXJuZWQgaW4gb3V0X2lycS0+bnAuCj4gPj4gQ2FsbGVy
cyBvZiBvZl9pcnFfcGFyc2Vfb25lKCkgbXVzdCBkbyBhIHB1dCgpIHdoZW4gdGhleSBhcmUgZG9u
ZSB3aXRoIGl0Lgo+ID4KPiA+IFdoYXQgZG9lcyAiYmUgZG9uZSB3aXRoIGl0IiByZWFsbHkgbWVh
biBoZXJlPwo+ID4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhp
YmxvdEB0cmFwaGFuZGxlci5jb20+Cj4gPgo+ID4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc2htb2Jp
bGUvcmVndWxhdG9yLXF1aXJrLXJjYXItZ2VuMi5jCj4gPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1z
aG1vYmlsZS9yZWd1bGF0b3ItcXVpcmstcmNhci1nZW4yLmMKPiA+PiBAQCAtMTg0LDYgKzE4NCw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IHJjYXJfZ2VuMl9yZWd1bGF0b3JfcXVpcmsodm9pZCkKPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUocXVpcmspOwo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiA+PiAgICAgICAgICAgICAgICAgIH0KPiA+PiArICAg
ICAgICAgICAgICAgb2Zfbm9kZV9wdXQoYXJnc2EtPm5wKTsKPiA+Cj4gPiBUaGUgcXVpcmsgb2Jq
ZWN0LCB3aGljaCBpcyBhIGNvbnRhaW5lciBvZiBhcmdzYSwgaXMgc3RpbGwgdXNlZCBiZWxvdywK
PiA+IGFuZCBzdG9yZWQgaW4gYSBsaW5rZWQgbGlzdC4gIEkgYWdyZWUgYXJnc2EtPm5wIGlzIG5v
dCBkZXJlZmVyZW5jZWQsCj4gPiBidXQgdGhlIHBvaW50ZXIgaXRzZWxmIGlzIHN0aWxsIGNvbXBh
cmVkIHRvIG90aGVyIHBvaW50ZXJzLgo+Cj4gSSBmYWlsIHRvIHNlZSB3aGVuIHRoZSBwb2ludGVy
cyBhcmUgY29tcGFyZWQuIEl0IGxvb2tzIHRvIG1lIHRoYXQgb25seQo+IHRoZSBhcmdzIGFyZSBj
b21wYXJlZC4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyA/CgpZb3UncmUgcmlnaHQsIGluIHVwc3Ry
ZWFtLCB0aGVyZSBpcyBubyBzdWNoIGNoZWNrLgpJbiBteSBsb2NhbCB0cmVlLCBJIGhhdmUgY29u
dmVydGVkIHRoZSBjb21wYXJpc29ucyBiZWxvdyB0byB1c2UgYSBuZXcKaGVscGVyIG9mX3BoYW5k
bGVfYXJnc19lcSgpICh3aGljaCBkb2VzIGNvbXBhcmUgdGhlIG5wIG1lbWJlciwgdG9vKSwKYnV0
IHRoYXQgY2hhbmdlIG5ldmVyIHdlbnQgdXBzdHJlYW0sIGFzIHRoZSBvdGhlciB1c2VyIG9mIHRo
YXQgaGVscGVyCndhcyByZWplY3RlZC4KCj4gSW4gYW55IGNhc2UsIGxvb2tpbmcgbW9yZSBjbG9z
ZWx5IGF0IHRoZSBjb2RlLCBJIGd1ZXNzIHRoYXQgaW5kZWVkIHRoZQo+IG9mX25vZGVfcHV0KCkg
c2hvdWxkbid0IGJlIGFkZGVkIGhlcmUgYmVjYXVzZSB0aGlzIGNvZGUgZXhwZWN0cyB0aGF0IHRo
ZQo+IG5vZGVzIG5ldmVyIGdvIGF3YXkuIFRoYXQgaXMgcHJvYmFibHkgYSBnb29kIGFzc2VydGlv
biBpbiBjYXNlIG9mIFBNSUNzCgpPSy4KCj4gPiBJSVVJQywgY2FsbGluZyBvZl9ub2RlX3B1dCgp
IG1pZ2h0IGNhdXNlIHRoZSByZWZlcmVuY2UgY291bnQgdG8gZHJvcCB0bwo+ID4gemVybywgYW5k
IHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBub2RlIG9iamVjdCB0byBiZSBkZWFsbG9jYXRlZC4KPiA+
IFNvIHdoZW4gYSBmdXR1cmUgcmVmZXJlbmNlIHRvIHRoZSBzYW1lIERUIG5vZGUgd2lsbCBiZSB0
YWtlbiwgYSBuZXcKPiA+IHN0cnVjdCBub2RlIG9iamVjdCB3aWxsIGJlIGFsbG9jYXRlZCwgYW5k
IHRoZSBwb2ludGVyIGNvbXBhcmlzb24gYmVsb3cKPiA+IHdpbGwgZmFpbD8KCkdye29ldGplLGVl
dGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
