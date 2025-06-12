Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D40C71143
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/g1NCBJcvQ5Rs/XfPlKcDs/3RlEIh9Sxhg91prGfCc=; b=gxtOQe+UcBXPuH
	/HWI4IluiWSOV/qWITawI0exXgQhJAdQRIGkrwZ4rjfpngXa+LLInNkazG+7nLQ5M1z3xW7VX4p16
	PPnjHsqGiDQFYMiWapRTjzz9omA1W7BvR2vEbSVIWv9mdY/46+fZKYa/rguQExv/KIRzC5kJJ3aF7
	Y56LCZKhxlYirZAbpcWRluYUEKWx/gYc3leYXsrK1MsCSPcuKtr5UhwrzQanuqdn9bhEDwZ71jP6X
	904ERXa3FmwkZ2pIEyCMAzVC/nJg7pyIjoNB4ba0Nq3pBad7GfVY3I8f7u+bFMv6VaCkCnD2o2EYI
	9C9UsePg0NKcjHgWknmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPedB-0000000CsNU-44Mu;
	Thu, 12 Jun 2025 09:53:57 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdLL-0000000CdP0-1Ec9
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 08:31:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 874C9424BB;
	Thu, 12 Jun 2025 08:31:20 +0000 (UTC)
Message-ID: <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
Date: Thu, 12 Jun 2025 10:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveekjeefjefgieekteefffevteeigfdvgfehgfejfeekgedvkedvledvtefggedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhnuhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehpr
 ghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_013127_460684_81BDD427 
X-CRM114-Status: GOOD (  18.51  )
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

