Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F67C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 23:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RUAxeZyRO853gbjWqybONc9gUsC65ChBMV4t40rEr0=; b=PLH+Zrepf6/lPR
	D1hVpzDDWOfMvsnUHFGXv0E8KX1xs8vjSmZ+jHyw7bD5RujXMTHJIY0RTTd6J+CkqAWJVPNa5EfQ3
	D8LOZIb/5ppMNwdf2Qs5LwAedzeKBr3f54Wn1MohxJj0Y/Y+wYiWDb4B+qKMjVxrVn5hs3S8MI51Z
	XMIh9BZuFuZDQIkGL1+r3qtwIwagv7GA+GaBbxiRaVoO3ivPzTGuPiX+yD5vaINvvaz/Hk7LhgSU/
	5lm3gsvcLm0Rdid+uD9y7GD0Iw5sKL4zUPlOpVaObok6IWFQZyBBDNWIDVeK4irpJ6Tj5hgpVU6oJ
	phE3f1WKTz6j8Ud6/4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQcQQ-00HZrB-0P;
	Mon, 31 Jul 2023 23:35:42 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQcQN-00HZqA-2d
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 23:35:41 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 36VNZYH7034601
	for <linux-riscv@lists.infradead.org>; Tue, 1 Aug 2023 02:35:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1690846529; x=1693438529;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LSI+78CfW+QT4JpYLaB75hH9TQH+aW5vj75UYJKOLcQ=;
	b=kTKV5jqGVcwFgVBaQYJU+AxlBxqtDo+7Eeq8nndszmR0URMZVNHdVyyKaFZVHuT8
	cfbCzuy/IQvxu8Yx7RYodznI0SVDETLWTb+3dyZ6NOGNsyacWb74Ik60lLqr0Iyg
	956fID9oI3NzQjjJbmWeufKFmpYMaGrkKXBXP4b9sLo3u7b0E1oY6F2CwkgxugWe
	9DKYVi66ffit6dW3+owNkh4S/N/eZtG8wdNhWIc/gGnAl/9L6GGEAU/FOYU5b5oK
	pcCgliA2bG6zgRHqWpmf96Wdhwgv205Op7gR3JK2vXV5KnggQc3v/1GepkgDgrns
	bEPZ9Ow75g9IGxGKyetq4g==;
X-AuditID: 8b5b014d-a17eb70000002178-1b-64c845417c82
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 6E.28.08568.14548C46; Tue,  1 Aug 2023 02:35:29 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <dc3974f0-500c-b7d3-c8ca-df069dbd02a8@ics.forth.gr>
Date: Tue, 1 Aug 2023 02:35:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Zong Li <zong.li@sifive.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
        linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
        iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0pm+1yXuvUGudwNtvNHWV3FytH4VfCnq7_Ws=t-MZP_kQ@mail.gmail.com>
 <3d4d9b22-8451-f4d5-bbd8-117988f3a545@ics.forth.gr>
 <CANXhq0puxuHA2cEyb2+TobkoFTc=7MQqtv7DYbuZdvf0T8+iUQ@mail.gmail.com>
Content-Language: el-GR, en-US
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <CANXhq0puxuHA2cEyb2+TobkoFTc=7MQqtv7DYbuZdvf0T8+iUQ@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsXSHT1dWdfR9USKQcNpBYutv2exW8y6dJzR
	4tcXC4vO2RvYLS7vmsNmse1zC5vFhkuzGC1eXu5htmibxW9x8MMTVovP8yssvixrZ7RouWNq
	8eHubDYHPo8nB+cxeayZt4bR483Llywehzu+sHtsWtXJ5rF5Sb3Hi80zGT1uzIrwuNR8nd3j
	78+tLB6fN8kFcEdx2aSk5mSWpRbp2yVwZUz40cRccJaj4uzsVtYGxodsXYycHBICJhIz325m
	7GLk4hASOM4ocf77L6iEpcTmTy9Zuhg5OHgF7CXmbbQHCbMIqEhMm7yLBcTmFRCUODnzCZgt
	KhAtseHCIzBbWCBW4kPHK7AxIgIKEleWbGQBmc8s8JlZ4sqmL6wQy84xSdzeuBmsillATuL9
	s+2sIDabgKbE/EsHwSZxCgRKfL67nB2ixkyia2sXI4QtL9G8dTbzBEaBWUgOmYVk1CwkLbOQ
	tCxgZFnFKJBYZqyXmVysl5ZfVJKhl160iREca4y+Oxhvb36rd4iRiYPxEKMEB7OSCK/07+Mp
	QrwpiZVVqUX58UWlOanFhxilOViUxHlP2C5IFhJITyxJzU5NLUgtgskycXBKNTCJngib83lr
	2BsHXqfwF6bKc2bydk6L7PfZYmBXK8USOEP1WuorTvZbV7dFzvPfaMsVliu6LTzoXdbeC2+r
	fe865fFFWJTNzNy+8LYm69VFG/Lio1o+S990uydYccTr7N4ZuzbWs3xW7E4VmLJowa8VM7eY
	/m9RYgk8t+mCxOWse8wHVQ8ePCPd9q/+XcufDaZvdeU/K653jJP9G3TzKYdUaegyw7yAoNWX
	H9nry1Rd/3trw5Vnn8/2OP7eUfNTIGVtywLWWs+e9wxnJc9VPKgQ2994lcOydMkxzQZuyw7L
	4BmJvY0Ot71lPv9U0VpT+s6XQVKbN/PCz5k3Q57LB3GZvc3MEdqqVfdKqL2npkKJpTgj0VCL
	uag4EQB9QMtvJAMAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_163540_208853_70076639 
