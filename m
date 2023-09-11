Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B4EC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xm7wfI6+aF03DsbjIMPLoJnfs0cmXlOCkJAPRLTWuA=; b=HBUBBW6/ufNb7x
	ZB+da7lxM8RxQOlzZN3XrppfCTWZEN4UUQ1M6ShyIUflLWTmGgwj3TZK3f2obyP/Xp0brSe/UAply
	d7pNDUqF/2d8jTcsPdwowSlkm+Q+Wn5bmdBI86jUjr37oGFqc3LLLnVmeiDUltvWLhQKUztBJWA/0
	Bs655sclBDvp/YO25fpgBChzc0pYwypdW2DYKFXF8sCwW8hTR8oo5M69J7uxUDH3WnlcrkpxuVIT2
	4uQslKsiNJIgKWNC6CTmb+OQ63uZBK4M+XPDgTPI2KFKWBtf2kYTz2lAS3lwLBfYmfPiVQgCC0RFM
	QsWT2G2S0xDS+NvieBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXJa-00H8g6-1l;
	Mon, 11 Sep 2023 03:10:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXJX-00H8f3-1w
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 03:10:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20E3D60ED8
	for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 03:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C892C433CA
	for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 03:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694401811;
	bh=UONvhmizn0JJhF+HaALbacTSzlI5SR6Is+F9ac10n7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C6RvUKn4NRYtphWoqfwaddafP0zABGlMvpxOoSnLUI6Y/ROq6HSQrhQG/jwc/oV9R
	 UYXqZweYL0YYfBgtBO1SYP81TJJfLl54UfWKfPZ/E8kD+wyqeNDzvyvN+QMP9sMC6O
	 1qATIkJ5YjPAGZXg7sxkkLYdqSvQBn9KaKqX3GVGxhhUCBMpVe54CMJZ4Qz2pIxkII
	 LRjry0c01jnCWvarBpA/cmMGgPZlGCeVpJXsE94yF2bcDzEC5zvX1tk/AZ5lMzBBTy
	 F1bfSEe5HzGa+zQNFY+Dv2+V/6bIiCu0ywQB73nfOLvYqo0FrzXW1C6sCi5jdYJams
	 aChRK7d+p6JrQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52e297c7c39so4918578a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 20:10:11 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywmhe2ejLQihlnJmamYLmvWkJtoU39z9OBNluK6jDQEw0eqBlNf
	y4GBMKtex/Is07F3juGB5CD0UgwapPdMYSYSoAk=
X-Google-Smtp-Source: AGHT+IEXrD5I7ibaP2mQt3kJW4nPV6v0QD/O5Y3rF3MfAruuPpiiUMuOKBJ5qG3F9j3sqa55PILnojVoXbzY49w8TF8=
X-Received: by 2002:a17:907:7795:b0:9a1:db97:62a1 with SMTP id
 ky21-20020a170907779500b009a1db9762a1mr6313893ejc.46.1694401809871; Sun, 10
 Sep 2023 20:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-5-guoren@kernel.org>
 <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com>
In-Reply-To: <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 11 Sep 2023 11:09:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
Message-ID: <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
Subject: Re: [PATCH V11 04/17] locking/qspinlock: Improve xchg_tail for number
 of cpus >= 16k
To: Waiman Long <longman@redhat.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, boqun.feng@gmail.com, 
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org, 
	rdunlap@infradead.org, catalin.marinas@arm.com, conor.dooley@microchip.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_201015_723811_F619153B 
