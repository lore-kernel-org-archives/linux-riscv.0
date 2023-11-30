Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4521EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5od0omGQBDGfo5MbcWtWocXmubWUjXuLxMll8X6FvI=; b=lFadVgddz+9wU7
	kGX0YH0nhugFQxC29hI6tCJiDTiFGhJvg+DzX73qIMRGu+hyqDY7Y6b0L8piy4y35opKkKzedDajI
	+h3ns9X15jzNXFhJ/WD+t2z+vj/G0j0U4JG6pQhHaTfjI3X9u4EL0JPTsQ1Ub7DTyGLuqv4ng661b
	STBr82G7fpaRQmrAxk+o6IT0HkcptcCdOjsqKDikuqs2weW7fdgV9ctk43nhiouapw9DbFjbcy27d
	zpU70tY11cVYMczefaiFMYmTOmFX3/+JNU1hwdr9NGsEVzsRMwIycvO9eOd1oVJrYu+O3tABWZYbk
	BLM6lorJP+Ry9m51U5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dG5-00AJdU-20;
	Thu, 30 Nov 2023 09:22:57 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dG1-00AJcq-21;
	Thu, 30 Nov 2023 09:22:55 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AU9L7OD077461;
	Thu, 30 Nov 2023 17:21:07 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 30 Nov 2023 17:21:04 +0800
Date: Thu, 30 Nov 2023 17:21:01 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <ZWhT_VSpl2aksVK7@APC323>
References: <ZWb6-LEkyh5RRpcP@APC323>
 <IA1PR20MB49537364BDF1ADE185CA8FE4BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49537364BDF1ADE185CA8FE4BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AU9L7OD077461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_012254_107596_7719BB57 
