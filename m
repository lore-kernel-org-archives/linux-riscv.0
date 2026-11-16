Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDD606A33E
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kU5tJ5K3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=j1R36lNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Cc:To:Date:In-Reply-To:References:
	Mime-Version:Subject:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hH+9GaIR3GrSLVXARbWbdWbri/8zpbpU4SvWnH7z14g=; b=kU5tJ5K3sCGXtlx7LkC/3JJg73
	FogT43ozTjjHl0eKAySLINFQ0Q+azUQh+FNXiES+sg0atC1y6TCNVOMCI7tFYXzquQleFkqfmjXAE
	aTEAoFhQIIEke2PUX6u8q72iYRmv7Na7DxTr1rngQ9bxJYLH77I8xw12gH9gq1smkL9CfxXTQlkK1
	9KLmf6hmvv0cc+OjUlamVUUgYqjSOD58bc6WZx9JN/rMR175+dU/lXJAKeNxDJ/IEl5hDO9C8VaQZ
	8CqF63PaJG0ZgT0sm2CxirylNGz5kvVE2amv3ofwX8oZABgvmHVulR9TogK/FcRs6sBkGkesoY/0m
	N6UK52eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStNt-00000001qUU-36kS;
	Mon, 16 Nov 2026 09:52:21 +0000
Received: from va-2-40.ptr.blmpb.com ([209.127.231.40])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStNp-00000001qSk-45Th
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 09:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794822731;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2iklAlBcpFJxRr/HPLPp4nje7OoKOirn0CCaVROWVsk=;
 b=j1R36lNwjUJ2addpgThY4YRKGX9vowt87a0A16L4g8HECGOeaVFtirnSJnzZYO2T/lctba
 bMW5tENiSmXuy4dRDwDsno+bvZOjZfcv1T3TAfvaUpkQ9k6nmwp9+8Fs92F2rx7cfNnEdU
 i+/wkUrokfrUfeV5JRwqYr/PY2StxwlNDvmVodmBE8wFnSWzi5CVEX9YYLbZ/wu1TrpSzp
 rsQG4ceW44HekJQLvFCkgM8BXG5DfH1Meurmf3gmzSpke/y5/oySyD+RoeaQ8WTm3tv5qq
 P7tsZPQFMHHFmqEFcbD32PCALoBReuKOReej/ov+48ydzegHN6EjoJIe29uAcg==
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.63da97eb.e7e5.488f.8751.a4a1c53db9df@feishu.cn>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16afad249+0860e9+lists.infradead.org+sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033348.361452-1-sandie.cao@deepcomputing.io> <20261114075506-GKB100523@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
	<20261116082350-GKB100890@kernel.org>
In-Reply-To: <20261116082350-GKB100890@kernel.org>
Date: Mon, 16 Nov 2026 17:52:08 +0800
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"devicetree" <devicetree@vger.kernel.org>, 
	"linux-riscv" <linux-riscv@lists.infradead.org>, 
	"spacemit" <spacemit@lists.linux.dev>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015218_249879_9E7A3A04 
