Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41014E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Roqy3Ys1JiX95Ni0I/zBSub42jt35n4/ekOatTbGrzM=; b=uCllDzUXoXEpe3
	vmyDuLDTrGccVo37Torqwp95TCduyP+ZYKjj3GwLe1uvMdlQgs1tRLMz4DzS3RMcntNOZbwrFG524
	QbhqqZyEIJLbKOskMrxjt4skmOTA9eIJG2Oe0CaRtvMzV5ooBU2ZkVLaBdI8S9jFdOMIz18KBV1u3
	2GEQr2ic8ypSTe0GugvYfkpSb9bagUfcZT/ger3GlgAbZoLlRw9h4OuQg2VTJ5rPlOwaJaZ1cBKid
	G9VE1VjsOPBCdeB2p62RNHb0VmEYPKtRQ5Meh1OaKHU1CNzbzNlTjI3I4+ZdIVfLr2aCWbWnp9SH/
	W97sv+6zHep2SV8+utXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjs6-00000000lYu-482d;
	Mon, 06 Jan 2025 09:58:06 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjs4-00000000lYM-3aaL
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 09:58:06 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso6325620a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 01:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736157483; x=1736762283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFDhCTprLhMW13bDnqemHCWfo9cxNH6TibkfB5zxp+o=;
        b=XwbgViM9aAnPUB1UafL12Qy8Tmlu9JUmO5tPHV0EOgTN+Uvu8m5UgTEOl8BLzWsPVr
         U6QrlVRfQPOpsAu7Wt1ArM0/9QIAxr5gim/PHhxV/VppEngwVUydoFf4j2WCRNG//8YX
         0T7JEo+ngeFDweB7CmRRkPOgMTH0d2Ly66Hb72jKbQ8tvvNdupZlxsFYDJtT7mICeGQh
         YA1kQbeyjpB9P9ieU2Xw4uWwJm87JMoFSh2DMUoBQEwhjpYfaR6YmCLNSAxf6SWDt5Ul
         +9i8tHNS2CdbUpE2PkrVeEws8eHkrWbTbqVC2U81vIvfyI6Nj3GejbfBsDrSa0CwYqKU
         4MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157483; x=1736762283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFDhCTprLhMW13bDnqemHCWfo9cxNH6TibkfB5zxp+o=;
        b=T56vKcp62rc1F+s1VLzh6p2HndorpL1oRPU2iTCu/Dellr+pPioN2niOHYlkK34HrI
         Q3hzScS0gpqP3dEwHqu6dDzDGUlPyLSqz9lzmvNr/U/8qgRM79+G2DaoEbqzdtDvvaIy
         D/TavyAlnzLrfFfl2S624fIBg4REJqSeHnh+gbWxccQLTs22gxoIdeU28CDDwwR7oZS1
         Tb5gPSSb6lWnvle2jku6banuRKyWWM0jGYhwzrIrn7dANsJODOr1nvU3Jkzkp2vjouUC
         5r8JA9gWlJFhirsY5J2PqZGRGmSehv6eP7Z9gxYfxsEukwjDyfIWIFCKWPcDje8XYxgt
         SftA==
X-Forwarded-Encrypted: i=1; AJvYcCVXU9cgU+3Qb6NsqT4+0qW8qpm4ZDNpUrKQKafddh2IwYk8Tsnq2WjElpBPI+Dktg7u5RmkIdK9UB9ltw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ8krJD/N0FdhdxaBgEH30CiN4OUzGF3pQd7f734P4TipOK8JQ
	ou9viXchGcUdJ3idh8Z2cMmgsRtoYZtPL2t7H7dFQ7rMWmfTMf9c70mxgKJXjp6Ou+eMYuvA4cS
	CqLHbf/d9J4AVKvcCSbSnLkmOr1HCY7T55LR+oQ==
X-Gm-Gg: ASbGncv5nEjOv+Kp6mnw5tvDlW9WgU/nTZUXv+xstkJm4v0QO/CrVB0ysZ+e1Zq6SKm
	I409Rd4Sn2JcwYzXbsQOfSyw0ceLsWo6X
