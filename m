Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7125606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 02:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVxX/dNY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=16YLyYfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Cc:To:Message-Id:Date:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jl8TaJf6A1lkVBfVSS5eh5wFg903josUmhz7CrNwiv8=; b=SVxX/dNY5NwXhE4dXkfXb0+gNg
	cVtiwH/0tLof4lAuBGoQyylna+B8jZpHf+Y4cwTy+aoS65jKiv0B5aHUwK7g819aGJmRKzVTbImVS
	kpqiWi8HfvYMF6xfSSdT+bktXrte5n953lEGe9MATjS7BXeQ8hgTGhKrqNjODYx9gNyod9vvT+iqW
	axQMGo1+MUeTpWVaJKQVlAP+wGoK+0ytLwtdoihC1mT6wmpue7lmDejDZGwY0LpQPWvqVUuxdHXMI
	kG5OZrfu85dl/jhxu/LBC4F7ycWu/Uz5zT6Mz3qU9lM1FJZUjrs23UOcUbX/mXe0WittgPWUr2IVM
	ApEmscUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSms1-00000000yZy-2TgJ;
	Mon, 16 Nov 2026 02:55:01 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmry-00000000yZH-1zIH
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 02:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794797682;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=LFNkNbE/BJjMMZVJ30Nnj44+C1fdsFY5EBU4BEDDicQ=;
 b=16YLyYfQbcyz3cZNUAjyKBpGujVF7ypjPj8iR9/eaz7hjdUx8OZ5ZjEKnowaNINjZBtUl7
 90/5zh8XeyB4QE3S/1fBfRxqb35JLHitd307jfJcuDaOkYsjZnXcGTpKOHCNshptNS0AW1
 1nyY9anLM55fPLVeWkCCvBWdirSH4j8JKMqhxl4fO9/o9oNEaCvp+yFlWAS+xZ4OYrp24G
 aJ1Mo7ht+71askjNKTQKMQps6NbnkxHCNoZvv7a+BtUUyIDerRXbirUEc+Bh3iQEa8/SU8
 8Yed2XoDZ+rqXz0qkCrRqnUDdQlQR9Tcg0ciK/70kHS+qwc4N5F4uhf46dTKtg==
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20261114073025-GKA100523@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033310.361435-1-sandie.cao@deepcomputing.io>
	<20261114073025-GKA100523@kernel.org>
X-Lms-Return-Path: <lba+16afa7070+91238d+lists.infradead.org+sandie.cao@deepcomputing.io>
Date: Mon, 16 Nov 2026 10:54:38 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.c24fe633.1394.4ffc.88d5.f9ade9d7763c@feishu.cn>
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_185458_780916_34852285 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksIFlpeHVuOgoKPiBGcm9tOiAiWWl4dW4gTGFuIjxkbGFuQGtlcm5lbC5vcmc+Cj4gRGF0ZTrC
oCBTYXQsIE5vdiAxNCwgMjAyNiwgMTU6MzAKPiBIaSBTYW5kaWUsCj7CoAo+IE9uIDExOjMzIE1v
biAwOSBOb3YgwqAgwqAgLCBTYW5kaWUgQ2FvIHdyb3RlOgo+ID4gQWRkIFVTQiBkZXZpY2Ugbm9k
ZSAoYiwgYywgZCkgdG8gRGVlcENvbXB1dGluZyBGTUwxM1YwNSBib2FyZC4KPiAuLgo+ID4gVVNC
IEEgd29ya3Mgb24gb3RnIG1vZGUsIGl0IGlzbid0IGNvbmZpZ3VyZWQgY3VycmVudGx5Lgo+IERy
b3AgaXQsIG5vdCByZWFsbHkgdXNlZnVsIHRvIG1lbnRpb24gdGhlcmUsIGlycmVsZXZhbnQgdG8g
dGhpcyBwYXRjaC4KPsKgCj4gQ3VycmVudGx5LCBObyBVU0IgQSBwb3J0IHN1cHBvcnQgaXMgbWVy
Z2VkIGluIG1haW5saW5lIGNvZGUuCj4gRllJLCBDaHVueWFuIHN1Ym1pdHRlZCBhIHBhdGNoIGZv
ciBhZGRpbmcgcGVyaXBoZXJhbCBzdXBwb3J0IG9mIFVTQiBBLgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MTEwNTEwMzEyNS4yNzI3MzQxLTEtY2h1bnlhbi56aGFuZ0BsaW51eC5z
cGFjZW1pdC5jb20vCj7CoAoKT2ssIEkgd2lsbCBkcm9wIFVTQiBBIGluIG5leHQgdmVyc2lvbi4K
SSBwcmVmZXIgdG/CoCBzdWJtaXQgYSBuZXcgcGF0Y2ggZm9yIFVTQiBBIHNlcGFyYXRlbHkuCgo+
wqAKPiA+IC0gNCBVU0ItQyBQb3J0cwo+IMKgIMKgIMKgIH5+fn5+IFVTQiBUeXBlLUM/IGxlc3Mg
Y29uZnVzaW5nCj4gPiDCoCDCoCDCoC0gUG9ydCAxOiBQRCAzLjAgKDY1VyBNYXgpLCBVU0IgMy4y
IEdlbiAxCj4gPiDCoCDCoCDCoC0gUG9ydCAyOiBQRCAzLjAgKDY1VyBNYXgpLCBVU0IgMy4yIEdl
biAxLCBEUCAxLjQgKDRLQDYwSHopCj4gPiDCoCDCoCDCoC0gUG9ydCAzICYgNDogVVNCIDMuMiBH
ZW4gMQo+wqAKPiBGb3IgIlBvcnQgWCIgaGVyZSwgaXMgaXQgYSBuYW1pbmcgZnJvbSBGTUwxM1Yw
NSdzIHNjaGVtYXRpYz8KPiB3b3VsZCBiZSBncmVhdCB0byBtZW50aW9uIHdoaWNoIHNwZWNpZmlj
IFVTQiAzLjAgY29udHJvbGxlciAoUG9ydCBCLCBDLCBEKQo+IMKgb2YgdGhlIFNvQyBpdCBjb25u
ZWN0IHRvLi4KPsKgCj4gPsKgCgpJIHdpbGwgY29ycmVjdCBhYm92ZSB0byBQb3J0IEIsIEMsIEQu
CgpCZXN0IHJlZ2FyZHMKU2FuZGllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
