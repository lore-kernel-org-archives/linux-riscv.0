Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55424E77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 10:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVAmh026BJJXpKBF0nJMlduJWOyGOr5rlG5sJ/delac=; b=HQMNoX0+2ku5S3
	aW+cOAQWylvNj3ERZKXbdhxbhxFR0N6JwlcE3rtSC+erdciCOQOlcrx8su3BuHZLfL5gHp6efmYhj
	xj31T/JqLBQPua6O8Hl55zTn0s2Rz44keR6Wu9sGtdpakorvbB60S1EZtUKR1Z2V+JlarTbrLmL1i
	6C2SC171rlOMPjct2m8FhSB8fEvh3soQ58JaH7i1y1rACkYFF2CtbAPogCDGR0urjEUeCwRXk/ZYB
	XmbzW6M42/Wxo1F7DkcGkWSO/LnClcdyzHi9V46Y0P6FAXeGpnn9lPD1CV7/yi4VTUEnfck31I0ie
	kMRgq2bj6Dse7m50agLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1aE-0000000Ess7-2QWE;
	Sat, 04 Jan 2025 10:40:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1aB-0000000EsrK-3EYS
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 10:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7365A40412;
	Sat,  4 Jan 2025 10:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A2AC4CED1;
	Sat,  4 Jan 2025 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735987238;
	bh=rJCDnChyzIajUi/vfRibykdeWobpL0pE0FaiKMSKOzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KSG+deytS6JpXB+RL7OYm6ObAxolg9IF/3fwI39+su4VZV73qKWtF7Ni3tNXI7ffJ
	 YX+lfdzxktRllL9YXBn9OjbKlrhMTML65d1SkrPc3rngOLJX6Q0IVtZI0Gq8j/kLKl
	 WtkHtf8jAp3V/7YPzpQ76GHzM23jtjOlSPHcAQmlVA7E+bZyoUtT4JiB+yxDhFkZFF
	 mMqX2n954tDQfptoQccZvppY24/k6u4mdFwAUmlY+K8Ujq+t54rDnw4l1dv3F1F+54
	 hQ4OsyqkA3P2h6qs7cD5iaKjKU5HafdrqEhO2H2IjPqk/ilfJ0Erw1KxGvNwz+FqRI
	 wonwsTqA5NoLQ==
Message-ID: <a097980a-c2b7-440c-8eff-b540acfd4027@kernel.org>
Date: Sat, 4 Jan 2025 11:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
 <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
 <39e6bf64-2ce6-45bb-b622-4b413efc185f@zohomail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <39e6bf64-2ce6-45bb-b622-4b413efc185f@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_024039_934307_5C9F2966 
X-CRM114-Status: GOOD (  10.94  )
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

T24gMDQvMDEvMjAyNSAxMDoyMywgWHVrYWkgV2FuZyB3cm90ZToKPiAKPiBIZXJlJ3MgdGhlIHVw
ZGF0ZSB2ZXJzaW9uOgo+IAo+IHJlZzoKPiDCoCBkZXNjcmlwdGlvbjogfAo+IMKgwqDCoCBUaGUg
YHJlZ2AgcHJvcGVydHkgc3BlY2lmaWVzIHRoZSBiYXNlIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhl
Cj4gZGV2aWNlJ3MgcmVnaXN0ZXJzLgo+IMKgwqDCoCAtIFRoZSBmaXJzdCBhZGRyZXNzIGNvcnJl
c3BvbmRzIHRvIHRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlIFBMTAo+IGNvbnRyb2wgcmVnaXN0ZXJz
Lgo+IMKgwqDCoCAtIFRoZSBzZWNvbmQgYWRkcmVzcyBjb3JyZXNwb25kcyB0byB0aGUgYmFzZSBh
ZGRyZXNzIG9mIHRoZSBzeXNjbGsKPiBjb250cm9sIHJlZ2lzdGVycy4KCk5vLCBkcm9wIGFsbCB0
aGVzZS4gWW91IGR1cGxpY2F0ZSBzY2hlbWEuCgo+IMKgIG1pbkl0ZW1zOiAxCgpXaHk/Cgo+IMKg
IGl0ZW1zOgo+IMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBCYXNlIGFkZHJlc3MgYW5kIHNpemUgb2Yg
dGhlIFBMTCBjb250cm9sIHJlZ2lzdGVycy4KPiDCoMKgwqAgLSBkZXNjcmlwdGlvbjogQmFzZSBh
ZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBzeXNjbGsgY29udHJvbCByZWdpc3RlcnMuCgpEcm9wIHJl
ZHVuZGFudCAiQmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSIuIFRoaXMgY2Fubm90IGJlIGFu
eXRoaW5nCmVsc2UgaW4gdGhpcyBjb250ZXh0LgoKPiAKPiBEb2VzIHRoaXMgY29udGVudCBsb29r
IGFwcHJvcHJpYXRlPwo+IAo+Pj4gKwo+Pj4gKyAgJyNjbG9jay1jZWxscyc6Cj4+PiArICAgIGNv
bnN0OiAxCj4+PiArCj4+PiArcmVxdWlyZWQ6Cj4+PiArICAtIGNvbXBhdGlibGUKPj4+ICsgIC0g
cmVnCj4+PiArICAtIGNsb2Nrcwo+Pj4gKyAgLSAnI2Nsb2NrLWNlbGxzJwo+Pj4gKwo+Pj4gK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4gKwo+Pj4gK2V4YW1wbGVzOgo+Pj4gKyAgLSB8
Cj4+PiArICAgIGNsb2NrLWNvbnRyb2xsZXJAOTExMDIwMDAgewo+Pj4gKyAgICAgICAgY29tcGF0
aWJsZSA9ICJjYW5hYW4sazIzMC1jbGsiOwo+Pj4gKyAgICAgICAgcmVnID0gPDB4OTExMDIwMDAg
MHgxMDAwPiwgPDB4OTExMDAwMDAgMHgxMDAwPjsKPj4+ICsgICAgICAgICNjbG9jay1jZWxscyA9
IDwxPjsKPj4+ICsgICAgICAgIGNsb2NrcyA9IDwmb3NjMjRtPjsKPj4+ICsgICAgfTsKPj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2syMzAtY2xrLmggYi9pbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL2syMzAtY2xrLmgKCkkgbWlzc2VkIG9uZSB0aGluZyAtIGZpbGVu
YW1lIGlzIHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lIGFzIGJpbmRpbmcKZmlsZW5hbWUuCgpCZXN0
IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
