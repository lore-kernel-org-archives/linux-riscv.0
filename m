Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E1EE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqF4xEqMDYgYG3nsRRwDjJiq8WNwXmnrm+D5zjRYy2k=; b=W9SHlGFiBid+NI
	Za/lgI/07qDRrA0XdpLTt7RTJqbhcy3mrloqY84c2K8Z7U3B6ABrhQr1qtmCup9dj/KQPTDIKqi//
	QAzxqzvraR1lpAVWsIG6dAJNkD3L9JdySfwRL6jwOoK68DgdDAYBhl9VM92F31cm2UzMdGt/HYbwg
	4Or7lVCwROq0EDbEKbYxQ1R/MrzvJ239LwQuyYWJ602GfP5fUfSd8LI5wjBvIyedtBI9Uab0Bs82y
	q8Q24/On+LW0T+o6MSUvvnS0R+zCi4DlNQ9eAPtaUNpp4qnDBebcKNbEMmlbITRwwlu8AKhXEVYO3
	+H8MaUbvobioy3h2SGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbvR-00HV97-0g;
	Mon, 11 Sep 2023 08:05:41 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbvN-00HV8b-2k;
	Mon, 11 Sep 2023 08:05:40 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38B856Gv066313;
	Mon, 11 Sep 2023 16:05:06 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 11 Sep 2023 16:05:03 +0800
Date: Mon, 11 Sep 2023 16:04:59 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
        <atishp@atishpatra.org>, <anup@brainfault.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <ajones@ventanamicro.com>,
        <heiko@sntech.de>, <samuel@sholland.org>, <geert+renesas@glider.be>,
        <n.shubin@yadro.com>, <dminus@andestech.com>, <ycliang@andestech.com>,
        <tim609@andestech.com>, <locus84@andestech.com>, <dylan@andestech.com>
Subject: Re: [RFC PATCH 2/4] irqchip/riscv-intc: Support large non-standard
 hwirq number
Message-ID: <ZP7KKyjj6QObXAyb@APC323>
References: <20230907021635.1002738-1-peterlin@andestech.com>
 <20230907021635.1002738-3-peterlin@andestech.com>
 <ff6302ae-a114-4ef0-be87-a5fa34c3aab5@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff6302ae-a114-4ef0-be87-a5fa34c3aab5@rivosinc.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38B856Gv066313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_010538_326761_A4560B55 
X-CRM114-Status: GOOD (  25.50  )
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

