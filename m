Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9551FC48BC4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 19:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBqb6H1BBMH9F0QlfOxZ+eMTlOIbre6V+RxZSl+V0us=; b=d5kd2qHJTXfu8A
	HkGGLV2oPmuce2K42MbKWBTMCbQc3QxBVRIEl4tVJMkPsKIh0DMjQoOL6dRd1Pl/L0XKQ/sotGlLM
	GtR1cokDW9NEGe1Qkt+JQPxFw4SMpiD5mEE3fBG4QdoGkobTx/IRQpY7J2dDHog7y54eSM5DUPMRf
	ZiPC4+HBAr5UFfNdenVy03UMWjUBU1WNsfcWj4ElfCNQ7sZM3SRzEVWFsRp9C2fMH2wrPRW/IuMsZ
	fRADRGCoOp6xQJnL60bWd0fJ3F58ho0w1U4T+tE4YD2wNg/T8D5XbqZ6D9zhKPYSk+8vq57XN5lr6
	k2mVcEgk5PLCjKPXZwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rahJl-0000000HTza-3BM9;
	Thu, 15 Feb 2024 19:22:45 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rahJi-0000000HTyf-0eMi;
	Thu, 15 Feb 2024 19:22:43 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59f9045d18dso29996eaf.0;
        Thu, 15 Feb 2024 11:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708024960; x=1708629760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atg7WI78HsTq5644XbnZluXts4d5OR/FFe0QfcIw1Ag=;
        b=GjXE606tATsuYKUtmNGuTsnukRth9C70CTZmUscP9W75RD6SfudhSGFNv7XCCXhnr0
         KBMVDI57fzwH9IO2GgCsV7gK0NOPA+SYYjzJiGekK0dP4dy9Ygcr26zEzkInXK24xXiJ
         UjtN/tQa32rDVy3xbos9kNkdflHKb/axxmjfQeJ+wIy/3zUg2IpQhZZXYgzku5255//j
         B8NfyAa1aJgGuFU8aV9bjYh6Eb2JxwBkwWlUA1ZdRbdkcdaX3qkIHfd/QWaFa1Hk3xgy
         9cpzDzjYvy1/nxoiUTWgEC262Oz2OAfDe+YIEKEhRk8YPk2uaaeo6pVz3tJls0Ywln4s
         nOiw==
X-Forwarded-Encrypted: i=1; AJvYcCVXgtuOvhDW/59JSmwuESNqIhwTA6xyrhy0jx+b8xMRVv5ynraELvb3WTrnDE2fmg+NLjW4PZR8u93Fhfn7lF+iq4QrHXC6cz8V/YJyBQAbruewlK7ubmWCHlupvr5AEef6OVL2KSlfCCdSdoBIVVqf5pJcxzo=
X-Gm-Message-State: AOJu0YwPbCnhjCg0JUDA2mSQT6uK0bp1pfy4yEYfGNvwqnqBrpHnUprR
	/sEIoFA58wEOKWdk6BVW2AWPxHxpECbWXsURjPvSCmNbzGZpCRXUg4WGBPMM80dVkGHbd5sJoOB
	TEVLVYYjwLtCOauX8iTmrX+P3bBY=
X-Google-Smtp-Source: AGHT+IGH9nzxfJPZ0b9LL7NeSQVmLFmBC+x3c+fnaZmT/Dcf6w2GoSt64Z11xwqZfq7drVdSJDbhPxjptv1uaDnhYPo=
X-Received: by 2002:a05:6820:1f8d:b0:59c:d8cd:ecee with SMTP id
 eq13-20020a0568201f8d00b0059cd8cdeceemr110694oob.1.1708024960621; Thu, 15 Feb
 2024 11:22:40 -0800 (PST)
