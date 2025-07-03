Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E3BC83F04
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IYSzG+bCuVLXM9P5CKdA1bqrmxqqTthV9aNA3juyQoo=; b=vG2ee4itD6XIng
	n/i6YJitETZrBrKOdL2aEecTFJCkB8D+ykejmNKUw+p3YIZGjh3oY1ZW2b9ejVLHnp2I2jKKkSmqG
	tp1qRhuJy20iCoIru8rQgTt3jcGtDgboiO0Ajju9a3+byc/Iap3Ezf9uro0AsJYapfRtLdZj0ji0T
	EzbbQZntTT0t13ltSbcILVOvWbRn6jITLJmk/5D+J/RcG4GoZCQ+NhB5bwIYKOiRBSo50xqhMHKGV
	r/WRFTKOFDAtDxCrYAI1ASPUlQDIGtSITgbKvPkQx1LrbyUcR2no5dMFgCDIeVRNpyIzKSvrkSnAH
	Q4Dxpy9cIRG3jDkEQdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGpj-0000000Avui-1xLf;
	Thu, 03 Jul 2025 10:06:23 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFp4-0000000Alb3-0Ovn
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 09:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751533249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KKVvBkeo3qxgezrXeVABLPlIw6eJ6RvPjxqCLLPR4Wnc8F2rJVoSc/AEIptXtdu4xG8yAAuWEOf9cdgo/kBECOzxLRuHqdPPDDAw/HmE/CuvN4cezsUdL0OCJ0GWzVrpS1LI2/Ciu1SQcN+OkAXEc0lqPwn2fEYKP8P9g+y1ACg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751533249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1x9noGp/YyjeYTaho9SwTajjJAkTELQbXuhXq6ypjTQ=; 
	b=TRDiAOb2YJWhEJMbR3dNNALR4dGoxA+pcqocs96/m/wERWsEejxGwuKEswbte2hd4eCHqJ37IJcmfQpdtcXRghKbNQxmFwIBZEz0JQqpF5QPbA5aIHFiSRdlqguMcVL2q8hyAMcP+FHQDlYCVZSao3IGgWy6LHN9cWiT2WoY9Kg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751533249;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1x9noGp/YyjeYTaho9SwTajjJAkTELQbXuhXq6ypjTQ=;
	b=qXVoJZH4IPSkxKuRWuy6EJrTq8XQNfEpvvT6bKfDt6znEZxc8MF2TGctYNIe6epI
	Q7bHijO9JmxE/LeFbyiARWeQSK/7g+i/aq/na+ZyVvlj+wBYaPLB93n3J6D4yIr5+r1
	l5cmMXZN430EDk9vglEow6IExvLngACe4mS9YahQ=
Received: by mx.zohomail.com with SMTPS id 175153324571033.72754487040095;
	Thu, 3 Jul 2025 02:00:45 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Vivian Wang" <wangruikang@iscas.ac.cn>, 
	"Andrew Lunn" <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <ce2881b9-38ed-42b6-824d-72948389e8fa@iscas.ac.cn>
Cc: "Vivian Wang" <uwu@dram.page>, 
	"Lukas Bulwahn" <lukas.bulwahn@redhat.com>, 
	"Geert Uytterhoeven" <geert+renesas@glider.be>, 
	"Parthiban Veerasooran" <Parthiban.Veerasooran@microchip.com>, 
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 5/5] riscv: dts: spacemit: Add Ethernet support
	 for Jupiter
Message-ID: <184eb232eceb01f8.c7773f00732f7e87.4136a253a628cb2b@Jude-Air.local>
Date: Thu, 3 Jul 2025 09:00:36 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_020138_534449_D6F69604 
X-CRM114-Status: GOOD (  13.09  )
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

