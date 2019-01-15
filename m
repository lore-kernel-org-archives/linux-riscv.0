Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915CAC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F8B820859
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmoTtQ/Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLw0If4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F8B820859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdQDyl3cpLHnw8wtjFKng8y/o7kg0FHxfPLNA99oa0U=; b=rmoTtQ/QicuIzt
	kXnfF1lUUd0wru6nAXReNQ8rjIFX0azrHPZhEZko7b/YomlaF2TkmebLTW0olPNCC1HhaTqebK0jT
	T0iXUDppOBWXxymOFrMjQqxRhVz0V6kc2lOcqxOeWycbCqAfhJ6vsU87Lncd60q360D8l+cFL2zTD
	1Hd9zXr7yuhaEQC3sHRjbzsumjMeO32DhrHRS8vddDw9ueolXnoBDUIWYVJlXx9I4exhgV8wkJ/a8
	xbulTNBJphjeZ8mXGa2LWDuC3w2tJ7W+kziXyQ/qPTEc8ty8Uf0SmeGKybYhjrqOPWAGPGp4Twn+g
	Em/Zeoa9mc8JwSXD0ZYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRI8-0004ro-7A; Tue, 15 Jan 2019 16:10:16 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRHz-0003tp-HX
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 16:10:14 +0000
Received: by mail-qt1-x841.google.com with SMTP id l12so3503176qtf.8
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jan 2019 08:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Oe96ikdXrxkgQGn4mWq7oZG5/g5wap1OugDCddZR+7M=;
 b=MLw0If4+8hO+FIAUUZ6Oo5912z4Hl2r8GgI6x89+aG3zUUdYD6LS/itDqM94+yQDya
 dSxb3oQTqo7IZeWxEPkaX5w9N0rso4GZI0EI09MGa4KkEHwvVTFEMv6o3jvWgrzqstn1
 OMiBRqDpjdjgeyXBL1xFI3VYQNDFIWEyTgNc9LmzbNZoRHEq0MTFLh5PrYz3tSlj1Edh
 MTlLs4jaCaBpFiNvI6hVZuQ0tHeZy7WQCHBLfPw1Tw05E1hxw1STIbDXgoG7hlZW+kii
 LhEm+0XACK8RnD534Qf+XYtjwKfdimO+TMtWvoDycTpPQcb8b9fYlcf2fUF+DSuQNWa3
 nU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Oe96ikdXrxkgQGn4mWq7oZG5/g5wap1OugDCddZR+7M=;
 b=Qfp8wAQ1sXxz4U1fGM+VX6OjmGCDgF/pDU6lD6kaxXpud00/0NQHybfigh8F60W9tQ
 xiVm09nq3dXKt6dgvmUwA53/HMhaVn6GomTtUjcpHDTp37wgNF0R2/RAmRdh75FDNzyE
 Tn0YZyrw+vMCdlhyj8lMMH/UfvchT8LafrnhP+3Xk+jiVBZx6fa9DZvkh62usW1eToZl
 iLGgueJLLrBlQTY6OTHnu6WblwoqWicrkpIWTZ/7XzirSKFrAsB8VvPmozoX4iGZ4s25
 d/W+LvyS4Xvna+lRf8lxT66TIYnkWxQXtZsPvgiasU/+qaHvwYmx87walFFDsNdQ6K98
 E1IA==
X-Gm-Message-State: AJcUukevvG1uMFc7PT07orWVODO04rI5xFqXYiKMMr1QNskadtfqGjip
 Dc6OMiezfC1fOYYtpUmjcGgsB3da3JctfENT7kk=
X-Google-Smtp-Source: ALg8bN5YLqG83M0KzCc83G2Hu4/NvTAIfvZwQZWWdcXj7Reess1gesfCLxd2JSpCQJT/BIL2diKz2ViqF6Sre5j1ch8=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr3460659qvq.55.1547568605456; 
 Tue, 15 Jan 2019 08:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
 <20190115083518.10149-3-bjorn.topel@gmail.com>
 <20190115154327.GH26443@infradead.org>
