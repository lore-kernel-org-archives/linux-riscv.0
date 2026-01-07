Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67FCFD65E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7rwrbS0okjvr1GQNLyYvU/v8bozR5EoukupT3hw/Ec=; b=PP60awbFvfgn98
	A0+u8onTvlPd+XWRHg1uliQJxgTlFNOIPoaenPkY0z8onnIo0p39Ve4vhE6Awr+kmqRfW2nc7ypIL
	3/xYzkDRoayy26Zru7D24ig9LRCs8joYFvk59YmMnriOk5Jixm9bYrltLZybTEEtzhLWuY4JMbk0G
	1ERq2raHmscSAkAsT0RbMdnkdEMTIFePtrQbNP/OdKTd6i0S8e9HUctNlL5TGb1Yu1/l4BchM6ocm
	2DQluXObuJrwyJf7ZgnuoJKQ1p+jzCCTGhY+PLPMqjucHTj0ZqTI7ZmAxEicdFK3bJKbvY6qnebnv
	pCcHodNge50Jyyi+7wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPy-0000000FI12-2mWd;
	Wed, 07 Jan 2026 16:29:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPp-0000000FHtA-0f9O
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42fbc544b09so1587815f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803383; x=1768408183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGfMB1SwaAERf8A9+EJZzOGOMSv16YGZ4dbapv2DrTs=;
        b=2PNH5mizUW7AklaO/ySxsQAPCWnqy4RHgaX6TICaxFgfCNJ8hQzYu6Ori0KsGnwJ+B
         oWHvBaPHZPnwMii31t0+A53HCTzDxzud7gpG7WPb5yal4Lff7xPjPPvGgNq4OSzamR5+
         rBmIQv8mQMhotO0lsucbTjftQ5Tzs7BVFITE/8X/GQdDLyiEFg9r6NHFSAXuyl1lIFgz
         k3RRK9Ez9iMQJMTU7ynualng8MoTzfqZeR0/CQTulFWPR4q9Q2y0avqYi3CbjsWGkVHI
         ClpcZ1gFSJ93PRdyFvKswhBQi+8xTrWRMII9+I6aXzUrDM3S5outGrSYiU4BAtwzt6zp
         gcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803383; x=1768408183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGfMB1SwaAERf8A9+EJZzOGOMSv16YGZ4dbapv2DrTs=;
        b=nQ/w7aVlX5nE4ZK/yOiKwagR4ggk0VLcItDZaZFDJODadsBKIcVEP/HmroIILq/bOC
         1fP88NfxrMKyIrXTx82uuagVAbWw4C6Z3fq9SJg+vcDvSZjmTrQAK9H/kot+XwuZshy+
         FHo9gzx0PDhZS2kG7OJE+ONLWQ0EI19T3MGm8ck2N/SPVCbsVE0xPCdTyyrcZ9kgjiox
         N59XD9CDITWDFCsiy7NgWq6lYoyeR8v3o6kUZpXuXu3q5ERa5qsO7/7lgSpDryZyTW7y
         8Xu68x4IT2JrlPiFW5O9vRy/PZ/y0W1cMQ5GTqVXFbBv2Fs412Yfspki+yHiwGMT5Sy5
         VMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+lDRd0mCcT1S/4L5F2oTXSWvNbABGdku/Oz29AezUDA12tayD06S7jIU23zcCMFsznLp2UCQk0AJOOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGXLPWIdkub5W+Ik8cay/U0lOgiAIoU4RY6tzzglmYfazEzhzr
	rltJdmjFkhMUAHozPHalLeC+U22SIntGeMkYL8nIhI65A6YhMuvvwpU39aCNjWyRzueo
X-Gm-Gg: AY/fxX5PnIa9kpdTdPCBvvfm1/n1Qq9zFmEvIZZoJMgUet9TCvCgaPsS0e3+YKQ0427
	Jelq+n0fWKdjQ1YcwKEIvWJD8gBtYs1GMC+X6u4nAB44xtNvzwTOQbmx8pjj2kFOO+SpbJPAA5M
	pZh4NG332cNkeT1Xc7rKI0O8a7XAXF6ChWH4BgYXHuekbnddtZY7at2CVey7hlIvJpZ2DG5dhdz
	j4KXk8Gtfq1+8Bzuv7dt2pRF/Pmd3ybRyeIGzWPq16Tlb7rEYUV9E3nqQGCMoTQiLsbepAx+JvW
	jkTtvJWwIG4rDcnJ7UGAj+FIRTGDp9TDqfZhd2RtPazinuFq7hFBJMIJ5hMDKFeu9X1NELRidFL
	+tQAzHWz8NdJF4RecEBx+sc+BgxH0wq4cFy6NRh1GGLFQW3WDI9ZLdsUoN2UVJ+zMEAWhSCD7HA
	bCq/7V+O9TDXhg//x5BA==
