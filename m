Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92AAC369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FX7PDF3zhQQY98t6oEROkhJ5VRvVnBjeMRkZCe6ZKW0=; b=yzYGXYxAbtWWEO
	LCkX3RqYvZUSYP7p2GpN9L+vsYk4hHXTlIyMp8o/Ua1gSDVnK5HSEse7uTeAYAe9FirBx7NnIViHG
	TaMpnEPlMNc10GUQtPKJp8uH8C45MICUOIlHZclO8s6i+xY6njbo2jdn/FlsDB1oP+N94n2/D8X53
	T54C4ht1qEFPlVwWq8Fso+rlPjSqMnLFMzFOrh+Z1Xg12UESu38FZ6C4g8ufTev4wv8QsSXtz8L2q
	PdyaTA7PTVHPsBEoLD5V4RD9rx1RZSSkIC6sq6XHXSgQhg0cGJ7J9eP4rIjrVqVhrd96wkC3KyNwq
	Xeeqm+T+y3QPT/LlGAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qfy-00000006YlF-0qel;
	Wed, 09 Apr 2025 08:20:51 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qbd-00000006Y2M-0Uv5;
	Wed, 09 Apr 2025 08:16:22 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11351408e;
	Wed, 9 Apr 2025 16:16:11 +0800 (GMT+08:00)
Message-ID: <9f7d1ea4-d9cb-48d2-9af1-4db38fadd55e@whut.edu.cn>
Date: Wed, 9 Apr 2025 16:16:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: usb: add SpacemiT K1 DWC3 glue
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn>
 <ac9fd6b3-2184-4d75-83e5-6caee4f3758d@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <ac9fd6b3-2184-4d75-83e5-6caee4f3758d@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk0dVh1KThlCSBlITElJH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a96199efb6303a1kunm11351408e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MjY6CSo6IjJIDj0cN1ZNAR06
	FgEwC01VSlVKTE9PSkNNTkxDTEJKVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQU9PT043Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_011621_357602_FADE94A1 
X-CRM114-Status: GOOD (  12.98  )
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

