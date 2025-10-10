Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C90CCD187
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 22:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8L+yr8XDSdwXDO0VxOh9KzZrFWfywom4ytjf4clvxAQ=; b=oU7CJrGZtoOZlr
	VXl4qRI/H36R7QvINdxLvgc2lP9FRs9Bu+lnz65Aaegdd0Pod9UPx5Num/TxWttg0KjOf8JTL9oG1
	XjwDGnK9JvpkRkdLgVCDxkhANlQhx2JbNz4W0c4TOgm/vRe1Si47mjLA+RzwvTf7PkWHk1EEY1NpV
	foNkoNxVBdES1+yfTycJyg1VB5KPqtL2m+H+NJFReBOfi7R8ea9ZaVwIJ7g9V6Z4FuO/6L+wFbyw5
	hA43gWEjStHvz7WNXmRGwSrlhBVunCmusBOz7NNVfecviNMTiOmi33ujdjY2Ptp2LK2k8z84USG0m
	A3bUnz/fM+k2sEUifcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7LDH-00000009Rwf-1kA7;
	Fri, 10 Oct 2025 22:03:47 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7LDD-00000009Rup-0i3A
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 22:03:45 +0000
Received: from [192.168.0.106] (unknown [114.241.81.247])
	by APP-05 (Coremail) with SMTP id zQCowAAXfRa2gulo4BSFDQ--.31232S2;
	Sat, 11 Oct 2025 06:03:35 +0800 (CST)
Message-ID: <0d50502a-0709-49ea-b412-927c17f15b60@iscas.ac.cn>
Date: Sat, 11 Oct 2025 06:03:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: interrupt-controller: add UltraRISC
 DP1000 PLIC
To: Lucas Zampieri <lzampier@redhat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Charles Mirabile <cmirabil@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251009082013.1331361-1-lzampier@redhat.com>
 <20251009082013.1331361-3-lzampier@redhat.com>
 <9ae53c6d-613b-4a25-b672-88ffabfef4fa@kernel.org>
 <CAOOg__BTJw53uTK4h_o4GK6x2D0XutTSQMpb-BDXh22Ac0-q-A@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAOOg__BTJw53uTK4h_o4GK6x2D0XutTSQMpb-BDXh22Ac0-q-A@mail.gmail.com>
X-CM-TRANSID: zQCowAAXfRa2gulo4BSFDQ--.31232S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4UAF43WFyxCrW8Jr4rGrg_yoW8ur4UpF
	ZruFyqyF4vvF13u3yIqa10kayI9FsxJF9rKrs0qw45CF1qgr1rXFW2ga15CFn2vrs2qrWj
	yF4I934fJa42vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxU2wIDUUUUU
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_150343_582935_5549B2A9 
X-CRM114-Status: GOOD (  12.01  )
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

Ck9uIDEwLzEwLzI1IDIxOjU3LCBMdWNhcyBaYW1waWVyaSB3cm90ZToKPiBPbiBUaHUsIE9jdCA5
LCAyMDI1IGF0IDk6MznigK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
IHdyb3RlOgo+PiBPbiAwOS8xMC8yMDI1IDE3OjIwLCBMdWNhcyBaYW1waWVyaSB3cm90ZToKPj4+
IEZyb206IENoYXJsZXMgTWlyYWJpbGUgPGNtaXJhYmlsQHJlZGhhdC5jb20+Cj4+Pgo+Pj4gQWRk
IGEgbmV3IGNvbXBhdGlibGUgc3RyaW5nIGZvciBVbHRyYVJJU0MgRFAxMDAwIFBMSUMuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxlcyBNaXJhYmlsZSA8Y21pcmFiaWxAcmVkaGF0LmNvbT4K
Pj4+IC0tLQo+Pj4gIC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxp
Yy0xLjAuMC55YW1sICAgICAgICB8IDIgKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxw
bGljLTEuMC4wLnlhbWwKPj4+IGluZGV4IDViODI3YmMyNDMwMS4uYTQxOWRlNTBmNWE4IDEwMDY0
NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAu
MC55YW1sCj4+PiBAQCAtNzQsNiArNzQsOCBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgICAgICAgICAg
ICAgLSBzb3BoZ28sc2cyMDQ0LXBsaWMKPj4+ICAgICAgICAgICAgICAgIC0gdGhlYWQsdGgxNTIw
LXBsaWMKPj4+ICAgICAgICAgICAgLSBjb25zdDogdGhlYWQsYzkwMC1wbGljCj4+PiArICAgICAg
LSBpdGVtczoKPj4KPj4gTWlzc2luZyBTb0Mgc3BlY2lmaWMgZnJvbnQgY29tcGF0aWJsZSwgbWUg
dGhpbmtzLgo+IFJpZ2h0LCBpZiBJJ20gdW5kZXJzdGFuZGluZyB0aGlzIGNvcnJlY3RseSwgSSB3
b3VsZCBuZWVkIHRvIGFkZCB0aGUKPiBzaWZpdmUscGxpYy0xLjAuMCBmYWxsYmFjayBjb21wYXRp
YmxlIHRvIGluZGljYXRlIHJlZ2lzdGVyIGxheW91dAo+IGNvbXBhdGliaWxpdHkuIEhvd2V2ZXIs
IHRoZSBEUDEwMDAgUExJQyBoYXMgYSBjbGFpbSByZWdpc3RlciBoYXJkd2FyZQo+IGJ1ZyB0aGF0
IGJyZWFrcyBpbnRlcnJ1cHQgaGFuZGxpbmcgd2l0aG91dCB0aGUgZHJpdmVyIHF1aXJrLiBTaG91
bGQgd2UKPiBzdGlsbCBpbmNsdWRlIHRoZSBmYWxsYmFjayBldmVuIHRob3VnaCB0aGUgZ2VuZXJp
YyBkcml2ZXIgZG9lc24ndAo+IHdvcms/CgpTZWUgd2hhdCB0aGUgdGhlYWQsYzkwMC1wbGljIHRo
aW5nIGlzIGRvaW5nLiBUaGUgUExJQyBjb21wYXRpYmxlIHNob3VsZApiZSBTb0MtYXNzb2NpYXRl
ZCBtb2RlbCwgYW5kIHRoZW4gQ1BVLWNvcmUtYXNzb2NpYXRlZCBtb2RlbC4KCihJIGd1ZXNzICp0
aGVvcmV0aWNhbGx5KiB0aGUgUExJQyBjb3VsZCBiZSBleHRlcm5hbCB0byB0aGUgQ1BVIGJ1dCBp
dApkb2Vzbid0IHJlYWxseSBtYWtlIHNlbnNlIHRvIGRlc2lnbiBhIGNvcmUgdGhpcyB3YXkuKQoK
U3VwcG9zZWRseSBbMV0gdGhlIGNvcmVzIGFyZSBjYWxsZWQgVVItQ1AxMDAsIHNvIGl0IHNob3Vs
ZCBiZQoKwqAgwqAgY29tcGF0aWJsZSA9ICJ1bHRyYXJpc2MsZHAxMDAwLXBsaWMiLCAidWx0cmFy
aXNjLGNwMTAwLXBsaWMiOwoKQW5kIHRoZSBkcml2ZXIgc2hvdWxkIG1hdGNoIG9uIHVsdHJhcmlz
YyxjcDEwMC1wbGljIGluc3RlYWQuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgpbMV06IGh0
dHBzOi8vdWx0cmFyaXNjLmdpdGh1Yi5pby91bHRyYXJpc2MtZGV2YmxvZy8yMDI1LzA2LzE4L2Rw
MTAwMC1zcGVjLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
