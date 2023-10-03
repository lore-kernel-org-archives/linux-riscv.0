Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A8EE75434
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8hVcS2oMvql/ysIR/0dxsIBwSEExPHrYFbaq2pcK9E=; b=g+FCI28sba6Rkw
	HqkL4DsPxaEdTrveHpIE9HIQf1BXXtPRkwZU6z9p/V6IAWuJV7QCs8DiIyT++/Uby/5WNvuwCRiCZ
	cmQVog0flZcTHjhjqZg678JEXLqFUHkmr1Y6irYh4mwxUk3DHQD6R+4rJyibLCs4yVPfxryBMUQLF
	1jNJxSeiGq6n4ztuW1WI45AUU27Ol9k5ox3qcym6nb35JZFFGBYWsVBT4spJWQETIJN7Hp2PDsux7
	+78ZMtKTXKF1QTcoATgw1fROSs7WS8Dud+gaEiXcr/8GrKM/IJhjnaqk4QfQGaoWrX7/Svl39waXL
	+bT3c94XwQI++1o3AvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaGf-00E1wn-0L;
	Tue, 03 Oct 2023 07:56:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaGc-00E1w1-0K
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 07:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89A8B6106D;
	Tue,  3 Oct 2023 07:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB0BC433C8;
	Tue,  3 Oct 2023 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696319789;
	bh=WJrq9pvqjjq+UgwdFJc03n5UstUwK2CTaZTIfJNnE60=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Qy6vYmF91Ai1mQb1GLlAghMU9z7UOEwYSDAVtsMuuyoKVY3/ox60QqCsxrAstnMiU
	 nSJ1yDf2h0X534Nj2e1OjKiDXV6z35/fipVku89/CG41TGN2yGqklL4VpB7Zy7/fZb
	 Tx6F7i8e4DT/b8zeDxFppHMi2AWzvUTtdziyrh8QT6617OXE8qmKbdwqwCQAt9C1k/
	 01z2JGboHR7C8sidyXX2ZH6C8NxGcXa9C1+/iCBqR2e3zRtfsBRlqGYy/RsjutjGX7
	 5IrqOR3/DQL8f6CJC83npj6u6AaQlMUeIDQye9JfLRb2VPh2xUPOp6UtRE4OKWpf31
	 QdbCvFPG3iqCw==
Date: Tue, 03 Oct 2023 08:56:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>, Jisheng Zhang <jszhang@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 0/5] Add Milk-V Duo board support
User-Agent: K-9 Mail for Android
In-Reply-To: <MA0P287MB03323A58B068D400E8225E80FEC4A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
References: <20230930123937.1551-1-jszhang@kernel.org> <20231002-slurp-anime-a2308245174e@spud> <MA0P287MB03323A58B068D400E8225E80FEC4A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Message-ID: <F026F534-26E6-4EEC-BC93-2C85D6F9E446@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_005630_182187_CDD7E142 
X-CRM114-Status: GOOD (  13.24  )
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

CgpPbiAzIE9jdG9iZXIgMjAyMyAwMzozMjoyMCBJU1QsIENoZW4gV2FuZyA8dW5pY29ybl93YW5n
QG91dGxvb2suY29tPiB3cm90ZToKPgo+5ZyoIDIwMjMvMTAvMiAyMDoyMiwgQ29ub3IgRG9vbGV5
IOWGmemBkzoKPj4gSGV5LAo+PiAKPj4gT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMDg6Mzk6MzJQ
TSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPj4+IE1pbGstViBEdW9bMV0gYm9hcmQgaXMg
YW4gZW1iZWRkZWQgZGV2ZWxvcG1lbnQgcGxhdGZvcm0gYmFzZWQgb24gdGhlCj4+PiBDVjE4MDBC
WzJdIGNoaXAuIEFkZCBtaW5pbWFsIGRldmljZSB0cmVlIGZpbGVzIGZvciB0aGUgZGV2ZWxvcG1l
bnQgYm9hcmQuCj4+PiBDdXJyZW50bHksIG5vdyBpdCdzIHN1cHBvcnRlZCB0byBib290IHRvIGEg
YmFzaWMgc2hlbGwuCj4+PiAKPj4+IE5PVEU6IHRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBT
RzIwNDIgdXBzdHJlYW0gc2VyaWVzIGZvciB0aGUgdmVuZG9yCj4+PiBwcmVmaXggYW5kIEFSQ0hf
U09QSEdPIG9wdGlvbi4KPj4+IAo+Pj4gTGluazogaHR0cHM6Ly9taWxrdi5pby9kdW8gWzFdCj4+
PiBMaW5rOiBodHRwczovL2VuLnNvcGhnby5jb20vcHJvZHVjdC9pbnRyb2R1Y2UvY3YxODB4Qi5o
dG1sIFsyXQo+Pj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292
ZXIuMTY5NTgwNDQxOC5naXQudW5pY29ybnh3QGdtYWlsLmNvbS8gWzNdCj4+IE90aGVyIHRoYW4g
dGhlIGNvbW1lbnQgSSBsZWZ0LCB0aGlzIHNlZW1zIGZpbmUgdG8gbWUuIEknZCBiZSBoYXBweQo+
PiBlbm91Z2ggdG8gcGljayB1cCB0aGUgcHJlLXJlcXMgZnJvbSB0aGUgb3RoZXIgc2VyaWVzICYg
dGhpcyBvbmUgaWYgb25lCj4+IG9mIHRoZSBTb3BoZ28gbWFpbnRhaW5lcnMgYWNrZWQgdGhlc2Ug
cGF0Y2hlcy4KPgo+Q29ub3IsIGp1c3QgRllJLCBzb3BoZ28gbWFpbnRhaW5lcnMgYXJlIGxvY2F0
ZWQgaW4gQ2hpbmEsIGFuZCB0aGV5IGFyZSBpbiBOYXRpb25hbCBob2xpZGF5IHZhY2F0aW9uIHRo
ZXNlIGRheXMuIEkgdGhpbmsgdGhleSBtYXkgcmVwbHkgdG8gZW1haWxzIGxhdGVyIHRoaXMgd2Vl
a2VuZC4KCkZpcnN0bHksIHRoZXJlIGlzbid0IHNvbWUgc3VwZXIgcnVzaCBoZXJlIHRoYXQgYSBm
ZXcgZGF5cyBob2xpZGF5IHdpbGwgaW50ZXJmZXJlIHdpdGguCkknbSBhY3R1YWxseSBvbiBob2xp
ZGF5cyBteXNlbGYgYXQgdGhlIG1vbWVudCA6KQpTZWNvbmRseSwgeW91J3JlIG9uZSBvZiB0aGUg
c29waGdvIG1haW50YWluZXJzLApyaWdodD8gSXQncyB0aGUgcGVvcGxlIGxpc3RlZCBpbiBNQUlO
VEFJTkVSUyB0aGF0IEkgYW0gdGFsa2luZyBhYm91dCBoZXJlLApiZWluZyBhbiBlbXBsb3llZSBk
b2Vzbid0IG1hdHRlci4KCkNoZWVycywKQ29ub3IuCgo+Cj5UaGFua3MsCj4KPkNoZW4KPgo+PiAK
Pj4gVGhhbmtzLAo+PiBDb25vci4KPj4gCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
