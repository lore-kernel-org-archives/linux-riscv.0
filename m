Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93ABC19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piEfrMn4FkpmT+eZQoBUgSsYXdNGDUQs0actDyilCXA=; b=CHNzK2f9ved/Wg
	JrobNSNuqH1HXhW1K69XYGhwRi8QvPNmGux65vFBs40502G2J/D01usHwxVvoM+/ZRLlNjYpHsIcw
	Djsm1xtXrdixTqClu0TptsVXKbZDtW07F5ZLLwJnaXMVmWCw1mgVf8NcJEk4kcBfAj0NKL6KCWP9c
	lU8Xb95dkWrhRqmo3HMuN6bcO5yvfAAGqmAWZWHY8j2bpdoU9JIprkA1Pwbw4ELuXBASqbBuumTzK
	dlBYIpU/GmagmraKg9lcrOej1sSdbmtKGxkCaMUWQA7cqBVDKkgi9gkIZE3bNy8kWaSFCuM1/M+tR
	g4MC7AFVaXYoMwztap9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnviE-0000000AB6Q-1qH5;
	Fri, 28 Feb 2025 08:27:14 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvaP-0000000A9SY-1980
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 08:19:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso2485180a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2025 00:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740730747; x=1741335547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mNzmCKCn4datV8rE5qzgrGyKzfo222+OSdPHcKzM/s=;
        b=1vgZm8Syq/DwgzB67Z7ClLcx/G9dKUKkrM+4rNhVrum4es/f0+UdDMtv6BxCy48chn
         NgnfrpsANVtRCHeQSNoMdDXceGrJb5w7izt8ei8V/+EKDIbU1NrE8vY1cc6rDaMYzenZ
         5fuz8tW7hFQYQoFZYcwhrYEak76xsqgzaAIcDyC0pWHJCH4H8MTVTYJ0kIT46KmGIHgN
         HSzM/gsFGFBaCv2NWBJBkDxhRojH6LV6zURSoYMaj55zf8/zEgkR4Fn5C70EBh7pZEbj
         +G2KRwIzkvcNfKbb+z8khAWGPXn5PIaPyrkat3XH7fl4xKuGsu5WLFM71ePz1LPaXcX1
         pWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730747; x=1741335547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mNzmCKCn4datV8rE5qzgrGyKzfo222+OSdPHcKzM/s=;
        b=Mqi4W1IPRYu7XOQ2phhtjh9FDxdhs7XeCZpeHs3CFWSGsbLFMkRlA84RUp6Gh+FmsX
         LoXfyeSVs+AWsxXdfZBkrZaYbHywhVg1izuaD/QUwjtwFVcN9IBz46OLR51YTVWJ5r52
         u80LuUt2F6dhtZte8QTIbUpipssy6w9VIAUHXehk9yaXb7bF7fXApYfEdMWI6mj5O5YE
         EkWQ2fRBUQRIMkyQlNXTaZP/K7qGLEMYvrD8Q2vU72thWe3gzNkJDhkEpAe953z5LBvX
         T/Gf6WJtzaz66nW08aY5VQkoocuiCNqq79CEndltRVhp1d3W+6lfX5n7yUESlyeqm5iH
         zZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJapVPRPzJVF5Cq86r768rfn5JzzjBpGZpbKd0atS5gyoZhzoG+ZHrdx4YRygvabR4QK8IA+g+ITXOOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRXzlGf67DvCCSDvnevu/uJQQWXb/UUm1Sa1HHemPKavB7MCyV
	lr0TNWdhliudvXCpK//TDgcZaVkP/jLctTAPA9UejKTZ7DW7mZaxlkH6aHJf8dsE38V6fhj2tbk
	lusXCp+0sGUgTx6FNifNIviyWUbWUK0oXer6+zw==
X-Gm-Gg: ASbGncvXYzITEEnN8gjckiBq4MRbPpbqcj6ZPrisTbgAg/jM73rJRazh586yunTQBhk
	I4ERIrR7t+r2hsuto7T2a4i9hgfQ0Wtp23HWxr8FelrRnXqUPSBPTU4aZPlwVVhLdT6O2jIuQ1F
	CPvgLfplR3DfAm9Z+MpzY5SiWiVhIzcnMC/N0nITv9
