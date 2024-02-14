Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9851EC48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIbb+rQassoOD4zTFRIXaFe/vYCbqHwfbh/9RSMRXiE=; b=lMsNspoAVFLHyB
	fSy8/NasCWC5Fo8vSSNuvCc3BpWZpYtsrXdK1hsRLYRWbmN3/t1YJBtGCnlAz7Dg7pz9nviewHW0S
	e6GEP5a0PlSwCJkSHteX6c1xAORRC4NocvA46EUejXE/SduBs6ITJdRKibvX1u4T4a/N/qGQIgtaJ
	1/DvSMPEym9O4A6AyIXEKzf2WJlZQm8baEGTNsvlvPIMh1fEBJE2uvok3AS6pTRpbvzI90Gjw2Agr
	zeBzWiD38tH/Co5d6m8Reo+gvZ59fRDQsS+NpF03HK2vUi1gQTINW7AZBt0wYHvQ2HxwrN3Ib4tx2
	hqlwDcXEGDTlaLBknI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBhm-0000000CMrp-3vYJ;
	Wed, 14 Feb 2024 09:37:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBfK-0000000CKfX-3SQc
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Feb 2024 09:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fqDzN5QveWm0+G4b7DR8g9GTPuldX5UmasrM3ObdRjc=; b=bs7zQA8hW4IWCCvVV421dg7KhX
	22F6anSp+jJJK9JEIxoqJTXsh30r/D7BdhH/S2Xq4Ljnmm1C7PTZPPgT9U35c/gQIxq1gqraQIobD
	mICuxjp53berPSli+/KL3PPOri9atNbYt/yQxCmBESrApXFWWYiGKGaK4mTQdezLrulgE/JP2KmEb
	Tr8uM4EOI/K//jTjAPuTL7leWSohMw7Enr6xOyLO4f8OOVNNzwQKbFTwqcqfDMDY601EpO7UFB354
	oS1EQliBb1Bp/xi2BGHht5XCE8oByxQ30Etvaviu2XU58wTiqSbM57KneQuU2E/q48/iNI/IGdlP8
	NDVxjU3Q==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBfD-0000000GAXE-2wsp
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:34:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf3-0005YD-2i; Wed, 14 Feb 2024 10:34:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBez-000fF4-I9; Wed, 14 Feb 2024 10:34:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBez-004Y6j-1Z;
	Wed, 14 Feb 2024 10:34:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-pwm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v6 102/164] pwm: sifive: Simplify code to determine the pwmchip's parent device
Date: Wed, 14 Feb 2024 10:32:29 +0100
Message-ID: <78da5070d3ff5767da6f1c053d069c1e25229375.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=890; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=oCAKebuqHSeH/4tgGopdJ6Bi27WibNWJFsnUPEjccBk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjA8ltQP5k9zuvjhK0PbDbch+QzeP4Lz6JzR HAdU46NNOiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyIwAAKCRCPgPtYfRL+ TqvnCACr5ap2Fd394As636wZ6WZn4HtMa8KKX8LrWyDU1O3m7HEmOD1ZgPhzMOvBqppFb3Fwtia 1f0KgSftI8ZYLzl9jK3Wt7hJeG1OCGXfan3YCNa3AqHKN8vjDUlcz5OOJ8pi71lQc4cZZ1h87E9 9gmefP21/21cc2vSmsxYsmjTX6cRlQwLZQhRL/2tokWupJfKa0cnEgvNNKIe/KJEKcvQmdPKbC7 yjQ2xxg7Xa6Ga/ZRWmj5dUNVy0vgynQYgCefQ7qUEWBCaSJND8xV1m8X4woRwRn5r125FW1RJ5A edaE7gnYfMwrY9NGihedVYc1wZynTpD0K2vfNQfWSYjdrQIe
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_093448_113113_9EEC1C72 
X-CRM114-Status: GOOD (  12.00  )
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

VGhlcmUgaXMgYWxyZWFkeSBhIHBvaW50ZXIgdG8gdGhlIHB3bWNoaXAsIG1ha2UgdXNlIG9mIGl0
IGRpcmVjdGx5Cmluc3RlYWQgb2YgdXNpbmcgdGhlIHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhICpk
ZGF0YSBqdXN0IG9idGFpbmVkIGZyb20KaXQuIFRoaXMgYWxzbyBoYXMgdGhlIGFkdmFudGFnZSBv
ZiBub3QgdXNpbmcgc3RydWN0CnB3bV9zaWZpdmVfZGRhdGE6OmNoaXAgYW55IG1vcmUgd2hpY2gg
d2lsbCBiZSBkcm9wcGVkIHNvb24uCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zaWZp
dmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMvcHdtL3B3
bS1zaWZpdmUuYwppbmRleCAwODllNTBiZGJiZjAuLmNmMDBmOTAyZmMzMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwpA
QCAtMTg1LDcgKzE4NSw3IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJaWYgKCFlbmFibGVkKSB7CiAJ
CXJldCA9IGNsa19lbmFibGUoZGRhdGEtPmNsayk7CiAJCWlmIChyZXQpIHsKLQkJCWRldl9lcnIo
ZGRhdGEtPmNoaXAuZGV2LCAiRW5hYmxlIGNsayBmYWlsZWRcbiIpOworCQkJZGV2X2VycihjaGlw
LT5kZXYsICJFbmFibGUgY2xrIGZhaWxlZFxuIik7CiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJfQot
LSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