In-Reply-To: <20190115154327.GH26443@infradead.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 15 Jan 2019 17:09:53 +0100
Message-ID: <CAJ+HfNiP=cBhHurxxcpbUyt9BZyV1uHaLfHD-89N-rAkAbjr-g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] riscv: add build infra for JIT compiler
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081007_625579_F67F3DB0 
X-CRM114-Status: GOOD (  13.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Daniel Borkmann <daniel@iogearbox.net>,
 davidlee@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RGVuIHRpcyAxNSBqYW4uIDIwMTkga2wgMTY6NDMgc2tyZXYgQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBpbmZyYWRlYWQub3JnPjoKPgo+ID4gIGNvcmUteSArPSBhcmNoL3Jpc2N2L2tlcm5lbC8gYXJj
aC9yaXNjdi9tbS8KPiA+Cj4gPiAraWZlcSAoJChDT05GSUdfQVJDSF9SVjY0SSkseSkKPiA+ICtj
b3JlLXkgKz0gYXJjaC9yaXNjdi9uZXQvCj4gPiArZW5kaWYKPgo+IEkgdGhpbmsgdGhpcyBzaG91
bGQgYmUgY29yZS0kKENPTkZJR19BUkNIX1JWNjRJKSB0byBnZXQgdGhlIHNhbWUgcmVzdWx0Lgo+
IE9yIGV2ZW4gYmV0dGVyIGp1c3QgY29yZS15IGdpdmVuIHRoYXQgdGhlIEtjb25maWcgZGVwZW5k
ZW5jaWVzIHNob3VsZAo+IGVuc3VyZSB5b3UgY2FuJ3QgZXZlciBlbmFibGUgQ09ORklHX0JQRl9K
SVQgZm9yIDMyLWJpdCBidWlsZHMuCj4KCkdvb2QgcG9pbnQhIEknbGwgYWRkcmVzcyB0aGF0IQoK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIwYjZhYzEz
ZWRmNQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9uZXQvTWFrZWZpbGUK
PiA+IEBAIC0wLDAgKzEsNSBAQAo+ID4gKyMKPiA+ICsjIFJJU0NWIG5ldHdvcmtpbmcgY29kZQo+
ID4gKyMKPgo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBjb21tZW50IGFkZHMgYW55IHZhbHVlLiAgSW4g
ZmFjdCBpdCBpcyBoaWdobHkKPiBjb25mdXNpbmcgZ2l2ZW4gdGhhdCB3ZSB1c2UgYnBmIGZvciBh
IGxvdCBtb3JlIHRoYW4gbmV0d29ya2luZyB0aGVzZQo+IGRheXMuCj4KClllYWgsIEkgYWdyZWUu
IEknbGwgcmVtb3ZlIHRoYXQuCgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wLmMKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdlMzU5ZDMyNDllZQo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wLmMKPiA+IEBAIC0w
LDAgKzEsNCBAQAo+ID4gK3N0cnVjdCBicGZfcHJvZyAqYnBmX2ludF9qaXRfY29tcGlsZShzdHJ1
Y3QgYnBmX3Byb2cgKnByb2cpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHByb2c7Cj4gPiArfQo+
Cj4gUGxlYXNlIGRvbid0IGp1c3QgYWRkIHN0dWJzIGZpbGVzLiAgVGhpcyBwYXRjaCBzaG91bGQg
cHJvYmFibHkgYmUgbWVyZ2VkCj4gaW50byB0aGUgb25lIGFkZGluZyB0aGUgYWN0dWFsIGltcGxl
bWVudGF0aW9uLgoKTm90ZWQhIEknbGwgcmVtb3ZlIHRoYXQhCgpUaGFua3MgZm9yIHRha2luZyBh
IGxvb2ssIENocmlzdG9waCEKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
