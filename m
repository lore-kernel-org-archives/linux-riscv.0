Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936D6CD5BB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhFcZb5FZtAYWKkArQMCuh/v6F3/fX+niFSK86er0oY=; b=oinmPPIbz2wfyI
	86QF72ifXO0RsawzYTI3fdb4/tAGmDxJ+9O6Zw9wFdZ6ubKfWxKB6jZYWBLXH5nIY7X813nVKI6h1
	nY89MnWD+WA1ZRmqlG6WpzpcX5hoZiuaN0JzFFT2OvkJj09Jg6JyJC1BREh1yb4ARWyBkRveT2cNQ
	K85LzPXDqvWOKqGhjbMcxqThkJ/PiYWLZhNe04gG9/brsjSfu7UuB685IUmpvwGwJ7mzLUnp6BauB
	snPJ59cmt94B+ntMklUU3pZZnE/1mxQ8Qx98ONpbVXdvPja+lFMLRv5YARryVVqiSCoPzWnLC+wQE
	y/fOiTQCcA0UlSEEevoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVGa-0000000HIsY-17er;
	Mon, 25 May 2026 13:22:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVGX-0000000HIrk-3pWl
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 13:22:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso121316175e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 06:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779715363; cv=none;
        d=google.com; s=arc-20240605;
        b=PWo+ryYp24zJl6DIvZhp/8OezddG3c3pGsXfe5xnB01fsNbSTrdhoUHRy+zT5TFXAz
         SpwasYNNGqpntHJgKFZ7b7Vog8H5ejM2uiYwc8KMU2kZAkWyM7YZW90TJDStSGRvbfMh
         2Kir1BvJogTKHJaErp8s0zRqgipGQ+ooRewPsu3u5daUaAHKiGkvnc8WQOTUPlUKmVQY
         DJR0t2NoC66nH+nQk0buadZ2W0KO+/YR3xHAVxZznsD3q6twchVELEKMrDZ3JeTDqVBF
         1ZdeyiVXQh5utyu19JHz8FmA78uHxmHgvjyevd69UGXCwPWnLXic3oF5qre32/BkDcZs
         jaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVWHHLtV3wsoEoIkDxAp/Q4X6LYafwdIe2f4XDqtwrU=;
        fh=DI3bqNR6EEc2mhmCt3PwCFRqzlywWN+BlOTOjnFZJC8=;
        b=UWnFeYul//rCsWvK1RoO0Eg8pRzcKCqHzW2Vrb4xDuqZPIcuZ4hrACmKjpHqLeg5ml
         P6sDS3hm/VV+XVP4V+mu3YUtRI/FsKlTyVasjYkLtRvVarrvfopKws8Go7RTsyNHTIdn
         be8tWwfD49I3ySCNStx2aozjPqST6oLdh4/WBE7roAN5iekC4owKlCLT6VQUswWubicj
         kgFKLBGGPGHCT+lZbqKmj274X8DpVpycykqPfHn7iHM3J26AT9QMadZ3yrVps0GRmKMI
         saR/mJX4w5sbKFrDYaC0znjkx0zcMa54+xDJFz1FXx8MkVVhjITBxcRshcIslZwGUZzS
         Z4gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715363; x=1780320163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVWHHLtV3wsoEoIkDxAp/Q4X6LYafwdIe2f4XDqtwrU=;
        b=czKQEINE08yoVvimsLrtscZ+1H98ULW1oQFUIvCk3zd8U/YTrV9g63ROezInv7IQo1
         GpBIeK6YvB62NbZtAYdhUCk7q+5NzT9QGiTFj+As1nLak8seJ4pLocIph0Aog8ene5MH
         1X+XN1z3qhZ4b6iPYzO+GmHn0zNvwVp636AlkjMTLVRVj8tPj+lA1CM/APFQjrFD8z4v
         ysTeg45ebKI2q0SH0PoSpOarR/RpQcp64Fpk/BMxVwrmIZ/CyN5kBxOiT6tMBxnZEyqa
         PRCkzBCxqYJiE0AYgBJN0o9ccdY0jndR6Im7td8jneMU692xJrF7YN/3fgGX9oGt3lOX
         Upig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715363; x=1780320163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVWHHLtV3wsoEoIkDxAp/Q4X6LYafwdIe2f4XDqtwrU=;
        b=loEZI+CBQqTUlDdl8nPiaMFxIrD158b24UDovSucUPG/51dscRIUYlkEzGJI7/u2xw
         AhiummGqpWY78BmZgds3rrKFS5e1lbDio3MWyMKPcLHm/GeWWVFCMOP2+mn4OFMR3b4T
         KmpWY6eZ1Y+uOTt2pPr9Xq4lpJjBm74FwQqpA9tTJXlgw7C6Q1cCzHADPn5+lvtZ4Rsj
         zdUJYFT7ozytsO9Aut1VWC125VEDxQ9+NxEelgkzReUr+LEyJ5voEmNwxvattEGyROS/
         Y2LAfbPX7qKIURBoQLlelN3MRvcUtGSunJoOTvgiBj8B3vpG3KzZebR429L8wFfBsqFT
         y9Dg==