X-Google-Smtp-Source: AGHT+IHYX8ERrMEjplERjC6ixgzkBNgkXhYStxw+rahyUBYDlRtMCSfk+AGXhNnNExJ8kz9EYuCSDQ==
X-Received: by 2002:adf:f4c9:0:b0:431:907:f324 with SMTP id ffacd0b85a97d-432c38d2312mr3237384f8f.61.1767803383134;
        Wed, 07 Jan 2026 08:29:43 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:42 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common header
Date: Wed,  7 Jan 2026 16:28:28 +0000
Message-ID: <20260107162829.416885-6-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082945_223406_18C3ABC1 
X-CRM114-Status: GOOD (  10.56  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKTW92ZSB0aGUgSVBD
IHNoYXJlZC1tZW1vcnkgaHlwZXJjYWxsIElEIGZyb20gYXJjaGl0ZWN0dXJlLXNwZWNpZmljCmhl
YWRlcnMgaW50byBpbmNsdWRlL2xpbnV4L2Jhby5oLgoKU2lnbmVkLW9mZi1ieTogSm/Do28gUGVp
eG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgotLS0KIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2Jh
by5oICAgICAgICAgICB8IDUgKystLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vYmFvLmggICAg
ICAgICB8IDUgKystLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYmFvLmggICAgICAgICB8IDcg
KysrLS0tLQogZHJpdmVycy92aXJ0L2Jhby9pcGNzaG1lbS9pcGNzaG1lbS5jIHwgNSArLS0tLQog
aW5jbHVkZS9saW51eC9iYW8uaCAgICAgICAgICAgICAgICAgIHwgMyArKysKIDUgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vaW5jbHVkZS9hc20vYmFvLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9iYW8uaAppbmRl
eCA1ZWNlOWVjYjE0NTUuLjdkMTM1OTFmZTY2OSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vaW5jbHVk
ZS9hc20vYmFvLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vYmFvLmgKQEAgLTE2LDE0ICsx
NiwxMyBAQAogI2luY2x1ZGUgPGxpbnV4L2FybS1zbWNjYy5oPgogI2luY2x1ZGUgPGxpbnV4L2Jh
by5oPgogCi1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYmFvX2lwY3NobWVtX2h5cGVyY2Fs
bCh1bnNpZ25lZCBsb25nIGh5cGVyY2FsbF9pZCwKLQkJCQkJCSAgIHVuc2lnbmVkIGxvbmcgaXBj
c2htZW1faWQpCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYmFvX2lwY3NobWVtX2h5cGVy
Y2FsbCh1bnNpZ25lZCBsb25nIGlwY3NobWVtX2lkKQogewogCXN0cnVjdCBhcm1fc21jY2NfcmVz
IHJlczsKIAogCWFybV9zbWNjY19odmMoQVJNX1NNQ0NDX0NBTExfVkFMKEFSTV9TTUNDQ19GQVNU
X0NBTEwsIEFSTV9TTUNDQ19TTUNfMzIsCiAJCQkJCSBBUk1fU01DQ0NfT1dORVJfVkVORE9SX0hZ
UCwKLQkJCQkJIGh5cGVyY2FsbF9pZCksCisJCQkJCSBCQU9fSVBDU0hNRU1fSFlQRVJDQUxMX0lE
KSwKIAkJICAgICAgaXBjc2htZW1faWQsIDAsIDAsIDAsIDAsIDAsIDAsICZyZXMpOwogCiAJcmV0
dXJuIHJlcy5hMDsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYmFvLmggYi9h
cmNoL2FybTY0L2luY2x1ZGUvYXNtL2Jhby5oCmluZGV4IGM3YjdlYzYwYzA0Mi4uNDA5ZjQwNThk
NTZlIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2Jhby5oCisrKyBiL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20vYmFvLmgKQEAgLTE2LDE0ICsxNiwxMyBAQAogI2luY2x1ZGUgPGxp
bnV4L2FybS1zbWNjYy5oPgogI2luY2x1ZGUgPGxpbnV4L2Jhby5oPgogCi1zdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgYmFvX2lwY3NobWVtX2h5cGVyY2FsbCh1bnNpZ25lZCBsb25nIGh5cGVy
Y2FsbF9pZCwKLQkJCQkJCSAgIHVuc2lnbmVkIGxvbmcgaXBjc2htZW1faWQpCitzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgYmFvX2lwY3NobWVtX2h5cGVyY2FsbCh1bnNpZ25lZCBsb25nIGlw
Y3NobWVtX2lkKQogewogCXN0cnVjdCBhcm1fc21jY2NfcmVzIHJlczsKIAogCWFybV9zbWNjY19o
dmMoQVJNX1NNQ0NDX0NBTExfVkFMKEFSTV9TTUNDQ19GQVNUX0NBTEwsIEFSTV9TTUNDQ19TTUNf
NjQsCiAJCQkJCSBBUk1fU01DQ0NfT1dORVJfVkVORE9SX0hZUCwKLQkJCQkJIGh5cGVyY2FsbF9p
ZCksCisJCQkJCSBCQU9fSVBDU0hNRU1fSFlQRVJDQUxMX0lEKSwKIAkJICAgICAgaXBjc2htZW1f
aWQsIDAsIDAsIDAsIDAsIDAsIDAsICZyZXMpOwogCiAJcmV0dXJuIHJlcy5hMDsKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYmFvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Jhby5oCmluZGV4IGYwNGU2Y2QzM2ZhOS4uZDE2OGFiYTdkOGVjIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2Jhby5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYmFv
LmgKQEAgLTE4LDEzICsxOCwxMiBAQAogCiAjZGVmaW5lIEJBT19TQklfRVhUX0lEIDB4MDgwMDBi
YTAKIAotc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGJhb19pcGNzaG1lbV9oeXBlcmNhbGwo
dW5zaWduZWQgbG9uZyBoeXBlcmNhbGxfaWQsCi0JCQkJCQkgICB1bnNpZ25lZCBsb25nIGlwY3No
bWVtX2lkKQorc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGJhb19pcGNzaG1lbV9oeXBlcmNh
bGwodW5zaWduZWQgbG9uZyBpcGNzaG1lbV9pZCkKIHsKIAlzdHJ1Y3Qgc2JpcmV0IHJldDsKIAot
CXJldCA9IHNiaV9lY2FsbChCQU9fU0JJX0VYVF9JRCwgaHlwZXJjYWxsX2lkLCBpcGNzaG1lbV9p
ZCwgMCwgMCwgMCwgMCwKLQkJCTApOworCXJldCA9IHNiaV9lY2FsbChCQU9fU0JJX0VYVF9JRCwg
QkFPX0lQQ1NITUVNX0hZUEVSQ0FMTF9JRCwgaXBjc2htZW1faWQsCisJCQkwLCAwLCAwLCAwLCAw
KTsKIAogCXJldHVybiByZXQuZXJyb3I7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnQvYmFv
L2lwY3NobWVtL2lwY3NobWVtLmMgYi9kcml2ZXJzL3ZpcnQvYmFvL2lwY3NobWVtL2lwY3NobWVt
LmMKaW5kZXggZjM4OTJkNDEyNDhjLi41OTNlODljYjc2YmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlydC9iYW8vaXBjc2htZW0vaXBjc2htZW0uYworKysgYi9kcml2ZXJzL3ZpcnQvYmFvL2lwY3No
bWVtL2lwY3NobWVtLmMKQEAgLTE0LDkgKzE0LDYgQEAKIAogI2RlZmluZSBCQU9fSVBDU0hNRU1f
TkFNRV9MRU4gMTYKIAotLyogSVBDIHRocm91Z2ggc2hhcmVkLW1lbW9yeSBoeXBlcmNhbGwgSUQg
Ki8KLSNkZWZpbmUgQkFPX0lQQ1NITUVNX0hZUEVSQ0FMTF9JRCAweDEKLQogc3RydWN0IGJhb19p
cGNzaG1lbSB7CiAJc3RydWN0IG1pc2NkZXZpY2UgbWlzY2RldjsKIAlpbnQgaWQ7CkBAIC05MCw3
ICs4Nyw3IEBAIHN0YXRpYyBzc2l6ZV90IGJhb19pcGNzaG1lbV93cml0ZShzdHJ1Y3QgZmlsZSAq
ZmlscCwgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwKIAkqcHBvcyArPSBjb3VudDsKIAogCS8qIE5v
dGlmeSBCYW8gaHlwZXJ2aXNvciAqLwotCWJhb19pcGNzaG1lbV9oeXBlcmNhbGwoQkFPX0lQQ1NI
TUVNX0hZUEVSQ0FMTF9JRCwgYmFvLT5pZCk7CisJYmFvX2lwY3NobWVtX2h5cGVyY2FsbChiYW8t
PmlkKTsKIAogCXJldHVybiBjb3VudDsKIH0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYmFv
LmggYi9pbmNsdWRlL2xpbnV4L2Jhby5oCmluZGV4IDViMDZkMmExN2QyMS4uYjI5ODMwMzc0Nzg4
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Jhby5oCisrKyBiL2luY2x1ZGUvbGludXgvYmFv
LmgKQEAgLTE1LDYgKzE1LDkgQEAKIAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKKy8qIElQ
QyB0aHJvdWdoIHNoYXJlZC1tZW1vcnkgaHlwZXJjYWxsIElEICovCisjZGVmaW5lIEJBT19JUENT
SE1FTV9IWVBFUkNBTExfSUQgMHgxCisKIC8qIFJlbW90ZSBJL08gSHlwZXJjYWxsIElEICovCiAj
ZGVmaW5lIEJBT19SRU1JT19IWVBFUkNBTExfSUQgMHgyCiAKLS0gCjIuNDMuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
