Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F69C3ABBF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpGat7nCYNk93/n/hAv39wBsrPwYCELDx5IFETT/yXI=; b=AkAyXraSXsGrhn
	l1I2uKCovGZchp39ikFBsiG71usqs7hRlG0iF+xDgwnwqs/Z9cR3oQ0bSeAQY0EP4kidNVMjPsO8f
	e58adKhXotgsxZe9zzhPiszIRczPX/jwZz4ZYYmUk8qvh8nbYVx4Hj1wZ/iPQRy5lzfotInCSJplx
	B404kPmzizJGLwNVjFSpwKUQe1EuxZyrCCu6yeeMGEoU1gGfxK2/e45pY23yen2LD99Gp5d8hgA6c
	78ekhtTkYlzYVDxXMhYsocwiBO78wFNpoIzpXUA3Zc1iF0Dbgc/S2//U00wHsa1H52F/AaZM/hAfx
	Hu+/TdcT41R/GJucxxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHLX-0000000BtKc-2XWf;
	Tue, 06 May 2025 12:24:27 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFNJ-0000000BXpv-0gOY
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 10:18:11 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.172.53])
	by smtp.qiye.163.com (Hmail) with ESMTP id 141c989fd;
	Tue, 6 May 2025 18:17:53 +0800 (GMT+08:00)
Message-ID: <9847f411-c2cc-4543-9f61-1242ff8a0cef@whut.edu.cn>
Date: Tue, 6 May 2025 18:17:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for
 CV18xx
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yu Yuan <yu.yuan@sjtu.edu.cn>, ze huang <huangze@whut.edu.cn>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
 <uo7nea7hxw7qrzw7yhtoulusejbynw6qlotwozpboxtm6vyotv@rdkuc4d776so>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <uo7nea7hxw7qrzw7yhtoulusejbynw6qlotwozpboxtm6vyotv@rdkuc4d776so>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR0ZVhgaTB1KSB5LQx1PTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKTElVTkhZV1kWGg8SFR0UWUFZT0tIVUpLSElMQktVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a96a51a1cc703a1kunm141c989fd
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M1E6OQw5TzJCIxc8Dj8WFjES
	My0wClFVSlVKTE9NTklNTUNLSktCVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKTElVTkhZV1kIAVlBSU9PTTcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031809_393958_79D0F536 
X-CRM114-Status: GOOD (  10.79  )
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

T24gNC8zMC8yNSAyOjU0IFBNLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IE9uIE1vbiwgQXByIDI4
LCAyMDI1IGF0IDA1OjI0OjM2UE0gKzA4MDAsIFplIEh1YW5nIHdyb3RlOgo+PiBUaGUgInNucHMs
ZGF0YS13aWR0aCIgcHJvcGVydHlbMV0gZGVmaW5lcyB0aGUgQVhJIGRhdGEgd2lkdGggb2YgdGhl
IERNQQo+PiBjb250cm9sbGVyIGFzOgo+Pgo+PiAgICAgIHdpZHRoID0gOCDDlyAoMl5uKSBiaXRz
Cj4+Cj4+ICgwID0gOCBiaXRzLCAxID0gMTYgYml0cywgMiA9IDMyIGJpdHMsIC4uLiwgNiA9IDUx
MiBiaXRzKQo+PiB3aGVyZSAibiIgaXMgdGhlIHZhbHVlIG9mICJzbnBzLGRhdGEtd2lkdGgiLgo+
Pgo+PiBGb3IgdGhlIENWMTh4eCBETUEgY29udHJvbGxlciwgdGhlIGNvcnJlY3QgQVhJIGRhdGEg
d2lkdGggaXMgMzIgYml0cywKPj4gY29ycmVzcG9uZGluZyB0byAic25wcyxkYXRhLXdpZHRoID0g
MiIuCj4+Cj4+IFRlc3QgcmVzdWx0cyBvbiBNaWxrdiBEdW8gUyBjYW4gYmUgZm91bmQgaGVyZSBb
Ml0uCj4+Cj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21h
c3Rlci9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3NucHMlMkNkdy1heGkt
ZG1hYy55YW1sI0w3NCBbMV0KPj4gTGluazogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vU3V0dGVy
MDk5LzRmYTk5YmIyZDg5ZTVhZjk3NTk4MzEyNDcwNGIzODYxIFsyXQo+Pgo+PiBDby1kZXZlbG9w
ZWQtYnk6IFl1IFl1YW4gPHl1Lnl1YW5Ac2p0dS5lZHUuY24+Cj4+IFNpZ25lZC1vZmYtYnk6IFl1
IFl1YW4gPHl1Lnl1YW5Ac2p0dS5lZHUuY24+Cgo+PiBTaWduZWQtb2ZmLWJ5OiBaZSBIdWFuZyA8
aHVhbmdlQHdodXQuZWR1LmNuPgoKPj4gLS0tCj4+IFNpZ25lZC1vZmYtYnk6IFplIEh1YW5nIDxo
dWFuZ3plQHdodXQuZWR1LmNuPgo+IEkgdGhpbmsgdGhlcmUgaXMgYSB3cm9uZyBzb2IgaGVyZSwK
ClllYWguLi4gVGhlcmUncyBhIHR5cG8gaW4gbWFpbCBhZGRyZXNzLgoKPiBhbHNvLCBwbGVhc2Ug
YWRkIGEgZml4ZXMgdGFnIGlmCj4geW91IGZpeCBzb21ldGhpbmcuIEkgd2lsbCB0YWtlIGNhcmUg
b2YgdGhpcyB3aGVuIG1lcmdpbmcuCj4KPiBGaXhlczogNTE0OTUxYTgxYTVlICgicmlzY3Y6IGR0
czogc29waGdvOiBjdjE4eHg6IGFkZCBETUEgY29udHJvbGxlciIpCj4KClRoYW5rIHlvdSBmb3Ig
eW91ciByZXZpZXcgYW5kIHJlbWluZGVyLiBJIHdpbGwgZm9sbG93IHRoYXQgOi0pCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
