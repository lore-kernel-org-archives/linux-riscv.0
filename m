Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0423EC001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn3QVgWLOKms6PYVdX+GUEnRzNWSxT2EPHTQzUyt8Yk=; b=zeN3hprpmr2HkH
	afFhKNQClFqSvhevm1MyGR4NcBD/A6bK8q03qmFTW5pvgxtkJO+IatxMe8XY+KhlMNNBkIg9I1E56
	dBz8W4wYH+pXTB3iTdEby55dZ/32iXt5fGeCifiioS8KJjA+NfPfzL+bD+52LoailcgC8RHYhpduZ
	8+TYG6LqmsdnsuKqGh+NEUs1P0XkOiKKAEiaIj7WkM8otw/HTWcS8BShUbuPZD2IqBLHkYYCk9+as
	8vyxCADhzdyGZ6N1drPyUjmcHRS9xF56I+eU0Ywz8xDnpGyyu9e/LYABGjcjiUQx9DMV7dB+3tKA4
	ErthtXfZtaQKD0PjAQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLBFL-00Gnz5-0r;
	Sun, 16 Jul 2023 23:33:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLBFH-00GnvV-1I
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 23:33:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B159660EEB
	for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 23:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22430C433BB
	for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689550419;
	bh=Ja9IYjqwNzmeISofK1hhZQkSnGHcbD0jYQgPpeuxanI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KPedHonJ+1xUSpZC+ZJSrhK2jIwbYYKVbiPMKpYSv4IL0MiL6siOsXnqw+/xzA7+q
	 lfvdor5Cbw2vewFsyp34mOQLyiQtZTC2tusnrYIhlc1EGfBd/+VxBh3fD67SMuNLso
	 pV8S+REUQIE5/NFGCVLMhr7hi0oSOGkNvw+eRDAwHYuu+cQ5hTV1aaTsjWeN8tE5na
	 PC2lUeWK6tLqdR5XvGETNXi56UsoXGWCsUoiTsh3GLekmJ/1nkcJIJt5yhpPZKGHjn
	 wWeaZJuNM5gJWC9ksjdpXZcc64tIX21zGaxmoEqcxpnF9N2zgZMwMl44QfnJ0l9tY9
	 RtrRsd8lABtWg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so8094946a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 16:33:39 -0700 (PDT)
X-Gm-Message-State: ABy/qLamQMYXqdmWDlGU/S/FGS0RtZuOOMP2D2ruUj9Vo07f1GaLotLC
	m/btOsrrCahiwh9gB+SYhsbuXjPhk0FcboSh59Q=
X-Google-Smtp-Source: APBJJlEcBvXJxvd+KrBJuk0Vi8K5mZ3tcQx3JefAFzqKUbu1AoQrNc3PHaoeV7oErHoCHJMGuTnhuYfeFD4/gBGxpk0=
X-Received: by 2002:a05:6402:524e:b0:51d:cf7b:c9f0 with SMTP id
 t14-20020a056402524e00b0051dcf7bc9f0mr11056350edd.12.1689550417039; Sun, 16
 Jul 2023 16:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230702025708.784106-1-guoren@kernel.org> <20230704164003.GB83892@hirez.programming.kicks-ass.net>
 <CAJF2gTTc0Gyo=K-0dCW6wu7q=Wq34hgTB69qJ7VSF_KAgKhavA@mail.gmail.com> <20230710080152.GA3028865@hirez.programming.kicks-ass.net>
In-Reply-To: <20230710080152.GA3028865@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Jul 2023 07:33:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTt23iSDG_m4ihPhXhYDrz3Xnih=KGLx_ayBLbzPqaTaQ@mail.gmail.com>
Message-ID: <CAJF2gTTt23iSDG_m4ihPhXhYDrz3Xnih=KGLx_ayBLbzPqaTaQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com, 
	bjorn@kernel.org, palmer@dabbelt.com, bjorn@rivosinc.com, 
	daniel.thompson@linaro.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_163343_628625_9BE086B0 