T24gNC83LzI1IDk6MjIgUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMDcvMDQv
MjAyNSAxNDozOCwgWmUgSHVhbmcgd3JvdGU6Cj4+IEFkZCBzdXBwb3J0IGZvciBTcGFjZW1pVCBE
V0MzIGdsdWUgZHJpdmVyLCB3aGljaCBtYW5hZ2VzIGludGVycnVwdCwKPj4gcmVzZXQgYW5kIGNs
b2NrIHJlc291cmNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaZSBIdWFuZyA8aHVhbmd6ZUB3aHV0
LmVkdS5jbj4KPj4gLS0tCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NwYWNlbWl0
LGsxLWR3YzMueWFtbCAgfCA3OCArKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDc4IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc3BhY2VtaXQsazEtZHdjMy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zcGFjZW1pdCxrMS1kd2MzLnlhbWwKPiBDb21i
aW5pbmcgMyBzdWJzeXN0ZW1zIGludG8gb25lIHBhdGNoc2V0IGlzIGEgcG9vciBpZGVhLgoKQWNr
bm93bGVkZ2VkLCB3aWxsIHNwbGl0IGludG8gdHdvIHNldHMgaW4gbmV4dCB2ZXJzaW9uCjEuIHVz
YjIgcGh5IGFuZCBjb21ibyBwaHkKMi4gZHdjMyBnbHVlIGRyaXZlciBhbmQgZHRzCgo+Cj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAuLjQwY2UzZmQxMzMwZDVmMzcxZWM2OTE1NWMyMzdlMTBhNjVhOWQ4ZjQKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL3NwYWNlbWl0LGsxLWR3YzMueWFtbAo+PiBAQCAtMCwwICsxLDc4IEBACj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAx
LjIKPj4gKy0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91c2Ivc3Bh
Y2VtaXQsazEtZHdjMy55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBTcGFjZW1pVCBLMSBTdXBlclNw
ZWVkIERXQzMgVVNCIFNvQyBDb250cm9sbGVyIEdsdWUKPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+
ICsgIC0gWmUgSHVhbmcgPGh1YW5nemVAd2h1dC5lZHUuY24+Cj4+ICsKPj4gK3Byb3BlcnRpZXM6
Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHNwYWNlbWl0LGsxLWR3YzMKPj4gKwo+
PiArICByYW5nZXM6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICBjbG9ja3M6Cj4+ICsg
ICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICByZXNldHM6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4g
Kwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgaW50ZXJj
b25uZWN0czoKPiBNaXNzaW5nIG1heEl0ZW1zCgpXaWxsIGZpeAoKPgo+PiArICAgIGRlc2NyaXB0
aW9uOgo+PiArICAgICAgT24gU3BhY2VtaVQgSzEsIFVTQiBwZXJmb3JtcyBETUEgdGhyb3VnaCBi
dXMgb3RoZXIgdGhhbiBwYXJlbnQgRFQgbm9kZS4KPj4gKyAgICAgIFRoZSAnaW50ZXJjb25uZWN0
cycgcHJvcGVydHkgZXhwbGljaXRseSBkZXNjcmliZXMgdGhpcyBwYXRoLCBlbnN1cmluZwo+PiAr
ICAgICAgY29ycmVjdCBhZGRyZXNzIHRyYW5zbGF0aW9uLgo+PiArCj4+ICsgIGludGVyY29ubmVj
dC1uYW1lczoKPj4gKyAgICBjb25zdDogZG1hLW1lbQo+PiArCj4+ICsgICMgb3B0aW9uYWwKPiBE
cm9wLCBEb24ndCByZXBlYXQgY29uc3RyYWludHMgaW4gZnJlZSBmb3JtIHRleHQuCgpXaWxsIGRv
Cgo+Cj4+ICsgIHZidXMtc3VwcGx5Ogo+PiArICAgIGRlc2NyaXB0aW9uOiBBIHBoYW5kbGUgdG8g
dGhlIHJlZ3VsYXRvciBzdXBwbHlpbmcgdGhlIFZCVVMgdm9sdGFnZS4KPj4gKwo+PiArcGF0dGVy
blByb3BlcnRpZXM6Cj4+ICsgICdedXNiQCc6Cj4+ICsgICAgJHJlZjogc25wcyxkd2MzLnlhbWwj
Cj4gTm8sIHJhdGhlciBmb2xkIGNoaWxkIGludG8gdGhlIHBhcmVudC4KCknigJltIG5vdCBlbnRp
cmVseSBzdXJlIEkgdW5kZXJzdGFuZCB5b3VyIHN1Z2dlc3Rpb24uIENvdWxkIHlvdSBwbGVhc2Ug
cHJvdmlkZQphbiBleGFtcGxlPyBUaGFua3MhCgo+Cj4+ICsKPj4gK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQo+IFRoaXMgZ29lcyBhZnRlciByZXF1aXJlZDosIGFsd2F5cy4KCk9LCgo+Cj4+
ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSByYW5nZXMKPj4gKyAg
LSBjbG9ja3MKPj4gKyAgLSByZXNldHMKPj4gKyAgLSBpbnRlcnJ1cHRzCj4+ICsgIC0gaW50ZXJj
b25uZWN0cwo+PiArICAtIGludGVyY29ubmVjdC1uYW1lcwo+PiArCj4+ICtleGFtcGxlczoKPj4g
KyAgLSB8Cj4+ICsgICAgdXNiQGMwYTAwMDAwIHsKPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJz
cGFjZW1pdCxrMS1kd2MzIjsKPj4gKyAgICAgICAgY2xvY2tzID0gPCZzeXNjb25fYXBtdSAxNj47
Cj4+ICsgICAgICAgIGludGVycnVwdHMgPSA8MTQ5PjsKPj4gKyAgICAgICAgaW50ZXJjb25uZWN0
cyA9IDwmZHJhbV9yYW5nZTA+Owo+PiArICAgICAgICBpbnRlcmNvbm5lY3QtbmFtZXMgPSAiZG1h
LW1lbSI7Cj4+ICsgICAgICAgIHJhbmdlcyA9IDwweDAgMHhjMGEwMDAwMCAweDEwMDAwPjsKPj4g
KyAgICAgICAgcmVzZXRzID0gPCZzeXNjb25fYXBtdSA4PjsKPj4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+PiArICAgICAgICBz
dGF0dXMgPSAiZGlzYWJsZWQiOwo+IE5vcGUsIGRyb3AuCgpXaWxsIGRyb3AgJ3N0YXR1cycKCj4K
Pgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+Cj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
