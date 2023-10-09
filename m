Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF0CD610E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+dD7Vz8cG18ECxbpjrHy9v7YdC7CFUTD8h8WrWijHE=; b=T5ilgJY7HIEMPY
	D3K5lTmOK1Gm/umNz8G3xLbAcl9XLYsy/S59a1M5jfStTxxWcsTUTKgKdCLXFJwd+rb/S6aCAy+Wq
	eXPb/dfpJDRFsRbc/qj65amLvaCRGBPVJEPD/H+lHuf3MtN5MORP4RPusPkyqm4OnTN1nqBSypuiP
	wRM0aoph5a9+1SY5aBYDJiL4CQs4IkDSJn5o6dXVg73MWLj2vNmJchKqM5Qha8mTXPJWMxrNa/z56
	o98baKO7eGukhyfw1v7OX7saYyyVMAOdpgd1QLwOm9a7LFYZoSI3nQRPu8fEPK0oCU8tKFNMsZ9gI
	498U2IjJ7D/BM68vUsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qptkK-00BFs0-2z;
	Mon, 09 Oct 2023 17:08:44 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qptkH-00BFqo-0X;
	Mon, 09 Oct 2023 17:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mrAocPRzlQT+HhzW90ANcMn2nr6/4rXTdfxji/3XDNc=; b=wM9t+Vt4m4Nh/XpHhlbNQt/ZWA
	G8MKQ0N2s19O4O5H5T7jEWIygJWi4w3ryM0ySDnVZ/gNzH289aY/kOIVN75u/gZNJp9VD3sGYLX1A
	rQCNqkalZFUpNQGughQqaBV27YRNnInHBCriXP1fssVhdoICZYJJF1Gz9g68f45rVEBTZcP7CyMoy
	JO5j/v32scGw2eoXCrGRJmeKY48TCDY9EH5ZyN/NWVR5ymXHyY6czZGzrVkaCpWx3pUekD4254Qds
	zx/6U+5g36u4/XL9zh75v4hWbvGQfM0Z4TKRv1fq2Gue1FNJbbjw8elvC9LWfTlwynWd5ktqIf1BD
	gBVml07w==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qptk0-00EClp-Pa; Mon, 09 Oct 2023 19:08:24 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.97-RC0)
	(envelope-from <aurelien@aurel32.net>)
	id 1qptjz-00000009abq-1RYE;
	Mon, 09 Oct 2023 19:08:23 +0200
Date: Mon, 9 Oct 2023 19:08:23 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Rob Herring <robh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Wenting Zhang <zephray@outlook.com>, Guo Ren <guoren@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH -next v21 14/27] riscv: signal: Add sigcontext
 save/restore for vector
Message-ID: <ZSQzhzw3LpbJ8rSx@aurel32.net>
Mail-Followup-To: Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Rob Herring <robh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Wenting Zhang <zephray@outlook.com>, Guo Ren <guoren@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Al Viro <viro@zeniv.linux.org.uk>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-15-andy.chiu@sifive.com>
 <ZSJ0K5JFrglyJY8o@aurel32.net>
 <CABgGipVQ3j+Njw1CDkD9cuDwTwR2-WqF7Y_yZt3NPipAedK_2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipVQ3j+Njw1CDkD9cuDwTwR2-WqF7Y_yZt3NPipAedK_2Q@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_100841_229273_9A33C81A 
X-CRM114-Status: GOOD (  28.94  )
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

