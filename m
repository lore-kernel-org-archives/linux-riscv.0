Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06C0CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8twJmgJVCcbOUTcGlnUsiND1YnJ+pr10tBb1YrmaBY=; b=E5ZQu9A5epoW1t
	DiSAMpR7x58xrltRPUhQ6PatEBXX8ywGLvySAjbcr8s1XbXineB/o5kstP1Egd2ca5A4pw15LhqGS
	e/z1xJy3yCsPEwjdqfX8Jp7GAXD3+oaL/KgPqro048cudiObDsoKb2PcZVlWJFu8zLxoffBkxo14v
	TWjoc1IZG9YypALdkYqlbNo8jDP7Bm8PGOWs5vvZuzj/OSy9XOszFL2S3lNjRKm7g3xeoJmStu1/L
	Uj2h9b8rRFeGgyuYHnaoXdVs8cmQg4kEiR7oW9W4y7nyBIDu3bX4TwOUbODOuUQbYbq1jgEbE8ddY
	wImYkg06xNlKMk3q0rFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiNy-0000000351L-487S;
	Fri, 16 Oct 2026 13:54:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiNx-00000003513-33rj
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 13:54:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B2EC43558;
	Fri, 16 Oct 2026 13:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD051F000C4;
	Fri, 16 Oct 2026 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792158853;
	bh=UHZ/SHeI8w1oYO+zDsaR5bIADkRvUH7sd5yA2nNqtU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BDvVlEj18Fklfc/VqD+6Eum/IA/ddvxz+BekUEvaIyeg4vLk93kPYxzBlPFKgYea5
	 EqSexdKDxu+7fHF+Lyw1CYqMlzgBhzlMEE9i6uOZRVoKecxXGXIDuKtX1w1s8iXlVY
	 DbL6IeqsY9MkmdpH+Kpg37t5I5RGJ98OAk90pyIgrjs0+jE5pm5M/xLfK4aHBRSXqr
	 vNmh3UruVyOBPtXs88qxmzU9EP5j5OGctddYRtYD8kmNfBLHkueVTqaF92c23jgOyz
	 DC2n8hnxZ0FKF1t8yNvipuQS6dPcgEYpXiu2KKlc3K98p3OIIkFXZsD2kEr482gJNF
	 WjNJ149Cf70aw==
Message-ID: <f052b1b3-87fe-48e6-aa02-df47517ef8d0@kernel.org>
Date: Fri, 16 Oct 2026 15:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261014110429.52762-1-hal.feng@starfivetech.com>
 <20261014110429.52762-2-hal.feng@starfivetech.com>
 <9c0737d8-455d-4025-8482-950b64029f35@kernel.org>
 <atCos9UIaZoRs4N8@monoceros> <20261015-poised-modest-leech-4decf5@quoll>
 <atH4DnTWVZPkaO2C@monoceros>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <atH4DnTWVZPkaO2C@monoceros>
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