X-Google-Smtp-Source: AGHT+IENK/26em6Ix/yYp3BQmPoOySQZ6t1Xtb6uiXx+8qhDO/pnk1OtnSnDwrVQfBQRQAUyVwHKwgBYuKumJyaIPds=
X-Received: by 2002:a17:906:4fcc:b0:abb:b1a4:b0fd with SMTP id
 a640c23a62f3a-abf25d94a3fmr267670466b.7.1740730746898; Fri, 28 Feb 2025
 00:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20250201110607.34766-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=uYad7UAedSU4M_L277v=RQGWHpJQwOW-p7W6=hcijsQ@mail.gmail.com>
 <CAHVXubhW9b6fw8ZvHtn7zmyRSUVt-3JjmFbE-_L42wZ9W6=vKA@mail.gmail.com> <CAEEQ3wmAxF=PkRt_pKFZE5-r9w1SMY7YQtco2mCyE+vus7vufg@mail.gmail.com>
In-Reply-To: <CAEEQ3wmAxF=PkRt_pKFZE5-r9w1SMY7YQtco2mCyE+vus7vufg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 28 Feb 2025 09:18:54 +0100
X-Gm-Features: AQ5f1JqLrnn4zA3maJFolHaNKWgFyB_WiJOveyerVjOOUMTPfnxW0XKkfqKcFtQ
Message-ID: <CAHVXubiHhDgC4=T7xCxK9hoCG7R2KZ46LRPmS8rgYuT7EiQDcg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: print hartid on bringup
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: apatel@ventanamicro.com, atishp@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com, 
	jassisinghbrar@gmail.com, takakura@valinux.co.jp, 
	valentina.fernandezalanis@microchip.com, ruanjinjie@huawei.com, 
	charlie@rivosinc.com, conor.dooley@microchip.com, haibo1.xu@intel.com, 
	andybnac@gmail.com, ke.zhao@shingroup.cn, tglx@linutronix.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_001909_518681_325DEC63 
X-CRM114-Status: GOOD (  23.53  )
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

