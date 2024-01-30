Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8D0C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9is648DsgGx1jlrkA3ugZZveEVBBl015Q/M7/Zp62rc=; b=ExxVpgLzY0Eo8d
	JMBJnzrmxG027J57T1Z4f0jpgmf8N4hb96RznwCbGsiutntFZ2RERphxS5be+oYJyQhA+7k9nlOXa
	RtBHdPqsKWcv2R/xk/ZOg0VDbFwriPv+t05qgxdQIUUWwIlWZKMvDStKCWTlbLZeyZScJ+tQuDpSc
	6L0jVGrZOIQycY4wuiGNdYwaD1kC4BquZolVicLBa4pZizpdluma67Qf8LKmJAMIzFvYg+aSvIeAJ
	7z7vKgpUVh6m2d6dnnm8+gLHG2CMPYNhoEfMzgVnCPcsmxpRHx7HN6t+QbqmvpZUX27CN0H8Iibdq
	xYG8PUwXCrzH/3bPkHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpPU-0000000H1az-0Mjp;
	Tue, 30 Jan 2024 14:48:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpPQ-0000000H1aB-2bWG;
	Tue, 30 Jan 2024 14:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 157BB60BBB;
	Tue, 30 Jan 2024 14:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B276C433A6;
	Tue, 30 Jan 2024 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706626099;
	bh=dFAmHTWb/k1pUfbCz9xzZr84exg5dJcjVhp+IOIvovc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ccPzonpXZvS27V5JUZNxi0kUahPAKekIQhGPusg5QPgTYp8CfRCxAG1AJZA9N0i5r
	 Smf4s1pkGTIx/Ufs6ChVkqS5oMliJQ1UEcjAIqxXF6qLuh//tbujZ14JO9PQbTL65T
	 zDJ0mpHj5wTLvsVJU2F2rSxwM9qDBF3EOZArP9/fuXWbtQU9SThQ/+iuPREFvBzZtm
	 dYa9E51PI0w/22pMi0A59p+YHzdrg/JwYhbIHgAmjTWUi12o2zxJjZHkh2owElCHQ3
	 hCHMUJqu6ORBj3Q3Pv8WB8yZExflQfLFij3NLdzBQHRaab7VaNrrd/F0yV8LgXQsr0
	 wUcASiikCITfg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc
 Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <87cytjvybb.fsf@all.your.base.are.belong.to.us>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87r0hzuw87.fsf@all.your.base.are.belong.to.us>
 <87le87uulb.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UYCKUBKggtM606orH2mBu_AbTdB5-R5AP1M0t-LsEbEQ@mail.gmail.com>
 <87cytjvybb.fsf@all.your.base.are.belong.to.us>
