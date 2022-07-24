Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A609CCA48F
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jUhmSkjK/jik4Xz02k4x+Q8/jOyr5v6mGJpPOgcI32c=; b=kt0zUpOq4bCBh166y13/AbtBX+
	nC4elehCdIVC+U4/FGBl3Dbf4e12BfGhBHXJ0MLcgEMHQiXsm6g15OD9zEFQbqzMj4c4dS4ENGzYW
	byZBNQb/EOlXnVntwC/ZP5RZWs9ofysba3dukFdnhVxrMxmSdmfEtJa8RTEIiSPVsKe7KUcrINCoN
	wmM+J+w79GXYZ+tkZtEDnQFuToc3+acwnrJFN/w8ibpkNJVcOMaw4Z4Hq6PTN2kLS+sUNt8MZRo0C
	b9yuV6bJK5nAS1/l+XnWgy4BrB4bqECZrB1T7MSsHfeGvgyvzxSIv/fUguBTFHWAIs6x6SLOLUpk/
	xUojZ87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFfLX-007nQf-3g; Sun, 24 Jul 2022 17:24:51 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFfLT-007nLS-Or
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 17:24:49 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 666715C00C4;
	Sun, 24 Jul 2022 13:24:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 24 Jul 2022 13:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1658683481; x=
	1658769881; bh=EeV+NW65LBch6mNGDCLaD34T6kF11Zy8g4cFp+FfFpE=; b=m
	hcSLTA/X5S34jIznRsDMB58z1ovfW7VrGARmMvEhIrUs1o6DMHxEqiW3HLnvHNfU
	Ura+VB8voaJQ/yjEEY9tj2ojbd93aILI8N7qnUgwpStwG2TOhnGOrsoMAjNSxR87
	1ZPZDnmxiBPwlLAIp/hkUP/P3dN4OYwPVW6mg5IHZS7njbb8qI0UUlTx9Wns62Sd
	2EpcqNBdtisir4/3WwVk635fvnZOeVbylHBWROXfMUIRFKQlZ68zogIT7LhUZfZJ
	tFwcKbKZXsoz9SXFXMMP/wl4+L2S/5PHcs1VT5yhGs990BTMqqCOMdUe/EPhNFcK
	YiBuBa7AYJXZIbjCTcpdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658683481; x=
	1658769881; bh=EeV+NW65LBch6mNGDCLaD34T6kF11Zy8g4cFp+FfFpE=; b=c
	nJWRDAYNaKT4xPxchZ0Xi4zjs2FbLYgfLW6Whbw4hy4E/UUKF9ucormtJlZrmlxX
	AjjTRn8sSBcYh+0o33N8zgUkDnh5X0EFUiaRYsr/Gs/PZGoSxKjXiSYRELrJLoAC
	8utw7pR61PaC78tFNHzFtijGYNZVxP6r6oGHeGgr/F1CLYNKLD5/x74Yusksnqg3
	F1RZN0E1UQ8A0pQTLVN1JTjtRCDEmqkOvrxwEme1JY1KMnkmzrnL/Ve2fuk9Fkqb
	66szOc3MRQQoMF4qgK6ZNWUP1kBnXm9/NZH4W+BqeEKith338x8uxKJKntFDPfqN
	J+3ODcg2U2Ztbp8slieTA==
X-ME-Sender: <xms:WIDdYpf1RNRqXIHwvyLFh0NTvgwRpt2a5dmqlvjilIYfoeW-s23zQg>
    <xme:WIDdYnNXLPdyyDjVNhNE5jB-qZ6qYQFbjGkEUfVU7q6acl0d7vmFiuigV_b7sYEDW
    52BEgZozYH5OtJiWA>
X-ME-Received: <xmr:WIDdYijm1mMUEDj9HckjAhtAlgeF5kIZ09gGWyvGf5t7xgXmhV-7wNd8xibHW6dTOGXmSmmwRrr6yOcZgfxMHuW-SUq6UcHPDjeYPIMQGmiS0sAa4b8wSPtVAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtiedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfevfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnheptdevhfehhefgvdekteffleduueduheduuedvtdevleelkeev
    vdeuvdeihfekueehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WYDdYi9bC7ej5a8z5_P5LSGugFEfQegcAqHhGKvLZh4Ymy15wt6ULg>
    <xmx:WYDdYlvRWTGxxavkNUOWxjx4HpexuiepRTFa5MCIE7FdlIN8OZya6Q>
    <xmx:WYDdYhGCICBWtHj9wioMiBHwVl9bN3P62nn9axM3ccqRj4N77gDWnw>
    <xmx:WYDdYtK4FpZnBRyjneEv-dfhu9sRCXk2ocidw2oreqp1nPp580pYmQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Jul 2022 13:24:40 -0400 (EDT)
