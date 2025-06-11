Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B1C71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zAhtB0HBNEgupyNI33vuN1uZDIFmEpx4GfoziIi3qI=; b=Y22U2Jv+E2FIeN
	pPRGI9+WGBxTuwaOwl8yHX3jNgw6zqr8I/WsNnvtQ/m9FhIb8+C+/dGpEU3CurKzGS0xfxVFPnN1l
	CSQIQ7yXncpHt3TkGVa6qLXDoHmM/UhKP+i9OpLjDwcfgbv7JMdS37VX3MxrxmW/I9dLWrCYs4r0a
	Q66tcjvr4kfU3mr3QparPxnQQz9LGqIcrktOxB0SsonYGAE4OAA7FSJYKMz2vP/Wsa5TVrHQplPcB
	yB//ZK9ILpSrgMRGn5T4InoSW2+cIbtw990Si+wtaG5JxkmAqyeFyVnnY7de8heI5ov4LFiu7/5XC
	0y59SYlv86UdA3LKrt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYX-0000000B4Qm-1s0O;
	Wed, 11 Jun 2025 19:56:17 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5h-0000000AZD4-2j5q
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:19 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 55BGDG0d043539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 12 Jun 2025 00:13:16 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 00:13:16 +0800
Date: Thu, 12 Jun 2025 00:13:16 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <aEmrHPd7RxUSOLAY@atctrx.andestech.com>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
 <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 55BGDG0d043539
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091417_995435_66CC864F 
X-CRM114-Status: GOOD (  27.71  )
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