X-Google-Smtp-Source: AGHT+IFnokpDogFbsWK7V2a+LuXyFOHKwZuWS0R+2rHyebUWW8qrVUWqOzq+WJXMo7qKKZ0l4vB1Y5LicH6hnEFTk2I=
X-Received: by 2002:a05:6402:51ce:b0:5d2:7270:6125 with SMTP id
 4fb4d7f45d1cf-5d81dd8acdamr54000700a12.8.1736157482531; Mon, 06 Jan 2025
 01:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20250103141814.508865-1-cleger@rivosinc.com> <1fad8701-9667-487f-b356-45c6d07eeb49@ghiti.fr>
 <4f78a39a-0788-49a4-9d63-777bb9d15b30@rivosinc.com>
In-Reply-To: <4f78a39a-0788-49a4-9d63-777bb9d15b30@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 6 Jan 2025 10:57:51 +0100
Message-ID: <CAHVXubiNh5B9COQOMtTr+kWvB=UzeVe7v87djYzVXT_Q+ffXiw@mail.gmail.com>
Subject: Re: [PATCH] riscv: use local label names instead of global ones in assembly
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_015804_900317_44EB8792 
X-CRM114-Status: GOOD (  23.67  )
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

T24gTW9uLCBKYW4gNiwgMjAyNSBhdCAxMDozNuKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMDYvMDEvMjAyNSAwOTo1MiwgQWxleGFu
ZHJlIEdoaXRpIHdyb3RlOgo+ID4gSGkgQ2zDqW1lbnQsCj4gPgo+ID4gT24gMDMvMDEvMjAyNSAx
NToxNywgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+ID4+IExvY2FsIGxhYmVscyBzaG91bGQgYmUg
cHJlZml4IGJ5ICcuTCcgb3IgdGhleSdsbCBiZSBleHBvcnRlZCBpbiB0aGUKPiA+PiBzeW1ib2wg
dGFibGUuIEFkZGl0aW9uYWxseSwgdGhpcyBtZXNzZXMgdXAgdGhlIGJhY2t0cmFjZSBieSBkaXNw
bGF5aW5nCj4gPj4gYW4gaW5jb3JyZWN0IHN5bWJvbDoKPiA+Pgo+ID4+ICAgIC4uLgo+ID4+ICAg
IFsgICAxMi43NTE4MTBdIFs8ZmZmZmZmZmY4MDQ0MTYyOD5dIF9jb3B5X2Zyb21fdXNlcisweDI4
LzB4YzIKPiA+PiAgICBbICAgMTIuNzUyMDM1XSBbPGZmZmZmZmZmODAwMTUyY2E+XSBoYW5kbGVf
bWlzYWxpZ25lZF9sb2FkKzB4MWNhLzB4MmZjCj4gPj4gICAgWyAgIDEyLjc1MjMxMF0gWzxmZmZm
ZmZmZjgwYTAzM2U4Pl0gZG9fdHJhcF9sb2FkX21pc2FsaWduZWQrMHgyNC8weGVlCj4gPj4gICAg
WyAgIDEyLjc1MjU5Nl0gWzxmZmZmZmZmZjgwYTBkY2FlPl0KPiA+PiBfbmV3X3ZtYWxsb2NfcmVz
dG9yZV9jb250ZXh0X2EwKzB4YzIvMHhjZQo+ID4KPiA+Cj4gPiBZZXMsIEkgbm90aWNlZCB0aGlz
IGxhc3Qgd2VlaywgdGhhbmtzIGZvciBsb29raW5nIGludG8gaXQuIEkgd291bGQgYWRkIGEKPiA+
IEZpeGVzIHRhZyBhbmQgbWVyZ2UgdGhhdCBpbiB0aGUgbmV4dCAtcmMgaWYgcG9zc2libGUgYXMg
dGhlIGFib3ZlCj4gPiBiYWNrdHJhY2UgaXMgImRpc3R1cmJpbmciLgo+Cj4gSGkgQWxleCwKPgo+
IFllYWgsIEkgdGhvdWdodCB0aGUgRml4ZXMgdGFnLCBidXQgc2luY2UgaXQgd2Fzbid0IHJlYWxs
eSAiYnJlYWtpbmciCj4gYW55dGhpbmcsIEkgbGVmdCBpdCBvdXQuIEknbGwgYWRkIGl0IGFuZCBz
ZW50IGEgVjIuCgpObyBuZWVkIHRvIHNlbmQgYSB2MiwgYjQgd2lsbCBwaWNrIHRoZSBGaXhlcyB0
YWc6CgpGaXhlczogNTAzNjM4ZTBiYWJmMyAoInJpc2N2OiBTdG9wIGVtaXR0aW5nIHByZXZlbnRp
dmUgc2ZlbmNlLnZtYSBmb3IKbmV3IHZtYWxsb2MgbWFwcGluZ3MiKQoKVGhhbmtzLAoKQWxleAoK
Pgo+IFRoYW5rcwo+Cj4gQ2zDqW1lbnQKPgo+ID4KPiA+Cj4gPj4KPiA+PiBBZnRlcjoKPiA+PiAg
ICAuLi4KPiA+PiAgICBbICAgMTAuMjQzOTE2XSBbPGZmZmZmZmZmODA0NDE1ZTQ+XSBfY29weV9m
cm9tX3VzZXIrMHgyOC8weGMyCj4gPj4gICAgWyAgIDEwLjI0NDAyNl0gWzxmZmZmZmZmZjgwMDE1
MmNhPl0gaGFuZGxlX21pc2FsaWduZWRfbG9hZCsweDFjYS8weDJmYwo+ID4+ICAgIFsgICAxMC4y
NDQxNTBdIFs8ZmZmZmZmZmY4MGEwMzNhMD5dIGRvX3RyYXBfbG9hZF9taXNhbGlnbmVkKzB4MjQv
MHhlZQo+ID4+ICAgIFsgICAxMC4yNDQyNjhdIFs8ZmZmZmZmZmY4MGEwZGM2Nj5dIGhhbmRsZV9l
eGNlcHRpb24rMHgxNDYvMHgxNTIKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiA+Pgo+ID4+IC0tLQo+ID4+ICAgYXJjaC9yaXNj
di9rZXJuZWwvZW50cnkuUyB8IDIwICsrKysrKysrKystLS0tLS0tLS0tCj4gPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2Vu
dHJ5LlMKPiA+PiBpbmRleCBjMjAwZDMyOWQ0YmQuLjIxNjU4MTgzNWViMCAxMDA2NDQKPiA+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvZW50cnkuUwo+ID4+IEBAIC0yMywyMSArMjMsMjEgQEAKPiA+PiAgICAgICBSRUdfUyAgICAg
YTAsIFRBU0tfVElfQTAodHApCj4gPj4gICAgICAgY3NyciAgICAgYTAsIENTUl9DQVVTRQo+ID4+
ICAgICAgIC8qIEV4Y2x1ZGUgSVJRcyAqLwo+ID4+IC0gICAgYmx0ICAgICAgYTAsIHplcm8sIF9u
ZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRleHRfYTAKPiA+PiArICAgIGJsdCAgICAgIGEwLCB6ZXJv
LCAuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMAo+ID4+ICAgICAgICAgUkVHX1MgICAg
IGExLCBUQVNLX1RJX0ExKHRwKQo+ID4+ICAgICAgIC8qIE9ubHkgY2hlY2sgbmV3X3ZtYWxsb2Mg
aWYgd2UgYXJlIGluIHBhZ2UvcHJvdGVjdGlvbiBmYXVsdCAqLwo+ID4+ICAgICAgIGxpICAgICAg
IGExLCBFWENfTE9BRF9QQUdFX0ZBVUxUCj4gPj4gLSAgICBiZXEgICAgICBhMCwgYTEsIF9uZXdf
dm1hbGxvY19rZXJuZWxfYWRkcmVzcwo+ID4+ICsgICAgYmVxICAgICAgYTAsIGExLCAuTG5ld192
bWFsbG9jX2tlcm5lbF9hZGRyZXNzCj4gPj4gICAgICAgbGkgICAgICAgYTEsIEVYQ19TVE9SRV9Q
QUdFX0ZBVUxUCj4gPj4gLSAgICBiZXEgICAgICBhMCwgYTEsIF9uZXdfdm1hbGxvY19rZXJuZWxf
YWRkcmVzcwo+ID4+ICsgICAgYmVxICAgICAgYTAsIGExLCAuTG5ld192bWFsbG9jX2tlcm5lbF9h
ZGRyZXNzCj4gPj4gICAgICAgbGkgICAgICAgYTEsIEVYQ19JTlNUX1BBR0VfRkFVTFQKPiA+PiAt
ICAgIGJuZSAgICAgIGEwLCBhMSwgX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMQo+ID4+
ICsgICAgYm5lICAgICAgYTAsIGExLCAuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMQo+
ID4+ICAgLV9uZXdfdm1hbGxvY19rZXJuZWxfYWRkcmVzczoKPiA+PiArLkxuZXdfdm1hbGxvY19r
ZXJuZWxfYWRkcmVzczoKPiA+PiAgICAgICAvKiBJcyBpdCBhIGtlcm5lbCBhZGRyZXNzPyAqLwo+
ID4+ICAgICAgIGNzcnIgICAgIGEwLCBDU1JfVFZBTAo+ID4+IC0gICAgYmdlICAgICBhMCwgemVy
bywgX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMQo+ID4+ICsgICAgYmdlICAgICBhMCwg
emVybywgLkxuZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRleHRfYTEKPiA+PiAgICAgICAgIC8qIENo
ZWNrIGlmIGEgbmV3IHZtYWxsb2MgbWFwcGluZyBhcHBlYXJlZCB0aGF0IGNvdWxkIGV4cGxhaW4K
PiA+PiB0aGUgdHJhcCAqLwo+ID4+ICAgICAgIFJFR19TICAgIGEyLCBUQVNLX1RJX0EyKHRwKQo+
ID4+IEBAIC02OSw3ICs2OSw3IEBAIF9uZXdfdm1hbGxvY19rZXJuZWxfYWRkcmVzczoKPiA+PiAg
ICAgICAvKiBDaGVjayB0aGUgdmFsdWUgb2YgbmV3X3ZtYWxsb2MgZm9yIHRoaXMgY3B1ICovCj4g
Pj4gICAgICAgUkVHX0wgICAgYTIsIDAoYTApCj4gPj4gICAgICAgYW5kICAgIGEyLCBhMiwgYTEK
PiA+PiAtICAgIGJlcSAgICBhMiwgemVybywgX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dAo+
ID4+ICsgICAgYmVxICAgIGEyLCB6ZXJvLCAuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dAo+
ID4+ICAgICAgICAgLyogQXRvbWljYWxseSByZXNldCB0aGUgY3VycmVudCBjcHUgYml0IGluIG5l
d192bWFsbG9jICovCj4gPj4gICAgICAgYW1veG9yLmQgICAgYTAsIGExLCAoYTApCj4gPj4gQEAg
LTgzLDExICs4MywxMSBAQCBfbmV3X3ZtYWxsb2Nfa2VybmVsX2FkZHJlc3M6Cj4gPj4gICAgICAg
Y3NydyAgICBDU1JfU0NSQVRDSCwgeDAKPiA+PiAgICAgICBzcmV0Cj4gPj4gICAtX25ld192bWFs
bG9jX3Jlc3RvcmVfY29udGV4dDoKPiA+PiArLkxuZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRleHQ6
Cj4gPj4gICAgICAgUkVHX0wgICAgIGEyLCBUQVNLX1RJX0EyKHRwKQo+ID4+IC1fbmV3X3ZtYWxs
b2NfcmVzdG9yZV9jb250ZXh0X2ExOgo+ID4+ICsuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4
dF9hMToKPiA+PiAgICAgICBSRUdfTCAgICAgYTEsIFRBU0tfVElfQTEodHApCj4gPj4gLV9uZXdf
dm1hbGxvY19yZXN0b3JlX2NvbnRleHRfYTA6Cj4gPj4gKy5MbmV3X3ZtYWxsb2NfcmVzdG9yZV9j
b250ZXh0X2EwOgo+ID4+ICAgICAgIFJFR19MICAgIGEwLCBUQVNLX1RJX0EwKHRwKQo+ID4+ICAg
LmVuZG0KPiA+Pgo+ID4KPiA+Cj4gPiBZb3UgY2FuIGFkZDoKPiA+Cj4gPiBSZXZpZXdlZC1ieTog
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4KPiA+IFRoYW5rcywK
PiA+Cj4gPiBBbGV4Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
