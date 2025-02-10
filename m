Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD268C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INnmVgQ9L954A6zAzkVDtvhBeEHNRD7hkaqc8BqTRt4=; b=f1tuuFMrpkD62u
	bq4wT6ByNiBHcijviVrIRgH7khp5lsnOCK7iC32E4sjdsj8JJ+RILkyyP0UVpSbxPEIZSQRX8DwK9
	Ymbz2Tqczd6bZunrLZ1atuTh+MDuiHSePbaPYhjketP6dl2knXCvKob1YvTfKHoFkg99DiykgeLGo
	3i48yhX3745aRmOUSXeHYYj4tFeiXy8ErVYErnwP2XUsMkz7KGpQQ1+NK1x0zEXwFI8YO/s0EcBAd
	u2DQDJ18GHPHwmrwnaaJ79ACVyjy57u1MWpaldWrWgXLhnxdcX5HsF2cJqcc3uuOHAS0XKb2tzYE8
	g4Y+7NLdbI6mTzVuqf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcyZ-00000001oAZ-0d9v;
	Mon, 10 Feb 2025 23:14:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thciX-00000001lFB-0GuZ;
	Mon, 10 Feb 2025 22:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=; b=GGkT3WPRYqVKVc/X4zfDnQEQg5
	yYFbxDH+B30D/kJ4J6Urt8Vv08NrgX+MDn+CvOyo3mZXzV4bJoPXRR9QL+S/I3k4Nceemv+AL33+P
	E+XLjycFkjYK2RR51W/+Re/DMyJNRXES9hph9pMZZErrD4e2a4W/IXk8l3fVTHOJ0Rlzkoxc2ya9/
	f+rAInkkY+btCOJFm7CXrJYBRvDdiz1f5+2Pt8No37IRJiBrjxuI14RBCNEXslM2iQ7TMjx2X9QdP
	lJ7OAmQZXKvm+H1Mf51lmmPGgeL+2APg64+aThU0VVxiACOIijB2BtHbpRPcLowwiZxdCVrd/9L8x
	cBUfOM+Q==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thciS-00000000LWh-15IZ;
	Mon, 10 Feb 2025 22:57:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43624b2d453so57473185e9.2;
        Mon, 10 Feb 2025 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739228241; x=1739833041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=;
        b=XKObD4IdLFpTEIhTgbCJxUwKXNsv8W8VZHLNh98VehVLCEPpcc35sV/En2+t5paHWY
         uCsjnIXHTAOPUrhxpS1hS/vnbSG6kwzq7ok7odQoNAADh5mHal0nXA3jKdGyMSVr4Zbq
         ErcMfOtSIKRA8ASxEy6NR20Fuzk/e0J5wByoDa/fvwIFLZ/awF+PrR5Gh7wTWuWuZrHW
         J1Iv7C3EJv6TuwkzlVdcw96Gzi4/M84QYPs7p8CqjdSNINF2x3F/dHKXGlun2Yg/1L+K
         EGom4rx88t5GbCC0b97aSPL1R0MPyv8nrBUKNPas2COVZYJ++6YwnLtiH+83AurP/yi9
         B8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228241; x=1739833041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=;
        b=avab+qcHERM8uX9ZWqADvaUCNxoNyFsNDqbRvCot673nB8JoRhBzdytwFAYT2sQDLP
         P4MOMx8I51LF/kolsryZo5L5LdlXXuS9CgztyLQAT+wiDL+rQFx5oW+k42hU/chZu0A9
         ukVRP8wABzC7exQUxAxQhHk8Qk8wsUEgff4+l69jL6tSjOBolyRiqd0xJvQ62t2zWu0H
         FCNFQqADV+/JSPivMJ64wdOGwP2o2Fjla/B+5UfanvqvO+co6F/LgSGUmR4AYw0omBMJ
         Y5kgsXJTnI2AelVA3w4VDB9MNsXM0xMcEbeznIyN7RUTp/YdWj0Qk5AI7MIyhjl3XE92
         r/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAlYae6gYuwpmYO1aMXj3UIQXoc7m9hFlqBB/YkXbhPaJd+5HSBwaVjRlyBpEx8pchb5VWAgGspXEOQCw=@lists.infradead.org, AJvYcCVeldBvUe1nM/+ZyjeIxQC/Z592YPC+/hoU+9GBxsG9S3Ckxe8IkUme2U3F4uZdTspckVHjXon3QfAyUMhjbQWz@lists.infradead.org
