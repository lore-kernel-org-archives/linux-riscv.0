Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935BCC001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 18:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdLx8lf2Q9SyCyFX1/9BcNSwCwvBDEkG2CY11uYXtPQ=; b=pGzVou5erpZO2A
	ggqCUxZYh7ltvLHVeJx04I/p7LP53NziPHKIKCW47QwcHb4zu3v8TEf3OXncPqd3KXDl0uPUeZLvv
	IA7vwrrKkBGyQJ1FKherHoFfpzFeO/Y3GFJwbO7wPnHd7dzUIBNktIBTUH5c+L4bRawWwzpJ+tkED
	s95oRtxbwJZrHcNQPy3dRDyk7gPp36tnkz4Ecern3eQ4nQL/71eAyg0XzM0+Zj/v2V+wcdLpjTRfX
	oFBijEyYNaySOcs5IIYD2z+sa7A/pIAl0E7MzE1T8ykxfjYpjhlds2tanoNxpHBjla8h7ymz4pSGe
	FUI+Dx32fW3AXFhb5Irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1Lr-0049mP-1g;
	Thu, 13 Jul 2023 18:47:43 +0000
Received: from 5.mo561.mail-out.ovh.net ([87.98.178.36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1Lm-0049j8-38
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 18:47:42 +0000
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.138.54])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 48BAB28B9C
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 18:47:32 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ll5js (unknown [10.110.208.235])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 214551FD1C;
	Thu, 13 Jul 2023 18:47:30 +0000 (UTC)
Received: from courmont.net ([37.59.142.98])
	by ghost-submission-6684bf9d7b-ll5js with ESMTPSA
	id R5OjJ8JGsGQyHAAAEDQwfg
	(envelope-from <remi@remlab.net>); Thu, 13 Jul 2023 18:47:30 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R00236ae8aec-208f-46c7-b74a-d935183a2d69,
                    E825627045B7043E7B61682BD01F96CE19757E2A) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, heiko@sntech.de, charlie@rivosinc.com,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property on T-Head
 CPUs
Date: Thu, 13 Jul 2023 21:47:29 +0300
Message-ID: <1855588.tdWV9SEqCh@basile.remlab.net>
Organization: Remlab
In-Reply-To: <ZLAoIWX+qqWvucWz@xhacker>
References: <20230712-postal-affiliate-0d61a209897f@spud> <ZLAoIWX+qqWvucWz@xhacker>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5099200679956388129
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrfeeggdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeftrohmihcuffgvnhhishdqvehouhhrmhhonhhtuceorhgvmhhisehrvghmlhgrsgdrnhgvtheqnecuggftrfgrthhtvghrnhepuefhgeeffedvfeeuteelfeffudeuvdejfeehudeukeeiledtteeuteeuuefgveffnecuffhomhgrihhnpehrvghmlhgrsgdrnhgvthenucfkphepuddvjedrtddrtddruddpkeejrdelvddrudelgedrkeekpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_114739_333855_9C9178F2 
X-CRM114-Status: GOOD (  15.36  )
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