T24gMTYvMTAvMjAyNiAxNDo1NSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gS3J6
eXN6dG9mLAo+IAo+IE9uIFRodSwgT2N0IDE1LCAyMDI2IGF0IDEyOjI3OjE2UE0gKzAyMDAsIEty
enlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIFRodSwgT2N0IDE1LCAyMDI2IGF0IDEyOjIw
OjU0UE0gKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+Pj4gSGVsbG8gS3J6eXN6dG9m
LAo+Pj4KPj4+IE9uIFRodSwgT2N0IDE1LCAyMDI2IGF0IDExOjAxOjI5QU0gKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4gT24gMTQvMTAvMjAyNiAxMzowNCwgSGFsIEZlbmcg
d3JvdGU6Cj4+Pj4+IFJlbW92ZSB0aGUgamg4MTAwIGNvbXBhdGlibGUgc2luY2UgdGhlIEpIODEw
MCBTb0MgaGFzIGJlZW4gY2FuY2VsZWQgYW5kCj4+Pj4+IHdpbGwgbm90IGJlIHJlbGVhc2VkLgo+
Pj4+Pgo+Pj4+PiBDaGFuZ2UgdGhlIHJlZ2lzdGVyIHNpemUgaW4gZXhhbXBsZXMgdG8gMHgxMCwg
c2luY2UgYW4gT3BlbkNvcmVzIFBUQyBJUAo+Pj4+PiBoYXMgb25seSA0IDMyLWJpdCByZWdpc3Rl
cnM6IENOVFIsIEhSQywgTFJDIGFuZCBDVFJMLgo+Pj4+Pgo+Pj4+PiBJIHdpbGwgbWFpbnRhaW4g
dGhpcyBwd20gbW9kdWxlIGluIHBsYWNlIG9mIFdpbGxpYW0uCj4+Pj4+Cj4+Pj4+IFRlc3RlZC1i
eTogTWF1ZCBTcGllcmluZ3MgPG1hdWRfc3BpZXJpbmdzQGhvdG1haWwuY29tPgo+Pj4+Cj4+Pj4g
RHJvcCwgZGlkIG5vdCBoYXBwZW4uIElzIGl0IHNvIHRyaWNreSB0byByZXNwb25kIHRvIHRoZSBv
bmUgcGF0Y2ggaGVyZSwKPj4+PiB3aGVyZSB0aGUgdGFnIHdvdWxkIGJlIGFwcGxpY2FibGUsIGlu
c3RlYWQgb2YgcmVwbHlpbmcgdG8gY292ZXIgbGV0dGVyPwo+Pj4KPj4+IEkgZG9uJ3Qga25vdyB3
aGF0IE1hdWQgZGlkLCBidXQgaWYgdGhleSBjaGVja2VkIHRoYXQgdGhlIHZhcmlvdXMgZHQKPj4+
IGxpbnRlcnMgYXJlIHN0aWxsIGhhcHB5LCB0aGF0IGRvZXNuJ3QgZGVzZXJ2ZSBhIFRlc3RlZC1i
eTo/Cj4+Cj4+IE5vLiBXaHkgd291bGQgY29tcGlsYXRpb24gYmUgY2FsbGVkIHRlc3Rpbmc/Cj4g
Cj4gSSdkIGNhbGwgdGhlIHRhc2sgb2YgY2hlY2tpbmcgaWYgYW55dGhpbmcgYnJlYWtzIHdpdGgg
dGhlIHByb3Bvc2VkCj4gY2hhbmdlcyB0ZXN0aW5nLiBGb3IgY2hhbmdlcyB0byAuYyBmaWxlcyB0
aGF0IG1vc3QgbGlrZWx5IHJlcXVpcmVzCj4gY29tcGxpbGF0aW9uIGFuZCBydW5uaW5nIHRoZSBy
ZXN1bHRpbmcgY29kZSBvbiBhIG1hY2hpbmUuIEZvciBkdCBiaW5kaW5nCj4gY2hhbmdlcyBpdCBt
ZWFucyAidGVzdGluZyIgaWYgYWxsIHRoZSBleGlzdGluZyBkZXZpY2UgdHJlZXMgc3RpbGwKPiBj
b25mb3JtIHRvIHRoZSBuZXcgYmluZGluZyBiZWNhdXNlIHlvdSBjYW5ub3QgY29tcGlsZSBhbmQg
cnVuIHRoZQo+IGJpbmRpbmcgc3BlY2lmaWNhdGlvbnMuIFNvIGluIG15IG1pbmQgdGhpcyBpcyBz
dGlsbCB0ZXN0aW5nIGFuZCBhCj4gVGVzdGVkLWJ5IHRyYWlsZXIgaXMgb2sgYW5kIHdlbGNvbWUg
Zm9yIG1lLgoKUnVubmluZyBzdGFuZGFyZCBidWlsZCBwcm9jZXNzIHRvb2xzLCBsaWtlIGNoZWNr
cGF0Y2gsIHNwYXJzZSwKZ2NjL2NsYW5nLCBkdC12YWxpZGF0ZSBpcyBub3QgdGVzdGluZy4KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
