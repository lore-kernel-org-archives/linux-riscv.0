Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030B6D262B0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sW2nNXuG2OC4/sLhjOOyxVPY0TOwfWhoqP4mDLA89uY=; b=XswjoByN3OoQuX
	q/8Z9J3/jTY8HYPvGZK8H2uP+Za4t8kHn4y9jSHsA1A4gIbCR4KHGlRtKdkROp84EktM0nKX4KEvE
	DQ2By+5Js3NBYArTkZ10bdJv+gpuO2F+XMn9j0pTEJE7NUksO7ONLVKrY6huX34m9vyDY7h5icGAM
	gbruc0IohkKsvfhMf7TqmXiAEmjLBLmt7kAwIm85Q0cLSPermZBJFfN39he+vIcX6xoQZjLsHiRQ6
	uoSmQ/Y6nRuDaVACegiErw0Wglz2y2OLYrMgVWrNQPgzyzvutue7FveA473ZIrCW0fHn+TJOlapzb
	EO+gCkBX47TZKKCdcThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTKW-0000000546t-4BXr;
	Wed, 21 Jan 2026 08:12:45 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTKS-0000000546J-2pvx
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 08:12:43 +0000
X-UUID: f00c6b04f6a011f0b0f03b4cfa9209d1-20260121
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:74250277-37fa-4705-b49d-a8c4cbdd6a8c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5c81ccfe12d22ec145f41d8a9028c491,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f00c6b04f6a011f0b0f03b4cfa9209d1-20260121
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 161648402; Wed, 21 Jan 2026 16:12:33 +0800
Message-ID: <16313365-b51e-47d2-aae8-633dbfc8a3fa@kylinos.cn>
Date: Wed, 21 Jan 2026 16:12:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] riscv: optimize string functions and add kunit
 tests
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 charlie@rivosinc.com, conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <aW8whGcAR0x6FSRJ@smile.fi.intel.com>
 <691a0183-6f41-4956-82da-abb69a449919@kylinos.cn>
 <CAHp75Ve_pyVm430FL=aEAw1Cnf-92T3Y23qh7pEOaMYMp9iyvw@mail.gmail.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <CAHp75Ve_pyVm430FL=aEAw1Cnf-92T3Y23qh7pEOaMYMp9iyvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_001241_075695_85A43300 
X-CRM114-Status: GOOD (  12.21  )
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

T24gMjAyNi8xLzIxIDE1OjAxLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MjEsIDIwMjYgYXQgODo0NOKAr0FNIEZlbmcgSmlhbmcgPGppYW5nZmVuZ0BreWxpbm9zLmNuPiB3
cm90ZToKPj4gT24gMjAyNi8xLzIwIDE1OjM2LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+PiBP
biBUdWUsIEphbiAyMCwgMjAyNiBhdCAwMjo1ODo0NFBNICswODAwLCBGZW5nIEppYW5nIHdyb3Rl
Ogo+IAo+IC4uLgo+Pj4+IHdvcmQtYXQtYS10aW1lIGxvZ2ljLCBzaG93aW5nIHNpZ25pZmljYW50
IGdhaW5zIGFzIHRoZSBzdHJpbmcgbGVuZ3RoCj4+Pj4gaW5jcmVhc2VzLgo+Pj4KPj4+IEhtbS4u
LiBIYXZlIHlvdSB0cmllZCB0byBvcHRpbWlzZSB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiB0
byB1c2UKPj4+IHdvcmQtYXQtYS10aW1lIGxvZ2ljIGFuZCBjb21wYXJlPwo+Pgo+PiBSZWdhcmRp
bmcgdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24sIGV2ZW4gaWYgd2Ugd2VyZSB0byBvcHRpbWl6
ZSB0aGUgQyBjb2RlCj4+IHRvIHVzZSB3b3JkLWF0LWEtdGltZSBsb2dpYyAodGhlIGhhc196ZXJv
KCkgc3R5bGUgYml0LW1hbmlwdWxhdGlvbiksIGl0IHN0aWxsCj4+IHdvdWxkbid0IG1hdGNoIHRo
ZSBaYmIgdmVyc2lvbidzIGVmZmljaWVuY3kuCj4+Cj4+IFRoZSB0cmFkaXRpb25hbCBDLWJhc2Vk
IHdvcmQtbGV2ZWwgZGV0ZWN0aW9uIHJlcXVpcmVzIGEgc2VxdWVuY2Ugb2YgYXJpdGhtZXRpYwo+
PiBvcGVyYXRpb25zIHRvIGlkZW50aWZ5IE5VTCBieXRlcy4gSW4gY29udHJhc3QsIHRoZSBSSVND
LVYgb3JjLmIgaW5zdHJ1Y3Rpb24KPj4gY29sbGFwc2VzIHRoaXMgZW50aXJlIGNoZWNrIGludG8g
YSBzaW5nbGUgaGFyZHdhcmUgY3ljbGUuIEkndmUgZm9jdXNlZCBvbiB0aGlzCj4+IGFyY2hpdGVj
dHVyYWwgYXBwcm9hY2ggdG8gZnVsbHkgbGV2ZXJhZ2UgdGhlc2Ugc3BlY2lmaWMgWmJiIGZlYXR1
cmVzLCB3aGljaAo+PiBwcm92aWRlcyBhIGxldmVsIG9mIGluc3RydWN0aW9uIGRlbnNpdHkgdGhh
dCBnZW5lcmljIEMgbWF0aCBjYW5ub3QgYWNoaWV2ZS4KPiAKPiBJIHVuZGVyc3RhbmQgdGhhdC4g
TXkgcG9pbnQgaXMgaWYgd2UgbW92ZSB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbgo+IHRvIHVz
ZSB3b3JkLWF0LWEtdGltZSB0ZWNobmlxdWUgdGhlIGRpZmZlcmVuY2Ugc2hvdWxkIG5vdCBnbyA0
eCwKPiByaWdodD8gUGVyaGFwcyAxLjV4IG9yIHNvLiBJIGJlbGlldmUgdGhpcyB3aWxsIGJlIGEg
dmVyeSB1c2VmdWwKPiBleGVyY2lzZS4KPiAKClRoYXQgaXMgYSB2ZXJ5IGluc2lnaHRmdWwgcG9p
bnQsIHRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEknbGwgbG9vayBpbnRvCm9wdGltaXppbmcg
dGhlIGdlbmVyaWMgc3RyaW5nIGxpYnJhcnkgYXMgYSBmb2xsb3ctdXAgdGFzayB0byBzZWUgaWYg
d2UgY2FuCmJyaW5nIHNvbWUgaW1wcm92ZW1lbnRzIHRoZXJlIGFzIHdlbGwuIAoKVGhhbmtzIGFn
YWluIGZvciB0aGUgZ3VpZGFuY2UuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkZlbmcgSmlhbmcK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
