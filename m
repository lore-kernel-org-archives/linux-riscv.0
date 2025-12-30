Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC082EE0205
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgaUhmQK/nHcqrZKLhmKY4P1tQkf1/arT966bBnB5Lw=; b=IB/8o1h0t2eLz1
	lgZv4iZyg5/RYLgOmAk3Gsg5nmMKX88K5HKvUBfWlCB8DP6zLxUn8unFrIdhyVP7ZrWtYUH4b6zuA
	vcT2Ad/3WHsoVt8VFzJSJIvEZDbs8+V/sirNGl6t6j5UYSqZgNsO+QwNNvlwypeIslj7Ip+M7+Ksa
	FhVriLLdguh/vApeSNWLf88q7DXjX/VzQrGS/QcBkIIeXtq/nx6DN3mJzbf451K0t7C92snV5W98i
	uebJhnmrvPO8pvvNFY+STDWenoeMNbU63tzyX7c920CgYPivrbBCQxg4Zn/YkPymmldBx8KzN7vRs
	vzBKui8Z5g1gyIjkAWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabY4-00000004zaH-05yA;
	Tue, 30 Dec 2025 15:22:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabY2-00000004zZu-22Qs
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 15:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0D05444A6
	for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844D4C2BCB2
	for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767108129;
	bh=H2790WoLvikyZR/aEdE8RPL6zHqL0rU8f9B5hIkiMx8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PYzfLelP17xxI4uMH4vxKp0zxSh8TGNCiBeNRJ7pg4YouoI5wMq3RBqbXNGZ2GMKc
	 CcPrDfc/RNd9mAtiO+jggoTffAbefjJjP34jdFCddRJ5YKWcxJgseeYnn9Y8nzMGzt
	 Ur4WxhycZ797lAkWj/iPiJuEP7mEsWwcfBxO+Zv2NMpJfrn9FS+9dZ1SA3FNad5T+j
	 Vqi+QbG9RQJeu199Z/LLISyz7H1oFCuvxg+8DgVg7XF4LUmFr7S6bad3aj2Hz/oJNf
	 fC4N+xRwmobCmVeIg1FfkcCtVozyLeZyS9kmh++53UGQXIzaR9UFcU82rJqpdZVok8
	 DCjGDoSsV5hnw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b832c65124cso581031666b.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 07:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVniGrkzXndrAME09M7PAAn98yhcGBz3AaxDnQXGgYjFuvzXTa4V7H66zFmR2cmPri/sY+EeJIvBzorxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuHNE1bxNIDYHgj7gDyZxz2B5Dty0WI6IMkeSR6krm0HKafTa+
	f599JUfCvWp7RQo3QWXXZNCr1rWgnWoZt5RXjgYZ4V8I8to+hordvyzLVI1Xnk5XgTrHSn2nncf
	1qoKYWKnRCtCpSk9CbQUiW1aocJIkKA==
X-Google-Smtp-Source: AGHT+IGgMUh2wDMtCLD4FQ/4n5kInvO9Hj2g8b7NZ7InxlarGA9KxRQ6Bk4MJxJTlQFvjcTH2u3r21ia8rmut5A5+kI=
X-Received: by 2002:a17:907:829a:b0:b83:246c:d125 with SMTP id
 a640c23a62f3a-b83246cd206mr1113571366b.41.1767108127778; Tue, 30 Dec 2025
 07:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com> <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org> <80e18a32-543a-48f5-81f2-4fa64cb8bf8c@riscstar.com>
In-Reply-To: <80e18a32-543a-48f5-81f2-4fa64cb8bf8c@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Dec 2025 09:21:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK8hRsVWV6WfbZ6hF1PwFfOJhyOrpWwoOhviAgv5ZxKUw@mail.gmail.com>
X-Gm-Features: AQt7F2oUAcuZgOKGmytF5zWoPN9kK4MNOhIzhcBZ1Fbq2d5Goxy_iVvpoy95C7s
Message-ID: <CAL_JsqK8hRsVWV6WfbZ6hF1PwFfOJhyOrpWwoOhviAgv5ZxKUw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension description
To: Alex Elder <elder@riscstar.com>
Cc: Guodong Xu <guodong@riscstar.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_072210_597347_A68A054C 
X-CRM114-Status: GOOD (  45.94  )
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

