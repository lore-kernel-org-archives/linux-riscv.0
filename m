Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFBDE7C4DA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W43i1h6LNnsEezQGk6kcEZG+Bx1JSpkwq46jqwSmchk=; b=AV2GK47eQj9jrp
	nKErTnhbZi1wT9hD57nb0SNh0YXifj/MQ/PDhRPIEqzawEA7CZasU9a3NyfBOSV/AbFHrn3Yh4TU6
	l72q84FYeF5nHBV1qWM+N8RBrKl1B/c2E12bHvm8TzSMtzmC2ktpS+wn697x9rFpzNbGixuAY9xVK
	Tt/gz4h4TSQtRwdFgicOtabaBKVz2pdt5bZsuvY/UQbWTaQRdLfb5CuCk79kQew7b6cIe/efapQt1
	IfUp04gNWh9Wf/wUUH3M5BJH/16gLIvnOYAFVTn1y3jM+Wk0wsG7nqQlZuw34UoXYTImuStHlTaZz
	Cd/FsLwARKRmTYfYnMNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4M6-000Qi3-0u;
	Wed, 04 Oct 2023 16:04:10 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4M2-000QgA-2w
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 16:04:08 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7b2ca45d5cfso1066416241.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696435443; x=1697040243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MABqfnWSdAh1rkdR5ORe/BqnN4/f/y3PtSz94ONAKI4=;
        b=CAZ/i6i7x1Mivt58osX9gOCefhz6JBLN8DEX9yyjbzeOqvjCtqohHaET37n4aw0/tC
         K1kPR6jg4grCTUoITqGDK4evcSuOGeDhBG22e/nLa47Un2YqHDgBiICfgWS/rj2W+KlZ
         GbcxGoqf63CC5g08XysETNrWBbJkeUPSU8tqfkuYo0OQk/lvqZyQSjnoGT9AgQ6tN5Uj
         6KOK+G2VU5lyu6qtsPc8VkYGnT98ZuR/ZVpLMwXoCv5dMXWLykzSHb6YSsro22dj+wst
         uHGs+Y2J1tY81ERKNxtsISVvg7G/HU/4bGugqP03QftjwDlv95AOJ6Mytr9Wp3bWNXks
         8bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696435443; x=1697040243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MABqfnWSdAh1rkdR5ORe/BqnN4/f/y3PtSz94ONAKI4=;
        b=XsrNv0FWs6NaVJ17YtPXQujB5HjWdV8Wm7Y8Ka3N+W69rizF6/WGeJS3yGjuvtJVDo
         ywCs//tM4jNgHbeC87WiiigZW6vQFy4IzUfjpoIMIT5QD2DD255ziTfpF4N3CpoTqGeZ
         2RHz3SGdHsudC+wpFs6jMUqTXZJ8kjD3mJkd1AZpyAZ+FtoVpRKn+GgF52ZA8YLJreJD
         dDJR7wVdKW00IEqh8nXLSP3Pgxg70O6mmzSh0U4ELQINSqFx8w2Q6y1Z8+FcWCgRU0LY
         d6ryBHXX6YRsjCvLhihCWphzYlewlXKBD+NxM8dcC1ndQVuL2i5v1u1MPuif4hUW6sT3
         Efqg==
X-Gm-Message-State: AOJu0YxGToTiQpRH9cRNH4KbljqnKFGyJgpevGOrZGo5cu0L0WOl6oYJ
	fyar89mXlFWpZ2e6SttR+r8PPiiRDi3E4dU9O8Y=
X-Google-Smtp-Source: AGHT+IFhqTAHYHSaLhsynlzcRRRkFceUfAS3vdmJwZJTjrHm3e3CkHq0mrE5OVpqiZHY9FG2KMkgJe29WNiyo850cMc=
X-Received: by 2002:a1f:4ac2:0:b0:49a:3537:881e with SMTP id
 x185-20020a1f4ac2000000b0049a3537881emr2263379vka.13.1696435443340; Wed, 04
 Oct 2023 09:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker> <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com> <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me>
 <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com>