MIME-Version: 1.0
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk> <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 15 Feb 2024 20:22:29 +0100
Message-ID: <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from acpi_processor_get_info()
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_112242_221216_09F060DF 
X-CRM114-Status: GOOD (  33.37  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNTo1MOKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBUbyBhbGxvdyBBQ1BJIHRvIHNraXAgdGhlIGNhbGwgdG8gYXJjaF9y
ZWdpc3Rlcl9jcHUoKSB3aGVuIHRoZSBfU1RBCj4gdmFsdWUgaW5kaWNhdGVzIHRoZSBDUFUgY2Fu
J3QgYmUgYnJvdWdodCBvbmxpbmUgcmlnaHQgbm93LCBtb3ZlIHRoZQo+IGFyY2hfcmVnaXN0ZXJf
Y3B1KCkgY2FsbCBpbnRvIGFjcGlfcHJvY2Vzc29yX2dldF9pbmZvKCkuCj4KPiBTeXN0ZW1zIGNh
biBzdGlsbCBiZSBib290ZWQgd2l0aCAnYWNwaT1vZmYnLCBvciBub3QgaW5jbHVkZSBhbgo+IEFD
UEkgZGVzY3JpcHRpb24gYXQgYWxsLiBGb3IgdGhlc2UsIHRoZSBDUFVzIGNvbnRpbnVlIHRvIGJl
Cj4gcmVnaXN0ZXJlZCBieSBjcHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWMoKS4KPgo+IFRoaXMgbW92
ZXMgdGhlIENQVSByZWdpc3RlciBsb2dpYyBiYWNrIHRvIGEgc3Vic3lzX2luaXRjYWxsKCksCj4g
d2hpbGUgdGhlIG1lbW9yeSBub2RlcyB3aWxsIGhhdmUgYmVlbiByZWdpc3RlcmVkIGVhcmxpZXIu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiBS
ZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiBUZXN0ZWQtYnk6IE1p
Z3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUuY29tPgo+IFRlc3RlZC1ieTogVmlzaG51IFBh
amp1cmkgPHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgo+IFRlc3RlZC1ieTogSmlhbnlv
bmcgV3UgPGppYW55b25nLnd1QGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhbWVy
b24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxs
IEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+IC0tLQo+IENoYW5n
ZXMgc2luY2UgUkZDIHYyOgo+ICAqIEZpeHVwIGNvbW1lbnQgaW4gYWNwaV9wcm9jZXNzb3JfZ2V0
X2luZm8oKSAoR2F2aW4gU2hhbikKPiAgKiBBZGQgY29tbWVudCBpbiBjcHVfZGV2X3JlZ2lzdGVy
X2dlbmVyaWMoKSAoR2F2aW4gU2hhbikKPiAtLS0KPiAgZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vz
c29yLmMgfCAxMiArKysrKysrKysrKysKPiAgZHJpdmVycy9iYXNlL2NwdS5jICAgICAgICAgICAg
fCAgNiArKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMgYi9k
cml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+IGluZGV4IGNmN2MxY2NhNjlkZC4uYTY4YzQ3
NWNkZWE1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jCj4gKysr
IGIvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMKPiBAQCAtMzE0LDYgKzMxNCwxOCBAQCBz
dGF0aWMgaW50IGFjcGlfcHJvY2Vzc29yX2dldF9pbmZvKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2
aWNlKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNwdWZyZXFfYWRkX2RldmljZSgiYWNwaS1j
cHVmcmVxIik7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBSZWdpc3Rl
ciBDUFVzIHRoYXQgYXJlIHByZXNlbnQuIGdldF9jcHVfZGV2aWNlKCkgaXMgdXNlZCB0byBza2lw
Cj4gKyAgICAgICAgKiBkdXBsaWNhdGUgQ1BVIGRlc2NyaXB0aW9ucyBmcm9tIGZpcm13YXJlLgo+
ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoIWludmFsaWRfbG9naWNhbF9jcHVpZChwci0+aWQp
ICYmIGNwdV9wcmVzZW50KHByLT5pZCkgJiYKPiArICAgICAgICAgICAhZ2V0X2NwdV9kZXZpY2Uo
cHItPmlkKSkgewo+ICsgICAgICAgICAgICAgICBpbnQgcmV0ID0gYXJjaF9yZWdpc3Rlcl9jcHUo
cHItPmlkKTsKPiArCj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPiArCj4gICAgICAgICAvKgo+ICAgICAg
ICAgICogIEV4dHJhIFByb2Nlc3NvciBvYmplY3RzIG1heSBiZSBlbnVtZXJhdGVkIG9uIE1QIHN5
c3RlbXMgd2l0aAo+ICAgICAgICAgICogIGxlc3MgdGhhbiB0aGUgbWF4ICMgb2YgQ1BVcy4gVGhl
eSBzaG91bGQgYmUgaWdub3JlZCBfaWZmCgpUaGlzIGlzIGludGVyZXN0aW5nLCBiZWNhdXNlIHJp
Z2h0IGJlbG93IHRoZXJlIGlzIHRoZSBmb2xsb3dpbmcgY29kZToKCiAgICBpZiAoaW52YWxpZF9s
b2dpY2FsX2NwdWlkKHByLT5pZCkgfHwgIWNwdV9wcmVzZW50KHByLT5pZCkpIHsKICAgICAgICBp
bnQgcmV0ID0gYWNwaV9wcm9jZXNzb3JfaG90YWRkX2luaXQocHIpOwoKICAgICAgICBpZiAocmV0
KQogICAgICAgICAgICByZXR1cm4gcmV0OwogICAgfQoKYW5kIGFjcGlfcHJvY2Vzc29yX2hvdGFk
ZF9pbml0KCkgZXNzZW50aWFsbHkgY2FsbHMgYXJjaF9yZWdpc3Rlcl9jcHUoKQp3aXRoIHNvbWUg
ZXh0cmEgdGhpbmdzIGFyb3VuZCBpdCAobW9yZSBhYm91dCB0aGF0IGJlbG93KS4KCkkgZG8gcmVh
bGl6ZSB0aGF0IGFjcGlfcHJvY2Vzc29yX2hvdGFkZF9pbml0KCkgaXMgZGVmaW5lZCB1bmRlcgpD
T05GSUdfQUNQSV9IT1RQTFVHX0NQVSwgc28gZm9yIHRoZSBzYWtlIG9mIHRoZSBhcmd1bWVudCBs
ZXQncwpjb25zaWRlciBhbiBhcmNoaXRlY3R1cmUgd2hlcmUgQ09ORklHX0FDUElfSE9UUExVR19D
UFUgaXMgc2V0LgoKU28gd2h5IGFyZSB0aGUgdHdvIGNvbmRpdGlvbmFscyB0aGF0IGFsbW9zdCBj
b250cmFkaWN0IGVhY2ggb3RoZXIgYm90aApuZWVkZWQ/ICBJdCBsb29rcyBsaWtlIHRoZSBuZXcg
Y29kZSBjb3VsZCBiZSBjb21iaW5lZCB3aXRoCmFjcGlfcHJvY2Vzc29yX2hvdGFkZF9pbml0KCkg
dG8gZG8gdGhlIHJpZ2h0IHRoaW5nIGluIGFsbCBjYXNlcy4KCk5vdywgYWNwaV9wcm9jZXNzb3Jf
aG90YWRkX2luaXQoKSBkb2VzIHNvbWUgZXh0cmEgdGhpbmdzIHRoYXQgbG9vawpsaWtlIHRoZXkg
c2hvdWxkIGJlIGRvbmUgYnkgdGhlIG5ldyBjb2RlIHRvby4KCjEuIEl0IGNoZWNrcyBpbnZhbGlk
X3BoeXNfY3B1aWQoKSB3aGljaCBhcHBlYXJzIHRvIGJlIGEgZ29vZCBpZGVhIHRvIG1lLgoKMi4g
SXQgdXNlcyBsb2NraW5nIGFyb3VuZCBhcmNoX3JlZ2lzdGVyX2NwdSgpIHdoaWNoIGRvZXNuJ3Qg
c2VlbQp1bnJlYXNvbmFibGUgZWl0aGVyLgoKMy4gSXQgY2FsbHMgYWNwaV9tYXBfY3B1KCkgYW5k
IEknbSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBub3QgZG9uZSBieQp0aGUgbmV3IGNvZGUuCgpUaGUg
b25seSB0aGluZyB0aGF0IGNhbiBiZSBkcm9wcGVkIGZyb20gaXQgaXMgdGhlIF9TVEEgY2hlY2sg
QUZBSUNTLApiZWNhdXNlIGFjcGlfcHJvY2Vzc29yX2FkZCgpIHdvbid0IGV2ZW4gYmUgY2FsbGVk
IGlmIHRoZSBDUFUgaXMgbm90CnByZXNlbnQgKGFuZCBub3QgZW5hYmxlZCBhZnRlciB0aGUgZmly
c3QgcGF0Y2gpLgoKU28gd2h5IGRvZXMgdGhlIGNvZGUgbm90IGRvIDEgLSAzIGFib3ZlPwoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2NwdS5jIGIvZHJpdmVycy9iYXNlL2NwdS5jCj4gaW5k
ZXggNDdkZTBmMTQwYmE2Li4xM2QwNTJiZjEzZjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9iYXNl
L2NwdS5jCj4gKysrIGIvZHJpdmVycy9iYXNlL2NwdS5jCj4gQEAgLTU1Myw3ICs1NTMsMTEgQEAg
c3RhdGljIHZvaWQgX19pbml0IGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJpYyh2b2lkKQo+ICB7Cj4g
ICAgICAgICBpbnQgaSwgcmV0Owo+Cj4gLSAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0dF
TkVSSUNfQ1BVX0RFVklDRVMpKQo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFdoZW4gQUNQSSBp
cyBlbmFibGVkLCBDUFVzIGFyZSByZWdpc3RlcmVkIHZpYQo+ICsgICAgICAgICogYWNwaV9wcm9j
ZXNzb3JfZ2V0X2luZm8oKS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKCFJU19FTkFCTEVE
KENPTkZJR19HRU5FUklDX0NQVV9ERVZJQ0VTKSB8fCAhYWNwaV9kaXNhYmxlZCkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuOwoKSG9uZXN0bHksIHRoaXMgbG9va3MgbGlrZSBhIHF1aWNrIGhhY2sg
dG8gbWUgYW5kIGl0IGFic29sdXRlbHkKcmVxdWlyZXMgYW4gQUNLIGZyb20gdGhlIHg4NiBtYWlu
dGFpbmVycyB0byBnbyBhbnl3aGVyZS4KCj4KPiAgICAgICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1
KGkpIHsKPiAtLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
