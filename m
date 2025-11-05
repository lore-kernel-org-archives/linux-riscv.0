Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7F5CCFA04
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 08:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qbPDSsWMFq8UvJdlQknbRQo0oao3w6CZc/L2JtxFBz0=; b=VcCfu++v4gMJ2C
	UkzkZXpI/oKV6jWsEpBlsewb6HzluL7Mp8zBRkAlhgeV++LI+xzlEyPtsoynlqi9XMSlkukleV6x7
	2Sp8IO/1iNFpawgdNFfsf1ppcqJ/q1Xgh0B0/di9IxTPn7QubhkGqjfnBIsSIle2PbPVYJPYPnw6r
	g0OGqhQbpSqfOaoKT7D668r8fJoOI0Ma9hjSgM/z26EoHU/qUo5Ya2vJghY0qSYMELXCjO4aZyF2D
	YtjxGT4QxnC2rWsIEFzsK2qmxOsVnnWrqBvruIxRi++rPtaOKOp3gpwCszP8jnQVCFEycnA9B8ArE
	xtLsydhOlqqAhIllnR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYel-0000000DGAC-3zLM;
	Wed, 05 Nov 2025 08:14:15 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYei-0000000DG8T-0Pwx
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 08:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762330382;
	bh=4/aVTDcYEiImDJjO+fflC/Dv77O9woX/qRdgBjUVup8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TDjdDO481W1E/plWs9E6y6f0omKrHkzp/gMC4hd70m42NCR1m343FeEhMV5Ldjevv
	 1I6Sb9dyxhKmcWzjbdONqgW9dQ0ja0PaIw/5R6btx02aakPqoDnLawsOibTgKIViwn
	 vINlfrhw91k/a8ho9k6nZgypzvdiZ/aHgx02jU8E=
X-QQ-mid: esmtpgz12t1762330373t493e4989
X-QQ-Originating-IP: nQiqbRGq6vpRkTervbpAafKGXLnpABZ2stIypPufKs0=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Nov 2025 16:12:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12398856002057575520
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 05 Nov 2025 16:12:46 +0800
Subject: [PATCH] riscv: dts: spacemit: add i2s0 node
MIME-Version: 1.0
Message-Id: <20251105-k1-add-i2s-node-v1-1-9360b57a0c52@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAP4GC2kC/x3MSwqAMAwA0atI1gaagvi5irioTapBqNKCCMW7W
 1y+xUyBLEklw9QUSHJr1jNWUNuA313cBJWrwRrbEZkOD0LHjGozxpMFV+fDOlrqeWCo1ZUk6PM
 f5+V9P5BYKAdhAAAA
X-Change-ID: 20251105-k1-add-i2s-node-bacfb9217d8d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Encrow Thorne <jyc0019@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762330371; l=1679;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=FmZDyhuNr0oLBexd7kHUt1YPDH4ec6MPQJ8xgRgTdNM=;
 b=xret/F+EES85epJ03W+8Fv6VutPMgumLqweBUH3WSLcFpfFZAQ8zzX9lJLgE4ZIImLMJOnr9g
 qrKY9G+25LOAjEtzSWx8iGC+RIU/1MHvNkPEsTQeVAJCbEAIziSEFZ+
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MwP/zDbFYto1gz6IzypyILYZPJfOt7q2gtrrOeCP9OgI3dk2vi63CQNa
	2rxGXPHioZt3ZvYTyrKKmAW/AWeaqOPCY5fhSmi56wyxeEClz2nXLO7gPDIjwSNU1zXaTQS
	45/GXRACxDtaA7QHX+0Qhj2ffYsqyAyiVW1NS02KwXH7QAR5HieVmPcHYs4pnE/rB/FoUm8
	N5DOAF2ESWT0bhiry/D4lOLsWntYjzJRTQjNrdy9StTxblT637F0Fnvh1EK8Dc4poSY1K5b
	nV1p/owD4ZCyAsLaRANpWLsW5FD0tA+/4klWu8Wrn8osJxOLhij658/iOPOJG73qyXARlz4
	1Pxi6yRegYqBVQaL5CfVvrizzOwjnkl4Sk902k0XlbgR0Njh/GIRm0/UDefmvHw8f74CQHj
	PoJKXrb+uxJyAMrhjBLq1uqqR4C5MLaFIwyUFwqnLWH7Q+tSczxKba8QTQn/fCu/Eayeb9E
	fAiSWxxV+Eki5Atk5W1QaJ0+BBxXQUqUpKrMAs++OVyDpiUQoBkIiDq7uwaip48A+/xD0U2
	XLvYojfZt+r2AXFthx7kQ3NVRRTTkgNIVIFmv7eTI/j1GnCD7wEMR5hpCTGHbKgZgXNZ472
	pdP7jEthIVwFyivbXwoDQHvM3elO9zuZS3mPxONPC6OAOUeroG/sNzHEzd9gzoTvZrcvYm9
	PEz67IMWPSxTWg9uzZX9p3V0X6GrdIESS7Dnh7qIAID5YeW2oOMNedMkU7Ys/oPlm9QYqq3
	G42RH+rBX/KDF2gesb6XWVqEE5r20tWpzzHLJvkOXYu6ckr7hVxEbl9DUAWN2S25mvahohg
	e9hv9wHfJvOSaG6AzqAxZ7woB0uplzE3NaLdUBnVaxvBjpsB/N1mBxciQDugICTb63ZtWeF
	ckWgshecuNlxz2CUUj4JCtZ9ojJO6F2hDJ4vbxlJEi3lf8EICcCmHEikt+p1H8z1CDws1lz
	nuRFrvS9zKFkq3RKtejIq4uyDkjrRtVoVdtH4gVeiPkf0vRrUojmRzX6bN5NY1McajkbSeW
	QgHmEa4teYcfrH9r2Q+4iVPOxVNF8qQxKWbKXhzr25ek70Czz4gFjadzf2GafRDvuO7nJJ8
	OVaz+tnJv/fMmc09PBeqlgeS+aZgpxRQBTEfVcle5NWxIfBBkaQhdU=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_001412_498520_1AD0AACF 
