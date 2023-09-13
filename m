Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED93BEE3F3F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 01:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QFt1ZBhY83mpoip69nwC2QhcaW2BW/ttNzr01zMofw=; b=Wd39IAWEkzJU5G
	ZMAdoI+ndS6/siP34UnxkEJiV2bOzBqQuwyMjfvFNtycVY2h+N7xDcvR3/vEXATD8qFDR+60EfTPq
	lp9Gh6Q7koPWWTxlSxIYcrcNxGKJpL9+zZWcvCccDik3KB2mmfbOOb3Mu9LMc0Llq5bXLlgSwEn9B
	73wuLBv8C1L3j4sF52hO6h1YTNtxBynS99w6y9S2twV15F/bLLO8gd5qrZPJFZ7OlRPKsH4KsSP4G
	AIrZOJslUH0sr3GMGbSxWf8ybCMBTsQb9n1zwK9r7D+OuJ7xnvXgDuSCmkl+5zZLPubAlQ4CdfoSt
	yZItDO1YqDQiO+2ICxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgF6g-004PkB-2f;
	Wed, 13 Sep 2023 01:55:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgF6d-004PjS-0q
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 01:55:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1D4E617AB
	for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 01:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87E7C433BA
	for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 01:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694570146;
	bh=2OddQKIH3uYXJT7ExCA6HUaFdELFgK8aV8tLID+9nMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eD0PQCfBKvsqVbB7ZvJNoRjXJLBBGZHn7YlSY1d/Tz+qrf4w3SSr4rHMQrwHZomTq
	 /gGngHgQe0yZjZ49G1DqOAiFSCDvaQAw3+Jbovt3FzsC97hDsUmgVouzDdA9qdhNmT
	 K8mB8yEC9C1lWaVjm78l1Vdj84WFdaOwFhvcegWoOdwmTSLOP0+0kNYKKoOnRpMcwL
	 Zg0Dt3s0KZro1KI9dnHd1Uw0K2Q80a5Ig7UDUuRwuMeu9ravHyLun9fMqlp5S4c+y0
	 sPVzgLLUrB0JtdlQNL8M+GAGtjiD3zVCe2dgZARFgoDCAwc4ceSWMHg2400pjtpAeb
	 jqMIYKeY0hFcw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-502934c88b7so10190342e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 18:55:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YwuIb71v8Nadu5AlF3XfKT8bvO9UcjsqnamVJDWcZElOg0k0FTe
	Fk9iyNv/YDR0lNP8jkY99yvQtQVM0Lv4jRVQ2Pw=
X-Google-Smtp-Source: AGHT+IGiIM8YEctQvL/CVmwan/hG+6jqbFGBYTrZFX/O9x6gC7L4g0XHDwgTYPZ+T/UmOPyj0gLtC9syNiSq7NGyTW8=
X-Received: by 2002:ac2:58e8:0:b0:500:bffa:5b86 with SMTP id
 v8-20020ac258e8000000b00500bffa5b86mr760589lfo.6.1694570144735; Tue, 12 Sep
 2023 18:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-2-guoren@kernel.org>
 <5c082cb1fd306cb75abbcaa80229d791260f8756.camel@redhat.com>
