Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA225C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvszLAQ/ygTAxZpHJkhRiI4ZjOeHgGYr4D5/QjAWOD0=; b=iSLR+LKAr4Oron
	0KAnkqJh8gwTlwqE4S3WDn8J8gk28RJbm2aOajZbfT1vkZy+rh8tcrWCge5q9ab7iNChQW+heo1PN
	u8BFZXGu8RlzKaA5hXyIBLez3ccvLXTxKIckGCUsYjAQyxn9yOT8e6tO+EGowUS5YyJ3s8OZhcbAx
	NBxVxlXihWIF7IoBux5lUWGYnXQmO5f/B6AZxBtZIijO5fmPytYyGZEIIyVKYQY4CcKHdleK7TmtI
	0onWZUjoxk4d6NZM95eg6nHy3JJtFpq2PhXd3HTt4InTIM+BPRKc0dcZWksNBB84RYApVOLChMoq7
	1ihGYXygT5794EwwMMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0Ot-0085Un-0s;
	Thu, 11 May 2023 07:07:43 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0Oq-0085TY-1U
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:07:42 +0000
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so39746462276.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 00:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683788856; x=1686380856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsAz4959ASyLH7I3o6usz1e8SUod/Uv6RBV6dCds1Mc=;
        b=gkB5WIKG7rw0RHTR7A3q/b9zQu4Bfaq2aTTxsitH9smrNLTVA0kCakw1VtaiHNK5aq
         jwLZe4XEW43Zu+QDnBUJwTw6tuDRFUTHylltHMK/cvywuk28yNSbkulBPZXKhbq+13+H
         zS4Ty0YDWWzpwGWct4UU8yUX8Togf4PDcW8ZXSpQP1/l+/76+2Nq85Lzp7AZ5U7uOsxJ
         JpDct03y6YPSeDDWdnrlVerO/TqFG+7noelilMhA3BEaYAlf58HgHKbGDIBK0Qv3qzI2
         surspkdAod864+nqHKt+uexaOnhqP9vDqkS/TVX0MrTKuKjPneiL9h3j2RyddoJfglMj
         qmJw==
X-Gm-Message-State: AC+VfDxDS3+SV89fwYyXEqdb43/QroRNq6IWfq4HdSDl0r7400cVdtjJ
	WEiD6b+wgSN8LXrNBX1DqNMRQ6ZMgUvy5w==
X-Google-Smtp-Source: ACHHUZ7loIaCZ0Yl8Ntzrjy2pyBJySxQP0ltyPZpP2mNi/bifyxiDmqtkVmwtUWhH+Hw7geBN4f8oQ==
X-Received: by 2002:a81:78c2:0:b0:55d:9f32:f6c with SMTP id t185-20020a8178c2000000b0055d9f320f6cmr19480112ywc.15.1683788856090;
        Thu, 11 May 2023 00:07:36 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id e124-20020a0df582000000b0055db1f73722sm4291656ywf.107.2023.05.11.00.07.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 00:07:35 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so39746381276.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 00:07:35 -0700 (PDT)
X-Received: by 2002:a25:c086:0:b0:b9e:67ab:4f36 with SMTP id
 c128-20020a25c086000000b00b9e67ab4f36mr21664777ybf.10.1683788855509; Thu, 11
 May 2023 00:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
 <20230510-headsman-deskwork-6826f9f174df@spud>
In-Reply-To: <20230510-headsman-deskwork-6826f9f174df@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 09:07:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKES1dgTMrLwNA3t37m-wscYETejRBM2aroB_ZF-pbaw@mail.gmail.com>
Message-ID: <CAMuHMdVKES1dgTMrLwNA3t37m-wscYETejRBM2aroB_ZF-pbaw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: sifive,clint: Clean up compatible
 value section
