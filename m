Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FCFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKGlZDjBUWsBcjD/klszR+W+fS2Wq17puPJR176uzSc=; b=XzKXcqkykYFoFG
	dmbyqKDmsrOQQsOER9EEAeOVqTW3xBMpZCWc4ygbYLZwYgtMINodsFylMJOmEHlWp0BPxAHAyMTjF
	Zy3w93lE/WhJZ0jgX1cjB31XTCtYpW9yBhtMs+xbLVb3hf1JS7qZpDhgwuKA7ICwfvyPp4GKgVJPQ
	l7/3KwmdUG4z2MAuH2XC19zdNIgnN/XYurRziccJsqq9OU25Co5zutpcHcSXDHgSQhP0NvFZdu5w7
	RWt5Hlv7cP86NkRhSfRk3ZLUu4eHK+78rqpAzgkmQqKpsGHRXRBagzY44tdk6NvCQ0GNJIP19z6pa
	dJE4qUECPdRiz8ANSH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXAi-009gpA-Fp; Fri, 26 Nov 2021 09:05:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXAf-009goD-6l
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:05:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id o13so17088795wrs.12
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VOszlauxSKRV5GdcAuyWOFBZoDmtHbCxcUQ0mFztaQs=;
 b=fTydEgc1BkjDuikjg/tqneBR45cgcl8+pNxIT2JOAFt7Z1QBLiRXywcSlbXXkG+xK5
 sDA14RfYXUJsXP3gXjW3a0vrO+wi2JIaebo80OAsYQPxWYBTPPXUDCwVUdxXQMznolWw
 Mx/S5rumtAswC5AgJmj6Y6ODFEH7XzrByarix8mVIXdJt5/E/tvP6DZZdDWeGWQYRlKg
 sviZfV/wkvYPKAxIPUIsKPGKrWfT7b3K8+FJ4yImnSY7x8bP+GOXykT7/rLReLEB3+mr
 8BZXWG8wx4PHSuQ7HqXreNzBlWYk2RsAdsfDQzWG3/N2pjhuY7C3+y++kO770xcqaUde
 X5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VOszlauxSKRV5GdcAuyWOFBZoDmtHbCxcUQ0mFztaQs=;
 b=FaW+lyhrVwO0QuEccAmNrn15NzWHxZQBqxcsn3cS6otkwuuE8Mj+WAi2YaHINTReP7
 Q35SFdkXnbgnz/3DDn/WCPV43gcT9mHeLEN5tyaaUAX/yDMtkJWcrHKIEThrVs58YLBh
 vcOeEb8aXQGZruQdcfCjVyQXiVLiHk+t/vLGgLJ1C19rbdpTWLBvXHk6M0QRh4mzuuoO
 aZdN98K/0Q0AEZQIhhuLusTeMtoseK8VqispQDmZph8XiLTwJlIqA65P//KUu1A+KNOh
 N0oZ/B6JJ6TpFdoUxHc/TkBB6uB4wwCG/hrcY1YlQKNW6900hyOWgynxEPh1rH5pCddI
 95EQ==
X-Gm-Message-State: AOAM530OD/eLhbJ4xqf11KrzMsV5BbAy1ta5fNSIjhHm3xuIEfRbp8EK
 oLnmH82gCZeqa9FU/s430UW+xlSMzBAX+37SvcGRvw==
X-Google-Smtp-Source: ABdhPJx2g0Ir5Jx6J9mngEH1tP5d7kuUVF/S+thBQllAKNw54Ur1qZPJS78YnNnTQnM+vBWDFPyL9PWm49w43w+RVxE=
X-Received: by 2002:adf:e848:: with SMTP id d8mr12866916wrn.3.1637917526467;
 Fri, 26 Nov 2021 01:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20211125152233.162868-1-geert@linux-m68k.org>
 <161F972E-7972-4001-BE19-C88F81EF8047@jrtc27.com>
 <CAMuHMdXpmnmAy7cvA4b9LZe1skzjyOmYgUMgY7KiLRPznSj+2Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXpmnmAy7cvA4b9LZe1skzjyOmYgUMgY7KiLRPznSj+2Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 26 Nov 2021 14:35:14 +0530
