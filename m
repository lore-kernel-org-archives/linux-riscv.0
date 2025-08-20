Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E262ECA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbrXwkVP0ExuXYv2BBzq+idhMMZHiZj6wR3EN8p8kVo=; b=4b3SEf5oY79Uw3
	K8lChCJmBUZS+4IQH7WKa7GXuNpe/7TgzpgtuUOiZsUZnGxuqXZp1Im9edgd9KUY9zES5LO2XXIjA
	1bq4xJJWqUWi9pPMuy/VJ7vsSYWGBC76gPz8wuOEh/lYyTar4K6SrRqA/chlY6A0fM+Mkkc0JQ2RP
	8llc5fjJjqnjy29jWxRvqvSreN/cDPaD4vjkVuEZjMZZkN8zMBRgw7SF2lSzgWJyoU/BGyH/SgF+H
	Ih1MrXCmBLET1KFuQCELvdHOmh8irNyq3eTm3tAsqhxAYICJcRcMa3S7/j4kJ89AhzcvzOnG4TnMv
	LBKJ7LLOwCPD6DzH3yZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoev1-0000000CsQr-3z9p;
	Wed, 20 Aug 2025 09:15:43 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoe8b-0000000CjJW-1KmP
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 08:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755678335; x=1756283135; i=markus.elfring@web.de;
	bh=bgl3HkIMW7jTPZzwpbGVR+t4E1BtBWuzf9DJGL4AiFM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fd/wt1GCBMzf+10/UiQ6rNtcq8tnHAVQFOG1WsX9pAJHZl1Q3P1gJkBfkQZM2del
	 0a2x3h7Xa4/wLOiZyyBhTL4Ndki16jAqUvgKO0/VsPlgUDzW57uAGCCDzW5AbegqI
	 FkB3EBX8SmT5N+EMSmf73G0uKNzyWH4c3r+dW2iTaDaFHI+LHAjRC57LwtO/hxGu6
	 Up7L1mcQ62x8VRtsfZEni4REYDDwOwgnucEZWgRBV+dDh8xu/c8onJAzC/Wd819vp
	 ztOgYP8KEPZy7vzNBHvdMFyRayhPduOtl6ucXoFrd44Z+UqVllkbsXb5TSyK5SDXD
	 GNH38efdPC11M4UBEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.226]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjBRn-1uILmc1yNR-00feTB; Wed, 20
 Aug 2025 10:25:35 +0200
Message-ID: <568d8b25-8cb5-48f8-850e-0298e3fc456a@web.de>
Date: Wed, 20 Aug 2025 10:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/riscv: prevent NULL deref in iova_to_phys
To: XianLiang Huang <huangxianliang@lanxincomputing.com>,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <joro@8bytes.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Will Deacon <will@kernel.org>
References: <20250820072248.312-1-huangxianliang@lanxincomputing.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250820072248.312-1-huangxianliang@lanxincomputing.com>
X-Provags-ID: V03:K1:fXaK7bGqvBByaoI3ghEUvLpw3Q0ZctNEkLDdwSBlrtDPV/7aUmX
 MH71RlbOR+iJ+zGIEnrx/4/s6Q2XsJpsHZFY9hvIv0ihpTd4RVz6tmXTtymo0PT6WI+lQcK
 9JChPfNAGSXQjv0c11I5ReDabbjL93EJsynPSl+V52XMxOaIpCfNe73TOA1zz/MBxivBHWv
 lJNbvywlut7+ARFLSM0HQ==
UI-OutboundReport: notjunk:1;M01:P0:N+h8Jf5Zvqc=;TgajJXDoI8eSFd7NYlIHFbUzMQl 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 1qvkmFY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_012541_734683_D771AA21 
X-CRM114-Status: UNSURE (   4.21  )
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

4oCmPiAtLS0KPiBDaGFuZ2VzCj4gdjQ6Cj4gLSBDaGFuZ2UgdGhlIHN1bW1hcnkgYXMgTWFya3Vz
IHJlY29tbWVuZHMKPiAKPiB2MzoKPiAtIFJlbW92ZSByZWR1bmRhbnQgcHRlIHZhbGlkYXRpb24g
aW4gcmlzY3ZfaW9tbXVfaW92YV90b19waHlzCj4gLSBJbXByb3ZlIHN1YmplY3QgbGluZSB0byBl
bXBoYXNpemUgcHJldmVudGlvbgrigKYKCkRvZXMgYW55dGhpbmcgaGluZGVyIHlvdSB0byBpbnRl
Z3JhdGUgcmVwZWF0ZWQgcGF0Y2ggcmV2aWV3IGlkZWFzIGJldHRlcgppbnRvIHlvdXIgY29udHJp
YnV0aW9ucz8KClJlcGV0aXRpb246Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZWZmYjI5
YmUtNmQxNC00N2U1LWFiNzEtNDU0MTE5NDY3NzUwQHdlYi5kZS8KaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMjUvOC83LzI4MgoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
