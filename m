Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846E8C41513
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 00:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxL9Wyz7rzzRBoL5JYh6JAaueRRAKlkEdYp3zryUVwE=; b=anfZPey7mlYmtU
	CSZBlmv0/Z5Z/pgD5yXycaOOojoU7tmOh+j5cUMv2bTAYb+5jMaRToaZ/KLK4uvC+Ki8cY4v38ZTC
	85YaTtazVcPGpaJFhR4yrbLSeFIev7C6Ln411ZE466wCL9ORw7zYDN8OnBB9y9PQ2iZFxSWYcwSN5
	x9J7qPe6T8viK+jsYcvSLAQkd4P2IYwqZHc+1b2IzBazS/RNW8fR3N8U+j1TpNpG+iiGKXftoWmg4
	4PR6LikTZ5BVIsRei9MQzmSoLJ9X5dUZtNNnEPdTZ3Z+5RlMMqeA56xFU3P6qsj3PLBzABZnR0z04
	iGTH/gMFGKQOjQBVxaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjGY-00H0in-1I;
	Thu, 12 Oct 2023 00:09:26 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjGV-00H0hC-34
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 00:09:25 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-45600aceffbso188207137.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697069362; x=1697674162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8E6Rb76QtykLEtpxRTYbPOUD3PEgLNbGFAb6+VKc0g0=;
        b=a/QRkP+ZkTrRs3Up8RII2/KefHJ0ZYfbBFtas4/+8JM9Sifr3iEhGd8BNJHMFooR7l
         I1op5pMWy16dTlFczUWG0RN3arWUl1syPf0VTHpm9Mn7x7MIhaDGz4VgSe7IS0vfCmW6
         I520RpgwwaVXliqXGFtlQ0QgRQ/WpQFIDDFIApGenl8/dC2MFrl31dJvmOLB20x5dFKO
         TO5INyeitvY8srwsqzSixIIh0Bo30Jct355WsNy6cSuoW8RYC98YxHZELEEjcjF2Q66V
         9P6GN7UZLZIifkytuex03mcPUMwQovIzjcyNWSggllwr+m/VJSDjhKJgWvAgyPbFwJns
         aoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697069362; x=1697674162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8E6Rb76QtykLEtpxRTYbPOUD3PEgLNbGFAb6+VKc0g0=;
        b=lWBwKYj5aI+7cxzFiK+cHg3wIDJAl8EY5FKOdLdwH/SHtd1PoiNmzlL57nSKtdzGKF
         3SlCgM3/p1MiB38+doSGfgnglFQ9Xzt+zppPNzXKij2zqp8qCktEc5CFlwJsGDl9zaLa
         5yK2jMF2gAkfxKiPWmVB8bcSjkU+34Ck8J0G7RlzYRqfSNmsNhZ6uoFtKAIZYXhX9bzc
         nXcscVDwvB9/F0tG5f/zCBeunJ/l2FdxLXCWDvlZ4hChZrz+bNWQn0zvT7hlwauRYeWL
         FRtegcuNhjsgzjBrLdMcrHvye7SkpYsWzTx2pyQdJ6puSzQv8CazrD7qIlaU8TPTDADt
         pWGQ==
X-Gm-Message-State: AOJu0YziPZVdbj7SGx07cwHYGDC0Wb0tcTLq7/m3XB89lGruYYqSzzo/
	AX+c4h+mm+9weEBAdYGofr/HX/RtEO0omJ4nr7o=
X-Google-Smtp-Source: AGHT+IE+jtGj0bpjr4ph2nFS2WUEiMP1Bl7FyBQFitIVf0PO5COhrul84X3ZhwP6TxoKBxvnZ7R7AtyFrDQXdrhBJCI=
X-Received: by 2002:a67:e40d:0:b0:452:8953:729e with SMTP id
 d13-20020a67e40d000000b004528953729emr22925899vsf.13.1697069361033; Wed, 11
 Oct 2023 17:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231011114721.193732-1-bjorn@kernel.org>
