Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94CFCA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 01:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zu76hEsCJoR4FPMxMQ7CFFzxnF8d4+7v4U9J/2yVibA=; b=oEaZmfnSWpdCjJ
	IT5nc1WSHsMpIR/CDk7j+x25/a8oxi+lzdFhHBh63T7VLcBkLUjYRnRlHTTgO1/ovGpM+2K61d0wC
	P05bq5RwHGcPiBRcqVGjt/82JLUQ6N+3OQFR6DE+bpvRvhBkPz0Ea1H/ALLPsfxvNn0U8ybgW2EAE
	NZU9JARNa9zTigVoy4NzIeTxZEGRG3zWH6gLf87NtamtMRyVyvJzgSpmVqlaRow8ox2r1sintAcNJ
	ows+XX6zetS55w7AEjdPiI1VVu2fFrLgAEbUqGvet0lGT6YBiW3mb5dDjY1vInlMo4QHIB78qeF0s
	SvxiU3S9liOLmBHs1J5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrv9-001iPO-1q;
	Tue, 12 Sep 2023 01:10:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrv7-001iOj-0A
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 01:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 59B35CE1990
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2436C4AF69
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694481021;
	bh=PmwGDpdmz+0+pysYVIXZ7fXJiKs9e5dF+HbkGIVF5as=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jlD2mnVQkJ9dQNUIk9R3CuYjHhgHwvQV9BhYB1UVI/cUqGd1sykjzR7mLUJXtptJQ
	 NIcmajdfgGqmN141W+e/2moBeBsQ93VfXgkY756hKejSyMHUxmias79eLYxIk5i1fj
	 RpG7XZhT0/QpfIOm9R+4s+TTfXVTs3mJLrFUOGrNuuR9EiYzZydLJb4+3YAxrr1fPe
	 aVSHdeSKu6CiukMnrRolU4G0aHeMwoD4BC0P72Lhwxgwtm0U8rzMK1eNx9FhSKN99G
	 LBKsEGYVTjxFRF0hMp9PerExCBewvbvQmTedyMML8itsk1hKn8wlEig78uT1o09Uyt
	 qJOcV6g7C8dmA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bed101b70so637895966b.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 18:10:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YwTQGrIgyPfWz0VYFhJCqNsulACm7F0pL9uGgJ8N9DKhgrrZUdc
	EQgUnUrfqKwOFb9MykKSsGgJzGnbWGJWxb4MRXo=
X-Google-Smtp-Source: AGHT+IG7WPf4ZfuTXYhS8Pfr8Yz7DCWBDmRzYNhYtX5DScRQNAK6kZJN4KaH0XTWTAZy+qE6WP41Hn0WlXiCnlA9WtA=
X-Received: by 2002:a17:906:214:b0:9a2:86b:bb18 with SMTP id
 20-20020a170906021400b009a2086bbb18mr11141293ejd.26.1694481020090; Mon, 11
 Sep 2023 18:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-5-guoren@kernel.org>
 <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com> <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
 <06714da1-d566-766f-7a13-a3c93b5953c4@redhat.com>
