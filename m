Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA5CC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceGmyjTVnpmy8tqcRqjB8FbnvU/DzFLGVK/lIk6OJpg=; b=ZdkBM/1BNSas3S
	BjTVgI/QFD7yF8gqg+93iGBzxFbpEVnATBzOgMVBMv/QPkYNQfiK1ecJOs4UHNNMLOdHXXRHSkgaU
	lf4rIFuUDvfnE4CBl4wf73UpH1B99krdpVh8uWaWhcDgacUEx42gIQ+qWSdEEouzvh0Sl8MmOyOwG
	cie3sXRSpJ4rsb+2hm6mEzPfXmGCgxBWoWElMRpaYFGpUS/zwS6eLkHFJWVe80Za03gU5w3kZmyOE
	NCWasEdTDZZodHaFJXEP6Vo6nKIAYA30H+W0MjX87hMGUQXtluSaHYgrCs3PZxuH/tPW3bSJwKhQO
	3mPDWYiwsW9ykx1Qzp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUiud-0000000Fabm-392z;
	Tue, 30 Jan 2024 07:52:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUiua-0000000Faat-1UHA;
	Tue, 30 Jan 2024 07:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94A9262704;
	Tue, 30 Jan 2024 07:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B316EC43390;
	Tue, 30 Jan 2024 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706601123;
	bh=GLh8dsTxNo9L/3+mC7DJTQzGc6JkyJok3IVl4QHNXYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FWMHD4ukg84VQQPcUzdvYkTpZEolvS89PLEDeqEObNoHN6dL7wtbGcKftgA5f0MnW
	 uck/JCMbyizznWP9cehzht1F7w3uyMnGd59ivYIhMQrNY/kdrHevXcgDae+uAzjbfV
	 SHzW91Hnj4ixeD1cFhI7ivDYTkGxdJypmFkNCjRz8Mce3Ax6SIygyjfzJ7KuzAMGU1
	 xBy+9KZ7NQ7/rlbKIViFDqfVMM16BBLd5XgHkRlDOaJ2WKUnVJYI35CKEaJ/5YDnWT
	 HKh5jfb388949enb8epNogYKvqi7b9ve3VWDIkKwMV/fZIs9oySE6JSqz69xM2MRJK
	 vjE8q+tzh/h9A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <87r0hzuw87.fsf@all.your.base.are.belong.to.us>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87r0hzuw87.fsf@all.your.base.are.belong.to.us>
