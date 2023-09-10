Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B8EC8748
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6la1KUxsWCWb5YJITuOveXlqeGx9oXpHc/A0ThFO0xQ=; b=yI35hQJoLNciQP
	PWbsPJLxiWOuvzqXd94iEovtBWJwk95fQ+AouC6TW1AyUPpHP5DPiY/e2svQJ0Bi3aT3ZO8CzyfQ6
	+/VHQxBohp6yTq30VyyGOpD3sAOZwjAaaeBXCwNETLa8eEPNFdHv90awGdFo4yK/RMog6rk7Fy/fP
	lhtjIy2fjuxxAdyCgcQQYYY1GqxgjXkBxL8gf+mVm7UnyRpSs44elB/9+sTIPfLB4qglWM4A7s4cP
	v/Uay9McDzugZ5+gFJWKrVYYimnahUl3/8QNXTtnXIR8V3Qf0mO2Q5o5zXlyeyUUnWUYN3uDrpsCG
	BTyBJnne3lES4TqKmzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfH4O-00GN5a-1I;
	Sun, 10 Sep 2023 09:49:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfH4M-00GN4Q-0X
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 09:49:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F285460C64
	for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 09:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62206C433C7
	for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694339368;
	bh=FVbTyTYGkD/2rsb+c2iBU+8LpogWn5/bcs1vtUZzC7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tw6Ow9U9eAMf7zSrY4eHJYZFLjv/NM3x5a6xUPB6TMtCX5j2kABX+QWf5LeEe0K5c
	 V396CGEwQpyEvtyhFLKzwgdgCHaDNPMGZ2LkqnHCaEdvfeWcBF3XueZ5KPmnGRFRGq
	 SqW9U+CZGvlcQCAP/NV1WuGDnjrFcw0wlpSRFp2k2sQlYAlT2qAoCyvS6xjcxPw07D
	 6XNuNWZkotT5oNEjHdrix6YUxqW/6hOlb4v4A7fvgCe6bnMYv17dFEi4UQm+EPMGW/
	 haQJOOMNPP8QxBhc2c0yT2jO4cQrBvBRtYyts3LexZNDGZsBRYSLLbEoXrD+QeE0sR
	 STdZBogqJkqGA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-977e0fbd742so424260166b.2
        for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 02:49:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YzHDDuKGxylOWvzR+1CN/7aqHqPUJz1HkNgSAS1775eKYPAwm44
	3hbXkg0ZUOHZujlmWOGzaguLn9Fg2YwPDPTUGuw=
X-Google-Smtp-Source: AGHT+IFebFcltTIfF/6OhHnfq0bf8TerZi1uxhJIuc+47iS1v4AmYwXI87kynct8S8UjRMHcgJiImK3yZpjbw08MGbc=
X-Received: by 2002:a17:906:10cf:b0:9a9:e41c:bcb3 with SMTP id
 v15-20020a17090610cf00b009a9e41cbcb3mr5498515ejv.59.1694339366810; Sun, 10
 Sep 2023 02:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com> <20230910-baggage-accent-ec5331b58c8e@spud>
In-Reply-To: <20230910-baggage-accent-ec5331b58c8e@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 10 Sep 2023 17:49:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
Message-ID: <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_024930_314370_886F1C8D 
X-CRM114-Status: GOOD (  20.79  )
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

