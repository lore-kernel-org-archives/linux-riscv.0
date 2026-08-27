Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3534C61DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtHLiGV51cxoNy6HE0zfjcOFVJxPR01XwxeAdWoWrcQ=; b=uMC/2ecEGTfyZh
	wAPzBxCGxgyHPPSlSJi+nKKf5PmaSPk2XsHeBLkVdnFlJm6pF0ksSsR5Ewa5y37futefZ00B+TWjW
	YAEJXSZ+CqkZ42KqLW+0lRa03DvI9tY/cwiNgqqenAkOe6Re8IU8dIjNWJN/fjD4TtiFKij4ZOr+d
	BLoG06wBogcFUQAdrsATdi/TGBXLUxCEQ4m5NxZo6SCzKXCri3JCGWPVpbtNPHLys7E9yfUPve1lR
	KTHWFvsVfUuRe5Bi3Tzy1C+Gx+t7I/auC/Por47hzbq72vf+7Rd7VDtmc5RWoQM/C+HyG5ReO/itz
	9sS7TUe1m9wNjBmK1eOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUeA-00000003Z7U-365t;
	Thu, 27 Aug 2026 07:35:38 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUe8-00000003Z6Y-2aiJ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 07:35:37 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6PKNI2769927;
	Thu, 27 Aug 2026 03:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=c8Rp8
	EOzkyMI8boZQTY40lparKG2slm87g2a/+q88n0=; b=PuDH3FgyU8vSzMgOZX2Y0
	cHTintKCSA12FIhJ8E5lGpwtAO+7IXhKMSE2XS9eYzFBAFIFwWS9w9d8ULFT2AQY
	EPaTSCwUO/IS/DE/1HfdyC3YyxFkTnfZSZZT9He1Mt7I4fhrGtG8UhmjjdyEgANA
	CxvICRsa5w9PEF/XCYZ+EUsgB0vscCxu/+IuDYm+cqSsip9aLxdHW2jIdHqSHej2
	MBZ5CpZwq628qkqR0++5GOoYyJR+HJkpSO6nDdvHqAY0q9C+nw5WBTPICNDudLrR
	q7Y+Bt4jjgnbgCuHkVtoFTAzRWS/CBpO6WGrolB17PTMzeTtyN+DRRhvv2BMX7VE
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4g963pupdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 03:35:27 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 67R7ZQ81015141
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Aug 2026 03:35:26 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 27 Aug 2026 03:35:25 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 27 Aug 2026 03:35:25 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 27 Aug 2026 03:35:25 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com ([10.32.223.174])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 67R7Yroo011772;
	Thu, 27 Aug 2026 03:35:15 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 27 Aug 2026 09:34:46 +0200
Subject: [PATCH v10 1/3] spi: dt-bindings: Add spi-device-addr peripheral
 property
MIME-Version: 1.0
Message-ID: <20260827-ad5529r-driver-v10-1-38f2be07b824@analog.com>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
In-Reply-To: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "David
 Lechner" <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?=
	<nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Jonathan
 Corbet" <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mark Brown
	<broonie@kernel.org>,
        Marius Cristea <marius.cristea@microchip.com>,
        "Marcus
 Folkesson" <marcus.folkesson@gmail.com>,
        Kent Gustavsson <kent@minoris.se>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara
	<daire.mcnamara@microchip.com>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Janani Sunil
	<jan.sun97@gmail.com>, <linux-spi@vger.kernel.org>,
        Kent Gustavsson
	<nedo80@gmail.com>, <linux-riscv@lists.infradead.org>,
        Janani Sunil
	<janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787816093; l=1442;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=ZKN1B2gZYBwuyNnxocxDDBrNCih2O5jweGLmrMvotJQ=;
 b=IZRbWAbXqG/TRJNMABwCNtxNbZapal+ZyJDbLC1opUGm9jhZuYyWKmyJJUjlVBLq1APcaTqXl
 xZBaxnHFMCzBT8S1BFUGhttWlsW1dxFaFauF/0voU6QdTFVp8HV0y4G
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA2MSBTYWx0ZWRfX4Hd7zt0Z6oov
 G7LwT+7SAn6yK5UcZ+6xTV5CshpCwWeFaBBS34Ra80mLCk6+vtrFwBV6upwSp/wcE3Qnwro8axS
 KBHW+8cLBL7xU5qKhpMAiYYXcW9iQNQWzoanvG8IF5BU9gZ483WI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA2MSBTYWx0ZWRfX0Qgo7PAXYOWL
 8GOL7uZc/720pUuGNLMpZj0Bi375KOvRSTqN/lE+VatXs2/kBL59zIirewtcnJuIsSJT/CN8dD/
 thuDQ+UMtJaAzqObpYQtX8nqHqgePi7AiOrresgro2PkkG2TpjvHpuj+FRIpA4B7YpiJYMDm7wm
 PBnzggP8tAvoAfwYuIAj8VZ5zaHC2caft2hPNu+v9utINCgMobBrYztWVnAZAqKORU517MskmVa
 hmUrZyuE3ZpftygkGj5q1/9O4cFvXkfgPRO+QE2e5An81tHLJc5j/E3zbUuTyRDhzmcxiT3k/mP
 QqqR3gklYadUKfFrPBer1CHFkgX2exdUjKkTL62xbUMQqZ134WF8gKuh1hx6Wm+FyskcfjYbVBw
 TW86kxo37joR7DXfXAX5OE7YJUlLMnI9U7NrMCIu1/C83Y/k1IRXyseebV0tddtoKzVhPRpnj8Q
 g1AMnlQmW4LJx38tOBw==
X-Proofpoint-GUID: zrUg4agh5wTfD4kyFf1AkZso6reSFg6j
X-Proofpoint-ORIG-GUID: zrUg4agh5wTfD4kyFf1AkZso6reSFg6j
X-Authority-Analysis: v=2.4 cv=GNc41ONK c=1 sm=1 tr=0 ts=6a8fe8bf cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=XYAwZIGsAAAA:8 a=pGLkceISAAAA:8 a=p7DZuduEnTu05McJuzUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_003536_678234_EE54CC92 
X-CRM114-Status: UNSURE (   9.56  )
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
