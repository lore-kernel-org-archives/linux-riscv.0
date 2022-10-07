Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D81C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjBg4sPTUSjdR9+8G0elxh9QhsjxGAADfASjta2Wlso=; b=tbkKVgwVZjEdvH
	qlGHncxXBenj++rPmCeSvRcavYfUcQZdO2xaft6NBD/Nq33mV8E61JOUO9rWB3gc7rL2YkfXtGPQP
	xp9wTX4NvixhehupiaiWkIgJNugHyFU4CBdTVLlGTs2dXt4SBnU+najv7fuCRZZ4BtxwbKwOs4i5I
	oJxupZ1rGg9nvWTXNgP8QDOkdjJIqweo9EILA2FVWJRyrQE5hqtRRIEY07takE5pOwrpYVS6W7POj
	VLLQs4evlMBZqp9X3BqWEBLs1s0OER2fNzewtNgZXZiiWBaPPAQaJi3GT3WCgGDG3bJa/HDWT9zTT
	cJcDDpXaa2PAptpQUoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogle0-008how-Aj; Fri, 07 Oct 2022 11:35:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogldx-008hnP-PZ
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 11:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665142553; x=1696678553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2RVbvYXjr1Mv0ItSJmAN3AeJEgqHNTNSCbgYqMVw1Uk=;
  b=mJOkcnvvKVrFfSpey+WSdqNRHHQeiYjwOVjMVxmS2/FlUL8+Nbe+Ba6j
   5VgcnIiVS+8b1TVfeqhd3XpIO6pF6x7vmxIMlwTFxwySlt0nSn7pT+lzi
   33b7t04NArJkLejCbYx2AaEz3WyWJDZz5ZqcLhXXPjt10drxnoskRGWGy
   cz6JF5lEnJ7FAyLOSuMVxD/pvJW22bex9ii7v70WaoM3argPjxUbGLcZv
   +eqQ/IItlLUXPfIViTEDnpw3Qu/LCziohE/rNouw85xZy4VX5XysqKHhu
   dSoxH9kV9HQRq160TDFLRjYi5ZW8I8WSAgVGGvGzjeWoYcSUYWRArwD05
   g==;
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="117322480"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2022 04:35:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 7 Oct 2022 04:35:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 7 Oct 2022 04:35:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v11 2/4] riscv: dts: fix the icicle's #pwm-cells
Date: Fri, 7 Oct 2022 12:35:11 +0100
Message-ID: <20221007113512.91501-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007113512.91501-1-conor.dooley@microchip.com>
References: <20221007113512.91501-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_043553_911486_341E0FCD 
X-CRM114-Status: UNSURE (   9.78  )
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

XCNwd20tY2VsbHMgZm9yIHRoZSBJY2ljbGUga2l0J3MgZmFicmljIFBXTSB3YXMgaW5jb3JyZWN0
bHkgc2V0IHRvIDIgJgpibGluZGx5IG92ZXJyaWRkZW4gYnkgdGhlIChvdXQgb2YgdHJlZSkgZHJp
dmVyIGFueXdheS4gVGhlIGNvcmUgY2FuCnN1cHBvcnQgaW52ZXJ0ZWQgb3BlcmF0aW9uLCBzbyB1
cGRhdGUgdGhlIGVudHJ5IHRvIGNvcnJlY3RseSByZXBvcnQgaXRzCmNhcGFiaWxpdGllcy4KCkZp
eGVzOiA3MjU2MGM2NTU5YjggKCJyaXNjdjogZHRzOiBtaWNyb2NoaXA6IGFkZCBmcGdhIGZhYnJp
YyBzZWN0aW9uIHRvIGljaWNsZSBraXQiKQpSZXZpZXdlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L21pY3JvY2hpcC9tcGZzLWljaWNsZS1raXQtZmFicmljLmR0c2kgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLWljaWNsZS1raXQtZmFicmljLmR0c2kgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLWljaWNsZS1raXQtZmFicmljLmR0c2kKaW5k
ZXggMGQyODg1OGI4M2YyLi5lMDlhMTNhZWYyNjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvbWljcm9jaGlwL21wZnMtaWNpY2xlLWtpdC1mYWJyaWMuZHRzaQorKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLWljaWNsZS1raXQtZmFicmljLmR0c2kKQEAgLTgs
NyArOCw3IEBAIGNvcmVfcHdtMDogcHdtQDQxMDAwMDAwIHsKIAkJY29tcGF0aWJsZSA9ICJtaWNy
b2NoaXAsY29yZXB3bS1ydGwtdjQiOwogCQlyZWcgPSA8MHgwIDB4NDEwMDAwMDAgMHgwIDB4RjA+
OwogCQltaWNyb2NoaXAsc3luYy11cGRhdGUtbWFzayA9IC9iaXRzLyAzMiA8MD47Ci0JCSNwd20t
Y2VsbHMgPSA8Mj47CisJCSNwd20tY2VsbHMgPSA8Mz47CiAJCWNsb2NrcyA9IDwmZmFicmljX2Ns
azM+OwogCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCX07Ci0tIAoyLjM3LjMKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