X-CRM114-Status: GOOD (  23.27  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMTA6MzXigK9BTSBXYWltYW4gTG9uZyA8bG9uZ21hbkBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+Cj4gT24gOS8xMC8yMyAwNDoyOCwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4g
Pgo+ID4gVGhlIHRhcmdldCBvZiB4Y2hnX3RhaWwgaXMgdG8gd3JpdGUgdGhlIHRhaWwgdG8gdGhl
IGxvY2sgdmFsdWUsIHNvCj4gPiBhZGRpbmcgcHJlZmV0Y2h3IGNvdWxkIGhlbHAgdGhlIG5leHQg
Y21weGNoZyBzdGVwLCB3aGljaCBtYXkKPiA+IGRlY3JlYXNlIHRoZSBjbXB4Y2hnIHJldHJ5IGxv
b3BzIG9mIHhjaGdfdGFpbC4gU29tZSBwcm9jZXNzb3JzIG1heQo+ID4gdXRpbGl6ZSB0aGlzIGZl
YXR1cmUgdG8gZ2l2ZSBhIGZvcndhcmQgZ3VhcmFudGVlLCBlLmcuLCBSSVNDLVYKPiA+IFh1YW5U
aWUgcHJvY2Vzc29ycyB3b3VsZCBibG9jayB0aGUgc25vb3AgY2hhbm5lbCAmIGlycSBmb3Igc2V2
ZXJhbAo+ID4gY3ljbGVzIHdoZW4gcHJlZmV0Y2gudyBpbnN0cnVjdGlvbiAoZnJvbSBaaWNib3Ag
ZXh0ZW5zaW9uKSByZXRpcmVkLAo+ID4gd2hpY2ggZ3VhcmFudGVlcyB0aGUgbmV4dCBjbXB4Y2hn
IHN1Y2NlZWRzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
Pgo+ID4gLS0tCj4gPiAgIGtlcm5lbC9sb2NraW5nL3FzcGlubG9jay5jIHwgNSArKysrLQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL3FzcGlubG9jay5jIGIva2VybmVsL2xvY2tpbmcv
cXNwaW5sb2NrLmMKPiA+IGluZGV4IGQzZjk5MDYwYjYwZi4uOTZiNTRlMmFkZTg2IDEwMDY0NAo+
ID4gLS0tIGEva2VybmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMKPiA+ICsrKyBiL2tlcm5lbC9sb2Nr
aW5nL3FzcGlubG9jay5jCj4gPiBAQCAtMjIzLDcgKzIyMywxMCBAQCBzdGF0aWMgX19hbHdheXNf
aW5saW5lIHZvaWQgY2xlYXJfcGVuZGluZ19zZXRfbG9ja2VkKHN0cnVjdCBxc3BpbmxvY2sgKmxv
Y2spCj4gPiAgICAqLwo+ID4gICBzdGF0aWMgX19hbHdheXNfaW5saW5lIHUzMiB4Y2hnX3RhaWwo
c3RydWN0IHFzcGlubG9jayAqbG9jaywgdTMyIHRhaWwpCj4gPiAgIHsKPiA+IC0gICAgIHUzMiBv
bGQsIG5ldywgdmFsID0gYXRvbWljX3JlYWQoJmxvY2stPnZhbCk7Cj4gPiArICAgICB1MzIgb2xk
LCBuZXcsIHZhbDsKPiA+ICsKPiA+ICsgICAgIHByZWZldGNodygmbG9jay0+dmFsKTsKPiA+ICsg
ICAgIHZhbCA9IGF0b21pY19yZWFkKCZsb2NrLT52YWwpOwo+ID4KPiA+ICAgICAgIGZvciAoOzsp
IHsKPiA+ICAgICAgICAgICAgICAgbmV3ID0gKHZhbCAmIF9RX0xPQ0tFRF9QRU5ESU5HX01BU0sp
IHwgdGFpbDsKPgo+IFRoYXQgbG9va3MgYSBiaXQgd2VpcmQuIFlvdSBwcmUtZmV0Y2ggYW5kIHRo
ZW4gaW1tZWRpYXRlbHkgcmVhZCBpdC4gSG93Cj4gbXVjaCBwZXJmb3JtYW5jZSBnYWluIHlvdSBn
ZXQgYnkgdGhpcyBjaGFuZ2UgYWxvbmU/Cj4KPiBNYXliZSB5b3UgY2FuIGRlZmluZSBhbiBhcmNo
IHNwZWNpZmljIHByaW1pdGl2ZSB0aGF0IGRlZmF1bHQgYmFjayB0bwo+IGF0b21pY19yZWFkKCkg
aWYgbm90IGRlZmluZWQuClRoeCBmb3IgdGhlIHJlcGx5LiBUaGlzIGlzIGEgZ2VuZXJpYyBvcHRp
bWl6YXRpb24gcG9pbnQgSSB3b3VsZCBsaWtlCnRvIHRhbGsgYWJvdXQgd2l0aCB5b3UuCgpGaXJz
dCwgcHJlZmV0Y2h3KCkgbWFrZXMgY2FjaGVsaW5lIGFuIGV4Y2x1c2l2ZSBzdGF0ZSBhbmQgc2Vy
dmVzIGZvcgp0aGUgbmV4dCBjbXB4Y2hnIGxvb3Agc2VtYW50aWMsIHdoaWNoIHdyaXRlcyB0aGUg
aWR4X3RhaWwgcGFydCBvZgphcmNoX3NwaW5fbG9jay4gVGhlIGF0b21pY19yZWFkIG9ubHkgbWFr
ZXMgY2FjaGVsaW5lIGluIHRoZSBzaGFyZWQKc3RhdGUsIHdoaWNoIGNvdWxkbid0IGdpdmUgYW55
IGd1YXJhbnRlZSBmb3IgdGhlIG5leHQgY21weGNoZyBsb29wCnNlbWFudGljLiBNaWNyby1hcmNo
aXRlY3R1cmUgY291bGQgdXRpbGl6ZSBwcmVmZXRjaHcoKSB0byBwcm92aWRlIGEKc3Ryb25nIGZv
cndhcmQgcHJvZ3Jlc3MgZ3VhcmFudGVlIGZvciB0aGUgeGNoZ190YWlsLCBlLmcuLCB0aGUgVC1I
RUFEClh1YW5UaWUgcHJvY2Vzc29yIHdvdWxkIGhvbGQgdGhlIGV4Y2x1c2l2ZSBjYWNoZWxpbmUg
c3RhdGUgdW50aWwgdGhlCm5leHQgY21weGNoZyB3cml0ZSBzdWNjZXNzLgoKSW4gdGhlIGVuZCwg
TGV0J3MgZ28gYmFjayB0byB0aGUgcHJpbmNpcGxlOiB0aGUgeGNoZ190YWlsIGlzIGFuIGF0b21p
Ywpzd2FwIG9wZXJhdGlvbiB0aGF0IGNvbnRhaW5zIHdyaXRlIGV2ZW50dWFsbHksIHNvIGdpdmlu
ZyBhIHByZWZldGNodygpCmF0IHRoZSBiZWdpbm5pbmcgaXMgYWNjZXB0YWJsZSBmb3IgYWxsIGFy
Y2hpdGVjdHVyZXMuLgoKPgo+IENoZWVycywKPiBMb25nbWFuCj4KCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
