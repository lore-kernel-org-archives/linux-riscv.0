Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B68BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tI8dHU5ayIjmqTBS1MDP0Gtt8Ii75zWA0uQqRoXu74o=; b=0D/qxBnEw8R36p
	2/1VbD3WjAC2i2fEcyCi+WNdCvOYOXbesnz6zNoj6/7quQPcbgEZK2QeZjp/rrUZeuQKcRfa57jNy
	49WKFx0+vtlf/i9W9N3U5A1FYHNz0qRCf+/SMce5AVDZG1DrFNBzjGyz2ZKK4dFIFx19hd/3bNZzT
	baQBvn98VgBfPQ8oKIXZmWPieNq0eUBX2YWWFhjPvMOm4WzaPbdZx0+rZ/ZfbSW+CtMFn3wJRdgy3
	0N+orisJjVB5oHITsq36WI5hQ/tAlguMR3Xz2WaD3vRJcYZtTCCGia0yAtm/NLUAqQ5TOrY/GaEjS
	f+boQ1y1OXTCQROKHJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohuQU-001JDu-6r; Mon, 10 Oct 2022 15:10:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohuQS-001JDH-0w
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 15:10:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DF225CE10D7;
	Mon, 10 Oct 2022 15:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C2DC433D6;
	Mon, 10 Oct 2022 15:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665414636;
	bh=ldhbd4gbQEFA+pTqtSmtstrcNM+Qhq7eBd95J2vIhdA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UBia0qRg3uM2Fv6m57jcY4VKFldyUhPNfLQHomhUvx5AQ+4IACfN6SN5vBoZZn2dS
	 hLFmjgW010B0xxT2620tnnbPBMUpyLMx9Q/HKXtKZTmdtxUlx8D0GpBaDrVE4ZZ+aa
	 KcxuK9bpHNnamZc4fNQO241zMTiJh3CHpKexGqq12qTbJmx0RjbmGEbYZr1NIPdNRA
	 0GZk9DljKVM6t3uc0sA/STL8FHZbwK+27mw195sqJXJWiYDt1Pix79mzhsVkIl7UF/
	 drOtb0itKvE7Ou7bGMiqAYyLdhXIw3WVXo6LMTYXECmJ8PgMDTOUAfljt3WagetiKe
	 74qKmzXLyIxmw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Wenting Zhang <zephray@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: Wenting Zhang <zephray@outlook.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: always honor the CONFIG_CMDLINE_FORCE when
 parsing dtb
In-Reply-To: <PSBPR04MB399135DFC54928AB958D0638B1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
References: <PSBPR04MB399135DFC54928AB958D0638B1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
Date: Mon, 10 Oct 2022 17:10:33 +0200
Message-ID: <87bkqjk93q.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_081040_253663_87812F41 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2VudGluZyBaaGFuZyA8emVwaHJheUBvdXRsb29rLmNvbT4gd3JpdGVzOgoKPiBXaGVuIENPTkZJ
R19DTURMSU5FX0ZPUkNFIGlzIGVuYWJsZWQsIGNtZGxpbmUgcHJvdmlkZWQgYnkKPiBDT05GSUdf
Q01ETElORSBhcmUgYWx3YXlzIHVzZWQuIFRoaXMgYWxsb3dzIENPTkZJR19DTURMSU5FIHRvIGJl
Cj4gdXNlZCByZWdhcmRsZXNzIG9mIHRoZSByZXN1bHQgb2YgZGV2aWNlIHRyZWUgc2Nhbm5pbmcu
Cj4KPiBUaGlzIGVzcGVjaWFsbHkgZml4ZXMgdGhlIGNhc2Ugd2hlcmUgYSBkZXZpY2UgdHJlZSB3
aXRob3V0IHRoZQo+IGNob3NlbiBub2RlIGlzIHN1cHBsaWVkIHRvIHRoZSBrZXJuZWwuIEluIHN1
Y2ggY2FzZXMsCj4gZWFybHlfaW5pdF9kdF9zY2FuIHdvdWxkIHJldHVybiB0cnVlLiBCdXQgaW5z
aWRlCj4gZWFybHlfaW5pdF9kdF9zY2FuX2Nob3NlbiwgdGhlIGNtZGxpbmUgd29uJ3QgYmUgdXBk
YXRlZCBhcyB0aGVyZQo+IGlzIG5vIGNob3NlbiBub2RlIGluIHRoZSBkZXZpY2UgdHJlZS4gQXMg
YSByZXN1bHQsIENPTkZJR19DTURMSU5FCj4gaXMgbm90IGNvcGllZCBpbnRvIGJvb3RfY29tbWFu
ZF9saW5lIGV2ZW4gaWYgQ09ORklHX0NNRExJTkVfRk9SQ0UKPiBpcyBlbmFibGVkLiBUaGlzIGNv
bW1pdCBhbGxvd3MgcHJvcGVybHkgdXBkYXRlIGJvb3RfY29tbWFuZF9saW5lCj4gaW4gdGhpcyBz
aXR1YXRpb24uCj4KPiBGaXhlczogOGZkNmUwNWM3NDYzICgiYXJjaDogcmlzY3Y6IHN1cHBvcnQg
a2VybmVsIGNvbW1hbmQgbGluZSBmb3JjaW5nIHdoZW4gbm8gRFRCIHBhc3NlZCIpCj4gU2lnbmVk
LW9mZi1ieTogV2VudGluZyBaaGFuZyA8emVwaHJheUBvdXRsb29rLmNvbT4KClJldmlld2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
