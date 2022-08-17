Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1EC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HYb7kVdje5Pil2lR9ZmNFVYbNlZDMJPMbm8qJXnoHdQ=; b=07Ag1tes4QfzVU
	DOHjkVQM+fV3sR9G0KF1ZoXxhUNpjDJtK9N3bdsBlmfCv4j8yjhKBV8nYGKfnYN+0hbmF0Faw0fRD
	CVAzCT2fr5EwE47XRXEJbXROvFSDh9gM8hBfZSL/vUS+//67/womCNPxLLYXwzmkNnt4ybzGFJDDX
	eYLQyOjCRhFtGEzPCG+08KkemHv2Z8cks2OJBiG6Q1rQsA3bCFHCmQqcaVXdnAqveZ4gNZle23+kp
	oBdavIoQ18qAcwv2Cd9wDFSzboeOfFmttj2JZ357rw2s5J2SyT6WdXYJVi0xTSi+yexeWwRaF5qeU
	bzMXduB/8ppw0NwnDrAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJ3N-002Mrx-EM; Wed, 17 Aug 2022 13:25:49 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJ3J-002Mnc-Pq
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 13:25:47 +0000
Received: from workstation5.fritz.box (ip-084-118-157-002.um23.pools.vodafone-ip.de [84.118.157.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id ED6B23F13E;
	Wed, 17 Aug 2022 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660742735;
	bh=PxzTNJ1Jg6c7i4yTxrytPCVQW1rkcheSbZD8jwdGcYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=j2pDzobDmxNvAVvYyJbu2Vl1EvIZ7pnXFfOkDamLxkIHQfGDwxOkJQ/Y15fcnJe3l
	 1lt/nt+R8sMlXZBQdzCwzdRfQ+XaxXqG8VS5afEmrjI0wvp+2efrUoJLXB8oToS2q2
	 Z5I6ON6iipTTPxrwtx1idt3Zk7RqkwkhSfOs6DHzaVy5iOrktPu0NHUVnGGqxHvDZx
	 3yfRyC50swVTR6nV77lh7VV6v7at6WTziEY9p2D8Ly8MrC8ZqmvqtD1eXIjJCdtCJR
	 3BX7xLLklP/pFyzhU28Dqh9khonVQ2nb0l3YAevzKV7loXkmJfe/r7e1i4a/0eeXJs
	 FQpmNnz2nWKZQ==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Atish Patra <atish.patra@wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Date: Wed, 17 Aug 2022 15:25:21 +0200
Message-Id: <20220817132521.3159388-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_062546_237537_98B0CCB7 
X-CRM114-Status: GOOD (  11.23  )
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

VGhlICJQb2xhckZpcmUgU29DIE1TUyBUZWNobmljYWwgUmVmZXJlbmNlIE1hbnVhbCIgZG9jdW1l
bnRzIHRoZQpmb2xsb3dpbmcgUExJQyBpbnRlcnJ1cHRzOgoKMSAtIEwyIENhY2hlIENvbnRyb2xs
ZXIgU2lnbmFscyB3aGVuIGEgbWV0YWRhdGEgY29ycmVjdGlvbiBldmVudCBvY2N1cnMKMiAtIEwy
IENhY2hlIENvbnRyb2xsZXIgU2lnbmFscyB3aGVuIGFuIHVuY29ycmVjdGFibGUgbWV0YWRhdGEg
ZXZlbnQgb2NjdXJzCjMgLSBMMiBDYWNoZSBDb250cm9sbGVyIFNpZ25hbHMgd2hlbiBhIGRhdGEg
Y29ycmVjdGlvbiBldmVudCBvY2N1cnMKNCAtIEwyIENhY2hlIENvbnRyb2xsZXIgU2lnbmFscyB3
aGVuIGFuIHVuY29ycmVjdGFibGUgZGF0YSBldmVudCBvY2N1cnMKClRoaXMgZGlmZmVycyBmcm9t
IHRoZSBTaUZpdmUgRlU1NDAgd2hpY2ggb25seSBoYXMgdGhyZWUgTDIgY2FjaGUgcmVsYXRlZApp
bnRlcnJ1cHRzLgoKVGhlIHNlcXVlbmNlIGluIHRoZSBkZXZpY2UgdHJlZSBpcyBkZWZpbmVkIGJ5
IGFuIGVudW06CgogICAgZW51bSB7CiAgICDCoMKgwqDCoMKgwqDCoMKgRElSX0NPUlIgPSAwLAog
ICAgwqDCoMKgwqDCoMKgwqDCoERBVEFfQ09SUiwKICAgIMKgwqDCoMKgwqDCoMKgwqBEQVRBX1VO
Q09SUiwKICAgIMKgwqDCoMKgwqDCoMKgwqBESVJfVU5DT1JSLAogICAgfTsKClNvIHRoZSBjb3Jy
ZWN0IHNlcXVlbmNlIG9mIHRoZSBMMiBjYWNoZSBpbnRlcnJ1cHRzIGlzCgogICAgaW50ZXJydXB0
cyA9IDwxPiwgPDM+LCA8ND4sIDwyPjsKCkZpeGVzOiBlMzViMDdhN2RmOWIgKCJyaXNjdjogZHRz
OiBtaWNyb2NoaXA6IG1wZnM6IEdyb3VwIHR1cGxlcyBpbiBpbnRlcnJ1cHQgcHJvcGVydGllcyIp
CkZpeGVzOiAwZmE2MTA3ZWNhNDEgKCJSSVNDLVY6IEluaXRpYWwgRFRTIGZvciBNaWNyb2NoaXAg
SUNJQ0xFIGJvYXJkIikKQ2M6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEhlaW5yaWNoIFNj
aHVjaGFyZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLmR0c2kgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL21pY3JvY2hpcC9tcGZzLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hp
cC9tcGZzLmR0c2kKaW5kZXggNDk2ZDNiNzY0MmJkLi5lYzFkZTYzNDRiZTkgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21wZnMuZHRzaQorKysgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLmR0c2kKQEAgLTE2OSw3ICsxNjksNyBAQCBjY3RybGxy
OiBjYWNoZS1jb250cm9sbGVyQDIwMTAwMDAgewogCQkJY2FjaGUtc2l6ZSA9IDwyMDk3MTUyPjsK
IAkJCWNhY2hlLXVuaWZpZWQ7CiAJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKLQkJCWlu
dGVycnVwdHMgPSA8MT4sIDwyPiwgPDM+OworCQkJaW50ZXJydXB0cyA9IDwxPiwgPDM+LCA8ND4s
IDwyPjsKIAkJfTsKIAogCQljbGludDogY2xpbnRAMjAwMDAwMCB7Ci0tIAoyLjM2LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
