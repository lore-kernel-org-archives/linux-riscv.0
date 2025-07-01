Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCC7C8303A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Isn2UPy+euBFNGWHxBTNzf2shaKGRxlnm1NdVSF5HB4=; b=gYNnNNd011VLBw
	Plpz5GUgA86lqACAcgAP7EgZPIC4yx3pwniOBj6CtwfIsviyQaaIZaqp/zoCRpO7lTT+ygnv9pTS1
	KRdzRVI+Yn45tjluyErxxqKZKc45cvIhHtIUj+liN9sjNri7kWaKTiIMLEP14+OEUW/KZBo0oaMql
	2kL8v2HgFPQK0onWLVeaw9n5at2TU8zczX/CHnPCUWX1JwDuAxsgyQjOU12Y6zlzzsR57ASQGcx3C
	rMm+q+5+TBK+CHv80RKuAni+yjcBa0F5CibvyWfjbKGTZ7vwAsvhaZbDPw2Ti7P010x9Ftay8i3k6
	6+oWrh+Gru7r/aUGYDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYyB-00000004qnP-356I;
	Tue, 01 Jul 2025 11:16:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYpc-00000004px6-20st
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 11:07:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6C745C6493;
	Tue,  1 Jul 2025 11:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E43C4CEEB;
	Tue,  1 Jul 2025 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751368039;
	bh=QvUkAIj85QispQ/Cda6kxqhm5CHP0RxSRAtQsd9DPbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7GZChhX1jIGglTCB6ytto/fvvg7NWrSPNfZQwWfVXH4VPxJ37v2OCyFpfp8ZMofi
	 yzD6f21+FrwFsN6thLLYUbL89IDVsaJcI3rcY5r3we9p0EcOO0ZkdH9vQYjFeHLOAc
	 vjF8cQqH27UlHDnmQr8w542/Wd3U5bgEigvxAmG/pO+kdfvctNi3tNeD+hkJo8XBvn
	 AGnDrS+QOPOJ2lql/PMSLP4x0+drp3IILj/Ax06aJcixFn8w36sa30oRzZw/lRK7Fl
	 xNk+CqlU9x1is+X07hzCaNGH0XONGITOUgiU31yJtkTUfgZrXe9sLlJz9TLMUG2wlF
	 JafNuKRYR6ZNg==
Date: Tue, 1 Jul 2025 12:07:13 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <20250701110713.GL10134@google.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-3-elder@riscstar.com>
 <20250627125119.GF10134@google.com>
 <0eda5bf4-ce63-43da-9c2f-7d4ec902758c@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0eda5bf4-ce63-43da-9c2f-7d4ec902758c@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_040720_560492_C2A84D3F 
X-CRM114-Status: GOOD (  16.06  )
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

T24gRnJpLCAyNyBKdW4gMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gT24gNi8yNy8yNSA3OjUx
IEFNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+IEBAIC05MywxMiArOTMsMzAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzaW1wbGVfbWZkX2RhdGEgbWF4aW1fbW9uX21heDc3NzA1ID0gewo+ID4gPiAg
IAkubWZkX2NlbGxfc2l6ZSA9IEFSUkFZX1NJWkUobWF4Nzc3MDVfc2Vuc29yX2NlbGxzKSwKPiA+
ID4gICB9Owo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHNwYWNlbWl0
X3AxX3JlZ21hcF9jb25maWcgPSB7Cj4gPiA+ICsJLnJlZ19iaXRzID0gOCwKPiA+ID4gKwkudmFs
X2JpdHMgPSA4LAo+ID4gPiArCS5tYXhfcmVnaXN0ZXIgPSAweGFhLAo+ID4gPiArfTsKPiA+IFN1
Z2dlc3QgbWFraW5nIHRoaXMgbW9yZSB3aWRlbHkgdXNlZnVsIGJ5IGFkZGluZyB0aGUgJ21heF9y
ZWdpc3RlcicKPiA+IGF0dHJpYnV0ZSB0byAnc3RydWN0IHNpbXBsZV9tZmQnIGFuZCBjb25kaXRp
b25hbGx5IG92ZXJyaWRpbmcKPiA+IHJlZ21hcF9jb25maWdfOHJfOHYncyB2YWx1ZSBkdXJpbmcg
cHJvYmUuCj4gCj4gU28geW91J3JlIHN1Z2dlc3RpbmcgSSBtYWtlIGEgZ2VuZXJhbCBpbXByb3Zl
bWVudCB0bwo+ICJzaW1wbGUtbWZkLWkyYy5jIiwgYmVjYXVzZSBldmVyeWJvZHkgZWxzZSBqdXN0
IHVzZXMKPiB0aGUgZ2VuZXJpYyBmYWxsYmFjayByZWdtYXAgY29uZmlnPwoKWWVzLCBleGFjdGx5
IHRoYXQuCgo+IChJJ20gYXNraW5nIGJlY2F1c2UgYXQgZmlyc3QgSSBkaWRuJ3QgdW5kZXJzdGFu
ZCB5b3VyCj4gc3RhdGVtZW50LCBhbmQgdGhlICJtb3JlIHdpZGVseSB1c2VmdWwiIGNvbW1lbnQp
Lgo+IAo+IEkgd291bGQgYmUgaGFwcHkgdG8gZG8gdGhpcywgYW5kIGl0J3Mgbm90IHRoYXQgaGFy
ZC4KPiBDYW4gSSBkbyBpdCBhcyBhIGZvbGxvdy1vbiBwYXRjaCB0aG91Z2g/ICBJdCdzIGFkZGlu
Zwo+IHNjb3BlIChhZ2FpbiksIGJleW9uZCB3aGF0IEkgYW50aWNpcGF0ZWQgYW5kIGhvbmVzdGx5
Cj4gSSdtIHJlYWR5IHRvIGJlIGRvbmUgd2l0aCB0aGlzLi4uCgpHb29kIGpvYiB5b3UncmUgbm90
IHdvcmtpbmcgb24gYSBjb21wbGV4IGFkZGl0aW9uIHRoZW4uICA9Oy0pCgo+IEFueXdheSwgaWYg
eW91IHNheSAibm8iIEknbGwgc2VuZCBhbm90aGVyIHZlcnNpb24gb2YKPiB0aGlzIHNlcmllcyB0
b2RheS4KCkEgZm9sbG93LXVwIHdvdWxkIGJlIGdvb2QsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
