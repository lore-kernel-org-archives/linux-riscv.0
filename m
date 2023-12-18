Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC37C46CCD
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 00:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ss5voAoY9Vak8lIOoqUcW44JM96vW/OKWcoZuuLzX2Q=; b=uNcUHsHIxSpjlB
	Dvy+4l9l3SIjve4EzYSS4GUvgk3QdL600F3ABtF2pWPjFhzIi2GJT7kbeF4z9rKF/b0x0T5ALzdJg
	G5axyRT+kshDNbEsb0PnY9bW5Uisp0hISammNkWyFBHpbxkgPnC8rCxr0A6B71ANlbgWmUfkNfDgL
	5r0L0jU/NjqSCWKN9r9HtmCetx4sRRfkPQsky0tX0yKiwctq7HRo3W//tt0UBqIPNb97ykb6oTnuc
	sY5ibLYW1hJJihf2cGPF+c9dAUgG63VOvUJvuJIcH9oCy63deFKYABWR8yGu1Iao7ckbRJlfJkYOp
	5q3G8y/H+1kynypPAglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF1xJ-008kqJ-23;
	Mon, 18 Dec 2023 00:58:01 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF1xF-008koN-0d
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 00:57:59 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50e34a72660so689270e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 16:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702861074; x=1703465874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUdHF1MxkAooUSLHF4kQjIZjImBNrzkIpbjt/k8iX6w=;
        b=WCP8bYmMPmfi7GEH5ICX9jX4kamqHm6VHJVMQ6z+JD62kGLlHdIB4LxI1ApH8rkPcR
         A+xjNAB70vXrACZDphkkXj0667VMP8exYle0D3CnVXjNp7GK4mrFTuDYa1j2H92nrH2T
         xTo3CtBc2e7HR6/EtRlUBxbbbejy9bifaeqDSqtJrQNkI+wFG0D4xGk7oRDojchIJbym
         fnHuWfCagGzZLZA9r7/wj56HJJw0fNVZy5lTKt4Psyk2/Qgnii2UjbTRJ/O+Vd/QYXN6
         rNLBYLKCR7XHCGr4qakOGUQ9T4z1yhSSN4v9N1k1OngYqURg9MZ5T02zSfRrp6hV/uvS
         3g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702861074; x=1703465874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUdHF1MxkAooUSLHF4kQjIZjImBNrzkIpbjt/k8iX6w=;
        b=CNZk6Mw5UrRXj3CJeSGMc2obuUd2MLg0vQvkY4z2uHbzjRD1CsgnDXQyzXIM7rzVRa
         OBC8+jt+VaL1/C8zFPBydb3dH+kXvteG/faa2nnQ/E/VwNxkh2DZpt4epATgcvWwUzTl
         B7k9caPTlp0EVibNJNxoACdxb2JkdWIsilkd8Xm0uKlo/z+cJl3BOARvqrVTI+CffAzy
         HuieTyBpbYBDDRxoY10lC1725jJua0s6wH2WZMgUU+xD5z4YkXMMC45YjDkKtLBw7ofe
         A1YYoV8koDVD4GOpG6DNtLQyIffB0rEsOkN/ymX85Qa6RfvJmEvAs2UxYbmYXrNdXUQ+
         TAig==
X-Gm-Message-State: AOJu0YyCufWLl1/lo0GIMUpKHRgRqaN5DJhlRRNB3BmvXC8mTMfPHb0h
	b6vSIRcwdIcnULOTyXvc4cDizlblqwpJlKBXfhj7dQ==
X-Google-Smtp-Source: AGHT+IEU/WHI1h/ykMV4VNrgx/RATuTIz8NW32NhEYWQF3ndy6wdTfdQBKd77OhDQIGgHWDz6r4TaShSH8NUihvKhm8=
X-Received: by 2002:ac2:4c4e:0:b0:50e:1b7a:59a2 with SMTP id
 o14-20020ac24c4e000000b0050e1b7a59a2mr3353284lfk.86.1702861073964; Sun, 17
 Dec 2023 16:57:53 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-7-atishp@rivosinc.com>
 <20231207-daycare-manager-2f4817171422@wendy> <CAHBxVyE3xAAj=Z_Cu33tEKjXEAcnOV_=Jpkpn-+j5MoLj1FPWw@mail.gmail.com>
 <20231217-navigate-thirsty-03509850a683@spud>