X-Forwarded-Encrypted: i=1; AFNElJ+XBj8BjyQYX2I10NcZQmDSwnlD6NRWctlUh03oAJQehU6mG4BIJvW/44F0aQSQOZ7cw6/8qwzt91ffiw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3KjaiziYyeZ7pUYjY0lynEzEtRxkrItEHpFl0ZBfKGwNe3kR0
	5LapoW4nSODn/UCu9A0hynJfq1mnIaSAel1RN09Rr9UyjlQlMoh8ZMwCTAXnvbcKBFxsUaemL4S
	3sL32p+za3G6hpXVhU2u5RlzpmPISkxk=
X-Gm-Gg: Acq92OF7FuHpcQBfTFGw+ybOsgL9SOGljRly4caSeYJImCrL+Ud5ycxh9E8pWs7Y1eu
	Jq/6/nLujTuFRh46KpSOSX5vxe1niYgywsPzo3aUbmCpTMfpPddi67HYw4JfFKiQYJfuMNSCoY6
	ACAE4fKhkU8kxLetrLn3Y51/N3ISEQo2vUa8VpMd4k/2J22j1zxPk8DDlVKmmFGwxPYwDZwyx5z
	JPTehaAZNq27ImBL1ZkZJVt269K/UHG6t2RgBp0ugDMzSiipCCGrkn+efuxzwNpLe+3BkmnYyI6
	Azt5b0GvvQ==
X-Received: by 2002:a05:600c:3b9f:b0:48d:35e:82cb with SMTP id
 5b1f17b1804b1-490428e93d6mr258730615e9.28.1779715363196; Mon, 25 May 2026
 06:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <aeWyuC3nXrP9McNy@adminpc-PowerEdge-R7525> <1d3c3d6a-dbd2-b56e-5a44-e9aded173d33@kernel.org>
In-Reply-To: <1d3c3d6a-dbd2-b56e-5a44-e9aded173d33@kernel.org>
From: Austin Kim <austindh.kim@gmail.com>
Date: Mon, 25 May 2026 22:22:30 +0900
X-Gm-Features: AVHnY4LEb6G1_1kCLlpSSyklxTBbAhzDUehw3wcBhE6dVEmPkrbpTt6BXHPz9aA
Message-ID: <CADLLry4ViFKFT09iSYXm2FjadZp+=CZZeH4-j=+m4c75hJrdEA@mail.gmail.com>
Subject: Re: [PATCH] riscv: check leaf entry alignment in pageattr_pxd_entry()
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_062245_967012_ABEF7D7B 
X-CRM114-Status: GOOD (  18.19  )
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

