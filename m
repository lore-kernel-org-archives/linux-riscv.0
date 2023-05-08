Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C73BC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyfmK3i54uuWqopdKqJUk8OO8k80QG7levPmov7MT1A=; b=Km6WuMDmEnT1X5
	aDmxQbMdjMXtWJlBKxBKy8rkxmpqmIqViqWtBHHxTEdi8reUemE0vjLfLu04SwGhBzcAsYYDpyXT6
	nZCjfWzWFTsJprezOfM2dKNgSKMFdat2hcl+q6UOA7uoDI5nD/GOtXR2dkJLsCKxOyTvQN3md2j9g
	S342V5EiYp01Ao4PxtnMZVdEyFGTS8CZLe+ZG2NNdi/s/0QYTs+PEo7FD3rV6zBZzn0CNRNVPUFyH
	3ntYsh/AoHGxhHEUw/IyLZYpHRi/xYvizVO4rli+7HPX1oKeRSq03dt9MX5Ad+fw5AC366771epkk
	KzVJtBUbFwPj+OS+zssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvucM-00HQTV-2r;
	Mon, 08 May 2023 06:45:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvucK-00HQT7-13
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 06:45:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A823B61F1D
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE3AC4339B
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683528303;
	bh=m8GDQ3lj2VoX4uT5SVvsnUBZPPWNAPSFAP/Ayn8Wa8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=reRRpdeLIqh3OE6Wn1twO01SWGFWqLxxXh9SOECEQkmBOQwJ3mBjQUNMJSyqfhGLd
	 HvPCB6X6NZwHK2r433Mb2g2kQ/CWUo5aKfCKApPm7xyi5OngqZP9P9Y9O8+CO08a6r
	 V/CI1ak3tz5V1zxBl/VyTQGFoZ6HSVUbSCu4PruzZCwGUejVnbOD1kc/8M+ttd6hya
	 dE3p4Kq5Q7PffxDTgFLCKxllecLXW4Nj5lbQxfjzrCSbmNYwhgPcbSbJhu+QP0W+NL
	 90gdhLq4+pXEPBSs3UjYTQ4SRl/5w8mSZmFMUkgMfkfEbWnL7Q09fuA9xZhJMIrl3h
	 dEF4keqARZYsw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so6262570a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 23:45:02 -0700 (PDT)
X-Gm-Message-State: AC+VfDzkVSVEdb3Nk7Etv7W6mSJwE2QN1XNH85C3+vNYjbY5GV9pnBIy
	i2D69SnOXek052FmVKsH957AhLCO6HRI0RJ3Nfw=
X-Google-Smtp-Source: ACHHUZ6p6EHRNlgbwdsEHTSCOgGAB23tncTB+hleogWY+lD5xWNMjmI/yeUBXIqUuQ7scMtAuRcHbIJQys4BYKvSLZQ=
X-Received: by 2002:a17:906:7303:b0:965:6d21:48bc with SMTP id
 di3-20020a170906730300b009656d2148bcmr8674957ejc.75.1683528301305; Sun, 07
 May 2023 23:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org> <20230507182304.2934-5-jszhang@kernel.org>
