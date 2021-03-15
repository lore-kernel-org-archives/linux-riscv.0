Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0932C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 19:52:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C00764E4D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 19:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C00764E4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=adQ73MKnOy2cCj7e7J/ZOXUm9chqJo4s4Tozh1czBdA=; b=SmO0TquVCaS6jhu+8XwDPGYLg
	VVL2TYHrOCBJOncVGMxxkoyJprW0RvlNGr+tQxOwH/t13b7vgvLb5eSUKOauV75LfwPvGwnJW3lbk
	IQoBGW/jcnB9mcF91t5yahGyPocw9r/SO4TgA9VShHnLjYmEqhgGUhvXPFak6tsaK94OTY8LFbBb3
	MulV9qq1fgsN8b6MNXlAM5ViuYG5TcKE1/9KCy27kQWAw7Z1mPJO6pF3hinabKHpm2JLfUzGXhjOt
	DYoLQTlg/blneGM+7FfhS7svIw6GBJYrwlzcvoBd8+dPsOzQEf6lg2h3RLA1mopVCXu+hkBLoXbCW
	eNXp+mdEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLtGG-00Gnn0-MJ; Mon, 15 Mar 2021 19:52:20 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLtGC-00Gnlt-E7
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 19:52:18 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B296D2C4;
 Mon, 15 Mar 2021 19:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B296D2C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1615837934; bh=vJ1LwzCHga3XYU7TZXaZBlXrzETaMIRW57nEqTnZdIk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mLmGDagdSoMzCzv7AIZnjz9vPzOXTXUxWVcu95DOrx3m0mmb4l0zs1iKDd63j0Fde
 aVWv5lV95GmUEVPZLpS7733T0+jTgdz15LUtrROmeSWt9IaJA6IpHZkZ9X6qmatxGS
 llJ1mjvLHPpImbY3/hN71IExCpQnWA9CdmWT1u4Szx9X1GmkLmbXSBzn8hDjNBYRQ6
 m83RUjB6LfgWNfQ+LQkuBoAgvCBVWvaraOiHgUWR/CpOIffX8Y3hSIjYy2upH5r5LP
 g7zhfIyw9U827alRltDw6JEl0bbltXFjHvvWkYhyfYQnOIYG7YWFG+Lygc64Gs+PPl
 ea321Zq36T8rg==
From: Jonathan Corbet <corbet@lwn.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-doc@vger.kernel.org
Cc: linux-arch@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH] docs: Group arch-specific documentation under "CPU
 Architectures"
In-Reply-To: <20210312152804.2110703-1-j.neuschaefer@gmx.net>
References: <20210312152804.2110703-1-j.neuschaefer@gmx.net>
Date: Mon, 15 Mar 2021 13:52:14 -0600
Message-ID: <87k0q819g1.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_195216_732329_303B2925 
X-CRM114-Status: GOOD (  12.66  )
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

Sm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4gd3JpdGVzOgoKPiBU
byBkZWNsdXR0ZXIgdGhlIHRvcC1sZXZlbCB0YWJsZSBvZiBjb250ZW50cyAodGhlIHNpZGUgYmFy
KSwgdGhpcwo+IHBhdGNoIHJlZHVjZXMgdGhlIGFyY2hpdGVjdHVyZS1zcGVjZmljIGRvY3VtZW50
YXRpb24gdG8gb25lIHRvcC1sZXZlbAo+IGl0ZW0sICJDUFUgQXJjaGl0ZWN0dXJlcyIuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0
Pgo+IC0tLQo+Cj4gQXMgYSBzaWRlIGVmZmVjdCwgdGhlIFRPQyBpbiBpbmRleC5odG1sIGVmZmVj
dGl2ZWx5IGdldHMgb25lIGxldmVsIG9mCj4gZGV0YWlsIGxlc3MuIFRoaXMgY291bGQgYmUgZml4
ZWQgYnkgc3BlY2lmeWluZyAnOm1heGRlcHRoOiAzJy4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9h
cmNoLnJzdCAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBEb2N1bWVudGF0aW9u
L2luZGV4LnJzdCB8IDIwICsrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MjggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2FyY2gucnN0CgpJJ3ZlIGJhZGx5IHdhbnRlZCB0byBjbGVhbiB1cCB0aGF0
IHBhZ2UgZm9yIGEgbG9uZyB0aW1lOyB0aGlzIGlzIGEgc3RlcAppbiB0aGF0IGRpcmVjdGlvbiwg
c28gSSdtIGhhcHB5IHRvIHNlZSBpdC4gIEFwcGxpZWQsIHRoYW5rcy4KCkFuZCBubywgd2UgbmVl
ZCAqbGVzcyogZGV0YWlsIG9uIHRoZSBmcm9udCBwYWdlLCBub3QgbW9yZSwgc28gbm8gbmVlZCB0
bwpicmluZyBhbGwgdGhhdCBiYWNrLgoKVGhhbmtzLAoKam9uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
