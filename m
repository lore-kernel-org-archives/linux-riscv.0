Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B33CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cgb/+DC54Xa/adu5IxoLLz15EjycZsIV+jZB2PHfLGM=; b=YN5kDtwQV418x+28T5YO+GHf5d
	x2RX0cwax4O3L9b84le/qZ46JxXAPsatHYuA7jqQ7nTHIAiSpokn3jwqFoHHHsJ1QdvsCWz8n+zmr
	jhmrbPlbLQ+/EBcD0ss8X69aRagj+uAVBqtzCJD/5uK7XNh0Y3w5K6BsQkX8JN9w+8+gHv/kop0HQ
	zOxb1C4FgHiwrwaecgFhOZDppaxXmwL1mErkr5uNPvZ+k6NLPXDeV2JgJcHRCK9YGLCw5Q9Z1sWGN
	IJgXVh1NxaJR7bZFpziQsUChSb8AEWQ+FYX7TanwQPsEFJIDXVistKLBOO6PmS3LQn6J91BTeLaQg
	GXJs3erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Cm0-0000000CT9O-3iS0;
	Mon, 13 Oct 2025 07:15:12 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Clw-0000000CT5r-2jOl
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 07:15:11 +0000
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id 7q3ovyDrQZx2i8CllvzquM; Mon, 13 Oct 2025 07:14:57 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 8ClkvbwjarMH58ClkvILxJ; Mon, 13 Oct 2025 07:14:56 +0000
X-Authority-Analysis: v=2.4 cv=eaE9f6EH c=1 sm=1 tr=0 ts=68eca6f0
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7vwVE5O1G3EA:10
 a=MNViUi8bbABe4p9O268A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:Cc:Subject:From:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Qz0nb/M5vgl79rSNKrhGowcyULzQUz8RfrryvD4bgsg=; b=Y42ft8D6REzMdUPE5gEaTksNaB
	QCJmQJMDmPuxO1E1eipVBMvzqEZkKjTFMGc2FvSwgpip0v9xELSj+ecED1ccbGUfzqgcMwLqxqaCZ
	yrXIbZJ6EW3qufkjCAkSR/ubbxI798tfQ30JJ7U3JT3rW970faxcfKZZ/iCTYuVQKf3mSW4mhb4s8
	x4TbKiYEZigbIOjGuzRMi0379/eNSCV/cwtUBw2UIfNJYMpFT7izftR2ikHJfIo0aQi2jnie7wfHm
	UjIEYCARacl4Y89FfHCxAhf+lWRoiHzdFoNONRsDoZOGhRtUe/hn2wi/YIuxyn6MBIi6pPTP522iN
	wwWMjOhQ==;