To: Conor Dooley <conor@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_000740_502261_AD8962D7 
X-CRM114-Status: GOOD (  31.29  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCA2OjAy4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCAwMzoy
NzoyNFBNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBSZXBsYWNlIHRoZSBz
ZW50ZW5jZXMgaW4gdGhlIGRlc2NyaXB0aW9uIGxpc3Rpbmcgc29tZSBzdXBwb3J0ZWQgdmFyaWFu
dHMKPiA+IGJ5IGNvbW1lbnRzIG9uIHRoZSBpbmRpdmlkdWFsIGNvbXBhdGlibGUgdmFsdWVzLCB0
byBlYXNlIGZ1dHVyZQo+ID4gbWFpbnRlbmFuY2UuICBXaGlsZSBhdCBpdCwgcmVzdG9yZSBhbHBo
YWJldGljYWwgc29ydCBvcmRlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdz
L3RpbWVyL3NpZml2ZSxjbGludC55YW1sICAgICAgICAgIHwgMjEgKysrKysrKy0tLS0tLS0tLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGlt
ZXIvc2lmaXZlLGNsaW50LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+IGluZGV4IDk0YmVmOTQyNGRmMWJjNmEuLjM0YTgx
NTEwNjc4MTM0ZWIgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+ID4gQEAgLTI5LDExICsy
OSwxMSBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICBvbmVPZjoKPiA+ICAgICAgICAtIGl0ZW1zOgo+
ID4gICAgICAgICAgICAtIGVudW06Cj4gPiAtICAgICAgICAgICAgICAtIHNpZml2ZSxmdTU0MC1j
MDAwLWNsaW50Cj4gPiAtICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoNzEwMC1jbGludAo+ID4g
LSAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtY2xpbnQKPiA+IC0gICAgICAgICAgICAg
IC0gY2FuYWFuLGsyMTAtY2xpbnQKPiA+IC0gICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNsaW50
MAo+ID4gKyAgICAgICAgICAgICAgLSBjYW5hYW4sazIxMC1jbGludCAgICAgICAjIENhbmFhbiBL
ZW5kcnl0ZSBLMjEwCj4gPiArICAgICAgICAgICAgICAtIHNpZml2ZSxmdTU0MC1jMDAwLWNsaW50
ICMgU2lGaXZlIEZVNTQwCj4gPiArICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoNzEwMC1jbGlu
dCAgICMgU3RhckZpdmUgSkg3MTAwCj4gPiArICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoNzEx
MC1jbGludCAgICMgU3RhckZpdmUgSkg3MTEwCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHNpZml2
ZSxjbGludDAgICAgICAgICMgU2lGaXZlIENMSU5UIHYwIElQIGJsb2NrCj4gPiAgICAgICAgLSBp
dGVtczoKPiA+ICAgICAgICAgICAgLSBlbnVtOgo+ID4gICAgICAgICAgICAgICAgLSBhbGx3aW5u
ZXIsc3VuMjBpLWQxLWNsaW50Cj4gPiBAQCAtNDUsMTQgKzQ1LDkgQEAgcHJvcGVydGllczoKPiA+
ICAgICAgICAgIGRlc2NyaXB0aW9uOiBGb3IgdGhlIFFFTVUgdmlydCBtYWNoaW5lIG9ubHkKPiA+
Cj4gPiAgICAgIGRlc2NyaXB0aW9uOgo+ID4gLSAgICAgIFNob3VsZCBiZSAiPHZlbmRvcj4sPGNo
aXA+LWNsaW50IiBhbmQgInNpZml2ZSxjbGludDx2ZXJzaW9uPiIuCj4gPiAtICAgICAgU3VwcG9y
dGVkIGNvbXBhdGlibGUgc3RyaW5ncyBhcmUgLQo+ID4gLSAgICAgICJzaWZpdmUsZnU1NDAtYzAw
MC1jbGludCIgZm9yIHRoZSBTaUZpdmUgQ0xJTlQgdjAgYXMgaW50ZWdyYXRlZAo+ID4gLSAgICAg
IG9udG8gdGhlIFNpRml2ZSBGVTU0MCBjaGlwLCAiY2FuYWFuLGsyMTAtY2xpbnQiIGZvciB0aGUg
U2lGaXZlCj4gPiAtICAgICAgQ0xJTlQgdjAgYXMgaW50ZWdyYXRlZCBvbnRvIHRoZSBDYW5hYW4g
S2VuZHJ5dGUgSzIxMCBjaGlwLCBhbmQKPiA+IC0gICAgICAic2lmaXZlLGNsaW50MCIgZm9yIHRo
ZSBTaUZpdmUgQ0xJTlQgdjAgSVAgYmxvY2sgd2l0aCBubyBjaGlwCj4gPiAtICAgICAgaW50ZWdy
YXRpb24gdHdlYWtzLgo+ID4gLSAgICAgIFBsZWFzZSByZWZlciB0byBzaWZpdmUtYmxvY2tzLWlw
LXZlcnNpb25pbmcudHh0IGZvciBkZXRhaWxzCj4KPiA+ICsgICAgICBTaG91bGQgYmUgIjx2ZW5k
b3I+LDxjaGlwPi1jbGludCIsIGZvbGxvd2VkIGJ5ICJzaWZpdmUsY2xpbnQ8dmVyc2lvbj4iCj4g
PiArICAgICAgd2hlbiBjb21wYXRpYmxlIHdpdGggYSBTaUZpdmUgQ0xJTlQuICBQbGVhc2UgcmVm
ZXIgdG8KPiA+ICsgICAgICBzaWZpdmUtYmxvY2tzLWlwLXZlcnNpb25pbmcudHh0IGZvciBkZXRh
aWxzIHJlZ2FyZGluZyB0aGUgbGF0dGVyLgo+Cj4gRG9lcyB0aGlzIHNlY3Rpb24gYWN0dWFsbHkg
YWRkIGFueSB2YWx1ZSBhdCBhbGw/Cj4gQnkgbmF0dXJlIG9mIG9uZU9mIHN0cnVjdHVyZSBhYm92
ZSwgc3VjaCBhbiBvcmRlcmluZyBpcyByZXF1aXJlZCBmb3IKPiBleGlzdGluZyBlbnRyaWVzLiBG
b3Igc29tZXRoaW5nIG5vdCBoZXJlLCBzaG91bGQgd2UgaW5zdGVhZCBiZSBub3RpbmcKPiB0aGF0
IHNpZml2ZSxjbGludDAgaXMgdG8gYmUgdXNlZCB3aGVuIGNvbXBhdGlibGUgd2l0aCB0aGUgU2lG
aXZlL1JJU0MtVgo+IGNsaW50LCByYXRoZXIgdGhhbiBkb2luZyBhIHNpZml2ZS1ibG9ja3MtaXAt
dmVyc2lvbmluZy50eHQgZGFuY2U/CgpJIGNvbnNpZGVyZWQgcmVtb3ZpbmcgdGhlIHBhcmFncmFw
aC4gIEJ1dCBJIGtlcHQgaXQsIGp1c3Qgbm90IHRvIGxvb3NlCnRoZSByZWZlcmVuY2UgdG8gc2lm
aXZlLWJsb2Nrcy1pcC12ZXJzaW9uaW5nLnR4dCwgd2hpY2ggc29tZW9uZSBtaWdodApmaW5kIHVz
ZWZ1bC4KCj4gQXMgaXQgc3RhbmRzIHRob3VnaCwgcGF0Y2ggaXMgYW4gaW1wcm92ZW1lbnQsIHNv
Ogo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
PgoKVGhhbmtzIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
