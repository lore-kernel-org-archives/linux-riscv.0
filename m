Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9A6C87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eHdkOdNdkDHZKPubzxBhjN4jH1CA8JYpmWj98VxEZg=; b=OoGlxdiI0D3wpj
	bZKAuKlu/KzHmx8lFOtkN3j0/1ZQS/AFW5sTQCkVJHR2vS2v86z2ceuzwaUE6bZ/R9l5wr7DxgQCK
	F8KJonCnF0ao8ZYHXfyt393gYpdH7y+pVFA9G9F19iQo327pFQujHw6rhl3xubqUCqlVOSNYYcOME
	Z4VjcSd024I0pzGYdBfqB9xjfIejULgvEqVc6U0Zh8Ew6UH+v2ajYWsObXT+IEOQC1LEk2apXFBwd
	foZRpotOsFKvUBP024END3N9HkixwKOFxVZIKYKoGFgZ0+dfY00OQfaeUCXHJpRO72/ScL66h6gqp
	/pwQIJjXR8HTKUnYIvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXr2-00000004FEJ-0ctO;
	Thu, 31 Jul 2025 18:18:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXr0-00000004FED-3K6J
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 18:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF2AF61126
	for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 18:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932C7C4CEFD
	for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 18:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753985889;
	bh=2cLq6ukYlaFpgGQBtKOou69OVdEUdYfHbEKfkg++xcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hh77aC3BVVgvZ/0eUIH95b7LMb+StQr0x8xMg9K0rC10cjy9vJdM9ifdt8QEJQBlY
	 54a/f1XwxZcsLX0TbkU9KBRpkZ04X2ppFibxzZEsmdZwY9KCy0QTJJlMNjZNBh0b6e
	 DMdnBn9OYW6C/pNhdZJXAEZaPo7HWKEfwqOSB7FH+99EXZ/8YKWkRn+VF3j3x9UTvT
	 gjw1NOTSS/2l3CbGkeh/6kofdoH26oN6+BLHUGY08NtmPpnoNwgiOW+RY2Wkivb/pK
	 jCNSTBYO6qypl/eV7LNRhvJOaUH7sS+zLYpwh3GdwqJTeVMj9DtNaMFGqOgEBMb8Bp
	 w/KHCG7aa5bAg==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-610cbca60cdso29092eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 11:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsVJ7ppbddBBojVD66mmdrqK5SFtPa+cBidoetorLTFiDFBomm7H6yF9xpD/AKTNHAjHzFxuNd9Ovg7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzD4lYouYgcc4siK5MhsLdQqduHU/8lLf1GRJMeWytSo0368tYK
	cmNgudE1ZESxTwQmSr8wAlDJd3AXnBpF91baGZCfhlq3p7G5kLqqjHXkHHQsFh98m+Kkt+sISeU
	yc2LeF5ZxdtmmKh5/drBmsoQc7+Ru3x4=
X-Google-Smtp-Source: AGHT+IFPUom2p903mHPUTDU4ONASdutryjcvQHiJdb35lmiGjDZYxh6K4+M78CRYbhmxfLP+Nmr9+TUYV8a6Mz74FWQ=
X-Received: by 2002:a05:6820:152a:b0:619:7ffe:b0c6 with SMTP id
 006d021491bc7-6197ffec3e6mr554355eaf.8.1753985888743; Thu, 31 Jul 2025
 11:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
 <20250729131535.522205-3-heinrich.schuchardt@canonical.com> <84a22949-88e7-4a6c-b14e-e8448724b034@ghiti.fr>
In-Reply-To: <84a22949-88e7-4a6c-b14e-e8448724b034@ghiti.fr>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 31 Jul 2025 20:17:42 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hvaw=m8zPDJn0vPvw5RBxUsRzyvjHPiganPkxHGCisRw@mail.gmail.com>
X-Gm-Features: Ac12FXxSy76Neb_YIdL32z9WvuqzYoazaALdgfoMCCtIkVT-a0GD5NPPLdPSJv0
Message-ID: <CAJZ5v0hvaw=m8zPDJn0vPvw5RBxUsRzyvjHPiganPkxHGCisRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ACPI: support BGRT table on RISC-V
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, kernel@vger.kernel.org, 
	Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	Len Brown <lenb@kernel.org>
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

T24gVGh1LCBKdWwgMzEsIDIwMjUgYXQgMzoxM+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBIZWlucmljaCwKPgo+IE9uIDcvMjkvMjUgMTU6MTUsIEhl
aW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4gPiBUaGUgQkdSVCB0YWJsZSBpcyB1c2VkIHRvIGRp
c3BsYXkgYSB2ZW5kb3IgbG9nbyBpbiB0aGUgYm9vdCBwcm9jZXNzLgo+ID4gVGhlcmUgaXMgbm8g
Z29vZCByZWFzb24gd2h5IFJJU0MtViBzaG91bGQgbm90IHN1cHBvcnQgaXQuCj4gPgo+ID4gUmVt
b3ZlIHRoZSBhcmNoaXRlY3R1cmUgY29uc3RyYWludC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBI
ZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+Cj4g
PiAtLS0KPiA+ICAgZHJpdmVycy9hY3BpL0tjb25maWcgfCAyICstCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2FjcGkvS2NvbmZpZyBiL2RyaXZlcnMvYWNwaS9LY29uZmlnCj4gPiBpbmRleCA3YmM0
MGMyNzM1YWMwLi4yYjgzYzkxYmIxYTc4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL0tj
b25maWcKPiA+ICsrKyBiL2RyaXZlcnMvYWNwaS9LY29uZmlnCj4gPiBAQCAtNDYwLDcgKzQ2MCw3
IEBAIGNvbmZpZyBBQ1BJX0hFRAo+ID4KPiA+ICAgY29uZmlnIEFDUElfQkdSVAo+ID4gICAgICAg
Ym9vbCAiQm9vdHRpbWUgR3JhcGhpY3MgUmVzb3VyY2UgVGFibGUgc3VwcG9ydCIKPiA+IC0gICAg
IGRlcGVuZHMgb24gRUZJICYmIChYODYgfHwgQVJNNjQgfHwgTE9PTkdBUkNIKQo+ID4gKyAgICAg
ZGVwZW5kcyBvbiBFRkkKPiA+ICAgICAgIGhlbHAKPiA+ICAgICAgICAgVGhpcyBkcml2ZXIgYWRk
cyBzdXBwb3J0IGZvciBleHBvc2luZyB0aGUgQUNQSSBCb290dGltZSBHcmFwaGljcwo+ID4gICAg
ICAgICBSZXNvdXJjZSBUYWJsZSwgd2hpY2ggYWxsb3dzIHRoZSBvcGVyYXRpbmcgc3lzdGVtIHRv
IG9idGFpbgo+Cj4KPiBAUmFmYWVsOiBJZiB5b3UgYWNrIHRoaXMgcGF0Y2gsIEkgY2FuIG1lcmdl
IHRoYXQgZm9yIDYuMTcgYXMgSSBoYXZlbid0Cj4gc2VudCBteSBQUiB5ZXQsIGp1c3QgbGV0IG1l
IGtub3chCgpUaGVyZSB5b3UgZ286CgpBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
