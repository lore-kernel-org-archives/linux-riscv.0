Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD367CCA470
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 04:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+YSuDa4WcAlOj0Hd+foIKKwjS58nbskATgTgqDDmy8=; b=N5VKlIB3gSX2st
	2ftNy7hj5QyF/bYTIzx2Nu6lAr5F45wlFzHOgVeUlVDSO9E+NpiD3qkmw82k346nGK0xGPqqq9Q9N
	J2vN4OO9l3vZadlnOgwHaZlzQXTXsXeG48e/OyEUtvJxjaYOQ37q7z9D9otXndOIlceAj1aXJdxGj
	oQyIFHLbEs0H0kijUaRAi61a8L2OEMPmIU8tCWWR/kpczNGNL28ZUeffx/25CYehXOyLPR4xywAeW
	OEvv+UkYimTe9T8nGgNEcDMs8RLc+EseJpeBrLpStd4Np+y1ON25i7yvftVJ+WnBIb6XiAdXHdhA1
	MWIIT7fI3sb6bxGgFavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4XCe-0000000Bd7B-1FPY;
	Fri, 03 Oct 2025 04:15:32 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4XCb-0000000Bd6D-07kJ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 04:15:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso18544021fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 21:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759464927; x=1760069727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjn8OgXaU5K1wFSTR6No5vtQmblOm/S8wCAtRj8MtV0=;
        b=DyMsVz9krbiUHlZlo3ukCtkcBRXoTiL8dHHVBnm3dquh3Dn3F7W3IMRMJC69P8h6VY
         iISPFNUFn4mTjysBKvRX5EyObzNgNmUTjwv1KJghBCIduidYlHISEWUMACrm8ycIMuxD
         36Ns0mu/jb6/fUGBdHJ8LBR7oub8tjTu0rX3ZtkJGVuCvAaivRA2xZUO2DJSNJmBtL+4
         WL08bCo+PSxYWJmuIUUhlt3QUYHIfurND9pL3ZTqkg5aJGoVgGPQydNxM5uSzWU32B9o
         jlAlxE36Vrh5WS6OIIHXlMT4NLTu4WuMQvmss8CKp6RokP1aThn20wqKxyX3vLD2eA5A
         lGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759464927; x=1760069727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjn8OgXaU5K1wFSTR6No5vtQmblOm/S8wCAtRj8MtV0=;
        b=MXjRi5SMNIteasENROhv8es70ghwZ2lYG5UBXoJYsT+d8avLPtgyCBUwbDumZl8vG5
         pgGXx3Japk5N8TVhU/ssv5v+9JEKapbJqP9qHtun00gUrplRANpIp+5ZIfOKxlBQWdCt
         E+HyBy339WiTnGNZgEyA2gJHt4XeGptO93iWgle/a+COywmor1e6nWDOp3xWudCje6yG
         0DVEFoOpjAQJE1U/vwr4fwK3ancPE80Oxnx0hZVvzB9FMjP8KdLYLKPjskSLJGiuXq1f
         /JbHymuX6Ad55z4NEtYvyKaQFeylselu0z0AS0s/quih/xyDOSuJHemGEIbY3eqteGJG
         Qejg==
X-Forwarded-Encrypted: i=1; AJvYcCWq5h+ihJHfggp17U3aBHhrry6vwKTmNAUFeACKWGA1dgaCFcUUJ1zlvs5572zAnjgDz48v0Tg6Gi/z6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YySK+toLyQSzIkMG7mgptkKKu86COcz48hS6j/z4t4URCUTybqj
	kKssvGmv5Vee6Y1azSv9+CWWWSERQbIaS6L/i5suE9IFQ8/zxZzFfh4ZewTFJ0jrN7K523gQaLI
	MWWidOwosq2LP4wNl/9n24l4ZG/qxjFDVDI+TqiGg+w==
X-Gm-Gg: ASbGncsvtPvlnSxB5v1a32nsSpuJ49wGvTZ1EReNiZFtY0nBG54D+JjKgswfTLMug8g
	t769s01ElWs2vdjLYwBaYBVjZ11w49B7GRJwzjW9trXTr4Rnx1tEUcVTzJSiY9Dl/zzWpAcBU2E
	V6+K1vamAfOQD+t5iLEfMH1hdCyPiI/GjT5ZvEibQ7aIheMowSkYJlCiDhmX6GE6jNIp/Tg8SN+
	G87KklmqIrLh51HkjjovLg5WRsXYUSR
