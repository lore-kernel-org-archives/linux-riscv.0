Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF951C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:38:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD161616EB
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD161616EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48zkZhO934fdF/v0HUTam5VPEGOdTpAsUJ+hD6VH/SE=; b=bfzp7laDEmT+orP+aSYR9xtjyO
	l1DsAjHDatAMY0yeoivfGud22ElklI2Xs7H3ob648mzUgudHVbzz9CQL5UAYoMKg2oMyOAi1AH5Kg
	R3a4YuBIW+YvM0Vao4q8KlxrXe0m+nCMF6IgZ+wpwXIQ8sMb7T/LsWJ7pjkar62VpHOoPjA3CZHQz
	b/t7l54aZynrZgUO7CyYXc4UoyYXac9Kzm1544VADdPCBvN1cPgJvDNg7+mfAx76khB/B6kw1F29X
	Pa+ydoStykgKuEIOPEMVy7D+A4btpluoDdQyorjvBzYaRpg4ZN24LXoTJIA/OR223Ax9X00468wIY
	fkijraEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgUSg-000cpt-J7; Tue, 11 May 2021 15:38:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUSf-000cpZ-6n
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 15:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KaWDJcmf0akmgDM4xkDbgfWR/MHkDDuIHvhuIJq81co=; b=EWKvw0XcSjQEgQ1M4ToNvdSzoo
 OiSzoz6AV0t0Jqe0Nxtn9tJoNmgF6gJ5ZXc8wgy7M0ZIxblAeNRewdjBCW2A2mfX4lzk/Lt40C7Vr
 USCp91wQX21+C6CKSyT5ngV0Zat6CoV4zDzDwgECTIi3UmehtiKNcX6FTgJMWeXAUAj65McNF3FUU
 YKxmGJvj87WQZch9vxLzKtXuY/d7suvDtmQ9rU2mtlr9WyHdBlMe2xGw2UyLxPihiADfCt5H2IMBD
 4Jnsrayt3Sm+YWu7iF/AA+cJ6i7sR2U6cXvDAVhbt6299z/uCw+UodH82Bbdwp/rOAK7Dgg1cAQu4
 BLayUuAA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUSc-009ivQ-Ct
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 15:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620747494; x=1652283494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XOB1CwGDTbBnyoCClAe5S5eJtfPOnOb+M6/jGa4fYXc=;
 b=z22ff8TZWw/MaeKJ13/U45AjFr8BUGZuV0am9KU8P7JkWWzxdXuwW1JN
 vsUGWX6Vh5WlE60qVL1EWlj4dGxdE9I2CFrMDTbi+uPh7B+Ge6kAUSUwe
 czgRyOpjsNgcfRdNfBrqlkO0FAyxYxxJJr02+ehUiofjjZOdsSVmlTR/J
 AaWbVcF9gGHCzzji+J7WUbWV3YocY5HPP5plGvQyLpVk1xcUx7AZjCzF7
 pUHdnmEtiZw+QW3NXIR7KBPfJqnfrvw8GgPyvi5VOhm0RJ0UuF2iQ/zPv
 gRTgNZhqQw6ywdsxAMuofYCRLKEslARx7nvvPofsvRTZE7B+uBqB0ghhz Q==;
IronPort-SDR: KaQgM2P0FsZgAgXNspFkNpN6ghIYODJTqUu8jTXYLf10Z9X6W86WGq59c0HVzep0tVryCEBwB9
 EX7xWKlnaJ2YOlLjryKOMQfgGbfDyPfbdjlCXwhpeNx0YpFX7JsPnpPKLna6hkf/boRpXrSsVu
 eJdk1a4oUqL/TO4owbUGKpVj9xKD5GwwIu4V4ujJaFv/s4j+hNXdNS7tfCHm5uQC65bVHeaiwI
 K+j9gvNTgOVKxUbGqPJ4PY8Xp6D0HCzwcoOiqh8uWd3U+BuIRZ1KEqsnNwB/ESNgQ0uw0M1Z9W
 TCM=
