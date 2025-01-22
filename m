Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C773C02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIzOnTdDH1TOBH6YgPLp+5pNlJRb3gm9AYMGGFH+i+0=; b=wk8zbaW2ONgOjl
	In6zDP4eTL/aSQgyfoBcFy4DddsUZv2yebDLdXNEGxKouZPh+SnJY6Ow42D7ftzF1+Hmzf43wgX/E
	2jrzJmUvH+/rUNMkEKzYLvyvK/CQx9hPxgoA4k8ERfwo2nAQVejYhLh3WMc+yMF/9vLmv5VfCkhi8
	k+miym/oVULoOrd1IkyOnICzhH9VLZoai27WfyTDrtdGTvXHmKQpwzJtENUncQ1r9gJIYIOGRP97K
	V8s4+7v3JNANu3R4v8pcKNgLI3jG9qL0Qgs6iDz9u2wu0q3O19Au3YJhfneCW3J2JI0CiW865I/Fd
	xWFctpPBk9xFQPeD/2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVm5-00000009fnL-3grw;
	Wed, 22 Jan 2025 08:07:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVke-00000009fYn-2M6U
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 08:06:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A20D85C5CA7
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 08:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9748DC4CEE8
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 08:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737533175;
	bh=vTyHnhvRW9VyumFezYy1LbSefMo0zhGQhJdvbirTvus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LZmtW4yrIT3grMzw6LaV1qdt/U5XNyeSaHtjWZpLp8//NfhI5XehbSE2AdPqDVBp9
	 SinxIMlvvsMTn8W0iJgMWPuSlSH5mEAh5RY90ztBt5m7lWJbwQGMptP3VGgpyNyoED
	 pbVsgwu7Zy6nBs6AMGv/1gzgxXoPI7wG+zbh2SWYi0oWrZmQ3N0Pmz4EKiRS6/A8or
	 kkNlgasiKNi5MnReSEWaRJ+FMjpCw4C/ZVS9Qprct5gNrTJNtqxEmgmNyXFdmjlKvr
	 8+/eYZZVMhHdnEGCQB+eSHEHbg4HLakTAN99xJRymlFhnwNAPq1JM7/uQwq5H5kGye
	 muKHfGfCsd2ZA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso12576207a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 00:06:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlQQGM8qkUu5GZebY2mB+Hc02VS1B9VYvW7eaAny2/FBEs1W6+hzjkw9bOumhnqqDJvzNLb5lMyy9DDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9VtgUFaxHCyj+oK+29EvLWEqxK5+LnrK2SJzQlPbnqQrwRmzW
	/nL8g429sIrxFHBmtAciv3/akld7VmM9w7Z/iBm3+KU2QK5Mayi8v/Q7GKCWlrTzz2FiktEJQ7T
	gYzkalAAvq7DCc6lByNkpCuhNiGE=
X-Google-Smtp-Source: AGHT+IEqdNQPkcdgwV2S6Ycf6gfq3Wp1MlPTEdyAPi1hC9cu7CfF2C7JSmBCsk2tpf3GeVK2Bwf3y92MZ+sTdlpXnK0=
X-Received: by 2002:a17:907:746:b0:ab3:2b85:5d5 with SMTP id
 a640c23a62f3a-ab38b4aa1c6mr1954220166b.49.1737533174012; Wed, 22 Jan 2025
 00:06:14 -0800 (PST)
MIME-Version: 1.0
References: <20250122025013.37155-1-guoren@kernel.org> <TYCPR01MB11040EA25C858F700C3AC9694D8E12@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11040EA25C858F700C3AC9694D8E12@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Jan 2025 16:06:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQTLHjKa9SJLnh1fpQK-kVC1_pjFD3geiusa-QKzh4FQg@mail.gmail.com>
X-Gm-Features: AbW1kvZkqNU4VV84qLvqjbaXXVaIogoR-XnGOINsng-2aloA7Q-ncoSdLBv6QYk
Message-ID: <CAJF2gTQTLHjKa9SJLnh1fpQK-kVC1_pjFD3geiusa-QKzh4FQg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: Fix compiler warning
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>, "conor@kernel.org" <conor@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Guo Ren <guoren@linux.alibaba.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_000616_687636_A594FA22 
X-CRM114-Status: GOOD (  20.89  )
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

