Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C164FC3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 11:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIQ3bYU6tURcgRipOeJCw07I4C+NrOswpZTg5c0p/44=; b=bKwxsMMOucrBej
	wshPgnjSKJNltUAdst8cs64wAg4OXAfer+Gupfcf2B3rDZXJ0Rt/GWiaLORbF/o3wYyukAyioeceT
	1ek+EEaC3AHnA2kc2FPWuKYXuKYEUroI0Hx2WQ89+b6yh8toXwoVzEzRarY1lpiNS5WJoXZ00Y1yY
	aKowxHxtqX4gcEzE1E55tseLqTAp3jp8sFxJ1qPevl43ah0kis/xfCLAJrlxluxjc8vyRQGPcj9m6
	wVRbmpmiF/xV2h95xLrcResAEudpM/f0ZMxGbSaBViPB+tHOaxA727mkbWQ+rF//79NbBxX4wt0gB
	whMl7aHo8mCj3PuoNF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYOiK-0000000B6Wn-38B5;
	Mon, 29 Jul 2024 11:38:52 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYOiH-0000000B6WH-1GVO
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 11:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722253097; x=1722857897; i=markus.elfring@web.de;
	bh=uEAC/L6ulAgRBK7yshpqZXqeMAXPvPPVORtFM67NtzY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GUBgOF9Xli7CwuuHwjs8OKVQ22hlk8G/lgquh2nvsmRyxvIsBkfspwJbPH1/BSII
	 yjfVL9MVrdTNJC/NahRfATjq29p6zPn7zDOku3Jalk1I4RV5wfkrVFm8ZuKr4XLe2
	 Ju52Wk68jaiIzdeKz9wiTcX6qjYXlhF//rqXOq7miLpqqgyV7uVmOTZ8EKS4gm/TP
	 NGJ3BTVQFCD9IG/WWK9lbynCjxvNTf5fJRD0zyiUpv/APMCwsdBQz9vVelGgE1kSZ
	 v/l4tYVtlmqstPbEcsne8MHRfu6DofA3n/CaQgA9ZkdbaO+RnBa1M5L9sN2I6IVi9
	 bUIUZhdV16eB5Xbayg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPKFF-1sv7ae2P4H-00SrVu; Mon, 29
 Jul 2024 13:38:17 +0200
Message-ID: <633f5f40-481f-4063-ab5d-f383e981b0fe@web.de>
Date: Mon, 29 Jul 2024 13:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Inochi Amaoto <inochiama@outlook.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>
References: <IA1PR20MB4953438ED600110E71F9D092BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
Subject: Re: [PATCH v8 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X
 dmamux
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <IA1PR20MB4953438ED600110E71F9D092BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Provags-ID: V03:K1:GuWTcqeMLKlGqfoVB2IgHQverNB8k9DzW7aGPu5et/thqYoUxeV
 KEaLGtlbDU3IoswCwFmckdVvcDKB8i1tshlQCalFohaz8Rc36HME6RrXwaPL/mz3kfZ1izs
 M9ItePqwVvC53KrJEBxcqW/qvTdzotvUs3yFd+vMfeT0DANp/43whYy5MToOvtrhHGOj91q
 P9KxYNHMlp2nwwq0tFDdA==
UI-OutboundReport: notjunk:1;M01:P0:08Yd6C93Dv8=;WU8IyE2VzIfMaK/x1K0zR89Plvb
 G+1CETmKoqcHYDBdnun/+wkAQTGMZu+RQo7BNlFBGkM/tsNY5wLqFr2hX9U6H5yyDWc62r/0q
 x68A8e8PZLrpDfBcZLDe+gLMsokXWetCaYG1JykNU9teOWQoTZML0X+VpunA9G/dvObgSMBMt
 lE8pL+kfqfgL7ysj3GA0RHavuhnf1cU80yMjt8uIPFuFs8iM5MCkhfGtoKVUcu9qTBg64TgfA
 OD/VEOB+cCqmFahz/HJMzYeQs+X99JVNp4pmj3bDgsNiz4YsE0R6UM6GqLfSuZmtr7nVXLH8P
 +NM6+GYrO+FM4qHustw07vxRnwxMXyViEOoKzuCYncHUQpBySnFtSYBmeHzMY0CgIztQCwfoK
 nZ//FZPxkYOG4MUC9/aRJiV3jv7Z6LU6MAzr8x/GIVr68CeRJEfU2gHkj26NFCYESw4E2S9cY
 8TSooqezO0UP2LZb4tfky0EmHS2jUVNP+OBCjaaxHeggWJ8sLTMbCz4yHTVCryT7FiE4C17vm
 tL+fslgrA3QnWBpPojEvUBhw1x9N03MHgb7qcOTHaJp/H9c5brx5ga5XwuLXhqz5pU/BGVG/Y
 aj9knUeus/+/6TlwH0k44WBGjqfp6zyZA8HqqPzLlQa8toPR4NwkkIDySLOuI0x5ss0Crz2mb
 MiIOFqnv6zO6Ghz8Vw1lO4gTVZSu2X7yf5qVyunCrarhYIraYr9PoEujNzKmek4nsbUH0rbeW
 D6RrV2hIZgJmMmpZ2RESXOPBCXzXEudGTtzZLB+gE4djooAb+mk7aRsjvwIothxNM8uPxKetX
 3h3QH2An+MXbZcxVasF2y70g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_043849_648978_B5666DC9 
X-CRM114-Status: UNSURE (   4.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

4oCmCj4gKysrIGIvZHJpdmVycy9kbWEvY3YxODAwLWRtYW11eC5jCj4gQEAgLTAsMCArMSwyNTkg
QEAK4oCmCj4gK3N0YXRpYyB2b2lkIGN2MTgwMF9kbWFtdXhfZnJlZShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHZvaWQgKnJvdXRlX2RhdGEpCj4gK3sK4oCmCj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOwo+
ICsKPiArCXNwaW5fbG9ja19pcnFzYXZlKCZkbWFtdXgtPmxvY2ssIGZsYWdzKTsK4oCmCj4gKwlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZkbWFtdXgtPmxvY2ssIGZsYWdzKTsK4oCmCgpVbmRlciB3
aGljaCBjaXJjdW1zdGFuY2VzIHdvdWxkIHlvdSBiZWNvbWUgaW50ZXJlc3RlZCB0byBhcHBseSBh
IHN0YXRlbWVudApsaWtlIOKAnGd1YXJkKHNwaW5sb2NrX2lycXNhdmUpKCZkbWFtdXgtPmxvY2sp
O+KAnT8KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTAuMi9zb3VyY2UvaW5j
bHVkZS9saW51eC9zcGlubG9jay5oI0w1NzQKClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