Message-ID: <CAAhSdy1SGQqSupUZyPRUak3zEKOXkX9emdQ8bSoB4-zGZOSyhg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive, plic: Fix
 number of interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Zhu <michael.zhu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_010529_322372_B6A33E28 
X-CRM114-Status: GOOD (  39.40  )
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

T24gRnJpLCBOb3YgMjYsIDIwMjEgYXQgMjoyOCBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIEplc3NpY2EsCj4KPiBPbiBUaHUsIE5vdiAy
NSwgMjAyMSBhdCA1OjA4IFBNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3Jv
dGU6Cj4gPiBPbiAyNSBOb3YgMjAyMSwgYXQgMTU6MjIsIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4gPiBUbyBpbXByb3ZlIGh1bWFuIHJlYWRhYmls
aXR5IGFuZCBlbmFibGUgYXV0b21hdGljIHZhbGlkYXRpb24sIHRoZSB0dXBsZXMKPiA+ID4gaW4g
ImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnRpZXMgc2hvdWxkIGJlIGdyb3VwZWQgdXNpbmcg
YW5nbGUKPiA+ID4gYnJhY2tldHMuICBBcyB0aGUgRFQgYmluZGluZ3MgbGFjayBhbiB1cHBlciBi
b3VuZCBvbiB0aGUgbnVtYmVyIG9mCj4gPiA+IGludGVycnVwdHMsIHRodXMgYXNzdW1pbmcgb25l
LCBwcm9wZXIgZ3JvdXBpbmcgaXMgY3VycmVudGx5IGZsYWdnZWQgYXMKPiA+ID4gYW4gZXJyb3Iu
Cj4KPiBSb2I6IElzIHRoaXMgYSBidWcgaW4gdGhlIHRvb2xpbmcgdGhhdCBzaG91bGQgYmUgZml4
ZWQ/Cj4gUmVnYXJkbGVzcywgc3BlY2lmeWluZyBhIHJlYWwgdXBwZXIgbGltaXQgaXMgYWx3YXlz
IGEgZ29vZCBpZGVhLgo+Cj4gPiA+IEZpeCB0aGlzIGJ5IGFkZGluZyB0aGUgbWlzc2luZyAibWF4
SXRlbXMiLCBsaW1pdGluZyBpdCB0byA5IGludGVycnVwdHMKPiA+ID4gKG9uZSBpbnRlcnJ1cHQg
Zm9yIGEgc3lzdGVtIG1hbmFnZW1lbnQgY29yZSwgYW5kIHR3byBpbnRlcnJ1cHRzIHBlciBjb3Jl
Cj4gPiA+IGZvciBvdGhlciBjb3JlcyksIHdoaWNoIHNob3VsZCBiZSBzdWZmaWNpZW50IGZvciBu
b3cuCj4gPgo+ID4gVGhpcyBpcyBTaUZpdmXigJlzIElQLCBzbyBpcyB0aGlzIGFjdHVhbGx5IHRy
dWU/IEkgd291bGQgaW1hZ2luZSBpdOKAmXMKPiA+IGp1c3QgcGFyYW1ldGVyaXNlZCBhbmQgY291
bGQgYmUgZ2VuZXJhdGVkIHdpdGggYXMgbWFueSB0YXJnZXRzIGFzIGZpdAo+ID4gaW4gdGhlIE1N
SU8gc3BhY2UsIGFuZCB0aGF0IHRoaXMgaXMgdGh1cyBpbmFjY3VyYXRlLiBCZXNpZGVzLCBzdWNo
IGEKPgo+IFllcywgdGhpcyBpcyBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkLiAgSSBqdXN0IHVzZWQg
dGhlIG1heGltdW0gdmFsdWUKPiBjdXJyZW50bHkgaW4gdXNlLgo+Cj4gZHJpdmVycy9pcnFjaGlw
L2lycS1zaWZpdmUtcGxpYy5jIGhhcyAjZGVmaW5lIE1BWF9DT05URVhUUyAxNTg3MiwKPiB3aGlj
aCBtYXRjaGVzIHRoZSB2YWx1ZSBvZiBDT05URVhUX1BFUl9IQVJUIGFuZCB0aGUgYXZhaWxhYmxl
IGFkZHJlc3MKPiBzcGFjZSBpbiB0aGUgZHJpdmVyIGFuZCBpbiBbMV0uCj4gV291bGQgeW91IGJl
IG1vcmUgY29tZm9ydGFibGUgd2l0aCAibWF4SXRlbXM6IDE1ODcyIj8KPiBPciBkbyB5b3UgcHJl
ZmVyIHNldHRpbmcgdGhlIG1heGltdW0gYmFzZWQgb24gdGhlIGNvbXBhdGlibGUgdmFsdWUKPiAo
MiBmb3IgazIxMCwgOSBmb3IgZnU1NDAsIDQgZm9yIGpoNzEwMFsyXSk/CgpZZXMsIDE1ODcyIGlz
IGFuIGFwcHJvcHJpYXRlIHZhbHVlIGZvciAibWF4SXRlbXMiLgoKUmVnYXJkcywKQW51cAoKPgo+
ID4gZnVuY3Rpb24gY2hhbmdlIHNob3VsZCBiZSBtYWRlIHNlcGFyYXRlbHkgZnJvbSB0aGUgZ3Jv
dXBpbmcgY2hhbmdlLgo+Cj4gT0ssIHdpbGwgc3BsaXQgaW4gdjIuCj4KPiA+IFRoZSBzYW1lIGdv
ZXMgZm9yIHlvdXIgZXF1aXZhbGVudCBzaWZpdmUsY2xpbnQwIHBhdGNoLgo+Cj4gT0suCj4KPiA+
ID4gR3JvdXAgdGhlIHR1cGxlcyBpbiB0aGUgZXhhbXBsZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiA+ID4gLS0t
Cj4gPiA+IC4uLi9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sICAg
ICAgfCAxMiArKysrKystLS0tLS0KPiA+ID4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAu
MC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+ID4gaW5kZXggMDhkNWE1N2NlMDBmZjQ0
Ni4uMTk4YjM3M2Y5ODRmMzQzOCAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlh
bWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+ID4gQEAgLTYxLDYgKzYxLDcg
QEAgcHJvcGVydGllczoKPiA+ID4KPiA+ID4gICBpbnRlcnJ1cHRzLWV4dGVuZGVkOgo+ID4gPiAg
ICAgbWluSXRlbXM6IDEKPiA+ID4gKyAgICBtYXhJdGVtczogOQo+ID4gPiAgICAgZGVzY3JpcHRp
b246Cj4gPiA+ICAgICAgIFNwZWNpZmllcyB3aGljaCBjb250ZXh0cyBhcmUgY29ubmVjdGVkIHRv
IHRoZSBQTElDLCB3aXRoICItMSIgc3BlY2lmeWluZwo+ID4gPiAgICAgICB0aGF0IGEgY29udGV4
dCBpcyBub3QgcHJlc2VudC4gRWFjaCBub2RlIHBvaW50ZWQgdG8gc2hvdWxkIGJlIGEKPgo+IFsx
XSBodHRwczovL3N0YXRpYy5kZXYuc2lmaXZlLmNvbS9VNTQtTUMtUlZDb3JlSVAucGRmCj4gWzJd
IFRoZSBQTElDIG1lbW9yeSBtYXAgaW4KPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL3N0YXJmaXZl
LXRlY2gvSkg3MTAwX0RvY3MvYmxvYi9tYWluL3ZpY191N19tYW51YWxfd2l0aF9jcmVhdGl2ZWNv
bW1vbnMucGRmCj4gICAgIGluZGljYXRlIG90aGVyIHZhbHVlcyBvZiBFTkFCTEVfUEVSX0hBUlQg
YW5kIENPTlRFWFRfUEVSX0hBUlQ/Cj4gICAgIElzIG1lbW9yeSB0aGUgbWFwIGNvcnJlY3Q/Cj4K
PiBHcntvZXRqZSxlZXRpbmd9cywKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4K
PiAtLQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKPgo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
