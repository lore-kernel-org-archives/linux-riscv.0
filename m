Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9673CA1009
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 08:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S+tv53HaxZ2DVapwIztuwRL0OR2V1Cx3SpBgFDaIs0w=; b=p5pbmBSzhf21We
	J5qLGh9cOwMbsRWh6YSdsAlPMR4IARypSTJrjp/WyjgGtwnloYUmswpBQLE7+CsAaFF3UzELfzyFV
	6gTbSV1tg4QR4+l75DyqJVJZXbhfWbP9aboM+jP3hF1knS+au/fvbz2XeKnCGS9EKs+vekFbDs3dn
	nu+j8BfzFLUBYciHe4dYty+Tx9irnCsAgYF3JM+dncDXGXwQmdhnMD5S6/M3RDz+P0AB7ggpsQfBJ
	c3ocTepWaHvXr/aG15bAAG7KItHiDC//VSLkBa4r/dAw4MUY1gG1+RiEslTDu3cJVJolLLp7K1t1C
	zv3PkHVhnGyaKjBAhtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMZP-0000000G7JG-27fu;
	Tue, 02 Sep 2025 08:40:51 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM2y-0000000Fvnx-0Jot
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 08:07:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EAAC439DF;
	Tue,  2 Sep 2025 08:07:17 +0000 (UTC)
Message-ID: <905a306b-6a92-4335-b31d-51802f7845af@ghiti.fr>
Date: Tue, 2 Sep 2025 10:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: [GIT PULL] RISC-V Fixes for 6.17-rc5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleegheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvhffutgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveevveelleeggeehjeeitdefgeegtefftdekkeetvdfggffhfeegkeehgeekieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudekhedrvddufedrudehgedrudegieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedukeehrddvudefrdduheegrddugeeipdhhvghloheplgdutddrudegrddtrddvngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_010720_263876_A76E790D 
X-CRM114-Status: UNSURE (   7.55  )
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBiMzIwNzg5ZDY4ODNjYzAwYWM3OGNl
ODNiY2NiZmU3ZWQ1OGFmY2YwOgoKIMKgIExpbnV4IDYuMTctcmM0ICgyMDI1LTA4LTMxIDE1OjMz
OjA3IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FsZXhnaGl0aS9s
aW51eCAKdGFncy9yaXNjdi1maXhlcy02LjE3LXJjNQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDFmYTAwZjNkZWFjYWZlMjAyZWJhNjg4N2RlYmE3NGVhNjQwMmM4ODM6CgogwqAgcmlz
Y3Y6IFVzZSBhbiBhdG9taWMgeGNoZyBpbiBwdWRwX2h1Z2VfZ2V0X2FuZF9jbGVhcigpICgyMDI1
LTA5LTAyIAowNzozNDoyMSArMDAwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KcmlzY3YgZml4ZXMgZm9yIDYuMTctcmM1
CgotIEEgZml4IGZvciBhIGxpbmsgZXJyb3IgYnkgZGlzYWJsaW5nIExUTyBvbiBtZWRsb3cgY29k
ZSBtb2RlbAotIDQgZml4ZXMgd2hlcmUgd2UgdXNlZCB4bGVuLWJpdHMgd2lkZSBsb2FkcyBvbiAz
Mi1iaXQgdmFsdWVzCi0gQSBmaXggaW4gdXNlciBhY2Nlc3Mgcm91dGluZXMgd2hlcmUgd2Ugc2hv
dWxkIGhhdmUgd3JpdHRlbiB0aGUgc2l6ZSBvZiAKdGhlIGRlc3RpbmF0aW9uLCBub3QgdGhlIHNp
emUgb2YgdGhlIHNvdXJjZSwgd2hpY2ggYXBwZWFyZWQgaW4gZ2xpYmMgCnRlc3RzdWl0ZQotIEEg
Zml4IGluIEFDUEkgcmlzY3YgY3NyIHJlYWQgcm91dGluZXMgd2hlcmUgdGhlIGVycm9yIGNvZGUg
d2FzIGluY29ycmVjdAotIEEgZml4IGZvciBUSFAgUFVEIHRvIHByZXZlbnQgcmV0dXJuaW5nIGFu
IG9sZCBwdGUgdmFsdWUKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleGFuZHJlIEdoaXRpICgxKToKIMKgIMKgIMKgIHJp
c2N2OiBVc2UgYW4gYXRvbWljIHhjaGcgaW4gcHVkcF9odWdlX2dldF9hbmRfY2xlYXIoKQoKQW51
cCBQYXRlbCAoMSk6CiDCoCDCoCDCoCBBQ1BJOiBSSVNDLVY6IEZpeCBGRkhfQ1BQQ19DU1IgZXJy
b3IgaGFuZGxpbmcKCkF1cmVsaWVuIEphcm5vICgxKToKIMKgIMKgIMKgIHJpc2N2OiB1YWNjZXNz
OiBmaXggX19wdXRfdXNlcl9ub2NoZWNrIGZvciB1bmFsaWduZWQgYWNjZXNzZXMKCk5hdGhhbiBD
aGFuY2VsbG9yICgxKToKIMKgIMKgIMKgIHJpc2N2OiBPbmx5IGFsbG93IExUTyB3aXRoIENNT0RF
TF9NRURBTlkKClJhZGltIEtyxI1tw6HFmSAoNCk6CiDCoCDCoCDCoCByaXNjdjogdXNlIGx3IHdo
ZW4gcmVhZGluZyBpbnQgY3B1IGluIG5ld192bWFsbG9jX2NoZWNrCiDCoCDCoCDCoCByaXNjdjog
dXNlIGx3IHdoZW4gcmVhZGluZyBpbnQgY3B1IGluIGFzbV9wZXJfY3B1CiDCoCDCoCDCoCByaXNj
diwgYnBmOiB1c2UgbHcgd2hlbiByZWFkaW5nIGludCBjcHUgaW4gQlBGX01PVjY0X1BFUkNQVV9S
RUcKIMKgIMKgIMKgIHJpc2N2LCBicGY6IHVzZSBsdyB3aGVuIHJlYWRpbmcgaW50IGNwdSBpbiBi
cGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWQKCiDCoGFyY2gvcmlzY3YvS2NvbmZpZ8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIDIgKy0KIMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaMKgIMKg
IMKgfMKgIDIgKy0KIMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAxMSArKysr
KysrKysrKwogwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8wqAgMiArLQogwqBh
cmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TwqAgwqAgwqAgwqAgfMKgIDIgKy0KIMKgYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wNjQuY8KgIHzCoCA0ICsrLS0KIMKgZHJpdmVycy9hY3BpL3Jpc2N2
L2NwcGMuY8KgIMKgIMKgIMKgIHzCoCA0ICsrLS0KIMKgNyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
