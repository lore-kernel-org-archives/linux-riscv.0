Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B92C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XDYW/lmAqp7deM+02gr7YbtmMJ0I0bSv5icBr9IXTLs=; b=ZTMbNVq725DUGI
	AfX0ewrNj9bDZPEangqyAFbm63bfE8ME3hqV58HquiMfiYl1/3AJoG2HMUlpd74j2gbmSA17BOHPL
	A31f6f+tc53ylzhEtQwfB6PjEgIjSUytX6SUu6d74hUOCDLmndzeNhN4HgUBfm6ewggwmzozMJXpG
	IkAsLT1NwqYooZXwCF/X0WBcI0Z1bm6L4yPSdlvG6247f5VM+coTZrEBKNoo0b8tpx066xAVOF0YV
	sd5vPfnyS8to1ILwKvsmI9qz0ao0Q/anQ4DjtytqFSHC4dlSrKsplZ16MEK1SwhAtOrF9Yx4Ead7a
	YI2iAy33o5bZ7RH6kcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qqw-00000006amE-1moj;
	Wed, 09 Apr 2025 08:32:10 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qqs-00000006ajo-42Ao
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 08:32:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D826A43158;
	Wed,  9 Apr 2025 08:32:03 +0000 (UTC)
Message-ID: <745d5aaa-e527-487c-a62c-212ad6ef2cc9@ghiti.fr>
Date: Wed, 9 Apr 2025 10:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvhffutgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepvdelveekvdfhgeelieejhfetgeduteekhfeuheffjeduiefgtdfgtdeltdeftddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhtshdrnhgvthenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeiudeileemjedtledumegugehfkeemjegttgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeiudeileemjedtledumegugehfkeemjegttgegpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeiudeileemjedtledumegugehfkeemjegttgegngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdri
 hhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_013207_126361_832FC460 
X-CRM114-Status: UNSURE (   5.28  )
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwYWYyZjZiZTFiNDI4MTM4NWI2MThj
Yjg2YWQ5NDZlZGVkMDg5YWM4OgoKIMKgIExpbnV4IDYuMTUtcmMxICgyMDI1LTA0LTA2IDEzOjEx
OjMzIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FsZXhnaGl0aS9s
aW51eCAKdGFncy9yaXNjdi1maXhlcy02LjE1LXJjMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDcwZmMwM2NkNzYzMTFhMDZjOGM4NGRlYjcwYjJlMTY4Mzc0OTc3NzQ6CgogwqAgRG9j
dW1lbnRhdGlvbjogcmlzY3Y6IEZpeCB0eXBvIE1JTVBMSUQgLT4gTUlNUElEICgyMDI1LTA0LTA3
IDA4OjIxOjE5IAorMDAwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KcmlzY3YgZml4ZXMgZm9yIDYuMTUtcmMyCgoqIENv
cnJlY3QgdHlwb3MgaW4gdGhlIGRvY3VtZW50YXRpb24KKiBQcmV2ZW50IG1vZHVsZSBpbnNlcnRp
b24gZmFpbHVyZXMgYnkgdXNpbmcga3ZtYWxsb2MgdG8gYWxsb2NhdGUgdGhlIApyZWxvY2F0aW9u
IGhhc2h0YWJsZQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQoKQWxsIHRoZSBwYXRjaGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24g
b3VyIGdpdGh1YiBDSSBhbmQgbm8gcmVncmVzc2lvbnMgCndlcmUgZm91bmQgYWdhaW5zdCA2LjE1
LXJjMSAKKGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC9wdWxsLzI0MC9jaGVj
a3Mgd2hvc2UgcmVzdWx0cyBjYW4gCmJlIHNlZW4gaGVyZSAKaHR0cHM6Ly9tYXphcmluZW4udGFp
bDFjNjIzLnRzLm5ldC9yaXNjdi1saW51eC9saW51eC1hbGwvYnVpbGQvcmlzY3YtZml4ZXMtNi4x
NS1yYzIpLiAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCgpOYW0gQ2FvICgxKToKIMKgwqDCoMKgwqAgRG9jdW1lbnRhdGlv
bjogcmlzY3Y6IEZpeCB0eXBvIE1JTVBMSUQgLT4gTUlNUElECgpXaWxsIFBpZXJjZSAoMSk6CiDC
oMKgwqDCoMKgIHJpc2N2OiBVc2Uga3ZtYWxsb2NfYXJyYXkgb24gcmVsb2NhdGlvbl9oYXNodGFi
bGUKCiDCoERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCB8IDIgKy0KIMKgYXJj
aC9yaXNjdi9rZXJuZWwvbW9kdWxlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDkgKysrKystLS0t
CiDCoDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