In-Reply-To: <20230507182304.2934-5-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 May 2023 14:44:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+p=GLH985Ce-_gCP23N0CN2yEp3C=-+05cUo05R+YHQ@mail.gmail.com>
Message-ID: <CAJF2gTQ+p=GLH985Ce-_gCP23N0CN2yEp3C=-+05cUo05R+YHQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv: dts: thead: add sipeed Lichee Pi 4A board
 device tree
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_234504_475479_687BC485 
X-CRM114-Status: GOOD (  19.35  )
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAyOjM04oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFNpcGVlZCdzIExpY2hlZSBQaSA0QSBkZXZlbG9wbWVudCBi
b2FyZCB1c2VzIExpY2hlZSBNb2R1bGUgNEEgY29yZQo+IG1vZHVsZSB3aGljaCBpcyBwb3dlcmVk
IGJ5IFQtSEVBRCdzIGxpZ2h0KGEuay5hIFRIMTUyMCkgU29DLiBBZGQKTm8gbGlnaHQsIGp1c3Qg
dGgxNTIwLgoKPiBtaW5pbWFsIGRldmljZSB0cmVlIGZpbGVzIGZvciB0aGUgY29yZSBtb2R1bGUg
YW5kIHRoZSBkZXZlbG9wbWVudAo+IGJvYXJkLgo+Cj4gU3VwcG9ydCBiYXNpYyB1YXJ0L2dwaW8v
ZG1hYyBkcml2ZXJzLCBzbyBzdXBwb3J0cyBib290aW5nIHRvIGEgYmFzaWMKPiBzaGVsbC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgIDEgKwo+
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL01ha2VmaWxlICAgICAgICAgICAgfCAgMiArCj4g
IC4uLi9kdHMvdGhlYWQvbGlnaHQtbGljaGVlLW1vZHVsZS00YS5kdHNpICAgICB8IDM4ICsrKysr
KysrKysrKysrKysrKysKPiAgLi4uL2Jvb3QvZHRzL3RoZWFkL2xpZ2h0LWxpY2hlZS1waS00YS5k
dHMgICAgIHwgMzIgKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDczIGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQv
TWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQv
bGlnaHQtbGljaGVlLW1vZHVsZS00YS5kdHNpCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3RoZWFkL2xpZ2h0LWxpY2hlZS1waS00YS5kdHMKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290L2R0cy9NYWtl
ZmlsZQo+IGluZGV4IGYwZDlmODkwNTRmOC4uMWU4ODQ4NjhjY2JhIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01h
a2VmaWxlCj4gQEAgLTIsNiArMiw3IEBACj4gIHN1YmRpci15ICs9IGFsbHdpbm5lcgo+ICBzdWJk
aXIteSArPSBzaWZpdmUKPiAgc3ViZGlyLXkgKz0gc3RhcmZpdmUKPiArc3ViZGlyLXkgKz0gdGhl
YWQKPiAgc3ViZGlyLXkgKz0gY2FuYWFuCj4gIHN1YmRpci15ICs9IG1pY3JvY2hpcAo+ICBzdWJk
aXIteSArPSByZW5lc2FzCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQv
TWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL01ha2VmaWxlCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjllMDBhY2M3MTRjYwo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL01ha2VmaWxlCj4gQEAgLTAs
MCArMSwyIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArZHRiLSQo
Q09ORklHX0FSQ0hfVEhFQUQpICs9IGxpZ2h0LWxpY2hlZS1waS00YS5kdGIKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC9saWdodC1saWNoZWUtbW9kdWxlLTRhLmR0c2kg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL2xpZ2h0LWxpY2hlZS1tb2R1bGUtNGEuZHRzaQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yNGM5OTcxZTBmYjUK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC9saWdodC1s
aWNoZWUtbW9kdWxlLTRhLmR0c2kKPiBAQCAtMCwwICsxLDM4IEBACj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNo
ZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gKyAqLwo+ICsKPiArL2R0cy12MS87Cj4g
Kwo+ICsjaW5jbHVkZSAibGlnaHQuZHRzaSIKPiArCj4gKy8gewo+ICsgICAgICAgbW9kZWwgPSAi
U2lwZWVkIExpY2hlZSBNb2R1bGUgNEEiOwo+ICsgICAgICAgY29tcGF0aWJsZSA9ICJzaXBlZWQs
bGljaGVlLW1vZHVsZS00YSIsICJ0aGVhZCxsaWdodCI7Cm5vIGxpZ2h0LCB0aDE1MjAKPiArCj4g
KyAgICAgICBtZW1vcnlAMCB7Cj4gKyAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9y
eSI7Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgwMDAwMDAwMCAweDIgMHgwMDAwMDAw
MD47Cj4gKyAgICAgICB9Owo+ICt9Owo+ICsKPiArJm9zYyB7Cj4gKyAgICAgICBjbG9jay1mcmVx
dWVuY3kgPSA8MjQwMDAwMDA+Owo+ICt9Owo+ICsKPiArJm9zY18zMmsgewo+ICsgICAgICAgY2xv
Y2stZnJlcXVlbmN5ID0gPDMyNzY4PjsKPiArfTsKPiArCj4gKyZhcGJfY2xrIHsKPiArICAgICAg
IGNsb2NrLWZyZXF1ZW5jeSA9IDw2MjUwMDAwMD47Cj4gK307Cj4gKwo+ICsmdWFydF9zY2xrIHsK
PiArICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+ICt9Owo+ICsKPiArJmRt
YWMwIHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9ib290L2R0cy90aGVhZC9saWdodC1saWNoZWUtcGktNGEuZHRzIGIvYXJjaC9yaXNj
di9ib290L2R0cy90aGVhZC9saWdodC1saWNoZWUtcGktNGEuZHRzCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjRmMGJhMjE0OWQyZAo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL2xpZ2h0LWxpY2hlZS1waS00YS5kdHMK
PiBAQCAtMCwwICsxLDMyIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtl
cm5lbC5vcmc+Cj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgImxpZ2h0LWxpY2hlZS1tb2R1bGUtNGEu
ZHRzaSIKPiArCj4gKy8gewo+ICsgICAgICAgbW9kZWwgPSAiU2lwZWVkIExpY2hlZSBQaSA0QSI7
Cj4gKyAgICAgICBjb21wYXRpYmxlID0gInNpcGVlZCxsaWNoZWUtcGktNGEiLCAic2lwZWVkLGxp
Y2hlZS1tb2R1bGUtNGEiLCAidGhlYWQsbGlnaHQiOwpubyBsaWdodCwgdGgxNTIwCj4gKwo+ICsg
ICAgICAgYWxpYXNlcyB7Cj4gKyAgICAgICAgICAgICAgIGdwaW8wID0gJmdwaW8wOwo+ICsgICAg
ICAgICAgICAgICBncGlvMSA9ICZncGlvMTsKPiArICAgICAgICAgICAgICAgZ3BpbzIgPSAmZ3Bp
bzI7Cj4gKyAgICAgICAgICAgICAgIGdwaW8zID0gJmdwaW8zOwo+ICsgICAgICAgICAgICAgICBz
ZXJpYWwwID0gJnVhcnQwOwo+ICsgICAgICAgICAgICAgICBzZXJpYWwxID0gJnVhcnQxOwo+ICsg
ICAgICAgICAgICAgICBzZXJpYWwyID0gJnVhcnQyOwo+ICsgICAgICAgICAgICAgICBzZXJpYWwz
ID0gJnVhcnQzOwo+ICsgICAgICAgICAgICAgICBzZXJpYWw0ID0gJnVhcnQ0Owo+ICsgICAgICAg
ICAgICAgICBzZXJpYWw1ID0gJnVhcnQ1Owo+ICsgICAgICAgfTsKPiArCj4gKyAgICAgICBjaG9z
ZW4gewo+ICsgICAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsK
PiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsmdWFydDAgewo+ICsgICAgICAgc3RhdHVzID0gIm9r
YXkiOwo+ICt9Owo+IC0tCj4gMi40MC4wCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
