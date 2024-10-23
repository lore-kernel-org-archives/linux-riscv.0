Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B77CF5392
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F56bqbctHoa75OVOpdAFt8gn8Y4edV0akbbfSnaPlmE=; b=aXzGcDTkZjLvMa
	B6HTKp/HIxJK3XpZTNxD3ipsv9i92ibeceMlqf5ay99OQUEV3IEcKT+F1ECJtaTO6atx6xmVr3Xmq
	T9cKvLeR8X0DY7gVAk8j7VDAH/0WHadTeDZshlxmw8rU3XJ+Y5tLUVlJ66HAhoHPVvFzIHbBp1E+9
	5JYD8niSd5Zk7miVDU6DakCtVPh8GZnFz/pocKuio3aencCw/5Tl0Q2R6ZmzfaiTZArjljIGOYgvv
	A80UXKiLmRCElQpJAWzpBk9gdzaJjUHDW8so9sBYt9aL2TRcc/iOhvvkAgBM3z5g9QGFzD1/baYmB
	l8NyogGBC0zTUE1QYw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cIx-0000000EgkR-3XK4;
	Wed, 23 Oct 2024 14:25:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cIu-0000000EgiG-0F5r
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 14:25:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d808ae924so4804058f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1729693538; x=1730298338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAAn5kPuNQNsFVWUY6sfnOq+1F6tSClgu6q4tnZMMF8=;
        b=IysfhV/TDb2XyYWXxEsntrswUGCej2X6p6zSWMym8hzjYQa6J6+jiTFTefZE6B2jeZ
         gipkokI3yfyrc7KO/txy86BfRU4OdHf9yk8Tv5ROKFqKGXlWDwYFZtcPOwF3IKAHy3av
         Oixct/JU7xs11SwAzV6X2V3UDn4U929OGtIL1uMs0t+iYGGZInCJA9Ksydf0KtBRqH+O
         a0Krq/GhdurTbVlP+AAVbTiNKIHSqjxkMqyVMVNK/uzLQv3fUn14S4DnlfDbCJEhmUek
         WI/oUBpqkTHO8IMIKCA6L9QLbtUOqc2kPTPV1BFQsF9QlcTvaAXOgMbR9BMGso9aK7qK
         1uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729693538; x=1730298338;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KAAn5kPuNQNsFVWUY6sfnOq+1F6tSClgu6q4tnZMMF8=;
        b=rEOmega+Q9pg0SF6ok8kR7xPPdBIXioqG5tHT8MsDJIbW3RfZYkzvwm2a3mIJNgCxa
         7WnBPRLk7T9YS5h+yGEy4ee/vPlq+F6CSHAph6hmgf55wWz2v99FIEgDokrQ5leYgSw6
         d44b093/l6fpcPlwnexsf03y1CjBeu/DijGB85jIFYwcLeFA+VJttl6f0Xdv7ea8mJlA
         P56zVSIkys8C/9DXUzmDuVDw2Eniq0Pn/n3WF0HjwndU7HRCYUQA9YfW1BCiOPs3x2Bx
         BFZQRwGw7qRBnHK9EzI6ttyrMKVfB8wBBZgLXYiH46+BylJZxhID2o8LPZS0AFB9BrIl
         liWA==
X-Forwarded-Encrypted: i=1; AJvYcCX8YmuXV0OhICkDcV6m+d+fokPm4Bw8LucZiXTWea5TT6bAlIMMToLrsCtYqJQV64x6jbQNAOV4tzYNgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjLSGucUwV4jnpw9palj/nERaV3y9sAACNNsDCTXJaYo3ooBLo
	hsW9QgL/31sYq7zntcskNfN+n6g0R3KyCM190kiXScXeNLApEQFcgR3xSHaC6xA=
X-Google-Smtp-Source: AGHT+IH6jVXQh4hL/d9WafdER0ekPEytRlJ6cLK7k+UAKu5Om/+ImrICrtNuDGQ6EVFGukI2hOoWag==
X-Received: by 2002:a05:6000:1e50:b0:37d:485b:b68d with SMTP id ffacd0b85a97d-37efceede09mr2011658f8f.2.1729693537734;
        Wed, 23 Oct 2024 07:25:37 -0700 (PDT)
