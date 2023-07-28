Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D6DC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JIODz3T1l93xqxmNnWtDdjyWw/idkw2K8K9FzAWs5So=; b=aOhJzxY7ySJjSC
	iDWc2cWO9duVRdBRJKFFw35GaizZwZ7Y5AISpUx2GiD1aF0NCS3Nn7K3qshsd4m56FzS4c0pfPSX5
	zQ/oi2JCeur7460p2dZqELoborQpU771mzmqoYxXjdbreoYEg/qJsG+EUhzjm17aAZyfSs2HW6+C8
	xtyd5Fk06j/YeJgUDsu71mK6P9RbnNuRrBu6n/mcv6nymQabwqCLczpSiwLDgb8D3jH0qzHxi8X6r
	G+l6sXx3Q3E0mllSZFMxBD3IaRlN38yzpG+cZ66Ir/6wvxGqrD5ypDzhucUNFaQ0h5NthMQZSvcxZ
	Wvs9ADRa6f9ARgPC75CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMKB-003ITd-1f;
	Fri, 28 Jul 2023 12:12:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMK8-003ISu-1c
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 12:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690546320; x=1722082320;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JGssJGLQ0T3qf9XcXhh5d5FevqWgguMUf0rr1cM7iFs=;
  b=EH3NDIEJIwTWjIlzG76e06+Bb2UAbGpuWJ9U/NFS8+uA08Bck4qOC/DK
   NrlCf/ze7EBS5iuPp60YaRas3SNxadwZCKyAgDPcYz4FeHnM4re8K+OD3
   nQ64HFbGwUAQwP7pT+TOdi7rcUAfkOXzi+QPxyRjf+3bieJWhUfLqk12I
   1c/vagbIp3y+bgfeojUaO4sc7TqYMVpVXgwv8QvAizkrGbR4mArvduFhO
   xaJ5OHN77APfJ9QWj5v1NeoUKTT0GtJpDPiy7yORoSTonNiOsCN90SA3U
   Ze7cBWDeO+E2t9HHsUiLPuAbQJCdEfdU0LKEExDmGrMW2SAgZ3X6xPzBq
   A==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="163721077"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 05:11:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 05:11:54 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 05:11:52 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
Subject: [PATCH v3 0/7] PCI: microchip: Fixes and clean-ups
Date: Fri, 28 Jul 2023 13:11:42 +0100
Message-ID: <20230728121149.1606382-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_051200_618667_8E0AFCD0 
X-CRM114-Status: GOOD (  10.38  )
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

RnJvbTogRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+CgpUaGlz
IHBhdGNoIHNlcmllcyBjb250YWlucyBmaXhlcyBhbmQgY2xlYW4tdXBzIGZvciB0aGUgTWljcm9j
aGlwIFBvbGFyRmlyZSBTb0MgUENJZSBkcml2ZXIKClRoZXNlIHBhdGNoZXMgYXJlIGV4dHJhY3Rl
ZCBmcm9tIHRoZSBsaW5rIGJlbG93IHRvIHNlcGFyYXRlIHRoZW0gZnJvbSB0aGUgb3V0Ym91bmQg
YW5kIGluYm91bmQKcmFuZ2UgaGFuZGxpbmcgd2hpY2ggaXMgdGFraW5nIGNvbnNpZGVyYWJsZSB0
aW1lLgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDExMTEy
NTMyMy4xOTExMzczLTEtZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbS8KClRoZXNlIHBhdGNo
ZXMgYXJlIHJlZ2VuZXJhdGVkIG9uIHY2LjUtcmM0LgoKTWFpbiBjaGFuZ2VzIGZyb20gdjI6Ci0g
UmV3b3JrZWQgIkdhdGhlciBNU0kgaW5mb3JtYXRpb24uLi4iIGFzIHN1Z2dlc3RlZCBieSBCam9y
bgotIG1lcmdlZCAnR2F0aGVyIE1TSSBJbmZvcm1hdGlvbi4uLiIgYW5kICJSZW5hbWUgYW5kIHJl
ZmFjdG9yIiBhcyBzdWdnZXN0ZWQgYnkgQmpvcm4KLSBSZS1nZW5lcmF0ZWQgb24gdjYuNS1yYzQK
Ck1haW4gQ2hhbmdlcyBmcm9tIHYxOgotIERyb3BwZWQgIlJlbW92ZSBjYXN0IHdhcm5pbmcgZm9y
IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIi4gVGhpcwogIGhhcyBiZWVuIG92ZXJ0YWtlbiBi
eSBhIHBhdGNoIHNlcmllcyBmcm9tIEtyenlzenRvZiBXaWxjenluc2tpLgotIEltcHJvdmVkIHRo
ZSBjb21tZW50IGZvciAiRW5hYmxlIGJ1aWxkaW5nIGRyaXZlciBhcyBhIG1vZHVsZSIgdG8KICBj
bGFyaWZ5IHdoYXQgZW5hYmxlcyBidWlsZGluZyB0aGUgZHJpdmVyIGFzIGEgbW9kdWxlLgotIFNw
bGl0ICJHYXRoZXIgTVNJIGluZm9ybWF0aW9uIGZyb20gaGFyZHdhcmUgY29uZmlnIHJlZ2lzdGVy
cyIsCiAgZm9yIGNsYXJpdHksIGludG86CiAgIC0gIkdhdGhlciBNU0kgaW5mb3JtYXRpb24gZnJv
bSBoYXJkd2FyZSBjb25maWcgcmVnaXN0ZXJzIiBwdXJlbHkKICAgICAgY2hhbmdpbmcgdGhlIG9m
IHNvdXJjZSBvZiBNU0ktcmVsYXRlZCBpbmZvcm1hdGlvbiAoTnVtIE1TSXMgYW5kCiAgICAgIE1T
SSBhZGRyZXNzKSBmcm9tICNkZWZpbmVzICh3aGljaCBjYW4gYmUgaW5jb3JyZWN0KSB0byBGUEdB
CiAgICAgIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzICh3aGljaCBpcyB0aGUgdWx0aW1hdGUgc291
cmNlIG9mIHRydXRoKSwKICAgICAgYW5kIGEKICAgLSAiUmVuYW1lIGFuZCByZWZhY3RvciAuLi4i
IHBhdGNoIGFzIGEgZnVuY3Rpb24ncyBjb2RlIGlzIG5vdyBjbGVhcmx5CiAgICAgIHVucmVsYXRl
ZCB0byBpdHMgY3VycmVudCBuYW1lLgoKY2M6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+CmNjOiBMb3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3Jn
PgpjYzogIktyenlzenRvZiBXaWxjennFhHNraSIgPGt3QGxpbnV4LmNvbT4KY2M6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+CmNjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUu
Y29tPgpjYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpjYzogbGludXgtcGNpQHZn
ZXIua2VybmVsLm9yZwoKRGFpcmUgTWNOYW1hcmEgKDgpOgogIFBDSTogbWljcm9jaGlwOiBDb3Jy
ZWN0IHRoZSBERUQgYW5kIFNFQyBpbnRlcnJ1cHQgYml0IG9mZnNldHMKICBQQ0k6IG1pY3JvY2hp
cDogRW5hYmxlIGJ1aWxkaW5nIGRyaXZlciBhcyBhIG1vZHVsZQogIFBDSTogbWljcm9jaGlwOiBB
bGlnbiByZWdpc3Rlciwgb2Zmc2V0LCBhbmQgbWFzayBuYW1lcyB3aXRoIGh3IGRvY3MKICBQQ0k6
IG1pY3JvY2hpcDogRW5hYmxlIGV2ZW50IGhhbmRsZXJzIHRvIGFjY2VzcyBicmlkZ2UgYW5kIGN0
cmwgcHRycwogIFBDSTogbWljcm9jaGlwOiBDbGVhbiB1cCBpbml0aWFsaXNhdGlvbiBvZiBpbnRl
cnJ1cHRzCiAgUENJOiBtaWNyb2NoaXA6IEdhdGhlciBNU0kgaW5mb3JtYXRpb24gZnJvbSBoYXJk
d2FyZSBjb25maWcgcmVnaXN0ZXJzCiAgUENJOiBtaWNyb2NoaXA6IFJlLXBhcnRpdGlvbiBjb2Rl
IGJldHdlZW4gcHJvYmUoKSBhbmQgaW5pdCgpCgogZHJpdmVycy9wY2kvY29udHJvbGxlci9LY29u
ZmlnICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1t
aWNyb2NoaXAtaG9zdC5jIHwgMzkzICsrKysrKysrKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMjMzIGluc2VydGlvbnMoKyksIDE2MiBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogNmVh
YWUxOTgwNzYwODA4ODZiOWU3ZDU3ZjRhZTA2ZmE3ODJmOTBlZgotLSAKMi4yNS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