X-CRM114-Status: GOOD (  19.54  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSW5vY2hpLAoKT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMDQ6Mjk6MjJQTSArMDgwMCwgSW5v
Y2hpIEFtYW90byB3cm90ZToKPiA+Cj4gPkhpIEd1byBSZW4sCj4gPgo+ID5PbiBUaHUsIE5vdiAy
MywgMjAyMyBhdCAwNToxNDozMEFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4+IE9uIFdlZCwg
Tm92IDIyLCAyMDIzIGF0IDg6MTfigK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPiA+PiA8cGV0ZXJs
aW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IERvY3VtZW50IHRoZSBJU0Egc3Ry
aW5nIGZvciBULUhlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBleHRlbnNpb24KPiA+Pj4gd2hpY2gg
cHJvdmlkZXMgY291bnRlciBvdmVyZmxvdyBpbnRlcnJ1cHQgbWVjaGFuaXNtLgo+ID4+Pgo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5j
b20+Cj4gPj4+IC0tLQo+ID4+PiBDaGFuZ2VzIHYyIC0+IHYzOgo+ID4+PiAgIC0gTmV3IHBhdGNo
Cj4gPj4+IENoYW5nZXMgdjMgLT4gdjQ6Cj4gPj4+ICAgLSBObyBjaGFuZ2UKPiA+Pj4gLS0tCj4g
Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIHwgNiArKysrKysKPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+
Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPj4+IGluZGV4IGM5MWFiMGU0NjY0OC4uNjk0ZWZhZWE4
ZmNlIDEwMDY0NAo+ID4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+Pj4gQEAgLTI1OCw1ICsyNTgsMTEg
QEAgcHJvcGVydGllczoKPiA+Pj4gICAgICAgICAgICAgIGluIGNvbW1pdCAyZTUyMzYgKCJadHNv
IGlzIG5vdyByYXRpZmllZC4iKSBvZiB0aGUKPiA+Pj4gICAgICAgICAgICAgIHJpc2N2LWlzYS1t
YW51YWwuCj4gPj4+Cj4gPj4+ICsgICAgICAgIC0gY29uc3Q6IHh0aGVhZHBtdQo+ID4+PiArICAg
ICAgICAgIGRlc2NyaXB0aW9uOgo+ID4+PiArICAgICAgICAgICAgVGhlIFQtSGVhZCBwZXJmb3Jt
YW5jZSBtb25pdG9yIGV4dGVuc2lvbiBmb3IgY291bnRlciBvdmVyZmxvdy4gRm9yIG1vcmUKPiA+
Pj4gKyAgICAgICAgICAgIGRldGFpbHMsIHNlZSB0aGUgY2hhcHRlciAxMiBpbiB0aGUgWHVhbnRp
ZSBDOTA2IHVzZXIgbWFudWFsLgo+ID4+PiArICAgICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29t
L1QtaGVhZC1TZW1pL29wZW5jOTA2L3RyZWUvbWFpbi9kb2MKPiA+Pj4gKwo+ID4+PiAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IHRydWUKPiA+Pj4gIC4uLgo+ID4+PiAtLQo+ID4+PiAyLjM0LjEKPiA+
Pj4KPiA+PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID5U
aGFua3MgZm9yIHRoZSByZXZpZXcuCj4gPldvdWxkIHlvdSBzaGFyZSBkb2N1bWVudCBhYm91dCBU
LUhlYWQgUE1VPwo+ID4KPiAKPiBIaSwgUGV0ZXIgTGluOgo+IAo+IFlvdSBjYW4gdXNlIHRoZSBm
b2xsb3dpbmcgdHdvIGRvY3VtZW50IHRvIGdldCBhbGwgZXZlbnRzOgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkwNi90cmVlL21haW4vZG9jCj4gaHR0cHM6Ly9naXRodWIu
Y29tL1QtaGVhZC1TZW1pL29wZW5jOTEwL3RyZWUvbWFpbi9kb2MKPiAKPiBUaGVyZSBhcmUgYWxz
byBzb21lIFJUTCBjb2RlIGNhbiBkZXNjcmliZSB0aGVzZSBldmVudHM6Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTEwL2Jsb2IvZTBjNGFkOGVjN2Y4YzcwZjY0OWQ4MjZl
YmQ2Yzk0OTA4NjQ1MzI3Mi9DOTEwX1JUTF9GQUNUT1JZL2dlbl9ydGwvcG11L3J0bC9jdF9ocGNw
X3RvcC52I0wxMTIzCj4gaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTA2L2Js
b2IvYWY1NjE0ZDcyZGU3ZTVhNGI4NjA5YzQyN2QyZTIwYWYxZGViMjFjNC9DOTA2X1JUTF9GQUNU
T1JZL2dlbl9ydGwvcG11L3J0bC9hcV9ocGNwX3RvcC52I0w1NDMKPiAKPiBUaGUgcGVyZiBldmVu
dHMganNvbiBjYW4gYWxzbyBiZSB1c2VkIGFzIGRvY3VtZW50LCB0aGlzIGlzIGFscmVhZHkKPiBh
cHBsaWVkICh3aXRoIG1vcmUgZGV0YWlsZWQgZXhwbGFuYXRpb24pOgo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9JQTFQUjIwTUI0OTUzMjVGQ0Y2MDNCQUE4NDFFMjkyODFCQkJBQUBJQTFQ
UjIwTUI0OTUzLm5hbXByZDIwLnByb2Qub3V0bG9vay5jb20vCgpUaGFua3MgZm9yIHJlYWNoaW5n
IG91dCEKVGhlIHVwZGF0ZWQgZGVzY3JpcHRpb24gd2lsbCBiZToKCi0gY29uc3Q6IHh0aGVhZHBt
dQogIGRlc2NyaXB0aW9uOgogICAgVGhlIFQtSGVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGV4dGVu
c2lvbiBmb3IgY291bnRlciBvdmVyZmxvdywgYXMgcmF0aWZpZWQKICAgIGluIGNvbW1pdCBiZDky
MDYgKCJJbml0aWFsIGNvbW1pdCIpIG9mIFh1YW50aWUgQzkwNiB1c2VyIG1hbnVhbC4KICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkwNi90cmVlL21haW4vZG9jCgpJcyBp
dCBPSyB3aXRoIHlvdT8KCkJlc3QgcmVnYXJkcywKUGV0ZXIgTGluCgo+IEJlc3QgcmVnYXJkcywK
PiBJbm9jaGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