In-Reply-To: <20231011114721.193732-1-bjorn@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Oct 2023 10:08:54 +1000
Message-ID: <CAKmqyKMtD7cvNjvs=_=frbaUVpPunj4sX0Q+jgLqDSYKNAwWxg@mail.gmail.com>
Subject: Re: [PATCH] riscv, qemu_fw_cfg: Add support for RISC-V architecture
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_170923_991105_1C1C084C 
X-CRM114-Status: GOOD (  19.98  )
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

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMTE6MzTigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KPgo+IFFlbXUgZndfY2ZnIHN1cHBvcnQgd2FzIG1pc3NpbmcgZm9yIFJJU0MtViwgd2hp
Y2ggbWFkZSBpdCBoYXJkIHRvIGRvCj4gcHJvcGVyIHZtY29yZSBkdW1wcyBmcm9tIHFlbXUuCj4K
PiBBZGQgdGhlIG1pc3NpbmcgUklTQy1WIGFyY2gtZGVmaW5lcy4KPgo+IFlvdSBjYW4gbm93IGRv
IHZtY29yZSBkdW1wcyBmcm9tIHFlbXUuIEFkZCAiLWRldmljZSB2bWNvcmVpbmZvIiB0byB0aGUK
PiBxZW11IGNvbW1hbmQtbGluZS4gRnJvbSB0aGUgcWVtdSBtb250aW9yOgo+ICAgKHFlbXUpIGR1
bXAtZ3Vlc3QtbWVtb3J5IHZtY29yZQo+Cj4gVGhlIHZtY29yZSBjYW4gbm93IGJlIHVzZWQsIGUu
Zy4sIHdpdGggdGhlICJjcmFzaCIgdXRpbGl0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCkFja2VkLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxh
bGlzdGFpci5mcmFuY2lzQHdkYy5jb20+CgpBbGlzdGFpcgoKPiAtLS0KPiAgZHJpdmVycy9maXJt
d2FyZS9LY29uZmlnICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2Zpcm13YXJlL3FlbXVfZndfY2Zn
LmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvS2NvbmZpZyBiL2RyaXZlcnMv
ZmlybXdhcmUvS2NvbmZpZwo+IGluZGV4IGI1OWUzMDQxZmQ2Mi4uZjA1ZmY1NjYyOWIzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZmlybXdh
cmUvS2NvbmZpZwo+IEBAIC0xNTUsNyArMTU1LDcgQEAgY29uZmlnIFJBU1BCRVJSWVBJX0ZJUk1X
QVJFCj4KPiAgY29uZmlnIEZXX0NGR19TWVNGUwo+ICAgICAgICAgdHJpc3RhdGUgIlFFTVUgZndf
Y2ZnIGRldmljZSBzdXBwb3J0IGluIHN5c2ZzIgo+IC0gICAgICAgZGVwZW5kcyBvbiBTWVNGUyAm
JiAoQVJNIHx8IEFSTTY0IHx8IFBBUklTQyB8fCBQUENfUE1BQyB8fCBTUEFSQyB8fCBYODYpCj4g
KyAgICAgICBkZXBlbmRzIG9uIFNZU0ZTICYmIChBUk0gfHwgQVJNNjQgfHwgUEFSSVNDIHx8IFBQ
Q19QTUFDIHx8IFJJU0NWIHx8IFNQQVJDIHx8IFg4NikKPiAgICAgICAgIGRlcGVuZHMgb24gSEFT
X0lPUE9SVF9NQVAKPiAgICAgICAgIGRlZmF1bHQgbgo+ICAgICAgICAgaGVscAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Zpcm13YXJlL3FlbXVfZndfY2ZnLmMgYi9kcml2ZXJzL2Zpcm13YXJlL3Fl
bXVfZndfY2ZnLmMKPiBpbmRleCBhNjkzOTlhNmI3YzAuLjE0NDhmNjExNzNiMyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2Zpcm13YXJlL3FlbXVfZndfY2ZnLmMKPiArKysgYi9kcml2ZXJzL2Zpcm13
YXJlL3FlbXVfZndfY2ZnLmMKPiBAQCAtMjExLDcgKzIxMSw3IEBAIHN0YXRpYyB2b2lkIGZ3X2Nm
Z19pb19jbGVhbnVwKHZvaWQpCj4KPiAgLyogYXJjaC1zcGVjaWZpYyBjdHJsICYgZGF0YSByZWdp
c3RlciBvZmZzZXRzIGFyZSBub3QgYXZhaWxhYmxlIGluIEFDUEksIERUICovCj4gICNpZiAhKGRl
ZmluZWQoRldfQ0ZHX0NUUkxfT0ZGKSAmJiBkZWZpbmVkKEZXX0NGR19EQVRBX09GRikpCj4gLSMg
aWYgKGRlZmluZWQoQ09ORklHX0FSTSkgfHwgZGVmaW5lZChDT05GSUdfQVJNNjQpKQo+ICsjIGlm
IChkZWZpbmVkKENPTkZJR19BUk0pIHx8IGRlZmluZWQoQ09ORklHX0FSTTY0KSB8fCBkZWZpbmVk
KENPTkZJR19SSVNDVikpCj4gICMgIGRlZmluZSBGV19DRkdfQ1RSTF9PRkYgMHgwOAo+ICAjICBk
ZWZpbmUgRldfQ0ZHX0RBVEFfT0ZGIDB4MDAKPiAgIyAgZGVmaW5lIEZXX0NGR19ETUFfT0ZGIDB4
MTAKPgo+IGJhc2UtY29tbWl0OiAxYzhiODZhMzc5OWY3ZTViZTkwM2MzZjQ5ZmNkYWVlMjlmZDM4
NWI1Cj4gLS0KPiAyLjM5LjIKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