X-CRM114-Status: GOOD (  28.82  )
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

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgNDowMuKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1bCAwOSwgMjAyMyBhdCAxMDozMDoy
MkFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgNSwgMjAyMyBhdCAxMjo0
MOKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IE9uIFNhdCwgSnVsIDAxLCAyMDIzIGF0IDEwOjU3OjA3UE0gLTA0MDAsIGd1b3JlbkBr
ZXJuZWwub3JnIHdyb3RlOgo+ID4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGli
YWJhLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFRoZSBpcnFlbnRyeV9ubWlfZW50ZXIvZXhpdCB3b3Vs
ZCBmb3JjZSB0aGUgY3VycmVudCBjb250ZXh0IGludG8gaW5faW50ZXJydXB0Lgo+ID4gPiA+IFRo
YXQgd291bGQgdHJpZ2dlciB0aGUga2VybmVsIHRvIGRlYWQgcGFuaWMsIGJ1dCB0aGUga2RiIHN0
aWxsIG5lZWRzICJlYnJlYWsiIHRvCj4gPiA+ID4gZGVidWcgdGhlIGtlcm5lbC4KPiA+ID4gPgo+
ID4gPiA+IE1vdmUgaXJxZW50cnlfbm1pX2VudGVyL2V4aXQgdG8gZXhjZXB0aW9uX2VudGVyL2V4
aXQgY291bGQgY29ycmVjdCBoYW5kbGVfYnJlYWsKPiA+ID4gPiBvZiB0aGUga2VybmVsIHNpZGUu
Cj4gPiA+Cj4gPiA+IFRoaXMgZG9lc24ndCBleHBsYWluIG11Y2ggaWYgYW55dGhpbmcgOi8KPiA+
ID4KPiA+ID4gSSdtIGNvbmZ1c2VkIChwcm9iYWJseSBiZWNhdXNlIEkgZG9uJ3Qga25vdyBSSVND
LVYgdmVyeSB3ZWxsKSwgd2hhdCdzCj4gPiA+IEVCUkVBSyBhbmQgaG93IGRvZXMgaXQgaGFwcGVu
Pwo+ID4gRUJSRUFLIGlzIGp1c3QgYW4gaW5zdHJ1Y3Rpb24gb2YgcmlzY3Ygd2hpY2ggd291bGQg
cmlzZSBicmVha3BvaW50IGV4Y2VwdGlvbi4KPiA+Cj4gPgo+ID4gPgo+ID4gPiBTcGVjaWZpY2Fs
bHksIGlmIEVCUkVBSyBjYW4gaGFwcGVuIGluc2lkZSBhbiBsb2NhbF9pcnFfZGlzYWJsZSgpIHJl
Z2lvbiwKPiA+ID4gdGhlbiB0aGUgYmVsb3cgY2hhbmdlIGlzIGFjdGl2ZWx5IHdyb25nLiBBbnkg
ZXhjZXB0aW9uL2ludGVycnVwdCB0aGF0Cj4gPiA+IGNhbiBoYXBwZW4gd2hpbGUgbG9jYWxfaXJx
X2Rpc2FibGUoKSBtdXN0IGJlIHRyZWF0ZWQgbGlrZSBhbiBOTUkuCj4gPiBXaGVuIHRoZSBlYnJl
YWsgaGFwcGVuZCBvdXQgb2YgbG9jYWxfaXJxX2Rpc2FibGUgcmVnaW9uLCBidXQKPiA+IF9fbm1p
X2VudGVyIGZvcmNlcyBoYW5kbGVfYnJlYWsoKSBpbnRvIGluX2ludGVydXB0KCkgc3RhdGUuIFNv
IGhvdwo+Cj4gQW5kIHdoeSBpcyB0aGF0IGEgcHJvYmxlbT8gSSB0aGluayBJJ20gbWlzc2luZyBz
b21ldGhpbmcgZnVuZGFtZW50YWwKPiBoZXJlLi4uClRoZSBpcnFlbnRyeV9ubWlfZW50ZXIoKSB3
b3VsZCBmb3JjZSB0aGUgY3VycmVudCBjb250ZXh0IHRvIGdldAppbl9pbnRlcnJ1cHQ9dHJ1ZSwg
YWx0aG91Z2ggZWJyZWFrIGhhcHBlbnMgaW4gdGhlIGNvbnRleHQgd2hpY2ggaXMKaW5faW50ZXJy
dXB0PWZhbHNlLgpBIGxvdCBvZiBjaGVja2luZyBjb2Rlcywgc3VjaCBhczoKICAgICAgICBpZiAo
aW5faW50ZXJydXB0KCkpCiAgICAgICAgICAgICAgICBwYW5pYygiRmF0YWwgZXhjZXB0aW9uIGlu
IGludGVycnVwdCIpOwpJdCB3b3VsZCBtYWtlIHRoZSBrZXJuZWwgcGFuaWMsIGJ1dCB3ZSBkb24n
dCBwYW5pYzsgd2Ugd2FudCBiYWNrIHRvIHRoZSBzaGVsbC4KZWc6CmVjaG8gQlVHID4gL3N5cy9r
ZXJuZWwvZGVidWcvcHJvdm9rZS1jcmFzaC9ESVJFQ1QKCj4KPiA+IGFib3V0Ogo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+ID4gaW5kZXggZjkxMGRmY2NiZjVkLi42OWY3MDQzYTk4YjkgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4gPiBAQCAtMTgsNiArMTgsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9pcnEu
aD4KPiA+ICAjaW5jbHVkZSA8bGludXgva2V4ZWMuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvZW50
cnktY29tbW9uLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2NvbnRleHRfdHJhY2tpbmcuaD4KPiA+
Cj4gPiAgI2luY2x1ZGUgPGFzbS9hc20tcHJvdG90eXBlcy5oPgo+ID4gICNpbmNsdWRlIDxhc20v
YnVnLmg+Cj4gPiBAQCAtMjg1LDEyICsyODYsMTggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190
cmFwX3NlY3Rpb24gdm9pZAo+ID4gZG9fdHJhcF9icmVhayhzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiA+ICAgICAgICAgICAgICAgICBoYW5kbGVfYnJlYWsocmVncyk7Cj4gPgo+ID4gICAgICAgICAg
ICAgICAgIGlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4gLSAgICAgICB9IGVs
c2Ugewo+ID4gKyAgICAgICB9IGVsc2UgaWYgKGluX2ludGVycnVwdCgpKXsKPiA+ICAgICAgICAg
ICAgICAgICBpcnFlbnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3Mp
Owo+ID4KPiA+ICAgICAgICAgICAgICAgICBoYW5kbGVfYnJlYWsocmVncyk7Cj4gPgo+ID4gICAg
ICAgICAgICAgICAgIGlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKPiA+ICsgICAgICAg
fSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICBlbnVtIGN0eF9zdGF0ZSBwcmV2X3N0YXRlID0g
ZXhjZXB0aW9uX2VudGVyKCk7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgaGFuZGxlX2JyZWFr
KHJlZ3MpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGV4Y2VwdGlvbl9leGl0KHByZXZfc3Rh
dGUpOwo+ID4gICAgICAgICB9Cj4gPiAgfQo+Cj4gVGhhdCdzIHdyb25nLiBJZiB5b3Ugd2FudCB0
byBtYWtlIGl0IGNvbmRpdGlvbmFsLCB5b3UgaGF2ZSB0byBsb29rIGF0Cj4gIShyZWdzLT5zdGF0
dXMgJiBTUl9JRSkgKHRoYXQncyB0aGUgaW50ZXJydXB0IGVuYWJsZSBmbGFnIG9mIHRoZQo+IGlu
dGVycnVwdGVkIGNvbnRleHQsIHJpZ2h0PykKPgo+IFdoZW4geW91IGhpdCBhbiBFQlJFQUsgd2hl
biBJUlFzIHdlcmUgZGlzYWJsZWQsIHlvdSBtdXN0IGJlIE5NSSBsaWtlLgo+Cj4gQnV0IG1ha2lu
ZyBpdCBjb25kaXRpb25hbCBsaWtlIHRoaXMgbWFrZXMgaXQgcmVhbGx5IGhhcmQgdG8gd3JpdGUg
YQo+IGhhbmRsZXIgdGhvdWdoLCBpdCBiYXNpY2FsbHkgbXVzdCBhc3N1bWUgaXQgd2lsbCBiZSBO
TUkgY29udGV0eCAoYmVjYXVzZQo+IGl0IGNhbid0IGtub3cpIHNvIHRoZXJlIGlzIG5vIHBvaW50
IGluIHNvbWV0aW1lcyBub3QgZG9pbmcgTk1JIGNvbnRleHQuCgoKCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