TGUgdG9yc3RhaW5hIDEzLiBoZWluw6RrdXV0YSAyMDIzLCAxOS4zNi40OSBFRVNUIEppc2hlbmcg
WmhhbmcgYSDDqWNyaXQgOgo+IE9uIFdlZCwgSnVsIDEyLCAyMDIzIGF0IDA2OjQ4OjAyUE0gKzAx
MDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPgo+ID4gCj4gPiBUaGUgbGFzdCBtZXJnZSB3aW5kb3cgY29udGFpbmVkIGJv
dGggViBzdXBwb3J0IGFuZCB0aGUgZGVwcmVjYXRpb24gb2YKPiA+IHRoZSByaXNjdixpc2EgRFQg
cHJvcGVydHksIHdpdGggdGhlIFYgaW1wbGVtZW50YXRpb24gcmVhZGluZyByaXNjdixpc2EKPiA+
IHRvIGRldGVybWluZSB0aGUgcHJlc2VuY2Ugb2YgdGhlIFYgZXh0ZW5zaW9uLiAgQXQgdGhlIHRp
bWUgdGhhdCB3YXMgdGhlCj4gPiBvbmx5IHdheSB0byBkbyBpdCwgYnV0IHRoZXJlJ3MgYSBsb3Qg
b2YgYW1iaWd1aXR5IGFyb3VuZCBWIGluIElTQQo+ID4gc3RyaW5ncy4gIEluIHBhcnRpY3VsYXIs
IHRoZXJlIGlzIGEgbG90IG9mIGZpcm13YXJlIGluIHRoZSB3aWxkIHRoYXQKPiA+IHVzZXMgInYi
IGluIHRoZSByaXNjdixpc2EgRFQgcHJvcGVydHkgdG8gY29tbXVuaWNhdGUgc3VwcG9ydCBmb3Ig
dGhlCj4gPiAwLjcuMSB2ZXJzaW9uIG9mIHRoZSBWZWN0b3Igc3BlY2lmaWNhdGlvbiBpbXBsZW1l
bnRlZCBieSBULUhlYWQgQ1BVCj4gPiBjb3Jlcy4KPiAKPiBBZGQgR3VvCj4gCj4gSGkgQ29ub3Is
IFBhbG1lciwKPiAKPiBGV0lDVCwgbmV3IFQtSEVBRCdzIHJpc2N2IGNvcmVzIHN1Y2ggYXMgQzkw
OCBzdXBwb3J0IHN0YW5kYXJkIFJWVi0xLjAsCj4gdGhpcyBwYXRjaCBsb29rcyBsaWtlIGEgYmln
IGhhbW1lciBmb3IgVC1IRUFELiBJIGRvIHVuZGVyc3RhbmQgd2h5Cj4gdGhpcyBwYXRjaCBpcyBw
cm92aWRlZCwgYnV0IGNhbiB3ZSBtaXRpZ2F0ZSB0aGUgc2l0dWF0aW9uIGJ5IGNhcmVmdWxseQo+
IHJldmlldyB0aGUgRFRzPwoKVGhlcmUgYXJlIG1hbnkgdHJpY2tzIHRvIGRldGVjdCB0aGF0IFJW
ViBpcyBwcmVzZW50IGJ1dCBub25jb21mb3JtYW50IGF0IHJ1bi0KdGltZS4gSWYgdGhlIGtlcm5l
bCBjYW4gYXQgbGVhc3QgdGVtcG9yYXJpbHkgZW5hYmxlIFYgdG8gbWFrZSB0aGUgY2hlY2ssIHRo
ZSAKZXhhbXBsZSBiZWxvdyB3b3Jrcy4gQ29udmVydGluZyB0aGUgdXNlci1zcGFjZSBjb25zb2xl
IHByb2dyYW0gdG8gYSBrZXJuZWwgCmZ1bmN0aW9uIGlzIGxlZnQgYXMgYW4gZXhlcmNpc2UgdG8g
dGhlIHJlYWRlcjoKCi0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0t
ODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0KI2luY2x1ZGUgPHN0ZGlvLmg+CgppbnQgbWFpbih2
b2lkKQp7CiAgICAgICAgbG9uZyB2dHlwZTsKCiAgICAgICAgX19hc21fXyAoCiAgICAgICAgICAg
ICAgICAidnNldHZsaSB6ZXJvLCB6ZXJvLCBlOCwgbTEsIHRhLCBtYVxuIgogICAgICAgICAgICAg
ICAgImNzcnIgICAlMSwgdnR5cGVcbiIgOiAiPXIiICh2dHlwZSkgOiAiciIgKDB4QzApKTsKCiAg
ICAgICAgaWYgKHZ0eXBlIDwgMCkKICAgICAgICAgICAgICAgIHB1dHMoIlJWViAwLjcuMSIpOwog
ICAgICAgIGVsc2UKICAgICAgICAgICAgICAgIHB1dHMoIlJWViAxLjArIik7CgogICAgICAgIHJl
dHVybiAwOwp9Ci0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwt
LS0tLS0tLTg8LS0tLS0tLS04PC0tLS0KClRoZSB0cmljayBoZXJlIGlzIHRoYXQgdGhlIHZlY3Rv
ciBjb25maWd1cmF0aW9uIGlzIHZhbGlkIGZvciBSVlYgMS4wLCBidXQgbm90IApmb3IgUlZWIDAu
Ny4xIHNvIHRoZSBzaWduL2lsbGVnYWwgYml0IGdldHMuCgotLSAKUsOpbWkgRGVuaXMtQ291cm1v
bnQKaHR0cDovL3d3dy5yZW1sYWIubmV0LwoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