In-Reply-To: <20231217-navigate-thirsty-03509850a683@spud>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sun, 17 Dec 2023 16:57:42 -0800
Message-ID: <CAHBxVyFQ2+NYeb77zqMofHQC0zD5_Ye2cGk6Zsc+KHKm4zE5mw@mail.gmail.com>
Subject: Re: [RFC 6/9] drivers/perf: riscv: Implement SBI PMU snapshot function
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_165757_488039_EB732B9E 
X-CRM114-Status: GOOD (  54.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgNDoxMOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIERlYyAxNiwgMjAyMyBhdCAwNTozOToxMlBNIC0w
ODAwLCBBdGlzaCBLdW1hciBQYXRyYSB3cm90ZToKPiA+IE9uIFRodSwgRGVjIDcsIDIwMjMgYXQg
NTowNuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3Rl
Ogo+ID4gPiBPbiBNb24sIERlYyAwNCwgMjAyMyBhdCAwNjo0MzowN1BNIC0wODAwLCBBdGlzaCBQ
YXRyYSB3cm90ZToKPgo+ID4gPiA+ICtzdGF0aWMgdm9pZCBwbXVfc2JpX3NuYXBzaG90X2ZyZWUo
c3RydWN0IHJpc2N2X3BtdSAqcG11KQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgaW50IGNwdTsK
PiA+ID4KPiA+ID4gPiArICAgICBzdHJ1Y3QgY3B1X2h3X2V2ZW50cyAqY3B1X2h3X2V2dDsKPiA+
ID4KPiA+ID4gVGhpcyBpcyBvbmx5IHVzZWQgaW5zaWRlIHRoZSBzY29wZSBvZiB0aGUgZm9yIGxv
b3AuCj4gPiA+Cj4gPgo+ID4gRG8geW91IGludGVuZCB0byBzdWdnZXN0IHVzaW5nIG1peGVkIGRl
Y2xhcmF0aW9ucyA/IFBlcnNvbmFsbHksIEkKPiA+IHByZWZlciBhbGwgdGhlIGRlY2xhcmF0aW9u
cyB1cGZyb250IGZvciByZWFkYWJpbGl0eS4KPiA+IExldCBtZSBrbm93IGlmIHlvdSB0aGluayB0
aGF0J3MgYW4gaXNzdWUgb3IgdmlvbGF0ZXMgY29kaW5nIHN0eWxlLgo+Cj4gSSB3YXMgc3VnZ2Vz
dGluZwo+Cj4gaW50IGNwdTsKPgo+IGZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpCj4gICAgICAg
ICBzdHJ1Y3QgY3B1X2h3X2V2ZW50cyAqY3B1X2h3X2V2dCA9IHBlci4uLi4oKQo+CgpUaGF0J3Mg
d2hhdCBJIG1lYW50IGJ5IG1peGVkIGRlY2xhcmF0aW9ucy4KCj4gSSd2ZSBiZWVuIGFza2VkIHRv
IGRvIHRoaXMgaW4gc29tZSBzdWJzeXN0ZW1zIEkgc3VibWl0dGVkIGNvZGUgdG8sCj4gYW5kIGNo
ZWNrcGF0Y2ggZXRjIGRvIG5vdCBjb21wbGFpbiBhYm91dCBpdC4gSSBkb24ndCB0aGluayB0aGVy
ZSBpcyBhbnkKPiBzcGVjaWZpYyBjb21tZW50YXJ5IGluIHRoZSBjb2Rpbmcgc3R5bGUgYWJvdXQg
bWluaW1pc2luZyB0aGUgc2NvcGUgb2YKPiB2YXJpYWJsZXMgaG93ZXZlci4KPgoKSSBkaWRuJ3Qg
a25vdyBhbnkgc3Vic3lzdGVtIHdoaWNoIHByZWZlcnMgbWl4ZWQgZGVjbGFyYXRpb24gdnMgdXBm
cm9udC4KCj4gPiA+ID4gKyAgICAgLyogRnJlZSB1cCB0aGUgc25hcHNob3QgYXJlYSBtZW1vcnkg
YW5kIGZhbGwgYmFjayB0byBkZWZhdWx0IFNCSSAqLwo+ID4gPgo+ID4gPiBXaGF0IGRvZXMgImZh
bGwgYmFjayB0byB0aGUgZGVmYXVsdCBTQkkgbWVhbiI/IFNCSSBpcyBhbiBpbnRlcmZhY2Ugc28g
SQo+ID4gPiBkb24ndCB1bmRlcnN0YW5kIHdoYXQgaXQgbWVhbnMgaW4gdGhpcyBjb250ZXh0LiBT
ZWNvbmRseSwKPiA+Cj4gPiBJbiBhYnNlbmNlIG9mIFNCSSBQTVUgc25hcHNob3QsIHRoZSBkcml2
ZXIgd291bGQgdHJ5IHRvIHJlYWQgdGhlCj4gPiBjb3VudGVycyBkaXJlY3RseSBhbmQgZW5kIHVw
IHRyYXBzLgo+ID4gQWxzbywgaXQgd291bGQgbm90IHVzZSB0aGUgU0JJIFBNVSBzbmFwc2hvdCBm
bGFncyBpbiB0aGUgU0JJIHN0YXJ0L3N0b3AgY2FsbHMuCj4gPiBTbmFwc2hvdCBpcyBhbiBhbHRl
cm5hdGl2ZSBtZWNoYW5pc20gdG8gbWluaW1pemUgdGhlIHRyYXBzLiBJIGp1c3QKPiA+IHdhbnRl
ZCB0byBoaWdobGlnaHQgdGhhdC4KPiA+Cj4gPiBIb3cgYWJvdXQgdGhpcyA/Cj4gPiAiRnJlZSB1
cCB0aGUgc25hcHNob3QgYXJlYSBtZW1vcnkgYW5kIGZhbGwgYmFjayB0byBkZWZhdWx0IFNCSSBQ
TVUKPiA+IGNhbGxzIHdpdGhvdXQgc25hcHNob3QgKi8KPgo+IFllYWgsIHRoYXQncyBmaW5lICht
b2R1bG8gdGhlICovIHBsYWNlbWVudCkuIFRoZSBvcmlnaW5hbCBjb21tZW50IGp1c3QKPiBzZWVt
ZWQgdHJ1bmNhdGVkLgo+Cgpvay4KCj4gPiA+ID4gKyAgICAgaWYgKHJldC5lcnJvcikgewo+ID4g
PiA+ICsgICAgICAgICAgICAgaWYgKHJldC5lcnJvciAhPSBTQklfRVJSX05PVF9TVVBQT1JURUQp
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4oIiVzOiBwbXUgc25hcHNob3Qg
c2V0dXAgZmFpbGVkIHdpdGggZXJyb3IgJWxkXG4iLCBfX2Z1bmNfXywKPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQuZXJyb3IpOwo+ID4gPgo+ID4gPiBXaHkgaXMgdGhl
IGZ1bmN0aW9uIHJlbGV2YW50IGhlcmU/IElzIHRoZSBlcnJvciBtZXNzYWdlIGluLWFuZC1vZi1p
dHNlbGYKPiA+ID4gbm90IHN1ZmZpY2llbnQgaGVyZT8gV2hlcmUgZWxzZSB3b3VsZCBvbmUgYmUg
c2V0dGluZyB1cCB0aGUgc25hcHNob3RzCj4gPiA+IG90aGVyIHRoYW4gdGhlIHNldHVwIGZ1bmN0
aW9uPwo+ID4gPgo+ID4KPiA+IFRoZSBTQkkgaW1wbGVtZW50YXRpb24gKGkuZSBPcGVuU0JJKSBt
YXkgb3IgbWF5IG5vdCBwcm92aWRlIGEgc25hcHNob3QKPiA+IGZlYXR1cmUuIFRoaXMgZXJyb3Ig
bWVzc2FnZSBpbmRpY2F0ZXMKPiA+IHRoYXQgU0JJIGltcGxlbWVudGF0aW9uIHN1cHBvcnRzIFBN
VSBzbmFwc2hvdCBidXQgc2V0dXAgZmFpbGVkIGZvcgo+ID4gc29tZSBvdGhlciBlcnJvci4KPgo+
IEkgZG9uJ3Qgc2VlIHdoYXQgdGhpcyBoYXMgdG8gZG8gd2l0aCBwcmludGluZyBvdXQgdGhlIGZ1
bmN0aW9uLiBUaGlzIGlzCj4gYSB1bmlxdWUgZXJyb3IgbWVzc2FnZSwgYW5kIHRoZXJlIGlzIG5v
IG90aGVyIHBsYWNlIHdoZXJlIHRoZSBzZXR1cCBpcwo+IGRvbmUgQUZBSUNULgo+CgpBaGggeW91
IHdlcmUgY29uY2VybmVkIGFib3V0IHRoZSBmdW5jdGlvbiBuYW1lIGluIHRoZSBsb2cuIEkKbWlz
dW5kZXJzdG9vZCBpdCBhdCBmaXJzdC4KVGhlIGZ1bmN0aW9uIG5hbWUgaXMgbm90IHJlbGV2YW50
IGFuZCBoYXMgYmVlbiBhbHJlYWR5IHJlbW92ZWQuCgo+ID4gPiA+ICsgICAgICAgICAgICAgLyog
U25hcHNob3QgaXMgdGFrZW4gcmVsYXRpdmUgdG8gdGhlIGNvdW50ZXIgaWR4IGJhc2UuIEFwcGx5
IGEgZml4dXAuICovCj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAoaHdjLT5pZHggPiAwKSB7Cj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNkYXRhLT5jdHJfdmFsdWVzW2h3Yy0+aWR4XSA9
IHNkYXRhLT5jdHJfdmFsdWVzWzBdOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBzZGF0
YS0+Y3RyX3ZhbHVlc1swXSA9IDA7Cj4gPiA+Cj4gPiA+IFdoeSBpcyB0aGlzIGJlaW5nIHplcm9l
ZCBpbiB0aGlzIG1hbm5lcj8gV2h5IGlzIHplcm9pbmcgaXQgbm90IHJlcXVpcmVkCj4gPiA+IGlm
IGh3Yy0+aWR4ID09IDA/IFlvdSd2ZSBnb3QgYSBjb21tZW50IHRoZXJlIHRoYXQgY291bGQgcHJv
YmFibHkgZG8gd2l0aAo+ID4gPiBlbGFib3JhdGlvbi4KPiA+ID4KPiA+Cj4gPiBod2MtPmlkeCBp
cyB0aGUgY291bnRlcl9pZHhfYmFzZSBoZXJlLiBJZiBpdCBpcyB6ZXJvLCB0aGF0IG1lYW5zIHRo
ZQo+ID4gY291bnRlcjAgdmFsdWUgaXMgdXBkYXRlZAo+ID4gaW4gdGhlIHNoYXJlZCBtZW1vcnku
IEhvd2V2ZXIsIGlmIHRoZSBiYXNlID4gMCwgd2UgbmVlZCB0byB1cGRhdGUgdGhlCj4gPiByZWxh
dGl2ZSBjb3VudGVyIHZhbHVlCj4gPiBmcm9tIHRoZSBzaGFyZWQgbWVtb3J5LiBEb2VzIGl0IG1h
a2Ugc2Vuc2UgPwo+Cj4gUGxlYXNlIGV4cGFuZCBvbiB0aGUgY29tbWVudCBzbyB0aGF0IGl0IGNv
bnRhaW5zIHRoaXMgaW5mb3JtYXRpb24uCj4KClN1cmUuCgo+ID4gPiA+ICsgICAgICAgICAgICAg
cmV0ID0gcG11X3NiaV9zbmFwc2hvdF9zZXR1cChwbXUsIHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4g
PiA+ID4gKyAgICAgICAgICAgICBpZiAoIXJldCkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBwcl9pbmZvKCJTQkkgUE1VIHNuYXBzaG90IGlzIGF2YWlsYWJsZSB0byBvcHRpbWl6ZSB0
aGUgUE1VIHRyYXBzXG4iKTsKPiA+ID4KPiA+ID4gV2h5IHRoZSB2ZXJib3NlIG1lc3NhZ2U/IENv
dWxkIHdlIHN0YW5kYXJkaXNlIG9uIG9uZSB3b3JkaW5nIGZvciB0aGUgU0JJCj4gPiA+IGZ1bmN0
aW9uIHByb2Jpbmcgc3R1ZmY/IE1vc3QgdXNlcnMgc2VlbSB0byBiZSAiU0JJIEZPTyBleHRlbnNp
b24gZGV0ZWN0ZWQiLgo+ID4gPiBPbmx5IElQSSBoYXMgYWRkaXRpb25hbCB3b3JkaW5nIGFuZCBQ
TVUgZGlmZmVycyBzbGlnaHRseS4KPiA+Cj4gPiBBZGRpdGlvbmFsIGluZm9ybWF0aW9uIGlzIGZv
ciB1c2VycyB0byB1bmRlcnN0YW5kIFBNVSBmdW5jdGlvbmFsaXR5Cj4gPiB1c2VzIGxlc3MgdHJh
cHMgb24gdGhpcyBzeXN0ZW0uCj4gPiBXZSBjYW4ganVzdCByZXNvcnQgdG8gYW5kIGV4cGVjdCB1
c2VycyB0byByZWFkIHVwb24gdGhlIHB1cnBvc2Ugb2YgdGhlCj4gPiBzbmFwc2hvdCBmcm9tIHRo
ZSBzcGVjLgo+ID4gIlNCSSBQTVUgc25hcHNob3QgYXZhaWxhYmxlIgo+Cj4gV2hhdCBJIHdhcyBh
c2tpbmcgZm9yIHdhcyBhbGlnbm1lbnQgd2l0aCB0aGUgbWFqb3JpdHkgb2Ygb3RoZXIgU0JJCj4g
ZXh0ZW5zaW9ucyB0aGF0IHVzZSB0aGUgZm9ybWF0IEkgbWVudGlvbmVkIGFib3ZlLgo+CgpQTVUg
c25hcHNob3QgaXMgYSBmdW5jdGlvbiBhbmQgbXkgcHJldmlvdXMgc3VnZ2VzdGlvbiBhbGlnbnMg
UE1VCmV4dGVuc2lvbiBhdmFpbGFiaWxpdHkgbG9nIG1lc3NhZ2UuCkkgY2FuIGNoYW5nZSBpdCB0
byAiU0JJIFBNVSBzbmFwc2hvdCBkZXRlY3RlZCIKCj4gPgo+ID4gPgo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAvKiBXZSBlbmFibGUgaXQgb25jZSBoZXJlIGZvciB0aGUgYm9vdCBjcHUu
IElmIHNuYXBzaG90IHNobWVtIGZhaWxzIGR1cmluZwo+ID4gPgo+ID4gPiBBZ2FpbiwgY29tbWVu
dCBzdHlsZSBoZXJlLiBXaGF0IGRvZXMgInNuYXBzaG90IHNobWVtIiBtZWFuPyBJIHRoaW5rCj4g
PiA+IHRoZXJlJ3MgYSBtaXNzaW5nIGFjdGlvbiBoZXJlLiBSZWdpc3RyYXRpb24/IEFsbG9jYXRp
b24/Cj4gPiA+Cj4gPgo+ID4gRml4ZWQgaXQuIEl0IGlzIHN1cHBvc2VkIHRvIGJlICJzbmFwc2hv
dCBzaG1lbSBzZXR1cCIKPiA+Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqIGNwdSBo
b3RwbHVnIG9uLCBpdCBzaG91bGQgYmFpbCBvdXQuCj4gPiA+Cj4gPiA+IFNob3VsZCBvciB3aWxs
PyBXaGF0IGFjdGlvbiBkb2VzICJiYWlsIG91dCIgY29ycmVzcG9uZCB0bz8KPiA+ID4KPiA+Cj4g
PiBiYWlsIG91dCB0aGUgY3B1IGhvdHBsdWcgcHJvY2Vzcy4gV2UgZG9uJ3Qgc3VwcG9ydCBoZXRl
cm9nZW5lb3VzIHBtdXMKPiA+IGZvciBzbmFwc2hvdC4KPiA+IElmIHRoZSBTQkkgaW1wbGVtZW50
YXRpb24gcmV0dXJucyBzdWNjZXNzIGZvciBTQklfRVhUX1BNVV9TTkFQU0hPVF9TRVRfU0hNRU0K
PiA+IGJvb3QgY3B1IGJ1dCBmYWlscyBmb3Igb3RoZXIgY3B1cyB3aGlsZSBicmluZ2luZyB0aGVt
IHVwLCBpdCBpcwo+ID4gcHJvYmxlbWF0aWMgdG8gaGFuZGxlIHRoYXQuCj4KPiAiYmFpbCBvdXQi
IHNob3VsZCBiZSByZXBsYWNlZCBieSBhIG1vcmUgdGVjaG5pY2FsIGV4cGxhbmF0aW9uIG9mIHdo
YXQgaXMKPiBnb2luZyB0byBoYXBwZW4uICJzaG91bGQiIGlzIGEgd2VpcmQgd29yZCB0byB1c2Us
IGVpdGhlciB0aGUgY3B1aG90cGx1Zwo+IGNvZGUgZG9lcyBvciBkb2VzIG5vdCBkZWFsIHdpdGgg
dGhpcyBjYXNlLCBhbmQgc2luY2UgdGhhdCBjb2RlIGlzIGFsc28KPiBpbiB0aGUga2VybmVsLCB0
aGlzIHBhdGNoc2V0IHNob3VsZCBlbnN1cmUgdGhhdCBpdCBkb2VzIGhhbmRsZSB0aGUgY2FzZSwK
PiBubz8gSWYgdGhlIGtlcm5lbCBkb2VzIGhhbmRsZSBpdCAic2hvdWxkIiBzaG91bGQgYmUgcmVw
bGFjZWQgd2l0aCBtb3JlCj4gZGVmaW5pdGl2ZSB3b3JkaW5nLgo+Cgpvay4gSSB3aWxsIGltcHJv
dmUgdGhlIGNvbW1lbnQgdG8gZXhwbGFpbiBhIGJpdCBtb3JlLgoKPiBUaGFua3MsCj4gQ29ub3Iu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
