Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E18C7EE2C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+f5NrXf7Hbg4c9/qcB6Awb3g6MQP530Fvs5VVKWHNio=; b=g551ty3U0/ztcy
	q6knwgmCqBxywD2iyAjRvLrXD0NwoO/B3qzMdpPpFrsuCnSLay0Yzo9AaE90GPZHFfBN5z4hcxU20
	RnIVy7dXqmr+E9zo/S3rrx6p459C6TYsqD/WRi51HuRvaYu5ZnHcobOVlMw4z5AgLHnFTtrH8L0VO
	RY44lXN5a/jX3NGsY2fcnTzgpWa02wWMEFhpCcGnw7RTLyy9cggAVvXGO5yW707arkrLJQHB4GPAg
	I2RkCAOW5tjN5F+CqmexZBVs7KenOBDQY0lK5zWgmdZ85Ak41sAYRA5E/30/fw9Lsg3Y9t3RhFe8o
	06woeqO5WWxjzkiUxSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Z7n-002vio-2X;
	Fri, 26 May 2023 15:13:03 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Z7j-002vhP-0l
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 15:13:01 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0217DC0007;
	Fri, 26 May 2023 15:12:46 +0000 (UTC)
Message-ID: <f82e7d3d-a16d-593e-7513-753b5cbf28af@ghiti.fr>
Date: Fri, 26 May 2023 17:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Bug report: kernel paniced when system hibernates
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, robh@kernel.org,
 jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com, leyfoon.tan@starfivetech.com,
 mason.huo@starfivetech.com, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Song Shuai
 <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230525-shrapnel-precut-26500fca4a48@wendy>
 <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy>
 <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud>
 <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud>
 <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
 <20230525-batting-botch-7e03393a2d97@spud>
 <CAHVXubiDezbwZO6X2btvgpq-XqHnxZjXzaMnSK2YrHc_ioLx8Q@mail.gmail.com>
 <20230526-steep-omen-a5a46a1086bf@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230526-steep-omen-a5a46a1086bf@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_081259_560801_337865F6 
X-CRM114-Status: GOOD (  19.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDI2LzA1LzIwMjMgMTY6NTksIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBGcmksIE1heSAy
NiwgMjAyMyBhdCAwMzoxNDozM1BNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IEhp
IGV2ZXJ5b25lLAo+Pgo+PiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAxMToyNOKAr1BNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiBPbiBUaHUsIE1heSAyNSwgMjAy
MyBhdCAwMTowNjowNFBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPj4+PiBPbiBUaHUsIE1h
eSAyNSwgMjAyMyBhdCAxMTozOeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4+Pj4+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDExOjM3OjQwQU0gLTA3MDAsIEF0
aXNoIFBhdHJhIHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gQW55IHRlc3Rpbmcgb2YgaGliZXJuYXRpb24g
c3RpbGwgbmVlZHMgdG8gcmV2ZXJ0IHRoZSBwYXRjaCB1bnRpbCB3ZQo+Pj4+Pj4gaGF2ZSB0aGUg
cHJvcGVyIGZpeC4KPj4+Pj4gInRoZSBwYXRjaCIgaXMgd2hhdCBleGFjdGx5PyBJIGFzc3VtZSB5
b3UgZG9uJ3QgbWVhbiBkZXBlbmRpbmcgb24KPj4+Pj4gTk9OUE9SVEFCTEUsIHNpbmNlIHRoYXQg
aXMgYSBLY29uZmlnIG9wdGlvbi4KPj4+PiBOb3BlLiBTb3JyeSBJIG1lYW50IHRoZSBjb21taXQK
Pj4+Pgo+Pj4+IDMzMzUwNjggKCJyaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUg
bGluZWFyIG1hcHBpbmciKQo+Pj4gQWgsIGlmIHlvdXIgU0JJIGltcGxlbWVudGF0aW9uIGlzIG9u
ZSBvZiB0aGUgYWZmZWN0ZWQgb25lcywgeWVhaC4KPj4+IElmIG5vdCwgeW91IGNhbiBqdXN0IHNl
dCBOT05QT1JUQUJMRSA6KQo+PiBAQmrDtnJuIFTDtnBlbCBlbWl0dGVkIHRoZSBpZGVhIG9mIGV4
Y2x1ZGluZyBmcm9tIHRoZSBoaWJlcm5hdGlvbiBhbGwKPj4gdGhlIG1lbW9yeSBub2RlcyBpbiB0
aGUgIi9yZXNlcnZlZC1tZW1vcnkiIG5vZGUKPj4gKGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y2LjQtcmMxL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmVzZXJ2ZWQtbWVtb3J5L3Jlc2VydmVkLW1lbW9yeS55YW1sKToKPj4gSSBoYXZlIHRvIGFkbWl0
IHRoYXQgSSBkb24ndCBzZWUgd2h5IGl0IGlzIG5vdCBkb25lIGJ5IGRlZmF1bHQgYnkgdGhlCj4+
IGtlcm5lbC4KPiBNeSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0IGl0IHdhcyBwZXJmZWN0bHkgZmlu
ZSB0byB1c2UgcmVzZXJ2ZWQgbWVtb3J5Cj4gbm9kZXMgdG8gZmVuY2Ugb2ZmIHNvbWUgbWVtb3J5
IHRvIHVzZSBpbiBkZXZpY2UgZHJpdmVycyBldGMsIHdoaWNoIHRoZW4KPiBtYXkgbmVlZCB0byBi
ZSBzYXZlZC9yZXN0b3JlZC4KCgpBZ3JlZWQsIGJ1dCBJIHdvdWxkIHNheSB0aGF0IGl0J3MgdXAg
dG8gdGhlIGRyaXZlciB0aGVuIHRvIHRha2UgY2FyZSBvZiAKdGhhdCwgc2VlIGh0dHBzOi8vZG9j
cy5rZXJuZWwub3JnL2RyaXZlci1hcGkvcG0vbm90aWZpZXJzLmh0bWwKCgo+PiBVbmxlc3MgdGhl
cmUgaXMgc3R1ZmYgaW4gdGhpcyBub2RlIHRoYXQgbmVlZHMgdG8gYmUgImhpYmVybmF0ZWQiLCBJ
Cj4+IHRoaW5rIHRoYXQgd291bGQgYmUgYSB2ZXJ5IGdvb2Qgc29sdXRpb24gc2luY2Ugd2Ugd291
bGQgbm90IHJlbHkgb24KPj4gdGhlIG5hbWUgb2YgdGhlICJpbnRlcm5hbCIgbm9kZXMgb2YgIi9y
ZXNlcnZlZC1tZW1vcnkiIChpLmUuCj4+ICJtbW9kZV9yZXN2IikuCj4+Cj4+IEknbSBkaWdnaW5n
IGludG8gd2h5IGl0IGlzIG5vdCBkb25lIGJ5IGRlZmF1bHQsIGp1c3Qgd2FudGVkIHRvIGhhdmUK
Pj4geW91ciBmZWVkYmFjayBiZWZvcmUgdGhlIHdlZWstZW5kIDopCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
