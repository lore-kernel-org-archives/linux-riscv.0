Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA861C7618D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJJsXD7jx1yEJpD5GgOio07XUQJ79ZW2VQXgFGXjnJc=; b=rF53dgIifoEEj7
	9G8DI565w0lKsHmvf3IIV78pX6Sy+y5L77SqFKglEDZW965NLZt02tnvAFNVo1HvCG0MbJrdF5OD+
	ZU+XZAPhF3WXdh3cs74jqHU1phLKYqVi435JSMeOJzBhA8IAiMTLnAXDfXXVpNBxca0IXVLzh78m7
	WUlCUASNMFUWU/HNR65vIPs7I8U33TR1+7V/LHFEN3Y2v7N4irdJAkZSRjtOYwrg+3vpemxeziUP9
	kscZ7Wj1C0ddj9EEFVwIsKfJSTGeUhD1X2P0GccTC9xLkzf6lFQPjbggN17sS3z3d1UzIJK9yzdMW
	X9LVv4QrL64/VHnyVhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaZ3-000FCk-0p;
	Tue, 04 Apr 2023 06:54:45 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaYz-000FBy-2o
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 06:54:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so32978222pjz.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680591280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8KDVnrh1hTXgmg9cUX613HBU/NpNhOGn+tvPjKzddU=;
        b=mXZSLWXYtv4n06LIlK6QFnQlklY/sKxaWTQU/vvO7qcfsgXLGGlGcwuCO19fKY6qQy
         efdh/b+0BcOjkIB2FxAoBZJ+N4ssU99ayNpww5SqKt7jOFgp5lClD7Ls81ZUiB3b5/Io
         s1QdUxXGmLS90t3QGktGbGlny60/DldtJ2R9m5GEfPJdo5b1RtLvsnDMEuI+bmuta/qW
         NjubZGOwRTbD/l4rfxV/adLRRcaGNHhIFZOKtewu25VMxkayhdNFMa32IxzRQ+d3k7AQ
         6lI26mcYjTEuZBZnichASEWZZ4Riyn9b6mh0dOzRN51KiyLfvoPGA0q3sr5Jlq2YiUrt
         oC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680591280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8KDVnrh1hTXgmg9cUX613HBU/NpNhOGn+tvPjKzddU=;
        b=QrkhtU25zLURNu3ZAZWEQ+6nU0bpMlLNiCiVe628Ru7KjZ/+1S0V/aGMlrqxD1s9rK
         Mn6BeFYGx2Wj6Yzzc8wnQUdD4GjUGrFKQVSs2kBynbT6OcxbyLdBZ2p5eMGv6/hEDzC4
         xNoqHmMTkz6PaICGPLoZGqX41peR5h7EFsBZYJ0ao19kvcqpx9Xg6y/i4c/M4wxY5Uz3
         keeePdeOUiw+LF5mnnsf1zco83WitZJf/dUo/nYuIKL6FBetFUyETUONYNc9diZXnYGS
         W1cX0oLwH5tZh1UVLmOdHmn0el5CCNSFf1b/6IhBooIDtpKvlIa2BjQhjrT5vSUnZUgx
         quFg==
X-Gm-Message-State: AAQBX9eVrWNTIi9Z8Nq8KMIrkfQP2Ad1J/Zp8VfB5bXEA5UK5iciEJjE
	r0hUtaTFTgI4GdamzrrKReaYRA==
X-Google-Smtp-Source: AKy350YUeMS566kGavT5Mb5UZSOA1ZJfQBdGmEvc/mlk3U8V7ucrzM0EIRt/rKThA++zZN9GdXImaQ==
X-Received: by 2002:a17:902:e494:b0:1a2:952b:27e0 with SMTP id i20-20020a170902e49400b001a2952b27e0mr1572818ple.8.1680591280254;
        Mon, 03 Apr 2023 23:54:40 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902748700b0019f0ef910f7sm7626350pll.123.2023.04.03.23.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 23:54:39 -0700 (PDT)