SGksCgpPbiAyMDIzLTEwLTA5IDAxOjIzLCBBbmR5IENoaXUgd3JvdGU6Cj4gT24gU3VuLCBPY3Qg
OCwgMjAyMyBhdCA2OjE54oCvUE0gQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0
PiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBPbiAyMDIzLTA2LTA1IDExOjA3LCBBbmR5IENo
aXUgd3JvdGU6Cj4gPiA+IEZyb206IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5j
b20+Cj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggZmFjaWxpdGF0ZXMgdGhlIGV4aXN0aW5nIGZwLXJl
c2VydmVkIHdvcmRzIGZvciBwbGFjZW1lbnQgb2YKPiA+ID4gdGhlIGZpcnN0IGV4dGVuc2lvbidz
IGNvbnRleHQgaGVhZGVyIG9uIHRoZSB1c2VyJ3Mgc2lnZnJhbWUuIEEgY29udGV4dAo+ID4gPiBo
ZWFkZXIgY29uc2lzdHMgb2YgYSBkaXN0aW5jdCBtYWdpYyB3b3JkIGFuZCB0aGUgc2l6ZSwgaW5j
bHVkaW5nIHRoZQo+ID4gPiBoZWFkZXIgaXRzZWxmLCBvZiBhbiBleHRlbnNpb24gb24gdGhlIHN0
YWNrLiBUaGVuLCB0aGUgZnJhbWUgaXMgZm9sbG93ZWQKPiA+ID4gYnkgdGhlIGNvbnRleHQgb2Yg
dGhhdCBleHRlbnNpb24sIGFuZCB0aGVuIGEgaGVhZGVyICsgY29udGV4dCBib2R5IGZvcgo+ID4g
PiBhbm90aGVyIGV4dGVuc2lvbiBpZiBleGlzdHMuIElmIHRoZXJlIGlzIG5vIG1vcmUgZXh0ZW5z
aW9uIHRvIGNvbWUsIHRoZW4KPiA+ID4gdGhlIGZyYW1lIG11c3QgYmUgZW5kZWQgd2l0aCBhIG51
bGwgY29udGV4dCBoZWFkZXIuIEEgc3BlY2lhbCBjYXNlIGlzCj4gPiA+IHJ2NjRnYywgd2hlcmUg
dGhlIGtlcm5lbCBzdXBwb3J0IG5vIGV4dGVuc2lvbnMgcmVxdWlyaW5nIHRvIGV4cG9zZQo+ID4g
PiBhZGRpdGlvbmFsIHJlZ2ZpbGUgdG8gdGhlIHVzZXIuIEluIHN1Y2ggY2FzZSB0aGUga2VybmVs
IHdvdWxkIHBsYWNlIHRoZQo+ID4gPiBudWxsIGNvbnRleHQgaGVhZGVyIHJpZ2h0IGFmdGVyIHRo
ZSBmaXJzdCByZXNlcnZlZCB3b3JkIG9mCj4gPiA+IF9fcmlzY3ZfcV9leHRfc3RhdGUgd2hlbiBz
YXZpbmcgc2lnZnJhbWUuIEFuZCB0aGUga2VybmVsIHdvdWxkIGNoZWNrIGlmCj4gPiA+IGFsbCBy
ZXNlcnZlZCB3b3JkcyBhcmUgemVyb3Mgd2hlbiBhIHNpZ25hbCBoYW5kbGVyIHJldHVybnMuCj4g
PiA+Cj4gPiA+IF9fcmlzY3ZfcV9leHRfc3RhdGUtLS0tPnwgICAgIHw8LV9fcmlzY3ZfZXh0cmFf
ZXh0X2hlYWRlcgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgfiAgICAgICB+Cj4gPiA+ICAg
ICAgIC5yZXNlcnZlZFswXS0tLT58MCAgICAgIHw8LSAgICAgLnJlc2VydmVkCj4gPiA+ICAgICAg
ICAgICAgICAgPC0tLS0tLS18bWFnaWMgIHw8LSAgICAgLmhkcgo+ID4gPiAgICAgICAgICAgICAg
IHwgICAgICAgfHNpemUgICB8X19fX19fXyBlbmQgb2Ygc2NfZnByZWdzCj4gPiA+ICAgICAgICAg
ICAgICAgfCAgICAgICB8ZXh0LWJkeXwKPiA+ID4gICAgICAgICAgICAgICB8ICAgICAgIH4gICAg
ICAgfgo+ID4gPiAgICAgICArKXNpemUgIC0tLS0tLS0+fG1hZ2ljICB8PC0gYW5vdGhlciBjb250
ZXh0IGhlYWRlcgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgfHNpemUgICB8Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICB8ZXh0LWJkeXwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
IH4gICAgICAgfgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgfG1hZ2ljOjB8PC0gbnVsbCBj
b250ZXh0IGhlYWRlcgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgfHNpemU6MCB8Cj4gPiA+
Cj4gPiA+IFRoZSB2ZWN0b3IgcmVnaXN0ZXJzIHdpbGwgYmUgc2F2ZWQgaW4gZGF0YXAgcG9pbnRl
ci4gVGhlIGRhdGFwIHBvaW50ZXIKPiA+ID4gd2lsbCBiZSBhbGxvY2F0ZWQgZHluYW1pY2FsbHkg
d2hlbiB0aGUgdGFzayBuZWVkcyBpbiBrZXJuZWwgc3BhY2UuIE9uCj4gPiA+IHRoZSBvdGhlciBo
YW5kLCBkYXRhcCBwb2ludGVyIG9uIHRoZSBzaWdmcmFtZSB3aWxsIGJlIHNldCByaWdodCBhZnRl
cgo+ID4gPiB0aGUgX19yaXNjdl92X2V4dF9zdGF0ZSBkYXRhIHN0cnVjdHVyZS4KPiA+Cj4gPiBJ
dCBhcHBlYXJzIHRoYXQgdGhpcyBwYXRjaCBzb21laG93IGJyZWFrcyB1c2VybGFuZCwgYXQgbGVh
c3QgdGhlIHJ1c3QKPiA+IGNvbXBpbGVyLiBUaGlzIGNhbiBiZSBvYnNlcnZlZCBmb3IgaW5zdGFu
Y2UgYnkgYnVpbGRpbmcgdGhlIHJ1c3QtbHNkCj4gPiBwYWNrYWdlIGluIERlYmlhbiwgYnV0IG1h
bnkgb3RoZXIgcnVzdCBwYWNrYWdlcyBhcmUgYWxzbyBhZmZlY3RlZDoKPiAKPiBTb3JyeSBmb3Ig
dGhlIHRpbWUgc3BlbnQgb24gcGlucG9pbnRpbmcgdGhlIGlzc3VlLiBZZXMsIHRoaXMgaXMgYSBi
dWcKPiBhbmQgd2UgaGFkIGEgZml4IFsxXS4gVGhpcyBmaXggd2FzIGFjY2lkZW50bHkgbm90IGdl
dHRpbmcgaW50byB0aGUKPiAtZml4ZXMgYnJhbmNoLCBidXQgaXQgd2lsbC4gQW5kIGl0IHNob3Vs
ZCBiZSBnb2luZyBpbnRvIGxpbnV4IHN0YWJsZQo+IGFzIHdlbGwsIHRob3VnaCBJIGFtIG5vdCBj
ZXJ0YWluIGFib3V0IHRoZSB0aW1pbmcuIE90aGVyd2lzZSwgdGhpcyBidWcKPiBtYXkgcG90ZW50
aWFsbHkgYnJlYWsgYW55IHByb2Nlc3NlcyB3aGljaCBhbGxvY2F0ZSBhIHNpZ2FsdHN0YWNrIGF0
IGFuCj4gYWRkcmVzcyBoaWdoZXIgdGhhbiB0aGVpciBzdGFjay4KClRoYW5rcyBmb3IgdGhlIHBv
aW50ZXIsIEkgc29tZWhvdyBtaXNzZWQgdGhhdCBwYXRjaCB3aGVuIGxvb2tpbmcgZm9yIGEKcG90
ZW50aWFsIGZpeCBvbiB0aGUgbWFpbGluZyBsaXN0LiBJIGhhdmUganVzdCB0cmllZCBpdCwgYW5k
IEkgY29uZmlybQppdCBmaXhlcyB0aGUgaXNzdWUuIExldCdzIGhvcGUgaXQgY2FuIGdldCBtZXJn
ZWQgc29vbi4KClJlZ2FyZHMKQXVyZWxpZW4KCi0tIApBdXJlbGllbiBKYXJubyAgICAgICAgICAg
ICAgICAgICAgICAgICAgR1BHOiA0MDk2Ui8xREREOEM5QgphdXJlbGllbkBhdXJlbDMyLm5ldCAg
ICAgICAgICAgICAgICAgICAgIGh0dHA6Ly9hdXJlbDMyLm5ldAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
