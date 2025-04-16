Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F46AC369BA
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YHN0tYRvnSXTD7cN3T+q6WKH61sm91f4gcDGXoNRx9E=; b=EZ69A+FI90lcbF
	cLzBlrxtvAIlSU8xp91Rs8fh8bc0Fod8wayVaIQAQPRR1eNQIijn9PsyBon+g2Pr+nPyyE+M9dL63
	nvxBv5paRQ0aCyBfGqwNCiLC+YXexdLqmqZN22tMEsRt4SVYUIeI8U+5+p1/UTCYRzx7rj19ldFIu
	VyvGQSl5Yet6Jf0dp6sDY1dtWlDm/THps9M2CZWCpRwywnGzeGa3nCOWtk7stnvikEjSyKvc2uT2b
	63lCyfTr944H9A3LhzPiUs7ETinxP102hAXKoKpTVitEdriDJ0Bb5YhcTBGJeIrnWfuAAeMdajGtS
	72NgU6knmBbVx31o+UEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u579q-0000000AVeU-25NC;
	Wed, 16 Apr 2025 18:06:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u577l-0000000AV2H-2k5c
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 18:04:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCE621FCE5;
	Wed, 16 Apr 2025 18:04:34 +0000 (UTC)
Message-ID: <9581dba8-c69d-435a-b099-83130867b79e@ghiti.fr>
Date: Wed, 16 Apr 2025 20:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc3
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvhffutgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveevveelleeggeehjeeitdefgeegtefftdekkeetvdfggffhfeegkeehgeekieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfvgekrgemgegulegsmegrfeehgeemgehfjehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfvgekrgemgegulegsmegrfeehgeemgehfjehfpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfvgekrgemgegulegsmegrfeehgeemgehfjehfngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_110437_820665_E2BA3B2B 
X-CRM114-Status: UNSURE (   4.09  )
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3MGZjMDNjZDc2MzExYTA2YzhjODRk
ZWI3MGIyZTE2ODM3NDk3Nzc0OgoKIMKgIERvY3VtZW50YXRpb246IHJpc2N2OiBGaXggdHlwbyBN
SU1QTElEIC0+IE1JTVBJRCAoMjAyNS0wNC0wNyAwODoyMToxOSAKKzAwMDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiDCoCBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYWxleGdoaXRpL2xpbnV4IAp0YWdzL3Jpc2N2LWZpeGVz
LTYuMTUtcmMzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMTQxMzcwOGY5OTBjYjdk
MDI1YWZmZDcwNmJhOWMyM2UyYmZjMWEyNzoKCiDCoCByaXNjdjogQXZvaWQgZm9ydGlmeSB3YXJu
aW5nIGluIHN5c2NhbGxfZ2V0X2FyZ3VtZW50cygpICgyMDI1LTA0LTE2IAoxMTowOTozOCArMDAw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KcmlzY3YgZml4ZXMgZm9yIDYuMTUtcmMzCgotIEEgY291cGxlIG9mIGZpeGVz
IHJlZ2FyZGluZyBtb2R1bGUgcmVsb2NhdGlvbnMKLSBGaXggYSBidWlsZCBlcnJvciBieSBpbXBs
ZW1lbnRpbmcgbWlzc2luZyBhbHRlcm5hdGl2ZSBtYWNyb3MKLSBBbm90aGVyIGZpeCBmb3Iga2V4
ZWMgYnkgZml4aW5nIC9wcm9jL2lvbWVtCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFuZHJldyBKb25lcyAoMik6CiDCoMKg
wqDCoMKgIHJpc2N2OiBGaXggdW5hbGlnbmVkIGFjY2VzcyBpbmZvIG1lc3NhZ2VzCiDCoMKgwqDC
oMKgIHJpc2N2OiBQcm92aWRlIGFsbCBhbHRlcm5hdGl2ZSBtYWNyb3MgYWxsIHRoZSB0aW1lCgpC
asO2cm4gVMO2cGVsICgxKToKIMKgwqDCoMKgwqAgcmlzY3Y6IFByb3Blcmx5IGV4cG9ydCByZXNl
cnZlZCByZWdpb25zIGluIC9wcm9jL2lvbWVtCgpOYXRoYW4gQ2hhbmNlbGxvciAoMSk6CiDCoMKg
wqDCoMKgIHJpc2N2OiBBdm9pZCBmb3J0aWZ5IHdhcm5pbmcgaW4gc3lzY2FsbF9nZXRfYXJndW1l
bnRzKCkKClNhbXVlbCBIb2xsYW5kICgyKToKIMKgwqDCoMKgwqAgcmlzY3Y6IG1vZHVsZTogRml4
IG91dC1vZi1ib3VuZHMgcmVsb2NhdGlvbiBhY2Nlc3MKIMKgwqDCoMKgwqAgcmlzY3Y6IG1vZHVs
ZTogQWxsb2NhdGUgUExUIGVudHJpZXMgZm9yIFJfUklTQ1ZfUExUMzIKCiDCoGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUtbWFjcm9zLmggfCAxOSArKysrKysrLS0tLS0tLS0tLS0t
CiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzY2FsbC5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNyArKysrKy0tCiDCoGFyY2gvcmlzY3Yva2VybmVsL21vZHVsZS1zZWN0aW9ucy5jwqDC
oMKgwqDCoMKgwqDCoCB8IDEzICsrKysrKystLS0tLS0KIMKgYXJjaC9yaXNjdi9rZXJuZWwvbW9k
dWxlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCiDCoGFyY2gv
cmlzY3Yva2VybmVsL3NldHVwLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAzNiAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiDCoGFyY2gvcmlzY3Yv
a2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuY8KgIHwgMzUgCisrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tCiDCoDYgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwg
MzYgZGVsZXRpb25zKC0pCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