X-Gm-Message-State: AOJu0YzQHpZFbwrc994RkK7EOI+BQlocLpQIYjJMDV2KQlZ/BFfiHtHA
	+m5/rbTyi6Z1yZM2FuO9uDgu/h08R3j1QPhV0A2dBtdAOlnpP41jYEFeObT+tpMuuA4pXS493rm
	3ykBlPLxdAZxWOO01h2gFRnMNj4gvpvX4
X-Gm-Gg: ASbGnctKKuS+ESfadNKzenSDL884ThFmhGh4b9Lf7fJgog2aeVQPXj4KGOoOmEWyPaT
	zvOw4RdfwOaJg3S6S5Tgx98W1zmbrTR+9wwDPmmbyaUCsBF4l74u5jtEtHaf84D1igTyeYE8oCQ
	==
X-Google-Smtp-Source: AGHT+IEyUgh5hlQMy0mHMpjDyPnw+ddSs3VVjhhzfY77llj/hDQfGTz8SApwdafm8zv7xWDMgUXawi4NTtMIohvXxFk=
X-Received: by 2002:a05:600c:83ca:b0:434:f4fa:83c4 with SMTP id
 5b1f17b1804b1-439249bcfc5mr154560525e9.29.1739228240742; Mon, 10 Feb 2025
 14:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl> <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
