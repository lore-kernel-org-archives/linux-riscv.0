Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C311EC83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DYZmIwVc+nDKvK0SFYJm3AsQ/WmJKss8jMcIGHZzyBA=; b=xpMFWc/jo+goI9
	5HrgPnRr55c4b9QZXc408g0vkKNsSSh9YWz1UnmcVsEfBdWcEqAM6xNbHJfYLGlW7zC3zZHhKbMpB
	xF4bv1UWIPJ1ETI27mCM+2W2u7G1z3VgfvuZQAEJYB60PNpa6yj9lhfKrabCkId/LH/DVuJAsZmhB
	XT2iM1KXXRI5h+/F54nZM1w76ge+8Fe8yo6nv5bK9NJ77WiyvrLGbbJOxKyFCORD+4lU7oaI5mEot
	400/0wqIUnbCer8QIxNRTQRpLt2uQb2yqVZLhZct1nlWWYiv7VQ6zuqIMatdmh9tGUT8SSLEDuV2C
	t2qf1RnKMCItOakt6ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxrm-00000008Wpi-35yi;
	Wed, 02 Jul 2025 13:51:14 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwkw-00000008LCJ-2qMT
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:40:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50F84432F9;
	Wed,  2 Jul 2025 12:40:00 +0000 (UTC)
Message-ID: <e9eca9db-be56-4ee7-8674-d43c9834b981@ghiti.fr>
Date: Wed, 2 Jul 2025 14:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: [GIT PULL] RISC-V Fixes for 6.16-rc4
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfvffhufgtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeevveevleelgeegheejiedtfeeggeetffdtkeektedvgffghfefgeekheegkeeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemjeelugdtmeellehftgemiegrfhgsmeehvddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemjeelugdtmeellehftgemiegrfhgsmeehvddtledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemjeelugdtmeellehftgemiegrfhgsmeehvddtlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_054006_849818_5F8490C3 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkMGIzYjdiMjJkZmExZjRiNTE1ZmQz
YTI5NWIzZmQ5NThmOWU4MWFmOgoKIMKgIExpbnV4IDYuMTYtcmM0ICgyMDI1LTA2LTI5IDEzOjA5
OjA0IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgpodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hbGV4Z2hpdGkvbGlu
dXguZ2l0LyAKdGFncy9yaXNjdi1maXhlcy02LjE2LXJjNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDJiMjliZTk2N2FlNDU2ZmMwOWMzMjBkOTFkNTIyNzhjZjcyMWJlMWU6CgogwqAg
cmlzY3Y6IGNwdV9vcHNfc2JpOiBVc2Ugc3RhdGljIGFycmF5IGZvciBib290X2RhdGEgKDIwMjUt
MDYtMzAgCjA2OjU4OjExICswMDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpyaXNjdiBmaXhlcyBmb3IgNi4xNi1yYzQK
Ci0gQSBmaXggZm9yIGEgcGVyY3B1IHZhcmlhYmxlIHRoYXQgbWF5IGxpZSBpbiB0aGUgdm1hbGxv
YyByZWdpb24gYW5kIG9uIAp3aGljaCB3ZSB1c2VkIF9fcGEoKQotIEEgZml4IHRvIHJlcXVpcmUg
YXQgbGVhc3QgY2xhbmctMTcgdG8gcHJldmVudCBidWlsZCBpc3N1ZXMgd2l0aCAKcHJldmlvdXMg
dmVyc2lvbnMgb24ga0NGSQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpOYXRoYW4gQ2hhbmNlbGxvciAoMSk6CiDCoMKgwqDC
oMKgIHJpc2N2OiBSZXF1aXJlIGNsYW5nLTE3IG9yIG5ld2VyIGZvciBrQ0ZJCgpWaXZpYW4gV2Fu
ZyAoMSk6CiDCoMKgwqDCoMKgIHJpc2N2OiBjcHVfb3BzX3NiaTogVXNlIHN0YXRpYyBhcnJheSBm
b3IgYm9vdF9kYXRhCgogwqBhcmNoL3Jpc2N2L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMgKystCiDCoGFyY2gvcmlzY3Yva2VybmVsL2NwdV9vcHNfc2JpLmMgfCA2ICsrKy0t
LQogwqAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
