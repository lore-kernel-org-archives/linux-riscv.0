Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F249BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00lDH60WXWhBLxQWCzUBjKMtCLqgBEHFLg4yAHNW6ME=; b=ZUZs8a3XnlLfpW
	Ggu8xc+u6aHXRVHjnX4KXxsWiOkYUimmreN6sCQLZUsv0xMCTGGGxTNo0BMVddzzp4Qx16PpLNafE
	WpUXtykVWeJk4xBfvL88rv+gbFXJGCwSveGp7faDaK87XNyzoslQjDw7utavkzg6+OgLZ7Nh7ncnJ
	xl0oFsvWpjzQqfNMettiZDt0IfJv3LpV0XQ5BayZ5TMw+oQTPONacDEyiS0SRI+0IoB1wGT1GKcoX
	/9V3FBamvxEaY/8o0/033PEvCI3BaXe2tlfDZFwSa5mNPa3NPjByiFMdk+l8nwUnjBOBTG2aF5fbD
	qD+fUZpCI375XLa5qANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSGW-0000000G1oI-2r7d;
	Tue, 30 Jun 2026 06:48:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSGV-0000000G1ny-0Wd5
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 06:48:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4F9C43EE4
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 06:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1411F0155C
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 06:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782802094;
	bh=GmOeYBnH+pucvx3tPfeJ0XPPeaBlbElUu+Q/ZIKymgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gQbUHPxhEiH2raHpZIN6oBRl9E+1UD3QUNT2Fw4BPeFQ+WDHDN+zFU6PwALsNMK05
	 2WjNlTS+FoMmA2fr/tFjj4GhPIvIc9cC2METu1pc6GLfvit78DT+DLQV/gs1JE0hbt
	 fgb31zwcDdQo31BoonXIRM6Fq/apx7UcxVtwwsvPyNwkqB88Yh/LevTtxWfRLdoZMZ
	 rGXNGVVtUgJi44UaN8zODBgy2aNOsaQGrrILL7pUJP5D7qUzL9mSiRR3za3IxR1s/f
	 4WmaLujPY3xb+FTws1zpYt90YJaXS77LpBoqsRjCJKuubo6YxPtNvlspKmDadlCY35
	 LSZgNK5KCJ5eg==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4624a44e152so3779823f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 23:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+SeqzUu8H4cJ+mJHio6HnwgEyphUI62DLrDVrT+N0M7QLtox9XnRyXEWliA2uY69QAH+RbFTZ0zvqLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHxxAsyHPkdiPIUIeOjxDKb00F0TME+uXKGieSLhEY7BcNmola
	L6QbTNUc1y2VAO6FF3+JhRDer76RIWl2VDCvLa8isI3srGz8EfylyJzNd3AZpWspOf8IDrd4Yl/
	NFuGNU0rUEgHDjfGqrYXs2atgehr5fq8=
X-Received: by 2002:a5d:5d06:0:b0:475:f100:3600 with SMTP id
 ffacd0b85a97d-475f100372fmr683383f8f.61.1782802093102; Mon, 29 Jun 2026
 23:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260630045531.3939-1-kprateek.nayak@amd.com> <20260630045531.3939-5-kprateek.nayak@amd.com>
