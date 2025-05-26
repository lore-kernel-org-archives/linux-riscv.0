Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DF1C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 02:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLx87PI34vqsBUNSObgJapkIvixhKrroP3XVwr8zFTQ=; b=nV9gmaZcT8SWNO
	Z6CdPH77E0yQ4DHWFxRLG+d/NxS8F/C4IhPMgxHckBIYRPr27ITyBzrkhtQHYw2I7TjdTq+obHsNf
	enEnGcKNfyTeUmTYJyC44xD+bouyErnbGIfBxOdkF5JJVXekz+ODNALgOCj+mAfmwgkxgJXI5Lkx4
	dp01KIZ3NPRgOn8q3FNHVjoBb1k5UIb/d1chZ0jhvHfMfKoyqruTHIwsWI0Iz1e2w5NzKA7hx5OkN
	3zlxNv3mGEY+ptFA5PcR4SOvaz3yu9EeDp2UgXBy5RoIJ3HzFjXagUqkL2107k2pl0kft9Z4qRPlC
	oZ9qu5tSQtXDZ24wcgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJNif-00000007yMV-20zz;
	Mon, 26 May 2025 02:37:41 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJNic-00000007yLm-1fro
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 02:37:40 +0000
Message-ID: <0f20ac8a-317c-4ce9-8c17-113f7eb6ad90@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748227054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7neqG58J+Ahj4nQSiH5zkGET3BZ/oA3S9VE4hGMMq20=;
	b=hzps+WCnA2GLYz0L+XZeVTim2hgrK8TVQHIypRyLTq5k+W6Cvlp6ZGsEKxqIxkUGuISH6c
	ISPYvh+Nyux23qZAe5bWlmdUDxr7Cpzs0Ce91mzkCHa+/o03qErNGXn59nuTrvl7bR8asI
	qh9rx8lU1h/CjsnX5tpG+YOPGrIe73c=
Date: Mon, 26 May 2025 10:37:25 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: vector: Fix context save/restore with
 xtheadvector
To: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Jesse Taube <jesse@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>, linux-kernel@vger.kernel.org
References: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_193738_588922_9EEF9C65 
X-CRM114-Status: GOOD (  11.01  )
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

5ZyoIDUvMjMvMjUgNjoyNSBQTSwgSGFuIEdhbyDlhpnpgZM6Cj4gUHJldmlvdXNseSBvbmx5IHYw
LXY3IHdlcmUgY29ycmVjdGx5IHNhdmVkL3Jlc3RvcmVkLAo+IGFuZCB0aGUgY29udGV4dCBvZiB2
OC12MzEgYXJlIGRhbWFuZ2VkLgo+IENvcnJlY3RseSBzYXZlL3Jlc3RvcmUgdjgtdjMxIHRvIGF2
b2lkIGJyZWFraW5nIHVzZXJzcGFjZS4KPiAKPiBGaXhlczogZDg2MzkxMGVhYmFmICgicmlzY3Y6
IHZlY3RvcjogU3VwcG9ydCB4dGhlYWR2ZWN0b3Igc2F2ZS9yZXN0b3JlIikKPiBTaWduZWQtb2Zm
LWJ5OiBIYW4gR2FvIDxyYWJlbmRhLmNuQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IFhpb25nY2h1
YW4gVGFuIDx0YW54aW9uZ2NodWFuQGlzcmMuaXNjYXMuYWMuY24+Cj4gUmV2aWV3ZWQtYnk6IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBZYW50ZW5n
IFNpIDxzaS55YW50ZW5nQGxpbnV4LmRldj4KClRoYW5rcywKWWFudGVuZwo+IC0tLQo+IAo+IENo
YW5nZXMgaW4gdjI6Cj4gICAgQWRkIGZpeCB0YWcKPiAgICBJbXByb3ZlIGNvbW1pdCBtZXNhZ2UK
PiAKPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvYzIyMWM5OGRjMjM2
OWVhNjkxZTNlYjY2NGJmMDg0ZGM5MDk0OTZmNi4xNzQ3OTM0NjgwLmdpdC5yYWJlbmRhLmNuQGdt
YWlsLmNvbS8KPiAKPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggfCAxMiArKysr
KystLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gaW5kZXggZThhODNmNTViZTJiLi43ZGY2
MzU1MDIzYTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiBAQCAtMjAwLDExICsyMDAs
MTEgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3RhdGVfc2F2ZShzdHJ1Y3QgX19y
aXNjdl92X2V4dF9zdGF0ZSAqc2F2ZV90bywKPiAgIAkJCVRIRUFEX1ZTRVRWTElfVDRYMEU4TThE
MQo+ICAgCQkJVEhFQURfVlNCX1ZfVjBUMAo+ICAgCQkJImFkZAkJdDAsIHQwLCB0NFxuXHQiCj4g
LQkJCVRIRUFEX1ZTQl9WX1YwVDAKPiArCQkJVEhFQURfVlNCX1ZfVjhUMAo+ICAgCQkJImFkZAkJ
dDAsIHQwLCB0NFxuXHQiCj4gLQkJCVRIRUFEX1ZTQl9WX1YwVDAKPiArCQkJVEhFQURfVlNCX1Zf
VjE2VDAKPiAgIAkJCSJhZGQJCXQwLCB0MCwgdDRcblx0Igo+IC0JCQlUSEVBRF9WU0JfVl9WMFQw
Cj4gKwkJCVRIRUFEX1ZTQl9WX1YyNFQwCj4gICAJCQk6IDogInIiIChkYXRhcCkgOiAibWVtb3J5
IiwgInQwIiwgInQ0Iik7Cj4gICAJfSBlbHNlIHsKPiAgIAkJYXNtIHZvbGF0aWxlICgKPiBAQCAt
MjM2LDExICsyMzYsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3RhdGVfcmVz
dG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqcmVzdG9yZV8KPiAgIAkJCVRIRUFEX1ZT
RVRWTElfVDRYMEU4TThEMQo+ICAgCQkJVEhFQURfVkxCX1ZfVjBUMAo+ICAgCQkJImFkZAkJdDAs
IHQwLCB0NFxuXHQiCj4gLQkJCVRIRUFEX1ZMQl9WX1YwVDAKPiArCQkJVEhFQURfVkxCX1ZfVjhU
MAo+ICAgCQkJImFkZAkJdDAsIHQwLCB0NFxuXHQiCj4gLQkJCVRIRUFEX1ZMQl9WX1YwVDAKPiAr
CQkJVEhFQURfVkxCX1ZfVjE2VDAKPiAgIAkJCSJhZGQJCXQwLCB0MCwgdDRcblx0Igo+IC0JCQlU
SEVBRF9WTEJfVl9WMFQwCj4gKwkJCVRIRUFEX1ZMQl9WX1YyNFQwCj4gICAJCQk6IDogInIiIChk
YXRhcCkgOiAibWVtb3J5IiwgInQwIiwgInQ0Iik7Cj4gICAJfSBlbHNlIHsKPiAgIAkJYXNtIHZv
bGF0aWxlICgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
