Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52B5C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F2C564FAB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F2C564FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GZrajyCa57DhEBDM1DjO+BCd2GemG5ayuiYvZZRzPhE=; b=Ev6uJgjyrRzA9FJMDNptW3bMZm
	LAxgwmCdDTbeLZpF+fMTo6SRakFzTt8miqM1RsjOOFCZTk+j7shKgBdAPfztXu7FXfWmLq/TqP0Jg
	2BujCt8LcAO49wGa6v0c4hQtrQib4z7F3vkB8X9nEX0ZYII4OSWT15qOj7HPy+T0d9TtPY11FoSeT
	kgJ0gC99ZtUH2iC0DdlNEacUq0fTATjpJvmRGEl2bXawturPALkWSTft6/c5n8yAs5wJW4Z7VtPri
	cB1U4WyTnGqUNkyh/M5s/l6aKBokk50K3k4tqqvBelQkQ18ljbDVhH52VSVQNJ3kGB84i+pTNVjoF
	gAcWmw6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJah-008wMf-Oy; Thu, 11 Mar 2021 11:34:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJad-008wLE-3j
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 11:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615462491; x=1646998491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fiVlYIat51VcqGO3igsLjcxXXnwW/lh7Rsk9mNXPSB8=;
 b=coKlyuyfkZCKSKVgbQ/OFgJGdtsoRmEX9GLK3GGKM6rXgA8lUzCaq2U+
 Iyhqrsk+Y60rBw/ococFL0TW+pCe6csZf6xaAXO7mbMHg8638yzAq4ueP
 ZePJ9tFhHcagWYVG18lO89EngVBcn9MbKWKsuta6tZSPmN/iQzIhoDHpy
 J2Qf6owhVcCPA2kAURsyPzCMcTLl6/wVjjEskMFjlayaUa5r0kw2o6rZa
 oWNDSmkAvfyiESaN/GXsGZ4Ce9czDfkmhEnwHMdAemDfcp3AeGOw+EsA1
 vWU1HaKWbgA2ZiVoRHb1HDsquOU1tXQ8sasD1OBPCzgQwjubxDiPuNs9Q w==;
IronPort-SDR: 5BpOAVA2gXd7yTa3rO/ZUPhgtNT1qvLBHWXa+pmILb4bKYc1iGcio4kVJInku8oRmo+G+K9hsb
 iqufWWJGGXyj+3ut5NbGYtN6YGR7SO+PF2fM7A/C/V9eoJn6mDZAzgKt6fSFDgUKa27mORu8hu
 VyUy6uTYL/9mgIy9ePar5gjLPUxAzVpsbRLqaT0CLZIi2bc7FRv4gGX8o2NXRIKGGQHKpA91II
 whIJGJn3APAUIIEAVaSQROjeTUNi88xkhsHcIM+5o/njV2t31peNFk3R3rBMPZRE2H5KvB29HX
 Qqo=
