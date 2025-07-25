Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48A9C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/6A/Hxxuzg/FYFePfwfFquAtHdwyNGDdl7wJS+JmHM=; b=3Pcet403G0UyDR
	m5zDH9+VgnGTL4HCl+033QNBJgCcXqDZUOBuaozeO/ZGgCEe5TINfQHL9WrqUC/8WAbn9zko1o52A
	fflRIO05mUsRMUL1o/8HS+lxG/ZJwUpknfDff5hao+WuB86ErNvA/b522B2uyuTmklxDapicMtNkS
	CfGwllZyX1FYQD2dkgIHQP0u925l9tzHkaKz4Jw7Wr19S9LfHy8X8s109RbA0u8ghDdtam3g32IQc
	2jVLTTMazNJ7UitspCNVWyGzmfRg8cFWErwWGOCSazv14dl3s1sxQ/o3BZt+gc2Ho+zxkONBWVLLs
	F3XAkSRmSnbCjOkjs1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJCA-00000009z4P-1Txu;
	Fri, 25 Jul 2025 14:14:46 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJC7-00000009z3l-493q
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:14:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5137C441CB;
	Fri, 25 Jul 2025 14:14:41 +0000 (UTC)
Message-ID: <04d6d616-6df4-4c39-8813-31f95145c3bb@ghiti.fr>
Date: Fri, 25 Jul 2025 16:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: use TASK_TI_CPU instead of TASK_TI_CPU_NUM
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Deepak Gupta <debug@rivosinc.com>
References: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
 <20250722160556.2216925-3-rkrcmar@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250722160556.2216925-3-rkrcmar@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppeelhedrudeguddruddtvddrudekieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelhedrudeguddruddtvddrudekiedphhgvlhhopegluddtrddutddrudegiedrvddujegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehrkhhrtghmrghrsehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmp
 dhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopeguvggsuhhgsehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_071444_152456_CA108E03 
X-CRM114-Status: GOOD (  11.40  )
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

SGkgUmFkaW0sCgpPbiA3LzIyLzI1IDE4OjA1LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gVGhl
IG9mZnNldHMgb2YgVEFTS19USV9DUFUgYW5kIFRBU0tfVElfQ1BVX05VTSBhcmUgaWRlbnRpY2Fs
LCBhbmQKPiBUQVNLX1RJX0NQVSBpcyBhIGJldHRlciBuYW1lIGZvciB0aHJlYWRfaW5mby5jcHUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3Jv
LmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggICAgfCAyICstCj4g
ICBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jIHwgMSAtCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vYXNtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oCj4g
aW5kZXggYThhMmFmNmRmZTlkLi5iMzAyMmJjMjI0ZWMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9hc20uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgK
PiBAQCAtOTEsNyArOTEsNyBAQAo+ICAgI2VuZGlmCj4gICAKPiAgIC5tYWNybyBhc21fcGVyX2Nw
dSBkc3Qgc3ltIHRtcAo+IC0JUkVHX0wgXHRtcCwgVEFTS19USV9DUFVfTlVNKHRwKQo+ICsJUkVH
X0wgXHRtcCwgVEFTS19USV9DUFUodHApCj4gICAJc2xsaSAgXHRtcCwgXHRtcCwgUEVSX0NQVV9P
RkZTRVRfU0hJRlQKPiAgIAlsYSAgICBcZHN0LCBfX3Blcl9jcHVfb2Zmc2V0Cj4gICAJYWRkICAg
XGRzdCwgXGRzdCwgXHRtcAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zm
c2V0cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+IGluZGV4IDZlOGMwZDZm
ZWFlOS4uNDljZjJjMzQ3NDg1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1v
ZmZzZXRzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCj4gQEAgLTQ5
LDcgKzQ5LDYgQEAgdm9pZCBhc21fb2Zmc2V0cyh2b2lkKQo+ICAgCU9GRlNFVChUQVNLX1RJX0Ey
LCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8uYTIpOwo+ICAgI2VuZGlmCj4gICAKPiAtCU9GRlNF
VChUQVNLX1RJX0NQVV9OVU0sIHRhc2tfc3RydWN0LCB0aHJlYWRfaW5mby5jcHUpOwo+ICAgCU9G
RlNFVChUQVNLX1RIUkVBRF9GMCwgIHRhc2tfc3RydWN0LCB0aHJlYWQuZnN0YXRlLmZbMF0pOwo+
ICAgCU9GRlNFVChUQVNLX1RIUkVBRF9GMSwgIHRhc2tfc3RydWN0LCB0aHJlYWQuZnN0YXRlLmZb
MV0pOwo+ICAgCU9GRlNFVChUQVNLX1RIUkVBRF9GMiwgIHRhc2tfc3RydWN0LCB0aHJlYWQuZnN0
YXRlLmZbMl0pOwoKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
