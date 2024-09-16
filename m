Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B456C3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oRe3lYcc0MNjxIDINHuhIs2TxevhoV2baneWbBkSU8=; b=GJPB2jplBycBdo
	epyfA7/VQ22UMYzp3++GvUuvm2Kz6g92W2dUrrxZXgVaT/WNd3Vy0EQpijHMRS9fB9BBB6Ek0UEwK
	dIbJ4s6JKHhS1zTl4eaSAvzDjYVX2D1oEuh6lk1LO2jFQszWG3Y+J4aveE+c1qrjcPdrHQ1Kl92PB
	ncqU0uFo9VnMALbcwTjqScx3025ZGmehiLPIaRt3c2WKjZ2BaH+W63ghbJlt9KqbF1QIEbFYicYFY
	oJnoXEQkOiAqerv20slWNsbTp6wlT8cKZlSoWEzI4OdVIA3FzxoPGGeSid80FT1gsCBlFeMos0RIu
	lJ7K8dsPVv29dxwbOf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqCZI-00000004CCL-0Eg6;
	Mon, 16 Sep 2024 14:19:08 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqCZE-00000004CBx-19Zc
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 14:19:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-718e285544fso2592820b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726496343; x=1727101143; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1UmXOgsWH3fdiCHw5DCGNn13IW8Bhm9lnRCetGbtc8=;
        b=QY65UPyyNUxAE60BRBZED752YUWZ0MQ2Xx0+KOZtU7bk9do/RTf2UQycubsRCP8xET
         euPJpSHfm81oUmrKX9jK4BKXeB4/QT0ANDdT1+GnlAxnrlSo4LE9so1aAy/uhChLrhYf
         gqlum86jOe7IkxWa5/D3G21E4wmaiEAN97PIMgAu7ofk/9RvOAj8VFL3lvXGtHuptPxm
         F7wQvKmeW4HIZxj/vQ5fg5P3YVSC5WImXVGQNDFrw5PmOxsGMO0lmG8DcPmC/sWPbd68
         BQoOD88ZrkUP0nKtVHW/Mu68DO6pTXLo5JL6pTzEQhivQqCKJHkFfPAVEk7yNl7auq9H
         VnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726496343; x=1727101143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1UmXOgsWH3fdiCHw5DCGNn13IW8Bhm9lnRCetGbtc8=;
        b=KUHGWBsbi733P7NJ/kjH9W4xr9l5p6Bez7fjqom3bhpu2+lBWSNbE+vfNrL0eyLkUx
         Xce9dYIrcIedZPDTeiV9uWRzJaTBIOqjRFRQXz6htyvSeZuzIbSqT7SpRHYL9G20CLo5
         Pi+sNE8Y1y9n/UiU9mzaVQO1WievAboS3rR/GnGafdwJpirqr1SHfv+XE7GmV/9469uO
         PJ1WVy3Me6O4ism61l62noRU77dDWoCUGIzptp2bGlb6jqQxtDcJ+TxbYVFYbk4yjgOu
         nqi20GHlWKdsMFFEyytHUDeMY1E+VsNJwO6b9b+GjRI5N9XXql1igo1hXFG3S0gLrdOZ
         7LgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvF0+zFFyRx/CavzQE8pApAh4oQtvOxulIv4yrdgkBHGoHwbHXYZ2AtJGQAdQ0H+l4zBOP7uuSL3/a3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDkDgRowqwY3/SgvtKvQ2NIl+xajEKrwCucae95dnI627jVzqs
	7FDV+4Nha05VNXl8MGxwp/k8eTDLKou6BUrKKWqaNfUi3PlhxU/7Nj1Jh1j3MYhzafrwFSYJRGu
	EThLBqWaKT0N7iqPxTO3pTodmtitXDOd8
X-Google-Smtp-Source: AGHT+IFYCVh4ja8kmnu32Sq8veW94hYo66DZbsZuYwwlDt/F+10yGHRXvBJzhVGd0HcyK1y8/b8Pz+qY2eHEL8EuSBg=
X-Received: by 2002:a05:6a20:d806:b0:1cf:440a:d449 with SMTP id
 adf61e73a8af0-1d112ead762mr15155093637.42.1726496343265; Mon, 16 Sep 2024
 07:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <7ede7ca6-f8db-4b38-a1cc-8be3d0db7fae@gmail.com> <20240916024536-GYA2058951@gentoo>
