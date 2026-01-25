Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DE8E63C82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 04:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vEmLn5u7eXKJn3laMhBG/fyn6KRnsQ8PXul5Pb1QVk=; b=lEXtksLSdkdeTv
	/W10QJXh3IiyuSaE67wI/dHDV2m4JkcVEg+2LkhnR5aii2VfxEptu4PQT+MKElRBkURLSgBrYa+2U
	a4BG5JMCcl1imOLCbDrGVF1yzBwJH7gVWpphL98BPpDkXGORGcOY7D87slYcI/azIvO1mDy6K9dzn
	1Izj+iVDfIe17dIZSMpA0359z7b9kp0h43y6xDu8VCDMzBImLtvts4xKHK4jQlLqE0+HeJt6KJcdA
	q692/kSgehFRKK2cVYsAdpS0bPUIlDSBBJqaGwmIiYzz2MG0My4sDvF+yyfeWqV4j8xHfQv+fzbaT
	9vS5GUhp10xItn6FABiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrj8-0000000AqBd-3dKo;
	Sun, 25 Jan 2026 04:27:54 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrj6-0000000AqBI-1wUt
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 04:27:53 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-649655f14daso1171605d50.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 20:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769315271; cv=none;
        d=google.com; s=arc-20240605;
        b=ZvxmxcZlbQuSKxiCTcAFxrXktW3hqdz6muKEkbRaOLBG22Z0Q+NCqx/Yfew+syXT2v
         HkViKQOWOlIKBzkDYQn1YF7xPmg4NabwUJmtsgnF3QH4wRtY/yJk8VkUFarLj8UKVy4M
         wxoTGyBM40Y6cDo4epFlCj8JYQBoPs141tBylAvIuph7jAQZrGYn+GjAK8D+2h8Z2a3n
         XwerUTOMrf5dKSejo8AW1jusOBDHOo/UfO8Gujme2PY5N+M7rWi56fADqy6gKen5Sqdz
         dV1HkA2VzGAg+Fuv6Km+7OWNHzm8jyLlSzGDkbGcW+ROydIBWAvfihVHlj14GY85NQ+e
         MZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=743u7qbXka857vHX8yI0E82zy/lRytA6VvRqVxxVda8=;
        fh=kPtKFUFDGxp3MoHhHDl4XmopTgmVjb6zDsj//8hRJl4=;
        b=DLGW07lIZg7nkDflyYqoHaAIz9VJ59vraNZwEBL3GMqsylYcNH5MOmrvDsNCiuojSs
         biZ11d3IMUmHtXLTIngi/ES0oleWY/RDHdF6bj7iDgRrNFmiQXdQLLe32eu61TTYUvuA
         OHuOaaySZstNE07xqdV09jse5NBf0obL77ChU7CUBXRMEQuP8ySIubEtypYLi3NmoerN
         xI9HFUrfTUVuSuT9vC/B/1pvLmCJlUS8B5AN1csA4fI//ZlM4hbXDHS/q2AQQExHuNRw
         GTB3FvAxygQqIX0ydjR88hpu2CJitx0GUYK+/AAvDtea+T+fbfx1baT++lYGu+k2Q8U8
         i0aA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769315271; x=1769920071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=743u7qbXka857vHX8yI0E82zy/lRytA6VvRqVxxVda8=;
        b=Nj+94KT4ovTR7dYz9luAQF6vfEEPX28WgHrd1y0NP/oBFn/rzm80WGk86v8YKezEgw
         NB6OmErfgwUHB2iU8LlmOcR696+kD09eeyknLmhG5q3UA5D61YBM3g7gb/sDYfZFv8EK
         KiulpYPox5mqI4F2C06dn8a2NN8F7ujyAn0RpHWKeL1q6uAQcHMYFt79Um9TFCG/GY/1
         j5enPEcxGoCW0aotoKIrGkrguQWGw47tP1AfzXWEDYiT0ARaUuW1SH2yPBcLPLAUoGqI
         JNv2QMQl8UkfWwnlK1fxgeGNJVzVqjGZ71jNROfB3xVs1uEXV3mqQCVHiKTIJDOo0MkZ
         JlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769315271; x=1769920071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=743u7qbXka857vHX8yI0E82zy/lRytA6VvRqVxxVda8=;
        b=O+JDp5uFbP9onPFipWKAMSstm4mxGyT9wzuti817EWmm9z2pPoM2mqeuiWr/fuMJ9j
         OmS1svXEMTsImYlsxdIUA8i/CmZYXn+0ONJ/AwU+CNJyX37Zr6bSXBYruclYJWljoHYf
         mcOABfzvSnLR9B/h9+L6wgdAwBf1TJa7WbTOd8O8tWePBb58LSwi/JFvBTZ4E3e0sfc6
         dfU6bQcvsXIl6I04RzS0e/+aVHxWw7JPKRF+P2XUJr5AKL2oLj7y72l+Tljsi2JkzxFu
         /Tw8gKBpF1CIBSml1ZN/6qSCmJGBTM+t0MLOTh/ptKpzqQLF/ogPWNOa+X6Cv6Vt+1D8
         35Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUvJQQkAWfH+8881QENyez0hBji5dz6eG4Zlog4WBoZWttLQUO/oJTod55BqGmhSapeLoCmdx1D1n0UYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvZiiux6qEM0d0uUBvrIn7w2qvNArrgK6KuPfY0odaHbsCAcR0
	rSpkrXO9815Fxj0YZfLQQwhtMfJIliBI6tR1exBEIvUNEYoYLAeKW06UZuCC3YxKCAdjHkVXrPq
	5csXgEQrCJtPsvp3SXLWYmhqZawysv2mEDxtEnrs3OQ==
