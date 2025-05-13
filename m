Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A417C3ABC9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=au7ea+BoT3fpEdY+TL6kDCWEoK5Z6Biziqh9WngBAKo=; b=aFPjsn7AfUhdwo
	unYl7YMSFha3q0c9mBUsAUYA1LV9dOiHAbXtkJ1d0cV6mNYuZ4ExGzLNj9vxIS1Js/OJUJJEIa35m
	gOdvh9WMKbUQaissEwgcpOKVZx7ydQ3UGZPyRLT1S2EdA1UwPjkI9a7Tk8zKxXgVN6Z6imaH+h7xb
	BQso1NkMsZfTNqyNpZ2wMEtUw6bzUVZuD+3G1ABFDJ0Jm/G1gO4p/LVYqvkyTZCcMzOdXImjE4PjZ
	m8uX64fDkqeZ7o39enuz5yzxvOFQd4LwxiMvkpMcg6HLN4m5e3GXuTGxIu4IUtaotm1xZ20nowlrN
	YPTz3LH4+VNEbvCBUd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjT3-0000000BY1Y-3UJM;
	Tue, 13 May 2025 06:50:21 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjRi-0000000BXpY-05xN
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 06:49:00 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4ddb53a10d1so1978850137.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118937; x=1747723737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYk4j7CxjdKvx7rPEEhNb+Rwax5vZxTzKDR9+UW9Ueo=;
        b=jA/TsKjfgruXIRY/ei/sacJdobCB5NOypsin8eBgmm8/YO/iBlOfMS9Avy1kPCme9S
         vf37fvmbNmU6lj9t6+O2s+k+9Zlv3SmpbWLjgB40DZzQ1p1Jd+6kr+0QApcnPY1Dd/cC
         sVaX2LqJ0MWUKLBSzqJQOC2u2tWaRzAs7iKcEmzBQKZpCxt4IhOF3GfuQhQgbKdJ9sst
         cSGscW+eilvucOAbwhvFRVrlF3xToeb1WtlCPeN/mAGS2MPB0xqOBlAtAuts4qeCnCyq
         tkktzuumMm6nCYEm/WzTUOaAneX1amdFYHl+HiAIS+8xIfL+9eGOI1dZczZxnb8QPJ0u
         Q9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118937; x=1747723737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYk4j7CxjdKvx7rPEEhNb+Rwax5vZxTzKDR9+UW9Ueo=;
        b=JUF4iDHqQZxMNGphGP9oJaoI1kzxZSeGOmGGgadmiGDhXqEbZlxaWaTG4QrzwXarIP
         v5KQOv6rOwq8pI35zk/HYh06OsylnkKnFjniriattLaurQji/l5wCQGO016IH0TCjmt6
         wrZ1vCSZuDdo4Pl3nYy1LxTxUMp51tYixJm2hQr/E8tHS8/gpB7tar3ybSguS7YyRCxy
         Jaxh88jYj4kD7eknFAAV8rCyxiTOwlTREXEhCty+jukOiog+3zA0Z/VvS79Vq+EHxRTi
         xbfPzliMXCwK2lNUKhbawNm8ODDYPEria8qmtA/sYW4rSvnemsJtnSE2VY5uzlbOTA2g
         m7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVO7UVOA+aodhrW/USVjAlSCVzcInRkiFf+3DhqMBzzorX6GHyB5d7zyEmX4mmxL3BUauaVXJ7RqZuOPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMLIclKEl//i1ZbPuT4jQ0gcAcApMTZ+UoxhMcqRRfN5QPJLC8
	umB6kSfghHR8ArG2RTemx1I6E/tWnvD30w7ePTMm/chrsimtYe2jSooI16fDnqfmDMqpdiQO0E+
	lHgWPgkR8wFaxLhGaCppqls5iCow=
X-Gm-Gg: ASbGncuIwESsiT9TKLh5ud9oP3GLayrev+4IAEBjIX+uNRxIyrCNX/vF0+Xo4WSqpGi
	vIzVDz8ky70eieN+ib31BKLQiaE0QJtoEdxSXe12s8JuX1G0gxdhtRA1XcAEQleAASf3/xgXE/U
	TaxWBxb5D3UUrNI5e9uWB2k4jEk96tUkg=
X-Google-Smtp-Source: AGHT+IG1Lfo3qRxxG+d06P2OThy1PUAW+HmTxa7XW23ERubEx5mp17bOS5Sq9QFl3olPcQ5JCsTf6WYuihxd2eQtVjs=
X-Received: by 2002:a05:6102:3c9f:b0:4dc:81c9:13b1 with SMTP id
 ada2fe7eead31-4deed227f12mr14095269137.0.1747118936072; Mon, 12 May 2025
 23:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1746811744.git.rabenda.cn@gmail.com> <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 13 May 2025 14:48:44 +0800
X-Gm-Features: AX0GCFsgKP3_L5fxA6GXcGzKEQ8-JYRcBHDQtkNoE5k7A3nhuftzT0fylh2dtec
Message-ID: <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
To: Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_234858_060290_F5EB762B 
X-CRM114-Status: GOOD (  14.29  )
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

SSBob3BlIGl0IGlzIHNnMjA0Mi14OGV2Yi4KClNvcGhnbyBpcyBhbHNvIG1ha2luZyBFVkIgYm9h
cmRzIGZvciBzZzIwNDQuCgpJIHRoaW5rIGEgZGlzdGluY3Rpb24gbmVlZHMgdG8gYmUgbWFkZSBo
ZXJlLgoKUmVnYXJkcywKSGFuCgpPbiBUdWUsIE1heSAxMywgMjAyNSBhdCA3OjM14oCvQU0gQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+IHdyb3RlOgo+Cj4KPiBPbiAyMDI1LzUv
MTAgMjoxMywgSGFuIEdhbyB3cm90ZToKPiA+IEFkZCBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24g
Zm9yIHRoZSBTb3BoZ28geDggRVZCIGJvYXJkIFsxXS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vc29waGdvL3NvcGhnby1oYXJkd2FyZS90cmVlL21hc3Rlci9TRzIwNDIvU0cyMDQy
LXg4LUVWQiBbMV0KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxyYWJlbmRhLmNuQGdt
YWlsLmNvbT4KPiA+IC0tLQo+ID4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3Yvc29waGdvLnlhbWwgfCAxICsKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9zb3BoZ28ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9zb3BoZ28ueWFtbAo+ID4gaW5kZXggYTE0Y2IxMGZmM2YwLi5lZTI0NGM5Zjc1Y2MgMTAw
NjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29w
aGdvLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9zb3BoZ28ueWFtbAo+ID4gQEAgLTM0LDYgKzM0LDcgQEAgcHJvcGVydGllczoKPiA+ICAgICAg
ICAgLSBpdGVtczoKPiA+ICAgICAgICAgICAgIC0gZW51bToKPiA+ICAgICAgICAgICAgICAgICAt
IG1pbGt2LHBpb25lZXIKPiA+ICsgICAgICAgICAgICAgIC0gc29waGdvLHNnMjA0Mi14OGV2Ygo+
Cj4gSSB3b25kZXIgdGhlIHByb2R1Y3QgbmFtZSBpcyB4OGV2YiBvciBzZzIwNDIteDhldmI/Cj4K
PiBUaGUgc2FtZSBxdWVzdGlvbiB0byB4NGV2Yi4KPgo+IFJlZ2FyZHMsCj4KPiBDaGVuCj4KPiA+
ICAgICAgICAgICAgIC0gY29uc3Q6IHNvcGhnbyxzZzIwNDIKPiA+Cj4gPiAgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiB0cnVlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