X-CRM114-Status: GOOD (  14.12  )
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

T24gNy8zMS8yMyAxNjoxNSwgWm9uZyBMaSB3cm90ZToKPiBPbiBNb24sIEp1bCAzMSwgMjAyMyBh
dCA1OjMy4oCvUE0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4+
Cj4+IE9uIDcvMjkvMjMgMTU6NTgsIFpvbmcgTGkgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1bCAyMCwg
MjAyMyBhdCAzOjM04oCvQU0gVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4g
d3JvdGU6Cj4+Pj4gKyAgICAgICBpb21tdS0+Y2FwID0gcmlzY3ZfaW9tbXVfcmVhZHEoaW9tbXUs
IFJJU0NWX0lPTU1VX1JFR19DQVApOwo+Pj4+ICsKPj4+PiArICAgICAgIC8qIEZvciBub3cgd2Ug
b25seSBzdXBwb3J0IFdTSXMgdW50aWwgd2UgaGF2ZSBBSUEgc3VwcG9ydCAqLwo+Pj4KPj4+IEkn
bSBub3QgY29tcGxldGVseSB1bmRlcnN0YW5kIEFJQSBzdXBwb3J0IGhlcmUsIGJlY2F1c2UgSSBz
YXcgdGhlIHBjaQo+Pj4gY2FzZSB1c2VzIHRoZSBNU0ksIGFuZCBrZXJuZWwgc2VlbXMgdG8gaGF2
ZSB0aGUgQUlBIGltcGxlbWVudGF0aW9uLgo+Pj4gQ291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUg
aXQ/Cj4+Pgo+Pgo+PiBXaGVuIEkgd3JvdGUgdGhpcyB3ZSBkaWRuJ3QgaGF2ZSBBSUEgaW4gdGhl
IGtlcm5lbCwgYW5kIHdpdGhvdXQgSU1TSUMgd2UKPj4gY2FuJ3QgaGF2ZSBNU0lzIGluIHRoZSBo
YXJ0ICh3ZSBjYW4gc3RpbGwgaGF2ZSBNU0lzIGluIHRoZSBQQ0llIGNvbnRyb2xsZXIpLgo+IAo+
IFRoYW5rcyBmb3IgeW91ciBjbGFyaWZpY2F0aW9uLCBkbyB3ZSBzdXBwb3J0IHRoZSBNU0kgaW4g
bmV4dCB2ZXJzaW9uPwo+IAoKSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbiBJT01NVSBpbXBsZW1l
bnRhdGlvbiBvdXQgdGhlcmUgKGVtdWxhdGVkIG9yIGluIApodykgdGhhdCBjYW4gZG8gTVNJcyBh
bmQgaXMgbm90IGEgcGNpZSBkZXZpY2UgKHRoZSBRRU1VIGltcGxlbWVudGF0aW9uIAppcyBhIHBj
aWUgZGV2aWNlKS4gSWYgd2UgaGF2ZSBzb21ldGhpbmcgdG8gdGVzdCB0aGlzIGFnYWluc3QsIGFu
ZCB3ZSAKYWxzbyBoYXZlIGFuIElNU0lDIGV0Yywgd2UgY2FuIHdvcmsgb24gdGhhdC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
