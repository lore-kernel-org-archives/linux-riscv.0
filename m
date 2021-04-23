Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99415C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 04:39:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE4C613BD
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 04:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BE4C613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YAI6pmDU4MQv/IWAwg2iGTeHoyv5XSMg4pM5pw06a2o=; b=hHG/cHB3P1i56LI7n7B/OvoaJ
	xq1fRElokAYZECUpPuwAwQdxVPld2qrxuJAr5gOaZFRjRj0HQyrM/j3cVVUNjdXDXHBh3k+xQiQrK
	A+gO9188y/I/zogSqCvL5uo1+K2DGOrDX/3a8yv0heYyAGdZMl9ZRZsaXqa9J4RCkgAH6syAu63SK
	Tj/IBApf6L50lgK53NFJyfd01zGObG/MVzTl+H+k3G+mgpFYGGclpPKSCGKfW2u0vrbQBS1A2GaDH
	l4REXudbmYw5/R5ur9qCsr32c8jd2B+n/O7D5/DH7DN3IsD5UsBJzu9joO3k9P0Ap7IG28R9Kn5iF
	EqeNQFnFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZnbJ-000cHM-Dt; Fri, 23 Apr 2021 04:39:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnbF-000cGP-Jq
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 04:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=6J3S1EowMxNgodKbT6VuqOpLG5n59kYtaEQul9RuocM=; b=zPemCMjeA537p29SLOOavX3meS
 CpJC27cKkHzxgYl+blQX5e39dZDytd4+I5E/CbiTPF7pIAr/wgf9H+DJ2WYFMiIKM+bZwqzBSozd0
 1q/qx4+mxZ+fC2SkIfCljy9+Ruf9drvNOT0mqR36QxJxFhKGJHUkiCDT8m1qwhJFJyyzZvomAu5Ze
 KZgzvM8KXv5jTcmC6grQmVYSgnaZfySehvzk/kaDqzTkB4nuIvTKjg6bNNA1v/r353B4CAZHxL/l8
 fPpXc93fh+579LKopo+R0ol9+Cig2ygra6T0rPStmEmVq4ObOCURRqoLk0uOgrdB97M8GfcZUbtgl
 nZzejzSQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnbC-00E9Am-FM
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 04:39:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso581906pjs.2
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 21:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6J3S1EowMxNgodKbT6VuqOpLG5n59kYtaEQul9RuocM=;
 b=G6vbo+4Rdmql+OYi5hs8Gm22/IgtpWNS4R/rUQtCppbXNatRIHJSdGYL5+cg0N9YkO
 6g6Xax/aKtDB1oKsSv3VEuoJ1KYVuytBAMDmOI8DdzZW4nypqSdPzQjUNf9cvUOvzpGg
 UXJSDminP52VTMGOPkFaYCTO41nldXADgh+LcRxWoE6DrjzwwLyzPxoUVgYDuYCxVMg+
 QQiz3g4Z7NVTyBCE17gQXSRO3VDZ5FZ54E4FiA8lveGm+dfLwf4Kq+Y9L1QIH1eoWAYs
 73hSNzfhm8cnNl5n5zvZhidPdvYISA1NeaXa3MOA4LB7/Sa8fVlHxviDXb3tlM7W9SZY
 KQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6J3S1EowMxNgodKbT6VuqOpLG5n59kYtaEQul9RuocM=;
 b=CmMWl0DO2uJlO9CLeZRcYSMOQBda8XMU9HyGgfsTXQyhuxdLBGPy/UrhWwZHntXRSw
 adYy934tzbBK1J9ditGGop87eZlVhtNW9CCIZ9P8/wvQ+5QtSDvomid1bpfhJjGdB6oj
 TK2jzpzwsPqgG5LqcgJq7yER+4ovZ6zaO98xl6i7ACM16AhbEudo44+tjyojxMpmbRFw
 y/ULLBXf4fqVl4sxNt5gypQjHPqsq6evlNK3Ebx52024vIj8rLHMUwr3u630TSDqSKFx
 sf+qRnWjy3WU523jXH5sWLdbDh5n8OxlgVTy9g3vTbofCq58lRYscVP/eQKy2yRqDe1l
 B3nA==
X-Gm-Message-State: AOAM533wmngjGZeizBfVo0Ky6mjaRYpghamhHy3iDeWoCcgmH+GoB1dl
 5fpCHsa5z3tqkxKik5n6E288tg==
X-Google-Smtp-Source: ABdhPJxooiiHU5Bw3U0Jm6BQ2vbg4+eeLs8IAwR4giBk61hPyKTGAhXnRp+COmX4wuGdjiR3Yq8VhA==
X-Received: by 2002:a17:902:b687:b029:eb:6491:b3f7 with SMTP id
 c7-20020a170902b687b02900eb6491b3f7mr1962804pls.38.1619152765050; 
 Thu, 22 Apr 2021 21:39:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o5sm3518344pgq.58.2021.04.22.21.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 21:39:24 -0700 (PDT)
