Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BECFC2BA18
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 02:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SseEh0a5Lm24j5pIPA2a7dsiSMiDfiM5H21+/ZQ5bJU=; b=xJhIRKv8ESyEpC
	3gR8kY0gv2BGzuhlqLGWUCq8Cru77EHGCNHP5kOdV2LF0MqKmRkZLo45ERjreaQmfyObS6MfMAB56
	6/2AzLco3/bnFiPcB/q6BQ0RwB1qVMtoDcN2m1O7MQv3HLF4q/ru6iWCQe0nDhxlQzDYc8uSR4pHD
	C90PmOAz6JJO2qQKRlgzQYgvC71dctncaFjf1gX45DE8J2felzEc/zp0PZpRM7lcMnft3N7TQZi1A
	fkX3SNQTU21SScQCwaoES7D2rorjBKxF44o6t9P6TRWkrTNosvi13DTpaAmWW7T1eOXrLbNuN38W+
	4yg/fOqHA5q6S2P7eGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKThz-00000007PMz-2Tex;
	Fri, 21 Jun 2024 02:08:59 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKThv-00000007PME-3NFL
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 02:08:57 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3d21b3da741so768525b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 19:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718935730; x=1719540530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKHVf5IAv5fN3fGfXBrQejN5prpjdEw0Fb3fapPXfKc=;
        b=TSXOaqBBWd7yM9VlfXMNgP+JxFQEQ3MIAYiSTokss1/nHPIREizxpzQTeXli+uN8yp
         c43BNizw9w6py1N2ajLW8kfLFFJ9ATedjGNPDD3IJi/UqJvhs0AeJchWuzligLYtAP4z
         uUf7pnRyn55X8+8EVzRwKGNgSPFi6BCjCqGW0HQTfdeXrVqtJQzMkPwlOiHAXj4JAhpY
         GfIZC4Gv8QH7OGcb5w/cgKIQD0sNHnNvXkwaIGbVkowhpKiqtY4hmM5NjmyAMA7mbauk
         hT5eiNOQfRrILLoyYEvcKR63XFnPoNfyeZPi9TgiHNhd4jUGe0D9LmSi3qvuU6raxS0U
         goDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718935730; x=1719540530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKHVf5IAv5fN3fGfXBrQejN5prpjdEw0Fb3fapPXfKc=;
        b=sA7OpCe8I6Nm6w9iws/N5oodoyotADc+9mm/d4CTEQQOsQgNO9P0ibMsn/5qWoxorF
         vzOU33s3pEgxrMTIdwaauxOhpgargQh/KOQ4NvW+X9yu/a3uau7XrWs714bY3MwT8OQ3
         id7BYTC4r0SHz3Py+R1aY+3zQ06bj8n/sOd6KYezysxQcayG2uymtZBJTAdlDj9i9vvs
         DpuPcd9zIflfoCM52WAFMTjMq4mJEbicCFR40u95uMfuRM1xRIPOvM2DrCDEKGX47Oxa
         BOO84G1qIuDc6pMBg4aN2Ajy0Ue0O0pJrxdbP33TKnJlKF2NRxOVBUJ6gULjC5ceKHIr
         mheA==
X-Forwarded-Encrypted: i=1; AJvYcCXQzjXekeUREOYBFHGZ702ySdBu56oHNrlqVJ3EgaqrROtBd6B7KLXNjnbqxnRX7hYLREqGqqcbOAZb1gwJ9Ky2WofyoESWdELNajxhYXQn
X-Gm-Message-State: AOJu0YzKgtVkGI3sru6ElI22yZ7T5Yb6lWRYsl4XUccs6VfmCaZj60oM
	QlPzJc/Bu+wQzdPXzVYWVFeRsMWn4vO5A8xhPYRieiFnKaEG/vBpiCWHDrQINlLBvJ6MzrB2mAW
	nTwuy56WTc+Tl465cp3Bq0y0tPaL8WDNotGk34A==
X-Google-Smtp-Source: AGHT+IECgLoaflkXNVtka+xSdqP8Qc/KUUW3ZAbjdmA8w+k2t80RcpIMkU5Juafrz2qc1WHhqvN0NCvxJ25udhahph0=
X-Received: by 2002:a05:6871:1cc:b0:24f:c241:4d16 with SMTP id
 586e51a60fabf-25c94db1ab3mr8430114fac.50.1718935730446; Thu, 20 Jun 2024
 19:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240618120842.15159-1-cuiyunhui@bytedance.com> <ZnTRbptoowL+1GOP@ghost>