SGkgVGhvbWFzLAoKT24gNi8xMS8yNSAxMToyMiwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4g
QWxsIHZEU08gY29kZSBuZWVkcyB0byBiZSBjb21wbGV0ZWx5IHBvc2l0aW9uIGluZGVwZW5kZW50
Lgo+IFN5bWJvbCByZWZlcmVuY2VzIGFyZSBtYXJrZWQgYXMgaGlkZGVuIHNvIHRoZSBjb21waWxl
ciBlbWl0cwo+IFBDLXJlbGF0aXZlIHJlbG9jYXRpb25zLiBIb3dldmVyIHRoZXJlIGFyZSBjYXNl
cyB3aGVyZSB0aGUgY29tcGlsZXIgbWF5Cj4gc3RpbGwgZW1pdCBhYnNvbHV0ZSByZWxvY2F0aW9u
cywgYXMgdGhleSBhcmUgdmFsaWQgaW4gcmVndWxhciBQSUMgRFNPIGNvZGUuCj4gVGhlc2Ugd291
bGQgYmUgcmVzb2x2ZWQgYnkgdGhlIGxpbmtlciBhbmQgd2lsbCBicmVhayBhdCBydW50aW1lLgo+
IFRoaXMgaGFzIGJlZW4gb2JzZXJ2ZWQgb24gYXJtNjQgdW5kZXIgc29tZSBjaXJjdW1zdGFuY2Vz
LCBzZWUKPiBjb21taXQgMGMzMTRjZGE5MzI1ICgiYXJtNjQ6IHZkc286IFdvcmsgYXJvdW5kIGlu
dmFsaWQgYWJzb2x1dGUgcmVsb2NhdGlvbnMgZnJvbSBHQ0MiKQo+Cj4gSW50cm9kdWNlIGEgYnVp
bGQtdGltZSBjaGVjayBmb3IgYWJzb2x1dGUgcmVsb2NhdGlvbnMuCj4gVGhlIGNoZWNrIGlzIGRv
bmUgb24gdGhlIG9iamVjdCBmaWxlcyBhcyB0aGUgcmVsb2NhdGlvbnMgd2lsbCBub3QgZXhpc3QK
PiBhbnltb3JlIGluIHRoZSBmaW5hbCBEU08uIEFzIHRoZXJlIGlzIG5vIGV4dGVuc2lvbiBwb2lu
dCBmb3IgdGhlCj4gY29tcGlsYXRpb24gb2YgZWFjaCBvYmplY3QgZmlsZSwgcGVyZm9ybSB0aGUg
dmFsaWRhdGlvbiBpbiB2ZHNvX2NoZWNrLgo+Cj4gRGVidWcgaW5mb3JtYXRpb24gY2FuIGNvbnRh
aW4gbGVnYWwgYWJzb2x1dGUgcmVsb2NhdGlvbnMgYW5kIHJlYWRlbGYgY2FuCj4gbm90IHByaW50
IHJlbG9jYXRpb25zIGZyb20gdGhlIC50ZXh0IHNlY3Rpb24gb25seS4gTWFrZSB1c2Ugb2YgdGhl
IGZhY3QKPiB0aGF0IGFsbCBnbG9iYWwgdkRTTyBzeW1ib2xzIGZvbGxvdyB0aGUgbmFtaW5nIHBh
dHRlcm4gInZkc29fdV8iLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9h
QXBHUEFvY3RxX2VvRTJnQHQxNHVsdHJhLwo+IExpbms6IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVn
emlsbGEvc2hvd19idWcuY2dpP2lkPTEyMDAwMgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnD
n3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgo+IC0tLQo+ICAgbGliL3Zk
c28vTWFrZWZpbGUuaW5jbHVkZSB8IDYgKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3Zkc28vTWFrZWZpbGUuaW5jbHVkZSBiL2xp
Yi92ZHNvL01ha2VmaWxlLmluY2x1ZGUKPiBpbmRleCBjZWRiZjE1ZjgwODc0ZDRiYjI3YzA5NzI0
NGJjNWIxMTI3MmYyNjFjLi4wNDI1N2QwZjI4YzBlZDMyNGUzMWFkYmI2ODQ5NzE4MTA4NTc1MmY4
IDEwMDY0NAo+IC0tLSBhL2xpYi92ZHNvL01ha2VmaWxlLmluY2x1ZGUKPiArKysgYi9saWIvdmRz
by9NYWtlZmlsZS5pbmNsdWRlCj4gQEAgLTEyLDcgKzEyLDEzIEBAIGMtZ2V0cmFuZG9tLSQoQ09O
RklHX1ZEU09fR0VUUkFORE9NKSA6PSAkKGFkZHByZWZpeCAkKEdFTkVSSUNfVkRTT19ESVIpLCBn
ZXRyYW5kCj4gICAjCj4gICAjIEFzIGEgd29ya2Fyb3VuZCBmb3Igc29tZSBHTlUgbGQgcG9ydHMg
d2hpY2ggcHJvZHVjZSB1bm5lZWRlZCBSXypfTk9ORQo+ICAgIyBkeW5hbWljIHJlbG9jYXRpb25z
LCBpZ25vcmUgUl8qX05PTkUuCj4gKyMKPiArIyBBbHNvIHZhbGlkYXRlIHRoYXQgbm8gYWJzb2x1
dGUgcmVsb2NhdGlvbnMgYWdhaW5zdCBnbG9iYWwgc3ltYm9scyBhcmUgcHJlc2VudAo+ICsjIGlu
IHRoZSBvYmplY3QgZmlsZXMuCj4gICBxdWlldF9jbWRfdmRzb19jaGVjayA9IFZEU09DSEsgJEAK
PiAgICAgICAgIGNtZF92ZHNvX2NoZWNrID0gaWYgJChSRUFERUxGKSAtclcgJEAgfCBncmVwIC12
IF9OT05FIHwgZ3JlcCAtcSAiIFJfXHcqXyI7IFwKPiAgIAkJICAgICAgIHRoZW4gKGVjaG8gPiYy
ICIkQDogZHluYW1pYyByZWxvY2F0aW9ucyBhcmUgbm90IHN1cHBvcnRlZCI7IFwKPiArCQkJICAg
ICBybSAtZiAkQDsgL2Jpbi9mYWxzZSk7IGZpICYmIFwKPiArCQkgICAgICAgaWYgJChSRUFERUxG
KSAtclcgJChmaWx0ZXIgJS5vLCAkKHJlYWwtcHJlcmVxcykpIHwgZ3JlcCAtcSAiIFJfXHcqX0FC
Uy4qdmRzb191XyI7IFwKCgpUaGlzIG9ubHkgd29ya3MgZm9yIGFybTY0IHJlbG9jYXRpb25zIHJp
Z2h0PyBJIGNhbid0IGZpbmQgYW55ICpBQlMqIApyZWxvY2F0aW9ucyBpbiByaXNjdiBlbGYgYWJp
IAooaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJpLWRvYy9y
ZWxlYXNlcy90YWcvdjEuMCkuCgpUaGFua3MsCgpBbGV4CgoKPiArCQkgICAgICAgdGhlbiAoZWNo
byA+JjIgIiRAOiBhYnNvbHV0ZSByZWxvY2F0aW9ucyBhcmUgbm90IHN1cHBvcnRlZCI7IFwKPiAg
IAkJCSAgICAgcm0gLWYgJEA7IC9iaW4vZmFsc2UpOyBmaQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