Date: Tue, 30 Jan 2024 08:52:00 +0100
Message-ID: <87le87uulb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_235204_498436_ADFC3A9A 
X-CRM114-Status: GOOD (  10.55  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+Cj4+IFRoZSBSSVNDLVYgQUlBIHNwZWNp
ZmljYXRpb24gaXMgcmF0aWZpZWQgYXMtcGVyIHRoZSBSSVNDLVYgaW50ZXJuYXRpb25hbAo+PiBw
cm9jZXNzLiBUaGUgbGF0ZXN0IHJhdGlmaWVkIEFJQSBzcGVjaWZjYXRpb24gY2FuIGJlIGZvdW5k
IGF0Ogo+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhL3JlbGVhc2VzL2Rvd25s
b2FkLzEuMC9yaXNjdi1pbnRlcnJ1cHRzLTEuMC5wZGYKPj4KPj4gQXQgYSBoaWdoLWxldmVsLCB0
aGUgQUlBIHNwZWNpZmljYXRpb24gYWRkcyB0aHJlZSB0aGluZ3M6Cj4+IDEpIEFJQSBDU1JzCj4+
ICAgIC0gSW1wcm92ZWQgbG9jYWwgaW50ZXJydXB0IHN1cHBvcnQKPj4gMikgSW5jb21pbmcgTWVz
c2FnZSBTaWduYWxlZCBJbnRlcnJ1cHQgQ29udHJvbGxlciAoSU1TSUMpCj4+ICAgIC0gUGVyLUhB
UlQgTVNJIGNvbnRyb2xsZXIKPj4gICAgLSBTdXBwb3J0IE1TSSB2aXJ0dWFsaXphdGlvbgo+PiAg
ICAtIFN1cHBvcnQgSVBJIGFsb25nIHdpdGggdmlydHVhbGl6YXRpb24KPj4gMykgQWR2YW5jZWQg
UGxhdGZvcm0tTGV2ZWwgSW50ZXJydXB0IENvbnRyb2xsZXIgKEFQTElDKQo+PiAgICAtIFdpcmVk
IGludGVycnVwdCBjb250cm9sbGVyCj4+ICAgIC0gSW4gTVNJLW1vZGUsIGNvbnZlcnRzIHdpcmVk
IGludGVycnVwdCBpbnRvIE1TSXMgKGkuZS4gTVNJIGdlbmVyYXRvcikKPj4gICAgLSBJbiBEaXJl
Y3QtbW9kZSwgaW5qZWN0cyBleHRlcm5hbCBpbnRlcnJ1cHRzIGRpcmVjdGx5IGludG8gSEFSVHMK
Pj4KPj4gRm9yIGFuIG92ZXJ2aWV3IG9mIHRoZSBBSUEgc3BlY2lmaWNhdGlvbiwgcmVmZXIgdGhl
IEFJQSB2aXJ0dWFsaXphdGlvbgo+PiB0YWxrIGF0IEtWTSBGb3J1bSAyMDIyOgo+PiBodHRwczov
L3N0YXRpYy5zY2hlZC5jb20vaG9zdGVkX2ZpbGVzL2t2bWZvcnVtMjAyMi9hMS9BSUFfVmlydHVh
bGl6YXRpb25faW5fS1ZNX1JJU0NWX2ZpbmFsLnBkZgo+PiBodHRwczovL3d3dy55b3V0dWJlLmNv
bS93YXRjaD92PXIwNzFkTDhaMHlvCj4+Cj4+IFRvIHRlc3QgdGhpcyBzZXJpZXMsIHVzZSBRRU1V
IHY3LjIgKG9yIGhpZ2hlcikgYW5kIE9wZW5TQkkgdjEuMiAob3IgaGlnaGVyKS4KPj4KPj4gVGhl
c2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiB0aGUgcmlzY3ZfYWlhX3YxMiBicmFuY2gg
YXQ6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Pgo+PiBDaGFuZ2Vz
IHNpbmNlIHYxMToKPj4gIC0gUmViYXNlZCBvbiBMaW51eC02LjgtcmMxCj4+ICAtIEluY2x1ZGVk
IGtlcm5lbC9pcnEgcmVsYXRlZCBwYXRjaGVzIGZyb20gImdlbmlycSwgaXJxY2hpcDogQ29udmVy
dCBBUk0KPj4gICAgTVNJIGhhbmRsaW5nIHRvIHBlciBkZXZpY2UgTVNJIGRvbWFpbnMiIHNlcmll
cyBieSBUaG9tYXMuCj4+ICAgIChQQVRDSDcsIFBBVENIOCwgUEFUQ0g5LCBQQVRDSDE0LCBQQVRD
SDE2LCBQQVRDSDE3LCBQQVRDSDE4LCBQQVRDSDE5LAo+PiAgICAgUEFUQ0gyMCwgUEFUQ0gyMSwg
UEFUQ0gyMiwgUEFUQ0gyMywgYW5kIFBBVENIMzIgb2YKPj4gICAgIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMjExMjExMzU2NTMuMjA4NjExMjMzQGxpbnV0cm9u
aXguZGUvKQo+PiAgLSBVcGRhdGVkIEFQTElDIE1TSS1tb2RlIGRyaXZlciB0byB1c2UgdGhlIG5l
dyBXSVJFRF9UT19NU0kgbWVjaGFuaXNtLgo+PiAgLSBVcGRhdGVkIElNU0lDIGRyaXZlciB0byBz
dXBwb3J0IHBlci1kZXZpY2UgTVNJIGRvbWFpbnMgZm9yIFBDSSBhbmQKPj4gICAgcGxhdGZvcm0g
ZGV2aWNlcy4KPgo+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLCBBbnVwISBJJ20gc3RpbGwg
cmV2aWV3aW5nIHRoZSBwYXRjaGVzLgo+Cj4gSSdtIGhpdHRpbmcgYSBib290IGhhbmcgaW4gdGV4
dCBwYXRjaGluZywgd2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkIG9uCj4gNi44LXJjMi4gSVBJIGlz
c3Vlcz8KCk5vdCB0ZXh0IHBhdGNoaW5nISBPbmUgY3B1IHNwaW5uaW5nIGluIHNtcF9jYWxsX2Z1
bmN0aW9uX21hbnlfY29uZCgpIGFuZAp0aGUgb3RoZXJzIGFyZSBpbiBjcHVfcmVsYXgoKS4gU21l
bGxzIGxpa2UgSVBJLi4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
