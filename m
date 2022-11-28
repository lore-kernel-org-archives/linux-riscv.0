Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34FFC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IIekMi+4X4HZZj5dv82H26pRb7uVOmp4toQrVbssyg=; b=zme+Jw2XeQ0hiv
	QyCX6BwigPC2yM/+AtwMSOwuPIrx6XrZth4VDwRow0DkTqEpPzknn1AAcHGoT0O8hRNqtp81X2ZHX
	QyG09iHHe0yVDI+QQh72FzdmJBi9ZRoPA4UToxH9zH/AWrkYJ2TfwKxEEr+wGW+vayETefxuPbrzJ
	Fu0aSSSMFOMCNbgYquMcBANZlB5ztHTNqYmX+w7qJwsAlw8gUbWOvxtRpda+geaLrGGdIQrEa/0wc
	jGfv71+WKLipCS9yhXSj4eogQPP8wCWRKn5HDSLcRSVs4fgEtI5k97PqQSnb5/BdyUT1p5PeoCjTZ
	Z5P5aETgXhnLaWGE0PRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozerr-0027Lx-Qb; Mon, 28 Nov 2022 14:12:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozerm-0027JB-BN
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 14:12:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id g10so10245147plo.11
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 06:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKw90zUbpAV+b/3rfP6iieLhvlviIys04BFE2GHKsio=;
        b=ihn7p87Ee2lLG81x5tyWrVDKub8QRgPcGbWOFaqKg/2+9VvI6IFNqpNejJ5Gc8Z+5Q
         RssyprNwjCyDnT1/5idaIO/w0Bp050LXwgtvmwY6rzdpO87VtejVe+O4j1fQRFHpIegh
         IFLgDR/0nDvqM4lG2pbZvkGvi1D0uPgf72jZIicny0HjMRwfUxS9iEH3zD7tPiIgL/e3
         8hbFDAF6h2CCkaTMOhCYUsZ7bd9mY9SoH46159euoQVqZByiKwvnds8+pAqZJU5JhABi
         GYNfc6ytFqOXgpGA7eDGj9vQPbs+2VU8dNZpO6gyChRr5LDgfwRKJhIupepCOuEya2oq
         GSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKw90zUbpAV+b/3rfP6iieLhvlviIys04BFE2GHKsio=;
        b=DMnXcfrMFy2q3cIJEjQ7TQjV3Uw0+mJ0XIcfBJN4hI4h0p0t43qdzIq2M8G30B6kOM
         awmUv7JM8tcDX7KUvRN2dgahvX8JXUu9+UYjkovx9mOJ9FyhxqkAzQ/7Ge1LKPK4pljt
         YROhf7vCCyCD5Krko20h68uw9BktOJsUlNlcL381hGJqx6Tfj/jFLjr7r52sFR2vyRfv
         YcHo45czKbL6U9aX1XWrSUVPkPwZkE8Ic9JVpeKUKDXMTXBUPrumv7A+/rgASuKfiLdZ
         Xa0hF7PYg7tmEs3RwJMWps1/w0rErtP2NL56VvcnXSjTTZA7oQBno5zVLCsElJ3D72QJ
         rN3Q==
X-Gm-Message-State: ANoB5plLawfT8dp7a12jvVnubRi9P7Pgr5wZ+rgXbvouQMXNmnX3QcGH
	jvtpwGbxHh/gwxZJygoNDYPySEgtN00HIhfkA7g=
X-Google-Smtp-Source: AA0mqf5wMe8pRArVdzem5WEsZj7bzHjphjpvEdaNt6jZUlgWBfLVI4j9yuPVJaQe3PX0XZHmXMFx/CiNC1N/t3Pzboc=
X-Received: by 2002:a17:90a:dc06:b0:218:9196:1cd1 with SMTP id
 i6-20020a17090adc0600b0021891961cd1mr47707800pjv.230.1669644732976; Mon, 28
 Nov 2022 06:12:12 -0800 (PST)
MIME-Version: 1.0
References: <20220923100149.2647325-1-suagrfillet@gmail.com>
 <CAAYs2=hx49ahtY3pe1z241Vd1mRNZjc-oigubmKy0aGqg6T8ag@mail.gmail.com> <CAJF2gTRfWXZEbAjWQ0vPA8HWihkibPQ2Mb9hvYgQg+DdEFrZTA@mail.gmail.com>
