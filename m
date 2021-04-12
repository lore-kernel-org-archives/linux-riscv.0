Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAE8C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B54F6121F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B54F6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jcTo0gXd23mypcqJinU3joKero1P66A+8fy+HlWdbNs=; b=GoRKbF9+G4vIt5UISraxgMJ3Iu
	BCQcsJf34h9t6rgFg3uhn3chHKdWRM48xpAVziEfKlT+dkNOnhvPH6XWSoj01OKgao1Ig8+h1uQHx
	CJ+JcMsJEjzcGrscUE+b9aaH1aV+W5jQhyXwGBwQqO1ZHeAwHSebZMheBQHi3S0AMZUeicX5FoZ+O
	jsxnkspxrpslIt029va8QGLxLp4IP3bJU9Je2hk6zXjXxEiisbZLu3EzfZtBHIO3bcv2wkf+0gSMY
	M/oViWYdN/JBxaehKQDvFDmN6TUHe47XkP9v7WaqY4zYft/iJBPkOdBpaZ/nlKDwPAcwBVEYOTU5A
	21YeuZjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVz3Z-007CGt-9m; Mon, 12 Apr 2021 16:04:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz2i-007C32-PR
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=SUJKU8YNAJIJHqG+fEi3XjPg7D7yFSLE+aCPxSPLr+M=; b=aOKkheAk/gu001KMSKaPJ0jRIz
 8Wt1OA27HhzOIT3K0UQfdaaNo9SPaFI3vqF3xtcpgs0jkVPSHHbrSM2O38i6kTjc+R2X2DxVtt2qY
 wa5WpvJVU07S2i4uIyvDhp1Igy1kda5YbufPzSMIcZQrGXZUaH1CllnIYzsa0QlKHIpkjwsV6CEs1
 /XXi46g3FQMfNYKmGuwbG3ucVv7SJsSpr+j1mW6gJBDiAJRZD6gOkXYiST9AaOhTIp3YVFDDldBBH
 1DmlNoH3/3AtrRU49Q++/7c8c7YXKahpEEiHuqvphz2gjaSEtAtAYAlQ9sZXyluOxcV+pem/fOvwu
 3Rk0tkCw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz2f-006N64-OR
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618243441; x=1649779441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZqO4v5XWvmV6i2qYDUBpRbDz6kva5C+vptihlshcyy0=;
 b=R2zIV3T/p1QEIxztwrMyv8yiRr24Em3Wmo7IftYGKg/tzwUJ90kRntGX
 tBhvfqHsz6NWxB3HNeN9VaGaDuxOz7fBP4I1cpdlp81E0ijTA1xu4tXol
 lWbXbotGWNx7lkgTTX1RYzCi7iNqxOLog09zxN5qosBxVzEOf+dRL1OxM
 BC4VItnFv5aHb0tdhEGPqFEBlFD6/Yt1mNlG0HT2tXpM3ad9Wjg6Hbf93
 vo4U6Pj0yaBtEEjGK4wHFelRfNf/vXMK2WniE1lzpgipT0oAyBvmILpdX
 4nAxJytZo8TztDV/LC4qKlBmBOF/z8uqMUXd33lu6zL1qrBaud8bLCGLW A==;
IronPort-SDR: 3Y+J8lhBboqZ8hIyTdSdj+4JdPYf1yIzYTCnn7UOuIUaTc5J4GxCMxsixl92uKqdFPqd4IHvtT
 O/YFMw/Lj2/4gY+ld45bINLVeHdQf1YdUNQ5sYfDPmxhuv+CgcInbQpGdbaF9hs/LBaze55U22
 5B4S48dCNZ+QcsFXR1x9+SAKu+WHHdoUXVuAdMwYACMKPGDAB5GGOY2WtxLpnfayELLy6eiCPA
 BALZCf6JQISsY4uJZNPThy2f1skalb/KoXv7vbq0/agT2sWoldf7SQsgGK03DeUfKkIMO6wz6B
 LVg=