In-Reply-To: <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 10 Feb 2025 23:57:10 +0100
X-Gm-Features: AWEUYZn_arFHbmdvgRzow88RfNbJeiY3tjTfw66TROSp7YjMhPMT9KN4C9hXEgM
Message-ID: <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225724_511799_06EF3E34 
X-CRM114-Status: GOOD (  22.55  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgNDo1M+KAr1BNIE1hY2llaiBXaWVjem9yLVJldG1hbgo8
bWFjaWVqLndpZWN6b3ItcmV0bWFuQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDI1LTAyLTEw
IGF0IDE2OjIyOjQxICswMTAwLCBNYWNpZWogV2llY3pvci1SZXRtYW4gd3JvdGU6Cj4gPk9uIDIw
MjQtMTAtMjMgYXQgMjA6NDE6NTcgKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPj5P
biBUdWUsIE9jdCAyMiwgMjAyNCBhdCAzOjU54oCvQU0gU2FtdWVsIEhvbGxhbmQKPiA+PjxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiA+Li4uCj4gPj4+ICsgICAgICAgICogU29m
dHdhcmUgVGFnLUJhc2VkIEtBU0FOLCB0aGUgZGlzcGxhY2VtZW50IGlzIHNpZ25lZCwgc28KPiA+
Pj4gKyAgICAgICAgKiBLQVNBTl9TSEFET1dfT0ZGU0VUIGlzIHRoZSBjZW50ZXIgb2YgdGhlIHJh
bmdlLgo+ID4+PiAgICAgICAgICAqLwo+ID4+PiAtICAgICAgIGlmIChhZGRyIDwgS0FTQU5fU0hB
RE9XX09GRlNFVCkKPiA+Pj4gLSAgICAgICAgICAgICAgIHJldHVybjsKPiA+Pj4gKyAgICAgICBp
ZiAoSVNfRU5BQkxFRChDT05GSUdfS0FTQU5fR0VORVJJQykpIHsKPiA+Pj4gKyAgICAgICAgICAg
ICAgIGlmIChhZGRyIDwgS0FTQU5fU0hBRE9XX09GRlNFVCB8fAo+ID4+PiArICAgICAgICAgICAg
ICAgICAgIGFkZHIgPj0gS0FTQU5fU0hBRE9XX09GRlNFVCArIG1heF9zaGFkb3dfc2l6ZSkKPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4+PiArICAgICAgIH0gZWxzZSB7
Cj4gPj4+ICsgICAgICAgICAgICAgICBpZiAoYWRkciA8IEtBU0FOX1NIQURPV19PRkZTRVQgLSBt
YXhfc2hhZG93X3NpemUgLyAyIHx8Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgYWRkciA+PSBL
QVNBTl9TSEFET1dfT0ZGU0VUICsgbWF4X3NoYWRvd19zaXplIC8gMikKPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4+Cj4gPj5IbSwgSSBtaWdodCBiZSB3cm9uZywgYnV0
IEkgdGhpbmsgdGhpcyBjaGVjayBkb2VzIG5vdCB3b3JrLgo+ID4+Cj4gPj5MZXQncyBzYXkgd2Ug
aGF2ZSBub24tY2Fub25pY2FsIGFkZHJlc3MgMHg0MjQyNDI0MjQyNDI0MjQyIGFuZCBudW1iZXIK
PiA+Pm9mIFZBIGJpdHMgaXMgNDguCj4gPj4KPiA+PlRoZW46Cj4gPj4KPiA+PktBU0FOX1NIQURP
V19PRkZTRVQgPT0gMHhmZmZmODAwMDAwMDAwMDAwCj4gPj5rYXNhbl9tZW1fdG9fc2hhZG93KDB4
NDI0MjQyNDI0MjQyNDI0MikgPT0gMHgwNDIzYTQyNDI0MjQyNDI0Cj4gPj5tYXhfc2hhZG93X3Np
emUgPT0gMHgxMDAwMDAwMDAwMDAwMDAwCj4gPj5LQVNBTl9TSEFET1dfT0ZGU0VUIC0gbWF4X3No
YWRvd19zaXplIC8gMiA9PSAweGY3ZmY4MDAwMDAwMDAwMDAKPiA+PktBU0FOX1NIQURPV19PRkZT
RVQgKyBtYXhfc2hhZG93X3NpemUgLyAyID09IDB4MDdmZjgwMDAwMDAwMDAwMCAob3ZlcmZsb3dz
KQo+ID4+Cj4gPj4weDA0MjNhNDI0MjQyNDI0MjQgaXMgPCB0aGFuIDB4ZjdmZjgwMDAwMDAwMDAw
MCwgc28gdGhlIGZ1bmN0aW9uIHdpbGwKPiA+Pndyb25nbHkgcmV0dXJuLgo+ID4KPiA+QXMgSSB1
bmRlcnN0YW5kIHRoaXMgY2hlY2sgYWltcyB0byBmaWd1cmUgb3V0IGlmIHRoZSBhZGRyZXNzIGxh
bmRlZCBpbiBzaGFkb3cKPiA+c3BhY2UgYW5kIGlmIGl0IGRpZG4ndCB3ZSBjYW4gcmV0dXJuLgo+
ID4KPiA+Q2FuJ3QgdGhpcyBhYm92ZSBzbmlwcGV0IGJlIGEgc2ltcGxlOgo+ID4KPiA+ICAgICAg
IGlmICghYWRkcl9pbl9zaGFkb3coYWRkcikpCj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+
Cj4gPj8KPgo+IFNvcnJ5LCBJIHRoaW5rIHRoaXMgd291bGRuJ3Qgd29yay4gVGhlIHRhZyBhbHNv
IG5lZWRzIHRvIGJlIHJlc2V0LiBEb2VzIHRoaXMKPiBwZXJoYXBzIHdvcmsgZm9yIHRoaXMgcHJv
YmxlbT8KPgo+ICAgICAgICAgaWYgKCFhZGRyX2luX3NoYWRvdyhrYXNhbl9yZXNldF90YWcoKHZv
aWQgKilhZGRyKSkpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKClRoaXMgd291bGRuJ3Qgd29y
ayBhcyB3ZWxsLgoKYWRkcl9pbl9zaGFkb3coKSBjaGVja3Mgd2hldGhlciBhbiBhZGRyZXNzIGJl
bG9uZ3MgdG8gdGhlIHByb3BlcgpzaGFkb3cgbWVtb3J5IGFyZWEuIFRoYXQgYXJlYSBpcyB0aGUg
cmVzdWx0IG9mIHRoZSBtZW1vcnktdG8tc2hhZG93Cm1hcHBpbmcgYXBwbGllZCB0byB0aGUgcmFu
Z2Ugb2YgcHJvcGVyIGtlcm5lbCBhZGRyZXNzZXMuCgpIb3dldmVyLCB3aGF0IHdlIHdhbnQgdG8g
Y2hlY2sgaW4gdGhpcyBmdW5jdGlvbiBpcyB3aGV0aGVyIHRoZSBnaXZlbgphZGRyZXNzIGNhbiBi
ZSB0aGUgcmVzdWx0IG9mIHRoZSBtZW1vcnktdG8tc2hhZG93IG1hcHBpbmcgZm9yIHNvbWUKbWVt
b3J5IGFkZHJlc3MsIGluY2x1ZGluZyB1c2Vyc3BhY2UgYWRkcmVzc2VzLCBub24tY2Fub25pY2Fs
CmFkZHJlc3NlcywgZXRjLiBTbyBlc3NlbnRpYWxseSB3ZSBuZWVkIHRvIGNoZWNrIHdoZXRoZXIg
dGhlIGdpdmVuCmFkZHJlc3MgYmVsb25ncyB0byB0aGUgYXJlYSB0aGF0IGlzIHRoZSByZXN1bHQg
b2YgdGhlIG1lbW9yeS10by1zaGFkb3cKbWFwcGluZyBhcHBsaWVkIHRvIHRoZSB3aG9sZSBhZGRy
ZXNzIHNwYWNlLCBub3Qgb25seSB0byBwcm9wZXIga2VybmVsCmFkZHJlc3Nlcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