X-Google-Smtp-Source: AGHT+IHv8BGLAUrC90J0sK3NMTjOQ31CiSfYXIY0hQiE3tOeBGV6iKJ8BSFWipdy28vsBsFlMAlpKEvxI7FL6usEuyg=
X-Received: by 2002:a2e:be0f:0:b0:36b:2fab:fa6f with SMTP id
 38308e7fff4ca-373b8ca6ab8mr16482051fa.3.1759464926574; Thu, 02 Oct 2025
 21:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <2025100208-challenge-protrude-d6c3@gregkh> <CAK9=C2U9FV6crTL1G2X6tUM=RyRnPBm1dPeFc29n3vmrFTcfHw@mail.gmail.com>
 <2025100255-catcall-drinkable-23f5@gregkh> <30efd90b-ba9f-4291-b9a1-8739f1c5f24b@gmail.com>
In-Reply-To: <30efd90b-ba9f-4291-b9a1-8739f1c5f24b@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 3 Oct 2025 09:45:15 +0530
X-Gm-Features: AS18NWCV4kwPzdl3pVRzJuYKfCe4eENRKX3BJfzp0ornYWfxAm9sGwDdK5zEYFo
Message-ID: <CAK9=C2UPHf29DeLh6DikyLPAw-cQ+-FW8-uqzbjJWYaraJYO8w@mail.gmail.com>
Subject: Re: [PATCH 00/11] Linux RISC-V trace framework and drivers
To: Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_211529_110046_8C4F0B05 
X-CRM114-Status: GOOD (  21.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMywgMjAyNSBhdCAyOjEz4oCvQU0gQm8gR2FuIDxnYW5ib2luZ0BnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gT24gMTAvMS8yNSAyMzo0NCwgR3JlZyBLSCB3cm90ZToKPiA+IE9uIFRo
dSwgT2N0IDAyLCAyMDI1IGF0IDEyOjA5OjIzUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4g
Pj4gT24gVGh1LCBPY3QgMiwgMjAyNSBhdCAxMTo1NuKAr0FNIEdyZWcgS0ggPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gVGh1LCBPY3QgMDIsIDIwMjUg
YXQgMTE6Mzc6MjFBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+Pj4+IFRoaXMgc2VyaWVz
IGFkZHMgaW5pdGlhbCBzdXBwb3J0IGZvciBSSVNDLVYgdHJhY2UgZnJhbWV3b3JrIGFuZCBkcml2
ZXJzLgo+ID4+Pj4gVGhlIFJJU0MtViB0cmFjZSB2MS4wIHNwZWNpZmljYXRpb24gaXMgYWxyZWFk
eSByYXRpZmllZCBhbmQgY2FuIGJlIGZvdW5kIGF0Ogo+ID4+Pj4gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2LW5vbi1pc2EvZS10cmFjZS1lbmNhcC9yZWxlYXNlcy90YWcvdjEuMC4wLXJhdGlmaWVk
Cj4gPj4+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS90Zy1uZXh1cy10cmFjZS9y
ZWxlYXNlcy90YWcvMS4wX1JhdGlmaWVkCj4gPj4+Pgo+ID4+Pj4gVGhlIFJJU0MtViB0cmFjZSBm
cmFtZXdvcmsgYW5kIGRyaXZlcnMgYXJlIGRlc2lnbmVkIHRvIGJlIGFnbm9zdGljIHRvIHRoZQo+
ID4+Pj4gdW5kZXJseWluZyB0cmFjZSBwcm90b2NvbCBoZW5jZSBib3RoIFJJU0MtViBFLXRyYWNl
IGFuZCBSSVNDLVYgTi10cmFjZSBzaG91bGQKPiA+Pj4+IHdvcmsgZmluZS4gVGhlIGRpc2NvdmVy
eSBvZiB0cmFjZSBwcm90b2NsIHBhcmFtZXRlcnMgYXJlIGxlZnQgdG8gdXNlci1zcGFjZQo+ID4+
Pj4gdHJhY2UgZGVjb2Rlci4KPiA+Pj4+Cj4gPj4+PiBJbiB0aGVyIGZ1dHVyZSwgdGhlcmUgd2ls
bCBiZSBzdWJzZXF1ZW50IHNlcmllcyBhZGRpbmc6Cj4gPj4+PiAxKSBTeXNmcyBzdXBwb3J0Cj4g
Pj4+Cj4gPj4+IHdoeSBkb2VzICJ0cmFjZSIgbmVlZCBzeXNmcyBzdXBwb3J0PyAgTm8gb3RoZXIg
Y3B1IHBsYXRmb3JtIHVzZXMgdGhhdAo+ID4+PiB0b2RheSwgc28gd2h5IGlzIGEgbmV3IHVzZXIv
a2VybmVsIGFwaSBuZWVkZWQ/Cj4gPj4KPiA+PiBXZSBzYXcgdHJhY2Ugc3VwcG9ydCBmb3Igb3Ro
ZXIgYXJjaGl0ZWN0dXJlcyAoZS5nLiBBUk0gY29yZXNpZ2h0KSBhbGxvd2luZwo+ID4+IHRyYWNl
IHN0YXJ0L3N0b3AgdGhyb3VnaCBzeXNmcy4gSWYgdGhpcyBpcyBhbiBvYnNvbGV0ZSBvciBub3Qg
cHJlZmVycmVkIGFwcHJvYWNoCj4gPj4gdGhlbiB3ZSB3aWxsIGRlcHJpb3JpdGl6ZSBhbmQgcG9z
c2libHkgbmV2ZXIgYWRkIGl0Lgo+ID4KPiA+IFdoeSBpcyB0aGF0IG5lZWRlZCBmb3IgY29yZXNp
Z2h0IGFuZCBvdGhlciBhcmNoZXMgZG8gbm90IG5lZWQgaXQ/Cj4gPiBQZXJoYXBzIGl0IHNob3Vs
ZCBiZSBkZWxldGVkIGZyb20gdGhhdCBjb2RlYmFzZSBpbnN0ZWFkPwo+ID4KPiA+IHRoYW5rcywK
PiA+Cj4gPiBncmVnIGstaAo+Cj4gSGkgR3JlZywKPgo+IHN5c2ZzIGlzIGhlbHBmdWwgZm9yIGNv
bnRyb2xsaW5nIHRoZSB0cmFjZSBpZiBub3QgdXRpbGl6ZWQgdGhyb3VnaCBwZXJmCj4gZnJhbWV3
b3JrLiBJdCBjYW4gYWxzbyBiZSB1c2VkIGJ5IHVzZXJzcGFjZSB0byBkaXNjb3ZlciB0aGUgdG9w
b2xvZ3kgb2YKPiB0cmFjZSBjb21wb25lbnRzIGFuZCB0aGVpciBjYXBhYmlsaXRpZXMuIEBBbnVw
IEkgYXNzdW1lIHRoaXMgZHJpdmVyIGlzCj4gZGVzaWduZWQgd2l0aCBvdGhlciBzaW5rcyBpbiBt
aW5kIChub3QganVzdCByYW1zaW5rKSwgc28gaXQgY2FuIGJlIHVzZWQKPiB0byBlbWl0IHRyYWNl
IHRvIGV4dGVybmFsIHByb2JlcywgcmlnaHQ/Cj4KClRoZSBydnRyYWNlIGRyaXZlciBmcmFtZXdv
cmsgaXMgaW50ZW5kZWQgdG8gc3VwcG9ydCBhbGwgdHlwZXMgb2YgdHJhY2UKY29tcG9uZW50cyBh
bmQgYW55IHRvcG9sb2d5IGJldHdlZW4gdGhlc2UgY29tcG9uZW50cy4gVGhlIGN1cnJlbnQKcGF0
Y2hzZXQgb25seSBhZGRzIGVuY29kZXIgYW5kIHJhbXNpbmsgdHJhY2UgY29tcG9uZW50IGRyaXZl
cnMgc2luY2UKdGhhdCBpcyB3aGF0IHdlIGVtdWxhdGUgaW4gUUVNVSByaWdodCBub3cuCgpSZWdh
cmRpbmcgc3lzZnMgYmFzZWQgdHJhY2luZywgdGhlIG1haW4gdXNlLWNhc2UgKGxpa2UgeW91IG1l
bnRpb25lZCkKaXMgdGhlIGVuYWJsaW5nIHRyYWNpbmcgd2hlbiB0aGUgc2lua3MgYXJlIGV4dGVy
bmFsIGRldmljZXMgd2hpY2ggY2FwdHVyZQphbmQgc3RvcmUgdHJhY2UgZGF0YSBzb21ld2hlcmUg
b3V0c2lkZS4gVGhlIHBlcmYgYmFzZWQgdHJhY2luZyBpcyB1c2VkCmZvciBob3N0ZWQgdHJhY2lu
ZyB3aGVyZSB0aGUgcmFtc2luayBzdG9yZXMgdHJhY2UgZGF0YSBpbiByYW0gYW5kIHBlcmYKdG9v
bCBjYXB0dXJlcyBpdCBpbiB0aGUgZm9ybSBvZiBwZXJmIGRhdGEuCgpSZWdhcmRzLApBbnVwCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
