Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FD5FB5173
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 01:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfaCvFMmFu951SqMDP2TsJmO0SVHmGj63mZroHJGKtc=; b=2qoklaoJWqB+/O
	/fIJz82aaNytEzzCsSUmeMFGEpPlydVV8uge+j+mlZfCjV+Lx90AyiE7FlzYLCkqdcwSGoq2lrzPr
	/ROGOETByGX9U5y1KZw1Xp/nnxPM4viCy+z81M1Oeo7J8/hsfMrHDtOVBWK+P+WaPi6BjmXLvzwFz
	M1mC972gTDKDhrsNlr6UKDJiXPrbNIj5yI66L9QTtQp6fahSAciogt8fnFVNh+bS3q4aqbM53jrwQ
	idGWK1PGIvNgxx40jFCO8ckKKa7MWyWjSfJqK2EvBcAhANHSnoJT2t9Ntx0vlVEisTYKzqG6UVBzY
	dNqLQBB6/RpyME5+Titg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vYh-00000005j4G-3JA3;
	Tue, 07 Apr 2026 01:48:51 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vYe-00000005j3J-1OOl
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 01:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775526468;
	bh=Hy/sO75HQKNohZb1dgBvMQIsPQhWi2x/n8KZFdFD8wg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=mz5BG9joroMnJsPLs2SZQD/H5iA+45CBmmGaWq5OQQ8g446UopzLNQhLH6TjKH9Vt
	 S1S3pXPSM1Vd0LTG4sJHgV9sDVqt9TdT0iAFzaMT2L5U6GzbOWCPNaFIiWvmd4H39N
	 zrH87VCVT3mfZqwL/Ms2TTqr25RM2Wady7moZpn0=
X-QQ-mid: zesmtpsz5t1775526456te8571744
X-QQ-Originating-IP: Ic5fjUYg9RXHUPdbVIrhgxiaVRACulBPHhh/YnRjOwU=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 09:47:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12304050833653205190
Message-ID: <406D63D11CE43166+c3d29042-4097-4309-9117-3cdbce71ddb7@linux.spacemit.com>
Date: Tue, 7 Apr 2026 09:47:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: liangzhen <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 shuah@kernel.org
References: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <3D3CC7D372F7558A+6c0621bd-3021-40dd-88e3-697aa597dbd3@linux.spacemit.com>
 <CA+Ht8=bLxTz8_Cm2s=01CBNpmx4g6XhT6ZzTfJH9rPgDXPOUjQ@mail.gmail.com>
In-Reply-To: <CA+Ht8=bLxTz8_Cm2s=01CBNpmx4g6XhT6ZzTfJH9rPgDXPOUjQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NI7mZStpQUcKNf2dP0UxWCbyydpZmH10CVx/zH9L/GBQSZsARAyoL4sZ
	F7keMaoQTNf9GPIRcSTGLXDt7oMw70Hdj8CmYaIdKt72BsZeW6r02mk13fp3mbqFtt938ub
	NLxkYiCT9Ippi/39qK27IYUycfeUrKVNX2gX55m16VN6JU/DQA6FxUoMq7kAMUoCr0SlcuF
	DqAEh5PMv4gSKi/Mgb1mx+S0zfGWtkg0CC8NvdgTgtzJ8bJAhP1/1SKKn8fvNJE8zwajfrd
	2YdQp6OVzXYdgiHC5i4iv6GGCn3jS2eOt0xYtMe3QxTWKoBxtYWFXSfu3j0eyALbCIIEFdo
	hf4uSfqGq0crkM+iv8j9J4RbvY224coXsRiznamJxjqtJ9cn41ax1Pe4sPb8A0ss8kO+D+H
	bbm+SxtIynaAL8g48sHSVPoBI9sU8tt3JULC/SDKxG1+UZ527BLoJfbSL2LZpDiX4J9RdS8
	HYrmD/W7Lc63tbX9K//Z3a4fLm7VmgTnULhO5EnztL6pedaTeW0EZXbGEdPSeCbMxmbZBZo
	eHrjnA4T1D5hR5hF2dJxUR3tfclCvsdypIth7zDvKJqds8QxF+JLgkOZdder2wWfkxQJs3h
	4mPUX1DQighTX0jMwRiE4zH5S3updell0NNfNDEcScEISDLG+Upg+npr4FcSNirzmqfs1a6
	tnqvKOmFOj+kaeArgUuZ7bqIkOm7T7lXisN/t+SknChuXUfxLGMRX92lsFrG+jt2YQc/z1l
	vDf4m8P1ZPssiBOuKDgkbk6Iq72sfosm9WnrqFloe9hsj8pwV5PMcA8S+tnY94FOsETSlvW
	O0WLcBMnz4ARzuadhhex/EGKHg5S5+xQxo7qgj1z/eNr13lIOAA5rFyurha3F5T7m1NEj6Q
	6Sk6QEU/nvTADwjbt6tvAhmTrNdqKaMViEwmdZtkpzwquETbibXhgle0auT7roWX6RtLGNS
	k/yVIoTowN18LjxM36c2sdVvNE/6udsU1dwVLS3+DtejhCg3JC5m6GGb1CC8yTzsyOgwZBl
	oRRZxt+lfe3HvD9CeM
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_184849_395536_D15FB8D3 
X-CRM114-Status: GOOD (  16.63  )
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