T24gVGh1LCBTZXAgMDcsIDIwMjMgYXQgMTI6MjI6NTVQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDA3LzA5LzIwMjMgMDQ6MTYsIFl1IENoaWVuIFBldGVyIExpbiB3
cm90ZToKPiA+IEN1cnJlbnRseSwgdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBSSVNDLVYgSU5U
QyBkcml2ZXIgdXNlcyB0aGUKPiA+IGludGVycnVwdCBjYXVzZSBhcyBod2lycSBhbmQgaGFzIGEg
bGltaXRhdGlvbiBvZiBzdXBwb3J0aW5nIGEKPiA+IG1heGltdW0gb2YgNjQgaHdpcnFzLiBIb3dl
dmVyLCBhY2NvcmRpbmcgdG8gdGhlIHByaXZpbGVnZWQgc3BlYywKPiA+IGludGVycnVwdCBjYXVz
ZSA+PSAxNiBhcmUgZGVmaW5lZCBmb3IgcGxhdGZvcm0gdXNlLgo+ID4gCj4gPiBUaGlzIGxpbWl0
YXRpb24gcHJldmVudHMgdXMgZnJvbSBmdWxseSB1dGlsaXppbmcgdGhlIGF2YWlsYWJsZQo+ID4g
bG9jYWwgaW50ZXJydXB0IHNvdXJjZXMuIEFkZGl0aW9uYWxseSwgdGhlIGh3aXJxcyB1c2VkIG9u
IFJJU0MtVgo+ID4gYXJlIHNwYXJzZSwgd2l0aCBvbmx5IGludGVycnVwdCBudW1iZXJzIDEsIDUg
YW5kIDkgKHBsdXMgU3Njb2ZwbWYKPiA+IG9yIFQtSGVhZCdzIFBNVSBpcnEpIGJlaW5nIGN1cnJl
bnRseSB1c2VkIGZvciBzdXBlcnZpc29yIG1vZGUuCj4gPiAKPiA+IFRoZSBwYXRjaCBzd2l0Y2hl
cyB0byB1c2luZyBpcnFfZG9tYWluX2NyZWF0ZV90cmVlKCkgd2hpY2gKPiA+IGNyZWF0ZXMgdGhl
IHJhZGl4IHRyZWUgbWFwLCBhbGxvd2luZyB1cyB0byBoYW5kbGUgYSBsYXJnZXIKPiA+IG51bWJl
ciBvZiBod2lycXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8
cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDaGFybGVzIENpLUp5dW4g
V3UgPGRtaW51c0BhbmRlc3RlY2guY29tPgo+ID4gUmV2aWV3ZWQtYnk6IExlbyBZdS1DaGkgTGlh
bmcgPHljbGlhbmdAYW5kZXN0ZWNoLmNvbT4KPiA+IAo+ID4gLS0tCj4gPiBUaGVyZSBhcmUgMyBo
d2lycXMgb2YgbG9jYWwgaW50ZXJydXB0IHNvdXJjZSBleGNlZWQgNjQgZGVmaW5lZCBpbgo+ID4g
QVg0NU1QIGRhdGFzaGVldCBbMV0gVGFibGUgNTY6IEFYNDVNUC0xQyBzY2F1c2UgVmFsdWUgQWZ0
ZXIgVHJhcDoKPiA+IC0gMjU2KzE2IFNsYXZlIHBvcnQgRUNDIGVycm9yIGludGVycnVwdCAoUy1t
b2RlKQo+ID4gLSAyNTYrMTcgQnVzIHdyaXRlIHRyYW5zYWN0aW9uIGVycm9yIGludGVycnVwdCAo
Uy1tb2RlKQo+ID4gLSAyNTYrMTggUGVyZm9ybWFuY2UgbW9uaXRvciBvdmVyZmxvdyBpbnRlcnJ1
cHQoUy1tb2RlKQo+ID4gCj4gPiBbMV0gaHR0cDovL3d3dy5hbmRlc3RlY2guY29tL3dwLWNvbnRl
bnQvdXBsb2Fkcy9BWDQ1TVAtMUMtUmV2Li01LjAuMC1EYXRhc2hlZXQucGRmCj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyB8IDEwICsrKystLS0tLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4gaW5kZXggNGFkZWVlMWJjMzkxLi43NmUxMjI5YzQ1
ZGUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4g
KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiA+IEBAIC0yNCw4ICsyNCw4
IEBAIHN0YXRpYyBhc21saW5rYWdlIHZvaWQgcmlzY3ZfaW50Y19pcnEoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCj4gPiAgewo+ID4gIAl1bnNpZ25lZCBsb25nIGNhdXNlID0gcmVncy0+Y2F1c2UgJiB+
Q0FVU0VfSVJRX0ZMQUc7Cj4gPiAgCj4gPiAtCWlmICh1bmxpa2VseShjYXVzZSA+PSBCSVRTX1BF
Ul9MT05HKSkKPiA+IC0JCXBhbmljKCJ1bmV4cGVjdGVkIGludGVycnVwdCBjYXVzZSIpOwo+ID4g
KwlpZiAoIWlycV9maW5kX21hcHBpbmcoaW50Y19kb21haW4sIGNhdXNlKSkKPiA+ICsJCXBhbmlj
KCJ1bmV4cGVjdGVkIGludGVycnVwdCBjYXVzZTogJWxkIiwgY2F1c2UpOwo+IAo+IEhpIFl1LAo+
IAo+IEl0IHNlZW1zIGxpa2UgZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSgpIHJldHVybnMgLUVJ
TlZBTCBpZiBwcm92aWRlZAo+IHdpdGggTlVMTCAod2hpY2ggd2lsbCBoYXBwZW4gaWYgdGhlIGlu
dGVycnVwdCBkb2VzIG5vdCBoYXZlIGEgbWFwcGluZwo+IGR1ZSB0byBfX2lycV9yZXNvbHZlX21h
cHBpbmcgcmV0dXJuaW5nIE5VTEwpIHNvIG1heWJlIGl0IGlzIHBvc3NpYmxlIHRvCj4gcmVtb3Zl
IHRoaXMgY2hlY2sgKHNpbmNlIF9faXJxX3Jlc29sdmVfbWFwcGluZygpIGlzIGFsc28gY2FsbGVk
IGJ5Cj4gZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSgpKSBhbmQgcGFuaWMgaWYgZ2VuZXJpY19o
YW5kbGVfZG9tYWluX2lycSgpCj4gcmV0dXJucyAtRUlOVkFMID8gVGhhdCB3b3VsZCBhdm9pZCBj
YWxsaW5nIF9faXJxX3Jlc29sdmVfbWFwcGluZygpIHR3aWNlCj4gZm9yIHJlYWxseSByYXJlIGNh
c2VzLgo+IAo+IENsw6ltZW50CgpIaSBDbMOpbWVudCwKClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhp
cywgd2lsbCBmaXggaXQgaW4gdGhlIHBhdGNoIHYyLgoKQmVzdCByZWdhcmRzLApQZXRlciBMaW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