X-Gm-Gg: AZuq6aKazHgmMrFnZOqADkj1tBDS/vcP2NGJKty2o4SnT8bQOxamkrTfnUP4fkhAEQ8
	ZqNDPDik32/QvNf6VY/C4Tqaco9x5vcss+jyFt4SRq3a9yTCCzDP1CTgjuAkC9g/ym1zkPYP4yT
	eJf85HHcl5AvF3lFIIG9VuzBM1gDBQFwR3znLQRRAiL7Dqi19tBWG7/kO3ia9gkgQa9sg8xFIPF
	0A6YjWuaDKiUMT9Dbd0qlX+aVYb8JBM67ZWBhOXnKT/w6D0m49cmM6Gvoa7BQGqAmIyLIsoEOgI
	7tKbxarb7At3ckoXrrbilch9FHMywpJ/xlHr3EIICYiT6REgYQ4qfQE=
X-Received: by 2002:a53:accd:0:10b0:649:4963:7bac with SMTP id
 956f58d0204a3-64970d1bb15mr394172d50.74.1769315271142; Sat, 24 Jan 2026
 20:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn> <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
In-Reply-To: <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 25 Jan 2026 12:27:40 +0800
X-Gm-Features: AZwV_QiR-YxKTspwzVtAqnNU1yb2sCmX1Ygq3gSdAIf2_u_Qcvk5gX4z8V4nW9w
Message-ID: <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_202752_512555_EBF595F4 
X-CRM114-Status: GOOD (  24.17  )
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

