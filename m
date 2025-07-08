Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA6CC71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SbKMZcMbMKWXQa8/3iJ1UXE5cJs/Fpcp6yXjGw65Ho=; b=UYxpvNO56lljs0
	A06l3cqlzb+sAAb6R5b/5rkcxxxI9AuO4PVTiTSc0ZlhHPxlW7Zpss17P9fiWRsLnWy4hI5expxsV
	olE/+fGJEPwl3iCxpW9V/2wj7HGBtovIFVtyuMF/TbqpZYdrrwcO19EK1iL05dplVbfdYiLFPXlr6
	7pfZeswggjztZhEm1vXKE8AWH5iliULgk/uUfm5ktEnqKjy7jk8o2CgR8N3dNWf+j5lMKqVVw2+Aq
	huHpOJcZBSWnXftQoUUHoOE5hSLwA1V+bzaVpHvGSw9Nw5GnuCtto83c3daH9VCsxjZqf6BBiEsMb
	usq26IR9/RD2jbT/9Ctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxwx-000000044bn-2BPM;
	Tue, 08 Jul 2025 02:20:51 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxwC-000000044SJ-0d0d
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 02:20:06 +0000
Received: from [192.168.33.69] (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3y1s7gGxoHwLzAQ--.7093S2;
	Tue, 08 Jul 2025 10:19:40 +0800 (CST)
Message-ID: <8c917152-0260-4442-a944-3cc0b3356e04@iscas.ac.cn>
Date: Tue, 8 Jul 2025 10:19:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: Add support for
 SpacemiT K1
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Conor Dooley <conor.dooley@microchip.com>, netdev@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Vivian Wang <uwu@dram.page>, Yixun Lan <dlan@gentoo.org>,
 spacemit@lists.linux.dev, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
References: <20250703-net-k1-emac-v4-0-686d09c4cfa8@iscas.ac.cn>
 <20250703-net-k1-emac-v4-1-686d09c4cfa8@iscas.ac.cn>
 <175153978342.612698.13197728053938266111.robh@kernel.org>
 <17733827-8038-4c85-9bb1-0148a50ca10f@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <17733827-8038-4c85-9bb1-0148a50ca10f@iscas.ac.cn>
X-CM-TRANSID: zQCowAA3y1s7gGxoHwLzAQ--.7093S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1DCrWfKrWfJF4kAryxXwb_yoW8AF47pa
	yak3ZIkF1qyr47Aw4avwn29a4F9r1rKFyUXF9Iqw1vqan8X3WftryS9r15u3W8ZrWxAFyY
	vr15W3W5CFyDAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUkWSrDUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_192004_566932_E495E09E 
X-CRM114-Status: GOOD (  14.60  )
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

T24gNy8zLzI1IDIwOjMxLCBWaXZpYW4gV2FuZyB3cm90ZToKPgo+IE9uIDcvMy8yNSAxODo0OSwg
Um9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4+IE9uIFRodSwgMDMgSnVsIDIwMjUgMTc6NDI6MDIg
KzA4MDAsIFZpdmlhbiBXYW5nIHdyb3RlOgo+Pj4gVGhlIEV0aGVybmV0IE1BQ3Mgb24gU3BhY2Vt
aVQgSzEgYXBwZWFycyB0byBiZSBhIGN1c3RvbSBkZXNpZ24uCj4+PiBTcGFjZW1pVAo+Pj4gcmVm
ZXJzIHRvIHRoZW0gYXMgIkVNQUMiLCBzbyBsZXQncyBqdXN0IGNhbGwgdGhlbSAic3BhY2VtaXQs
azEtZW1hYyIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlrYW5n
QGlzY2FzLmFjLmNuPgo+Pj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+Cj4+PiAtLS0KPj4+IMKgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9zcGFjZW1pdCxrMS1lbWFjLnlhbWzCoCB8IDgxCj4+PiArKysrKysrKysrKysrKysrKysrKysr
Cj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKQo+Pj4KPj4gTXkgYm90IGZv
dW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6
Cj4+Cj4+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoKPj4KPj4gZHRzY2hlbWEvZHRjIHdhcm5p
bmdzL2Vycm9yczoKPj4gRXJyb3I6Cj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvc3BhY2VtaXQsazEtZW1hYy5leGFtcGxlLmR0czozNi4zNi0zNwo+PiBzeW50YXggZXJy
b3IKPj4gRkFUQUwgRVJST1I6IFVuYWJsZSB0byBwYXJzZSBpbnB1dCB0cmVlCj4KPiBNeSBiYWQu
IFRoZSBleGFtcGxlIHN0aWxsIGRlcGVuZHMgb24gdGhlIHJlc2V0IGJpbmRpbmdzIGZvciB0aGUK
PiBjb25zdGFudCBSRVNFVF9FTUFDMC4gSSBqdXN0IHRyaWVkIHdpdGggcmVzZXQgdjEyIFsxXSBh
bmQgdGhhdCBmaXhlcyBpdC4KPgo+IFsxXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFj
ZW1pdC8yMDI1MDcwMjExMzcwOS4yOTE3NDgtMi1lbGRlckByaXNjc3Rhci5jb20vCj4KPiBWaXZp
YW4gImRyYW1mb3JldmVyIiBXYW5nwqAKPgpKdXN0IGZvciB0aGUgcmVjb3JkIGZvciBhbnlvbmUg
d2F0Y2hpbmcgdGhpcyB0aHJlYWQsIEknbSBtb3N0IGxpa2VseQpnb2luZyB0byBiZSBob2xkaW5n
IG9mZiBzZW5kaW5nIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhpcyB1bnRpbCByZXNldCB2MTIKKHBy
b2JhYmx5PykgZ2V0cyBhdCBsZWFzdCB0YWtlbiB1cCBieSBhIG1haW50YWluZXIuCgpJdCdzIGEg
Yml0IG9mIGEgd2VpcmQgc2l0dWF0aW9uIG92ZXIgdGhlcmUgc2luY2UgdGhleSdyZSBzZW5kaW5n
IHRoZQpyZXNldCBjb250cm9sbGVyIHN0dWZmIHRocm91Z2ggdGhlIGNsayB0cmVlLCBidXQgdGhl
biBpdCdzIGFsc28gYQptZWdhLXN5c2NvbiBzaXR1YXRpb24gZm9yIHRoZSBLMSBhbmQgdGhhdCdz
IGhvdyB0aGV5IGRlY2lkZWQgdGhleSB3YW50Cml0LCBzbyBpdCBpcyB3aGF0IGl0IGlzLgoKKFRo
ZSBETUEgYnVzIGRlcGVuZGVuY3kgdGhhdCB3YXMgaW4gdjMgaXMgYWxsIERUUyBjaGFuZ2VzIHdp
dGggbm8KYmluZGluZ3MgYW5kIG5vIGRyaXZlciwgc28gdGhhdCBjb3VsZCBiZSBlYXNpbHkgaGFu
ZGxlZCBlbnRpcmVseSBpbiB0aGUKU3BhY2VtaVQgU29DIHRyZWUsIHdoaWNoIGlzIG5pY2UuKQoK
Vml2aWFuCgo+PiBbLi4uXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
