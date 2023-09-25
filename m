Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24151CE7A95
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqI8w1RI/W320Edo4GOdHctdvxy1K1RtNpUunEH1GYA=; b=u94njyGT4gx1bw
	extKvpD2xUuMAsGVndRxDjcZET7Apd2XPcCPj9oQNq0ncHP0wK4I5+J700R7pavBFj3zsnysy+XJL
	K2PCAeV8vpfu+dN6CDDBxXEtqAxnEVIXpK1FQX88dWBHbKevj5Ew6QPv/7k77Snk9tz1YzehNCBQr
	p7lxDSBu2XUupoFzdM5u7ozdihi6/hKoI26JtxbTRiWKUT+X3YBZZYBZpKbFh1B9jMhE1Tn9tAMA5
	z2n1mvAWiPo5ybtVhfKIvNL+z4LtkjwQVDoMQk18g/mrCzdBg30L23RGcIp4W0BlZfW8QgG6gEqr0
	uO59wbFJmEd91r9eXFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklgx-00ELIl-1h;
	Mon, 25 Sep 2023 13:32:03 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklgv-00ELHh-0d
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:32:02 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-565e54cb93aso3180171a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695648719; x=1696253519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxe02J5CeYVcOEGcf8pNL/E6NkBfjDIHUjgTsmbzDPc=;
        b=W+hlJb8KccXZoNaUct+xZwACvT5lsJAxda+JK+ZxtHoMk52fDDpy4p2LQp0Hr80aqU
         0S6WvVyMFCBQJ1IHOqMsWseWlWiB1gnlf3+fzi2oi/QuZcKDysjsJS4RsD8CfFzVcfiP
         SGcWpW8uWXCoZrBet/I4gFNAYhthdznMEV22gpkxnGMZbKSV2ieUdq+VrZBD4aTvoevO
         kS19BEBmepAzwwK4nzUa2k/UEZEA0x9iNV2C9iGXCPRcPLuu6xlOk3M6KNJSTN8bUUzZ
         5PWCbgfY63H6PH4xSTiZPEB//mmKjF7DsvH5JkHaCPJErNc0d4EcehRJnvcNfVcTbkNe
         W72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648719; x=1696253519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxe02J5CeYVcOEGcf8pNL/E6NkBfjDIHUjgTsmbzDPc=;
        b=QHW2DIKLcO+u99hex63gWBhwZV124PPeOW0+z6UniCrZXSQ1iKWqBHAaBrzBds4o+Y
         dBZLquUdv+1Uhm1D8c+tCl4O41qfnJPpI6oq7qNXH6rB1PTyuLs7/29IA9ffR6D4NTM7
         DTd5+iolECazF3bBA8lCZ8OYNw24Fz3dhtMy6u7gc+Xg6317X8lFkfD5tzkjHo99ZZ11
         PY2cvRvVKxxS1rYnpY65VqkNCFZbEx/GTAU0iTMNKgcF/dfFskCJSeDSmW4YrWzKB39Z
         VYWfs0tqmu961mzfJ26Du137Bnn4XHwcG2gp2GoDuE6G4BFofevdEALbJ3imvrMeB9W2
         YTgw==
X-Gm-Message-State: AOJu0Yyhx6uO1xOr3iMe5vo2rf0odxi1pF4UyZjV87De8WxS15p4KMMu
	mWqoXov0hCwttLiDFZl7s5bkh6BYO4siX+JJIbdKew==
X-Google-Smtp-Source: AGHT+IFaH5uvy57wyDPlz/5yfAqVsr1P33R5peI3FCNpL74KbP+nR6csDctzWbKGZ+EBEtyteZ3Ao+ghiq3rYYaecLQ=
X-Received: by 2002:a17:90a:f698:b0:271:9237:a07f with SMTP id
 cl24-20020a17090af69800b002719237a07fmr4386827pjb.32.1695648719052; Mon, 25
 Sep 2023 06:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-3-apatel@ventanamicro.com> <20230920-36a5645f766ed9cce75a9e8c@orel>