SGVsbG8gUGF1bCwKCjIwMjbrhYQgNeyblCAyM+ydvCAo7YagKSDsmKTsoIQgODozNCwgUGF1bCBX
YWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IEhpIEF1c3RpbiwKPgo+
IE9uIE1vbiwgMjAgQXByIDIwMjYsIEF1c3RpbiBLaW0gd3JvdGU6Cj4KPiA+IER1cmluZyBwYWdl
IHRhYmxlIHdhbGtpbmcsIGVuc3VyZSB0aGUgcmFuZ2UgYmVpbmcgcHJvY2Vzc2VkIG1hdGNoZXMK
PiA+IHRoZSBleHBlY3RlZCBzaXplIG9mIGEgbGVhZiBlbnRyeSAoUDRELCBQVUQsIG9yIFBNRCku
IFdoaWxlIHB4ZF9hZGRyX2VuZCgpCj4gPiBmdW5jdGlvbnMgaGFuZGxlIGJvdW5kYXJ5IGNoZWNr
cywgdGhleSBkbyBub3QgaW5oZXJlbnRseSB2YWxpZGF0ZSB3aGV0aGVyCj4gPiB0aGUgZW50cnkg
aXMgYSBsZWFmIG5vZGUgb2YgdGhlIGV4cGVjdGVkIHNpemUuCj4gPgo+ID4gQWRkIFdBUk5fT05f
T05DRSgpIHRvIGRldGVjdCBtaXNhbGlnbm1lbnRzIG9yIHBhcnRpYWwgdXBkYXRlcyBvZiBodWdl
Cj4gPiBwYWdlcy4gSWYgYSBtaXNtYXRjaCBpcyBkZXRlY3RlZCwgcmV0dXJuIC1FSU5WQUwgdG8g
cHJldmVudCBwb3RlbnRpYWwKPiA+IGNvcnJ1cHRpb24gb2YgcGFnZSB0YWJsZSBlbnRyaWVzLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1c3RpbmRoLmtpbUBnbWFpbC5jb20+
Cj4KPiBJcyB0aGlzIGluIHJlc3BvbnNlIHRvIGEgZmFpbHVyZSBtb2RlIHRoYXQgeW91J3ZlIHNl
ZW4/ICBPciBpcyBpdCBzaW1wbHkKPiBwcm9waHlsYWN0aWM/Cj4KPiBTZWVtcyBsaWtlIGEgYmV0
dGVyIHBsYWNlIGZvciB0aGlzIG1pZ2h0IGJlIGluIGNvbW1vbiBjb2RlLCBzbyBvdGhlcgo+IGFy
Y2hpdGVjdHVyZXMgY291bGQgYmVuZWZpdCBhcyB3ZWxsPwoKVGhlIGFuc3dlciBpcyB0aGF0IHRo
aXMgY2hhbmdlIGlzIG1haW5seSBwcm9waHlsYWN0aWMsCmFsdGhvdWdoIGl0IHdhcyB0ZXN0ZWQg
b24gYSBSSVNDLVYgYm9hcmQgdG8gbWFrZSBzdXJlCml0IGRvZXMgbm90IGludHJvZHVjZSBhbnkg
dW5leHBlY3RlZCBzaWRlIGVmZmVjdHMuCgpUaGUgcGFnZWF0dHJfcDRkX2VudHJ5KCkgZnVuY3Rp
b24gaXMgcmVnaXN0ZXJlZCBhcyBhIGNhbGxiYWNrCmFuZCBpcyBjYWxsZWQgZnJvbSB0aGUgcGFn
ZSB3YWxrZXIgY29kZToKCm1tL3BhZ2V3YWxrLmMKc3RhdGljIGludCB3YWxrX3A0ZF9yYW5nZShw
Z2RfdCAqcGdkLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBlbmQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG1tX3dh
bGsgKndhbGspCnsKICAgICAgICAuLi4KICAgICAgICBpZiAob3BzLT5wNGRfZW50cnkpIHsKICAg
ICAgICAgICAgICAgIGVyciA9IG9wcy0+cDRkX2VudHJ5KHA0ZCwgYWRkciwgbmV4dCwgd2Fsayk7
CgpXaXRoIHRoZSBjdXJyZW50IGNvZGUgZmxvdywgdGhpcyBjb25kaXRpb24gc2hvdWxkIG5vdCBi
ZSByZWFjaGFibGUgaW4Kbm9ybWFsIG9wZXJhdGlvbi4KVGhlIFdBUk5fT04oKSBpcyBpbnRlbmRl
ZCB0byBjYXRjaCB1bmV4cGVjdGVkIHNpdHVhdGlvbnMgaWYgdGhlIHBhZ2UKd2Fsa2VyIGJlaGF2
aW9yIGNoYW5nZXMKaW4gdGhlIGZ1dHVyZSBvciBpZiByZWxhdGVkIGNvZGUgaXMgbW9kaWZpZWQu
CgpJIHdpbGwgYWxzbyBsb29rIGZvciBhIG1vcmUgY29tbW9uIHBsYWNlIHdoZXJlIGEgc2ltaWxh
ciBjaGVjawpjb3VsZCBiZSBpbXBsZW1lbnRlZCBzbyB0aGF0IG90aGVyIGFyY2hpdGVjdHVyZXMg
bWF5IGJlbmVmaXQgYXMgd2VsbC4KClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4KCkJSLApB
dXN0aW4gS2ltCgo+Cj4KPiAtIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
