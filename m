Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BB3CCD19F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 05:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxxXPH4/mROYb0Te6QRoy3w+nr3b6y3u0e3Pg5DYHIk=; b=mNwMjyLJlqNkSO
	F4vVRNqsAHOmy6vZ6EV3szrEh6PFl6jbDcVlpVoK6oi3QwZht56SNDxcjl4uVNqH5Nc0Hd8ODG7gf
	OKGiU9fdedHzPOqy6HZag8ejsdV5+Ifxxny8xDFBQXVXEh5wn/gJ8lPhhQ6FxnGpOE/PwVzrMOJRe
	1pkgJlc+5UKxK7PkYxYxNk3KfVJ+jdewbEV42BU7Smi/cQfFkFxd5ElaMg9+pGi9RhAcGBdoYG6tM
	qsidsQjyXi5ptJHWMADCNYLIZHBQtD5wFOoiCke4Nos0UMvvw2ivKoLlmxWBjCLe41vioWxSx3t/v
	pmw9B99VyLZcYNR6DsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB55v-0000000FsPX-2tr3;
	Tue, 21 Oct 2025 05:39:39 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB55s-0000000FsO1-12R3
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 05:39:38 +0000
Received: from [192.168.0.105] (unknown [114.241.85.109])
	by APP-05 (Coremail) with SMTP id zQCowAD3lhB9HPdoosmmEg--.36897S2;
	Tue, 21 Oct 2025 13:39:10 +0800 (CST)
Message-ID: <52693a5b-e564-41f1-b430-b87784e0559b@iscas.ac.cn>
Date: Tue, 21 Oct 2025 13:39:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
From: Vivian Wang <wangruikang@iscas.ac.cn>
To: michael.opdenacker@rootcommit.com
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
 <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
 <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
X-CM-TRANSID: zQCowAD3lhB9HPdoosmmEg--.36897S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy8CFyrGF1DtF17Xw4xZwb_yoW8Ar47pF
	W3XrnxJr9FkrW2vrnIvw4kuF1fuan5tF43Gw1Fva48AFs8tr9agr18tr45JFy3XrZ8XF4Y
	9FW0gas7uFyqyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07betCcUUUUU=
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_223936_648425_C86BB768 
X-CRM114-Status: GOOD (  11.69  )
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

T24gMTAvMjAvMjUgMTc6MDcsIFZpdmlhbiBXYW5nIHdyb3RlOgoKPiBbLi4uXQo+PiArCXBoeS1o
YW5kbGUgPSA8JnJnbWlpMD47Cj4+ICsJcGh5LW1vZGUgPSAicmdtaWktaWQiOwo+PiArCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICsJcGluY3RybC0wID0gPCZnbWFjMF9jZmc+Owo+PiAr
CXJ4LWludGVybmFsLWRlbGF5LXBzID0gPDA+Owo+PiArCXR4LWludGVybmFsLWRlbGF5LXBzID0g
PDA+Owo+IFRoZSBoYXJkd2FyZSBkZXNpZ24gb2YgT1BJLVJWMiBpcyBub3QgdGhlIHNhbWUgYXMg
QlBJLUYzLCBzbyB0aGUKPiBwYXJhbWV0ZXJzIGhlcmUgZGVzZXJ2ZXMgc29tZSBzY3J1aXRpbnku
IFNhbWUgZm9yIGV0aDEgYmVsb3cuCihBcHBhcmVudGx5IG15IHNwZWxsaW5nIGRlc2VydmVzIHNj
cnV0aW55IGFzIHdlbGwuIE9oIHdlbGwuKQo+IEkgd291bGQgYXBwcmVjaWF0ZSBhdCBsZWFzdCBp
cGVyZiBUQ1AgdGVzdHMgaW4gYm90aCBkaXJlY3Rpb25zIG9uIGJvdGgKPiBldGhlcm5ldCBwb3J0
cy4gVGhlIGV4cGVjdGVkIHNwZWVkIHNob3VsZCBiZSBhdCBsZWFzdCA5NDAgTWJpdC9zZWMgLSBp
Zgo+IGl0J3MgbXVjaCBsb3dlciB0aGFuIHRoYXQgc29tZXRoaW5nIGlzIHdyb25nLgoKT2theSBz
byB0aGlzIGlzIG5vdCAqbmVjZXNzYXJpbHkqIGEgcHJvYmxlbSwgYnV0IGp1c3QgZm9yIGNvbnRl
eHQuLi4KCklmIHlvdSBsb29rIGF0IHRoZSBEVFMgZmlsZXMgcHJvdmlkZWQgYnkgU3BhY2VtaVQg
WzFdIHlvdSdkIHRoaW5rIHRoZQpPUEktUlYyIGFsc28gdXNlcyBSVEw4MjExRiBFdGhlcm5ldCBQ
SFlzLiBJdCBkb2VzIG5vdC4gVGhlIHNjaGVtYXRpY3MKKGxpbmtlZCBvbiB0aGUgYm9hcmQgbWFp
biBwYWdlIFsyXSkgc2F5cyBpdCB1c2VzIE1vdG9yY29tbSBZVDg1MzFDLgoKVGhpcyBkb2Vzbid0
IG1lYW4gdGhhdCB5b3VyIERUUyBpcyB3cm9uZyAoYmVjYXVzZSB3ZSBkb24ndCB3cml0ZSB0aGUg
aWQKaGVyZSB3aGVuIHRoZSBQSFktc2VudCBvbmUgaXMgY29ycmVjdCksIGJ1dCBJIGhvcGUgeW91
IHVuZGVyc3RhbmQgdGhhdAp3aGF0IEknbSB3b3JyaWVkIGlzIHRoYXQgdGhlIGVsZWN0cmljYWwg
Y2hhcmFjdGVyaXN0aWNzIGhhdmUgYmVlbgpjaGFuZ2VkIHNpbmNlIHRoZXkgaGF2ZSBjaGFuZ2Vk
IHRoZSBib2FyZCBkZXNpZ24uIFRoaXMgaXMgd2h5IEkgdGhpbmsKYWN0dWFsbHkgdGFraW5nIHRo
ZSB0aW1lIHRvIGNoZWNrIHRoZSBkZWxheSBwYXJhbWV0ZXJzIHdvdWxkIGJlIGEgZ29vZCBpZGVh
LgoKQW5kIHllcywgaXQgd291bGQgbm90IGJlIHN1cnByaXNpbmcgaWYgdGhlIHBhcmFtZXRlcnMg
Zm9yIEJQSS1GMyBhbHNvCndvcmtzIGNvbXBsZXRlbHkgcmVsaWFibHkgZm9yIE9QSS1SVjIuIFRo
ZSBkZWxheSB0dW5pbmcgaGFzIHF1aXRlIGEgYml0Cm9mIG1hcmdpbiBmb3Igd2lnZ2xlIHJvb20u
wqAKClRoYW5rcywKVml2aWFuICJkcmFtZm9yZXZlciIgV2FuZwoKWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vc3BhY2VtaXQtY29tL2xpbnV4LWsxeC9ibG9iL2sxL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvazEteF9vcmFuZ2VwaS1ydjIuZHRzClsyXTogaHR0cDovL3d3dy5vcmFuZ2VwaS5v
cmcvaHRtbC9oYXJkV2FyZS9jb21wdXRlckFuZE1pY3JvY29udHJvbGxlcnMvc2VydmljZS1hbmQt
c3VwcG9ydC9PcmFuZ2UtUGktUlYyLmh0bWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
