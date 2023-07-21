Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA255EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhKm394Pn7DyiPXMaTwVGJVmNMpN/NjZ96ZfpAgE+Zw=; b=xZILaTW/ed4/gB
	Ydr7pwVZZnhOu2WbtFWTNQAusDkNsg+riQLzTVdU5YoV6HR8ecvZ8Xz5VPsvt+swTYocKRyti4g0z
	lXB5MbgAqzp3w/GDzmqrVQyonzzBtN45eDT8WBsvXYt5XXfOQm3NI6C9V+wl9tUbwe6DscqnrRksI
	aalDwaimcx3w6wSgrmtEDR4EygUZOhBCAUmEORPQUSwoEgX8r8FSP4KgrecTfGrW2da4hJWkp9fBr
	l9U231b1heXcOyveH46BRHEa94c1umzL36RgkyoR8K3lgE6KaTm1/+pkP3O3pQ7J9ndArG2Mbn/tO
	CMTjsjnufhCwRf2u2AiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfae-00CbkG-0v;
	Fri, 21 Jul 2023 02:09:56 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfab-00Cbit-0v
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 02:09:55 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CA85424E2EB;
	Fri, 21 Jul 2023 10:09:23 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 10:09:23 +0800
Received: from [192.168.120.43] (171.223.208.138) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 10:09:21 +0800
Message-ID: <42beaf41-947e-f585-5ec1-f1710830e556@starfivetech.com>
Date: Fri, 21 Jul 2023 10:09:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu
	<joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230714104521.18751-1-samin.guo@starfivetech.com>
 <20230720-cardstock-annoying-27b3b19e980a@spud>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230720-cardstock-annoying-27b3b19e980a@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_190953_635168_FDDA6682 
X-CRM114-Status: GOOD (  11.90  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0K5Li76aKYOiBSZTogW1BBVENIIHYxIDAv
Ml0gQWRkIGV0aGVybmV0IG5vZGVzIGZvciBTdGFyRml2ZSBKSDcxMTAgU29DCkZyb206IENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4K5pS25Lu25Lq6OiBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+LCBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiwgS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPiwgUGF1bCBXYWxt
c2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiwgUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4sIEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1PiwgSGFsIEZlbmcg
PGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+LCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
LCBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnLCBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgU2FtaW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZp
dmV0ZWNoLmNvbT4K5pel5pyfOiAyMDIzLzcvMjEKCj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBPbiBGcmksIDE0IEp1bCAyMDIzIDE4OjQ1OjE5
ICswODAwLCBTYW1pbiBHdW8gd3JvdGU6Cj4+IFRoaXMgc2VyaWVzIGFkZHMgZXRoZXJuZXQgbm9k
ZXMgZm9yIFN0YXJGaXZlIEpINzExMCBSSVNDLVYgU29DLAo+PiBhbmQgaGFzIGJlZW4gdGVzdGVk
IG9uIFN0YXJGaXZlIFZpc2lvbkZpdmUtMiB2MS4yQSBhbmQgdjEuM0IgU0JDIGJvYXJkcy4KPj4K
Pj4gVGhlIGZpcnN0IHBhdGNoIGFkZHMgZXRoZXJuZXQgbm9kZXMgZm9yIGpoNzExMCBTb0MsIHRo
ZSBzZWNvbmQgcGF0Y2gKPj4gYWRkcyBldGhlcm5ldCBub2RlcyBmb3IgdmlzaW9uZml2ZSAyIFNC
Q3MuCj4+Cj4+IFRoaXMgc2VyaWVzIHJlbGllcyBvbiB4aW5neXUncyBzeXNjb24gcGF0Y2hbMV0u
Cj4+IEZvciBtb3JlIGluZm9ybWF0aW9uIGFuZCBzdXBwb3J0LCB5b3UgY2FuIHZpc2l0IFJWc3Bh
Y2Ugd2lraVsyXS4KPj4KPj4gWy4uLl0KPiAKPiBBcHBsaWVkIHRvIHJpc2N2LWR0LWZvci1uZXh0
LCB0aGFua3MhCj4gCj4gWzEvMl0gcmlzY3Y6IGR0czogc3RhcmZpdmU6IGpoNzExMDogQWRkIGV0
aGVybmV0IGRldmljZSBub2Rlcwo+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3Iv
Yy8xZmYxNjZjOTc5NzIKPiBbMi8yXSByaXNjdjogZHRzOiBzdGFyZml2ZTogdmlzaW9uZml2ZSAy
OiBBZGQgY29uZmlndXJhdGlvbiBvZiBnbWFjIGFuZCBwaHkKPiAgICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL2Nvbm9yL2MvYjE1YTczYzM1OGQxCj4gCj4gVGhhbmtzLAo+IENvbm9yLgoKCkhp
IENvbm9y77yMCgpUaGFuayB5b3Ugc28gbXVjaO+8gSAKClRoZXJlIGlzIGEgcXVlc3Rpb24gYWJv
dXQgdGhlIGNvbmZpZ3VyYXRpb24gb2YgcGh5IHRoYXQgSSB3b3VsZCBsaWtlIHRvIGNvbnN1bHQg
eW91LgoKTGF0ZXN0IG9uIG1vdG9yY29tbSBQSFkgVjVbMV06IEZvbGxvdyBSb2IgSGVycmluZydz
IGFkdmljZQptb3RvcmNvbW0scngteHh4LWRyaXZlci1zdHJlbmd0aCBDaGFuZ2VkIHRvIG1vdG9y
Y29tbSxyeC14eHgtZHJ2LW1pY3JvYW1wIC4KVjUgaGFzIGFscmVhZHkgcmVjZWl2ZWQgYSByZXZp
ZXdlZC1ieSBmcm9tIEFuZHJldyBMdW5uLCBhbmQgaXQgc2hvdWxkIG5vdCBjaGFuZ2UgYWdhaW4u
CgpTaG91bGQgSSBzdWJtaXQgYW5vdGhlciBwYWN0aGVzIGJhc2VkIG9uIHJpc2N2LWR0LWZvci1u
ZXh0PyAKClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbmV0ZGV2YnBm
L2NvdmVyLzIwMjMwNzIwMTExNTA5LjIxODQzLTEtc2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20K
CiAKQmVzdCByZWdhcmRzLApTYW1pbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
