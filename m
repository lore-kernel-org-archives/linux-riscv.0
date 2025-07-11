Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA29CC83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DKUO6GokG2BrVhmPqTaXWSCpemCSYbXdhymjMg2Dc4=; b=gxlAo4unftlDU8
	8iIDxXfihNGfE6TyXKE9NJfhl+vLQwZTR42WefJifSQEQj4I1oyrQnp6YrUVeXvxyRlprs+wp6B8f
	6Tmh4897I2T3qWcGlqCpbCXUYTE24ZBCWqieVontIQzQiG9UJnKi71hg/Y6R9Y22LlLYnfYbLyuDn
	QT9tg+WtyBpq3QPoEn6a5wHYdTsqdWrLi9tIfX/aRZC09sr5jst0gZ/3bHiLDead2xj2I3WK06ilT
	rWnuFO+QDLqgsANXbDgFmN8VAZReh5X29l0+HOZK4BdvAiOdIF+lFKgRQkXLTNIMb+Lk04uXP4lhD
	i0UBudzjBYLv/C0CHKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaD6v-0000000Em0P-0Igk;
	Fri, 11 Jul 2025 12:44:17 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBNE-0000000EWjT-3A2E
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 10:53:02 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 56BApeFe051347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 11 Jul 2025 18:51:40 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 18:51:40 +0800
Date: Fri, 11 Jul 2025 18:51:40 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>
Subject: Re: [PATCH 1/8] riscv: add Andes SoC family Kconfig support
Message-ID: <aHDsvMgSm87/wHpg@atctrx.andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
 <20250704081451.2011407-2-ben717@andestech.com>
 <CA+V-a8unFMmA2NdwuofTL1fx8vVHtD8Y9QbW2ec8B656DK6AAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8unFMmA2NdwuofTL1fx8vVHtD8Y9QbW2ec8B656DK6AAw@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 56BApeFe051347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_035301_300138_142B8312 
X-CRM114-Status: GOOD (  19.27  )
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

T24gTW9uLCBKdWwgMDcsIDIwMjUgYXQgMTA6NTA6MzhBTSArMDEwMCwgTGFkLCBQcmFiaGFrYXIg
d3JvdGU6Cj4gW0VYVEVSTkFMIE1BSUxdCj4gCj4gSGkgQmVuLAo+IAo+IFRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoLgo+IAo+IE9uIEZyaSwgSnVsIDQsIDIwMjUgYXQgMTA6MDLigK9BTSBCZW4gWm9u
Zy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIGZpcnN0
IFNvQyBpbiB0aGUgQW5kZXMgc2VyaWVzIGlzIFFpTGFpLiBJdCBpbmNsdWRlcyBhIGhpZ2gtcGVy
Zm9ybWFuY2UKPiA+IHF1YWQtY29yZSBSSVNDLVYgQVg0NU1QIGNsdXN0ZXIgYW5kIG9uZSBOWDI3
ViB2ZWN0b3IgcHJvY2Vzc29yLgo+ID4KPiA+IEZvciBmdXJ0aGVyIGluZm9ybWF0aW9uLCByZWZl
ciB0byBbMV0uCj4gPgo+ID4gWzFdIGh0dHBzOi8vd3d3LmFuZGVzdGVjaC5jb20vZW4vcHJvZHVj
dHMtc29sdXRpb25zL2FuZGVzaGFwZS1wbGF0Zm9ybXMvcWlsYWktY2hpcC8KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KPiA+IC0t
LQo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgfCAyICstCj4gPiAgYXJjaC9yaXNjdi9L
Y29uZmlnLnNvY3MgICB8IDkgKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
S2NvbmZpZy5lcnJhdGEgYi9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhCj4gPiBpbmRleCBlMzE4
MTE5ZDU3MGQuLmJlNzY4ODM3MDRhNiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
Zy5lcnJhdGEKPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+IEBAIC0xMiw3
ICsxMiw3IEBAIGNvbmZpZyBFUlJBVEFfQU5ERVMKPiA+Cj4gPiAgY29uZmlnIEVSUkFUQV9BTkRF
U19DTU8KPiA+ICAgICAgICAgYm9vbCAiQXBwbHkgQW5kZXMgY2FjaGUgbWFuYWdlbWVudCBlcnJh
dGEiCj4gPiAtICAgICAgIGRlcGVuZHMgb24gRVJSQVRBX0FOREVTICYmIEFSQ0hfUjlBMDdHMDQz
Cj4gPiArICAgICAgIGRlcGVuZHMgb24gRVJSQVRBX0FOREVTICYmIChBUkNIX1I5QTA3RzA0MyB8
fCBBUkNIX0FOREVTKQo+ID4gICAgICAgICBzZWxlY3QgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4g
PiAgICAgICAgIGRlZmF1bHQgeQo+ID4gICAgICAgICBoZWxwCj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnLnNvY3MgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+ID4gaW5kZXgg
YTljM2QyZjZkZWJjLi4xYmY1NjM3ZjI2MDEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tj
b25maWcuc29jcwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+IEBAIC0xLDUg
KzEsMTQgQEAKPiA+ICBtZW51ICJTb0Mgc2VsZWN0aW9uIgo+ID4KPiA+ICtjb25maWcgQVJDSF9B
TkRFUwo+ID4gKyAgICAgICBib29sICJBbmRlcyBTb0NzIgo+ID4gKyAgICAgICBkZXBlbmRzIG9u
IE1NVSAmJiAhWElQX0tFUk5FTAo+ID4gKyAgICAgICBzZWxlY3QgRVJSQVRBX0FOREVTCj4gPiAr
ICAgICAgIHNlbGVjdCBFUlJBVEFfQU5ERVNfQ01PCj4gPiArICAgICAgIHNlbGVjdCBBWDQ1TVBf
TDJfQ0FDSEUKPiBEbyBhbGwgdGhlIEFuZGVzIFNvQ3MgcmVxdWlyZSBhbGwgdGhlIGFib3ZlIHRo
cmVlIGNvbmZpZ3M/IChJZiBub3QgSQo+IHdvdWxkIGFkZCBpdCBiYXNlZCBvbiB0aGUgU29DIHdo
aWNoIHJlcXVpcmVzIGl0LikKPiAKCkhpIFByYWJoYWthciwKClRoYW5rcyBmb3IgeW91ciBzdWdn
ZXN0aW9uLiBRaUxhaSBTb0MgZG9lcyBub3QgbmVlZCBiZWxvdyB0d28gY29uZmlncwpzaW5jZSBp
dCBoYXMgSU9DUC4gSSB3aWxsIHJlbW92ZSBiZWxvdyB0d28gY29uZmlncyBpbiB0aGUgbmV4dCB2
ZXJzaW9uLgoKVGhhbmtzLApCZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