Date: Tue, 4 Apr 2023 12:24:30 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ley Foon Tan <lftan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-acpi@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, llvm@lists.linux.dev
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
Message-ID: <ZCvJpnNZYzrIcfPe@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud>
 <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org>
 <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
 <ZAfeaO52pnYhiyLN@sunil-laptop>
 <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_235441_916547_E0D056AC 
X-CRM114-Status: GOOD (  37.25  )
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

T24gVHVlLCBBcHIgMDQsIDIwMjMgYXQgMDI6MzU6MTlQTSArMDgwMCwgTGV5IEZvb24gVGFuIHdy
b3RlOgo+IE9uIFdlZCwgTWFyIDgsIDIwMjMgYXQgOTowOOKAr0FNIFN1bmlsIFYgTCA8c3VuaWx2
bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE1hciAwNywgMjAyMyBh
dCAwNjo0NDozNVBNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgTWFy
IDA3LCAyMDIzIGF0IDA2OjEzOjIyQU0gKzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gT24gNyBNYXJjaCAyMDIzIDA1OjA2OjE2IEdNVCwgU3VuaWwgViBM
IDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+ID5PbiBNb24sIE1hciAw
NiwgMjAyMyBhdCAwOTo1MTowOVBNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+ID4g
Pj4gSGV5IFN1bmlsLAo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gT24gRnJpLCBNYXIgMDMsIDIwMjMg
YXQgMDc6MDY6MjdQTSArMDUzMCwgU3VuaWwgViBMIHdyb3RlOgo+ID4gPiA+ID4+ID4gVGhpcyBw
YXRjaCBzZXJpZXMgZW5hYmxlcyB0aGUgYmFzaWMgQUNQSSBpbmZyYXN0cnVjdHVyZSBmb3IgUklT
Qy1WLgo+ID4gPiA+ID4+ID4gU3VwcG9ydGluZyBleHRlcm5hbCBpbnRlcnJ1cHQgY29udHJvbGxl
cnMgaXMgaW4gcHJvZ3Jlc3MgYW5kIGhlbmNlIGl0IGlzCj4gPiA+ID4gPj4gPiB0ZXN0ZWQgdXNp
bmcgcG9sbCBiYXNlZCBIVkMgU0JJIGNvbnNvbGUgYW5kIFJBTSBkaXNrLgo+ID4gPiA+ID4+ID4K
PiA+ID4gPiA+PiA+IFRoZSBmaXJzdCBwYXRjaCBpbiB0aGlzIHNlcmllcyBpcyBvbmUgb2YgdGhl
IHBhdGNoIGZyb20gSmlzaGVuZydzCj4gPiA+ID4gPj4gPiBzZXJpZXMgWzFdIHdoaWNoIGlzIG5v
dCBtZXJnZWQgeWV0LiBUaGlzIHBhdGNoIGlzIHJlcXVpcmVkIHRvIHN1cHBvcnQKPiA+ID4gPiA+
PiA+IEFDUEkgc2luY2UgZWZpX2luaXQoKSB3aGljaCBnZXRzIGNhbGxlZCBiZWZvcmUgc2JpX2lu
aXQoKSBjYW4gZW5hYmxlCj4gPiA+ID4gPj4gPiBzdGF0aWMgYnJhbmNoZXMgYW5kIGhpdHMgYSBw
YW5pYy4KPiA+ID4gPiA+PiA+Cj4gPiA+ID4gPj4gPiBQYXRjaCAyIGFuZCAzIGFyZSBBQ1BJQ0Eg
cGF0Y2hlcyB3aGljaCBhcmUgbm90IG1lcmdlZCBpbnRvIGFjcGljYSB5ZXQKPiA+ID4gPiA+PiA+
IGJ1dCBhIFBSIGlzIHJhaXNlZCBhbHJlYWR5Lgo+ID4gPiA+ID4+ID4KPiA+ID4gPiA+PiA+IEJl
bG93IGFyZSB0d28gRUNScyBhcHByb3ZlZCBieSBBU1dHLgo+ID4gPiA+ID4+ID4gUklOVEMgLSBo
dHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFSNms0TXNoaE4zV1RULWh3cUFxdXU1blg2
eFNFcUsybC92aWV3Cj4gPiA+ID4gPj4gPiBSSENUIC0gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29t
L2ZpbGUvZC8xblAzbkZpSDRqa1BNcDZDT094UDYxMjNEQ1pLUi10aWEvdmlldwo+ID4gPiA+ID4+
ID4KPiA+ID4gPiA+PiA+IFRoZSBzZXJpZXMgZGVwZW5kcyBvbiBBbnVwJ3MgSVBJIGltcHJvdmVt
ZW50IHNlcmllcyBbMl0uCj4gPiA+ID4gPj4gPgo+ID4gPiA+ID4+ID4gWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIyMDgyMTE0MDkxOC4zNjEzLTEtanN6aGFuZ0BrZXJuZWwub3Jn
Lwo+ID4gPiA+ID4+ID4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAxMDMx
NDEyMjEuNzcyMjYxLTctYXBhdGVsQHZlbnRhbmFtaWNyby5jb20vVC8KPiA+ID4gPiA+Pgo+ID4g
PiA+ID4+IEJ1aWxkaW5nIGEgY2xhbmctMTUgYWxsbW9kY29uZmlnIChJIGRpZG4ndCB0cnkgZ2Nj
KSB3aXRoIHRoaXMgc2VyaWVzLCBhbmQKPiA+ID4gPiA+PiBBbnVwJ3MgSVBJIGJpdHMsIHJlc3Vs
dHMgaW4gYSBicm9rZW4gYnVpbGQsIGR1ZSB0byBmYWlsaW5ncyBpbiBjbXB4Y2hnOgo+ID4gPiA+
ID4+Cj4gPiA+ID4gPj4gL3N0dWZmL2xpbnV4L2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dy
ZWdhdG9yL2NvbnRyb2xsZXIuYzo2MToyNTogZXJyb3I6IGNhbGwgdG8gX19jb21waWxldGltZV9h
c3NlcnRfMzM1IGRlY2xhcmVkIHdpdGggJ2Vycm9yJyBhdHRyaWJ1dGU6IEJVSUxEX0JVRyBmYWls
ZWQKPiA+ID4gPiA+PiAgICAgICAgIHdoaWxlICh1bmxpa2VseSgocmV0ID0gY21weGNoZygmYy0+
dmFsdWUsIG9sZCwgbmV3KSkgIT0gb2xkKSkgewo+ID4gPiA+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeCj4gPiA+Cj4gPiA+ID4gPiBJIGFtIGFibGUgdG8gYnVpbGQgd2l0aG91
dCBhbnkgb2YgdGhlc2UgaXNzdWVzIHVzaW5nIGNsYW5nLTE1LiBJIGFtCj4gPiA+ID4gPiB3b25k
ZXJpbmcgd2hldGhlciB0aGUgYmFzZSBpcyBwcm9wZXIuIEkgaGFkIHJlYmFzZWQgb24gdG9wIG9m
IHRoZSBtYXN0ZXIKPiA+ID4gPiA+IGFuZCBjb3VwbGUgb2YgcGF0Y2hlcyBmcm9tIElQSSBzZXJp
ZXMgd2VyZSBhbHJlYWR5IG1lcmdlZCBpbiB0aGUgbWFzdGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IERvIHlvdSBtaW5kIHZlcmlmeWluZyB3aXRoIG15IGJyYW5jaAo+ID4gPiA+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL3Zsc3VuaWwvbGludXgvY29tbWl0cy9hY3BpX2IxX3VzX3Jldmlld19pcGkxN19W
Mz8KPiA+ID4gPgo+ID4gPiA+IEkgY2FuIGNoZWNrIHRoYXQgbGF0ZXIgSSBzdXBwb3NlLgo+ID4g
Pgo+ID4gPiBUaGF0J3MgYnJva2VuIHRvby4KPiA+ID4KPiA+ID4gPiA+IE9yIGlmIHlvdSBjb3Vs
ZCBwcm92aWRlIG1lIHlvdXIgYnJhbmNoIGRldGFpbHMsIEkgY2FuIGxvb2sgZnVydGhlci4KPiA+
ID4gPgo+ID4gPiA+IDYuMy1yYzEsIHdpdGggYm90aCBzZXJpZXMgYXBwbGllZCwgc2FucyBBbnVw
cyBhcHBsaWVkIHBhdGNoZXMuCj4gPiA+Cj4gPiA+IEkndmUgcHVzaGVkIG15IHN0dWZmIGhlcmUs
IGJ1dCB1bmxpa2VseSB0aGF0IGl0IG1ha2VzIGFueSBvZGRzIHNpbmNlCj4gPiA+IHlvdXIgYnJh
bmNoIGV4cGVyaWVuY2VzIHRoZSBzYW1lIGJ1aWxkIGlzc3VlLgo+ID4gPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jb25vci9saW51eC5naXQvIGJvcmtl
ZC1hY3BpLXN1cmZhY2UKPiA+ID4KPiA+ID4gTXkgYnVpbGQgY29tbWFuZHMgYXJlIHdyYXBwZWQg
aW4gYSBzY3JpcHQsIGJ1dCBpdCdzIGFuIExMVk09MQo+ID4gPiBhbGxtb2Rjb25maWcgcnVuIHcv
IGNsYW5nLTE1KC4wLjcpIGV0Yy4KPiA+ID4KPiA+IEFoaCBhbGxtb2Rjb25maWcuIFRoYW5rIHlv
dSB2ZXJ5IG11Y2ghLiBJIGNhbiByZXByb2R1Y2UgdGhlIGZhaWx1cmUuIExldAo+ID4gbWUgbG9v
ayBmdXJ0aGVyIGFuZCBmaXggaW4gbmV4dCByZXZpc2lvbi4KPiA+Cj4gPiBUaGFua3MhCj4gPiBT
dW5pbAo+IAo+IEhpIFN1bmlsCj4gCj4gT25lIHF1ZXN0aW9uIHJlZ2FyZGluZyBQTVUgaW4gQUNQ
SSBmbG93Lgo+IAo+IFdlIHVzZSBEVCB0byBkZWNvZGUgdGhlIHN1cHBvcnRlZCBIUE0gY291bnRl
cnMvZXZlbnRzIGZvciB0aGUKPiBkaWZmZXJlbnQgcGxhdGZvcm1zIG5vdy4KPiBIb3cgZG8gd2Ug
ZW5hYmxlIFBNVSAoZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYykgd2hlbiB1c2luZyBBQ1BJ
IG1ldGhvZD8KPiBOb3RlLCB0aGlzIG1pZ2h0IGJlIGluIHNlcGFyYXRlIHBhdGNoIHNlcmllcy4K
PiAKSGkgTGF5IEZvb24sCgpUaGlzIGRyaXZlciB1c2VzIFNCSSBjYWxscyBhbmQgaGVuY2Ugc2hv
dWxkIHdvcmsgaW4gY2FzZSBvZiBBQ1BJIGFsc28uCgpUaGVyZSBpcyBvbmUgbWlub3IgY2hhbmdl
IHJlcXVpcmVkIGluIHRoaXMgZHJpdmVyIGZvciBvdmVyZmxvdwppbnRlcnJ1cHQuIEkgaGF2ZSBh
IHBhdGNoIGZvciB0aGF0IGluIGZ1dHVyZSBzZXJpZXMuCgpUaGFua3MsClN1bmlsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
