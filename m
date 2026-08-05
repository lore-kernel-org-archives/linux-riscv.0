Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87366C55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 07:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtHLiGV51cxoNy6HE0zfjcOFVJxPR01XwxeAdWoWrcQ=; b=nNRskUuU19sMru
	85MHCQ+TC8KAryhDhiPbC5eqO3wSoAsRvfsdVjVu3otUoMgAz1UoFeNKLSK34K4zJGYH/0GsZGOt6
	CgxeOFBUfNqlKldNRrTkoew1aQs0ZrrpilTgNgHRRQ42WHccFJHVSpRJZsWmKD/9j+F6JstWm09BQ
	U1erkP2toiyrd3lztqYCoLAlv3KTqKCOPP/dGBGY0qCKXlWkEDC6T4Gb+J8tWt4+923P1qeP1d3cG
	/V/gAJXFAp42ljCWl6eP1Y2KPKDz+n9u3fCNGa0O1f54TBsizf1kpSvc+pXEI51cVYaoqhr+q5Duh
	gbeVL4GbjMyG2WFI7uOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVtU-00000003ODa-3SA7;
	Wed, 05 Aug 2026 07:18:28 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVtR-00000003OCi-2tCu
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 07:18:27 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755iYWS4105096;
	Wed, 5 Aug 2026 03:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=c8Rp8
	EOzkyMI8boZQTY40lparKG2slm87g2a/+q88n0=; b=sPFuwKmmceZENMsVpuFBQ
	xdHxCS4frOuoDasrnz3a6p/rFnJ/xVZV3EOz9rV/T3BudyJ0QpdVIBe5HTwmU8eS
	rP5zAlhPEwT3OWkeNOJXZCGiXuM4r7uEEMj6GdkuAA2V+wjfc/Vz6765HBh0zGkv
	+fj2pdH/N4j/pTWO2uCOgqpb+JGy3aiGCpb8x9TL1Vh5ZNk6+hT7Y8JpQWTwPp0E
	3nq24S0qWUcNxp7isHmaNBGgCIycT+UQZB8CvLCbC80gtzvUeMUYQOS6RZanoXy2
	8ReddNJa3xfuS3vMUFmrKgSIKGNU3UTu9h/R/tTQob1T81rap7QgDBPmH0NaL++k
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4futjf1g5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 03:18:13 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6757ICVh052735
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 03:18:12 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 5 Aug
 2026 03:18:12 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 5 Aug 2026 03:18:11 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6757Hgx5021587;
	Wed, 5 Aug 2026 03:18:03 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Wed, 5 Aug 2026 09:17:41 +0200
Subject: [PATCH v8 1/3] spi: dt-bindings: Add spi-device-addr peripheral
 property
MIME-Version: 1.0
Message-ID: <20260805-ad5529r-driver-v8-1-b41781f5632a@analog.com>
References: <20260805-ad5529r-driver-v8-0-b41781f5632a@analog.com>
In-Reply-To: <20260805-ad5529r-driver-v8-0-b41781f5632a@analog.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?=
	<nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mark Brown
	<broonie@kernel.org>,
        Marius Cristea <marius.cristea@microchip.com>,
        Marcus
 Folkesson <marcus.folkesson@gmail.com>,
        Kent Gustavsson <kent@minoris.se>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara
	<daire.mcnamara@microchip.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Janani Sunil
	<jan.sun97@gmail.com>, <linux-spi@vger.kernel.org>,
        Kent Gustavsson
	<nedo80@gmail.com>, <linux-riscv@lists.infradead.org>,
        Janani Sunil
	<janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785914262; l=1442;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=ZKN1B2gZYBwuyNnxocxDDBrNCih2O5jweGLmrMvotJQ=;
 b=caP6c5QihYaTSJDv5bVwW4+5WT87Ah+A3NBwlbUmhR1mEelc44hfY73MB/UHgdNISVm3sCPwb
 CoM/taB7AtWA+VzNHbpg3fClVm25aPWEg5p918DO4D0xvOtvdbe+M/z
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=YuQ/gYYX c=1 sm=1 tr=0 ts=6a72e3b5 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=XYAwZIGsAAAA:8 a=pGLkceISAAAA:8 a=p7DZuduEnTu05McJuzUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1NSBTYWx0ZWRfX23ozIHjxkrdE
 WtIYUEercaYBFbUGWcSl6xxrM8gWdKvVqjBJl/XRDCSVLRjrkJ96Imt/dDLoC4lCXcLlNTVUCs4
 HPe7My9mZkkvq06FQVG5MtE/lgOgroX3BXk+khcqVhvPbytAEoMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1NSBTYWx0ZWRfXxBmgUflCdtJW
 dsLgRZt9VYKM52z3EXA8gnCV1rSa2/nybPFYm4UOqhn10ZUHcsz3Gq9qzh8nMel77PC6ElU7vrn
 aZVwkhWYiwN7UZYcYoTDeBqIdjN1R9kxP8TJbrfVVJ9lU9bF0fCBcQWwDVXYh9qs12uJwPJnw5P
 8L5Q08r96W3b2sbqPTrJ765U900II7GgVpxzQzeGfasoD6JP4WtU3ILIW5YXqN+p7QP2YGO9YYO
 83+nE/Sf7avWkHngnljU3vAvlsU2P/nrLurg8n5iIRVxu8p9lsz8vFLx/nat7kldXonpUEnKL3y
 p/qH0bIMLhLaJu9IVlMtPrwfV4WN9lAy+JqLZTtK0TuzeEXu0UeByjkefDqwMl3cJVhTayYam60
 +MspoVRUI4NHeDKWlruZyFpbGSfNrV3hKGXYlfT0CGgnT0ddkU370qf7hSWNfBoWoQLEz/7rvFK
 zk6RXZlHBTK7+eNVINA==
