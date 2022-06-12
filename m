Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D057C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jun 2022 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2r9/Z/DAihSnGGpiggDBmYzgSs4rUePICLxNnaT4Kvw=; b=hWwqK2We0cHB/dg45iO+/KU8v0
	7xKcbbjZVN3P/iywEClE/0W8o2QOHPlwnXQHn6q2+Tfc/zGKDtD6HgugWkLdVwXAxAQA50trkfYU9
	45RdwU79b0Rk9mkdbYqscKJEFGgXyUzsXhLsWRq8EAinRd8ReBJpCg/I7gsvAyeOfZlkxqPJyQWYY
	MfXr8wb18ROFZAE9gPGQFaavVue9NiyZL9Mjrsq6JLk8PUe7toUUmMRAvuSPTHwjyaZgsy2QN67Gt
	oiBCh8mHLsbH8EVAOjtVO1Zw2abO247pRGuDxhtWaOCn/GMNYrYMdx6pn+owQnalC5e0ctlmkMRkg
	Za9aAHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0T6V-00HUfa-62; Sun, 12 Jun 2022 19:18:31 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0T6S-00HUfA-TY
	for linux-riscv@lists.infradead.org; Sun, 12 Jun 2022 19:18:30 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id D12443200583;
	Sun, 12 Jun 2022 15:18:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 12 Jun 2022 15:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655061506; x=
	1655147906; bh=ivdZwOckeXvfhXGcxh8uIbI66ARKA3UmExKTTTKcUVQ=; b=r
	aOMHZgqyNF5/AiyfBn+rIUDSoRMdtRmjbccukjywoEuKKI6TUfhWV5gCELygiMKd
	I1EU4acQMZrHjtkVL9ZfHza04Ru6fPq2qezc1A1KUSjWoiZwKGsCp5Pv9c5U2/0w
	Nk4T/+gWdgmNdDqmIUuZlu4qlgcpYdjnSteF2IRh9vgR28cPmYj2VzcW0QqnETlF
	OEZYwIJ3O+LbKQXwv8cL6Se5qO7RG3FcyAeNefwxhXSXTSxAqnrYXO/D89dZR+Zh
	TUYqhTsXSCaz8kUX+gk7wLd0n1OwyS7nnuYlDe1UgeoFO5xsBIXkc8++DkS6aaEf
	xTm3O9JeC/yJSL07TEz5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655061506; x=
	1655147906; bh=ivdZwOckeXvfhXGcxh8uIbI66ARKA3UmExKTTTKcUVQ=; b=O
	dhwNJhGanfy8JeqNuWZ4eSBG437vai7vVN6QviGTRsiQeKgGbwz49YqXPkzFeIjB
	lza5EkdZVR0JW+zntUBUS5nL1cj8f1DEbnnh+wOwSN11UKx7U3PC2oqpq+vvF4N0
	Gfh9BZMr5hjCM9H01kg8sxdobEqYTIptK765L/IjEUNpUkDArbXWQ75wGadu/al1
	J0fSLxHADbVSasA87bJeoUE3LdT4FlR6T/OmbVhIfnQj3XCyO0fPwbfdDQVKYzQV
	NbJVQc+qTiSkWb9auRozu0nEsRAGBUuqNli7DcU5H+u0wJVthOXvtfAsbrS3DeOj
	t4Afk0sSPAPTKb/AtQt4g==
X-ME-Sender: <xms:ATymYlzxFmf0uaN2InajGdBujfQlih6cjSK3nNVppmaxA-I9MCXcsg>
    <xme:ATymYlSIYxKyObtvBUP0UgrY_a8YcrDQo6Dk_t4U0UZRpBjEfvMeuBdWX8qQQImpU
    yK3HM1Le34ovm2OYg>
X-ME-Received: <xmr:ATymYvXbrL21uaXAiWgpYmivq9epTczXFyRnZZNf2prjDGwYHwkrBP6ucDTdRLJhYD77vap-LM2ZSNqZWAjpj2efrwGwE7zo9SbjsLSQn48KUmS5n6u4CwGbYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduhedgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfh
    iedtheduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:ATymYngx95DczDWiY7iNpCCcGo8OZnq8Fb4DK54FhVx8Au7ej_0kdQ>
    <xmx:ATymYnCklbbZ7WBhGYsGwU7pD4nZJbFpxGnoeOhDZLggZUbXPAFNRQ>
    <xmx:ATymYgJAmmeoCVQRvoCtxowOc76yJVi8raVZb5sY3YWk1n2_m3K6EQ>
    <xmx:AjymYpQ9Yo4Qsa7RZf_EWaH19LuO23mAer4jPFaVQLXqL7rOiZQPGA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jun 2022 15:18:25 -0400 (EDT)
Subject: Re: [PATCH 3/3] riscv: implement cache-management errata for T-Head
 SoCs
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, hch@lst.de, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org
References: <20220610004308.1903626-1-heiko@sntech.de>
 <20220610004308.1903626-4-heiko@sntech.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <2039a18c-5f4f-f33e-eed6-c89f4561af25@sholland.org>
Date: Sun, 12 Jun 2022 14:18:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220610004308.1903626-4-heiko@sntech.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_121829_033157_28A7B6A4 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/9/22 7:43 PM, Heiko Stuebner wrote:
> The T-Head C906 and C910 implement a scheme for handling
> cache operations different from the generic Zicbom extension.
> 
> Add an errata for it next to the generic dma coherency ops.
> 
> Tested-by: Samuel Holland <samuel@sholland.org>

v3 breaks Ethernet on D1, because the packet tx buffers are not aligned to the
cache block size. See my comments on patch 2. With the changes suggested there,
all functionality is again working.

Please drop this tag until I have a chance to test the next version.

Regards,
Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
