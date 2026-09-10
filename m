Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D87C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZafuCf0bFS7RVUZA16gMolSYXlcf3iY0Tlo6foZEHM=; b=FSYDnRn552jQ5M
	zbRFV6b1qx/mcdykY0cbqJUUH+OBD7LQHu6x07+AljDCOYzNHkE9nJogpCd9QhlWVMvX7qRf65MP5
	1YX2999pqTqomi0+N/TBnPA7e+WY/jQZLFq2VAscEiUS4Q8Bvd71sn3xVMMR7b2VQRlhtA5XHtV3N
	Cpf/DuKHHfvw4WBWZR2GPwnkoizHe1ZtVM8OGzETSY+k7vKrNCcRO5in8FvFFzHVs1bhJs2slXplg
	myhR8YOGw2HtRoGPddKpjsL5BWmQqcneYJl/HxydpSUZogHbJLzq6YnST84JNdEOUVpzXlLVMfrqv
	17rPDZdOmH2PviX7Xd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fcl-0000000Ebme-2HH5;
	Thu, 10 Sep 2026 14:19:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fcg-0000000Eblf-1Qbr;
	Thu, 10 Sep 2026 14:19:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9536B1570;
	Thu, 10 Sep 2026 07:19:25 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0293F7B4;
	Thu, 10 Sep 2026 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1789049969; bh=YyZZgELesOQYbwi5589EMzGDv5CnlCwWEAz7cpxWzf4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=npJdqY2lkzMQ1ArUoRWjCHl6JYyGW+9VlY+FuS0oSIaTEVefYoWD5nfgZa3oYgF6v
	 ay/2+Tge/AzDs2LsbDIQlY088djByVQkbuQy86vTzSrEcx8dA4k2lt+gHCIJrIfhQ1
	 5pYgG0hGhKhZ4WqQc6JDXsRvcAe54mfMS72pXNHU=
Message-ID: <615d5d1a-5266-4b83-bff2-21c8f3840040@foss.arm.com>
Date: Thu, 10 Sep 2026 09:19:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
From: Bill Roberts <bill.roberts@foss.arm.com>
To: Mark Brown <broonie@kernel.org>, Jesse Huang <jesse.huang@sifive.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
 dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, debug@rivosinc.com,
 andrew@sifive.com, kito.cheng@sifive.com
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
Content-Language: en-US
In-Reply-To: <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_071930_527403_ED4D477C 
X-CRM114-Status: GOOD (  16.93  )
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