X-IronPort-AV: E=Sophos;i="5.82,216,1613458800"; d="scan'208";a="110516045"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2021 09:03:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Apr 2021 09:03:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 12 Apr 2021 09:03:52 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 0/5]  Add support for the PolarFire SoC system controller
Date: Mon, 12 Apr 2021 17:03:51 +0100
Message-ID: <20210412160351.19229-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_090401_907118_80773BB2 
X-CRM114-Status: GOOD (  14.49  )
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
dHJ5IGNyZWF0ZWQgaW4gdGhlIHNhbWUgc2VyaWVzLgoKVGhlIGZvbGxvd2luZyBsaW5rLCB3aGlj
aCBpcyBhIGRpcmVjdCBkb3dubG9hZCBvZiBhIHBkZiwgY29udGFpbnMgZG9jdW1lbnRhdGlvbgpm
b3IgdGhlIHN5c3RlbSBjb250cm9sbGVyOgpodHRwczovL3d3dy5taWNyb3NlbWkuY29tL2RvY3Vt
ZW50LXBvcnRhbC9kb2NfZG93bmxvYWQvMTI0NDg1My11ZzA5MDUtcG9sYXJmaXJlLXNvYy1mcGdh
LXN5c3RlbS1zZXJ2aWNlcy11c2VyLWd1aWRlCgpDaGFuZ2VzIGZyb20gdjQ6CiogQ2hhbmdlZCBk
dCBiaW5kaW5nIGZyb20gUm9iIEhlcnJpbmcncyBmZWVkYmFjawoqIFNob3J0ZW5lZCBzb21lIHZl
cmJvc2UgdmFyaWFibGUgbmFtZXMKKiBSZW9yZGVyZWQgYmluZGluZyBwYXRjaGVzCiogV3JpdGUg
ZGlyZWN0bHkgaW50byByZXNwb25zZSBhcnJheSwgcmF0aGVyIHRoYW4gYWxsb2NhdGUgaW4gY29u
dHJvbGxlciBpc3IgYW5kIG1lbWNweSBpbiBjbGllbnQKCkNoYW5nZXMgZnJvbSB2MzoKKiBGaXhl
ZCBtYm94ZXMgcmVmZXJlbmNlIGluIGR0IGJpbmRpbmcgZm9yIG1haWxib3ggY2xpZW50CiogQnVn
IGZpeGVzIGFuZCBjbGVhbnVwIGZyb20gSm9uYXRoYW4gTmV1c2Now6RmZXIncyBmZWVkYmFjayBv
bgogIG1haWxib3gtbXBmcy5jICYgbXBmcy1zeXMtY29udHJvbGxlci5jCiogUmVuYW1lZCBkdCBi
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
ZCB1cCBkcml2ZXJzIGZyb20gZmVlZGJhY2sKCkNvbm9yIERvb2xleSAoNSk6CiAgZHQtYmluZGlu
Z3M6IGFkZCBiaW5kaW5ncyBmb3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94CiAgbWJveDogYWRkIHBv
bGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIgbWFpbGJveAogIGR0LWJpbmRpbmdzOiBhZGQg
YmluZGluZ3MgZm9yIHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIKICBzb2M6IGFkZCBw
b2xhcmZpcmUgc29jIHN5c3RlbSBjb250cm9sbGVyCiAgTUFJTlRBSU5FUlM6IGFkZCBlbnRyeSBm
b3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94IGRyaXZlcgoKIC4uLi9taWNyb2NoaXAscG9sYXJmaXJl
LXNvYy1tYWlsYm94LnlhbWwgICAgICB8ICA0NyArKysKIC4uLmljcm9jaGlwLHBvbGFyZmlyZS1z
b2Mtc3lzLWNvbnRyb2xsZXIueWFtbCB8ICAzNSArKysKIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1wZnMu
YyAgICAgICAgICAgICAgICB8IDI3MiArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvc29jL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9zb2MvbWljcm9j
aGlwL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvc29jL21pY3JvY2hp
cC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9taWNyb2NoaXAv
bXBmcy1zeXMtY29udHJvbGxlci5jICAgfCAxMTkgKysrKysrKysKIGluY2x1ZGUvc29jL21pY3Jv
Y2hpcC9tcGZzLmggICAgICAgICAgICAgICAgICB8ICA1NiArKysrCiAxMiBmaWxlcyBjaGFuZ2Vk
LCA1NTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1haWxib3gu
eWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9sbGVyLnlh
bWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbWFpbGJveC1tcGZzLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9taWNyb2NoaXAvS2NvbmZpZwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oCgotLSAKMi4zMS4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
