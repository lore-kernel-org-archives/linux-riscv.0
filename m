Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6DBCA0EFC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2He62c/kuZ5fWvzCU4+q4FsN56tkkxT1s1I3hDl11gc=; b=oIBtGsscXRB+4G
	jZ+1PWbrGlvhclYSIXkYNcU/ZxPlZchfbk+AWJItpz20JAFLq07gcGK0rLZGIh/PbSgcjRcpbt+Et
	jQ4uWzDoxNF9goNOVfqCm1hiuzb/mO7PzedFSzD3Id+wsoOjQH5O7LY530yq/0JcIm90lbfYcyheL
	/fCyhtsMUVeJrpru6g0dAe7JVekNWi86zg3tS2Dq1eafJoP1JQzzuOsIHvbmgDR/rEtCXsFRfZMZY
	kF9RR+PB2/XcKbd+Bj9HMzrT/GvFQ/oQYCXgaFNubdk+RHDgE9ML9wHDmbjVOwxOHgjivPXgs2PLc
	VlyIH9hj9l3aWQO/jICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorHp-0000000F5wq-1xZG;
	Wed, 20 Aug 2025 22:28:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomvO-0000000Eb69-2uBc
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 17:48:41 +0000
Received: from [192.168.0.110] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowADXA6hiCqZoxxbODQ--.27375S2;
	Thu, 21 Aug 2025 01:48:18 +0800 (CST)
Message-ID: <ca3404c1-7773-4b47-8a95-b61e5cd9be96@iscas.ac.cn>
Date: Thu, 21 Aug 2025 01:48:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/5] net: spacemit: Add K1 Ethernet MAC
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250820-net-k1-emac-v6-0-c1e28f2b8be5@iscas.ac.cn>
 <20250820-net-k1-emac-v6-2-c1e28f2b8be5@iscas.ac.cn>
 <3c8d191c-efd6-4756-9c71-109236d4c54c@bootlin.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <3c8d191c-efd6-4756-9c71-109236d4c54c@bootlin.com>
X-CM-TRANSID: qwCowADXA6hiCqZoxxbODQ--.27375S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWfKr45KrW5tF15Gr18uFg_yoW3CrcE9F
	1vvwn7Zw1UK3WUGw4fKanFvws8Kr1kXr1xWr9rtws3t342yFyDWFnrK34Sgr43XrWvqrnr
	Gw10vFWIkw17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jgPEfUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_104839_087340_90678795 
X-CRM114-Status: UNSURE (   9.04  )
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

SGkgTWF4aW1lLAoKT24gOC8yMC8yNSAxOTozNCwgTWF4aW1lIENoZXZhbGxpZXIgd3JvdGU6Cj4g
SGkgVml2aWFuLAo+Cj4gT24gMjAvMDgvMjAyNSAwODo0NywgVml2aWFuIFdhbmcgd3JvdGU6Cj4+
IFRoZSBFdGhlcm5ldCBNQUNzIGZvdW5kIG9uIFNwYWNlbWlUIEsxIGFwcGVhcnMgdG8gYmUgYSBj
dXN0b20gZGVzaWduCj4+IHRoYXQgb25seSBzdXBlcmZpY2lhbGx5IHJlc2VtYmxlcyBzb21lIG90
aGVyIGVtYmVkZGVkIE1BQ3MuIFNwYWNlbWlUCj4+IHJlZmVycyB0byB0aGVtIGFzICJFTUFDIiwg
c28gbGV0J3MganVzdCBjYWxsIHRoZSBkcml2ZXIgImsxX2VtYWMiLgo+Pgo+PiBTdXBwb3J0cyBS
R01JSSBhbmQgUk1JSSBpbnRlcmZhY2VzLiBJbmNsdWRlcyBzdXBwb3J0IGZvciBNQUMgaGFyZHdh
cmUKPj4gc3RhdGlzdGljcyBjb3VudGVycy4gUFRQIHN1cHBvcnQgaXMgbm90IGltcGxlbWVudGVk
Lgo+Pgo+PiBUZXN0ZWQtYnk6IEp1bmh1aSBMaXUgPGp1bmh1aS5saXVAcGlnbW9yYWwudGVjaD4K
Pj4gU2lnbmVkLW9mZi1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPgo+
Cj4gSSd2ZSByZWFkIHRocm91Z2ggdGhlIGRyaXZlciBhbmQgaXQncyBsb29raW5nIGdvb2QgdG8g
bWUKPgo+IFJldmlld2VkLWJ5OiBNYXhpbWUgQ2hldmFsbGllciA8bWF4aW1lLmNoZXZhbGxpZXJA
Ym9vdGxpbi5jb20+wqAKPgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgYXBwcmVjaWF0ZSBp
dC4KClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
