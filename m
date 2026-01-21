Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21B1D262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 05:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4z3XH8vviFeA3YKE/v7j+i8e45+E4eGGC/PP+lTjEY=; b=gCs5KhhjSGhEOF
	VrpeYtOMIMH5QFa4we8NGtglAydvlFllfI46qAg45WuzDLXufaZr1X9OS1/BNa8CCjO9orxnAntJZ
	y5Mp/6ba9vHJzKMAjDKM0kx4A514e8oU2cubuqIy7WteH06T2tPN5WdcTMFeVAFwDJdlw7ISlTVYi
	r+MFW0fAekpdi/3gRg/QYI+8yviJPx2Uu8BXosjUYZd7o7aRTkY+MqKFq0iM3887kuA2/IYQgiGV0
	vynT7HcKms+2L6hMYPi+w9kL0PxwAIIoaqpaN/an08tTMPdL1pEbF78WoidO9JCURNkR40Kvs3nAD
	+K52lVsk719JfsrI81wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR4q-00000004uw3-3Mk4;
	Wed, 21 Jan 2026 05:48:24 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR4o-00000004uvY-1Gp8
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 05:48:23 +0000
X-UUID: c8e39a52f68c11f0b0f03b4cfa9209d1-20260121
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9405c4e1-a16b-46b7-b895-8180871c3a73,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:3eb41b61307c773dbc892b4bd9cc4bb3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c8e39a52f68c11f0b0f03b4cfa9209d1-20260121
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2140298535; Wed, 21 Jan 2026 13:48:17 +0800
Message-ID: <fb396548-1a16-400d-bd88-91f54559fa4d@kylinos.cn>
Date: Wed, 21 Jan 2026 13:48:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] lib/string_kunit: extend benchmarks to strnlen and
 chr searches
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 charlie@rivosinc.com, conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Joel Stanley <joel@jms.id.au>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-6-jiangfeng@kylinos.cn>
 <aW8zWxjpVMSTFPYM@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aW8zWxjpVMSTFPYM@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_214822_703935_6BC0DAFD 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

T24gMjAyNi8xLzIwIDE1OjQ4LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MjAsIDIwMjYgYXQgMDI6NTg6NDlQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90ZToKPj4gRXh0ZW5k
IHRoZSBzdHJpbmcgYmVuY2htYXJraW5nIHN1aXRlIHRvIGluY2x1ZGUgc3RybmxlbigpLCBzdHJj
aHIoKSwKPj4gYW5kIHN0cnJjaHIoKS4KPj4KPj4gRm9yIGNoYXJhY3RlciBzZWFyY2ggZnVuY3Rp
b25zIChzdHJjaHIgYW5kIHN0cnJjaHIpLCB0aGUgYmVuY2htYXJrCj4gCj4gc3RyY2hyKCkgYW5k
IHN0cnJjaHIoKQoKV2lsbCBmaXguCgo+PiB0YXJnZXRzIHRoZSBudWxsIHRlcm1pbmF0b3IuIFRo
aXMgZW5zdXJlcyB0aGUgZW50aXJlIHN0cmluZyBpcyBzY2FubmVkLAo+IAo+IE5VTCBjaGFyYWN0
ZXIKPiAKPiAoQWxzbyBjaGVjayB0ZXJtaW5vbG9neSBldmVyeXdoZXJlOiBOVUxMIOKAlCBpcyBm
b3IgTlVMTCBwb2ludGVycywgTlVMIGlzIGZvcgo+ICAnXDAnIGNoYXJhY3RlcnMuKQo+IAoKVGhh
bmtzIGZvciB0aGUgY29ycmVjdGlvbiwgSSdsbCBmaXggdGhpcyBhbmQgY2hlY2sgb3RoZXIgcGxh
Y2VzIGFzIHdlbGwuCgo+PiBwcm92aWRpbmcgYSBjb25zaXN0ZW50IG1lYXN1cmUgb2YgZnVsbC1s
ZW5ndGggcHJvY2Vzc2luZyBlZmZpY2llbmN5Cj4+IGNvbXBhcmFibGUgdG8gc3RybGVuKCkuCj4g
Cj4gQWNrZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keUBrZXJuZWwub3JnPgo+IAoKLS0gCldp
dGggQmVzdCBSZWdhcmRzLApGZW5nIEppYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