X-IronPort-AV: E=Sophos;i="5.82,291,1613458800"; d="scan'208";a="120686633"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2021 08:38:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 08:38:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 11 May 2021 08:38:09 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 0/5] Add support for the PolarFire SoC system controller
Date: Tue, 11 May 2021 16:38:09 +0100
Message-ID: <20210511153809.24760-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_083814_506055_EADAD132 
X-CRM114-Status: GOOD (  14.05  )
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
aCBpbnRyb2R1Y2UgaXQgKHRoaXMgc2VyaWVzIGlzIG5vdyBpbiA1LjEzLXJjMSkuCgpUaGUgZm9s
bG93aW5nIGxpbmssIHdoaWNoIGlzIGEgZGlyZWN0IGRvd25sb2FkIG9mIGEgcGRmLCBjb250YWlu
cyBkb2N1bWVudGF0aW9uCmZvciB0aGUgc3lzdGVtIGNvbnRyb2xsZXI6Cmh0dHBzOi8vd3d3Lm1p
Y3Jvc2VtaS5jb20vZG9jdW1lbnQtcG9ydGFsL2RvY19kb3dubG9hZC8xMjQ0ODUzLXVnMDkwNS1w
b2xhcmZpcmUtc29jLWZwZ2Etc3lzdGVtLXNlcnZpY2VzLXVzZXItZ3VpZGUKCkNoYW5nZXMgZnJv
bSB2NjoKKiBSZS1hZGQgdGhlIG1haW50YWluZXJzIHNlY3Rpb24gdGhhdCB3YXMgcmVtb3ZlZCBm
cm9tIGJhc2UgcGZzb2Mgc3VwcG9ydCBwYXRjaCBzZXJpZXMKKiBSZW1vdmVkIEN5cmlsIEplYW4g
ZnJvbSBtYWludGFpbmVycyBlbnRyeS4KCkNoYW5nZXMgZnJvbSB2NToKKiBSZW1vdmVkIGV4Y2Vz
cyBmdW5jdGlvbnMsIGNsZWFudXAgaW4gbWFpbGJveC1tcGZzLmMKCkNoYW5nZXMgZnJvbSB2NDoK
KiBDaGFuZ2VkIGR0IGJpbmRpbmcgZnJvbSBSb2IgSGVycmluZydzIGZlZWRiYWNrCiogU2hvcnRl
bmVkIHNvbWUgdmVyYm9zZSB2YXJpYWJsZSBuYW1lcwoqIFJlb3JkZXJlZCBiaW5kaW5nIHBhdGNo
ZXMKKiBXcml0ZSBkaXJlY3RseSBpbnRvIHJlc3BvbnNlIGFycmF5LCByYXRoZXIgdGhhbiBhbGxv
Y2F0ZSBpbiBjb250cm9sbGVyIGlzciBhbmQgbWVtY3B5IGluIGNsaWVudAoKQ2hhbmdlcyBmcm9t
IHYzOgoqIEZpeGVkIG1ib3hlcyByZWZlcmVuY2UgaW4gZHQgYmluZGluZyBmb3IgbWFpbGJveCBj
bGllbnQKKiBCdWcgZml4ZXMgYW5kIGNsZWFudXAgZnJvbSBKb25hdGhhbiBOZXVzY2jDpGZlcidz
IGZlZWRiYWNrIG9uCiAgbWFpbGJveC1tcGZzLmMgJiBtcGZzLXN5cy1jb250cm9sbGVyLmMKKiBS
ZW5hbWVkIGR0IGJpbmRpbmcgZmlsZXMgdG8gbWF0Y2ggY29tcGF0aWJsZSBzdHJpbmdzCiogUmVt
b3ZlZCBQRlNvQyBnYXRpbmcgY29uZGl0aW9uIG9uIGRyaXZlcnMvc29jL21pY3JvY2hpcCBzdWJk
aXJlY3RvcnkKKiBDb252ZXJ0ZWQgYWxsIHNpemUgYmFzZWQgb3BlcmF0aW9ucyB0byBieXRlcyBm
b3IgY29uc2lzdGVuY3kKKiBDb252ZXJ0ZWQgcmVzcG9uc2UgYXJyYXkgdG8gYSBzdHJ1Y3R1cmUs
IGVuYWJsaW5nIHN1cHBvcnQgZm9yIG1vcmUKICBjb21wbGV4IHNlcnZpY2VzIHRoYXQgcmV0dXJu
IGEgc3RhdHVzIGluc3RlYWQgb2YvYWxvbmdzaWRlIGEgcGF5bG9hZC4KCkNoYW5nZXMgZnJvbSB2
MjoKKiBGdXJ0aGVyIHJld29ya2VkIGR0IGJpbmRpbmdzIHRvIHNhdGlzZnkgZXJyb3JzIGFuZCBm
ZWVkYmFjawogIChob3BlZnVsbHkgcGhhbmRsZSBhcnJheSBpcyB0aGUgY29ycmVjdCB0eXBlIGZv
ciB0aGUgbWJveGVzKQoqIEZ1bGwgbWFpbnRhaW5lcnMgZW50cnkgbW92ZWQgdG8gQXRpc2gncyBQ
RlNvQyBzdXBwb3J0IHNlcmllcywgdGhpcyBzZXJpZXMgbm93IG9ubHkgYWRkcyBtYWlsYm94IGRy
aXZlcgoqIENvbnZlcnRlZCBjb25maWcgb3B0aW9ucyBmcm9tIE1QRlMgdG8gUE9MQVJGSVJFX1NP
QyBzbyB0aGV5IGFyZSBtb3JlIHJlY29nbmlzYWJsZQoqIEZ1cnRoZXIgc2ltcGxpZmllZCBkcml2
ZXIgY29kZSBmcm9tIGZlZWRiYWNrCgpDaGFuZ2VzIGZyb20gdjE6CiogU3F1YXNoZWQgaGVhZGVy
IGludG8gZmlyc3QgcGF0Y2gKKiBGaXhlZCBEVCBiaW5kaW5nIHdhcm5pbmdzICYgc21hbGwgZml4
ZXMKKiBDbGVhbmVkIHVwIGRyaXZlcnMgZnJvbSBmZWVkYmFjawoKQ29ub3IgRG9vbGV5ICg1KToK
ICBkdC1iaW5kaW5nczogYWRkIGJpbmRpbmdzIGZvciBwb2xhcmZpcmUgc29jIG1haWxib3gKICBt
Ym94OiBhZGQgcG9sYXJmaXJlIHNvYyBzeXN0ZW0gY29udHJvbGxlciBtYWlsYm94CiAgZHQtYmlu
ZGluZ3M6IGFkZCBiaW5kaW5ncyBmb3IgcG9sYXJmaXJlIHNvYyBzeXN0ZW0gY29udHJvbGxlcgog
IHNvYzogYWRkIHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIKICBNQUlOVEFJTkVSUzog
YWRkIGVudHJ5IGZvciBwb2xhcmZpcmUgc29jIG1haWxib3gKCiAuLi4vbWljcm9jaGlwLHBvbGFy
ZmlyZS1zb2MtbWFpbGJveC55YW1sICAgICAgfCAgNDcgKysrKwogLi4uaWNyb2NoaXAscG9sYXJm
aXJlLXNvYy1zeXMtY29udHJvbGxlci55YW1sIHwgIDM1ICsrKwogTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsKIGRyaXZlcnMvbWFpbGJveC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArCiBkcml2ZXJzL21haWxib3gvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9tYWlsYm94L21haWxib3gt
bXBmcy5jICAgICAgICAgICAgICAgIHwgMjUxICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9z
b2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvc29j
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9t
aWNyb2NoaXAvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMTAgKwogZHJpdmVycy9zb2MvbWlj
cm9jaGlwL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvc29jL21pY3Jv
Y2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMgICB8IDExOSArKysrKysrKysKIGluY2x1ZGUvc29j
L21pY3JvY2hpcC9tcGZzLmggICAgICAgICAgICAgICAgICB8ICA1NiArKysrCiAxMiBmaWxlcyBj
aGFuZ2VkLCA1NDMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1h
aWxib3gueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9s
bGVyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbWFpbGJveC1tcGZz
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9taWNyb2NoaXAvS2NvbmZpZwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9NYWtlZmlsZQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oCgotLSAKMi4zMS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
