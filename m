Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1F6C87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yektv+U3337FwEnOeIDdaxCl/9gEjuJk4/TS5/K/OzA=; b=b4NUC6QkHO8X63
	839wgR+qx71nV2EjT0nZ6q9V/mZdMDITXujAWUy2wdDMmEDgqVV/sfw1z/NxfmLk5CYI95yi7TZ42
	YxDBfduA861ZJM2AY+gggeonft9q4TtAH8OX2Zpu9IQRnLjCPlpP+jl2V433RezSTya8jawAsKyrx
	AXPsWAEGnoAi/zd3GlVaCTUFUtg4R3CYa1wtyAguR2VnMZEXF8l77iJlLQ+DidqFon5/S78t+S7UK
	lzU4Y7VRCCNapTTe26zKc23xJjFELKkVubQDHrWLaDEcyVE4WPL4/JX2BXeAT99T6Uh7slbTvRSAZ
	ZpgtrnBpqhkQAzyVDSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTFD-00000003gQa-3GHE;
	Thu, 31 Jul 2025 13:22:51 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTFA-00000003gQD-2lfe
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 13:22:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19E654427A;
	Thu, 31 Jul 2025 13:22:43 +0000 (UTC)
Message-ID: <07628b61-ba33-49e7-80e9-d9c5312997fe@ghiti.fr>
Date: Thu, 31 Jul 2025 15:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] riscv: minor thread_info.cpu improvements
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Deepak Gupta <debug@rivosinc.com>
References: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejieeuudejieekveeutdeguefhkeduledugeevhefffeejudeggedufffgleeugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmeejvggtkeemheehugdtmeegfhdvvdemieegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdegmegtvggttdemuddtjeefmegslegsgeemjegvtgekmeehhegutdemgehfvddvmeeigedvkedphhgvlhhopeglkffrggeimedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmeejvggtkeemheehugdtmeegfhdvvdemieegvdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprhhkrhgtmhgrrhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepuggvsghughesrhhivhhoshhinhgtrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_062248_849019_06563A41 
X-CRM114-Status: GOOD (  10.16  )
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

SGkgUmFkaW0sCgpPbiA3LzI1LzI1IDE4OjU0LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gSGVs
bG8sCj4KPiBJIG5vdGljZWQgdGhhdCB3ZSBnaXZlIHRocmVhZF9pbmZvLmNwdSB0d28gZGlmZmVy
ZW50IG5hbWVzIGluIHRoZQo+IGFzc2VtYmx5LCBsb2FkIGl0IGFzIGEgd2lkZXIgdHlwZSwgYW5k
IHN0b3JlIGl0IHN1Ym9wdGltYWxseS4KPgo+IHYyIGlzIHNwbGl0IGZvciBlYXN5IGJhY2twb3J0
aW5nLgo+Cj4gVGhhbmtzLgo+Cj4gdjI6Cj4gKiB0cmFuc2Zvcm0gW3YxIDIvM10gaW50byBbdjIg
MS0yLzRdIHRvIHNpbXBsaWZ5IGJhY2twb3J0cyBbQWxleF0KPiAqIHRlc3RlZCBhbmQgcmV2aWV3
ZWQgYnkgQWxleAo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwNzIyMTYw
NTU2LjIyMTY5MjUtMi1ya3JjbWFyQHZlbnRhbmFtaWNyby5jb20vCj4KPiBSYWRpbSBLcsSNbcOh
xZkgKDQpOgo+ICAgIHJpc2N2OiB1c2UgbHcgd2hlbiByZWFkaW5nIGludCBjcHUgaW4gbmV3X3Zt
YWxsb2NfY2hlY2sKPiAgICByaXNjdjogdXNlIGx3IHdoZW4gcmVhZGluZyBpbnQgY3B1IGluIGFz
bV9wZXJfY3B1Cj4gICAgcmlzY3Y6IHVzZSBUQVNLX1RJX0NQVSBpbnN0ZWFkIG9mIFRBU0tfVElf
Q1BVX05VTQo+ICAgIHJpc2N2OiBwYWNrIHJ2NjQgdGhyZWFkX2luZm8gYmV0dGVyCj4KPiAgIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggICAgICAgICB8IDIgKy0KPiAgIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8IDIgKy0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL2Fz
bS1vZmZzZXRzLmMgICAgICB8IDEgLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAg
ICAgICAgIHwgMiArLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4KClRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BpbiwgSSdsbCB0YWtlIHRoYXQg
Zm9yIDYuMTcuCgpUaGFua3MsCgpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
