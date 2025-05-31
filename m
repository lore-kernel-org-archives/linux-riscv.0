Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D390C5B549
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovhUCA5MEfRs8QzEJusHO0rls9vr3LgpRQyzTv/BMew=; b=Iwn/7UkCXeqZY4
	AyhklNSpiNdMn/eggQctZa1yfQwXhFce9Ja2MHSWGSyMv86/MRaWyJof2qC0G56KM1emm4ha3QU8a
	BxhNk80/t3Cl1uTX6VeJ/Qx2dtqxSMhXpTA+ivvhhdtWUV9vgFPP5fV+QvUkvYAWz4uy3Mk4WIor3
	R6x/46gMZKhrXBVGTfc6Chc7SiKE0eXL5mxoQwFDB74c7TACPVeWv2MxAgUaqZItAB8eQooVX/FTE
	FYGfxMvP6BafB8GyCJtpkLPUWEuqcp9MFokoGrCKfGiTYOKQ7vWHRORIp7IpS3fgb4nrilHt+CVKq
	/rL/7xI80zSkTx5CO2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLMKK-00000003nev-0HSS;
	Sat, 31 May 2025 13:32:44 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLMKH-00000003ne7-2OQ7
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 13:32:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 380464316C;
	Sat, 31 May 2025 13:32:38 +0000 (UTC)
Message-ID: <1aefb8dc-9145-4cee-b262-7d4212159444@ghiti.fr>
Date: Sat, 31 May 2025 15:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv: misaligned: fix misaligned accesses handling
 in put/get_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250530205658.624195-1-cleger@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefvddtfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepieffvdeiveeuhfegvddvuefhveejhfffudffhfdufeeuudegtdfguddthfetledvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegrfedtkeemieelledtmedvjehfsgemlegrtggrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegrfedtkeemieelledtmedvjehfsgemlegrtggrpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegrfedtkeemieelledtmedvjehfsgemlegrtggrngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfr
 hgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_063241_760097_A134B94E 
X-CRM114-Status: GOOD (  19.99  )
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