Ck9uIDkvOS8yNiAxMjo1NyBQTSwgQmlsbCBSb2JlcnRzIHdyb3RlOgo+Pgo+Pj4gMi4gcmlzY3Yg
c2hvdWxkIGNoZWNrIHRoYXQgdGhlIGxvdyBiaXQgaXMgc2V0IGluIGxvY2tpbmcgbm90IGp1c3Qg
Cj4+PiB0aGF0IGl0cwo+Pj4gMCwgaXQgc2hvdWxkIGJlIDEKPj4gSSB0aGluayBmb3IgQUJJIGNv
bXBhdGliaWxpdHkgUklTQy1WIHdpbGwgaGF2ZSB0byBjb250aW51ZSBhY2NlcHRpbmcgMAo+PiBh
cyBiZWluZyBlcXVpdmFsZW50IHRvIGxvY2tpbmcgUFJfU0hBRE9XX1NUQUNLX0VOQUJMRSAob3Ig
ZXZlcnl0aGluZywKPj4gYnV0IGl0IG9ubHkgc3VwcG9ydHMgdGhhdCBvbmUgYml0IHJpZ2h0IG5v
dykuCj4KPiBUTDtEUiAtIE5vIHVzZXJzLCBsZXRzIGZpeCBpdCBiZWZvcmUgcmlzYy12IGxhbmRz
IHRoZSB1c2Vyc3BhY2Ugc2lkZSBJSVVDCj4KPiBJIGNhbid0IGZpbmQgYW55IGxpYmMncyB0aGF0
IHN1cHBvcnQgdGhpcyBmb3IgcmlzYy12LiBJdCBhcHBlYXJzIHRoZSAKPiBnbGliYwo+IHBhdGNo
ZXMgd2VyZSBub3QgbWVyZ2VkIGFuZCBJIGNvbW1lbnRlZCBvbiB0aG9zZSBwYXRjaGVzIGp1c3Qg
bm93Cj4gdGhhdCB0aGUgaW50ZXJmYWNlIGlzIHdyb25nOgo+IMKgIC0gCj4gaHR0cHM6Ly9pbmJv
eC5zb3VyY2V3YXJlLm9yZy9saWJjLWFscGhhLzhhNWUyMWQwLTA2MjgtNDkxMC05YWQ4LTE2NWM4
MjllOTY4MEBmb3NzLmFybS5jb20vCj4KPiBBZGRpdGlvbmFsbHksIHN0cmVzcy1uZyBkb2VzIGl0
ICJnZW5lcmljYWxseSIsIGFuZCBpdCB3b3VsZCBiZSBicm9rZW4gCj4gb24gYSByaXNjdiBzeXN0
ZW06Cj4gwqAgLSAKPiBodHRwczovL3NvdXJjZXMuZGViaWFuLm9yZy9zcmMvc3RyZXNzLW5nLzAu
MjIuMDAtMi9zdHJlc3MtcHJjdGwuYz9obD0xMTQ0I0wxMTQ0Cj4KPiBUaGlzIGlzIGEgYnVnIGFu
ZCBuZXZlciBmb2xsb3dlZCB0aGUgY29udmVudGlvbiB0byBiZWdpbiB3aXRoLiBTbyAKPiByaXNj
LXYgaXMKPiBub24tY29tcGxpYW50IHRvIHRoZSBzcGVjIGFuZCB0aGlzIGVmZmVjdGl2ZWx5IHBy
ZXZlbnRzIHRoZSBhIHRydWUgCj4gdW5pZmljYXRpb24KPiBvZiBhIGdlbmVyaWMgcHJjdGwgaW50
ZXJmYWNlLiBUaGUgYmVoYXZpb3Igb24gcmlzY3YgZG9lc24ndCBhZGhlcmUgdG8gCj4gdGhlcmUg
b3duIGRvY3M6Cj4KPiDCoCAtIAo+IGh0dHBzOi8vY2RuLmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0
ZXN0L2FyY2gvcmlzY3YvemljZmlzcy5odG1sI3ByY3RsLWVuYWJsaW5nIAoKClNvcnJ5IEkgY29u
ZnVzZWQgdHdvIGludGVyZmFjZXMgaGVyZSwgYW55d2F5LCAKYXJjaF9zZXRfc2hhZG93X3N0YWNr
X3N0YXR1cyBpcyBmaW5lLAppdCdzIHRoZSBsb2NraW5nIGludGVyZmFjZSBhcmNoX2xvY2tfc2hh
ZG93X3N0YWNrX3N0YXR1cywgY29kZSBzbmlwcGV0IApiZWxvdzoKCi8qIElmIHNodHN0ayBub3Qg
c3VwcG9ydGVkIG9yIG5vdCBlbmFibGVkIG9uIHRhc2ssIG5vdGhpbmcgdG8gbG9jayBoZXJlICov
CmlmICghaXNfdXNlcl9zaHN0a19lbmFibGVkKCkgfHwKIMKgIMKgICFpc19zaHN0a19lbmFibGVk
KHRhc2spIHx8IGFyZyAhPSAwKQogwqAgwqAgwqAgwqAgcmV0dXJuIC1FSU5WQUw7CgpTbyBldmVu
IHRoZSBnbGliYyBwYXRjaGVzIHdpbGwgYmUgZmluZS4gQnV0IGRlZmluaXRlbHkgc29tZXRoaW5n
IHdlIHdhbnQgCnRvIGZpeC4KSSBhbSBnb2luZyB0byBmbG9hdCBhIHBhdGNoIG92ZXIgdG8gdGhl
IHJpc2MtdiBmb2xrcy4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
