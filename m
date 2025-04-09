Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97995C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PjPq4w3cw+o94UQmrPs9seaUhtl99uWqbltmxKVv8o=; b=HvWwRfqJj54xPA
	Ku8jKo07z/g9d+DHl01jl0Hj+IxRyy3smlumIPvmsf9izifQWvIxWH9lmFKPE7JK7A07WUPOgGwds
	6lkAoovYJHNkWBUhdWIFy7SK22MBCSBNPq4GdVPf2xXCTImMN3cDqi1kjgiHz6WjQ+uryC6rDilHu
	SRYdVIEUsGA7tyC5blppqxK6QJmrJaSO4HJ88To9vyL4NEE4hzIQWlklJISZqI1WMbXc77e7Nys6h
	dthCHgmiT2KBr8qqSFaQ6wAascTm8vxULu4dWg2lMjkWBGXr0vtHQzOPFegw9kBussJm9vf4QD5ZO
	4AbTPFJ1x1SG6TYIut4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qqk-00000006afn-2vqq;
	Wed, 09 Apr 2025 08:31:58 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QpT-00000006aRT-3yGZ;
	Wed, 09 Apr 2025 08:30:43 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 113514274;
	Wed, 9 Apr 2025 16:30:29 +0800 (GMT+08:00)
Message-ID: <756177ef-f2a7-4a8a-afa4-a68d68e5c733@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:30:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: usb: add SpacemiT K1 DWC3 glue
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn>
 <174403387085.2155711.16403180293126338183.robh@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <174403387085.2155711.16403180293126338183.robh@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHh1OVk9MHksZTUlPGUIYSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUpKVUpLS1VLWQ
	Y+
X-HM-Tid: 0a9619ac159503a1kunm113514274
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6CSo*CjJOQz1NN1FJAUkf
	ExgwCklVSlVKTE9PSkNMT0hMSUlJVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhMSE83Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_013040_140733_C716D52E 
X-CRM114-Status: GOOD (  14.78  )
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

T24gNC83LzI1IDk6NTEgUE0sIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+IE9uIE1vbiwgMDcg
QXByIDIwMjUgMjA6Mzg6NDggKzA4MDAsIFplIEh1YW5nIHdyb3RlOgo+PiBBZGQgc3VwcG9ydCBm
b3IgU3BhY2VtaVQgRFdDMyBnbHVlIGRyaXZlciwgd2hpY2ggbWFuYWdlcyBpbnRlcnJ1cHQsCj4+
IHJlc2V0IGFuZCBjbG9jayByZXNvdXJjZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWmUgSHVhbmcg
PGh1YW5nemVAd2h1dC5lZHUuY24+Cj4+IC0tLQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9zcGFjZW1pdCxrMS1kd2MzLnlhbWwgIHwgNzggKysrKysrKysrKysrKysrKysrKysrKwo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCj4+Cj4gTXkgYm90IGZvdW5kIGVy
cm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4KPiB5
YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3Jz
Ogo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zcGFjZW1pdCxrMS1kd2MzLmV4YW1wbGUuZHRiOiB1c2JA
YzBhMDAwMDAgKHNwYWNlbWl0LGsxLWR3YzMpOiAnI2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2Vs
bHMnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdedXNiQCcsICdwaW5jdHJsLVsw
LTldKycKPiAJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91
c2Ivc3BhY2VtaXQsazEtZHdjMy55YW1sIwo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXct
Y2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zcGFjZW1pdCxr
MS1kd2MzLmV4YW1wbGUuZHRiOiB1c2JAYzBhMDAwMDAgKHNwYWNlbWl0LGsxLWR3YzMpOiB1c2JA
MDpyZWc6IFtbMCwgMF0sIFswLCA2NTUzNl1dIGlzIHRvbyBsb25nCj4gCWZyb20gc2NoZW1hICRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL3NwYWNlbWl0LGsxLWR3YzMueWFt
bCMKPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc3BhY2VtaXQsazEtZHdjMy5leGFtcGxlLmR0YjogdXNi
QDAgKHNucHMsZHdjMyk6IHJlZzogW1swLCAwXSwgWzAsIDY1NTM2XV0gaXMgdG9vIGxvbmcKPiAJ
ZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91c2Ivc25wcyxk
d2MzLnlhbWwjCgpUaGFua3MgZm9yIHRoZSByZXBvcnQhCknigJlsbCBhZGQgJyNhZGRyZXNzLWNl
bGxzJyBhbmQgJyNzaXplLWNlbGxzJyB1bmRlciBwcm9wZXJ0aWVzIHRvIHJlc29sdmUgCnRoZSBl
cnJvci4KYmVjYXVzZSBpZiBJIGRyb3AgdGhlbSBmcm9tIHRoZSBleGFtcGxlLCBJIGdldCB3YXJu
aW5ncyBsaWtlOgoKV2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRyX3NpemUpOiAvZXhhbXBsZS0w
L3VzYkBjMGEwMDAwMC91c2JAMDogClJlbHlpbmcgb24gZGVmYXVsdCAjYWRkcmVzcy1jZWxscyB2
YWx1ZQoKPgo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6Cj4KPiBT
ZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGlu
Z3MvcGF0Y2gvMjAyNTA0MDctYjQtazEtdXNiMy12My0yLXYxLTMtYmYwYmNjNDFjOWJhQHdodXQu
ZWR1LmNuCj4KPiBUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVz
dCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVuY3kKPiBzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMq
IHBhdGNoLgo+Cj4gSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFu
ZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxp
bnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCj4gZGF0ZToKPgo+IHBpcDMg
aW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKPgo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0
IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUKPiB0aGF0IERU
X1NDSEVNQV9GSUxFUyBjYW4gYmUgc2V0IHRvIHlvdXIgc2NoZW1hIGZpbGUgdG8gc3BlZWQgdXAg
Y2hlY2tpbmcKPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0
IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgo+Cj4KPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
