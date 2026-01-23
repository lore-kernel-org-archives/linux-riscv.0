Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB161D6CFAE
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 01:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ivo/pinHBQDY+GHnsFMA0qVvkTiHl/75gBpCxaU76M=; b=egwTUxsiRp9IB3
	H/gRvMKlc3fIRhl/fnI95exQakJryXSkYNghkaGBKDdbEDBmL1C/sJl78dDK6hMVD0g+lUjsdDkJ2
	Bv1IRcpRB/CCJcmBg7wKawx9l8eUleSXnPfg4iuL2LHKcttHlKbVbFVsib5jBvkA5tQrFyv8/Vgwx
	CeT2fh5yNrzM0H5i9Ff1vYyN0Vec1GloofOYZ2qYzI7PY1lXxyqmAMIIWJOlSjMciYOBTjqe/HvuA
	/O0noO9L0rhyIhr6sXU8cBTWRxUnf1M4+1ksl7CFc6seEmfMLMrpBFBTT7ytDZ8Hpbtx2ZYhVMWL0
	A25jmNco22vgyvgTL2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5z5-00000007xuA-0BXZ;
	Fri, 23 Jan 2026 01:29:11 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5z2-00000007xtD-1lMm
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 01:29:10 +0000
X-UUID: e2f2767ef7fa11f0b0f03b4cfa9209d1-20260123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:56ec9702-805d-480b-a07e-6bbbd80cbfdf,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:cf6a63922911615ee47dbc2d1c4d2939,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e2f2767ef7fa11f0b0f03b4cfa9209d1-20260123
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 567321408; Fri, 23 Jan 2026 09:28:56 +0800
Message-ID: <cb65c596-7950-4402-b5e7-fddea12bd7e1@kylinos.cn>
Date: Fri, 23 Jan 2026 09:28:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] riscv: lib: add strnlen implementation
To: Qingfang Deng <dqfext@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 charlie@rivosinc.com, conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Joel Stanley <joel@jms.id.au>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-7-jiangfeng@kylinos.cn>
 <20260121072438.6646-1-dqfext@gmail.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <20260121072438.6646-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_172908_784533_E9EC2C6F 
X-CRM114-Status: GOOD (  11.31  )
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

T24gMjAyNi8xLzIxIDE1OjI0LCBRaW5nZmFuZyBEZW5nIHdyb3RlOgo+IE9uIFR1ZSwgMjAgSmFu
IDIwMjYgMTQ6NTg6NTAgKzA4MDAsIEZlbmcgSmlhbmcgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2xpYi9zdHJubGVuLlMgYi9hcmNoL3Jpc2N2L2xpYi9zdHJubGVuLlMKPiAKPiBC
cmFuY2hlcyB0aGF0IHRlc3QgbWF4bGVuIGNhbiBiZSByZXBsYWNlZCB3aXRoIFpiYiBtaW51IGlu
c3RydWN0aW9uLgo+IChzZWUgYmVsb3cpCj4gCgouLi4KCj4+ICsJLyoKPj4gKwkgKiBUaGUgZmly
c3QgY2h1bmsgaXMgc3BlY2lhbDogY29tcGFyZSBhZ2FpbnN0IHRoZSBudW1iZXIKPj4gKwkgKiBv
ZiB2YWxpZCBieXRlcyBpbiB0aGlzIGNodW5rLgo+PiArCSAqLwo+PiArCXNybGkJYTAsIHQxLCAz
Cj4+ICsKPj4gKwkvKiBMaW1pdCB0aGUgcmVzdWx0IGJ5IG1heGxlbi4gKi8KPj4gKwlibGV1CWEx
LCBhMCwgM2YKPiAKPiBtaW51CWEwLCBhMCwgYTEKPiAKPj4gKwo+PiArCWJndHUJdDMsIGEwLCAy
Zgo+PiArCj4+ICsJLyogUHJlcGFyZSBmb3IgdGhlIHdvcmQgY29tcGFyaXNvbiBsb29wLiAqLwo+
PiArCWFkZGkJdDIsIHQwLCBTWlJFRwo+PiArCWxpCXQzLCAtMQo+PiArCj4+ICsJLyoKPj4gKwkg
KiBPdXIgY3JpdGljYWwgbG9vcCBpcyA0IGluc3RydWN0aW9ucyBhbmQgcHJvY2Vzc2VzIGRhdGEg
aW4KPj4gKwkgKiA0IGJ5dGUgb3IgOCBieXRlIGNodW5rcy4KPj4gKwkgKi8KPj4gKwkucDJhbGln
biAzCj4+ICsxOgo+PiArCVJFR19MCXQxLCBTWlJFRyh0MCkKPj4gKwlhZGRpCXQwLCB0MCwgU1pS
RUcKPj4gKwlvcmMuYgl0MSwgdDEKPj4gKwliZ2V1CXQwLCB0NCwgNGYKPj4gKwliZXEJdDEsIHQz
LCAxYgo+PiArNDoKPj4gKwlub3QJdDEsIHQxCj4+ICsJQ1oJdDEsIHQxCj4+ICsJc3JsaQl0MSwg
dDEsIDMKPj4gKwo+PiArCS8qIEdldCBudW1iZXIgb2YgcHJvY2Vzc2VkIGJ5dGVzLiAqLwo+PiAr
CXN1Ygl0MiwgdDAsIHQyCj4+ICsKPj4gKwkvKiBBZGQgbnVtYmVyIG9mIGNoYXJhY3RlcnMgaW4g
dGhlIGZpcnN0IHdvcmQuICAqLwo+PiArCWFkZAlhMCwgYTAsIHQyCj4+ICsKPj4gKwkvKiBBZGQg
bnVtYmVyIG9mIGNoYXJhY3RlcnMgaW4gdGhlIGxhc3Qgd29yZC4gICovCj4+ICsJYWRkCWEwLCBh
MCwgdDEKPj4gKwo+PiArCS8qIEVuc3VyZSB0aGUgZmluYWwgcmVzdWx0IGRvZXMgbm90IGV4Y2Vl
ZCBtYXhsZW4uICovCj4+ICsJYmdldQlhMCwgYTEsIDNmCj4gCj4gbWludQlhMCwgYTAsIGExCj4g
CgpUaGFua3MgZm9yIHRoZSBncmVhdCBzdWdnZXN0aW9uISBJIHNlZSB5b3VyIHBvaW50IG5vd+KA
lHVzaW5nIG1pbnUgaXMgaW5kZWVkIGEgbXVjaAptb3JlIGVsZWdhbnQgYW5kIGVmZmljaWVudCB3
YXkgdG8gaGFuZGxlIHRoZSBtYXhsZW4gY29uc3RyYWludC4gSXQgbmljZWx5IGVsaW1pbmF0ZXMK
dW5uZWNlc3NhcnkgYnJhbmNoZXMgYW5kIHNpbXBsaWZpZXMgdGhlIGNvZGUgd2hpbGUgc3RpbGwg
YWxsb3dpbmcgZm9yIGVhcmx5IHJldHVybnMuCgpJJ2xsIGluY29ycG9yYXRlIHRoaXMgaW50byBh
IHY0IHBhdGNoIGFuZCBhZGQgYSBTdWdnZXN0ZWQtYnkgdGFnIGZvciB5b3UuIFRoYW5rcwphZ2Fp
biBmb3IgeW91ciBpbnNpZ2h0ZnVsIHJldmlldyEKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKRmVu
ZyBKaWFuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
