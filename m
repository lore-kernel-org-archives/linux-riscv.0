Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960BCCAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuVgTmfkBcLPNMkbiDgbFt5JXsg3vtkv3dYRUdELX1U=; b=Wm3g2PGjhrXygr
	fDzAp7X3yRx4cb8PVXTCLGQ7knp0uGI0Ogg9SZKV568k4lCi4sZP+yD3nLSA/C70i5i7OIcS7/s/f
	Pl0upBbXuxUkVZKfoWIuq6DV9nMyBk6QvUwmBDjJp2rn0kmlokHKQTMhIxIiayi4hn5r4qhTfz0ay
	o+HlJVHJGbdq7/XwG13ZztGOOQydPT86RjqvM8s4JVZhIplpRpOxcC0sGdIvgYDYVtNvbJRLoon6z
	XFJ2XqvKZniBAJQBa21V9D/M9yoZUvR+PvtDPk261U1BJOZ+r9julGt8B1W7J+1jEXXTiIak0gyov
	A1Sv+ZkqKbDCe9B97nDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWtM-00000002Ivq-08jb;
	Fri, 19 Sep 2025 08:54:56 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWtI-00000002Iuu-3f2X
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 08:54:55 +0000
Received: from [192.168.3.223] (unknown [124.16.136.211])
	by APP-03 (Coremail) with SMTP id rQCowAD3PnkUGs1oZXWwAw--.135S2;
	Fri, 19 Sep 2025 16:53:41 +0800 (CST)
Message-ID: <c3f2bc47-b7d3-4054-ae09-3265470c2306@iscas.ac.cn>
Date: Fri, 19 Sep 2025 16:53:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 0/5] Add Ethernet MAC support for SpacemiT K1
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
 <CGME20250919082706eucas1p1fa29f9e90e1afdf3894b5effd734cf3f@eucas1p1.samsung.com>
 <a52c0cf5-0444-41aa-b061-a0a1d72b02fe@samsung.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <a52c0cf5-0444-41aa-b061-a0a1d72b02fe@samsung.com>
X-CM-TRANSID: rQCowAD3PnkUGs1oZXWwAw--.135S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rtFW3Xr4kXF1fXFWDJwb_yoW8WFW3pa
	ykAas0kr1Dtr42kr4jgr4vyayIva1kKF1Durn5Kry09a98AFn7tr9Ygw45A34jvrZ7Zr4Y
	yayUX395JFyDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07jBYLkUUUUU=
X-Originating-IP: [124.16.136.211]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_015453_290973_E59F5621 
X-CRM114-Status: GOOD (  16.89  )
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