Date: Thu, 22 Apr 2021 21:39:24 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 21:39:21 PDT (-0700)
Subject: Re: [PATCH] implement flush_cache_vmap for RISC-V
In-Reply-To: <18d198ac-7bc0-934d-e1e9-eca01b790d61@ghiti.fr>
CC: Jisheng.Zhang@synaptics.com, liu@jiuyang.me, waterman@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, geert@linux-m68k.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-12e52134-80b2-409c-bf30-1300875c54a2@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_213926_534402_02B4FCA8 
X-CRM114-Status: GOOD (  27.77  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNCBBcHIgMjAyMSAwMDowMzoxMyBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSwKPgo+IExlIDQvMTIvMjEgw6AgMzowOCBBTSwgSmlzaGVuZyBaaGFuZyBhIMOp
Y3JpdMKgOgo+PiBIaSBKaXV5YW5nLAo+Pgo+PiBPbiBNb24sIDEyIEFwciAyMDIxIDAwOjA1OjMw
ICswMDAwIEppdXlhbmcgTGl1IDxsaXVAaml1eWFuZy5tZT4gd3JvdGU6Cj4+Cj4+Cj4+Pgo+Pj4g
VGhpcyBwYXRjaCBpbXBsZW1lbnRzIGZsdXNoX2NhY2hlX3ZtYXAgZm9yIFJJU0MtViwgc2luY2Ug
aXQgbW9kaWZpZXMgUFRFLgo+Pj4gV2l0aG91dCB0aGlzIHBhdGNoLCBTRkVOQ0UuVk1BIHdvbid0
IGJlIGFkZGVkIHRvIHJlbGF0ZWQgY29kZXMsIHdoaWNoCj4+PiBtaWdodCBpbnRyb2R1Y2UgYSBi
dWcgaW4gdGhlIG91dC1vZi1vcmRlciBtaWNyby1hcmNoaXRlY3R1cmUKPj4+IGltcGxlbWVudGF0
aW9ucy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXV5YW5nIExpdSA8bGl1QGppdXlhbmcubWU+
Cj4+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+Pj4gUmV2
aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4+Cj4+IElJUkMs
IFBhbG1lciBoYXNuJ3QgZ2l2ZW4gdGhpcyBSZXZpZXdlZC1ieSB0YWcuCgpZZXMuICBJbiBmYWN0
LCBJIGdhdmUgdGhlIG9wcG9zaXRlIG9mIGEgUkI6IHdlIHNob3VsZG4ndCBoYXZlIHRoaXMsIGF0
IApsZWFzdCB3aXRob3V0IHNvbWUgZGVtb25zdHJhdGlvbiBvZiBhIG1lYW5pbmdmdWwgcGVyZm9y
bWFuY2UgaW1wcm92ZW1lbnQgCmFuZCBsaWtlbHkgd2l0aCBhIGhvc3Qgb2Ygb3RoZXIgY2hhbmdl
cyB0byBjaGFuZ2UgdGhlIHdob2xlIHBvcnQgb3ZlciB0byAKYXZvaWQgcmVseWluZyBvbiB0cmFw
cyB0byBoYW5kbGUgbmV3IG1hcHBpbmdzLiAgSSByZWFsbHkgZG9uJ3QgdGhpbmsgCnRoYXQncyBh
IHNhbmUgd2F5IHRvIGdvLCBhcyB0aGUgdGhlb3J5IGlzIHRoYXQgcmVhc29uYWJsZSAKbWljcm9h
cmNoaXRlY3R1cmVzIHdvbid0IGhhdmUgYmlnIHdpbmRvd3Mgb3ZlciB3aGljaCB0aGVzZSBmYXVs
dHMgY2FuIApvY2N1ciBzbyB0aGVyZSB3b24ndCBiZSB0aGF0IG1hbnkgb2YgdGhlbS4gIElmIGl0
IGVuZHMgdXAgYmVpbmcgYW4gaXNzdWUgCm9uIHJlYWwgaGFyZHdhcmUgd2UgY2FuIHRyeSBhbmQg
c29ydCBzb21ldGhpbmcgb3V0LCBidXQgaXQncyBnb2luZyB0byBiZSAKYSBsb3Qgb2Ygd29yayBh
cyB3ZSdsbCBuZWVkIHRvIGF2b2lkIGh1cnRpbmcgcGVyZm9ybWFuY2Ugb24gCmltcGxlbWVudGF0
aW9ucyB0aGF0IGRvbid0IG1ha2UgaW52YWxpZCBtYXBwaW5ncyB2aXNpYmxlIG9mdGVuLgoKPj4K
Pj4+IC0tLQo+Pgo+PiBDb3VsZCB5b3UgcGx6IGFkZCB2ZXJzaW9uIGFuZCBjaGFuZ2VzPyBJSVJD
LCB0aGlzIGlzIHRoZSB2My4KPj4KPj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZs
dXNoLmggfCA2ICsrKysrKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPj4+IGluZGV4IDIzZmY3MDM1MDk5
Mi4uM2ZkNTI4YmFkYzM1IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
YWNoZWZsdXNoLmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5o
Cj4+PiBAQCAtMzAsNiArMzAsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2RjYWNoZV9w
YWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+Pj4gICAjZGVmaW5lIGZsdXNoX2ljYWNoZV91c2VyX3Bh
Z2Uodm1hLCBwZywgYWRkciwgbGVuKSBcCj4+PiAgICAgICAgICBmbHVzaF9pY2FjaGVfbW0odm1h
LT52bV9tbSwgMCkKPj4+Cj4+PiArLyoKPj4+ICsgKiBmbHVzaF9jYWNoZV92bWFwIGlzIGludm9r
ZWQgYWZ0ZXIgbWFwX2tlcm5lbF9yYW5nZSgpIGhhcyBpbnN0YWxsZWQgdGhlIHBhZ2UKPj4+ICsg
KiB0YWJsZSBlbnRyaWVzLCB3aGljaCBtb2RpZmllcyBQVEUsIFNGRU5DRS5WTUEgc2hvdWxkIGJl
IGluc2VydGVkLgo+Pgo+PiBKdXN0IG15IGh1bWJsZSBvcGluaW9uLCBmbHVzaF9jYWNoZV92bWFw
KCkgbWF5IG5vdCBiZSBuZWNlc3NhcnkuIHZtYWxsb2NfZmF1bHQKPj4gY2FuIHRha2UgY2FyZSBv
ZiB0aGlzLCBhbmQgZmluYWxseSBzZmVuY2Uudm1hIGlzIGluc2VydGVkIGluIHJlbGF0ZWQgcGF0
aC4KPj4KPgo+Cj4gSSBiZWxpZXZlIFBhbG1lciBhbmQgSmlzaGVuZyBhcmUgcmlnaHQsIG15IGlu
aXRpYWwgcHJvcG9zYWwgdG8gaW1wbGVtZW50Cj4gZmx1c2hfY2FjaGVfdm1hcCBpcyB3cm9uZy4K
Pgo+IEJ1dCB0aGVuLCBKaXV5YW5nIHNob3VsZCBub3QgaGF2ZSBub3RpY2VkIGFueSBwcm9ibGVt
IGhlcmUsIHNvIHdoYXQncwo+IHdyb25nPyBASml1eWFuZzogRG9lcyBpbXBsZW1lbnRpbmcgZmx1
c2hfY2FjaGVfdm1hcCBmaXggeW91ciBpc3N1ZT8KPgo+IEFuZCByZWdhcmRpbmcgZmx1c2hfY2Fj
aGVfdnVubWFwLCBmcm9tIEppc2hlbmcgY2FsbCBzdGFjaywgaXQgc2VlbXMgYWxzbwo+IG5vdCBu
ZWNlc3NhcnkuCgpGV0lXOiBJIHN0aWxsIHRoaW5rIHRoYXQgZmx1c2hfY2FjaGVfdnVubWFwKCkg
aXMgbmVjZXNzYXJ5IC0tIHdlIGRvbid0IApoYXZlIGFueSBvdGhlciB3YXkgdG8gZ3VhcmFudGVl
IHRoYXQgbWFwcGluZyBpc24ndCB2aXNpYmxlLiAgSW1wbGVtZW50aW5nIApmbHVzaF9jYWNoZV92
bWFwKCkgY291bGQgd29yayBhcm91bmQgdGhlIHJlYWwgYnVnIG9mIGxhY2tpbmcgCmZsdXNoX2Nh
Y2hlX3Z1bm1hcCgpLCBhcyB3ZSdkIHNlZSBzdGFsZSBtYXBwaW5ncy4KClRoYXQgc2FpZCwgaXQg
Y291bGQganVzdCBiZSBjb3ZlcmluZyB1cCBzb21lIG90aGVyIGJ1Zy4gIFdvdWxkbid0IGJlIApz
dXJwcmlzZWQgaWYgaXQncyBhIGJ1ZyBpbiBvdXIgcG9ydCwgYnV0IHRoaXMgaXMgdGhlIHNvcnQg
b2YgdGhpbmcgdGhhdCAKY291bGQgYWxzbyBiZSBhIGhhcmR3YXJlIGJ1ZyBvZiBzb21lIHNvcnQu
Cgo+Cj4gQEppdXlhbmc6IENhbiB5b3UgdGVsbCB1cyBtb3JlIGFib3V0IHdoYXQgeW91IG5vdGlj
ZWQ/Cj4KPgo+PiBSZWdhcmRzCj4+Cj4+PiArICovCj4+PiArI2RlZmluZSBmbHVzaF9jYWNoZV92
bWFwKHN0YXJ0LCBlbmQpIGZsdXNoX3RsYl9hbGwoKQo+Pj4gKwo+Pj4gICAjaWZuZGVmIENPTkZJ
R19TTVAKPj4+Cj4+PiAgICNkZWZpbmUgZmx1c2hfaWNhY2hlX2FsbCgpIGxvY2FsX2ZsdXNoX2lj
YWNoZV9hbGwoKQo+Pj4gLS0KPj4+IDIuMzEuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