In-Reply-To: <ZnTRbptoowL+1GOP@ghost>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 10:08:39 +0800
Message-ID: <CAEEQ3wnNZJviirqWCAG7mXsbynC+=Gq5q4jh6b4yamm8cnzMAw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: cmdline: Add support for 'memmap' parameter
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, dawei.li@shingroup.cn, jszhang@kernel.org, 
	namcao@linutronix.de, chenjiahao16@huawei.com, bjorn@rivosinc.com, 
	vishal.moola@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_190856_207779_023EB45F 
X-CRM114-Status: GOOD (  33.83  )
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

SGkgQ2hhcmxpZSwKCk9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDk6MDPigK9BTSBDaGFybGllIEpl
bmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDE4LCAy
MDI0IGF0IDA4OjA4OjQyUE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBJbXBsZW1lbnQg
c3VwcG9ydCBmb3IgcGFyc2luZyAnbWVtbWFwJyBrZXJuZWwgY29tbWFuZCBsaW5lIHBhcmFtZXRl
ci4KPiA+Cj4gPiBUaGlzIHBhdGNoIGNvdmVycyBwYXJzaW5nIG9mIHRoZSBmb2xsb3dpbmcgdHdv
IGZvcm1hdHMgZm9yICdtZW1tYXAnCj4gPiBwYXJhbWV0ZXIgdmFsdWVzOgo+ID4KPiA+IC0gbm5b
S01HXUBzc1tLTUddCj4gPiAtIG5uW0tNR10kc3NbS01HXQo+ID4KPiA+IChbS01HXSA9IEsgTSBv
ciBHIChraWxvLCBtZWdhLCBnaWdhKSkKPiA+Cj4gPiBUaGVzZSB0d28gYWxsb3dlZCBmb3JtYXRz
IGZvciBwYXJhbWV0ZXIgdmFsdWUgYXJlIGFscmVhZHkgZG9jdW1lbnRlZAo+ID4gaW4gZmlsZSBr
ZXJuZWwtcGFyYW1ldGVycy50eHQgaW4gRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZSBmb2xkZXIu
Cj4gPiBTb21lIGFyY2hpdGVjdHVyZXMgYWxyZWFkeSBzdXBwb3J0IHRoZW0sIGJ1dCBNaXBzIGRp
ZCBub3QgcHJpb3IgdG8KPgo+IENvcHktcGFzdGUgZnJvbSBhIE1pcHMgcGF0Y2g/IFNob3VsZCBz
YXkgcmlzY3YgOikKPgo+IEl0IGxvb2tzIGxpa2UgdGhpcyBjb2RlIGlzIGR1cGxpY2F0ZWQgZnJv
bSB4dGVuc2EgYW5kIGlzIGVmZmVjdGl2ZWx5IHRoZQo+IHNhbWUgYXMgbWlwcy4gQ2FuIHRoaXMg
Y29kZSBiZSBwbGFjZWQgaW4gYSBnZW5lcmljIGZpbGUgc28gdGhhdCB0aGUgY29kZQo+IGNhbiBi
ZSBzaGFyZWQgYmV0d2VlbiBtaXBzLCByaXNjdiwgYW5kIHh0ZW5zYSAtLSBtYXliZSBhIG5ldyBj
b25maWcgdGhhdAo+IGdldHMgc2VsZWN0ZWQgYnkgbWlwcy9yaXNjdi94dGVuc2E/CgpZZWFoLCB0
aGF0J3MgYWN0dWFsbHkgd2hhdCBJIHdhcyB0aGlua2luZy4gV2hpY2ggZ2VuZXJhbCBmaWxlIGRv
IHlvdQp0aGluayB3b3VsZCBiZSBtb3JlIHN1aXRhYmxlIHRvIHB1dCBpdCBpbj8KCj4gLSBDaGFy
bGllCj4KPiA+IHRoaXMgcGF0Y2guCj4gPgo+ID4gRXhjZXJwdCBmcm9tIERvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Ogo+ID4KPiA+IG1lbW1hcD1ubltLTUdd
QHNzW0tNR10KPiA+IFtLTkxdIEZvcmNlIHVzYWdlIG9mIGEgc3BlY2lmaWMgcmVnaW9uIG9mIG1l
bW9yeS4KPiA+IFJlZ2lvbiBvZiBtZW1vcnkgdG8gYmUgdXNlZCBpcyBmcm9tIHNzIHRvIHNzK25u
Lgo+ID4KPiA+IG1lbW1hcD1ubltLTUddJHNzW0tNR10KPiA+IE1hcmsgc3BlY2lmaWMgbWVtb3J5
IGFzIHJlc2VydmVkLgo+ID4gUmVnaW9uIG9mIG1lbW9yeSB0byBiZSByZXNlcnZlZCBpcyBmcm9t
IHNzIHRvIHNzK25uLgo+ID4gRXhhbXBsZTogRXhjbHVkZSBtZW1vcnkgZnJvbSAweDE4NjkwMDAw
LTB4MTg2OWZmZmYKPiA+IG1lbW1hcD02NEskMHgxODY5MDAwMAo+ID4gb3IKPiA+IG1lbW1hcD0w
eDEwMDAwJDB4MTg2OTAwMDAKPiA+Cj4gPiBUaGVyZSBpcyBubyBuZWVkIHRvIHVwZGF0ZSB0aGlz
IGRvY3VtZW50YXRpb24gZmlsZSB3aXRoIHJlc3BlY3QgdG8KPiA+IHRoaXMgcGF0Y2guCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4g
PiAtLS0KPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDUwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jp
c2N2L21tL2luaXQuYwo+ID4gaW5kZXggZTM0MDVlNGI5OWFmLi43YmU3ZWMzMDkyYWQgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9p
bml0LmMKPiA+IEBAIC0yMDgsNiArMjA4LDU2IEBAIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X21l
bShjaGFyICpwKQo+ID4gIH0KPiA+ICBlYXJseV9wYXJhbSgibWVtIiwgZWFybHlfbWVtKTsKPiA+
Cj4gPiArc3RhdGljIHZvaWQgX19pbml0IHBhcnNlX21lbW1hcF9vbmUoY2hhciAqcCkKPiA+ICt7
Cj4gPiArICAgICBjaGFyICpvbGRwOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBzdGFydF9hdCwg
bWVtX3NpemU7Cj4gPiArCj4gPiArICAgICBpZiAoIXApCj4gPiArICAgICAgICAgICAgIHJldHVy
bjsKPiA+ICsKPiA+ICsgICAgIG9sZHAgPSBwOwo+ID4gKyAgICAgbWVtX3NpemUgPSBtZW1wYXJz
ZShwLCAmcCk7Cj4gPiArICAgICBpZiAocCA9PSBvbGRwKQo+ID4gKyAgICAgICAgICAgICByZXR1
cm47Cj4gPiArCj4gPiArICAgICBzd2l0Y2ggKCpwKSB7Cj4gPiArICAgICBjYXNlICdAJzoKPiA+
ICsgICAgICAgICAgICAgc3RhcnRfYXQgPSBtZW1wYXJzZShwICsgMSwgJnApOwo+ID4gKyAgICAg
ICAgICAgICBtZW1ibG9ja19hZGQoc3RhcnRfYXQsIG1lbV9zaXplKTsKPiA+ICsgICAgICAgICAg
ICAgYnJlYWs7Cj4gPiArCj4gPiArICAgICBjYXNlICckJzoKPiA+ICsgICAgICAgICAgICAgc3Rh
cnRfYXQgPSBtZW1wYXJzZShwICsgMSwgJnApOwo+ID4gKyAgICAgICAgICAgICBtZW1ibG9ja19y
ZXNlcnZlKHN0YXJ0X2F0LCBtZW1fc2l6ZSk7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4g
Kwo+ID4gKyAgICAgY2FzZSAwOgo+ID4gKyAgICAgICAgICAgICBtZW1ibG9ja19yZXNlcnZlKG1l
bV9zaXplLCAtbWVtX3NpemUpOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ICsKPiA+ICsg
ICAgIGRlZmF1bHQ6Cj4gPiArICAgICAgICAgICAgIHByX3dhcm4oIlVucmVjb2duaXplZCBtZW1t
YXAgc3ludGF4OiAlc1xuIiwgcCk7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAg
fQo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9tZW1tYXBfb3B0KGNo
YXIgKnN0cikKPiA+ICt7Cj4gPiArICAgICB3aGlsZSAoc3RyKSB7Cj4gPiArICAgICAgICAgICAg
IGNoYXIgKmsgPSBzdHJjaHIoc3RyLCAnLCcpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBpZiAo
aykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAqaysrID0gMDsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgcGFyc2VfbWVtbWFwX29uZShzdHIpOwo+ID4gKyAgICAgICAgICAgICBzdHIgPSBrOwo+
ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gK2Vhcmx5X3Bh
cmFtKCJtZW1tYXAiLCBwYXJzZV9tZW1tYXBfb3B0KTsKPiA+ICsKPiA+ICBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQo+ID4gIHsKPiA+ICAgICAgIHBoeXNfYWRkcl90IHZt
bGludXhfZW5kID0gX19wYV9zeW1ib2woJl9lbmQpOwo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPiA+
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