In-Reply-To: <20230920-36a5645f766ed9cce75a9e8c@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 25 Sep 2023 19:01:48 +0530
Message-ID: <CAK9=C2XVyN7nkMW+kgELaHCAjLcQ3z-6xVdrGa_UtxfJMdm7Dg@mail.gmail.com>
Subject: Re: [PATCH 2/7] RISC-V: Detect Zicond from ISA string
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063201_234583_67CE36AB 
X-CRM114-Status: GOOD (  19.89  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMToxNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMTksIDIwMjMgYXQgMDk6MjM6
MzhBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoZSBSSVNDLVYgaW50ZWdlciBjb25k
aXRpb25hbCAoWmljb25kKSBvcGVyYXRpb24gZXh0ZW5zaW9uIGRlZmluZXMKPiA+IHN0YW5kYXJk
IGNvbmRpdGlvbmFsIGFyaXRobWV0aWMgYW5kIGNvbmRpdGlvbmFsLXNlbGVjdC9tb3ZlIG9wZXJh
dGlvbnMKPiA+IHdoaWNoIGFyZSBpbnNwaXJlZCBmcm9tIHRoZSBYVmVudGFuYUNvbmRPcHMgZXh0
ZW5zaW9uLiBJbiBmYWN0LCBRRU1VCj4gPiBSSVNDLVYgYWxzbyBoYXMgc3VwcG9ydCBmb3IgZW11
bGF0aW5nIFppY29uZCBleHRlbnNpb24uCj4gPgo+ID4gTGV0IHVzIGRldGVjdCBaaWNvbmQgZXh0
ZW5zaW9uIGZyb20gSVNBIHN0cmluZyBhdmFpbGFibGUgdGhyb3VnaAo+ID4gRFQgb3IgQUNQSS4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNv
bT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgfCA2ICsrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+IGluZGV4
IGNhZDhlZjY4ZWNhNy4uN2VhOTBlMmRiYzViIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4g
QEAgLTIyNSw2ICsyMjUsMTIgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAgICAgICByYXRpZmll
ZCBpbiB0aGUgMjAxOTEyMTMgdmVyc2lvbiBvZiB0aGUgdW5wcml2aWxlZ2VkIElTQQo+ID4gICAg
ICAgICAgICAgIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gKyAgICAgICAgLSBjb25zdDogemljb25k
Cj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFy
ZCBaaWNvbmQgZXh0ZW5zaW9uIGZvciBjb25kaXRpb25hbCBhcml0aG1ldGljIGFuZAo+ID4gKyAg
ICAgICAgICAgIGNvbmRpdGlvbmFsLXNlbGVjdC9tb3ZlIG9wZXJhdGlvbnMgYXMgcmF0aWZpZWQg
aW4gY29tbWl0IDhmYjY2OTQKPiA+ICsgICAgICAgICAgICAoIlVwZGF0ZSBHZW1maWxlIikgb2Yg
cmlzY3Ytemljb25kLgo+Cj4gQXMgb2YgeWVzdGVyZGF5LCB2MS4wIG9mIHRoZSBzcGVjIHBvaW50
cyBhdCBjb21taXQgOTVjZjFmOSAoIkFkZCBjaGFuZ2VzCj4gcmVxdWVzdGVkIGJ5IFZlZCBkdXJp
bmcgc2lnbm9mZiIpCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gKwo+ID4gICAgICAgICAg
LSBjb25zdDogemljc3IKPiA+ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ICAgICAgICAg
ICAgICBUaGUgc3RhbmRhcmQgWmljc3IgZXh0ZW5zaW9uIGZvciBjb250cm9sIGFuZCBzdGF0dXMg
cmVnaXN0ZXIKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IGluZGV4IGI3ZWZlOWUyZmE4OS4u
MTViYWZjMDJmZmQ0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IEBAIC02MCw2
ICs2MCw3IEBACj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSFBNICAgICAgICAgIDQyCj4g
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTiAgICAgICAgICAgICAgNDMKPiA+ICAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWFZFTlRBTkFDT05ET1BTICAgICAgICA0NAo+ID4gKyNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9aSUNPTkQgICAgICAgICA0NQo+ID4KPiA+ICAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfTUFYICAgICAgICAgICAgNjQKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4g
PiBpbmRleCAzYTMxZDM0ZmU3MDkuLjQ5YjY1NTFmMzM0NyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiBAQCAtMTc0LDYgKzE3NCw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2Ff
ZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RB
VEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFU
QSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHpicywgUklTQ1ZfSVNBX0VYVF9aQlMpLAo+ID4gKyAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEo
emljb25kLCBSSVNDVl9JU0FfRVhUX1pJQ09ORCksCj4KPiBaaSBleHRlbnNpb25zIGNvbWUgYmVm
b3JlIFpiIGV4dGVuc2lvbnMuCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gICAgICAgX19S
SVNDVl9JU0FfRVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAo+ID4gICAgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoc21zdGF0ZWVuLCBSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTiks
Cj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJ
QSksCj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+Cj4gVGhhbmtzLAo+IGRyZXcKClJlZ2FyZHMsCkFu
dXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