X-CRM114-Status: GOOD (  20.00  )
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
oCBNb24sIE5vdiAxNiwgMjAyNiwgMTY6MjQKCj4gPsKgCj4gPiBJbiB2ZXJzaW9uIDEgWzFdLMKg
IHRoZSBwYXRjaCBpcyBjZC1ncGlvcyA9IDwmZ3BpbyBLM19HUElPKDg4KSBHUElPX0FDVElWRV9M
T1c+Owo+ID4gYnV0IEszX0dQSU8oODgpIGlzIGZha2UgY2QtZ3BpbywgaXQncyB0aWVkIGxvdyBv
biBib2FyZC4KPiBTbywgdGhlcmUgaXMgZ3BpbyBjZCBwaW4sIGJ1dCBkaWRuJ3Qgd29yaz8gaXQn
cyBoYXJkIHRvIHNheSB3aXRob3V0Cj4gdGhlIHNjaGVtYXRpYywgYnV0IGNhbiB5b3UgY2hlY2sg
d2l0aCBoYXJkd2FyZSBwZW9wbGUsIGlmIGl0Cj4gY2FuIGJlIGZpeGVkIHdpdGggU29DJ3MgaW50
ZXJuYWwgR1BJTyBCSUFTIHB1bGx1cCBvciBwdWxsZG93bj8KPiBTbywgZ3BpbyBwaW4gaXMgYWJs
ZSB0byByZWZsZWN0IGNhcmQgaW5zZXJ0IHN0YXR1cwo+wqAKPsKgCgpJIGRpZCBjaGVjayB3aXRo
IG91ciBoYXJkd2FyZSB0ZWFtLCBhbmQgdGhlIGFuc3dlciBpczrCoAp0aGVyZSBpcyBhIENEIG5l
dCBvbiB0aGUgc2xvdCwgcm91dGVkIHRvIEszX0dQSU8oODgpLCBidXQgaXQgaXMgaGFyZC10aWVk
CsKgdG8gR05EIG9uIHRoZSBib2FyZC4gKHYxIG9mIHRoaXMgc2VyaWVzIHVzZWTCoApjZC1ncGlv
cyA9IDwmZ3BpbyBLM19HUElPKDg4KSBHUElPX0FDVElWRV9MT1c+LCB3aGljaCBvZiBjb3Vyc2UK
YWx3YXlzIHJlcG9ydHMgImNhcmQgcHJlc2VudCIuKSBJdCBpcyBhIGRpcmVjdCBjb25uZWN0aW9u
IHRvIEdORCwgbm90IGEKc3RyYXAgcmVzaXN0b3IsIHNvIHRoZSBTb0MncyBpbnRlcm5hbCBiaWFz
IGNhbm5vdCBwdWxsIGl0IHVwLgoKPiA+IFNvIEluIHZlcnNpb24yIFsyXSwgdGhlIHBhdGNoIGNo
YW5nZXMgdG8gbm9uLXJlbW92YWJsZS4KPiA+IEFuZCBJbiB2ZXJzaW9uMyBbM10sIGFkZCBjb21t
ZW50LsKgCj4gPsKgCj4gPiBUaGUgb3B0aW9uczogY2QtZ3Bpbywgbm9uLXJlbW92YWJsZSwgYnJv
a2VuLWNkwqAgYWxsIHdvcmsgb24gdGhpcyBib2FyZC4KPiA+wqAKPiBpdCB3b3JrcywgYnV0IGRv
ZXMgbm90IHJlZmxlY3QgdGhlIGhhcmR3YXJlIHN0YXR1cwo+wqAKPiA+IFdlIGp1c3QgbmVlZCB0
byBkZXRlY3QgdGhlIFNEIGNhcmQgd2hlbiBib290dXAsIGRvbid0IG5lZWQgdGhlIGRyaXZlcsKg
Cj4gPiB0byBkZXRlY3QgaG90LXBsdWcgZXZlbnQgLCBub24tcmVtb3ZhYmxlIHNob3VsZCBiZSBz
dWl0YWJsZSBhbmQgZmFzdGVyLMKgCj4gPiB3ZSByZWNvbW1lbnQgdG8gdXNlIG5vbi1yZW1vdmFi
bGUuCj4gPsKgCj4gTm8sIHRoaXMgaXNuJ3QgYSB2YWxpZCByZWFzb24sIGl0J3MgdXNlIGNhc2Ug
c2hvdWxkIGhhdmUgbm90aGluZyB0byBkbwo+IHdpdGggdGhlIHByb3BlcnR5Lgo+wqAKPiBNeSBw
b2ludCBpczogaWYgdGhlIGdwaW8gY2QgcGluIHN0aWxsIGRvZXNuJ3Qgd29yaywgYW5kIHRoZSBT
RCBjYXJkIGlzCj4gYWN0dWFsbHkgcGh5c2ljYWwgcGx1Z2FibGUsIHRoZW4gc2hvdWxkIHVzZSAi
YnJva2VuLWNkIi4KClRoZSBTRCBjYXJkIHNsb3QgaXMgb25ib2FyZCBbMV0swqAgcHV0IHRoZSBi
b2FyZCBpbnRvIGNhc2luZywgdGhlcmUgaXMgbm8Kd2F5IHRvIHBsdWdpbi8gcGx1Z291dCB0aGUg
Y2FyZC4gU28gdGhlcmUgaXMgbm8gY2FyZC1kZXRlY3QgZXZlbnQgdGhhdCBjYW4KZXZlciBoYXBw
ZW4gYXQgcnVudGltZS4KCklmIHlvdSBzdGlsbCBwcmVmZXIgYnJva2VuLWNkLMKgIEkgd2lsbCBm
b2xsb3cgaW4gbmV4dCB2ZXJzaW9uLsKgCgpbMV06IGh0dHBzOi8vZGVlcGNvbXB1dGluZy5pby9k
Yy1yb21hLXJpc2Mtdi1tYWluYm9hcmQtaWlpLXVudmVpbGVkLWF0LWZvc2RlbS1wb3dlcmVkLWJ5
LXNwYWNlbWl0LWszLWZvci1mcmFtZXdvcmstbGFwdG9wLTEzLwoKQmVzdCByZWdhcmRzClNhbmRp
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