T24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNTozMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNToxNjo0NlBNICsw
ODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNDo1OOKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFN1
biwgU2VwIDEwLCAyMDIzIGF0IDA0OjI4OjU0QU0gLTA0MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdy
b3RlOgo+ID4gPgo+ID4gPiA+IENoYW5nbG9nOgo+ID4gPiA+IFYxMToKPiA+ID4gPiAgLSBCYXNl
ZCBvbiBMZW9uYXJkbyBCcmFzJ3MgY21weGNoZ19zbWFsbCBwYXRjaGVzIHY1Lgo+ID4gPiA+ICAt
IEJhc2VkIG9uIEd1byBSZW4ncyBPcHRpbWl6ZSBhcmNoX3NwaW5fdmFsdWVfdW5sb2NrZWQgcGF0
Y2ggdjMuCj4gPiA+ID4gIC0gUmVtb3ZlIGFidXNpbmcgYWx0ZXJuYXRpdmUgZnJhbWV3b3JrIGFu
ZCB1c2UganVtcF9sYWJlbCBpbnN0ZWFkLgo+ID4gPgo+ID4gPiBidHcsIEkgZGlkbid0IHNheSB0
aGF0IHVzaW5nIGFsdGVybmF0aXZlcyB3YXMgdGhlIHByb2JsZW0sIGl0IHdhcwo+ID4gPiBhYnVz
aW5nIHRoZSBlcnJhdGEgZnJhbWV3b3JrIHRvIHBlcmZvcm0gZmVhdHVyZSBkZXRlY3Rpb24gdGhh
dCBJIGhhZAo+ID4gPiBhIHByb2JsZW0gd2l0aC4gVGhhdCdzIG5vdCBjaGFuZ2VkIGluIHYxMS4K
PiA+IEkndmUgcmVtb3ZlZCBlcnJhdGEgZmVhdHVyZSBkZXRlY3Rpb24uIFRoZSBvbmx5IHJlbGF0
ZWQgcGF0Y2hlcyBhcmU6Cj4gPiAgLSByaXNjdjogcXNwaW5sb2NrOiBlcnJhdGE6IEFkZCBFUlJB
VEFfVEhFQURfV1JJVEVfT05DRSBmaXh1cAo+ID4gIC0gcmlzY3Y6IHFzcGlubG9jazogZXJyYXRh
OiBFbmFibGUgcXNwaW5sb2NrIGZvciBULUhFQUQgcHJvY2Vzc29ycwo+ID4KPiA+IFdoaWNoIG9u
ZSBpcyB5b3VyIGNvbmNlcm4/IENvdWxkIHlvdSByZXBseSBvbiB0aGUgZXhhY3QgcGF0Y2ggdGhy
ZWFkPyBUaHguCj4KPiByaXNjdjogcXNwaW5sb2NrOiBlcnJhdGE6IEVuYWJsZSBxc3BpbmxvY2sg
Zm9yIFQtSEVBRCBwcm9jZXNzb3JzCj4KPiBQbGVhc2UgZ28gYmFjayBhbmQgcmUtcmVhZCB0aGUg
Y29tbWVudHMgSSBsZWZ0IG9uIHYxMSBhYm91dCB1c2luZyB0aGUKPiBlcnJhdGEgY29kZSBmb3Ig
ZmVhdHVyZSBkZXRlY3Rpb24uCj4KPiA+ID4gQSBzdHJvbmdlciBmb3J3YXJkIHByb2dyZXNzIGd1
YXJhbnRlZSBpcyBub3QgYW4gZXJyYXR1bSwgQUZBSUNULgo+Cj4gPiBTb3JyeSwgdGhlcmUgaXMg
bm8gZXJyYXR1bSBvZiAic3Ryb25nZXIgZm9yd2FyZCBwcm9ncmVzcyBndWFyYW50ZWUiIGluIHRo
ZSBWMTEuCj4KPiAicmlzY3Y6IHFzcGlubG9jazogZXJyYXRhOiBFbmFibGUgcXNwaW5sb2NrIGZv
ciBULUhFQUQgcHJvY2Vzc29ycyIgc3RpbGwKPiB1c2VzIHRoZSBlcnJhdGEgZnJhbWV3b3JrIHRv
IGRldGVjdCB0aGUgcHJlc2VuY2Ugb2YgdGhlIHN0cm9uZ2VyIGZvcndhcmQKPiBwcm9ncmVzcyBn
dWFyYW50ZWUgaW4gdjExLgpPaCwgdGh4IGZvciBwb2ludGluZyBpdCBvdXQuIEkgY291bGQgcmVw
bGFjZSBpdCB3aXRoIHRoaXM6CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKaW5kZXggODg2OTA3NTFmMmVlLi40YmU5Mjc2
NmQzZTMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc2V0dXAuYwpAQCAtMzEwLDcgKzMxMCw4IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCByaXNjdl9zcGlubG9ja19pbml0KHZvaWQpCiB7CiAjaWZkZWYgQ09ORklHX1JJU0NWX0NPTUJP
X1NQSU5MT0NLUwogICAgICAgIGlmICghZW5hYmxlX3FzcGlubG9ja19rZXkgJiYKLSAgICAgICAg
ICAgKHNiaV9nZXRfZmlybXdhcmVfaWQoKSAhPSBTQklfRVhUX0JBU0VfSU1QTF9JRF9LVk0pKSB7
CisgICAgICAgICAgIChzYmlfZ2V0X2Zpcm13YXJlX2lkKCkgIT0gU0JJX0VYVF9CQVNFX0lNUExf
SURfS1ZNKSAmJgorICAgICAgICAgICAoc2JpX2dldF9tdmVuZG9yaWQoKSAhPSBUSEVBRF9WRU5E
T1JfSUQpKSB7CiAgICAgICAgICAgICAgICBzdGF0aWNfYnJhbmNoX2Rpc2FibGUoJmNvbWJvX3Fz
cGlubG9ja19rZXkpOwogICAgICAgICAgICAgICAgcHJfaW5mbygiVGlja2V0IHNwaW5sb2NrOiBl
bmFibGVkXG4iKTsKICAgICAgICB9IGVsc2UgewoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