SSBpbXBsZW1lbnRlZCB0aGUgcHRyYWNlIGFuZCBHREIgYnJlYWtwb2ludCBzdXBwb3J0IGJhc2Vk
IG9uIHRoaXMKcGF0Y2ggc2VyaWVzLiBXaGVuIHNldHRpbmcgdGhlIFNJWkUgZmllbGQgdG8gMCwg
dGhlIHRlc3QgY2FzZSB3b3Jrcwpjb3JyZWN0bHkuCgoKT24gNC82LzIwMjYgMTI6NDggUE0sIEhp
bWFuc2h1IENoYXVoYW4gd3JvdGU6Cj4gSGkgTGlhbmd6aGVuLAo+Cj4gU29ycnkgSSB3YXMgYnVz
eSB3aXRoIHB0cmFjZSBpbXBsZW1lbnRhdGlvbiBvbiB0aGlzIHBhdGNoIHNlcmllcy4KPiBXaGlj
aCBpcyBkb25lIG5vdyBhbmQgSSB3aWxsIHNlbmQgaXQgYWZ0ZXIgdGhlIG5leHQgcmV2aXNpb24g
b2YgdGhpcwo+IHBhdGNoLgo+Cj4gT24gRnJpLCBBcHIgMywgMjAyNiBhdCAxOjA54oCvUE0gbGlh
bmd6aGVuIDxsaWFuZ3poZW5AbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPj4gSGksCj4+Cj4+
IFRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCwgSSBoYXZlIG9uZSBxdWVzdGlvbiByZWdhcmRpbmcg
dGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHNpemUgZmllbGQ6Cj4+Cj4+IE9uIE1vbiwgRmViIDIz
LCAyMDI2IGF0IDEwOjE5OjE3QU0gKzA1MzAsIEhpbWFuc2h1IENoYXVoYW4gd3JvdGU6Cj4+Cj4+
PiArICAgIGNhc2UgSFdfQlJFQUtQT0lOVF9MRU5fMToKPj4+ICsgICAgICAgIGh3LT5sZW4gPSAx
Owo+Pj4gKyAgICAgICAgaHctPnRkYXRhMSA9IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50ZGF0
YTEsIDEpOwo+Pj4gKyAgICAgICAgYnJlYWs7Cj4+PiArICAgIGNhc2UgSFdfQlJFQUtQT0lOVF9M
RU5fMjoKPj4+ICsgICAgICAgIGh3LT5sZW4gPSAyOwo+Pj4gKyAgICAgICAgaHctPnRkYXRhMSA9
IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50ZGF0YTEsIDIpOwo+Pj4gKyAgICAgICAgYnJlYWs7
Cj4+PiArICAgIGNhc2UgSFdfQlJFQUtQT0lOVF9MRU5fNDoKPj4+ICsgICAgICAgIGh3LT5sZW4g
PSA0Owo+Pj4gKyAgICAgICAgaHctPnRkYXRhMSA9IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50
ZGF0YTEsIDMpOwo+Pj4gKyAgICAgICAgYnJlYWs7Cj4+PiArICAgIGNhc2UgSFdfQlJFQUtQT0lO
VF9MRU5fODoKPj4+ICsgICAgICAgIGh3LT5sZW4gPSA4Owo+Pj4gKyAgICAgICAgaHctPnRkYXRh
MSA9IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50ZGF0YTEsIDUpOwo+Pj4gKyAgICAgICAgYnJl
YWs7Cj4+IEdEQidzIGdkYmFyY2hfYnJlYWtwb2ludF9mcm9tX3BjIG1ldGhvZCByZXR1cm5zIGxl
bj0yIGZvciBub24tYWxpZ25lZCBhZGRyZXNzZXMsIGNhdXNpbmcgc2l6ZSBtaXNtYXRjaCB3aXRo
IGhhcmR3YXJlIHRyaWdnZXJzLgo+Pgo+PiBBIHNpbXBsZSB0ZXN0IGlzIGFzIGZvbGxvd3M6Cj4+
Cj4+IHJvb3RAazM6fiMgY2F0IHRlc3QuYwo+PiAjaW5jbHVkZSA8c3RkaW8uaD4KPj4KPj4gaW50
IGEgPSAwOwo+PiBpbnQgbWFpbigpCj4+IHsKPj4gICAgICAgICBwcmludGYoInN0YXJ0IHRlc3Rc
biIpOwo+PiAgICAgICAgIGEgPSAxOwo+PiAgICAgICAgIHByaW50ZigiYSA9ICVkXG4iLCBhKTsK
Pj4gICAgICAgICBwcmludGYoImVuZCB0ZXN0XG4iKTsgcmV0dXJuIDA7IH0gcm9vdEBrMzp+IyBn
Y2MgLW1hcmNoPXJ2NjRnYyAtZyB0ZXN0LmMgLW8gdGVzdCByb290QGszOn4jIGdkYiB0ZXN0IC4u
LiBzdGFydCAuLi4gVGVtcG9yYXJ5IGJyZWFrcG9pbnQgMSwgbWFpbiAoKSBhdCB0ZXN0LmM6NiA2
IHByaW50Zigic3RhcnQgdGVzdFxuIik7Cj4+IChnZGIpIHgvOGkgJHBjCj4+ID0+IDB4MmFhYWFh
YTZlYSA8bWFpbis4PjogICAgICAgYXVpcGMgICBhMCwweDAKPj4gICAgMHgyYWFhYWFhNmVlIDxt
YWluKzEyPjogICAgICBhZGRpICAgIGEwLGEwLDg2Cj4+ICAgIDB4MmFhYWFhYTZmMiA8bWFpbisx
Nj46ICAgICAgamFsICAgICAweDJhYWFhYWE1ZDAgPHB1dHNAcGx0Pgo+PiAgICAweDJhYWFhYWE2
ZjYgPG1haW4rMjA+OiAgICAgIGF1aXBjICAgYTUsMHgyCj4+ICAgIDB4MmFhYWFhYTZmYSA8bWFp
bisyND46ICAgICAgYWRkaSAgICBhNSxhNSwtMTc3MAo+PiAgICAweDJhYWFhYWE2ZmUgPG1haW4r
Mjg+OiAgICAgIGxpICAgICAgYTQsMQo+PiAgICAweDJhYWFhYWE3MDAgPG1haW4rMzA+OiAgICAg
IHN3ICAgICAgYTQsMChhNSkKPj4gICAgMHgyYWFhYWFhNzAyIDxtYWluKzMyPjogICAgICBhdWlw
YyAgIGE1LDB4Mgo+PiAoZ2RiKSBoYnJlYWsgKjB4MmFhYWFhYTZmMgo+PiBIYXJkd2FyZSBhc3Np
c3RlZCBicmVha3BvaW50IDIgYXQgMHgyYWFhYWFhNmYyOiBmaWxlIHRlc3QuYywgbGluZSA2Lgo+
PiAoZ2RiKSBjCj4+IENvbnRpbnVpbmcuCj4+IHN0YXJ0IHRlc3QKPj4gYSA9IDEKPj4gZW5kIHRl
c3QKPj4gW0luZmVyaW9yIDEgKHByb2Nlc3MgMTc4NCkgZXhpdGVkIG5vcm1hbGx5XQo+PiAoZ2Ri
KQo+Pgo+PiByb290QGszOn4jIGdjYyAtbWFyY2g9cnY2NGcgLWcgdGVzdC5jIC1vIHRlc3QKPj4g
cm9vdEBrMzp+IyBnZGIgdGVzdAo+PiAuLi4KPj4gc3RhcnQKPj4gLi4uCj4+IFRlbXBvcmFyeSBi
cmVha3BvaW50IDEsIG1haW4gKCkgYXQgdGVzdC5jOjYKPj4gNiAgICAgICAgICAgICAgIHByaW50
Zigic3RhcnQgdGVzdFxuIik7Cj4+IChnZGIpIHgvOGkgJHBjCj4+ID0+IDB4MmFhYWFhYTZmNCA8
bWFpbisxNj46ICAgICAgYXVpcGMgICBhMCwweDAKPj4gICAgMHgyYWFhYWFhNmY4IDxtYWluKzIw
PjogICAgICBhZGRpICAgIGEwLGEwLDEwMAo+PiAgICAweDJhYWFhYWE2ZmMgPG1haW4rMjQ+OiAg
ICAgIGphbCAgICAgMHgyYWFhYWFhNWQwIDxwdXRzQHBsdD4KPj4gICAgMHgyYWFhYWFhNzAwIDxt
YWluKzI4PjogICAgICBhdWlwYyAgIGE1LDB4Mgo+PiAgICAweDJhYWFhYWE3MDQgPG1haW4rMzI+
OiAgICAgIGFkZGkgICAgYTUsYTUsLTE3ODAKPj4gICAgMHgyYWFhYWFhNzA4IDxtYWluKzM2Pjog
ICAgICBsaSAgICAgIGE0LDEKPj4gICAgMHgyYWFhYWFhNzBjIDxtYWluKzQwPjogICAgICBzdyAg
ICAgIGE0LDAoYTUpCj4+ICAgIDB4MmFhYWFhYTcxMCA8bWFpbis0ND46ICAgICAgYXVpcGMgICBh
NSwweDIKPj4gKGdkYikgaGJyZWFrICoweDJhYWFhYWE2ZmMKPj4gSGFyZHdhcmUgYXNzaXN0ZWQg
YnJlYWtwb2ludCAyIGF0IDB4MmFhYWFhYTZmYzogZmlsZSB0ZXN0LmMsIGxpbmUgNi4KPj4gKGdk
YikgYwo+PiBDb250aW51aW5nLgo+Pgo+PiBCcmVha3BvaW50IDIsIDB4MDAwMDAwMmFhYWFhYTZm
YyBpbiBtYWluICgpIGF0IHRlc3QuYzo2Cj4+IDYgICAgICAgICAgICAgICBwcmludGYoInN0YXJ0
IHRlc3RcbiIpOwo+PiAoZ2RiKQo+Pgo+PiBBcyBhIHJlc3VsdCwgaGFyZHdhcmUgYnJlYWtwb2lu
dHMgc2V0IG9uIDE2LWJpdCBpbnN0cnVjdGlvbiBhZGRyZXNzZXMgbWF5IGZhaWwgdG8gdHJpZ2dl
ciBkdWUgdG8gdGhpcyBzaXplIG1pc21hdGNoLiBTbyBjYW4gd2UgY29uc2lkZXIgc2V0dGluZyB0
aGUgU0laRSBmaWVsZCB0byAwIChtYXRjaCBhbnkgc2l6ZSksIGhhcmR3YXJlIHRyaWdnZXJzIG1h
dGNoIG1lbW9yeSBhY2Nlc3NlcyBvZiBhbnkgc2l6ZS4KPj4KPiBJIHRoaW5rIHlvdSBoYXZlIGEg
Z29vZCB0ZXN0IGNhc2UgaGVyZS4gV2UgY2FuIHNldCBzaXplIHRvIDAgaWYKPiBzcGVjaWZpY2Fs
bHkgYXNrZWQgb3IgaW4gdGhlIGRlZmF1bHQgY2FzZS4KPiBEbyB5b3UgaGF2ZSBhIHBhdGNoIHNl
dCBhZ2FpbnN0IEdEQiB0byB0ZXN0IHRoaXMgb3V0Pwo+Cj4gVGhhbmtzCj4gUmVnYXJkcwo+IEhp
bWFuc2h1Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
