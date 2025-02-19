Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53ECC021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 03:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uqlby8B5lT0xYdzAwO8bPKxBrSbmVRQE3hJnFbyyGkc=; b=rk0S1dxofMyYce
	DkFf8FUiTcfPeWG0ikr9Ovy7iOQH704xS2kSoXFUSCb3wp71kaFxX9Jy5plYWSrY+exSI5aYIdCs8
	j99h5ICAYEnwr01Tx5yJx1RidtvHUHGdOnJB2mXWnJ9a7EuixSEA0haFkrN3sPAId/K+S+pXk0HeS
	xfaYsl46OpApqZ59SxdL+Uq23+AM8kHCPDj5Nf+ctT8zylSMhQ7YWMYe2iipSkefdviGnq3wz9DCM
	q7h7qEFhlE0L7EgLmXdeWYwZKCmBrliezDVkaTXMUz3DIPeb4K6WkeHT8AwKrp2G816MwfYsaMCoO
	mocJpvO3341f+/xsUCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkaNf-0000000AiYV-394y;
	Wed, 19 Feb 2025 03:04:11 +0000
Received: from mail-b.studer.dev ([3.21.136.164])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkaMB-0000000AiMQ-0eJ8;
	Wed, 19 Feb 2025 03:02:40 +0000
Received: from mail.studer.dev (mail.studer.dev [168.62.161.121])
	by mail-b.studer.dev (Postfix) with ESMTPSA id A4B6240047;
	Wed, 19 Feb 2025 03:02:35 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=studer.dev; s=hmail;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
	bh=qd6qp1+ybi0MHi3xmDnOya6FXacrtJVptDj7+jwoBCs=;
	b=TBUdQCJWM1Gle0QybTdOW2kMgDrTXfMtboFQ20aQBjD5bfSQ92pWUNYKTZk543HV67pnT5HyOk7RHFoJ7TY/TuN283Ir1ce2yv9ggDuX82NPctt/pcJPqDEPxwqddiOcb3jOZ3RUPFOUc1a3DVtiMlPWTNAGYEauGTyAEW1Wc4g+NrrFoIZpgBsF60kybfL8NuxTaQmGRK7herpMtN/sHiFQQ/sNcpwdyNhynrpWFyaKLamRbdFJVKpUTS
	vuZ7QUXTeIrE2qfQ03Lqpd5iwNtB5QXas5632DTZ+nByQd07N1mcMjTnNEZy7zZrUSYXVoRiaWH8gHkRqZi7MKgspVMw==
Received: from [192.168.1.166] (pool-68-239-44-167.bstnma.fios.verizon.net [68.239.44.167])
	by mail.studer.dev with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128)
	; Wed, 19 Feb 2025 03:02:33 +0000
Message-ID: <56fe8762-5b05-4b41-b7fd-f08f35012ba9@studer.dev>
Date: Tue, 18 Feb 2025 22:02:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add CPU thermal sensor and
 zone
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250218020629.1476126-1-alex@studer.dev>
 <4628970.LvFx2qVVIh@jernej-laptop>
From: Alex Studer <alex@studer.dev>
Content-Language: en-US
In-Reply-To: <4628970.LvFx2qVVIh@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_190239_271663_39936829 
X-CRM114-Status: GOOD (  19.13  )
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