T24gNS8zMC8yNSAyMjo1NiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IFdoaWxlIGRlYnVnZ2lu
ZyBhIGZldyBwcm9ibGVtcyB3aXRoIHRoZSBtaXNhbGlnbmVkIGFjY2VzcyBrc2VsZnRlc3QsCj4g
QWxleGFuZHJlIGRpc2NvdmVyZWQgc29tZSBjcmFzaCB3aXRoIHRoZSBjdXJyZW50IGNvZGUuIElu
ZGVlZCwgc29tZQo+IG1pc2FsaWduZWQgYWNjZXNzIHdhcyBkb25lIGJ5IHRoZSBrZXJuZWwgdXNp
bmcgcHV0X3VzZXIoKS4gVGhpcwo+IHdhcyByZXN1bHRpbmcgaW4gdHJhcCBhbmQgYSBrZXJuZWwg
Y3Jhc2ggc2luY2UuIFRoZSBwYXRoIHdhcyB0aGUKPiBmb2xsb3dpbmc6Cj4gdXNlciAtPiBrZXJu
ZWwgLT4gYWNjZXNzIHRvIHVzZXIgbWVtb3J5IC0+IG1pc2FsaWduZWQgdHJhcCAtPiB0cmFwIC0+
Cj4ga2VybmVsIC0+IG1pc2FsaWduZWQgaGFuZGxpbmcgLT4gbWVtY3B5IC0+IGNyYXNoIGR1ZSB0
byBmYWlsZWQgcGFnZSBmYXVsdAo+IHdoaWxlIGluIGludGVycnVwdCBkaXNhYmxlZCBzZWN0aW9u
Lgo+Cj4gTGFzdCBkaXNjdXNzaW9uIGFib3V0IGtlcm5lbCBtaXNhbGlnbmVkIGhhbmRsaW5nIGFu
ZCBpbnRlcnJ1cHQgcmVlbmFibGluZwo+IHdlcmUgYWN0dWFsbHkgbm90IHRvIHJlZW5hYmxlIGlu
dGVycnVwdCB3aGVuIGhhbmRsaW5nIG1pc2FsaWduZWQgYWNjZXNzCj4gYmVpbmcgZG9uZSBieSBr
ZXJuZWwuIFRoZSBiZXN0IHNvbHV0aW9uIGJlaW5nIG5vdCB0byBkbyBhbnkgbWlzYWxpZ25lZAo+
IGFjY2Vzc2VzIHRvIHVzZXJzcGFjZSBtZW1vcnksIHdlIGNvbnNpZGVyZWQgYSBmZXcgb3B0aW9u
czoKPgo+IC0gUmVtb3ZlIGFueSBjYWxsIHRvIHB1dC9nZXRfdXNlcigpIHBvdGllbnRhbGx5IGRv
aW5nIG1pc2FsaWduZWQKPiAgICBhY2Nlc3Nlcwo+IC0gRG8gbm90IGRvIGFueSBtaXNhbGlnbmVk
IGFjY2Vzc2VzIGluIHB1dC9nZXRfdXNlcigpIGl0c2VsZgo+Cj4gVGhlIHNlY29uZCBzb2x1dGlv
biB3YXMgdGhlIG9uZSBjaG9zZW4gYXMgdGhlcmUgYXJlIHRvbyBtYW55IGNhbGxzaXRlIHRvCj4g
cHV0L2dldF91c2VyKCkgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBkbyBtaXNhbGlnbmVkIGFjY2Vz
c2VzLiBXZSB0cmllZAo+IHR3byBhcHByb2FjaGVzIGZvciB0aGF0LCBlaXRoZXIgc3BsaXQgYWNj
ZXNzIGluIHR3byBhbGlnbmVkIGFjY2Vzc2VzCj4gKGFuZCBkbyBSTVcgZm9yIHB1dF91c2VyKCkp
IG9yIGNhbGwgY29weV9mcm9tL3RvX3VzZXIoKSB3aGljaCBkb2VzIG5vdAo+IGRvIGFueSBtaXNh
bGlnbmVkIGFjY2Vzc2VzLiBUaGUgbGF0ZXIgb25lIHdhcyB0aGUgc2ltcGxlciB0byBpbXBsZW1l
bnQKPiAoYWx0aG91Z2ggdGhlIHBlcmZvcm1hbmNlcyBhcmUgcHJvYmFibHkgbG93ZXIgdGhhbiBz
cGxpdCBhbGlnbmVkCj4gYWNjZXNzZXMgYnV0IHN0aWxsIHdheSBiZXR0ZXIgdGhhbiBkb2luZyBt
aXNhbGlnbmVkIGFjY2VzcyBlbXVsYXRpb24pCj4gYW5kIGFsbG93cyB0byBzdXBwb3J0IHdoYXQg
d2Ugd2FudGVkLgo+Cj4gVGhlc2UgY29tbWl0cyBhcmUgYmFzZWQgb24gdG9wIG9mIEFsZXggZGV2
L2FsZXgvZ2V0X3VzZXJfbWlzYWxpZ25lZF92MQo+IGJyYW5jaC4KPgo+IENsw6ltZW50IEzDqWdl
ciAoMik6Cj4gICAgcmlzY3Y6IHByb2Nlc3M6IHVzZSB1bnNpZ25lZCBpbnQgaW5zdGVhZCBvZiB1
bnNpZ25lZCBsb25nIGZvcgo+ICAgICAgcHV0X3VzZXIoKQo+ICAgIHJpc2N2OiB1YWNjZXNzOiBk
byBub3QgZG8gbWlzYWxpZ25lZCBhY2Nlc3NlcyBpbiBnZXQvcHV0X3VzZXIoKQo+Cj4gICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDI4ICsrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgIHwgIDIgKy0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCgpXZSBhbHNv
IG5lZWQgdG8gcHJldmVudCB1bnNhZmUgcm91dGluZXMgdG8gdHJpZ2dlciBtaXNhbGlnbmVkIGFj
Y2Vzc2VzLCAKSSBoYXZlIGEgcGF0Y2ggZm9yIHRoaXMgaGVyZSAKaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4LXJpc2N2L2xpbnV4L2NvbW1pdC83YzE3MjEyMWFlYjIzNWRlZGViNmY1ZTA2NzQwNTI3
NTMwZWRkNmFmCgpDbMOpbWVudCwgY2FuIHlvdSBhZGQgdGhpcyBvbmUgdG8gdGhlIHNlcmllcyBw
bGVhc2U/CgpJIGhhdmUganVzdMKgIHRyaWdnZXJlZCBhIENJIHdpdGggdGhvc2UgZml4ZXMgb24g
dG9wIG9mIG15IHNiaSAzLjAgYnJhbmNoLgoKVGhhbmtzLAoKQWxleAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