X-Proofpoint-ORIG-GUID: ZgpJvYJSkv6nVvtWaZi_sn7sbSqGriOS
X-Proofpoint-GUID: ZgpJvYJSkv6nVvtWaZi_sn7sbSqGriOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_001825_745011_25ED8A60 
X-CRM114-Status: GOOD (  10.70  )
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

U29tZSBTUEkgZGV2aWNlcyBzdXBwb3J0IHNoYXJpbmcgYSBzaW5nbGUgY2hpcCBzZWxlY3QgYWNy
b3NzIG11bHRpcGxlCnBoeXNpY2FsIGNoaXBzIGJ5IGVuY29kaW5nIGEgZGV2aWNlIGFkZHJlc3Mg
aW4gdGhlIFNQSSBmcmFtZSBpdHNlbGYuCkFkZCB0aGUgZ2VuZXJpYyBzcGktZGV2aWNlLWFkZHIg
cHJvcGVydHkgZm9yIGRlc2NyaWJpbmcgdGhlc2UgaGFyZHdhcmUKYWRkcmVzc2VzLiBUaGUgcHJv
cGVydHkgaXMgcGxhY2VkIG9uIHRoZSBTUEkgcGVyaXBoZXJhbCBub2RlIGFuZCBtYXkKY29udGFp
biBtdWx0aXBsZSBhZGRyZXNzZXMuCgpBY2tlZC1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4KUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+ClJldmlld2VkLWJ5OiBNYXJjdXMgRm9sa2Vzc29uIDxtYXJjdXMuZm9sa2Vzc29uQGdtYWls
LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuYW5pIFN1bmlsIDxqYW5hbmkuc3VuaWxAYW5hbG9nLmNv
bT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1wZXJpcGhl
cmFsLXByb3BzLnlhbWwgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3Nw
aS1wZXJpcGhlcmFsLXByb3BzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwKaW5kZXggODgwYTlmNjI0NTY2Li40ODk0
MTk2YzhmOWMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwKQEAgLTE0Miw2ICsxNDIs
MTMgQEAgcHJvcGVydGllczoKICAgICBtaW5JdGVtczogMgogICAgIG1heEl0ZW1zOiA0CiAKKyAg
c3BpLWRldmljZS1hZGRyOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQzMi1hcnJheQorICAgIGRlc2NyaXB0aW9uOgorICAgICAgRGV2aWNlIGFkZHJlc3Nl
cyB1c2VkIHdoZW4gbXVsdGlwbGUgcGVyaXBoZXJhbHMgc2hhcmUgYSBzaW5nbGUgY2hpcAorICAg
ICAgc2VsZWN0LiBUaGUgYXJyYXkgYWxsb3dzIG9uZSBsb2dpY2FsIHBlcmlwaGVyYWwgdG8gY29t
cHJpc2UgbXVsdGlwbGUKKyAgICAgIHBoeXNpY2FsIGRldmljZXMsIHdpdGggb25lIGFkZHJlc3Mg
cGVyIHBoeXNpY2FsIGRldmljZS4KKwogICBzdCxzcGktbWlkaS1uczoKICAgICBkZXByZWNhdGVk
OiB0cnVlCiAgICAgZGVzY3JpcHRpb246IHwKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