In-Reply-To: <20240916024536-GYA2058951@gentoo>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 16 Sep 2024 10:18:27 -0400
Message-ID: <CAJFTR8QEwoJDANTgGOyMxX4d539ZjHUU2nzf-sB=Gu5bsHBfyQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to
 uart0 in BPI-F3
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_071904_355448_B5D72096 
X-CRM114-Status: GOOD (  30.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Meng Zhang <kevin.z.m@hotmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBTZXAgMTUsIDIwMjQgYXQgMTA6NDXigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBKZXNzZQo+Cj4gT24gMTA6NDUgU3VuIDE1IFNlcCAgICAgLCBK
ZXNzZSBUYXViZSB3cm90ZToKPiA+Cj4gPiBCZWZvcmUgcGluY3RybCBkcml2ZXIgaW1wbGVtZW50
ZWQsIHRoZSB1YXJ0MCBjb250cm9sbGVyIHJlcGx5IG9uCj4gPiBib290bG9hZGVyIGZvciBzZXR0
aW5nIGNvcnJlY3QgcGluIG11eCBhbmQgY29uZmlndXJhdGlvbnMuCj4gPgo+ID4gTm93LCBsZXQn
cyBhZGQgcGluY3RybCBwcm9wZXJ0eSB0byB1YXJ0MCBvZiBCYW5hbmFwaS1GMyBib2FyZC4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KPiA+IC0tLQo+
ID4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyB8ICAz
ICsrKwo+ID4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaSAg
ICB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazEuZHRzaSAgICAgICAgICAgIHwgIDUgKysrKysKPiA+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gPiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gPiBpbmRleCAwMjMyNzQxODliNDkyLi5iYzg4
ZDRkZTI1YTYyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS1iYW5hbmFwaS1mMy5kdHMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtYmFuYW5hcGktZjMuZHRzCj4gPiBAQCAtNCw2ICs0LDcgQEAKPiA+ICAgICovCj4gPgo+ID4g
ICAjaW5jbHVkZSAiazEuZHRzaSIKPiA+ICsjaW5jbHVkZSAiazEtcGluY3RybC5kdHNpIgo+ID4K
PiA+ICAgLyB7Cj4gPiAgICAgICBtb2RlbCA9ICJCYW5hbmEgUGkgQlBJLUYzIjsKPiA+IEBAIC0x
NSw1ICsxNiw3IEBAIGNob3NlbiB7Cj4gPiAgIH07Cj4gPgo+ID4gICAmdWFydDAgewo+ID4gKyAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+ICsgICAgIHBpbmN0cmwtMCA9IDwmdWFy
dDBfMl9jZmc+Owo+ID4gICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gICB9Owo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4gPiBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYThlYWM1NTE3Zjg1Nwo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1w
aW5jdHJsLmR0c2kKPiA+IEBAIC0wLDAgKzEsMjAgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCBPUiBNSVQKPiA+ICsvKgo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAy
NCBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+Cj4gPiArCj4gPiArI2RlZmluZSBLMV9QQURDT05G
KHBpbiwgZnVuYykgKCgocGluKSA8PCAxNikgfCAoZnVuYykpCj4gPgo+ID4gSXQgd291bGQgYmUg
bmljZSB0byBoYXZlIGEgcGluZnVuYyBoZWFkZXIgbGlrZQo+ID4gYXJjaC9hcm0vYm9vdC9kdHMv
bnhwL2lteC9pbXg3dWxwLXBpbmZ1bmMuaC4KPiA+IEl0IHdvdWxkIHJlZmVyZW5jZSBhbmQgZW5j
b2RlIHRoZSBkYXRhIG9mICIzLjIgUGluIE11bHRpcGxleCIgaW4KPiA+IGh0dHBzOi8vZGV2ZWxv
cGVyLnNwYWNlbWl0LmNvbS9kb2N1bWVudGF0aW9uP3Rva2VuPUFuMXZ3VHdLYWlnYVhSa1lmd21j
em5UWG5lZAo+ID4gLCB0aGUgZG9jdW1lbnQgeW91IGF0dGFjaGVkIGluIHRoZSBzdW1tYXJ5Lgo+
IE5vdCBzdXJlIGlmIGl0J3Mgd29ydGggdGhlIGVmZm9ydC4uCgpJIGNhbiBzZW5kIGEgZnV0dXJl
IHBhdGNoIGZvciB0aGlzLgoKPgo+IEkgZ2F2ZSB1cCBvZiBpbnRyb2R1Y2luZyBhbm90aGVyIG1h
Y3JvLCBhcyBpdCdzIGV4YWN0bHkgb25lIHRvIG9uZSBtYXBwaW5nIHRvCj4gR1BJTyBJRCwgd2hp
Y2ggbWVhbiBwaW4oeCkgLT4gR1BJT194Cj4KPiBtYXliZSBJIGNvdWxkIHB1dCBhIGNvbW1lbnQg
YXQgSzFfUEFEQ09ORigpIHRvIGRvY3VtZW50IHRoaXM/CgpJJ20gd2VhcnkgdGhlIE1hbnVhbCBt
YXkgbm90IGV4aXN0IG9uIHRoZSBzaXRlIGluIHRoZSBmdXR1cmUgb3IKd2lsbCBjaGFuZ2UgZm9y
bWF0cy4gQnV0IGl0IHdvdWxkIGJlIG5pY2Ugb3RoZXJ3aXNlLgoKPgo+IC8qIHBpbiBpcyBzYW1l
IHRvIHRoZSBHUElPIGlkIGFjY29yZGluZyB0byAzLjIgUGluIE11bHRpcGxleCBvZiBVc2VyIE1h
bnVhbCAqLwo+ICNkZWZpbmUgSzFfUEFEQ09ORihwaW4sIGZ1bmMpICgoKHBpbikgPDwgMTYpIHwg
KGZ1bmMpKQo+Cj4gZG9lcyB0aGlzIHNvdW5kIGdvb2QgdG8geW91PwoKU3VyZSwgYWRkIGl0LgoK
QWxzbyBzb3JyeSBmb3IgbWVzc2luZyB1cCB0aGUgcmVwbHktdG8gdGhpbmcgdGh1bmRlcmJpcmQg
aXMgY29uZnVzaW5nLgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPgo+ID4KPiA+IE90aGVyd2lzZSwK
PiA+IEFja2VkLWJ5OiBKZXNzZSBUYXViZSA8TXIuQm9zc21hbjA3NUBnbWFpbC5jb20+Cj4gPgo+
IHRoYW5rcwo+Cj4gPiArCj4gPiArJnBpbmN0cmwgewo+ID4gKyAgICAgdWFydDBfMl9jZmc6IHVh
cnQwLTItY2ZnIHsKPiA+ICsgICAgICAgICAgICAgdWFydDAtMi1waW5zIHsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBwaW5tdXggPSA8SzFfUEFEQ09ORig2OCwgMik+LAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxLMV9QQURDT05GKDY5LCAyKT47Cj4gPiArCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgYmlhcy1wdWxsLXVwID0gPDA+Owo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGRyaXZlLXN0cmVuZ3RoID0gPDMyPjsKPiA+ICsgICAgICAgICAgICAgfTsKPiA+ICsg
ICAgIH07Cj4gPiArfTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNl
bWl0L2sxLmR0c2kKPiA+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4g
PiBpbmRleCAwNzc3YmY5ZTAxMTgzLi5hMmQ1ZjdkNGE5NDJhIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKPiA+IEBAIC00MTYsNiArNDE2LDExIEBAIHVhcnQ5OiBz
ZXJpYWxAZDQwMTc4MDAgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7Cj4gPiAgICAgICAgICAgICAgIH07Cj4gPgo+ID4gKyAgICAgICAgICAgICBwaW5jdHJs
OiBwaW5jdHJsQGQ0MDFlMDAwIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gInNwYWNlbWl0LGsxLXBpbmN0cmwiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAgMHhkNDAxZTAwMCAweDAgMHg0MDA+Owo+ID4gKyAgICAgICAgICAgICB9Owo+ID4gKwo+
ID4gICAgICAgICAgICAgICBwbGljOiBpbnRlcnJ1cHQtY29udHJvbGxlckBlMDAwMDAwMCB7Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1wbGljIiwg
InNpZml2ZSxwbGljLTEuMC4wIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgw
IDB4ZTAwMDAwMDAgMHgwIDB4NDAwMDAwMD47Cj4gPgo+ID4gLS0KPiA+IDIuNDUuMgo+Cj4gLS0K
PiBZaXh1biBMYW4gKGRsYW4pCj4gR2VudG9vIExpbnV4IERldmVsb3Blcgo+IEdQRyBLZXkgSUQg
QUFCRUZENTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