In-Reply-To: <20260630045531.3939-5-kprateek.nayak@amd.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Jun 2026 14:47:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTi3EJj7NrOEZ0GF21VxfyUFujnaGbRmLuYy1_YcPkbDw@mail.gmail.com>
X-Gm-Features: AVVi8Cc9p7eoaCe7f58H6IC6apx1iBlYENd1M3Ce4o3oou9E96K3mWDK4f0IxWE
Message-ID: <CAJF2gTTi3EJj7NrOEZ0GF21VxfyUFujnaGbRmLuYy1_YcPkbDw@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] riscv/runtime-const: Replace open-coded
 placeholder with RUNTIME_MAGIC
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Jisheng Zhang <jszhang@kernel.org>
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

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTI6NTfigK9QTSBLIFByYXRlZWsgTmF5YWsgPGtwcmF0
ZWVrLm5heWFrQGFtZC5jb20+IHdyb3RlOgo+Cj4gRGVmaW5lIHRoZSBwbGFjZWhvbGRlciB1c2Vk
IGZvciBsdWkgKyBhZGRpW3ddIHBhdGNoaW5nIHNlcXVlbmNlIGFzCj4gUlVOVElNRV9NQUdJQyBh
bmQgdXNlIHRoYXQgaW5zdGVhZCBvZiBvcGVuIGNvZGluZyB0aGUgY29uc3RhbnRzIGluIHRoZQo+
IGlubGluZSBhc3NlbWJseS4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnRlbmRlZC4KPgo+
IFN1Z2dlc3RlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6
IENoYXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgo+IFRlc3RlZC1i
eTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSyBQcmF0ZWVrIE5heWFrIDxrcHJhdGVlay5uYXlha0BhbWQuY29tPgo+IC0tLQo+
IGNoYW5nZWxvZyB2NC4udjU6Cj4KPiBvIENvbGxlY3RlZCB0YWdzIGZyb20gQ2hhcmxpZSAoVGhh
bmtzIGEgdG9uISkKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0
LmggfCAzOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3J1
bnRpbWUtY29uc3QuaAo+IGluZGV4IDkwMGRiMGExMDNkMDUuLjFjZTAyNjA1ZDJlNDMgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3J1bnRpbWUtY29uc3QuaAo+IEBAIC0xNSwyMSArMTUsMjMg
QEAKPgo+ICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+Cj4gKyNkZWZpbmUgUlVOVElNRV9N
QUdJQyBfX0FTTV9TVFIoMHg4OUFCQ0RFRikKPiArCj4gICNpZmRlZiBDT05GSUdfMzJCSVQKPiAt
I2RlZmluZSBydW50aW1lX2NvbnN0X3B0cihzeW0pICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+IC0oeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICB0eXBlb2Yoc3ltKSBfX3JldDsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgIGFzbV9pbmxpbmUoIi5vcHRp
b24gcHVzaFxuXHQiICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAg
ICAiLm9wdGlvbiBub3J2Y1xuXHQiICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAg
ICAgICAgICAgICAgICIxOlx0IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiAtICAgICAgICAgICAgICAgImx1aSAgICAlW19fcmV0XSwweDg5YWJkXG5cdCIgICAg
ICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAgICAiYWRkaSAgICVbX19yZXRdLCVbX19y
ZXRdLC0weDIxMVxuXHQiICAgICAgICAgICBcCj4gLSAgICAgICAgICAgICAgICIub3B0aW9uIHBv
cFxuXHQiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAg
Ii5wdXNoc2VjdGlvbiBydW50aW1lX3B0cl8iICNzeW0gIixcImFcIlxuXHQiICAgXAo+IC0gICAg
ICAgICAgICAgICAiLmxvbmcgMWIgLSAuXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gLSAgICAgICAgICAgICAgICIucG9wc2VjdGlvbiIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgOiBbX19yZXRdICI9ciIgKF9fcmV0KSk7
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgX19yZXQ7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyNkZWZpbmUgcnVudGltZV9j
b25zdF9wdHIoc3ltKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgIHR5cGVvZihzeW0pIF9fcmV0OyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBhc21faW5saW5l
KCIub3B0aW9uIHB1c2hcblx0IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBub3J2Y1xuXHQiICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIjE6XHQiICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICJs
dWkgICAgJVtfX3JldF0sICUlaGkoIiBSVU5USU1FX01BR0lDICIpXG5cdCIgICAgICAgICAgXAo+
ICsgICAgICAgICAgICAgICAiYWRkaSAgICVbX19yZXRdLCVbX19yZXRdLCAlJWxvKCIgUlVOVElN
RV9NQUdJQyAiKVxuXHQiIFwKPiArICAgICAgICAgICAgICAgIi5vcHRpb24gcG9wXG5cdCIgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIu
cHVzaHNlY3Rpb24gcnVudGltZV9wdHJfIiAjc3ltICIsXCJhXCJcblx0IiAgICAgICAgICAgXAo+
ICsgICAgICAgICAgICAgICAiLmxvbmcgMWIgLSAuXG5cdCIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIi5wb3BzZWN0aW9uIiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIDog
W19fcmV0XSAiPXIiIChfX3JldCkpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ICsgICAgICAgX19yZXQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAgfSkKPiAgI2Vsc2UKPiAgLyoKPiBAQCAtNDYsMTAgKzQ4LDEw
IEBACj4gICAgICAgICAiLm9wdGlvbiBwdXNoXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICIub3B0aW9uIG5vcnZjXG5cdCIgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgIjE6XHQiICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICAibHVpICAgICVb
X19yZXRdLDB4ODlhYmRcblx0IiAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAg
ICJsdWkgICAgJVtfX3RtcF0sMHgxMjM0XG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+IC0gICAgICAgImFkZGl3ICAlW19fcmV0XSwlW19fcmV0XSwtMHgyMTFcblx0IiAgICAgICAg
ICAgICAgICAgICBcCj4gLSAgICAgICAiYWRkaXcgICVbX190bXBdLCVbX190bXBdLDB4NTY3XG5c
dCIgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICJsdWkgICAgJVtfX3JldF0sICUlaGko
IiBSVU5USU1FX01BR0lDICIpXG5cdCIgICAgICAgICAgXAo+ICsgICAgICAgImx1aSAgICAlW19f
dG1wXSwgJSVoaSgiIFJVTlRJTUVfTUFHSUMgIilcblx0IiAgICAgICAgICBcCj4gKyAgICAgICAi
YWRkaXcgICVbX19yZXRdLCVbX19yZXRdLCAlJWxvKCIgUlVOVElNRV9NQUdJQyAiKVxuXHQiIFwK
PiArICAgICAgICJhZGRpdyAgJVtfX3RtcF0sJVtfX3RtcF0sICUlbG8oIiBSVU5USU1FX01BR0lD
ICIpXG5cdCIgXApMR1RNIQoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
PgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
