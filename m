Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D0BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDuls1rwfE76OZLoJZycsXS8jkT0CsZiZccAz6Uy61s=; b=iKb+qd1FXD9hEs
	f7xoVHrx4ifqbdrHbmjyTI+JEh4M40AT78lxFWnGlQIhlKJNOwzm6nB6VcTafgxFk3eXoJScwT8Qb
	8Zs1HxisYPrUPSbGihkj5rHOj30nTsHyiZeKSdvwtt0RNAdardQdLjNX8stFVqNZrZkF6FSM9tFso
	xbScxheYQ6MNVSO0eiGb2RBItcgI59tbxWYv/lteiN7J/CwwJ9gonFd8gSs2u1pvSSVOvIO8eZluE
	ZQKWvYsqynQrb/zyttO0MeB/8UxqVKlgwvtv/Xa/SzhIv7ZdpIs54wgcYFvQKdOCIx1U00nqbg72s
	zR3Q7Iavxj/bq9kZGP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GGY-007X6v-24;
	Wed, 29 Nov 2023 08:49:54 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GGV-007X52-18;
	Wed, 29 Nov 2023 08:49:53 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AT8mw3e055241;
	Wed, 29 Nov 2023 16:48:58 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 29 Nov 2023 16:48:56 +0800
Date: Wed, 29 Nov 2023 16:48:56 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <ZWb6-LEkyh5RRpcP@APC323>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-10-peterlin@andestech.com>
 <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AT8mw3e055241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_004951_833908_7EFC19EE 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgR3VvIFJlbiwKCk9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDA1OjE0OjMwQU0gKzA4MDAsIEd1
byBSZW4gd3JvdGU6Cj4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgODoxN+KAr1BNIFl1IENoaWVu
IFBldGVyIExpbgo+IDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPiA+Cj4gPiBEb2N1
bWVudCB0aGUgSVNBIHN0cmluZyBmb3IgVC1IZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgZXh0ZW5z
aW9uCj4gPiB3aGljaCBwcm92aWRlcyBjb3VudGVyIG92ZXJmbG93IGludGVycnVwdCBtZWNoYW5p
c20uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBh
bmRlc3RlY2guY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYyIC0+IHYzOgo+ID4gICAtIE5ldyBw
YXRjaAo+ID4gQ2hhbmdlcyB2MyAtPiB2NDoKPiA+ICAgLSBObyBjaGFuZ2UKPiA+IC0tLQo+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwg
fCA2ICsrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwKPiA+IGluZGV4IGM5MWFiMGU0NjY0OC4uNjk0ZWZhZWE4ZmNlIDEwMDY0NAo+
ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAo+ID4gQEAgLTI1OCw1ICsyNTgsMTEgQEAgcHJvcGVydGllczoKPiA+
ICAgICAgICAgICAgICBpbiBjb21taXQgMmU1MjM2ICgiWnRzbyBpcyBub3cgcmF0aWZpZWQuIikg
b2YgdGhlCj4gPiAgICAgICAgICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KPiA+Cj4gPiArICAgICAg
ICAtIGNvbnN0OiB4dGhlYWRwbXUKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4gPiArICAg
ICAgICAgICAgVGhlIFQtSGVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGV4dGVuc2lvbiBmb3IgY291
bnRlciBvdmVyZmxvdy4gRm9yIG1vcmUKPiA+ICsgICAgICAgICAgICBkZXRhaWxzLCBzZWUgdGhl
IGNoYXB0ZXIgMTIgaW4gdGhlIFh1YW50aWUgQzkwNiB1c2VyIG1hbnVhbC4KPiA+ICsgICAgICAg
ICAgICBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvb3BlbmM5MDYvdHJlZS9tYWluL2Rv
Ywo+ID4gKwo+ID4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gPiAgLi4uCj4gPiAtLQo+
ID4gMi4zNC4xCj4gPgo+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
ClRoYW5rcyBmb3IgdGhlIHJldmlldy4KV291bGQgeW91IHNoYXJlIGRvY3VtZW50IGFib3V0IFQt
SGVhZCBQTVU/CgpCZXN0IHJlZ2FyZHMsClBldGVyIExpbgoKPiAtLSAKPiBCZXN0IFJlZ2FyZHMK
PiAgR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
