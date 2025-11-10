Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE2CCFA1A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 01:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4koHWr8AvyYn7/9EsRJGb2oqDWZ31bNjvofK4GeWGo=; b=nMWZdkvVWIZedxrG/ofzgoKMV/
	Dtzbl+jLuyPUp0f/F5Q7k9o5ipdnknZepFCM3rbaKpN/Q5rYIfj3b21zI8XrZ+rpK3mXkCd3h6n19
	FW5v+NdisH+7CDs5KHW61B7cP7Wp/4jKD2vi6/kh8solAYYXDf03sBFW5zchadOSFoFfKW9/DVqeS
	ZEPDAMT+x1uB6F7yNg/V86crOw5vzGt4q8JALcGLu+fWtW8e4j1m5pOmPVmtx0rfjfdqbsqXC8wIH
	3NwbTwkgP8sB4bYgY2uDFUX5g6ZFmjIDV7sbonQM9cnDM0fOj/cmnPX7wZq1JJr1+JluhcKREJthi
	TUH75k0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGYr-00000004ZvO-0l2p;
	Mon, 10 Nov 2025 01:19:13 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGYo-00000004Zuf-0R93;
	Mon, 10 Nov 2025 01:19:12 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx1tB+PRFpnzkhAA--.6453S3;
	Mon, 10 Nov 2025 09:18:55 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxocJ7PRFpRHMtAQ--.64632S3;
	Mon, 10 Nov 2025 09:18:52 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
 <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
 <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
Date: Mon, 10 Nov 2025 09:18:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: qMiowJCxocJ7PRFpRHMtAQ--.64632S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrW8Kry5Cw1xWr13CFWrtFc_yoW5JryxpF
	WxJF1jkF4DAr4xZ3Z7tw4j9Fy7tryDJr18Ww1rtry5Awn09w1rJr48JF1jkFyUJr1xGFyj
	yr47tFZ7XF4Dt3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1tC7UUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_171910_548245_D220CFE6 
X-CRM114-Status: GOOD (  18.67  )
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