SGkgWXVuaHVpLAoKT24gRnJpLCBGZWIgMjgsIDIwMjUgYXQgNzo0MeKAr0FNIHl1bmh1aSBjdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPiBPbiBXZWQs
IEZlYiAyNiwgMjAyNSBhdCAxMDo1OOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgWXVuaHVpLAo+ID4KPiA+IE9uIFRodSwgRmVi
IDIwLCAyMDI1IGF0IDE6NTTigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEFsbCwKPiA+ID4KPiA+ID4gR2VudGxlIHBpbmcuIEFu
eSBjb21tZW50cyBvbiB0aGlzIHBhdGNoPwo+ID4gPgo+ID4gPiBPbiBTYXQsIEZlYiAxLCAyMDI1
IGF0IDc6MDbigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBGaXJtd2FyZSByYW5kb21seSByZWxlYXNlcyBjb3Jlcywgc28gQ1BV
IG51bWJlcnMgZG9uJ3QgbGluZWFybHkgbWFwCj4gPiA+ID4gdG8gaGFydGlkcy4gV2hlbiB0aGUg
c3lzdGVtIGhhcyBhbiBleGNlcHRpb24sIHdlIGNhcmUgbW9yZSBhYm91dCBoYXJ0aWRzLgo+ID4g
PiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3NtcC5jICAgICB8
IDIgKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIHwgNCArKysrCj4gPiA+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAu
Ywo+ID4gPiA+IGluZGV4IGQ1OGI1ZTc1MTI4Ni4uZTY1MGRlYzQ0ODE3IDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc21wLmMKPiA+ID4gPiBAQCAtNDgsNiArNDgsOCBAQCBFWFBPUlRfU1lNQk9MX0dQTChf
X2NwdWlkX3RvX2hhcnRpZF9tYXApOwo+ID4gPiA+ICB2b2lkIF9faW5pdCBzbXBfc2V0dXBfcHJv
Y2Vzc29yX2lkKHZvaWQpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgICAgIGNwdWlkX3RvX2hhcnRp
ZF9tYXAoMCkgPSBib290X2NwdV9oYXJ0aWQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgcHJf
aW5mbygiQm9vdGluZyBMaW51eCBvbiBoYXJ0aWQgJWx1XG4iLCBib290X2NwdV9oYXJ0aWQpOwo+
ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAgc3RhdGljIERFRklORV9QRVJfQ1BVX1JFQURfTU9T
VExZKGludCwgaXBpX2R1bW15X2Rldik7Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+ID4gPiA+IGlu
ZGV4IGUzNmQyMDIwNWJkNy4uYmViYTBlZmIwMGI5IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Nt
cGJvb3QuYwo+ID4gPiA+IEBAIC0yMzEsNiArMjMxLDEwIEBAIGFzbWxpbmthZ2UgX192aXNpYmxl
IHZvaWQgc21wX2NhbGxpbih2b2lkKQo+ID4gPiA+ICAgICAgICAgcmlzY3ZfaXBpX2VuYWJsZSgp
Owo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBudW1hX2FkZF9jcHUoY3Vycl9jcHVpZCk7Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgICAgcHJfaW5mbygiQ1BVJXU6IEJvb3RlZCBzZWNvbmRhcnkgaGFy
dGlkICVsdVxuIiwgY3Vycl9jcHVpZCwKPiA+ID4gPiArICAgICAgICAgICAgICAgY3B1aWRfdG9f
aGFydGlkX21hcChjdXJyX2NwdWlkKSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICAgICAgICAgc2V0X2Nw
dV9vbmxpbmUoY3Vycl9jcHVpZCwgdHJ1ZSk7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIC8qCj4g
PiA+ID4gLS0KPiA+ID4gPiAyLjM5LjIKPiA+ID4gPgo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+
IFl1bmh1aQo+ID4KPiA+IElJUkMgdGhhdCdzIGEgZGVidWcgZmVhdHVyZSB3aGVuIHlvdSBjYW4n
dCByZWFjaCB1c2Vyc3BhY2UgYW5kIHVzZQo+ID4gY3B1aW5mbywgc28gd2hhdCBhYm91dCB1c2lu
ZyBwcl9kZWJ1ZygpIGluc3RlYWQ/Cj4KPiBVc2luZyBwcl9kZWJ1ZyBuZWVkcyBlbmFibGluZyAj
ZGVmaW5lIERFQlVHIGluCj4gYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGFuZCBhZGRpbmcg
bG9nbGV2ZWw9OCB0byBjbWRsaW5lLCBub3QKPiBjb252ZW5pZW50LgoKWW91IGNhbiBhbHNvIHVz
ZSBhIGtlcm5lbCBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIHRvIGVuYWJsZSBhCnByX2RlYnVnKCkg
c3RhdGVtZW50Cmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2FkbWluLWd1
aWRlL2R5bmFtaWMtZGVidWctaG93dG8uaHRtbCNkZWJ1Zy1tZXNzYWdlcy1kdXJpbmctYm9vdC1w
cm9jZXNzCgpBbGV4Cgo+IENhbid0IGFsd2F5cyBjYXQgL3Byb2MvY3B1aW5mbyBiZWZvcmUgcnVu
bmluZyBpbiB1c2VyCj4gbW9kZS4KPiBJdCdzIHRydWUgdGhhdCBwcl9pbmZvIHByaW50cyBhIGxh
cmdlIGFtb3VudCBvZiBpbmZvcm1hdGlvbiBpbiB0aGUKPiBzdGFydHVwIGxvZ3MsIGVzcGVjaWFs
bHkgd2hlbiB0aGVyZSBhcmUgbWFueSBDUFUgY29yZXMuCj4KPiBEbyB5b3UgaGF2ZSBhIGJldHRl
ciBzb2x1dGlvbj8KPgo+Cj4gPiBUaGFua3MsCj4gPgo+ID4gQWxleAo+Cj4gVGhhbmtzLAo+IFl1
bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