X-CRM114-Status: UNSURE (   7.21  )
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

U2luY2UgdGhlIEkyUyBkcml2ZXIgaGFzIGJlZW4gbWVyZ2VkLCBpdOKAmXMgdGltZSB0byBhZGQg
dGhlIEkyUyBub2RlCmluIHRoZSBkZXZpY2UtdHJlZSBub3cuCgpTaWduZWQtb2ZmLWJ5OiBUcm95
IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgfCAyMiArKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazEuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEuZHRzaQppbmRleCBhZjM1ZjljZDY0MzUxM2ExYzY4YTAwY2NmYjNlYWQ2ODhhOGIxOTI5
Li4yNWRlYWMzMThmYTM0OWVmMWQ0NDQ4NDYzNzFjYzM5M2NmNTg1NDVhIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKKysrIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMS5kdHNpCkBAIC04MjMsNiArODIzLDI4IEBAIHVhcnQ5OiBzZXJpYWxA
ZDQwMTc4MDAgewogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwogCisJCQlpMnMwOiBp
MnMwQGQ0MDI2MDAwIHsKKwkJCQljb21wYXRpYmxlID0gInNwYWNlbWl0LGsxLWkycyI7CisJCQkJ
cmVnID0gPDB4MCAweGQ0MDI2MDAwIDB4MCAweDMwPjsKKwkJCQkjc291bmQtZGFpLWNlbGxzID0g
PDA+OworCQkJCWNsb2NrcyA9IDwmc3lzY29uX21wbXUgQ0xLX0kyU18xNTNQNl9CQVNFPiwKKwkJ
CQkJIDwmc3lzY29uX21wbXUgQ0xLX0kyU19TWVNDTEtfU1JDPiwKKwkJCQkJIDwmc3lzY29uX21w
bXUgQ0xLX0kyU19TWVNDTEs+LAorCQkJCQkgPCZzeXNjb25fbXBtdSBDTEtfSTJTX0JDTEs+LAor
CQkJCQkgPCZzeXNjb25fYXBiYyBDTEtfU1NQQTBfQlVTPiwKKwkJCQkJIDwmc3lzY29uX2FwYmMg
Q0xLX1NTUEEwPjsKKwkJCQljbG9jay1uYW1lcyA9ICIxNTNwNl9iYXNlIiwgInN5c2Nsa19zcmMi
LAorCQkJCQkgICAgICAic3lzY2xrIiwgImJjbGsiLAorCQkJCQkgICAgICAic3NwYV9idXMiLCAi
c3NwYSI7CisJCQkJYXNzaWduZWQtY2xvY2tzID0gPCZzeXNjb25fbXBtdSBDTEtfSTJTXzE1M1A2
X0JBU0U+LAorCQkJCQkJICA8JnN5c2Nvbl9tcG11IENMS19JMlNfU1lTQ0xLX1NSQz47CisJCQkJ
YXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MzA3MjAwMDAwPiwgPDMwNzIwMDAwMD47CisJCQkJcmVz
ZXRzID0gPCZzeXNjb25fYXBiYyBSRVNFVF9TU1BBMD47CisJCQkJZG1hcyA9IDwmcGRtYSAyMj4s
IDwmcGRtYSAyMT47CisJCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKKwkJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOworCQkJfTsKKwogCQkJLyogc2VjX3VhcnQxOiAweGYwNjEyMDAwLCBub3QgYXZh
aWxhYmxlIGZyb20gTGludXggKi8KIAkJfTsKIAoKLS0tCmJhc2UtY29tbWl0OiAxNzQ5MGJkMDUy
N2Y1OWQ4NDExNjg0NTdiMjQ1NTgxZjMxNGI1ZmEwCmNoYW5nZS1pZDogMjAyNTExMDUtazEtYWRk
LWkycy1ub2RlLWJhY2ZiOTIxN2Q4ZAoKQmVzdCByZWdhcmRzLAotLSAKVHJveSBNaXRjaGVsbCA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