T24gMjAyNS8xMC8yOCDkuIvljYg5OjQ3LCBBcmQgQmllc2hldXZlbCB3cm90ZToKPiBPbiBTdW4s
IDI2IE9jdCAyMDI1IGF0IDEyOjIwLCBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3Jn
PiB3cm90ZToKPj4KPj4gT24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgNDowN+KAr1BNIEFyZCBCaWVz
aGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIFRodSwgMjMgT2N0IDIw
MjUgYXQgMTA6MDEsIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pj4+Cj4+Pj4gT24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMjo1NeKAr1BNIFRpZXpodSBZYW5nIDx5
YW5ndGllemh1QGxvb25nc29uLmNuPiB3cm90ZToKPj4+Pj4KPj4+Pj4gSGkgSm9zaCBhbmQgQXJk
LAo+Pj4+Pgo+Pj4+PiBPbiAyMDI1LzEwLzIwIOS4i+WNiDI6NTUsIEh1YWNhaSBDaGVuIHdyb3Rl
Ogo+Pj4+Pj4gT24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOToyNOKAr0FNIFRpZXpodSBZYW5nIDx5
YW5ndGllemh1QGxvb25nc29uLmNuPiB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IEhpIEpvc2gsIEFy
ZCBhbmQgSHVhY2FpLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMjAyNS8xMC8xOCDkuIrljYgxOjA1LCBK
b3NoIFBvaW1ib2V1ZiB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IC4uLgo+Pj4+Pj4+Cj4+Pj4+Pj4+
IEJ1dCBJSVVDLCB0aGUgbGlic3R1YiBjb2RlIHJ1bnMgKnZlcnkqIGVhcmx5LCBhbmQgd291bGRu
J3Qgc2hvdyB1cCBpbiBhCj4+Pj4+Pj4+IHN0YWNrIHRyYWNlIGFueXdheSwgYmVjYXVzZSB0aGVy
ZSBhcmUgbm8gdHJhY2VzIG9mIGl0IG9uIHRoZSBzdGFjayBvbmNlCj4+Pj4+Pj4+IGl0IGJyYW5j
aGVzIHRvIGhlYWQuUyBjb2RlICh3aGljaCBkb2Vzbid0IHNhdmUgdGhlIGxpbmsgcmVnaXN0ZXIp
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhhbmtzIGZvciB5b3VyIGRpc2N1c3Npb25zLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gQXJlIHlvdSBPSyB3aXRoIHRoaXMgY3VycmVudCBwYXRjaD8KPj4+Pj4+IEZvciBtZSB0
aGUgY3VycmVudCBwYXRjaCBpcyBqdXN0IE9LLgo+Pj4+Pgo+Pj4+PiBXZSBoYXZlIGRpc2N1c3Nl
ZCB0aGlzIGEgZmV3IHRpbWVzIGJ1dCB0aGVyZSBpcyBhbG1vc3Qgbm8gY29uc2Vuc3VzCj4+Pj4+
IG9mIHdoYXQgc2hvdWxkIGhhcHBlbiBuZXh0IGFuZCBub3RoaW5nIGNoYW5nZXMuCj4+Pj4+Cj4+
Pj4+IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhIGNsZWFyIHJlcGx5PyBUaGVuIEkgY2FuIG1h
a2UgcHJvZ3Jlc3MgZm9yCj4+Pj4+IHRoZSBmb2xsb3dpbmcgc2VyaWVzOgo+Pj4+Pgo+Pj4+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sb29uZ2FyY2gvMjAyNTA5MTcxMTI3MTYuMjQ0MTUtMS15
YW5ndGllemh1QGxvb25nc29uLmNuLwo+Pj4+IEZvciBtZSwgdGhpcyBwYXRjaCBpcyBPSywgaWdu
b3JlIF9fZWZpc3R1Yl8gcHJlZml4IGluIG9ianRvb2wgaXMgYWxzbwo+Pj4+IE9LIFsxXS4gQnV0
IEkgY2Fubm90IGFjY2VwdCB0aGUgd2F5IHRoYXQgbW9kaWZ5aW5nIHRoZSBlZmlzdHViIHBhcnQK
Pj4+PiBvbmx5IGZvciBMb29uZ0FyY2guCj4+Pj4KPj4+PiBDbGVhciBlbm91Z2g/Cj4+Pj4KPj4+
Cj4+PiBMb29uZ0FyY2ggaXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHdoaWNoIGhhcyB0aGUgcHJv
YmxlbSwgc28gSSBkb24ndAo+Pj4gc2VlIGEgcmVhc29uIHRvIG1vZGlmeSBvdGhlciBhcmNoaXRl
Y3R1cmVzLgo+PiAgRnJvbSB5b3VyIHJlcGx5IEkgdGhpbmsgdGhlIGVmaXN0dWIgY29kZSBpcyBj
b21wbGV0ZWx5IHJpZ2h0LCBidXQKPj4gb2JqdG9vbCBjYW5ub3QgaGFuZGxlIHRoZSAibm9yZXR1
cm4iIGZ1bmN0aW9uIHBvaW50ZXIuIEFuZCB0aGlzIHBhdGNoCj4+IGlzIGEgd29ya2Fyb3VuZCBy
YXRoZXIgdGhhbiBhIHByb3BlciBmaXggKHNvIHlvdSBkb24ndCB3YW50IHRvIHRvdWNoCj4+IG90
aGVyIGFyY2hpdGVjdHVyZXMpLCByaWdodD8KPj4KPiAKPiBUaGF0IGlzIG15IHJlYXNvbmluZywg
eWVzLiBCdXQgSm9zaCBpcyByaWdodCB0aGF0IGl0IHNob3VsZG4ndCBtYWtlIGEKPiBkaWZmZXJl
bmNlIGluIHByYWN0aWNlLCBJIGFtIGp1c3QgcmVsdWN0YW50IHRvIG1ha2UgY2hhbmdlcyB0byB0
aGUKPiBjb2RlIHJ1bm5pbmcgb24gdGhlIHRhcmdldCB0byBhY2NvbW1vZGF0ZSBhIGZsYXdlZCBi
dWlsZCB0aW1lIHRvb2wuCgpJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBJIHNob3VsZCBtb2Rp
ZnkgdGhpcyBwYXRjaCB0byByZW1vdmUgdGhlCmNoYW5nZXMgb2YgYXJtIGFuZCByaXNjdiBmb3Ig
bm93LCBkbyB0aGUgY2hhbmdlcyBvbmx5IHdoZW4gdGhlcmUgaXMKYSByZWFsIHByb2JsZW0gb3Ig
cmVxdWlyZW1lbnQgc29tZSBkYXksIHJpZ2h0PyBJZiBubyBtb3JlIGNvbW1lbnRzLApJIHdpbGwg
c2VuZCB2MyBsYXRlci4KClRoYW5rcywKVGllemh1CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
