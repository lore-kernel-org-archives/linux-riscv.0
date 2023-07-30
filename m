Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C0EEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 05:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdozVpCoMTivQkpI8gJhpy9kc2amRYoL1eMQ97tlfqA=; b=MwiXHbNRMYFJC9
	y7I6YiEnWhcZfs4EqLvycUDHY2ZN2R9geTbt/nh/FwswPFgNDts7pRo0tsQKpvB00qdv6H05mltiS
	p0Q8U+H+SlL8dRlPfT9FhE3oGjXf426Kx1WI/f/9kjqWTztiO7KCQ0rg7UwunzX+t00W0Wc/I2SQo
	699yE/Qmn6uq77693RXH1aS6vIvBsFTiWnhaaxR75Qeya5X/qz4CI6Jhj3HjuZ1S2iKN8KUTHDd9L
	kqQD12uN+6qV5hSwSgktv4aSJphNaTNHpqIA1+T5uEQAp3zFV6ndAaNeeFrEht22dcwjQWJQRHrck
	U/F2v5mqzxRdXceo8ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPyfW-00A2I7-0f;
	Sun, 30 Jul 2023 05:08:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPyfR-00A2HV-0i
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 05:08:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D3C160BA3
	for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 05:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E012FC433CD
	for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 05:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690693710;
	bh=XpeJJeL0WZEhViGFyUqsZL1awMfqrIn2dAk+4dHsN/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IZ+cRMVQdtYhnnmfNb5b+pamm1g1ZYESKZ9wch6UkSvECZGGJ5uv8Hfo7mJxExgfH
	 7WNSeQlq4QFappAaFFhAe/qDZo0KhRDhuadE3r7Hs75fXyah3AcIijt+rY0NWektVC
	 vrg3nIUUf0J2r8QJJq2inKYLMcJIM6TX3uFqoNUaMwQ7z/anzFWbDXBvquaDbS17or
	 LI69T67tOEn7xPXyYHo1pfG9bEEw+TycuMSv3dCiai0DhBpWhsbzLEvpGxeACbPTeq
	 mLA75lOaTHfc83HFcirV6IBvSePbharTLI0VJ1+cnxuuRKWRWqKeoALfAXxe4J5pcH
	 d0HBTvLoqVwbA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bcfe28909so478547666b.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Jul 2023 22:08:30 -0700 (PDT)
X-Gm-Message-State: ABy/qLZm7tbmq+SR2y3DGMsmMsOfavAH2c44WQtjhW0SKHqKWRK8/HRd
	zqNLThmxGZKJsC0fBNdG6ZeVK7cnOxqxzvmvpo8=
X-Google-Smtp-Source: APBJJlG33jDViSYrDkErS/CQJtTrUVb2jig4MFHtRtnqUjG3GGtNTNTD7veq9WS1yay4/EUcPFaz61OsEcVQktlB8lc=
X-Received: by 2002:a17:906:101a:b0:99b:d9f3:9a98 with SMTP id
 26-20020a170906101a00b0099bd9f39a98mr3227051ejm.74.1690693709138; Sat, 29 Jul
 2023 22:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230725132246.817726-1-alexghiti@rivosinc.com>
In-Reply-To: <20230725132246.817726-1-alexghiti@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jul 2023 01:08:17 -0400
X-Gmail-Original-Message-ID: <CAJF2gTRm59RAJvSf=L2uqbb3rHnANVheO+yLqrJGuVBh1w8Oug@mail.gmail.com>
Message-ID: <CAJF2gTRm59RAJvSf=L2uqbb3rHnANVheO+yLqrJGuVBh1w8Oug@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Implement flush_cache_vmap()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_220833_372676_56EA81A8 
X-CRM114-Status: GOOD (  19.08  )
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgOToyMuKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgUklTQy1WIGtlcm5lbCBuZWVkcyBhIHNm
ZW5jZS52bWEgYWZ0ZXIgYSBwYWdlIHRhYmxlIG1vZGlmaWNhdGlvbjogd2UKPiB1c2VkIHRvIHJl
bHkgb24gdGhlIHZtYWxsb2MgZmF1bHQgaGFuZGxpbmcgdG8gZW1pdCBhbiBzZmVuY2Uudm1hLCBi
dXQKPiBjb21taXQgN2QzMzMyYmUwMTFlICgicmlzY3Y6IG1tOiBQcmUtYWxsb2NhdGUgUEdEIGVu
dHJpZXMgZm9yCj4gdm1hbGxvYy9tb2R1bGVzIGFyZWEiKSBnb3QgcmlkIG9mIHRoaXMgcGF0aCBm
b3IgNjQtYml0IGtlcm5lbHMsIHNvIG5vdyB3ZQo+IG5lZWQgdG8gZXhwbGljaXRseSBlbWl0IGEg
c2ZlbmNlLnZtYSBpbiBmbHVzaF9jYWNoZV92bWFwKCkuCj4KPiBOb3RlIHRoYXQgd2UgZG9uJ3Qg
bmVlZCB0byBpbXBsZW1lbnQgZmx1c2hfY2FjaGVfdnVubWFwKCkgYXMgdGhlIGdlbmVyaWMKPiBj
b2RlIHNob3VsZCBlbWl0IGEgZmx1c2ggdGxiIGFmdGVyIHVubWFwcGluZyBhIHZtYWxsb2MgcmVn
aW9uLgo+Cj4gRml4ZXM6IDdkMzMzMmJlMDExZSAoInJpc2N2OiBtbTogUHJlLWFsbG9jYXRlIFBH
RCBlbnRyaWVzIGZvciB2bWFsbG9jL21vZHVsZXMgYXJlYSIpCj4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+IGluZGV4IDgw
OTFiOGJmNDg4My4uYjkzZmZkZGY4YTYxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY2FjaGVmbHVzaC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZs
dXNoLmgKPiBAQCAtMzcsNiArMzcsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2RjYWNo
ZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ICAjZGVmaW5lIGZsdXNoX2ljYWNoZV91c2VyX3Bh
Z2Uodm1hLCBwZywgYWRkciwgbGVuKSBcCj4gICAgICAgICBmbHVzaF9pY2FjaGVfbW0odm1hLT52
bV9tbSwgMCkKPgo+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gKyNkZWZpbmUgZmx1c2hfY2FjaGVf
dm1hcChzdGFydCwgZW5kKSAgIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2Uoc3RhcnQsIGVuZCkKU29y
cnksIEkgY291bGRuJ3QgYWdyZWUgd2l0aCB0aGUgYWJvdmUgaW4gYSBQSVBUIGNhY2hlIG1hY2hp
bmUuIEl0J3MKbm90IHdvcnRoIGZvci4KCkl0IHdvdWxkIHJlZHVjZSB0aGUgcGVyZm9ybWFuY2Ug
b2Ygdm1hcF9wYWdlc19yYW5nZSwKaW9yZW1hcF9wYWdlX3JhbmdlIC4uLiBBUEksIHdoaWNoIG1h
eSBjYXVzZSBzb21lIGRyaXZlcnMnIHBlcmZvcm1hbmNlCmlzc3VlcyB3aGVuIHRoZXkgaW5zdGFs
bC91bmluc3RhbGwgbWVtb3J5IGZyZXF1ZW50bHkuCgo+ICsjZW5kaWYKPiArCj4gICNpZm5kZWYg
Q09ORklHX1NNUAo+Cj4gICNkZWZpbmUgZmx1c2hfaWNhY2hlX2FsbCgpIGxvY2FsX2ZsdXNoX2lj
YWNoZV9hbGwoKQo+IC0tCj4gMi4zOS4yCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