In-Reply-To: <5c082cb1fd306cb75abbcaa80229d791260f8756.camel@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Sep 2023 09:55:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSynMnYy+ARhFb0JjbAGjEYrfgsiGa2ZWv4wB3HdheU2A@mail.gmail.com>
Message-ID: <CAJF2gTSynMnYy+ARhFb0JjbAGjEYrfgsiGa2ZWv4wB3HdheU2A@mail.gmail.com>
Subject: Re: [PATCH V11 01/17] asm-generic: ticket-lock: Reuse arch_spinlock_t
 of qspinlock
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras@redhat.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_185551_389171_6B37B8E1 
X-CRM114-Status: GOOD (  34.28  )
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMzowNeKAr0FNIExlb25hcmRvIEJyw6FzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCAyMDIzLTA5LTEwIGF0IDA0OjI4IC0wNDAw
LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51
eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGUgYXJjaF9zcGlubG9ja190IG9mIHFzcGlubG9jayBo
YXMgY29udGFpbmVkIHRoZSBhdG9taWNfdCB2YWwsIHdoaWNoCj4gPiBzYXRpc2ZpZXMgdGhlIHRp
Y2tldC1sb2NrIHJlcXVpcmVtZW50LiBUaHVzLCB1bmlmeSB0aGUgYXJjaF9zcGlubG9ja190Cj4g
PiBpbnRvIHFzcGlubG9ja190eXBlcy5oLiBUaGlzIGlzIHRoZSBwcmVwYXJhdGlvbiBmb3IgdGhl
IG5leHQgY29tYm8KPiA+IHNwaW5sb2NrLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4g
PGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxp
bnV4LmFsaWJhYmEuY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy9zcGlubG9j
ay5oICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KPiA+ICBpbmNsdWRlL2FzbS1nZW5lcmljL3Nw
aW5sb2NrX3R5cGVzLmggfCAxMiArKy0tLS0tLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2suaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2su
aAo+ID4gaW5kZXggOTA4MDNhODI2YmEwLi40NzczMzM0ZWU2MzggMTAwNjQ0Cj4gPiAtLS0gYS9p
bmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrLmgKPiA+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVy
aWMvc3BpbmxvY2suaAo+ID4gQEAgLTMyLDcgKzMyLDcgQEAKPiA+Cj4gPiAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSB2b2lkIGFyY2hfc3Bpbl9sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiA+
ICB7Cj4gPiAtICAgICB1MzIgdmFsID0gYXRvbWljX2ZldGNoX2FkZCgxPDwxNiwgbG9jayk7Cj4g
PiArICAgICB1MzIgdmFsID0gYXRvbWljX2ZldGNoX2FkZCgxPDwxNiwgJmxvY2stPnZhbCk7Cj4g
PiAgICAgICB1MTYgdGlja2V0ID0gdmFsID4+IDE2Owo+ID4KPiA+ICAgICAgIGlmICh0aWNrZXQg
PT0gKHUxNil2YWwpCj4gPiBAQCAtNDYsMzEgKzQ2LDMxIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxp
bmUgdm9pZCBhcmNoX3NwaW5fbG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCj4gPiAgICAgICAg
KiBoYXZlIG5vIG91dHN0YW5kaW5nIHdyaXRlcyBkdWUgdG8gdGhlIGF0b21pY19mZXRjaF9hZGQo
KSB0aGUgZXh0cmEKPiA+ICAgICAgICAqIG9yZGVyaW5ncyBhcmUgZnJlZS4KPiA+ICAgICAgICAq
Lwo+ID4gLSAgICAgYXRvbWljX2NvbmRfcmVhZF9hY3F1aXJlKGxvY2ssIHRpY2tldCA9PSAodTE2
KVZBTCk7Cj4gPiArICAgICBhdG9taWNfY29uZF9yZWFkX2FjcXVpcmUoJmxvY2stPnZhbCwgdGlj
a2V0ID09ICh1MTYpVkFMKTsKPiA+ICAgICAgIHNtcF9tYigpOwo+ID4gIH0KPiA+Cj4gPiAgc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBib29sIGFyY2hfc3Bpbl90cnlsb2NrKGFyY2hfc3BpbmxvY2tf
dCAqbG9jaykKPiA+ICB7Cj4gPiAtICAgICB1MzIgb2xkID0gYXRvbWljX3JlYWQobG9jayk7Cj4g
PiArICAgICB1MzIgb2xkID0gYXRvbWljX3JlYWQoJmxvY2stPnZhbCk7Cj4gPgo+ID4gICAgICAg
aWYgKChvbGQgPj4gMTYpICE9IChvbGQgJiAweGZmZmYpKQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gPgo+ID4gLSAgICAgcmV0dXJuIGF0b21pY190cnlfY21weGNoZyhsb2NrLCAm
b2xkLCBvbGQgKyAoMTw8MTYpKTsgLyogU0MsIGZvciBSQ3NjICovCj4gPiArICAgICByZXR1cm4g
YXRvbWljX3RyeV9jbXB4Y2hnKCZsb2NrLT52YWwsICZvbGQsIG9sZCArICgxPDwxNikpOyAvKiBT
QywgZm9yIFJDc2MgKi8KPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCBhcmNoX3NwaW5fdW5sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiA+ICB7Cj4gPiAgICAg
ICB1MTYgKnB0ciA9ICh1MTYgKilsb2NrICsgSVNfRU5BQkxFRChDT05GSUdfQ1BVX0JJR19FTkRJ
QU4pOwo+ID4gLSAgICAgdTMyIHZhbCA9IGF0b21pY19yZWFkKGxvY2spOwo+ID4gKyAgICAgdTMy
IHZhbCA9IGF0b21pY19yZWFkKCZsb2NrLT52YWwpOwo+ID4KPiA+ICAgICAgIHNtcF9zdG9yZV9y
ZWxlYXNlKHB0ciwgKHUxNil2YWwgKyAxKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgaW50IGFyY2hfc3Bpbl92YWx1ZV91bmxvY2tlZChhcmNoX3NwaW5sb2NrX3QgbG9j
aykKPiA+ICB7Cj4gPiAtICAgICB1MzIgdmFsID0gbG9jay5jb3VudGVyOwo+ID4gKyAgICAgdTMy
IHZhbCA9IGxvY2sudmFsLmNvdW50ZXI7Cj4gPgo+ID4gICAgICAgcmV0dXJuICgodmFsID4+IDE2
KSA9PSAodmFsICYgMHhmZmZmKSk7Cj4gPiAgfQo+Cj4gVGhpcyBvbmUgc2VlbXMgdG8gYmUgZGlm
ZmVyZW50IGluIHRvcnZhbGRzL21hc3RlciwgYnV0IEkgc3VwcG9zZSBpdCdzIGJlY2F1c2Ugb2YK
PiB0aGUgcmVxdWlyZW1lbnQgcGF0Y2hlcyBJIGhhdmUgbm90IG1lcmdlZC4KPgo+ID4gQEAgLTg0
LDcgKzg0LDcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgYXJjaF9zcGluX2lzX2xvY2tl
ZChhcmNoX3NwaW5sb2NrX3QgKmxvY2spCj4gPgo+ID4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
aW50IGFyY2hfc3Bpbl9pc19jb250ZW5kZWQoYXJjaF9zcGlubG9ja190ICpsb2NrKQo+ID4gIHsK
PiA+IC0gICAgIHUzMiB2YWwgPSBhdG9taWNfcmVhZChsb2NrKTsKPiA+ICsgICAgIHUzMiB2YWwg
PSBhdG9taWNfcmVhZCgmbG9jay0+dmFsKTsKPiA+Cj4gPiAgICAgICByZXR1cm4gKHMxNikoKHZh
bCA+PiAxNikgLSAodmFsICYgMHhmZmZmKSkgPiAxOwo+ID4gIH0KPiA+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmggYi9pbmNsdWRlL2FzbS1nZW5lcmlj
L3NwaW5sb2NrX3R5cGVzLmgKPiA+IGluZGV4IDg5NjJiYjczMDk0NS4uZjUzNGFhNWRlMzk0IDEw
MDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9zcGlubG9ja190eXBlcy5oCj4gPiAr
KysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmgKPiA+IEBAIC0zLDE1ICsz
LDcgQEAKPiA+ICAjaWZuZGVmIF9fQVNNX0dFTkVSSUNfU1BJTkxPQ0tfVFlQRVNfSAo+ID4gICNk
ZWZpbmUgX19BU01fR0VORVJJQ19TUElOTE9DS19UWVBFU19ICj4gPgo+ID4gLSNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgo+ID4gLXR5cGVkZWYgYXRvbWljX3QgYXJjaF9zcGlubG9ja190Owo+ID4g
LQo+ID4gLS8qCj4gPiAtICogcXJ3bG9ja190eXBlcyBkZXBlbmRzIG9uIGFyY2hfc3BpbmxvY2tf
dCwgc28gd2UgbXVzdCB0eXBlZGVmIHRoYXQgYmVmb3JlIHRoZQo+ID4gLSAqIGluY2x1ZGUuCj4g
PiAtICovCj4gPiAtI2luY2x1ZGUgPGFzbS9xcndsb2NrX3R5cGVzLmg+Cj4gPiAtCj4gPiAtI2Rl
ZmluZSBfX0FSQ0hfU1BJTl9MT0NLX1VOTE9DS0VEICAgIEFUT01JQ19JTklUKDApCj4gPiArI2lu
Y2x1ZGUgPGFzbS1nZW5lcmljL3FzcGlubG9ja190eXBlcy5oPgo+ID4gKyNpbmNsdWRlIDxhc20t
Z2VuZXJpYy9xcndsb2NrX3R5cGVzLmg+Cj4gPgo+ID4gICNlbmRpZiAvKiBfX0FTTV9HRU5FUklD
X1NQSU5MT0NLX1RZUEVTX0ggKi8KPgo+IEZXSVcsIExHVE06Cj4KPiBSZXZpZXdlZC1ieTogTGVv
bmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+Cj4KPiBKdXN0IGEgc3VnZ2VzdGlvbjog
SW4gdGhpcyBwYXRjaCBJIGNvdWxkIHNlZSBhIGxvdCBvZiB1c2FnZSBjaGFuZ2VzIHRvCj4gYXJj
aF9zcGlubG9ja190LCBhbmQgb25seSBhdCB0aGUgZW5kIEkgY291bGQgc2VlIHRoZSBhY3R1YWwg
Y2hhbmdlIGluIHRoZSAuaAo+IGZpbGUuCiBpbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrLmgg
ICAgICAgfCAxNCArKysrKysrLS0tLS0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9zcGlubG9ja190
eXBlcy5oIHwgMTIgKystLS0tLS0tLS0tCgpBbGwgYXJlIC5oIGZpbGVzLiBTbywgaG93IHRvIHVz
ZSBnaXQub3JkZXJmaWxlPwoKPgo+IEluIGNhc2VzIGxpa2UgdGhpcywgaXQgbG9va3MgbmljZXIg
dG8gc2VlIHRoZSAuaCBmaWxlIGZpcnN0Lgo+Cj4gSSByZWNlbnRseSBmb3VuZCBvdXQgYWJvdXQg
dGhpcyBnaXQgZGlmZi5vcmRlckZpbGUgb3B0aW9uLCB3aGljaCBoZWxwcyB0bwo+IGFjaGlldmUg
ZXhhY3RseSB0aGlzLgo+Cj4gSSB1c2UgdGhlIGZvbGxvd2luZyBnaXQub3JkZXJmaWxlLCBhZGFw
dGVkIGZyb20gcWVtdToKPgo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAjCj4gIyBvcmRlciBmaWxl
IGZvciBnaXQsIHRvIHByb2R1Y2UgcGF0Y2hlcyB3aGljaCBhcmUgZWFzaWVyIHRvIHJldmlldwo+
ICMgYnkgZGlmZmluZyB0aGUgaW1wb3J0YW50IHN0dWZmIGxpa2UgaW50ZXJmYWNlIGNoYW5nZXMg
Zmlyc3QuCj4gIwo+ICMgb25lLW9mZiB1c2FnZToKPiAjICAgZ2l0IGRpZmYgLU8gc2NyaXB0cy9n
aXQub3JkZXJmaWxlIC4uLgo+ICMKPiAjIGFkZCB0byBnaXQgY29uZmlnOgo+ICMgICBnaXQgY29u
ZmlnIGRpZmYub3JkZXJGaWxlIHNjcmlwdHMvZ2l0Lm9yZGVyZmlsZQo+ICMKPgo+IE1BSU5UQUlO
RVJTCj4KPiAjIERvY3VtZW50YXRpb24KPiBEb2N1bWVudGF0aW9uLyoKPiAqLnJzdAo+ICoucnN0
LmluYwo+Cj4gIyBidWlsZCBzeXN0ZW0KPiBLYnVpbGQKPiBNYWtlZmlsZSoKPiAqLm1hawo+Cj4g
IyBzZW1hbnRpYyBwYXRjaGVzCj4gKi5jb2NjaQo+Cj4gIyBoZWFkZXJzCj4gKi5oCj4gKi5oLmlu
Ywo+Cj4gIyBjb2RlCj4gKi5jCj4gKi5jLmluYwo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