Subject: Re: [PATCH 0/2] riscv: Add macro for multiple nop instructions
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-24b00ffb-dcaa-40b3-8da3-2c2fe26ea3aa@palmer-mbp2014>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <d684ed27-2530-4470-a320-80baadbb6197@sholland.org>
Date: Sun, 24 Jul 2022 12:24:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <mhng-24b00ffb-dcaa-40b3-8da3-2c2fe26ea3aa@palmer-mbp2014>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_102448_388412_7D2C50E0 
X-CRM114-Status: GOOD (  13.83  )
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

SGkgUGFsbWVyLAoKT24gNy8yMS8yMiA5OjE2IFBNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBP
biBUdWUsIDA3IEp1biAyMDIyIDA3OjMwOjU3IFBEVCAoLTA3MDApLCBoZWlrb0BzbnRlY2guZGUg
d3JvdGU6Cj4+IFNvbWUgY2FzZXMgbmVlZCBtdWx0aXBsZSBub3AgaW5zdHJ1Y3Rpb25zIGFuZCBh
cm02NCBhbHJlYWR5IGhhcyBhCj4+IG5pY2UgaGVscGVyIGZvciBub3QgbmVlZGluZyB0byB3cml0
ZSBhbGwgb2YgdGhlbSBvdXQgYnV0IGluc3RlYWQKPj4gdXNlIGEgaGVscGVyIHRvIGFkZCBuIG5v
cHMuCj4+Cj4+IFNvIGFkZCBhIHNpbWlsYXIgdGhpbmcgdG8gcmlzY3YgYW5kIGNvbnZlcnQgdGhl
IFQtSGVhZCBQTUEKPj4gYWx0ZXJuYXRpdmUgdG8gdXNlIGl0Lgo+Pgo+Pgo+PiBIZWlrbyBTdHVl
Ym5lciAoMik6Cj4+IMKgIHJpc2N2OiBpbnRyb2R1Y2Ugbm9wcyBhbmQgX19ub3BzIG1hY3JvcyBm
b3IgTk9QIHNlcXVlbmNlcwo+PiDCoCByaXNjdjogY29udmVydCB0aGUgdC1oZWFkIHBibXQgZXJy
YXRhIHRvIHVzZSB0aGUgX19ub3BzIG1hY3JvCj4+Cj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hc20uaMKgwqDCoMKgwqDCoMKgwqAgfCAxNSArKysrKysrKysrKysrKysKPj4gwqBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2JhcnJpZXIuaMKgwqDCoMKgIHzCoCAyICsrCj4+IMKgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIHzCoCA4ICstLS0tLS0tCj4+IMKgMyBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IFRoYW5rcywgdGhl
c2UgYXJlIG9uIGZvci1uZXh0LsKgIEkgaGFkIHRvIGZpeCB1cCBzb21lIG1pbm9yIGNvbmZsaWN0
cywgYnV0Cj4gaG9wZWZ1bHkgbm90aGluZyB3ZW50IHdyb25nLgoKVGhlIGNvbmZsaWN0cyBhcmUg
YmVjYXVzZSB0aGUgcGF0Y2ggd2FzIHNlbnQgb24gdG9wIG9mIGZpeGVzLCBzcGVjaWZpY2FsbHkK
ZTgzMDMxNTY0MTM3ICgicmlzY3Y6IEZpeCBBTFRfVEhFQURfUE1BJ3MgYXNtIHBhcmFtZXRlcnMi
KS4gU2luY2UgeW91IGFwcGxpZWQKdGhpcyBwYXRjaCB3aXRob3V0IHB1bGxpbmcgZml4ZXMgaW4g
dG8gZm9yLW5leHQsIG5vdyBmb3ItbmV4dCBjb25mbGljdHMgd2l0aCBtYXN0ZXIuCgpSZWdhcmRz
LApTYW11ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