T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMTI6MTjigK9QTSBHdW9kb25nIFh1IDxndW9kb25nQHJp
c2NzdGFyLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEphbiAyNCwgMjAyNiBhdCAyOjI14oCvUE0g
Vml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPiB3cm90ZToKPiA+Cj4gPgo+ID4g
T24gMS8yNC8yNiAwODoyMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+ID4gWy4uLl0KPiA+ID4KPiA+
ID4gTm90ZTogUGF0Y2ggMyBpbnRyb2R1Y2VzIGEgYmlzZWN0IGJyZWFrYWdlIGJ5IHRyYW5zaXRp
b25pbmcgdG8KPiA+ID4gcGluLXNwZWNpZmljIHN1cHBseSBuYW1lcy4gUHJvYmUgZmFpbHVyZXMg
d2lsbCBvY2N1ciBvbiBleGlzdGluZyBib2FyZHMKPiA+ID4gdW50aWwgUGF0Y2ggNCB1cGRhdGVz
IHRoZSBjb3JyZXNwb25kaW5nIERUUyBmaWxlLgo+ID4KPiA+IE91Y2gsIHRoYXQncyBub3QgYSBi
aXNlY3QgYnJlYWthZ2UsIHRoYXQncyBhbiAqQUJJIGJyZWFrYWdlKi4gQW5kIEFGQUlDVAo+ID4g
dGhpcyBpcyBzdGlsbCBub3Qgb2theSBpbiAyMDI2LAo+ID4gc2VlIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9BQkkucnN0Cj4gPgo+ID4gU28gdGhlIGJpbmRpbmdzIHdvdWxkIG5l
ZWQgdG8gYmUgY2hhbmdlZCB0byBhY2NlcHQgYm90aCB0aGUgbmV3IGFuZCBvbGQgd2F5Lgo+Cj4g
SWRlYWxseSB5ZXMuIEhvd2V2ZXIsIGNvbnNpZGVyaW5nIHRoaXMgQUJJIGNoYW5nZSdzIGFjdHVh
bCBlZmZlY3QsIHRoZSB0d28KPiBLMSBib2FyZHMgKEJQSS1GMyBhbmQgSnVwaXRlcikgaW4gdGhl
IGtlcm5lbCBnZXQgdGhlaXIgcG93ZXIgc2V0dGluZ3MKPiBmcm9tIGJvb3QgZmlybXdhcmUgYXMg
d2VsbCwgYW5kIHRoZSB0eXBlcyBvZiBwZXJpcGhlcmFscyBlbmFibGVkIGluIHRoZSAuZHRzCj4g
ZmlsZXMgYXJlIHZlcnkgbGltaXRlZCwgdGhlIHByb2JlIGZhaWx1cmUgb2YgdGhlIHBtaWMgcmVn
dWxhdG9yIGRvZXNuJ3QKPiBhZmZlY3QgbXVjaC4gU28sIEkgdGhpbmsgdGhpcyBicmVha2FnZSBp
cyBhY2NlcHRhYmxlLgo+Cj4gPgo+ID4gRHJpdmVyLXdpc2UsIGF0IGEgY3Vyc29yeSBsb29rIGZy
b20gc29tZW9uZSBub3QgZmFtaWxpYXIgd2l0aCB0aGUKPiA+IHJlZ3VsYXRvciBzdHVmZiwgbWF5
YmUgd2UgY2FuIG1ha2UgaXQgY29tcGF0aWJsZSB3aXRoIG9sZCBEVFMgYnkgYWRkaW5nCj4gPiB0
aGUgbmV3IG5hbWVzIGFzIGFsaWFzZXMgKHtkZXZtXyx9cmVndWxhdG9yX3JlZ2lzdGVyX3N1cHBs
eV9hbGlhcz8pIGFzCj4gPiAidmluIiBvciAiYnVjazUiLCBpZiB3ZSBzZWUgdGhlIG9sZCB2aW4t
c3VwcGx5IGRlZmluaXRpb25zPwo+ID4KPgo+IFdlIGNhbiBkbyB0aGF0IG9mIGNvdXJzZS4gTXkg
aGVzaXRhdGlvbiBpcywgaG93ZXZlciwgaXQgbWFrZXMgdGhlIGRyaXZlciB0YWtlCj4gZXh0cmEg
Y29kZSB3aGljaCBtYXkgbm90IGJlIG5lZWRlZCBvbmNlIGFsbCAuZHRzIGZpbGVzIGhhdmUgYmVl
biB1cGRhdGVkLiBUaGUKPiBkcml2ZXIgY29kZSB3aWxsIGJlIGxlZnQgdGhlcmUgZm9yZXZlci4K
PgoKTWFyayBnYXZlIGhpcyBvcGluaW9uIGluIHYxIHJldmlldyBbMV0sIHBsZWFzZSBhbGxvdyBt
ZSB0byBwYXJ0aWFsbHkgcXVvdGUKaGVyZTogIihpdCdzIGFuIEFCSSBjaGFuZ2Ugc28gc2hvdWxk
bid0IHJlYWxseSBoYXBwZW4sIGJ1dCBwZXJoYXBzIHRoZXJlIGFyZQpmZXcgZW5vdWdoIHVzZXJz
IGZvciBldmVyeW9uZSB0byBjb29yZGluYXRlIGFuZCBpdCdzIHdoYXQgeW91IGFsbCBwcmVmZXIp
LiIKCkkgZG8gZXhwZWN0IHRvIGNvbGxlY3QgbW9yZSBpZGVhcyBiZWZvcmUgSSBkZWNpZGUgd2hl
dGhlciBhbmQgd2hhdCB0byBkbyBpbgp2Mywgb3IgbWF5YmUgdjMgaXMgbm90IHJlcXVpcmVkLgoK
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzJlMmMyNzU0LWZkM2UtNGZkMy1hYWU0
LWQ3YWY2M2UzYjUyOEBzaXJlbmEub3JnLnVrLwpbMV0KCj4gQlIsCj4gR3VvZG9uZyBYdQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