SGkgTWFyZWssCgpUaGFua3MgZm9yIHRoZSB0ZXN0aW5nLgoKT24gOS8xOS8yNSAxNjoyNywgTWFy
ZWsgU3p5cHJvd3NraSB3cm90ZToKPiBIaSBBbGwsCj4KPiBPbiAxNC4wOS4yMDI1IDA2OjIzLCBW
aXZpYW4gV2FuZyB3cm90ZToKPj4gU3BhY2VtaVQgSzEgaGFzIHR3byBnaWdhYml0IEV0aGVybmV0
IE1BQ3Mgd2l0aCBSR01JSSBhbmQgUk1JSSBzdXBwb3J0Lgo+PiBBZGQgZGV2aWNldHJlZSBiaW5k
aW5ncywgZHJpdmVyLCBhbmQgRFRTIGZvciBpdC4KPj4KPj4gVGVzdGVkIHByaW1hcmlseSBvbiBC
YW5hbmFQaSBCUEktRjMuIEJhc2ljIFRYL1JYIGZ1bmN0aW9uYWxpdHkgYWxzbwo+PiB0ZXN0ZWQg
b24gTWlsay1WIEp1cGl0ZXIuCj4+Cj4+IEkgd291bGQgbGlrZSB0byBub3RlIHRoYXQgZXZlbiB0
aG91Z2ggc29tZSBiaXQgZmllbGQgbmFtZXMgc3VwZXJmaWNpYWxseQo+PiByZXNlbWJsZSB0aGF0
IG9mIERlc2lnbldhcmUgTUFDLCBhbGwgb3RoZXIgZGlmZmVyZW5jZXMgcG9pbnQgdG8gaXQgaW4K
Pj4gZmFjdCBiZWluZyBhIGN1c3RvbSBkZXNpZ24uCj4+Cj4+IEJhc2VkIG9uIFNwYWNlbWlUIGRy
aXZlcnMgWzFdLiBUaGVzZSBwYXRjaGVzIGFyZSBhbHNvIGF2YWlsYWJsZSBhdDoKPj4KPj4gaHR0
cHM6Ly9naXRodWIuY29tL2RyYW1mb3JldmVyL2xpbnV4L3RyZWUvazEvZXRoZXJuZXQvdjEyCj4+
Cj4+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL3NwYWNlbWl0LWNvbS9saW51eC1rMXgKPiBUaGlz
IGRyaXZlciByZWNlbnRseSBsYW5kZWQgaW4gbGludXgtbmV4dCBhcyBjb21taXQgYmZlYzZkN2Yy
MDAxICgibmV0OiAKPiBzcGFjZW1pdDogQWRkIEsxIEV0aGVybmV0IE1BQyIpLiBJbiBteSB0ZXN0
cyBJIGZvdW5kIHRoYXQgaXQgCj4gdHJpZ2dlcnPCoGxvY2sgZGVwIHdhcm5pbmdzIHJlbGF0ZWQg
dG8gc3RhdHNfbG9jayBhY3F1aXNpdGlvbi4gSW4gdGhlIAo+IGN1cnJlbnQgY29kZSBpdCBpcyBi
ZWluZyBhY3F1aXJlZCB3aXRoIHNwaW5fbG9jaygpLiBGb3IgdGVzdHMgSSd2ZSAKPiBjaGFuZ2Vk
IHRoYXQgdG8gc3Bpbl9sb2NrX2lycXNhdmUoKSBhbmQgdGhlIHdhcm5pbmdzIHdlbnQgYXdheSwg
YnV0IEknbSAKPiBub3Qgc3VyZSB0aGF0IHRoaXMgaXMgdGhlIHByb3BlciBmaXguIEkndmUgYWxz
byBjaGVja2VkIHRoZSBkcml2ZXIgCj4gaGlzdG9yeSBhbmQgJ2lycXNhdmUnIGxvY2tpbmcgd2Fz
IHVzZWQgaW4gcHJlLXY3IHZlcnNpb24sIGJ1dCBpdCB3YXMgCj4gcmVtb3ZlZCBsYXRlciBvbiBK
YWt1YidzIHJlcXVlc3QgYW5kIGRlc2NyaWJlZCBhIGJpdCBtaXNsZWFkaW5nIGFzIAo+ICJSZW1v
dmVkIHNjb3BlZF9ndWFyZCB1c2FnZSIuCgpPb3BzLCBJIGhhZCBhc3N1bWVkIHRoYXQgaXJxc2F2
ZSB3YXMgdW5uZWNlc3NhcnkgYW5kIG1pc3NlZCB0aGF0IHRoZQpzdGF0aXN0aWNzIGZ1bmN0aW9u
cyBhcmUgY2FsbGVkIHdpdGggc29mdGlycSBlbmFibGVkIGR1cmluZwpyZWdpc3Rlcl9uZXRkZXYu
IFRoZSBvbmVzIGNhbGxlZCBhdCBwcm9iZSB0aW1lIHNob3VsZCBiZSBjaGFuZ2VkIHRvCl9pcnFz
YXZlIG9yIHNvbWUgb3RoZXIgdmFyaWFudC4KCkknbGwgdGFrZSBhIGxvb2sgYXQgdGhlIGRldGFp
bHMgbXlzZWxmIGFuZCBzZW5kIGEgZml4LgoKVGhhbmtzLApWaXZpYW4gImRyYW1mb3JldmVyIiBX
YW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