Date: Tue, 30 Jan 2024 15:48:16 +0100
Message-ID: <87ttmuq3m7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_064820_772077_E26519E1 
X-CRM114-Status: GOOD (  18.92  )
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
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+Cj4+IE9uIFR1ZSwgSmFuIDMwLCAyMDI0
IGF0IDE6MjLigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPj4+
Cj4+PiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4+Pgo+Pj4gPiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+Pj4gPgo+Pj4gPj4g
VGhlIFJJU0MtViBBSUEgc3BlY2lmaWNhdGlvbiBpcyByYXRpZmllZCBhcy1wZXIgdGhlIFJJU0Mt
ViBpbnRlcm5hdGlvbmFsCj4+PiA+PiBwcm9jZXNzLiBUaGUgbGF0ZXN0IHJhdGlmaWVkIEFJQSBz
cGVjaWZjYXRpb24gY2FuIGJlIGZvdW5kIGF0Ogo+Pj4gPj4gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3Jpc2N2LWFpYS9yZWxlYXNlcy9kb3dubG9hZC8xLjAvcmlzY3YtaW50ZXJydXB0cy0xLjAu
cGRmCj4+PiA+Pgo+Pj4gPj4gQXQgYSBoaWdoLWxldmVsLCB0aGUgQUlBIHNwZWNpZmljYXRpb24g
YWRkcyB0aHJlZSB0aGluZ3M6Cj4+PiA+PiAxKSBBSUEgQ1NScwo+Pj4gPj4gICAgLSBJbXByb3Zl
ZCBsb2NhbCBpbnRlcnJ1cHQgc3VwcG9ydAo+Pj4gPj4gMikgSW5jb21pbmcgTWVzc2FnZSBTaWdu
YWxlZCBJbnRlcnJ1cHQgQ29udHJvbGxlciAoSU1TSUMpCj4+PiA+PiAgICAtIFBlci1IQVJUIE1T
SSBjb250cm9sbGVyCj4+PiA+PiAgICAtIFN1cHBvcnQgTVNJIHZpcnR1YWxpemF0aW9uCj4+PiA+
PiAgICAtIFN1cHBvcnQgSVBJIGFsb25nIHdpdGggdmlydHVhbGl6YXRpb24KPj4+ID4+IDMpIEFk
dmFuY2VkIFBsYXRmb3JtLUxldmVsIEludGVycnVwdCBDb250cm9sbGVyIChBUExJQykKPj4+ID4+
ICAgIC0gV2lyZWQgaW50ZXJydXB0IGNvbnRyb2xsZXIKPj4+ID4+ICAgIC0gSW4gTVNJLW1vZGUs
IGNvbnZlcnRzIHdpcmVkIGludGVycnVwdCBpbnRvIE1TSXMgKGkuZS4gTVNJIGdlbmVyYXRvcikK
Pj4+ID4+ICAgIC0gSW4gRGlyZWN0LW1vZGUsIGluamVjdHMgZXh0ZXJuYWwgaW50ZXJydXB0cyBk
aXJlY3RseSBpbnRvIEhBUlRzCj4+PiA+Pgo+Pj4gPj4gRm9yIGFuIG92ZXJ2aWV3IG9mIHRoZSBB
SUEgc3BlY2lmaWNhdGlvbiwgcmVmZXIgdGhlIEFJQSB2aXJ0dWFsaXphdGlvbgo+Pj4gPj4gdGFs
ayBhdCBLVk0gRm9ydW0gMjAyMjoKPj4+ID4+IGh0dHBzOi8vc3RhdGljLnNjaGVkLmNvbS9ob3N0
ZWRfZmlsZXMva3ZtZm9ydW0yMDIyL2ExL0FJQV9WaXJ0dWFsaXphdGlvbl9pbl9LVk1fUklTQ1Zf
ZmluYWwucGRmCj4+PiA+PiBodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PXIwNzFkTDha
MHlvCj4+PiA+Pgo+Pj4gPj4gVG8gdGVzdCB0aGlzIHNlcmllcywgdXNlIFFFTVUgdjcuMiAob3Ig
aGlnaGVyKSBhbmQgT3BlblNCSSB2MS4yIChvciBoaWdoZXIpLgo+Pj4gPj4KPj4+ID4+IFRoZXNl
IHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gdGhlIHJpc2N2X2FpYV92MTIgYnJhbmNoIGF0
Ogo+Pj4gPj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4+PiA+Pgo+Pj4g
Pj4gQ2hhbmdlcyBzaW5jZSB2MTE6Cj4+PiA+PiAgLSBSZWJhc2VkIG9uIExpbnV4LTYuOC1yYzEK
Pj4+ID4+ICAtIEluY2x1ZGVkIGtlcm5lbC9pcnEgcmVsYXRlZCBwYXRjaGVzIGZyb20gImdlbmly
cSwgaXJxY2hpcDogQ29udmVydCBBUk0KPj4+ID4+ICAgIE1TSSBoYW5kbGluZyB0byBwZXIgZGV2
aWNlIE1TSSBkb21haW5zIiBzZXJpZXMgYnkgVGhvbWFzLgo+Pj4gPj4gICAgKFBBVENINywgUEFU
Q0g4LCBQQVRDSDksIFBBVENIMTQsIFBBVENIMTYsIFBBVENIMTcsIFBBVENIMTgsIFBBVENIMTks
Cj4+PiA+PiAgICAgUEFUQ0gyMCwgUEFUQ0gyMSwgUEFUQ0gyMiwgUEFUQ0gyMywgYW5kIFBBVENI
MzIgb2YKPj4+ID4+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVs
LzIwMjIxMTIxMTM1NjUzLjIwODYxMTIzM0BsaW51dHJvbml4LmRlLykKPj4+ID4+ICAtIFVwZGF0
ZWQgQVBMSUMgTVNJLW1vZGUgZHJpdmVyIHRvIHVzZSB0aGUgbmV3IFdJUkVEX1RPX01TSSBtZWNo
YW5pc20uCj4+PiA+PiAgLSBVcGRhdGVkIElNU0lDIGRyaXZlciB0byBzdXBwb3J0IHBlci1kZXZp
Y2UgTVNJIGRvbWFpbnMgZm9yIFBDSSBhbmQKPj4+ID4+ICAgIHBsYXRmb3JtIGRldmljZXMuCj4+
PiA+Cj4+PiA+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLCBBbnVwISBJJ20gc3RpbGwgcmV2
aWV3aW5nIHRoZSBwYXRjaGVzLgo+Pj4gPgo+Pj4gPiBJJ20gaGl0dGluZyBhIGJvb3QgaGFuZyBp
biB0ZXh0IHBhdGNoaW5nLCB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgb24KPj4+ID4gNi44LXJj
Mi4gSVBJIGlzc3Vlcz8KPj4+Cj4+PiBOb3QgdGV4dCBwYXRjaGluZyEgT25lIGNwdSBzcGlubmlu
ZyBpbiBzbXBfY2FsbF9mdW5jdGlvbl9tYW55X2NvbmQoKSBhbmQKPj4+IHRoZSBvdGhlcnMgYXJl
IGluIGNwdV9yZWxheCgpLiBTbWVsbHMgbGlrZSBJUEkuLi4KPj4KPj4gSSB0cmllZCBib290ZWZp
IGZyb20gVS1Cb290IG11bHRpcGxlIHRpbWVzIGJ1dCBjYW4ndCByZXByb2R1Y2UgdGhlCj4+IGlz
c3VlIHlvdSBhcmUgc2VlaW5nLgo+Cj4gVGhhbmtzISBJIGNhbiByZXByb2R1Y2Ugd2l0aG91dCBF
RkksIGFuZCBzaW1wbGVyIGNvbW1hbmQtbGluZToKPgo+IHFlbXUtc3lzdGVtLXJpc2N2NjQgXAo+
ICAgLWJpb3MgL3BhdGgvdG8vZndfZHluYW1pYy5iaW4gXAo+ICAgLWtlcm5lbCAvcGF0aC90by9J
bWFnZSBcCj4gICAtYXBwZW5kICdlYXJseWNvbiBjb25zb2xlPXR0eTAgY29uc29sZT10dHlTMCcg
XAo+ICAgLW1hY2hpbmUgdmlydCxhaWE9YXBsaWMtaW1zaWMgXAo+ICAgLW5vLXJlYm9vdCAtbm9k
ZWZhdWx0cyAtbm9ncmFwaGljIFwKPiAgIC1zbXAgNCBcCj4gICAtb2JqZWN0IHJuZy1yYW5kb20s
ZmlsZW5hbWU9L2Rldi91cmFuZG9tLGlkPXJuZzAgXAo+ICAgLWRldmljZSB2aXJ0aW8tcm5nLWRl
dmljZSxybmc9cm5nMCBcCj4gICAtbSA0RyAtY2hhcmRldiBzdGRpbyxpZD1jaGFyMCAtc2VyaWFs
IGNoYXJkZXY6Y2hhcjAKPgo+IEkgY2FuIHJlcHJvZHVjZSB3aXRoIHlvdXIgdXBzdHJlYW0gcmlz
Y3ZfYWlhX3YxMiBwbHVzIHRoZSBjb25maWcgaW4gdGhlCj4gZ2lzdCBbMV0sIGFuZCBhbGwgbGF0
ZXN0IFFFTVUvT3BlblNCSToKPgo+IFFFTVU6IDExYmU3MDY3N2M3MCAoIk1lcmdlIHRhZyAncHVs
bC12ZmlvLTIwMjQwMTI5JyBvZiBodHRwczovL2dpdGh1Yi5jb20vbGVnb2F0ZXIvcWVtdSBpbnRv
IHN0YWdpbmciKQo+IE9wZW5TQkk6IGJiOTBhOWViZjZkOSAoImxpYjogc2JpOiBQcmludCBudW1i
ZXIgb2YgZGVidWcgdHJpZ2dlcnMgZm91bmQiKQo+IExpbnV4OiBkOWI5ZDZlYjk4N2YgKCJNQUlO
VEFJTkVSUzogQWRkIGVudHJ5IGZvciBSSVNDLVYgQUlBIGRyaXZlcnMiKQo+Cj4gUmVtb3Zpbmcg
IixhaWE9YXBsaWMtaW1zaWMiIGZyb20gdGhlIENMSSBhYm92ZSBjb21wbGV0ZXMgdGhlIGJvb3Qg
KGkuZS4KPiBwYW5pY2tpbmcgYWJvdXQgbWlzc2luZyByb290IG1vdW50IDstKSkKCk1vcmUgY29u
dGV4dDsgVGhlIGhhbmcgaXMgZHVyaW5nIGEgbGF0ZSBpbml0Y2FsbCwgd2hlcmUgYW4gZnRyYWNl
IGRpcmVjdAoocmVnaXN0ZXJfZnRyYWNlX2RpcmVjdCgpKSBtb2RpZmljYXRpb24gaXMgZG9uZS4K
ClN0b3AgbWFjaGluZSBpcyB1c2VkIHRvIGNhbGwgaW50byBfX2Z0cmFjZV9tb2RpZnlfY2FsbCgp
LiBUaGVuIGludG8gdGhlCmFyY2ggc3BlY2lmaWMgcGF0Y2hfdGV4dF9ub3N5bmMoKSwgd2hlcmUg
Zmx1c2hfaWNhY2hlX3JhbmdlKCkgaGFuZ3MgaW4KZmx1c2hfaWNhY2hlX2FsbCgpLiBGcm9tICJv
bl9lYWNoX2NwdShpcGlfcmVtb3RlX2ZlbmNlX2ksIE5VTEwsIDEpOyIgdG8Kb25fZWFjaF9jcHVf
Y29uZF9tYXNrKCkgInNtcF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZChtYXNrLCBmdW5jLCBpbmZv
LApzY2ZfZmxhZ3MsIGNvbmRfZnVuYyk7IiB3aGljaCBuZXZlciByZXR1cm5zIGZyb20gImNzZF9s
b2NrX3dhaXQoY3NkKSIKcmlnaHQgYmVmb3JlIHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uLgoKQW55
IGlkZWFzPyBEaXNhYmxpbmcgQ09ORklHX0hJRF9CUEYsIHRoYXQgZG9lcyB0aGUgZWFybHkgZnRy
YWNlIGNvZGUKcGF0Y2hpbmcgZml4ZXMgdGhlIGJvb3QgaGFuZywgYnV0IGl0IGRvZXMgc2VlbSBy
ZWxhdGVkIHRvIElQSS4uLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