T24gMi8xOC8yNSAxMjoyMyBQTSwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IERuZSB0b3Jlaywg
MTguIGZlYnJ1YXIgMjAyNSBvYiAwMzowNjoyOSBTcmVkbmplZXZyb3Bza2kgc3RhbmRhcmRuaSDE
jWFzIGplIEFsZXggU3R1ZGVyIG5hcGlzYWwoYSk6Cj4+IFRoZSBzdW4yMGkgVEhTIChidWlsdCBp
biBDUFUgdGhlcm1hbCBzZW5zb3IpIGlzIHN1cHBvcnRlZCBpbiBjb2RlLCBidXQKPj4gd2FzIG5l
dmVyIGFkZGVkIHRvIHRoZSBkZXZpY2UgdHJlZS4gU28sIGFkZCBpdCB0byB0aGUgZGV2aWNlIHRy
ZWUsCj4+IGFsb25nIHdpdGggYSB0aGVybWFsIHpvbmUgZm9yIHRoZSBDUFUuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXggU3R1ZGVyIDxhbGV4QHN0dWRlci5kZXY+Cj4+IC0tLQo+PiAgYXJjaC9y
aXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxcy5kdHNpIHwgMzEgKysrKysrKysrKysr
KysrKysrKwo+PiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpICAg
IHwgMTYgKysrKysrKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFz
LmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kKPj4g
aW5kZXggNjM2NzExMmU2Li5iZGRlODJhYTggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kKPj4gQEAgLTMsNiArMyw4IEBACj4+ICAKPj4g
ICNkZWZpbmUgU09DX1BFUklQSEVSQUxfSVJRKG5yKQkobnIgKyAxNikKPj4gIAo+PiArI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPgo+IFB1dCBhYm92ZSBsaW5lIG9uIHRv
cCAoYmVmb3JlIFNPQ19QRVJJUEhFUkFMX0lSUSgpKS4KV2lsbCBmaXggaW4gdjIuCj4+ICsKPj4g
ICNpbmNsdWRlICJzdW54aS1kMXMtdDExMy5kdHNpIgo+PiAgCj4+ICAvIHsKPj4gQEAgLTExNSw0
ICsxMTcsMzMgQEAgcG11IHsKPj4gIAkJCTwweDAwMDAwMDAwIDB4MDAwMDAwMGUgMHhmZmZmZmZm
ZiAweGZmZmZmZmZmIDB4MDAwMTAwMDA+LAo+PiAgCQkJPDB4MDAwMDAwMDAgMHgwMDAwMDAwZiAw
eGZmZmZmZmZmIDB4ZmZmZmZmZmYgMHgwMDAyMDAwMD47Cj4+ICAJfTsKPj4gKwo+PiArCXRoZXJt
YWwtem9uZXMgewo+PiArCQljcHUtdGhlcm1hbCB7Cj4+ICsJCQlwb2xsaW5nLWRlbGF5LXBhc3Np
dmUgPSA8MD47Cj4+ICsJCQlwb2xsaW5nLWRlbGF5ID0gPDA+Owo+PiArCQkJdGhlcm1hbC1zZW5z
b3JzID0gPCZ0aHM+Owo+PiArCj4+ICsJCQljb29saW5nLW1hcHMgewo+PiArCQkJCW1hcDAgewo+
PiArCQkJCQl0cmlwID0gPCZjcHVfYWxlcnQ+Owo+PiArCQkJCQljb29saW5nLWRldmljZSA9IDwm
Y3B1MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+PiArCQkJCX07Cj4+ICsJ
CQl9Owo+PiArCj4+ICsJCQl0cmlwcyB7Cj4+ICsJCQkJY3B1X2FsZXJ0OiBjcHUtYWxlcnQgewo+
PiArCQkJCQl0ZW1wZXJhdHVyZSA9IDw4NTAwMD47Cj4+ICsJCQkJCWh5c3RlcmVzaXMgPSA8MjAw
MD47Cj4+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4+ICsJCQkJfTsKPj4gKwo+PiArCQkJCWNw
dS1jcml0IHsKPj4gKwkJCQkJdGVtcGVyYXR1cmUgPSA8MTAwMDAwPjsKPj4gKwkJCQkJaHlzdGVy
ZXNpcyA9IDwwPjsKPj4gKwkJCQkJdHlwZSA9ICJjcml0aWNhbCI7Cj4+ICsJCQkJfTsKPiBXaGVy
ZSBkbyB0aG9zZSBsaW1pdHMgY29tZSBmcm9tPwpJIHRvb2sgdGhlbSBmcm9tIHRoZSBkZWZpbml0
aW9ucyBpbgphcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaSwgd2hp
Y2ggaXMgd2hhdCBJIGdlbmVyYWxseQpiYXNlZCB0aGlzIHBhdGNoIG9uLiBJIGNoZWNrZWQgdGhl
IEQxcyBkYXRhc2hlZXQgYW5kIGl0IGRvZXMgc3BlY2lmeSBhCm1heCAiQW1iaWVudCBPcGVyYXRp
bmcgVGVtcGVyYXR1cmUiIG9mIDcwIEMgYW5kIGEgbWF4ICJXb3JraW5nIEp1bmN0aW9uClRlbXBl
cmF0dXJlIFJhbmdlIiBvZiAxMTAgQy4gU28gSSBjb3VsZCB1c2UgdGhvc2UsIGJ1dCB0aGUgZHRz
aSBmaWxlcwpmb3IgdGhlIG90aGVyIHN1bnhpIGNoaXBzIGRvbid0IHNlZW0gdG8gZm9sbG93IHRo
ZWlyIHJlc3BlY3RpdmUKZGF0YXNoZWV0cywgc28gSSB3YXNuJ3Qgc3VyZSB3aGF0IHRvIGRvIGhl
cmUuCj4+ICsJCQl9Owo+PiArCQl9Owo+PiArCX07Cj4+ICB9Owo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPj4gaW5kZXggZTQxNzVh
ZGIwLi5mY2ZjYWYwNmMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lu
bmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3
aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+PiBAQCAtNDI2LDYgKzQyNiwxMCBAQCBzaWQ6IGVm
dXNlQDMwMDYwMDAgewo+PiAgCQkJcmVnID0gPDB4MzAwNjAwMCAweDEwMDA+Owo+PiAgCQkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICAJCQkjc2l6ZS1jZWxscyA9IDwxPjsKPj4gKwo+PiArCQkJ
dGhzX2NhbGlicmF0aW9uOiB0aGVybWFsLXNlbnNvci1jYWxpYnJhdGlvbkAxNCB7Cj4+ICsJCQkJ
cmVnID0gPDB4MTQgMHg4PjsKPj4gKwkJCX07Cj4+ICAJCX07Cj4+ICAKPj4gIAkJY3J5cHRvOiBj
cnlwdG9AMzA0MDAwMCB7Cj4+IEBAIC05MzQsNSArOTM4LDE3IEBAIHJ0YzogcnRjQDcwOTAwMDAg
ewo+PiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIiwgImhvc2MiLCAiYWhiIjsKPj4gIAkJCSNjbG9j
ay1jZWxscyA9IDwxPjsKPj4gIAkJfTsKPj4gKwo+PiArCQl0aHM6IHRoZXJtYWwtc2Vuc29yQDIw
MDk0MDAgewo+PiArCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxLXRocyI7Cj4+
ICsJCQlyZWcgPSA8MHgyMDA5NDAwIDB4MTAwPjsKPiBTaXplIHNob3VsZCBiZSAweDQwMC4KV2ls
bCBmaXggaW4gdjIuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVqCgpUaGFua3MsCkFsZXgKCj4K
Pj4gKwkJCWludGVycnVwdHMgPSA8U09DX1BFUklQSEVSQUxfSVJRKDU4KSBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKPj4gKwkJCWNsb2NrcyA9IDwmY2N1IENMS19CVVNfVEhTPjsKPj4gKwkJCWNsb2Nr
LW5hbWVzID0gImJ1cyI7Cj4+ICsJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX1RIUz47Cj4+ICsJ
CQludm1lbS1jZWxscyA9IDwmdGhzX2NhbGlicmF0aW9uPjsKPj4gKwkJCW52bWVtLWNlbGwtbmFt
ZXMgPSAiY2FsaWJyYXRpb24iOwo+PiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDA+Owo+
PiArCQl9Owo+PiAgCX07Cj4+ICB9Owo+Pgo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