T24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgMTI6NTnigK9QTSBZb3NoaWhpcm8gU2hpbW9kYQo8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBUaGFu
ayB5b3UgZm9yIHRoZSBwYXRjaCEKPgo+ID4gRnJvbTogZ3VvcmVuQGtlcm5lbC5vcmcsIFNlbnQ6
IFdlZG5lc2RheSwgSmFudWFyeSAyMiwgMjAyNSAxMTo1MCBBTQo+ID4KPiA+IEZyb206IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBkcml2ZXJzL3VzYi9nYWRnZXQv
dWRjL3JlbmVzYXNfdXNiMy5jOiBJbiBmdW5jdGlvbiAncmVuZXNhc191c2IzX3Byb2JlJzoKPiA+
IGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmM6MjYzODo3Mzogd2FybmluZzog
JyVkJwo+ID4gZGlyZWN0aXZlIG91dHB1dCBtYXkgYmUgdHJ1bmNhdGVkIHdyaXRpbmcgYmV0d2Vl
biAxIGFuZCAxMSBieXRlcyBpbnRvIGEKPiA+IHJlZ2lvbiBvZiBzaXplIDYgWy1XZm9ybWF0LXRy
dW5jYXRpb249XQo+ID4gMjYzOCB8ICAgc25wcmludGYodXNiM19lcC0+ZXBfbmFtZSwgc2l6ZW9m
KHVzYjNfZXAtPmVwX25hbWUpLCAiZXAlZCIsIGkpOwo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+ICAgICBefiAgIF4KPgo+IEp1
c3QgYSByZWNvcmQuIFNpbmNlIHRoZSBtYXhpbXVtIG51bWJlciBvZiBlcCBpcyB1cCB0byAxNiwg
c3VjaCBhbiBvdmVyZmxvdwo+IHdpbGwgbm90IG9jY3VyIGFjdHVhbGx5LiBBbnl3YXksIGZpeGlu
ZyB0aGlzIGNvbXBpbGVyIHdhcm5pbmcgaXMgZ29vZC4KPgo+ID4gRml4ZXM6IDgyOTI0OTNjMjJj
OCAoInJpc2N2OiBLY29uZmlnLnNvY3M6IEFkZCBBUkNIX1JFTkVTQVMga2NvbmZpZyBvcHRpb24i
KQo+Cj4gUGxlYXNlIHVzZSB0aGUgZm9sbG93aW5nIEZpeGVzIHRhZzoKPgo+IEZpeGVzOiA3NDZi
ZmU2M2JiYTMgKCJ1c2I6IGdhZGdldDogcmVuZXNhc191c2IzOiBhZGQgc3VwcG9ydCBmb3IgUmVu
ZXNhcyBVU0IzLjAgcGVyaXBoZXJhbCBjb250cm9sbGVyIikKT2theQoKPgo+IEJlc3QgcmVnYXJk
cywKPiBZb3NoaWhpcm8gU2hpbW9kYQo+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IDxzbmlw
IFVSTD4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYyB8IDIgKy0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYyBiL2RyaXZlcnMv
dXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmMKPiA+IGluZGV4IGZjZTVjNDFkOWYyOS4uODli
MzA0Y2Y2ZDAzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2Fz
X3VzYjMuYwo+ID4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYwo+
ID4gQEAgLTMxMCw3ICszMTAsNyBAQCBzdHJ1Y3QgcmVuZXNhc191c2IzX3JlcXVlc3Qgewo+ID4g
ICAgICAgc3RydWN0IGxpc3RfaGVhZCAgICAgICAgcXVldWU7Cj4gPiAgfTsKPiA+Cj4gPiAtI2Rl
ZmluZSBVU0IzX0VQX05BTUVfU0laRSAgICA4Cj4gPiArI2RlZmluZSBVU0IzX0VQX05BTUVfU0la
RSAgICAxNgo+ID4gIHN0cnVjdCByZW5lc2FzX3VzYjNfZXAgewo+ID4gICAgICAgc3RydWN0IHVz
Yl9lcCBlcDsKPiA+ICAgICAgIHN0cnVjdCByZW5lc2FzX3VzYjMgKnVzYjM7Cj4gPiAtLQo+ID4g
Mi40MC4xCj4gPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