Received: from localhost ([149.57.114.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186beffd5sm17612115e9.24.2024.10.23.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:25:37 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: palmer@dabbelt.com
Cc: conor@kernel.org,  punit.agrawal@bytedance.com,
  paul.walmsley@sifive.com,  aou@eecs.berkeley.edu,
  akpm@linux-foundation.org,  surenb@google.com,  peterx@redhat.com,
  alexghiti@rivosinc.com,  willy@infradead.org,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,  Andrew
 Jones <ajones@ventanamicro.com>, yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v3] riscv/mm/fault: add show_pte() before die()
In-Reply-To: <CAEEQ3wmOKtfMyRYnmEcHcczuRhPjMC8g_rxQc9y3X9gOuaqS0Q@mail.gmail.com>
	(yunhui cui's message of "Wed, 18 Sep 2024 11:44:05 +0800")
References: <20240723021820.87718-1-cuiyunhui@bytedance.com>
	<CAEEQ3w=hsAEp8t+eH1GQW4M9ZY2TPXGUuhyNLB5DFEo88vwDZA@mail.gmail.com>
	<CAEEQ3wmOKtfMyRYnmEcHcczuRhPjMC8g_rxQc9y3X9gOuaqS0Q@mail.gmail.com>
Date: Wed, 23 Oct 2024 15:25:36 +0100
Message-ID: <87ed46galb.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_072540_164584_B03D5B0C 
X-CRM114-Status: GOOD (  22.66  )
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

eXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gSGkgUGFsbWVy
LAo+Cj4gQSBnZW50bGUgcGluZyBmb3IgdGhpcyBwYXRjaC4KPgo+IE9uIFRodSwgQXVnIDE1LCAy
MDI0IGF0IDEwOjA14oCvQU0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdy
b3RlOgo+Pgo+PiBIaSBBbGwsCj4+Cj4+IEEgZ2VudGxlIHBpbmcsIEFueSBtb3JlIGNvbW1lbnRz
IG9uIHRoaXMgcGF0Y2g/Cj4+Cj4+IE9uIFR1ZSwgSnVsIDIzLCAyMDI0IGF0IDEwOjE44oCvQU0g
WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+PiA+Cj4+ID4gV2hl
biB0aGUga2VybmVsIGRpc3BsYXlzICJVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVx
dWVzdCBhdAo+PiA+IHZpcnR1YWwgYWRkcmVzcyIsIHdlIHdvdWxkIGxpa2UgdG8gY29uZmlybSB0
aGUgc3RhdHVzIG9mIHRoZSB2aXJ0dWFsCj4+ID4gYWRkcmVzcyBpbiB0aGUgcGFnZSB0YWJsZS4g
U28gYWRkIHNob3dfcHRlKCkgYmVmb3JlIGRpZSgpLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTog
WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4+ID4gUmV2aWV3ZWQtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPj4gPiBSZXZpZXdlZC1ieTog
QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPj4gPiAtLS0KPj4gPiAgYXJj
aC9yaXNjdi9tbS9mYXVsdC5jIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQoKQW5vdGhl
ciBvbmUgdGhhdCBzZWVtcyB0byBoYXZlIHNsaXBwZWQgdGhyb3VnaCB0aGUgY3JhY2tzLiBJZiB0
aGVyZSBhcmUKbm8gZnVydGhlciBjb21tZW50cywgcGxlYXNlIG1lcmdlIHRoZSBwYXRjaC4KClRo
YW5rcywKUHVuaXQKCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5j
IGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4+ID4gaW5kZXggNTIyNGYzNzMzODAyLi5jNzJlNmM3
YzA5ZWYgMTAwNjQ0Cj4+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4+ID4gKysrIGIv
YXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4+ID4gQEAgLTIyLDYgKzIyLDU3IEBACj4+ID4KPj4gPiAg
I2luY2x1ZGUgIi4uL2tlcm5lbC9oZWFkLmgiCj4+ID4KPj4gPiArc3RhdGljIHZvaWQgc2hvd19w
dGUodW5zaWduZWQgbG9uZyBhZGRyKQo+PiA+ICt7Cj4+ID4gKyAgICAgICBwZ2RfdCAqcGdkcCwg
cGdkOwo+PiA+ICsgICAgICAgcDRkX3QgKnA0ZHAsIHA0ZDsKPj4gPiArICAgICAgIHB1ZF90ICpw
dWRwLCBwdWQ7Cj4+ID4gKyAgICAgICBwbWRfdCAqcG1kcCwgcG1kOwo+PiA+ICsgICAgICAgcHRl
X3QgKnB0ZXAsIHB0ZTsKPj4gPiArICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVu
dC0+bW07Cj4+ID4gKwo+PiA+ICsgICAgICAgaWYgKCFtbSkKPj4gPiArICAgICAgICAgICAgICAg
bW0gPSAmaW5pdF9tbTsKPj4gPiArCj4+ID4gKyAgICAgICBwcl9hbGVydCgiQ3VycmVudCAlcyBw
Z3RhYmxlOiAlbHVLIHBhZ2VzaXplLCAlZC1iaXQgVkFzLCBwZ2RwPTB4JTAxNmxseFxuIiwKPj4g
PiArICAgICAgICAgICAgICAgIGN1cnJlbnQtPmNvbW0sIFBBR0VfU0laRSAvIFNaXzFLLCBWQV9C
SVRTLAo+PiA+ICsgICAgICAgICAgICAgICAgbW0gPT0gJmluaXRfbW0gPyAodTY0KV9fcGFfc3lt
Ym9sKG1tLT5wZ2QpIDogdmlydF90b19waHlzKG1tLT5wZ2QpKTsKPj4gPiArCj4+ID4gKyAgICAg
ICBwZ2RwID0gcGdkX29mZnNldChtbSwgYWRkcik7Cj4+ID4gKyAgICAgICBwZ2QgPSBwZ2RwX2dl
dChwZ2RwKTsKPj4gPiArICAgICAgIHByX2FsZXJ0KCJbJTAxNmx4XSBwZ2Q9JTAxNmx4IiwgYWRk
ciwgcGdkX3ZhbChwZ2QpKTsKPj4gPiArICAgICAgIGlmIChwZ2Rfbm9uZShwZ2QpIHx8IHBnZF9i
YWQocGdkKSB8fCBwZ2RfbGVhZihwZ2QpKQo+PiA+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsK
Pj4gPiArCj4+ID4gKyAgICAgICBwNGRwID0gcDRkX29mZnNldChwZ2RwLCBhZGRyKTsKPj4gPiAr
ICAgICAgIHA0ZCA9IHA0ZHBfZ2V0KHA0ZHApOwo+PiA+ICsgICAgICAgcHJfY29udCgiLCBwNGQ9
JTAxNmx4IiwgcDRkX3ZhbChwNGQpKTsKPj4gPiArICAgICAgIGlmIChwNGRfbm9uZShwNGQpIHx8
IHA0ZF9iYWQocDRkKSB8fCBwNGRfbGVhZihwNGQpKQo+PiA+ICsgICAgICAgICAgICAgICBnb3Rv
IG91dDsKPj4gPiArCj4+ID4gKyAgICAgICBwdWRwID0gcHVkX29mZnNldChwNGRwLCBhZGRyKTsK
Pj4gPiArICAgICAgIHB1ZCA9IHB1ZHBfZ2V0KHB1ZHApOwo+PiA+ICsgICAgICAgcHJfY29udCgi
LCBwdWQ9JTAxNmx4IiwgcHVkX3ZhbChwdWQpKTsKPj4gPiArICAgICAgIGlmIChwdWRfbm9uZShw
dWQpIHx8IHB1ZF9iYWQocHVkKSB8fCBwdWRfbGVhZihwdWQpKQo+PiA+ICsgICAgICAgICAgICAg
ICBnb3RvIG91dDsKPj4gPiArCj4+ID4gKyAgICAgICBwbWRwID0gcG1kX29mZnNldChwdWRwLCBh
ZGRyKTsKPj4gPiArICAgICAgIHBtZCA9IHBtZHBfZ2V0KHBtZHApOwo+PiA+ICsgICAgICAgcHJf
Y29udCgiLCBwbWQ9JTAxNmx4IiwgcG1kX3ZhbChwbWQpKTsKPj4gPiArICAgICAgIGlmIChwbWRf
bm9uZShwbWQpIHx8IHBtZF9iYWQocG1kKSB8fCBwbWRfbGVhZihwbWQpKQo+PiA+ICsgICAgICAg
ICAgICAgICBnb3RvIG91dDsKPj4gPiArCj4+ID4gKyAgICAgICBwdGVwID0gcHRlX29mZnNldF9t
YXAocG1kcCwgYWRkcik7Cj4+ID4gKyAgICAgICBpZiAoIXB0ZXApCj4+ID4gKyAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+PiA+ICsKPj4gPiArICAgICAgIHB0ZSA9IHB0ZXBfZ2V0KHB0ZXApOwo+
PiA+ICsgICAgICAgcHJfY29udCgiLCBwdGU9JTAxNmx4IiwgcHRlX3ZhbChwdGUpKTsKPj4gPiAr
ICAgICAgIHB0ZV91bm1hcChwdGVwKTsKPj4gPiArb3V0Ogo+PiA+ICsgICAgICAgcHJfY29udCgi
XG4iKTsKPj4gPiArfQo+PiA+ICsKPj4gPiAgc3RhdGljIHZvaWQgZGllX2tlcm5lbF9mYXVsdChj
b25zdCBjaGFyICptc2csIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gPiAgICAgICAgICAgICAgICAg
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ID4gIHsKPj4gPiBAQCAtMzEsNiArODIsNyBAQCBzdGF0
aWMgdm9pZCBkaWVfa2VybmVsX2ZhdWx0KGNvbnN0IGNoYXIgKm1zZywgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+PiA+ICAgICAgICAgICAgICAgICBhZGRyKTsKPj4gPgo+PiA+ICAgICAgICAgYnVzdF9z
cGlubG9ja3MoMCk7Cj4+ID4gKyAgICAgICBzaG93X3B0ZShhZGRyKTsKPj4gPiAgICAgICAgIGRp
ZShyZWdzLCAiT29wcyIpOwo+PiA+ICAgICAgICAgbWFrZV90YXNrX2RlYWQoU0lHS0lMTCk7Cj4+
ID4gIH0KPj4gPiAtLQo+PiA+IDIuMzkuMgo+PiA+Cj4+Cj4+IFRoYW5rcywKPj4gWXVuaHVpCj4K
Pgo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