In-Reply-To: <06714da1-d566-766f-7a13-a3c93b5953c4@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Sep 2023 09:10:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ3Q7f+FGorVTR66c6TGWsSeeKVvLF+LH1_m3kSHrm0yA@mail.gmail.com>
Message-ID: <CAJF2gTQ3Q7f+FGorVTR66c6TGWsSeeKVvLF+LH1_m3kSHrm0yA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230911_181025_441419_D9808FD0 
X-CRM114-Status: GOOD (  28.69  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgOTowM+KAr1BNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gOS8xMC8yMyAyMzowOSwgR3VvIFJlbiB3cm90ZToKPiA+
IE9uIE1vbiwgU2VwIDExLCAyMDIzIGF0IDEwOjM14oCvQU0gV2FpbWFuIExvbmcgPGxvbmdtYW5A
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiA5LzEwLzIzIDA0OjI4LCBndW9yZW5Aa2Vy
bmVsLm9yZyB3cm90ZToKPiA+Pj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgo+ID4+Pgo+ID4+PiBUaGUgdGFyZ2V0IG9mIHhjaGdfdGFpbCBpcyB0byB3cml0ZSB0aGUg
dGFpbCB0byB0aGUgbG9jayB2YWx1ZSwgc28KPiA+Pj4gYWRkaW5nIHByZWZldGNodyBjb3VsZCBo
ZWxwIHRoZSBuZXh0IGNtcHhjaGcgc3RlcCwgd2hpY2ggbWF5Cj4gPj4+IGRlY3JlYXNlIHRoZSBj
bXB4Y2hnIHJldHJ5IGxvb3BzIG9mIHhjaGdfdGFpbC4gU29tZSBwcm9jZXNzb3JzIG1heQo+ID4+
PiB1dGlsaXplIHRoaXMgZmVhdHVyZSB0byBnaXZlIGEgZm9yd2FyZCBndWFyYW50ZWUsIGUuZy4s
IFJJU0MtVgo+ID4+PiBYdWFuVGllIHByb2Nlc3NvcnMgd291bGQgYmxvY2sgdGhlIHNub29wIGNo
YW5uZWwgJiBpcnEgZm9yIHNldmVyYWwKPiA+Pj4gY3ljbGVzIHdoZW4gcHJlZmV0Y2gudyBpbnN0
cnVjdGlvbiAoZnJvbSBaaWNib3AgZXh0ZW5zaW9uKSByZXRpcmVkLAo+ID4+PiB3aGljaCBndWFy
YW50ZWVzIHRoZSBuZXh0IGNtcHhjaGcgc3VjY2VlZHMuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Pj4gU2lnbmVkLW9mZi1i
eTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPj4+IC0tLQo+ID4+PiAgICBrZXJuZWwv
bG9ja2luZy9xc3BpbmxvY2suYyB8IDUgKysrKy0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEva2Vy
bmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMgYi9rZXJuZWwvbG9ja2luZy9xc3BpbmxvY2suYwo+ID4+
PiBpbmRleCBkM2Y5OTA2MGI2MGYuLjk2YjU0ZTJhZGU4NiAxMDA2NDQKPiA+Pj4gLS0tIGEva2Vy
bmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMKPiA+Pj4gKysrIGIva2VybmVsL2xvY2tpbmcvcXNwaW5s
b2NrLmMKPiA+Pj4gQEAgLTIyMyw3ICsyMjMsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2
b2lkIGNsZWFyX3BlbmRpbmdfc2V0X2xvY2tlZChzdHJ1Y3QgcXNwaW5sb2NrICpsb2NrKQo+ID4+
PiAgICAgKi8KPiA+Pj4gICAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB1MzIgeGNoZ190YWlsKHN0
cnVjdCBxc3BpbmxvY2sgKmxvY2ssIHUzMiB0YWlsKQo+ID4+PiAgICB7Cj4gPj4+IC0gICAgIHUz
MiBvbGQsIG5ldywgdmFsID0gYXRvbWljX3JlYWQoJmxvY2stPnZhbCk7Cj4gPj4+ICsgICAgIHUz
MiBvbGQsIG5ldywgdmFsOwo+ID4+PiArCj4gPj4+ICsgICAgIHByZWZldGNodygmbG9jay0+dmFs
KTsKPiA+Pj4gKyAgICAgdmFsID0gYXRvbWljX3JlYWQoJmxvY2stPnZhbCk7Cj4gPj4+Cj4gPj4+
ICAgICAgICBmb3IgKDs7KSB7Cj4gPj4+ICAgICAgICAgICAgICAgIG5ldyA9ICh2YWwgJiBfUV9M
T0NLRURfUEVORElOR19NQVNLKSB8IHRhaWw7Cj4gPj4gVGhhdCBsb29rcyBhIGJpdCB3ZWlyZC4g
WW91IHByZS1mZXRjaCBhbmQgdGhlbiBpbW1lZGlhdGVseSByZWFkIGl0LiBIb3cKPiA+PiBtdWNo
IHBlcmZvcm1hbmNlIGdhaW4geW91IGdldCBieSB0aGlzIGNoYW5nZSBhbG9uZT8KPiA+Pgo+ID4+
IE1heWJlIHlvdSBjYW4gZGVmaW5lIGFuIGFyY2ggc3BlY2lmaWMgcHJpbWl0aXZlIHRoYXQgZGVm
YXVsdCBiYWNrIHRvCj4gPj4gYXRvbWljX3JlYWQoKSBpZiBub3QgZGVmaW5lZC4KPiA+IFRoeCBm
b3IgdGhlIHJlcGx5LiBUaGlzIGlzIGEgZ2VuZXJpYyBvcHRpbWl6YXRpb24gcG9pbnQgSSB3b3Vs
ZCBsaWtlCj4gPiB0byB0YWxrIGFib3V0IHdpdGggeW91Lgo+ID4KPiA+IEZpcnN0LCBwcmVmZXRj
aHcoKSBtYWtlcyBjYWNoZWxpbmUgYW4gZXhjbHVzaXZlIHN0YXRlIGFuZCBzZXJ2ZXMgZm9yCj4g
PiB0aGUgbmV4dCBjbXB4Y2hnIGxvb3Agc2VtYW50aWMsIHdoaWNoIHdyaXRlcyB0aGUgaWR4X3Rh
aWwgcGFydCBvZgo+ID4gYXJjaF9zcGluX2xvY2suIFRoZSBhdG9taWNfcmVhZCBvbmx5IG1ha2Vz
IGNhY2hlbGluZSBpbiB0aGUgc2hhcmVkCj4gPiBzdGF0ZSwgd2hpY2ggY291bGRuJ3QgZ2l2ZSBh
bnkgZ3VhcmFudGVlIGZvciB0aGUgbmV4dCBjbXB4Y2hnIGxvb3AKPiA+IHNlbWFudGljLiBNaWNy
by1hcmNoaXRlY3R1cmUgY291bGQgdXRpbGl6ZSBwcmVmZXRjaHcoKSB0byBwcm92aWRlIGEKPiA+
IHN0cm9uZyBmb3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZSBmb3IgdGhlIHhjaGdfdGFpbCwgZS5n
LiwgdGhlIFQtSEVBRAo+ID4gWHVhblRpZSBwcm9jZXNzb3Igd291bGQgaG9sZCB0aGUgZXhjbHVz
aXZlIGNhY2hlbGluZSBzdGF0ZSB1bnRpbCB0aGUKPiA+IG5leHQgY21weGNoZyB3cml0ZSBzdWNj
ZXNzLgo+ID4KPiA+IEluIHRoZSBlbmQsIExldCdzIGdvIGJhY2sgdG8gdGhlIHByaW5jaXBsZTog
dGhlIHhjaGdfdGFpbCBpcyBhbiBhdG9taWMKPiA+IHN3YXAgb3BlcmF0aW9uIHRoYXQgY29udGFp
bnMgd3JpdGUgZXZlbnR1YWxseSwgc28gZ2l2aW5nIGEgcHJlZmV0Y2h3KCkKPiA+IGF0IHRoZSBi
ZWdpbm5pbmcgaXMgYWNjZXB0YWJsZSBmb3IgYWxsIGFyY2hpdGVjdHVyZXMuLgo+ID4g4oCi4oCi
4oCi4oCi4oCi4oCi4oCi4oCi4oCi4oCi4oCi4oCiCj4KPiBJIGRpZCByZWFsaXplIGFmdGVyd2Fy
ZCB0aGF0IHByZWZldGNodyBnZXRzIHRoZSBjYWNoZWxpbmUgaW4gZXhjbHVzaXZlCj4gc3RhdGUu
IEkgd2lsbCBzdWdnZXN0IHlvdSBtZW50aW9uIHRoYXQgaW4geW91ciBjb21taXQgbG9nIGFzIHdl
bGwgYXMKPiBhZGRpbmcgYSBjb21tZW50IGFib3V0IGl0cyBwdXJwb3NlIGluIHRoZSBjb2RlLgpP
a2F5LCBJIHdvdWxkIGRvIHRoYXQgaW4gdjEyLCB0aHguCgo+Cj4gVGhhbmtzLAo+IExvbmdtYW4K
Pgo+ID4+IENoZWVycywKPiA+PiBMb25nbWFuCj4gPj4KPiA+Cj4KCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