In-Reply-To: <CAJF2gTRfWXZEbAjWQ0vPA8HWihkibPQ2Mb9hvYgQg+DdEFrZTA@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Mon, 28 Nov 2022 22:12:02 +0800
Message-ID: <CAAYs2=j3Eak9vU6xbAw0zPuoh00rh8v5C2U3fePkokZFibWs2g@mail.gmail.com>
Subject: Re: [PATCH RESEND] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@linux.alibaba.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_061214_472951_516295E5 
X-CRM114-Status: GOOD (  18.99  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDI45pel5ZGo5LiAIDIx
OjQ35YaZ6YGT77yaCj4KPiBPbiBUdWUsIE5vdiAyMiwgMjAyMiBhdCA2OjExIFBNIFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU29uZyBTaHVhaSA8c3Vh
Z3JmaWxsZXRAZ21haWwuY29tPiDkuo4yMDIy5bm0OeaciDIz5pel5ZGo5LqUIDEwOjAz5YaZ6YGT
77yaCj4gPiA+Cj4gPiA+IHJpc2N2IG5vdyB1c2VzIC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5
IHdpdGggZHluYW1pYyBmdHJhY2UgYWZ0ZXIKPiA+ID4gdGhlIGBhZmM3NmI4YjhgIGNvbW1pdCwg
d2hpY2ggbWVhbnMgcmVjb3JkbWNvdW50IHNob3VsZG4ndCBiZSBjYWxsZWQKPiBUaGUgcmVmIGNv
bW1pdCBmb3JtYXQgbmVlZHMgdG8gYmUgY29ycmVjdGVkLiBPdGhlcnM6Cj4gVGVzdGVkLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPgpUaGFua3MgZm9yIHlvdXIgdGVzdC4KSSdsbCBj
b3JyZWN0IHRoaXMgcmVmIGluIHRoZSBuZXh0IHZlcnNpb24uCj4gPiA+IHRvIGNyZWF0ZSB0aGUg
X19tY291bnRfbG9jIHNlY3Rpb24gYmVmb3JlIHRoZSB2bWxpbnV4IGxpbmtpbmcuCj4gPiA+Cj4g
PiA+IFdlIHNob3VsZCBzZWxlY3QgRlRSQUNFX01DT1VOVF9VU0VfUEFUQ0hBQkxFX0ZVTkNUSU9O
X0VOVFJZIHRvIHRlbGwKPiA+ID4gTWFrZWZpbGUgbm90IHRvIHJ1biByZWNvcmRtY291bnQuCj4g
PiA+Cj4gPiBIaSxHdW86Cj4gPgo+ID4gQ2FuIHRoaXMgcGF0Y2ggc3F1ZWV6ZSBpbnRvIHlvdXIg
djMgc2VyaWVzID8KPiBUaGV5IGRvbid0IGhhdmUgYSBkZXBlbmRlbmN5LCBhbmQgaXQncyB1bm5l
Y2Vzc2FyeS4gQSBzaW5nbGUgcGF0Y2ggaXMKPiBlYXN5IGZvciB0aGUgbWFpbnRhaW5lciB0byBw
aWNrIHVwLgo+CkdvdCBpdC4KPiA+Cj4gPiBUaGFua3MsCj4gPiBTb25nCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAxICsKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiA+IGluZGV4IGMyMmY1ODE1NTk0OC4uMjVkYjhjZWE4NzZhIDEw
MDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gPiA+IEBAIC0yNDYsNiArMjQ2LDcgQEAgY29uZmlnIEFSQ0hfUlY2NEkKPiA+
ID4gICAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZiAhWElQX0tFUk5FTCAmJiBN
TVUgJiYgJChjYy1vcHRpb24sLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9OCkKPiA+ID4gICAg
ICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgaWYgSEFWRV9EWU5BTUlD
X0ZUUkFDRQo+ID4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEIGlm
ICFYSVBfS0VSTkVMCj4gPiA+ICsgICAgICAgc2VsZWN0IEZUUkFDRV9NQ09VTlRfVVNFX1BBVENI
QUJMRV9GVU5DVElPTl9FTlRSWSBpZiBEWU5BTUlDX0ZUUkFDRQo+ID4gPiAgICAgICAgIHNlbGVj
dCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+ID4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZV
TkNUSU9OX1RSQUNFUiBpZiAhWElQX0tFUk5FTAo+ID4gPiAgICAgICAgIHNlbGVjdCBTV0lPVExC
IGlmIE1NVQo+ID4gPiAtLQo+ID4gPiAyLjIwLjEKPiA+ID4KPgo+Cj4KPiAtLQo+IEJlc3QgUmVn
YXJkcwo+ICBHdW8gUmVuCgoKCi0tIApUaGFua3MsClNvbmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
