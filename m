Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B03CF9C71
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lFh8aPBF1HuzV7ngPVLInInMSHaRwFQ3/C6lt0kmqg=; b=W19/agGszNZYCpEBZ+g3agLfxn
	5LR0h8/yTA0xD9xhKnLVwWw803WDzYqCDKGTJoOyv2VboxMDWXsntIP18KnkYgSwpAX/r1iYKazOk
	SEp8F5pednhG1NVotKsqh6Hkwnh5KMN/RL8aCjc7fKCPEgjl4RYvPItRLtFr+xT6yFfPK1kVXe20x
	BAPE58rduHrygdlYz18vyXsR6Ooopz4xM1OExbwEy+Pe2MtWpYxeeHmQtFuUlPTC3MuEKc7fp0sx7
	yHTFBXcQbGa1kKilgl937JWmoAcVPRaP//IhZxWytUIm0QCmfB7t7d7C788sOqtHCQHEu9FNXaZvI
	/9Vbj92w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st2Ou-00000001vRH-2cHN;
	Tue, 24 Sep 2024 10:04:08 +0000
Received: from 14.mo583.mail-out.ovh.net ([188.165.51.82])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st2H3-00000001ttO-22q8
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 09:56:07 +0000
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.148.110])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4XCZxL0mW8z1QWK
	for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 09:55:49 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-5q9lx (unknown [10.110.164.235])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3B7A11FE9B;
	Tue, 24 Sep 2024 09:55:47 +0000 (UTC)
Received: from milecki.pl ([37.59.142.101])
	by ghost-submission-55b549bf7b-5q9lx with ESMTPSA
	id AqzIBaOM8mZcgQAA+u7rcQ
	(envelope-from <rafal@milecki.pl>); Tue, 24 Sep 2024 09:55:47 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004d3854881-9240-4405-bcc0-c07042d02785,
                    1AB79004D049CCABD2FE35BF073248474FDEF107) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 151.80.29.20
MIME-Version: 1.0
Date: Tue, 24 Sep 2024 11:55:44 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
 <heiko.stuebner@cherry.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Michael Zhu
 <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dhs@frame.work, ams@frame.work,
 gregkh@linuxfoundation.org, yuning.liang@deepcomputing.io,
 huiming.qiu@deepcomputing.io
Subject: Re: [patch v2 3/3] riscv: dts: starfive: add framework dts
In-Reply-To: <20240924080650.1345485-4-sandie.cao@deepcomputing.io>
References: <20240924080650.1345485-4-sandie.cao@deepcomputing.io>
Message-ID: <75d4f0395187f7950e0450a91fbe087d@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 10134506538491882359
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtvddgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghfkfigihgtgfesthekjhdttddtjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeejkeekgeejtdffffevffeivedtueeifeeuffegkeehkeeliedugfelfedutdeunecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdduhedurdektddrvdelrddvtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=jffzDI9wqpTBxYh402/WuPcxuVwvyleh09GDw3XTbs0=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1727171750; v=1;
 b=H4Qq7VYDRzRWv9WFaKeW1C47OolejEPczUMrO/b5LLTjo2+5Z3m5nY+1cHFcCufYPh5t/6hk
 oMrRFbUEq/f2QprP1TO9UxEXsV2uwjvrBk3XxOGOfYSh5lvYxK8q5do3FJoXGkBQVlCRRl3O1+G
 j3wAt0duT4a3RN+jaHXNimzKu2hN9qKAr153r4ypR60sYAP9fibB4gSaWR9PBsawYGFcpDlscQ4
 5UZk7IOgZuy4uu+Q+0HWZBAFmDEiCqhUShtiId4/icFcn0eloP/h2br97bFgUBxA3/YVg3IvwQ+
 qqLrPsjwzccFcyJdJRsf9qwltIPJWn42N5B7jCN4YUvKg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_025603_362067_B4643B2B 
X-CRM114-Status: UNSURE (   9.65  )
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

T24gMjAyNC0wOS0yNCAxMDowNiwgU2FuZGllIENhbyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtZnJhbWV3b3JrLmR0cwo+IGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtZnJhbWV3b3JrLmR0cwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mZjEyYzI0ZWJhYjMKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtZnJhbWV3b3Jr
LmR0cwo+IEBAIC0wLDAgKzEsMzQgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAgT1IgTUlUCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBTdGFyRml2ZSBUZWNo
bm9sb2d5IENvLiwgTHRkLgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgRW1pbCBSZW5uZXIgQmVy
dGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPiArICovCj4gKwo+ICsvZHRzLXYxLzsKPiArI2luY2x1
ZGUgImpoNzExMC1jb21tb24uZHRzaSIKPiArCj4gKy8gewo+ICsJbW9kZWwgPSAiRnJhbWV3b3Jr
IEZSQU5NRTAwMDAiOwo+ICsJY29tcGF0aWJsZSA9ICJkZWVwY29tcHV0aW5nLGZtNzExMCIsICJz
dGFyZml2ZSxqaDcxMTAiOwo+ICt9OwoKTml0cGlja2luZzogcHJvcGVydHkgImNvbXBhdGlibGUi
IHNob3VsZCBnbyBmaXJzdC4KClNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZHRzLWNvZGluZy1zdHlsZS5yc3QKCi0tIApSYWZhxYIgTWnFgmVja2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