X-IronPort-AV: E=Sophos;i="5.81,240,1610434800"; d="scan'208";a="109596648"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2021 04:34:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 11 Mar 2021 04:34:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 04:34:31 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 0/5]  Add support for the PolarFire SoC system controller
Date: Thu, 11 Mar 2021 11:34:31 +0000
Message-ID: <20210311113431.15378-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_113451_706668_5AD1479F 
X-CRM114-Status: GOOD (  13.28  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClRoaXMgcGF0
Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIHN5c3RlbSBjb250cm9sbGVyIG9uCnRoZSBQ
b2xhckZpcmUgU29DLCB1c2luZyB0aGUgbWFpbGJveCBmcmFtZXdvcmsuIEEgTWljcm9jaGlwIGRp
cmVjdG9yeQppbiB0aGUgU29DIHN1YnN5c3RlbSBoYXMgYmVlbiBjcmVhdGVkIHRvIGhvbGQgdGhl
IG1haWxib3ggY2xpZW50CmRyaXZlciBhbmQgd2lsbCBiZSB1c2VkIGZvciBmdXR1cmUgc2Vydmlj
ZSBkcml2ZXJzLgoKVGhlc2UgZHJpdmVycyBhcmUgZ2F0ZWQgYnkgdGhlIGtjb25maWcgb3B0aW9u
OgpDT05GSUdfU09DX01JQ1JPQ0hJUF9QT0xBUkZJUkUsIHNvIHRoaXMgcGF0Y2ggc2VyaWVzIGRl
cGVuZHMgb24gQXRpc2gKUGF0cmEncyBQb2xhckZpcmUgU29DIHN1cHBvcnQgcGF0Y2hlcyB3aGlj
aCBpbnRyb2R1Y2UgaXQuCgpJdCBmdXJ0aGVyIGRlcGVuZHMgb24gdGhlIE1BSU5UQUlORVJTIGVu
dHJ5IGNyZWF0ZWQgaW4gdGhlIHNhbWUgc2VyaWVzLgoKQ2hhbmdlcyBmcm9tIHYzOgoqIEZpeGVk
IG1ib3hlcyByZWZlcmVuY2UgaW4gZHQgYmluZGluZyBmb3IgbWFpbGJveCBjbGllbnQKKiBCdWcg
Zml4ZXMgYW5kIGNsZWFudXAgZnJvbSBKb25hdGhhbiBOZXVzY2jDpGZlcidzIGZlZWRiYWNrIG9u
IAogIG1haWxib3gtbXBmcy5jICYgbXBmcy1zeXMtY29udHJvbGxlci5jCiogUmVuYW1lZCBkdCBi
aW5kaW5nIGZpbGVzIHRvIG1hdGNoIGNvbXBhdGlibGUgc3RyaW5ncwoqIFJlbW92ZWQgUEZTb0Mg
Z2F0aW5nIGNvbmRpdGlvbiBvbiBkcml2ZXJzL3NvYy9taWNyb2NoaXAgc3ViZGlyZWN0b3J5Ciog
Q29udmVydGVkIGFsbCBzaXplIGJhc2VkIG9wZXJhdGlvbnMgdG8gYnl0ZXMgZm9yIGNvbnNpc3Rl
bmN5CiogQ29udmVydGVkIHJlc3BvbnNlIGFycmF5IHRvIGEgc3RydWN0dXJlLCBlbmFibGluZyBz
dXBwb3J0IGZvciBtb3JlCiAgY29tcGxleCBzZXJ2aWNlcyB0aGF0IHJldHVybiBhIHN0YXR1cyBp
bnN0ZWFkIG9mL2Fsb25nc2lkZSBhIHBheWxvYWQuCgpDaGFuZ2VzIGZyb20gdjI6CiogRnVydGhl
ciByZXdvcmtlZCBkdCBiaW5kaW5ncyB0byBzYXRpc2Z5IGVycm9ycyBhbmQgZmVlZGJhY2sKICAo
aG9wZWZ1bGx5IHBoYW5kbGUgYXJyYXkgaXMgdGhlIGNvcnJlY3QgdHlwZSBmb3IgdGhlIG1ib3hl
cykKKiBGdWxsIG1haW50YWluZXJzIGVudHJ5IG1vdmVkIHRvIEF0aXNoJ3MgUEZTb0Mgc3VwcG9y
dCBzZXJpZXMsIHRoaXMgc2VyaWVzIG5vdyBvbmx5IGFkZHMgbWFpbGJveCBkcml2ZXIKKiBDb252
ZXJ0ZWQgY29uZmlnIG9wdGlvbnMgZnJvbSBNUEZTIHRvIFBPTEFSRklSRV9TT0Mgc28gdGhleSBh
cmUgbW9yZSByZWNvZ25pc2FibGUKKiBGdXJ0aGVyIHNpbXBsaWZpZWQgZHJpdmVyIGNvZGUgZnJv
bSBmZWVkYmFjawoKQ2hhbmdlcyBmcm9tIHYxOgoqIFNxdWFzaGVkIGhlYWRlciBpbnRvIGZpcnN0
IHBhdGNoCiogRml4ZWQgRFQgYmluZGluZyB3YXJuaW5ncyAmIHNtYWxsIGZpeGVzCiogQ2xlYW5l
ZCB1cCBkcml2ZXJzIGZyb20gZmVlZGJhY2sKCkNvbm9yIERvb2xleSAoNSk6CiAgbWJveDogYWRk
IHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIgbWFpbGJveAogIGR0LWJpbmRpbmdzOiBh
ZGQgYmluZGluZ3MgZm9yIHBvbGFyZmlyZSBzb2MgbWFpbGJveAogIHNvYzogYWRkIHBvbGFyZmly
ZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIKICBkdC1iaW5kaW5nczogYWRkIGJpbmRpbmdzIGZvciBw
b2xhcmZpcmUgc29jIHN5c3RlbSBjb250cm9sbGVyCiAgTUFJTlRBSU5FUlM6IGFkZCBlbnRyeSBm
b3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94IGRyaXZlcgoKIC4uLi9taWNyb2NoaXAscG9sYXJmaXJl
LXNvYy1tYWlsYm94LnlhbWwgICAgICB8ICA0NyArKysKIC4uLmljcm9jaGlwLHBvbGFyZmlyZS1z
b2Mtc3lzLWNvbnRyb2xsZXIueWFtbCB8ICAzNiArKysKIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1wZnMu
YyAgICAgICAgICAgICAgICB8IDI3NyArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvc29jL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9zb2MvbWljcm9j
aGlwL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvc29jL21pY3JvY2hp
cC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9taWNyb2NoaXAv
bXBmcy1zeXMtY29udHJvbGxlci5jICAgfCAxMjcgKysrKysrKysKIGluY2x1ZGUvc29jL21pY3Jv
Y2hpcC9tcGZzLmggICAgICAgICAgICAgICAgICB8ICA1NyArKysrCiAxMiBmaWxlcyBjaGFuZ2Vk
LCA1NzIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1haWxib3gu
eWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9sbGVyLnlh
bWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbWFpbGJveC1tcGZzLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9taWNyb2NoaXAvS2NvbmZpZwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oCgotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