T24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDU6MTc6NTBQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IFtFWFRFUk5BTCBNQUlMXQoKPiBEYXRlOiBNb24sIDkgSnVuIDIwMjUgMTc6MTc6NTAg
KzAxMDAKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Cj4gVG86IEJlbiBa
b25nLVlvdSBYaWUgPGJlbjcxN0BhbmRlc3RlY2guY29tPgo+IENjOiBwYXVsLndhbG1zbGV5QHNp
Zml2ZS5jb20sIHBhbG1lckBkYWJiZWx0LmNvbSwgYW91QGVlY3MuYmVya2VsZXkuZWR1LAo+ICBh
bGV4QGdoaXRpLmZyLCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3Ir
ZHRAa2VybmVsLm9yZywKPiAgdGdseEBsaW51dHJvbml4LmRlLCBkYW5pZWwubGV6Y2Fub0BsaW5h
cm8ub3JnLAo+ICBwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20sIGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnLAo+ICBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
LCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLAo+ICB0aW02MDlAYW5kZXN0ZWNoLmNvbQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMC84XSBhZGQgVm95YWdlciBib2FyZCBzdXBwb3J0Cj4g
Cj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDU6MTY6NTRQTSArMDEwMCwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDg6MDY6MDdQTSArMDgwMCwgQmVu
IFpvbmctWW91IFhpZSB3cm90ZToKPiA+ID4gT24gRnJpLCBKdW4gMDYsIDIwMjUgYXQgMDU6MDA6
MDZQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IFtFWFRFUk5BTCBNQUlMXQo+
ID4gPiAKPiA+ID4gPiBEYXRlOiBGcmksIDYgSnVuIDIwMjUgMTc6MDA6MDYgKzAxMDAKPiA+ID4g
PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Cj4gPiA+ID4gVG86IEJlbiBa
b25nLVlvdSBYaWUgPGJlbjcxN0BhbmRlc3RlY2guY29tPgo+ID4gPiA+IENjOiBwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20sIHBhbG1lckBkYWJiZWx0LmNvbSwgYW91QGVlY3MuYmVya2VsZXkuZWR1
LAo+ID4gPiA+ICBhbGV4QGdoaXRpLmZyLCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVs
Lm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywKPiA+ID4gPiAgdGdseEBsaW51dHJvbml4LmRlLCBk
YW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnLAo+ID4gPiA+ICBwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20sIGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLAo+ID4gPiA+ICBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnLAo+ID4gPiA+ICB0aW02MDlAYW5kZXN0ZWNoLmNvbQo+ID4gPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMC84XSBhZGQgVm95YWdlciBib2FyZCBzdXBwb3J0Cj4gPiA+ID4gCj4gPiA+ID4g
T24gTW9uLCBKdW4gMDIsIDIwMjUgYXQgMDI6MDc6MzlQTSArMDgwMCwgQmVuIFpvbmctWW91IFhp
ZSB3cm90ZToKPiA+ID4gPiA+IFRoZSBWb3lhZ2VyIGlzIGEgOS424oCdIHggOS424oCdIE1pY3Jv
IEFUWCBmb3JtIGZhY3RvciBkZXZlbG9wbWVudCBib2FyZAo+ID4gPiA+ID4gaW5jbHVkaW5nIEFu
ZGVzIFFpTGFpIFNvQy4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBtaW5pbWFsIGRldmljZSB0cmVl
Cj4gPiA+ID4gPiBmaWxlcyBmb3IgdGhlIFFpTGFpIFNvQyBhbmQgdGhlIFZveWFnZXIgYm9hcmQg
WzFdLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBOb3cgb25seSBzdXBwb3J0IGJhc2ljIHVhcnQgZHJp
dmVycyB0byBib290IHVwIGludG8gYSBiYXNpYyBjb25zb2xlLiBPdGhlcgo+ID4gPiA+ID4gZmVh
dHVyZXMgd2lsbCBiZSBhZGRlZCBsYXRlci4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gWzFdIGh0dHBz
Oi8vd3d3LmFuZGVzdGVjaC5jb20vZW4vcHJvZHVjdHMtc29sdXRpb25zL2FuZGVzaGFwZS1wbGF0
Zm9ybXMvcWlsYWktY2hpcC8KPiA+ID4gPiAKPiA+ID4gPiBCYWxsIGlzIGluIHlvdXIgY291cnQg
bm93LCBhZnRlciByYzEgbWFrZSBhIHRyZWUgYW5kIGdldCBpdCBpbgo+ID4gPiA+IGxpbnV4LW5l
eHQsIGFuZCB0aGVuIHNlbmQgYSBwciB0byBzb2NAa2VybmVsLm9yZyB3aXRoIHRoaXMgbmV3IGNv
bnRlbnQuCj4gPiA+ID4gUGVyaGFwcyB0aGUgZGVmY29uZmlnIHNob3VsZCBnbyBzZXBhcmF0ZWx5
LCBJIGNhbiB0YWtlIHRoYXQgb25lIGlmIHlvdQo+ID4gPiA+IHdhbnQuCj4gPiA+ID4gCj4gPiA+
ID4gQ2hlZXJzLAo+ID4gPiA+IENvbm9yLgo+ID4gPiAKPiA+ID4gSGkgQ29ub3IsCj4gPiA+IAo+
ID4gPiBUaGFua3MgZm9yIHlvdXIgZ3VpZGFuY2Ugb24gdGhlc2UgcGF0Y2hlcy4gSSB3aWxsIHNl
bmQgYSBQUiB0bwo+ID4gPiBzb2NAa2VybmVsLm9yZyBhcyB5b3Ugc3VnZ2VzdGVkLgo+ID4gPiAK
PiA+ID4gRm9yIHRoZSBkZWZjb25maWcgcGF0Y2gsIEknbSBoYXBweSBmb3IgeW91IHRvIGhhbmRs
ZSBpdC4gSnVzdCBsZXQgbWUKPiA+ID4ga25vdyBpZiB0aGVyZSdzIGFueXRoaW5nIHNwZWNpZmlj
IHlvdSdkIGxpa2UgbWUgdG8gaW5jbHVkZS4KPiA+IAo+ID4gT2theSwgSSBwaWNrZWQgaXQgdXAg
b24gdGhlIGJhc2lzIHRoYXQgeW91J2xsIHNlbmQgdGhpcyBhbGwgdG8gQXJuZCBmb3IKPiA+IDYu
MTcKPiAKPiBTb3JyeSwgSSB0aGluayB0aGF0IHdhcyByZWFsbHkgcG9vcmx5IHdvcmRlZC4gSSBw
aWNrZWQgaXQgdXAgb24gdGhlCj4gYmFzaXMgdGhhdCB5b3UncmUgZ29pbmcgdG8gc2VuZCB0aGUg
b3RoZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIHRvIEFybmQKPiBmb3IgNi4xNy4KCkhpIENvbm9y
LAoKQWNjb3JkaW5nIHRvIHRoZSBTb0MgbWFpbnRhaW5lciBkb2N1bWVudGF0aW9uIFsxXSwgSSBz
aG91bGQgc2VuZCBhCnBhdGNoc2V0IChub3QgYSBQUikgdG8gc29jQGtlcm5lbC5vcmcuIFNpbmNl
IEknbSBub3QgYSBzdWJtYWludGFpbmVyIHlldC4KSSB0aGluayBJIHNob3VsZCBub3Qgc2VudCBh
IFBSIHRvIHRoZSBtYWluIFNvQyBtYWludGFpbmVyLiBJcyB0aGF0IHJpZ2h0PwoKRnVydGhlciwg
SSBoYXZlIHR3byBxdWVzdGlvbnMgYWJvdXQgc2VuZGluZyBhIHBhdGNoc2V0OiAgIAoxLiBTaG91
bGQgSSBzZW5kIHY1IG9yIHN0YXJ0IGEgbmV3IHBhdGNoc2V0PwoyLiBTaG91bGQgSSBjb250aW51
ZSBleGNsdWRpbmcgdGhlIGRlZmNvbmZpZyBwYXRjaCwgYXMgd2UgZGlzY3Vzc2VkCiAgIHByZXZp
b3VzbHk/IEkgdGhpbmsgaXQgc2hvdWxkIGJlIGluY2x1ZGVkIG5vdy4KClsxXSBodHRwczovL2Rv
Y3Mua2VybmVsLm9yZy9wcm9jZXNzL21haW50YWluZXItc29jLmh0bWwjc3VibWl0dGluZy1wYXRj
aGVzLXRvLXRoZS1tYWluLXNvYy1tYWludGFpbmVycwoKVGhhbmtzLApCZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
