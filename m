Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC36CA5FB3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+vesNgXPbk6++EZKAgEnCohjcAiexGk5Te4ubFdyX0=; b=hT3YCi3hFbNi3L
	jnK8uFzObpESp6RTRtG7MviqFMx1Gsah6IE8r+8IQDRB00/M1UCFLhTrG4NKM1j36fszRqeuDPAV7
	IsWJ95IHgUbrhNQSRZ7CbsRIQHlfjlveUb5NE8DVE2XS5mfp+8VaGuMFn7mIJpcrdZYbzInSNL0LQ
	AIhdu7pP3I6XLjwhp8YieykMf/BjVbVezzR7Jyk1AiHdHDF4rmD4Zm+MPZxene0D9qcKdmI+QQG62
	r+2R0JOPO/DAW8TfqNg6FmXETO5EgCApqDXpnVldZMOpLQiwF9xhkThhu97lqs4RdeEwZnfX/ssLP
	t7XQQVkB/TbWkhmGUQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9T4-00000007pZR-0JvY;
	Thu, 01 Oct 2026 05:36:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9T2-00000007pZJ-3ZuJ
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:36:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A21343C78;
	Thu,  1 Oct 2026 05:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EC81F000FF;
	Thu,  1 Oct 2026 05:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832988;
	bh=0zd8+lKttm78z4L+ooc6EYQgXG2k+ZJfGDrIK6Reg4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=adaosqMLS7JiN2S2jwxP7F7kg+esAoJOGQnSBwYnhcJFzmvSXHX+oNrOQ22hkT+GL
	 typqDp+U8TZ6a/nP2wph24E2veJ0183FB1XLrH35N63A8KQeY6JuOe+9TBa+6mp++e
	 6CMtLH4GS1bJ9eTSfnLZq7FvLwkHAr53+b5ASghwSrvq/HnJ/8dJlpLXL2G1xy8I1r
	 BhO+OiKBUfI4NuOnnKDu99s0n3Vs4+ARYSIwEBgdPHYwEFUICwIhGykREqKSgLCypZ
	 6is0PDIB7ozBTY2fM2cUN7zCoLQ1PbLy0ZuyAoznlD5Hov3SKj4tcVCZMN3YcrFFmJ
	 q+PMEqExoIvxA==
Message-ID: <85ce7089-1d6c-4862-b88a-b47e078f74f2@kernel.org>
Date: Thu, 1 Oct 2026 07:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
To: Drew Fustini <fustini@kernel.org>, Han Gao <rabenda.cn@gmail.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
 <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
 <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
 <ar1AlKUs9gwTDWWR@thelio>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ar1AlKUs9gwTDWWR@thelio>
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

T24gMzAvMDkvMjAyNiAxOTowMiwgRHJldyBGdXN0aW5pIHdyb3RlOgo+IE9uIFdlZCwgU2VwIDMw
LCAyMDI2IGF0IDEwOjM3OjI4UE0gKzA4MDAsIEhhbiBHYW8gd3JvdGU6Cj4+IE9uIFdlZCwgU2Vw
IDMwLCAyMDI2IGF0IDc6NTHigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pj4KPj4+IE9uIFR1ZSwgU2VwIDI5LCAyMDI2IGF0IDA2OjIyOjQ1UE0gKzA4
MDAsIEhhbiBHYW8gd3JvdGU6Cj4+Pj4gRG9jdW1lbnQgdGhlIE1pbGstViBNZWxlcyBib2FyZCBj
b21wYXRpYmxlIHdpdGggdGhlIFRIMTUyMCBmYWxsYmFjay4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPj4+PiAtLS0KPj4+PiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlhbWwgfCA0ICsrKysKPj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90aGVhZC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlhbWwKPj4+PiBpbmRleCAz
MDE5MTJkY2QyOTBlNjBmODE2ZDM4MDE1MjU5MTEwNmRlOTQxNWI0Li41MzYxMDIxYjhkY2M5ODk3
ODAzYTU5MTU2NjVjNmJiODMzMDlmZTUzIDEwMDY0NAo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90aGVhZC55YW1sCj4+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlhbWwKPj4+PiBAQCAtMjEsNiAr
MjEsMTAgQEAgcHJvcGVydGllczoKPj4+PiAgICAgICAgICBpdGVtczoKPj4+PiAgICAgICAgICAg
IC0gY29uc3Q6IGJlYWdsZSxiZWFnbGV2LWFoZWFkCj4+Pj4gICAgICAgICAgICAtIGNvbnN0OiB0
aGVhZCx0aDE1MjAKPj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogTWlsay1WIE1lbGVzIHNpbmds
ZSBib2FyZCBjb21wdXRlcgo+Pj4+ICsgICAgICAgIGl0ZW1zOgo+Pj4+ICsgICAgICAgICAgLSBj
b25zdDogbWlsa3YsbWVsZXMKPj4+Cj4+PiBXaHkgaXNuJ3QgdGhpcyBlbnVtIHdpdGggdGhlIHBy
ZXZpb3VzIGVudHJ5Pwo+Pgo+PiBNZXJnaW5nIHdpbGwgcmVzdWx0IGluIHRoZSBsb3NzIG9mIFNC
QyBtYW51ZmFjdHVyZXIgaW5mb3JtYXRpb24uCj4+IE1pbGstViBpcyBhbiBpbmRlcGVuZGVudCBt
YW51ZmFjdHVyZXIuCj4+Cj4+IFRoYW5rcywKPj4gSGFuCj4gCj4gSSB0aGluayB0aGUgZmVlZGJh
Y2sgaXMgdGhhdCBCZWFnbGVWIEFoZWFkIGFuZCBNaWxrLVYgTWVsZXMgaGF2ZSB0aGUKPiBzYW1l
IHBhdHRlcm4gYW5kIGl0IGNvdWxkIGJlIGNoYW5nZWQgdG86Cj4gCj4gICAgICAgLSBkZXNjcmlw
dGlvbjogVEgxNTIwIHNpbmdsZSBib2FyZCBjb21wdXRlcnMKPiAgICAgICAgIGl0ZW1zOgo+ICAg
ICAgICAgICAtIGVudW06Cj4gICAgICAgICAgICAgICAtIGJlYWdsZSxiZWFnbGV2LWFoZWFkCj4g
ICAgICAgICAgICAgICAtIG1pbGt2LG1lbGVzCj4gICAgICAgICAgIC0gY29uc3Q6IHRoZWFkLHRo
MTUyMAo+IAo+IElzIHRoYXQgcmlnaHQsIEtyenlzenRvZj8KClllcywgdGhhdCdzIGVhc2llciB0
byBtYWludGFpbiBwYXR0ZXJuLiBFbnRyeSBwZXIgc2luZ2xlICBib2FyZCBtZWFucyAzCnJlZHVu
ZGFudCBsaW5lcyBhbmQgYSBsb3Qgb2YgYmxvYXQuIE9ubHkgb25lIG9yIHR3byBTb0NzIGZvbGxv
dyBzdWNoCmFwcHJvYWNoLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
