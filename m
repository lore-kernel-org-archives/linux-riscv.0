Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A0CC77B6D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 14:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04YmccgaephWN+bn9dvzRl7LFfo8Zxyn6on7VdsKJRA=; b=U1PyCHBf+qSkXt
	goJnRemgV5IKAl/AmDKbfyTfqIrnegu6bGZcYcOEnEXRp+QMBGBIHNwz31/ljMnn7uL/zd87NgQL/
	yuEuPpOxGvbuTJanja7pnhtKg04Z/QgarI9YCCkY+i8/t5YRiFzbc5p7hOSIprVxpyXDAS59h8Uwf
	YNrHJqNYhW3z3be/pTwF4JOKWdOeffioCY5pyc0YNt+yyNTLwPC7Enh91lIYvA9xflE3CTiTzMa8M
	1rhz26C5O4TkCC0CdlkXoIyBb0G+izk++kFRcyqAil/+LV/fTQvJepVUtY8jn9dFlTQ7UdvEedQ6U
	TTfMXxwuEUdVJ/VfC6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phA6q-00Eklf-2I;
	Tue, 28 Mar 2023 14:15:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phA6o-00Ekl8-25
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 14:15:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38CD9617F1
	for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 14:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A852C433A1
	for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680012933;
	bh=KTQ5pqCwMxjCLp76U2Ck6TsKhM8aPCCJcsNQkFmamtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NjwxT+f/vKnR4L6Jji+0GXiJYbs3EytFhBJu6zjfnJlKNjoJfNbWafw5LbezNcfCL
	 cB5BVrYIvGqgLPm8zf4MFSkEcBaMzER02mm7yB4tE/NdOSWFa++lmRQ2OpyEpwv+o1
	 S1jeLSdaTtOIktyXA9Jkbj/m+Ba8Nge9aNb2ckgkMe3YB59VyFgcBQdkUkMzwohfNP
	 ubiwVWkkp1MwoBwIj4IVRf9SUodlO3Ll4e6qqgPi1wtV2z7j0za1tfxg1ZDxTy3ZgT
	 gDefivX83lskrgK0iS1yAkFfGIGstJa77tyqE2guTtAzlfwYCb4l/SQvnAyw9Tj36w
	 tCOkzOIQHkqBg==
Received: by mail-yb1-f180.google.com with SMTP id k17so15194542ybm.11
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 07:15:33 -0700 (PDT)
X-Gm-Message-State: AAQBX9cR1SnE8EyzpVfD8BfO71+8alvjJXMpAhVIp1zkEoC8UUzVme2W
	i2trNLPOM1jUEEN6pdu041evlS6R/yEprKobyQ==
X-Google-Smtp-Source: AKy350ZeXniVT2W0ktHF46dUuFUd+2aQjm+2XyAkxeqa0Slnktr+HmXjjIzlRv8cYTFNbgA1dPwAYhkFOMccqFv+ZgM=
X-Received: by 2002:a05:6902:1586:b0:b68:7b14:186b with SMTP id
 k6-20020a056902158600b00b687b14186bmr7386177ybu.1.1680012932155; Tue, 28 Mar
 2023 07:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com> <20230321110813.26808-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20230321110813.26808-2-jiaxun.yang@flygoat.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Mar 2023 09:15:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKxJ-u4owKhY1tSiDyBo0=92iQoJM0G6TAZ7BSNpJAZAw@mail.gmail.com>
Message-ID: <CAL_JsqKxJ-u4owKhY1tSiDyBo0=92iQoJM0G6TAZ7BSNpJAZAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] of: address: Fix default coherency for MIPS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, hch@lst.de, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_071534_718794_89593688 
X-CRM114-Status: GOOD (  17.01  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNjowOOKAr0FNIEppYXh1biBZYW5nIDxqaWF4dW4ueWFu
Z0BmbHlnb2F0LmNvbT4gd3JvdGU6Cj4KPiBEVC1iYXNlZCBNSVBTIGRvZXNuJ3QgdXNlIE9GX0RN
QV9ERUZBVUxUX0NPSEVSRU5ULCBidXQKPiBtaWdodCBvdmVycmlkZSB0aGUgc3lzdGVtLXdpZGUg
ZGVmYXVsdCBhdCBydW50aW1lLgo+Cj4gVXNlIGRtYV9kZWZhdWx0X2NvaGVyZW50IHRvIG92ZXJy
aWRlIGRlZmF1bHQgY29oZXJlbmNlIGZvcgo+IE1JUFMuCj4KCkkgYXNzdW1lIHlvdSB3YW50IHRo
aXMgdGFnZ2VkIGZvciBzdGFibGU/IE90aGVyd2lzZSwgSSBkb24ndAp1bmRlcnN0YW5kIHdoeSB5
b3UgYWRkIHRoaXMgaGVyZSBhbmQgdGhlbiByZW1vdmUgaW4gcGF0Y2ggNC4KCj4gU2lnbmVkLW9m
Zi1ieTogSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL29mL2FkZHJlc3MuYyB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvYWRkcmVzcy5jIGIvZHJpdmVycy9v
Zi9hZGRyZXNzLmMKPiBpbmRleCA0YzBiMTY5ZWY5YmYuLmMxMDVkNjZhMWZhNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL29mL2FkZHJlc3MuYwo+ICsrKyBiL2RyaXZlcnMvb2YvYWRkcmVzcy5jCj4g
QEAgLTExMDUsNiArMTEwNSwxNCBAQCBib29sIG9mX2RtYV9pc19jb2hlcmVudChzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wKQo+ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+ICAgICAg
ICAgYm9vbCBpc19jb2hlcmVudCA9IElTX0VOQUJMRUQoQ09ORklHX09GX0RNQV9ERUZBVUxUX0NP
SEVSRU5UKTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIERULWJhc2VkIE1JUFMgZG9lc24n
dCB1c2UgT0ZfRE1BX0RFRkFVTFRfQ09IRVJFTlQsIGJ1dAo+ICsgICAgICAgICogbWlnaHQgb3Zl
cnJpZGUgdGhlIHN5c3RlbS13aWRlIGRlZmF1bHQgYXQgcnVudGltZS4KPiArICAgICAgICAqLwo+
ICsjaWYgZGVmaW5lZChDT05GSUdfTUlQUykgJiYgZGVmaW5lZChDT05GSUdfRE1BX05PTkNPSEVS
RU5UKQo+ICsgICAgICAgaXNfY29oZXJlbnQgPSBkbWFfZGVmYXVsdF9jb2hlcmVudDsKPiArI2Vu
ZGlmCj4gKwo+ICAgICAgICAgbm9kZSA9IG9mX25vZGVfZ2V0KG5wKTsKPgo+ICAgICAgICAgd2hp
bGUgKG5vZGUpIHsKPiAtLQo+IDIuMzcuMSAoQXBwbGUgR2l0LTEzNy4xKQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