SGkgVml2aWFuLAoKT24gMDMvMDcvMjAyNSAxNTo0NiwgVml2aWFuIFdhbmcgd3JvdGU6Cj4gSGkg
SnVuaHVpLAo+IAo+IE9uIDcvMy8yNSAxNDo0OCwgSnVuaHVpIExpdSB3cm90ZToKPj4gSGkgVml2
aWFuLAo+PiBUaGFua3MgZm9yIHlvdSB3b3JrIQo+Pgo+PiBPbiAyMDI1LzcvMiAxNDowMSwgVml2
aWFuIFdhbmcgd3JvdGU6Cj4+PiBNaWxrLVYgSnVwaXRlciB1c2VzIGFuIFJHTUlJIFBIWSBmb3Ig
ZWFjaCBwb3J0IGFuZCB1c2VzIEdQSU8gZm9yIFBIWQo+Pj4gcmVzZXQuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPgo+Pgo+PiBTdWNj
ZXNzZnVsbHkgdGVzdGVkIHdpdGggaXBlcmYzIG9uIE1pbGstViBKdXBpdGVyLgo+Pgo+PiBUQ1Ag
Ung6IDk0MSBNYml0cy9zZWMKPj4gVENQIFR4OiA5NDMgTWJpdHMvc2VjCj4+IFVEUCBSeDogOTU2
IE1iaXRzL3NlYwo+PiBVRFAgVHg6IDk1NiBNYml0cy9zZWMKPj4KPj4gVGVzdGVkLWJ5OiBKdW5o
dWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+wqAKPj4KPiBUaGFua3MgZm9yIHRoZSB0
ZXN0aW5nISBJIGRvIG5vdCBoYXZlIGEgTWlsay1WIEp1cGl0ZXIgaGFuZHksIHNvIHRoYXQKPiB3
YXMgdmVyeSBoZWxwZnVsLgo+IAo+IEFzIGRpc2N1c3NlZCBbMV0sIEkgd2lsbCBwb3N0IGEgdjQg
c29vbiB3aXRoIG1pbm9yIGZpeGVzIGFuZCBhbHNvIHNhbnMKPiB0aGUgRFRTIGNoYW5nZXMuIEkg
d2lsbCBwdXQgeW91ciBUZXN0ZWQtYnkgb24gdGhlIGRyaXZlciBwYXRjaCBpbnN0ZWFkCj4gb2Yg
dGhpcyBEVFMgcGF0Y2gsIHNvIGl0IHdpbGwgc2hvdyB1cCBpbiB2NC4KPiAKPiBBcmUgeW91IG9r
YXkgd2l0aCB0aGlzPyBJZiB5b3UgZG9uJ3QgbGlrZSBpdCBmZWVsIGZyZWUgdG8gdGVsbCBtZS4K
Ckl0J3Mgb2theSB0byBtZS4gVGhhbmtzIQoKPiAKPiBSZWdhcmRzLAo+IFZpdmlhbiAiZHJhbWZv
cmV2ZXIiIFdhbmcKPiAKPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3NwYWNlbWl0L2E5
Y2FkMDdjLTA5NzMtNDNjMy04OWYzLTk1Yjg1NmI1NzVkZkBpc2Nhcy5hYy5jbi8KPiAKPj4+IC0t
LQo+Pj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1taWxrdi1qdXBpdGVyLmR0
cyB8IDQ2Cj4+PiArKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDQ2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMS1taWxrdi1qdXBpdGVyLmR0cwo+Pj4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLW1pbGt2LWp1cGl0ZXIuZHRzCj4+PiBpbmRleAo+Pj4gNDQ4MzE5MjE0MTA0
OWNhYTIwMWMwOTNmYjIwNmI2MTM0YTA2NGY0Mi4uYzU5MzM1NTVjMDZiNjZmNDBlNjFmZTJiOWMx
NTliYTA3NzBjMmZhMQo+Pj4gMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L2sxLW1pbGt2LWp1cGl0ZXIuZHRzCj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLW1pbGt2LWp1cGl0ZXIuZHRzCj4+PiBAQCAtMjAsNiArMjAsNTIgQEAgY2hv
c2VuIHsKPj4+IMKgwqDCoMKgwqAgfTsKPj4+IMKgIH07Cj4+PiDCoCArJmV0aDAgewo+Pj4gK8Kg
wqDCoCBwaHktaGFuZGxlID0gPCZyZ21paTA+Owo+Pj4gK8KgwqDCoCBwaHktbW9kZSA9ICJyZ21p
aS1pZCI7Cj4+PiArwqDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+PiArwqDCoMKg
IHBpbmN0cmwtMCA9IDwmZ21hYzBfY2ZnPjsKPj4+ICvCoMKgwqAgcngtaW50ZXJuYWwtZGVsYXkt
cHMgPSA8MD47Cj4+PiArwqDCoMKgIHR4LWludGVybmFsLWRlbGF5LXBzID0gPDA+Owo+Pj4gK8Kg
wqDCoCBzdGF0dXMgPSAib2theSI7Cj4+PiArCj4+PiArwqDCoMKgIG1kaW8tYnVzIHsKPj4+ICvC
oMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwweDE+Owo+Pj4gK8KgwqDCoMKgwqDCoMKg
ICNzaXplLWNlbGxzID0gPDB4MD47Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgcmVzZXQtZ3Bp
b3MgPSA8JmdwaW8gSzFfR1BJTygxMTApIEdQSU9fQUNUSVZFX0xPVz47Cj4+PiArwqDCoMKgwqDC
oMKgwqAgcmVzZXQtZGVsYXktdXMgPSA8MTAwMDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJlc2V0
LXBvc3QtZGVsYXktdXMgPSA8MTAwMDAwPjsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZ21p
aTA6IHBoeUAxIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDE+Owo+Pj4g
K8KgwqDCoMKgwqDCoMKgIH07Cj4+PiArwqDCoMKgIH07Cj4+PiArfTsKPj4+ICsKPj4+ICsmZXRo
MSB7Cj4+PiArwqDCoMKgIHBoeS1oYW5kbGUgPSA8JnJnbWlpMT47Cj4+PiArwqDCoMKgIHBoeS1t
b2RlID0gInJnbWlpLWlkIjsKPj4+ICvCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
Pj4+ICvCoMKgwqAgcGluY3RybC0wID0gPCZnbWFjMV9jZmc+Owo+Pj4gK8KgwqDCoCByeC1pbnRl
cm5hbC1kZWxheS1wcyA9IDwwPjsKPj4+ICvCoMKgwqAgdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8
MjUwPjsKPj4+ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4gKwo+Pj4gK8KgwqDCoCBtZGlv
LWJ1cyB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MHgxPjsKPj4+ICvC
oMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwweDA+Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIHJlc2V0LWdwaW9zID0gPCZncGlvIEsxX0dQSU8oMTE1KSBHUElPX0FDVElWRV9MT1c+Owo+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJlc2V0LWRlbGF5LXVzID0gPDEwMDAwPjsKPj4+ICvCoMKgwqDC
oMKgwqDCoCByZXNldC1wb3N0LWRlbGF5LXVzID0gPDEwMDAwMD47Cj4+PiArCj4+PiArwqDCoMKg
wqDCoMKgwqAgcmdtaWkxOiBwaHlAMSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcg
PSA8MHgxPjsKPj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gK8KgwqDCoCB9Owo+Pj4gK307Cj4+
PiArCj4+PiDCoCAmdWFydDAgewo+Pj4gwqDCoMKgwqDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOwo+Pj4gwqDCoMKgwqDCoCBwaW5jdHJsLTAgPSA8JnVhcnQwXzJfY2ZnPjsKPj4+CgotLSAK
QmVzdCByZWdhcmRzLApKdW5odWkgTGl1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
