Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8881C021A7
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bj7xTeddlhsjCEJS9q3FO5Ff/WwsZHkhYGYPGt6d220=; b=2Zi3yQS5SmzZjymRdFhnKvejq4
	O3srSkUKieCBEBh1S9wq6wqs1ccWSk6nZVaVGBYJeW03Ibc8tL3YEfrf5vJcsXumHlB8wSjYFeen/
	ETyR1DcEdZoVrqXP41rf6mJ8USAgOegPQU6Bb3kau5Yfq0KVK4WIgjlna4b6QXUvJBvnS+AXJK3G6
	PmGn4saySxyezXi99R+ZjHjFy2kiqB5Iw6GDU4AKy8WEGvIY/TtlFcAesbPW8grmJ0kQBkUejVTF6
	VfcmD+B/qpcP4LB7IQ6roYD5X8DNyMKlj4XkSj0XgBcBIIq5BEMCVUwdgjidPzWBj2juNdV1KVqP+
	mpx/zp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAFI-000000072CC-03za;
	Wed, 12 Feb 2025 10:45:32 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9vw-00000006yf4-06TB
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 10:25:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43A2F43407;
	Wed, 12 Feb 2025 10:25:25 +0000 (UTC)
Message-ID: <e0c61484-2849-42c1-8e01-f85f9329b859@ghiti.fr>
Date: Wed, 12 Feb 2025 11:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Chen Pei <cp0613@linux.alibaba.com>,
 Andreas Schwab <schwab@suse.de>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, robh@kernel.org
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Fixes for 6.14-rc3
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfvfevhffutgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepjeetudekgeekudfgueekveeihfdvudelgfeitdellefgheejvdefuefhueetleeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvsgemfeduudekmegrledtugemhegvudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeehvggsmeefuddukeemrgeltdgumeehvgdurgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemhegvsgemfeduudekmegrledtugemhegvudgrngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrt
 ghomhdprhgtphhtthhopegsjhhorhhnsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopeihohhnghiguhgrnhdrfigrnhhgsehsihhfihhvvgdrtghomhdprhgtphhtthhopehshhhorhhnvgesghhmrghilhdrtghomhdprhgtphhtthhopegtphdtiedufeeslhhinhhugidrrghlihgsrggsrgdrtghomhdprhgtphhtthhopehstghhfigrsgesshhushgvrdguvgdprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_022532_194912_CBA4308C 
X-CRM114-Status: UNSURE (   3.58  )
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

SGkgUGFsbWVyLAoKUGxlYXNlIGZpbmQgYmVsb3cgdGhlIGxpc3Qgb2YgZml4ZXMgdGhhdCBJIGhh
dmUgY29sbGVjdGVkIGZvciA2LjE0LCBubyAKcmVncmVzc2lvbnMgaGF2ZSBiZWVuIGRldGVjdGVk
IHNpbmNlIHY2LjE0LXJjMSAKKGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC9w
dWxsLzMwKToKCiJyaXNjdjogc2lnbmFsOiBmaXggdGhlIHNpemUgb2Ygc2lnbmFsIGZyYW1lIiAK
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDEyMjAwODM5MjYuMTk0NTMt
MS15b25neHVhbi53YW5nQHNpZml2ZS5jb20vCiJyc2VxL3NlbGZ0ZXN0czogRml4IHJpc2N2IHJz
ZXFfb2Zmc2V0X2RlcmVmX2FkZHYgaW5saW5lIGFzbSIgCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjUwMTE0MTcwNzIxLjM2MTMyODAtMS1zaG9ybmVAZ21haWwuY29tLwoi
RG9jdW1lbnRhdGlvbjogcmlzY3Y6IFJlbW92ZSBLUFJPQkVTX09OX0ZUUkFDRSIgCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTAxMDgwMjAzNDIuNDE3Mi0xLWNwMDYxM0BsaW51eC5h
bGliYWJhLmNvbS9ULyAKCiJyaXNjdi9mdXRleDogc2lnbiBleHRlbmQgY29tcGFyZSB2YWx1ZSBp
biBhdG9taWMgY21weGNoZyIgCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2Lzkx
NjE0N2RiLTk0YTUtNDZkZi04YTIyLTFkMzAxMDU5MTU0Y0BnaGl0aS5mci9ULyNtMTU1YTllYmVk
Mjg2YmVhMzQ2NjlhNTEzYmRlY2Q4ZmRiZGRhZWFjNAoicmlzY3YvYXRvbWljOiBEbyBwcm9wZXIg
c2lnbiBleHRlbnNpb24gYWxzbyBmb3IgdW5zaWduZWQgaW4gCmFyY2hfY21weGNoZ+KAiyIgCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzkwYzk1MDQ2LTRjZGQtNDgzMC1iZTM5
LWQ3MzRkZjEzN2ZkM0BnaGl0aS5mci9ULyNtZTViNTI1ZjM4N2ZiMzk5NTU1YjBiY2ZmM2NjYjQw
MWI1ODFmNGE0NgoiIHJpc2N2OiBjcHVmZWF0dXJlOiB1c2UgYml0bWFwX2VxdWFsKCkgaW5zdGVh
ZCBvZiBtZW1jbXAoKSIgCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUw
MjEwMTU1NjE1LjE1NDU3MzgtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoicmlzY3Y6IGNhY2hlaW5m
bzogVXNlIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSBmb3Igbm9uLWJvb2xlYW4gcHJvcGVydGllcyIg
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQxMTA0MTkwMzE0LjI3MDA5
NS0xLXJvYmhAa2VybmVsLm9yZy8KCk5vdGUgdGhhdCB0aGUgbGFzdCBvbmUgZG9lcyBub3QgcHJv
cGVybHkgYXBwbHksIGEgbmV3IHZlcnNpb24gZnJvbSBFbWlsIApkb2VzLCBidXQgUm9iIHNlbnQg
dGhpcyBwYXRjaCBsYXN0IE5vdmVtYmVyIGZpcnN0LgoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