In-Reply-To: <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Oct 2023 17:03:36 +0100
Message-ID: <CA+V-a8s1S4yTH19PVNSznAgUFoHRNoye9CfwjW6iy6PbQ9thew@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_090406_972412_14753D81 
X-CRM114-Status: GOOD (  26.25  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <dfustini@baylibre.com>, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCAzOjE44oCvUE0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNC8xMC8yMDIzIDM6MDIgcG0sIEljZW5vd3kgWmhl
bmcgd3JvdGU6Cj4gWy4uLl0KPiA+Pj4+IEkgYmVsaWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgi
c29jOiByZW5lc2FzOiBLY29uZmlnOiBTZWxlY3QgdGhlCj4gPj4+PiByZXF1aXJlZCBjb25maWdz
IGZvciBSWi9GaXZlIFNvQyIpIGNhbiBjYXVzZSByZWdyZXNzaW9uIG9uIGFsbAo+ID4+Pj4gbm9u
LWRtYS1jb2hlcmVudCByaXNjdiBwbGF0Zm9ybXMgd2l0aCBnZW5lcmljIGRlZmNvbmZpZy4gVGhp
cyBpcwo+ID4+Pj4gYSBjb21tb24gaXNzdWUuIFRoZSBsb2dpYyBoZXJlIGlzOiBnZW5lcmljIHJp
c2N2IGRlZmNvbmZpZwo+ID4+Pj4gc2VsZWN0cwo+ID4+Pj4gQVJDSF9SOUEwN0cwNDMgd2hpY2gg
c2VsZWN0cyBETUFfR0xPQkFMX1BPT0wsIHdoaWNoIGFzc3VtZXMgYWxsCj4gPj4+PiBub24tZG1h
LWNvaGVyZW50IHJpc2N2IHBsYXRmb3JtcyBoYXZlIGEgZG1hIGdsb2JhbCBwb29sLCB0aGlzCj4g
Pj4+PiBhc3N1bXB0aW9uCj4gPj4+PiBzZWVtcyBub3QgY29ycmVjdC4gQW5kIEkgYmVsaWV2ZSBE
TUFfR0xPQkFMX1BPT0wgc2hvdWxkIG5vdCBiZQo+ID4+Pj4gc2VsZWN0ZWQgYnkgQVJDSF9TT0NG
QU1JTElZLCBpbnN0ZWFkLCBvbmx5IEFSQ0ggdW5kZXIgc29tZQo+ID4+Pj4gc3BlY2lmaWMKPiA+
Pj4+IGNvbmRpdGlvbnMgY2FuIHNlbGVjdCBpdCBnbG9iYWx5LCBmb3IgZXhhbXBsZSBOT01NVSBB
Uk0gYW5kIHNvCj4gPj4+PiBvbi4KPiA+Pj4+Cj4gPj4+PiBTaW5jZSB0aGlzIGlzIGEgcmVncmVz
c2lvbiwgd2hhdCdzIHByb3BlciBmaXg/IGFueSBzdWdnZXN0aW9uIGlzCj4gPj4+PiBhcHByZWNp
YXRlZC4KPiA+Pgo+ID4+IEkgdGhpbmsgdGhlIGFuc3dlciBpcyB0byBub3Qgc2VsZWN0IERNQV9H
TE9CQUxfUE9PTCwgc2luY2UgdGhhdCBpcwo+ID4+IG9ubHkKPiA+Cj4gPiBXZWxsIEkgdGhpbmsg
Zm9yIFJJU0MtViwgaXQncyBub3QgTk9NTVUgb25seSBidXQgYXBwbGljYWJsZSBmb3IgZXZlcnkK
PiA+IGNvcmUgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IFN2cGJtdCBvciB2ZW5kb3Itc3BlY2lmaWMg
YWx0ZXJuYXRpdmVzLAo+ID4gYmVjYXVzZSB0aGUgb3JpZ2luYWwgUklTQy1WIHByaXYgc3BlYyBk
b2VzIG5vdCBkZWZpbmUgbWVtb3J5IGF0dHJpYnV0ZXMKPiA+IGluIHBhZ2UgdGFibGUgZW50cmll
cy4KPiA+Cj4gPiBGb3IgdGhlIFJlbmVzYXMvQW5kZXMgY2FzZSBJIHRoaW5rIGEgcG9vbCBpcyBz
ZXQgYnkgT3BlblNCSSB3aXRoCj4gPiB2ZW5kb3Itc3BlY2lmaWMgTS1tb2RlIGZhY2lsaXR5IGFu
ZCB0aGVuIHBhc3NlZCBpbiBEVCwgYW5kIHRoZSBTLW1vZGUKPiA+ICh3aGljaCBNTVUgaXMgZW5h
YmxlZCBpbikganVzdCBzZWVzIGZpeGVkIG1lbW9yeSBhdHRyaWJ1dGVzLCBpbiB0aGlzCj4gPiBj
YXNlIEkgdGhpbmsgRE1BX0dMT0JBTF9QT09MIGlzIG5lZWRlZC4KPgo+IE9oIHdvdywgaXMgdGhh
dCByZWFsbHkgYSB0aGluZz8gSW4gdGhhdCBjYXNlLCBlaXRoZXIgeW91IGp1c3QgY2FuJ3QKPiBz
dXBwb3J0IHRoaXMgcGxhdGZvcm0gaW4gYSBtdWx0aS1wbGF0Zm9ybSBrZXJuZWwsIG9yIHNvbWVv
bmUgbmVlZHMgdG8gZG8KPiBzb21lIGZpZGRseSB3b3JrIGluIGRtYS1kaXJlY3QgdG8gYSkgaW50
cm9kdWNlIHRoZSBub3Rpb24gb2YgYW4gb3B0aW9uYWwKPiBnbG9iYWwgcG9vbCwKTG9va2luZyBh
dCB0aGUgY29kZSBbMF0gd2UgZG8gaGF2ZSBjb21waWxlIHRpbWUgY2hlY2sgZm9yCkNPTkZJR19E
TUFfR0xPQkFMX1BPT0wgaXJyZXNwZWN0aXZlIG9mIHRoaXMgYmVpbmcgcHJlc2VudCBpbiBEVCBv
cgpub3QsIGluc3RlYWQgaWYgd2UgbWFrZSBpdCBjb21waWxlIHRpbWUgYW5kIHJ1bnRpbWUgY2hl
Y2sgaWUgZWl0aGVyCmNoZWNrIGZvciBEVCBub2RlIG9yIHNlZSBpZiBwb29sIGlzIGF2YWlsYWJs
ZSBhbmQgb25seSB0aGVuIHByb2NlZWQKZm9yIGFsbG9jYXRpb24gZm9ybSB0aGlzIHBvb2wuCgpX
aGF0IGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoaXM/CgpbMF0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjYuNi1yYzQvc291cmNlL2tlcm5lbC9kbWEvZGlyZWN0LmMjTDIzOAoKPiBh
bmQgYikgbWFrZSBpdCBzb21laG93IGNvcGUgd2l0aCBETUFfRElSRUNUX1JFTUFQIGJlaW5nCj4g
ZW5hYmxlZCBidXQgbm9uLWZ1bmN0aW9uYWwuCj4KRE1BX0RJUkVDVF9SRU1BUCBjb25maWcgb3B0
aW9uIGlzIHNlbGVjdGVkIGJ5IE5PTkNPSEVSRU5FVCBjb25maWcgb3B0aW9uIGFueXdheS4KCkNo
ZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
