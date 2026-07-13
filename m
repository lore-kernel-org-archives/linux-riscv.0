Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AF2C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3c33Za4DDbRFJ7cTx5KSwsExeU2i9OzdXmiCN0/zII=; b=XOT5v2lZ7xCu7T
	VMw4fdx8Tg5z3jpAJkvwvCcGuiDNERMOHke4DU2vc7zHSmBpCUxcZfVwJoiop6HAMlA06/Dg30rZG
	zvlZHjtmJ5rVXdEbqDww5QuIpkHAMe773mLH9C2fAw8c0WWsvdRkrj079LGJkFmALurtfFIVzoAkY
	ca8BbcH+yRTEIuSukugbg2gSGAANQ1MNnOXoFcVieuPG5cGvB3rWl1EfrQ8Q3wU5DpdyvtL4O989g
	tBoea/ixli52ux70qBnEcKo/aB0FOqVfrbKTKJNBk6uiGNiCqWemMGDoLaR65MUHG8P6hFRaCj03Y
	zrrhGTfyIveLii1mv2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCRW-00000008e9A-0hR4;
	Mon, 13 Jul 2026 08:55:14 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCRT-00000008e8V-2Yxc
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 08:55:13 +0000
X-UUID: 8a2c76d27e9811f1aa26b74ffac11d73-20260713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b08b7908-6ba1-47a0-bc27-f9f3a9c617b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:974d90335f713990e03f3fae66e8281f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a2c76d27e9811f1aa26b74ffac11d73-20260713
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1774913962; Mon, 13 Jul 2026 16:55:04 +0800
Message-ID: <b7803ac7-c9e1-4905-9256-4b67e41ad1ac@kylinos.cn>
Date: Mon, 13 Jul 2026 16:55:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: spacemit: k1: disable hardware on driver remove
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, dlan@kernel.org,
 rafael@kernel.org, shuwei.wu@mailbox.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
 <DJXB4PDMYX0G.1TC9VBR96MHMA@linux.spacemit.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <DJXB4PDMYX0G.1TC9VBR96MHMA@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_015511_947171_A26C13B8 
X-CRM114-Status: GOOD (  12.38  )
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

CgrlnKggMjAyNi83LzEzIDE2OjQwLCBUcm95IE1pdGNoZWxsIOWGmemBkzoKPiBPbiBNb24gSnVs
IDEzLCAyMDI2IGF0IDE6MzIgQU0gUERULCBQZWkgWGlhbyB3cm90ZToKPj4gVGhlIGRyaXZlciB1
c2VzIGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoKSBidXQgbmV2ZXIgZGlzYWJsZXMgdGhlCj4+
IGhhcmR3YXJlIGludGVycnVwdCBlbmFibGUsIHNlbnNvciBlbmFibGUsIG9yIHNlbnNvciBwb3dl
ciBiaXRzIHdoZW4KPj4gdGhlIGRyaXZlciBpcyB1bmJvdW5kLgo+Pgo+PiBBZGQgYSBkZXZtIGFj
dGlvbiB0aGF0IGNsZWFycyBLMV9UU0VOU09SX0lOVF9FTl9SRUcsCj4+IEsxX1RTRU5TT1JfRU5f
QUxMLCBhbmQgSzFfVFNFTlNPUl9QQ1RSTF9FTkFCTEUgb24gcmVtb3ZlLCBtaXJyb3JpbmcKPj4g
d2hhdCBrMV90c2Vuc29yX2luaXQoKSBzZXRzIHVwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZWkg
WGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+Cj4+IC0tLQo+PiAgZHJpdmVycy90aGVybWFsL3Nw
YWNlbWl0L2sxX3RzZW5zb3IuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAg
MSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdGhlcm1hbC9zcGFjZW1pdC9rMV90c2Vuc29yLmMgYi9kcml2ZXJzL3RoZXJtYWwvc3BhY2Vt
aXQvazFfdHNlbnNvci5jCj4+IGluZGV4IDc5MjIyZDIzMzEyOS4uY2Y3OWRjN2Q0MDNmIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvc3BhY2VtaXQvazFfdHNlbnNvci5jCj4+ICsrKyBi
L2RyaXZlcnMvdGhlcm1hbC9zcGFjZW1pdC9rMV90c2Vuc29yLmMKPj4gQEAgLTE5OSw2ICsxOTks
MjkgQEAgc3RhdGljIGlycXJldHVybl90IGsxX3RzZW5zb3JfaXJxX3RocmVhZChpbnQgaXJxLCB2
b2lkICpkYXRhKQo+PiAgCXJldHVybiBJUlFfSEFORExFRDsKPj4gIH0KPj4gIAo+PiArc3RhdGlj
IHZvaWQgazFfdHNlbnNvcl9zaHV0ZG93bihzdHJ1Y3QgazFfdHNlbnNvciAqdHMpCj4+ICt7Cj4+
ICsJdTMyIHZhbDsKPj4gKwo+PiArCS8qIERpc2FibGUgYWxsIGludGVycnVwdHMgKi8KPj4gKwl3
cml0ZWwoMHhmZmZmZmZmZiwgdHMtPmJhc2UgKyBLMV9UU0VOU09SX0lOVF9FTl9SRUcpOwo+PiAr
Cj4+ICsJLyogRGlzYWJsZSBhbGwgc2Vuc29yICovCj4+ICsJdmFsID0gcmVhZGwodHMtPmJhc2Ug
KyBLMV9UU0VOU09SX0VOX1JFRyk7Cj4+ICsJdmFsICY9IH5LMV9UU0VOU09SX0VOX0FMTDsKPj4g
Kwl3cml0ZWwodmFsLCB0cy0+YmFzZSArIEsxX1RTRU5TT1JfRU5fUkVHKTsKPj4gKwo+PiArCS8q
IFBvd2VyIGRvd24gdGhlIHNlbnNvciBtb2R1bGUgKi8KPj4gKwl2YWwgPSByZWFkbCh0cy0+YmFz
ZSArIEsxX1RTRU5TT1JfUENUUkxfUkVHKTsKPj4gKwl2YWwgJj0gfksxX1RTRU5TT1JfUENUUkxf
RU5BQkxFOwo+IFdoeSBpcyBvbmx5IHRoZSBFTkFCTEUgYml0IGNsZWFyZWQgaGVyZT8KPiBBdCBp
bml0IHRpbWUgdGhlIGRyaXZlciBhbHNvIHNldHM6Cj4gICAgIHZhbCB8PSBLMV9UU0VOU09SX1BD
VFJMX1JBV19TRUwgfAo+ICAgICBLMV9UU0VOU09SX1BDVFJMX1RFTVBfTU9ERSB8Cj4gICAgIEsx
X1RTRU5TT1JfUENUUkxfSFdfQVVUT19NT0RFIHwKPiAgICAgSzFfVFNFTlNPUl9QQ1RSTF9FTkFC
TEU7Cj4KPiBTaG91bGQgdGhlIG90aGVyIGJpdHMgYmUgY2xlYXJlZCBpbiBzaHV0ZG93biBhcyB3
ZWxsLCBvciBpcyBjbGVhcmluZyBFTkFCTEUKPiBhbG9uZT8KSGkgVHJveSwKwqBNYXliZSBXdShh
dXRob3IpIGhhdmUgc29tZXRpbmcgdG8gc2F5IGFib3V0IHRoZXNlIHJlZ3MuCsKgVGhhbmtzLgoK
UGVpLgoKCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