T24gTW9uLCBEZWMgMjksIDIwMjUgYXQgOToxNOKAr1BNIEFsZXggRWxkZXIgPGVsZGVyQHJpc2Nz
dGFyLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMi8yOS8yNSA4OjEzIFBNLCBSb2IgSGVycmluZyB3cm90
ZToKPiA+IE9uIEZyaSwgRGVjIDI2LCAyMDI1IGF0IDAzOjI4OjQ3UE0gLTA2MDAsIEFsZXggRWxk
ZXIgd3JvdGU6Cj4gPj4gT24gMTIvMjIvMjUgNzowNCBBTSwgR3VvZG9uZyBYdSB3cm90ZToKPiA+
Pj4gQWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgU3VwbSBleHRlbnNpb24uIFN1cG0gaW5kaWNhdGVz
IHN1cHBvcnQgZm9yIHBvaW50ZXIKPiA+Pj4gbWFza2luZyBpbiB1c2VyIG1vZGUuIFN1cG0gaXMg
bWFuZGF0b3J5IGZvciBSVkEyM1M2NC4KPiA+Pj4KPiA+Pj4gVGhlIFN1cG0gZXh0ZW5zaW9uIGlz
IHJhdGlmaWVkIGluIGNvbW1pdCBkNzAwMTFkZGU2YzIgKCJVcGRhdGUgdG8gcmF0aWZpZWQKPiA+
Pj4gc3RhdGUiKSBvZiByaXNjdi1qLWV4dGVuc2lvbi4KPiA+Pj4KPiA+Pj4gU3VwbSBkZXBlbmRz
IG9uIGVpdGhlciBTbW5wbSBvciBTc25wbSwgc28gYWRkIGEgc2NoZW1hIGNoZWNrIHRvIGVuZm9y
Y2UKPiA+Pj4gdGhpcyBkZXBlbmRlbmN5Lgo+ID4+Cj4gPj4gSSBoYXZlIHRoZSBzYW1lIGdlbmVy
YWwgcXVlc3Rpb24gb24gdGhpcywgYWJvdXQgd2hldGhlciBpdCdzIHJlYWxseQo+ID4+IG5lY2Vz
c2FyeSBmb3IgdGhlIERUIGJpbmRpbmcgdG8gZW5mb3JjZSB0aGVzZSByZXF1aXJlbWVudHMuICBU
aGUKPiA+PiBSSVNDLVYgc3BlY2lmaWNhdGlvbnMgYXJlIHdoYXQgdHJ1bHkgZGVmaW5lcyB0aGVp
ciBtZWFuaW5nLCBzbyBJCj4gPj4gZG9uJ3QgcmVhbGx5IHNlZSB3aHkgdGhlIERUIGZyYW1ld29y
ayBzaG91bGQgbmVlZCB0byBlbmZvcmNlIHRoZW0uCj4gPj4gKFRoYXQgc2FpZCwgSSdtIHN1cmUg
dGhlcmUgYXJlIG90aGVyIGNhc2VzIHdoZXJlIERUIGVuZm9yY2VzIHRoaW5ncwo+ID4+IGl0IHNo
b3VsZG4ndCBoYXZlIHRvLikKPiA+Cj4gPiBEb2VzIHRoZSBzcGVjaWZpY2F0aW9uIGhhdmUgc29t
ZSB3YXkgdG8gY2hlY2sgaXQ/IFdoYXQgaGFwcGVucyBpZiBhIERUCj4gPiBpcyB3cm9uZz8gQXJl
IHlvdSBnb2luZyB0byByZXF1aXJlIGEgRFQgdXBkYXRlIHRvIG1ha2UgdGhpbmdzIHJpZ2h0PyBP
cgo+ID4gdGhlIGtlcm5lbCBoYXMgdG8gd29yay1hcm91bmQgdGhlIGVycm9yPyBOZWl0aGVyIGlz
IGdyZWF0LiBTbyBoYXZpbmcKPiA+IHRoaXMgYXMgYSBzY2hlbWEgbWFrZXMgc2Vuc2UgdG8gcHJl
dmVudCBlaXRoZXIgc2NlbmFyaW8uCj4KPiBJJ20gcmVhbGx5IGdsYWQgeW91IHdlaWdoZWQgaW4u
ICBJIGFjdHVhbGx5IGhhdmUgc2V2ZXJhbCBxdWVzdGlvbnMKPiByZWxhdGVkIHRvIFJJU0MtViBl
eHRlbnNpb25zIGFuZCBEVC4gIEJ1dCBmb3Igbm93IEknbGwgZm9jdXMgb24KPiBqdXN0IHRoaXMu
Li4KPgo+IFRvIGFuc3dlciB5b3VyIGZpcnN0IHF1ZXN0aW9uLCBJJ20gbm90IHN1cmUgaG93IHRo
ZSBzcGVjaWZpY2F0aW9uCj4gaXMgImNoZWNrZWQiLCBvciB3aGF0ICJpdCIgaXMgdGhhdCB5b3Un
cmUgYXNraW5nIGFib3V0IGZvciB0aGF0Cj4gbWF0dGVyLiAgQWxzbyBJIHRoaW5rIHdlIGhhdmUg
dG8gYmUgY2xlYXIgYWJvdXQgd2hhdCAid3JvbmciIG1lYW5zLgo+Cj4gUklTQy1WIGlzIGRlZmlu
ZWQgYnkgYSAobGFyZ2UgYW5kIGdyb3dpbmcpIHNldCBvZiBzcGVjaWZpY2F0aW9ucwo+IHRoYXQg
YXJlIGRldmVsb3BlZCB0aHJvdWdoIGEgd2VsbC1kZWZpbmVkIHByb2Nlc3MuICBXaGVuIGEgc3Bl
Ywo+IGlzICpyYXRpZmllZCogaXQgaXMgY29tbWl0dGVkLCBhbmQgaXQgd29uJ3QgYmUgY2hhbmdl
ZC4gIFRoZXNlCj4gc3BlY2lmaWNhdGlvbnMgYXJlIHVsdGltYXRlbHkgKnRoZSogZGVmaW5pdGlv
biBvZiBSSVNDLVYKPiBjb21wbGlhbmNlLgo+Cj4gSSBhc3N1bWVkIHRoZSAid3JvbmciIHlvdSdy
ZSB0YWxraW5nIGFib3V0IGlzIGEgRFRTL0RUQiB0aGF0IGhhcwo+IGJlZW4gY29tbWl0dGVkIGJ1
dCBzb21laG93IGRvZXMgbm90IG1hdGNoIHdoYXQgYSBSSVNDLVYgc3BlYwo+IHNheXMsIGJ1dCBJ
IG1pZ2h0IGJlIG1pc3Rha2VuLgoKVGhhdCdzIGNvcnJlY3QuCgo+IEFueXdheSwgd2UgY2FuIGZs
aXAgdGhhdCBhcm91bmQgYW5kIGhhdmUgYSBzaW1pbGFyIHByb2JsZW06ICBXaGF0Cj4gaWYgd2Ug
ZGVmaW5lIHRoZSBEVCBiaW5kaW5nIGluIHN1Y2ggYSB3YXkgdGhhdCBpdCBkb2Vzbid0IG1hdGNo
Cj4gdGhlIFJJU0MtViBzcGVjPyAgVGhlIChyYXRpZmllZCkgUklTQy1WIHNwZWMgaXMgcmlnaHQu
CgpTdXJlLiBBbnkgdGltZSB0aGVyZSBpcyBtb3JlIHRoYW4gMSBzb3VyY2Ugb2YgdHJ1dGgsIHRo
ZXkgY291bGQgYmUKbWlzbWF0Y2hlZC4gQnV0IGl0IGlzIDEgc3BlYyBhbmQgMSBzY2hlbWEgdG8g
Y29tcGFyZSwgbm90IE4gRFRTIGZpbGVzLgpDaGVja2luZyB0aGUgc2NoZW1hIG1hdGNoZXMgdGhl
IHNwZWMgaXMgbXVjaCBlYXNpZXIgdGhhbiByZXZpZXdpbmcKZXZlcnkgbmV3IERUUyBmaWxlLgoK
VGhlIG9ubHkgdHJ1ZSBmaXggaXMgdG8gbWFrZSB0aGUgc3BlYyBtYWNoaW5lIHJlYWRhYmxlLgoK
PiBNeSB0aG91Z2h0IHdhcyB0aGF0IHdlIHNob3VsZCBoYXZlIHNvZnR3YXJlIGRvIHRoZSB2ZXJp
ZmljYXRpb24sCj4gYW5kIHJlY29tbWVuZCB0aGUgc29mdHdhcmUgKGUuZy4gYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW4gTGludXgpIGJlIHVwZGF0ZWQgdG8gdmVyaWZ5IHRoaW5n
cyBiZWZvcmUgY29tbWl0dGluZyB0byBhCj4gRFQgYmluZGluZy4KClRoYXQgbW92ZXMgdmFsaWRh
dGlvbiBmcm9tIGJ1aWxkIHRpbWUgdG8gcnVuIHRpbWUuIEhvdyBpcyB0aGF0IGJldHRlcj8KQW5k
IHdoYXQgYWJvdXQgb3RoZXIgT1NzPwoKSSdtIHZlcnkgbXVjaCBvZiB0aGUgb3BpbmlvbiB0aGF0
IGl0IGlzIG5vdCB0aGUga2VybmVsJ3Mgam9iIHRvCnZhbGlkYXRlIHRoZSBEVC4gSXQgb2J2aW91
c2x5IGhhcyBub3QgZG9uZSBhIHZlcnkgZ29vZCBqb2IgZ2l2ZW4KaXNzdWVzIHdlIGZpbmQgd2l0
aCBzY2hlbWFzLiBJdCdzIGZpbmUgdG8gaGF2ZSBzb21lIGNoZWNrcyBpbiB0aGlzCmNhc2UgaWYg
dGhlIGtlcm5lbCBjYW4ndCBmdW5jdGlvbiAob3IgdXNlL2VuYWJsZSB0aGUgZXh0ZW5zaW9uKQp3
aXRob3V0IHRoZSBkZXBlbmRlbnQgZXh0ZW5zaW9ucywgYnV0IHRoZXJlIGFyZSBsb3RzIG9mIGNs
YXNzZXMgb2YKZXJyb3JzIHRoZSBrZXJuZWwgZG9lc24ndCBuZWVkIHRvIGNhcmUgYWJvdXQuCgo+
IFRvIG1lLCBDIGNvZGUgaXMgbW9yZSBnZW5lcmFsIGFuZCBtb3JlIHVuaXZlcnNhbGx5IHVuZGVy
c3RhbmRhYmxlCj4gdGhhbiBZQU1MIHJ1bGVzLCBidXQgSSdtIGJpYXNlZCBieSBob3cgd2VsbCBJ
IHdvcmsgd2l0aCBDIHZlcnN1cwo+IFlBTUwgc2NoZW1hcy4KClBlcnNvbmFsbHksIGlmIEkgd2Fz
IGdvaW5nIHRvIGRvIHZhbGlkYXRpb24gd2l0aCBjb2RlLCBJIHdvdWxkIHBpY2sKcHl0aG9uIG9y
IGFueSBsYW5ndWFnZSB0aGF0IGNhbiBoYW5kbGUgbGlzdHMgYW5kIGRpY3RzIG5hdGl2ZWx5LiBJ
IHRvbwp3b3VsZCBwcmVmZXIgQyBmb3IgZXZlcnl0aGluZywgYnV0IGl0J3Mgbm90IHRoZSBiZXN0
IHRvb2wgZm9yIHRoZSBqb2IKaGVyZS4gRXZlbiBpZiB3ZSBkZWNpZGVkIHRvIGRvIHZhbGlkYXRp
b24gaW4gQyAoSSdtIHByZXR0eSBzdXJlIHdlIGhhZAphIHByb3Bvc2FsIHRvIGRvIGp1c3QgdGhh
dCBhdCBzb21lIHBvaW50KSwgd2UnZCBqdXN0IGVuZCB1cCBkZWZpbmluZwpvdXIgb3duIGRhdGEg
c3RydWN0dXJlcyBvZiB2YWxpZGF0aW9uIGRhdGEuIEJlY2F1c2UgYXQgdGhlIGVuZCBvZiB0aGUK
ZGF5LCBtb3N0IG9mIHRoZSB2YWxpZGF0aW9uIGluZm9ybWF0aW9uIGlzIGFsbCB0aGUgc2FtZSBz
dHJ1Y3R1cmUgb2YKZGF0YSAoaS5lLiBhIGxpc3Qgb2YgcHJvcGVydGllcyB3aXRoIGxpc3RzIG9m
IGFsbG93ZWQgdmFsdWVzKS4gSSdkCm11Y2ggcmF0aGVyIGZvbGxvdyBzb21lIHN0YW5kYXJkIChq
c29uLXNjaGVtYSkgdGhhdCdzIGFscmVhZHkKZG9jdW1lbnRlZCB0aGFuIHRyeSB0byBjb21lIHVw
IHdpdGggbXkgb3duIHBvb3JseSBkb2N1bWVudGVkCmludmVudGlvbi4KCkkgZG8gdGhpbmsgdGhl
cmUgaXMgc29tZSBuZWVkIGZvciBjb2RlIGJhc2VkIHZhbGlkYXRpb24gYXMgdGhlcmUgYXJlCnNv
bWUgdGhpbmdzIHdoaWNoIGNhbid0IGJlIGV4cHJlc3NlZCB3aXRoIHNjaGVtYXMuIFdlIGhhdmUg
c29tZSBvZgp0aGF0IGluIGR0YywgYnV0IHRoYXQgb25seSB3b3JrcyBmb3IgY29yZSBiaW5kaW5n
cy4gU29tZSBzb3J0IG9mCnB5dGhvbiBzbmlwcGV0cyBvZiBjb2RlIGluIHNjaGVtYXMgaXMga2lu
ZCBvZiB3aGF0IEknbSB0aGlua2luZy4KCj4gSW4gYW55IGNhc2UsIGEgIndyb25nIiBiaW5kaW5n
IGlzIGEgcHJvYmxlbSBubyBtYXR0ZXIgd2hhdCB0aGUKPiByZWFzb24uICBPbmUgd2F5IG9yIGFu
b3RoZXIgdGhlcmUgYXJlIHRoaW5ncyBleHByZXNzZWQgdmlhIERUCj4gdGhhdCBtdXN0IG1hdGNo
IHRoZSBSSVNDLVYgc3BlY2lmaWNhdGlvbnMuICBBbmQgeWVzLCB3ZSBkbyBoYXZlCj4gdG9vbHMg
YW5kIGJpbmRpbmdzIHRoYXQgY2FuIHZlcmlmeSB0aGluZ3MgcmVsYXRlZCB0byBEVC4KPgo+ID4+
IEFuZCBub3csIGhhdmluZyBsb29rZWQgYXQgdGhlc2UgYWRkZWQgYmluZGluZyBkZWZpbml0aW9u
cyAoaW4gcGF0Y2hlcwo+ID4+IDA3IHRocm91Z2ggMTEgaW4gdGhpcyBzZXJpZXMpLCBJIHdvbmRl
ciB3aGF0IGV4YWN0bHkgaXMgcmVxdWlyZWQgZm9yCj4gPj4gdGhlbSB0byBiZSBhY2NlcHRlZC4g
IEZvciB0aGUgbW9zdCBwYXJ0IHRoZXNlIHNlZW0gdG8ganVzdCBiZSBkZWZpbmluZwo+ID4+IGhv
dyB0aGUgZXh0ZW5zaW9ucyBzcGVjaWZpZWQgZm9yIFJJU0MtViBhcmUgdG8gYmUgZXhwcmVzc2Vk
IGluCj4gPj4gRFQgZmlsZXMuICBJdCBzZWVtcyB0byBiZSBhIGZhaXJseSBzdHJhaWdodGZvcndh
cmQgY29weSBmcm9tIHRoZQo+ID4+IHJhdGlmaWVkIHNwZWNpZmljYXRpb24ocykgdG8gdGhlIFlB
TUwgZm9ybWF0Lgo+ID4+Cj4gPj4gV2hvIG5lZWQgdG8gc2lnbiBvZmYgb24gaXQ/ICBDb25vcj8g
IFBhdWw/ICBEVCBtYWludGFpbmVycz8KPiA+Cj4gPiBJIGdlbmVyYWxseSBsZWF2ZSB0aGlzIGV4
dGVuc2lvbiBtZXNzIHRvIENvbm9yLgo+Cj4gU291bmRzIHdpc2UuICBTaG91bGQgSSBhZGRyZXNz
IG15IG90aGVyIGZldyBxdWVzdGlvbnMgb24gdGhpcwo+IHRvcGljIHRvIENvbm9yPyAgSSBkb24n
dCB3YW50IHRoaXMgcGFydGljdWxhciBzZXJpZXMgdG8gZ2V0Cj4gaGVsZCB1cCBvbiB1bnJlbGF0
ZWQgZGlzY3Vzc2lvbnMuCgpQcm9iYWJseSBzby4KClJvYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