Received: from c-73-92-56-26.hsd1.ca.comcast.net ([73.92.56.26]:41908 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1v8Clj-00000003JdT-2yvG;
	Mon, 13 Oct 2025 01:14:55 -0600
Message-ID: <eac81c57-1164-4d74-a1b4-6f353c577731@w6rz.net>
Date: Mon, 13 Oct 2025 00:14:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: bhelgaas@google.comk, rishna.chundru@oss.qualcomm.com, mani@kernel.org
From: Ron Economos <re@w6rz.net>
Subject: SiFive FU740 PCI driver fails on 6.18-rc1
Cc: helgass@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.92.56.26
X-Source-L: No
X-Exim-ID: 1v8Clj-00000003JdT-2yvG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-92-56-26.hsd1.ca.comcast.net ([10.0.1.116]) [73.92.56.26]:41908
X-Source-Auth: re@w6rz.net
X-Email-Count: 1
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHJmDSBuMcofRdrSnCWC5ZM9F+oLoMpHIFc4+E9Y+HCoYnairYBCRu4c98I+sWsvz3lX12DqKf55KDbys4hJW/MPU7G9IA6SYyZarDRLnawd04gLr2/R
 CKt3gs+dwv5DnJy0v2HLg2Vr2sbXiPPI0DaOdUDbLjSXt8b/tLwuWCTZ91IMbUlvLJiboj3MfDF1mo7YaMcz7lZYZsb6sKio2Wg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_001508_787199_10A1AFFF 
X-CRM114-Status: UNSURE (   0.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIFNpRml2ZSBGVTc0MCBQQ0kgZHJpdmVyIGZhaWxzIG9uIHRoZSBIaUZpdmUgVW5tYXRjaGVk
IGJvYXJkIHdpdGggCkxpbnV4IDYuMTgtcmMxLiBUaGUgZXJyb3IgbWVzc2FnZSBpczoKClvCoMKg
wqAgMy4xNjY2MjRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IGhvc3QgYnJpZGdlIAovc29j
L3BjaWVAZTAwMDAwMDAwIHJhbmdlczoKW8KgwqDCoCAzLjE2NjcwNl0gZnU3NDAtcGNpZSBlMDAw
MDAwMDAucGNpZTrCoMKgwqDCoMKgwqAgSU8gCjB4MDA2MDA4MDAwMC4uMHgwMDYwMDhmZmZmIC0+
IDB4MDA2MDA4MDAwMApbwqDCoMKgIDMuMTY2NzY3XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2ll
OsKgwqDCoMKgwqAgTUVNIAoweDAwNjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAtPiAweDAwNjAwOTAw
MDAKW8KgwqDCoCAzLjE2NjgwNV0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKg
IE1FTSAKMHgyMDAwMDAwMDAwLi4weDNmZmZmZmZmZmYgLT4gMHgyMDAwMDAwMDAwClvCoMKgwqAg
My4xNjY5NTBdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IEVDQU0gYXQgW21lbSAKMHhkZjAw
MDAwMDAtMHhkZmZmZmZmZmZdIGZvciBbYnVzIDAwLWZmXQpbwqDCoMKgIDMuNTc5NTAwXSBmdTc0
MC1wY2llIGUwMDAwMDAwMC5wY2llOiBObyBpQVRVIHJlZ2lvbnMgZm91bmQKW8KgwqDCoCAzLjU3
OTU1Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogRmFpbGVkIHRvIGNvbmZpZ3VyZSBpQVRV
IGluIApFQ0FNIG1vZGUKW8KgwqDCoCAzLjU3OTY1NV0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNp
ZTogcHJvYmUgd2l0aCBkcml2ZXIgZnU3NDAtcGNpZSAKZmFpbGVkIHdpdGggZXJyb3IgLTIyCgpU
aGUgbm9ybWFsIG1lc3NhZ2UgKG9uIExpbnV4IDYuMTcuMikgaXM6CgpbwqDCoMKgIDMuMzgxNDg3
XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBob3N0IGJyaWRnZSAKL3NvYy9wY2llQGUwMDAw
MDAwMCByYW5nZXM6ClvCoMKgwqAgMy4zODE1ODRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6
wqDCoMKgwqDCoMKgIElPIAoweDAwNjAwODAwMDAuLjB4MDA2MDA4ZmZmZiAtPiAweDAwNjAwODAw
MDAKW8KgwqDCoCAzLjM4MTY4Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKg
IE1FTSAKMHgwMDYwMDkwMDAwLi4weDAwN2ZmZmZmZmYgLT4gMHgwMDYwMDkwMDAwClvCoMKgwqAg
My4zODE3MjRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoCBNRU0gCjB4MjAw
MDAwMDAwMC4uMHgzZmZmZmZmZmZmIC0+IDB4MjAwMDAwMDAwMApbwqDCoMKgIDMuNDg0ODA5XSBm
dTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBpQVRVOiB1bnJvbGwgVCwgOCBvYiwgOCBpYiwgCmFs
aWduIDRLLCBsaW1pdCA0MDk2RwpbwqDCoMKgIDMuNjgzNjc4XSBmdTc0MC1wY2llIGUwMDAwMDAw
MC5wY2llOiBQQ0llIEdlbi4xIHg4IGxpbmsgdXAKW8KgwqDCoCAzLjg4MzY3NF0gZnU3NDAtcGNp
ZSBlMDAwMDAwMDAucGNpZTogUENJZSBHZW4uMyB4OCBsaW5rIHVwClvCoMKgwqAgMy45ODc2Nzhd
IGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IFBDSWUgR2VuLjMgeDggbGluayB1cApbwqDCoMKg
IDMuOTg4MTY0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBQQ0kgaG9zdCBicmlkZ2UgdG8g
YnVzIDAwMDA6MDAKClJldmVydGluZyB0aGUgZm9sbG93aW5nIGNvbW1pdHMgc29sdmVzIHRoZSBp
c3N1ZS4KCjBkYTQ4YzViMmZhNzMxYjIxYmM1MjNjODJkOTI3Mzk5YTFlNTA4YjAgUENJOiBkd2M6
IFN1cHBvcnQgRUNBTSAKbWVjaGFuaXNtIGJ5IGVuYWJsaW5nIGlBVFUgJ0NGRyBTaGlmdCBGZWF0
dXJlJwoKNDY2MGU1MGNmODE4MDBmODJlZWVjZjc0M2FkMWUzZTk3YWI3MjE5MCBQQ0k6IHFjb206
IFByZXBhcmUgZm9yIHRoZSBEV0MgCkVDQU0gZW5hYmxlbWVudAoKZjZmZDM1N2Y3YWZiZWIzNGE2
MzNlNTY4OGEyM2I5ZDdlYjQ5ZDU1OCBQQ0k6IGR3YzogUHJlcGFyZSB0aGUgZHJpdmVyIApmb3Ig
ZW5hYmxpbmcgRUNBTSBtZWNoYW5pc20gdXNpbmcgaUFUVSAnQ0ZHIFNoaWZ0IEZlYXR1cmUnCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
