Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAF8C49EA5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6566054E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6566054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d+F1KNgmW0kof8UlzwQcKYMrzBxc5NHKvYF2B91JBSg=; b=eJX1KVs+W22GgK
	DlpAog6j0oDgaC9u/1Do/VhvfsP+329BR450WFbEKBENpY/O1zbAPac2yG+RG+Qq/WzlNOG+g4rF/
	XFyjuNq1a0s+EiGKvNlRa83jkfdxQ962LwgbUB3W0In4YtmkZANAbCA7TyppHIUcqh/Ydtp1z7+DK
	8wJPEwYST+nkyMpHmCdopyKnPZ61C73bNmMfvKYC7eh1Y0uDgB7/focJkKQmpDPBuoqhygmgTeylJ
	qB5ppNPbtVzISA+kOcbRBfxcxp6yBxjeBbaiLTMKoRYiJ409jijwINl0oWSkWj6k238KdiF7eXxyq
	deHUFLNxaEvRBgeeFv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwQrB-00F9eH-M8; Thu, 24 Jun 2021 15:01:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwQqf-00F9Mv-9W
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 15:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624546857; x=1656082857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0/Em9gZ8ZJxYKhhpEi1Tc8CIu8VuC4kqpPuHiHOkjHo=;
 b=AYy4bkwsNxieUQafZJ0aduNaPvOtc6MwoKiONS9V0g1bauZHefyG5QIn
 wsBYPIZHvfgeUYRLg3Os8mcdc1xNwvWjuwO17F2fyxNqm81OIAb6ZMYUK
 PFKc+IPi7Zv0j8IkMzFkzVHaJR8aXXJgkbs1atB8d0GXr7sexS3rdCmlu
 nMGn1ym5echzLVK9YSPk3rWOL4WUGI7id5lXz3T5v8SKdAWk71JFFeaOa
 wCu3VsENkoQjX7PpoKWbHb8gxsBhbhX1A+PrYHXN2fUHuoJyLps8G8x+k
 Pl8hxyRWJ7JHyYTMsOgyLJO0vMlQW4oZDfWIfNAKY0951u0XA3g5qoREK A==;
IronPort-SDR: JWdD7EhyvrUooZOGHJ7p7VwzXHcKnKD/t75JMixZhunBRGQ9NRGa5wrLxvjjcjM5zXxF3ROScb
 x2Bip6zWOtXQDGBba6/ilrMHT9EhQVR1G7y/oOCJRSIzLrPoFsA/I2nO24D6qwiXQpBgCsev3M
 7OH9tZdxZALC+zBAsk9aaooRpNO6M+BuQHG2mBtG177sb0zoslCVxDeQmT7SNmydckugyKVM7s
 hivUNzYz/EFjg8mgslu4ae8Si9bPwsx3tBT1Kqqbl6yCE4gF9wO0JdXwZo/HFvSNA/X0L1gaDl
 tPE=
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="133328660"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Jun 2021 08:00:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 24 Jun 2021 08:00:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 24 Jun 2021 08:00:42 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 0/5] Add support for the PolarFire SoC system controller
Date: Thu, 24 Jun 2021 16:00:41 +0100
Message-ID: <20210624150041.11136-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_080057_434567_EFA40402 
X-CRM114-Status: GOOD (  15.09  )
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
aCBpbnRyb2R1Y2UgaXQgKHRoaXMgc2VyaWVzIGlzIGluIDUuMTMtcmM3KS4KClRoZSBmb2xsb3dp
bmcgbGluaywgd2hpY2ggaXMgYSBkaXJlY3QgZG93bmxvYWQgb2YgYSBwZGYsIGNvbnRhaW5zIGRv
Y3VtZW50YXRpb24KZm9yIHRoZSBzeXN0ZW0gY29udHJvbGxlcjoKaHR0cHM6Ly93d3cubWljcm9z
ZW1pLmNvbS9kb2N1bWVudC1wb3J0YWwvZG9jX2Rvd25sb2FkLzEyNDQ4NTMtdWcwOTA1LXBvbGFy
ZmlyZS1zb2MtZnBnYS1zeXN0ZW0tc2VydmljZXMtdXNlci1ndWlkZQoKQ2hhbmdlcyBmcm9tIHY4
OgoqIENoYW5nZSBHRU5NQVNLIHRvIEdFTk1BU0tfVUxMIHRvIGF2b2lkIHNoaWZ0IGNvdW50IG92
ZXIgd2FybmluZ3Mgb24gb3RoZXIgYXJtICYgbWljcm9ibGF6ZQoqIENoZWNrIHJldHVybiB2YWx1
ZSBvZiBtdXRleCBsb2NrIGFjcXVpc3Rpb24KCkNoYW5nZXMgZnJvbSB2NzoKKiBSZW1vdmUgZnVu
Y3Rpb25zIGluIGhlYWRlciB0aGF0IGFyZSByZWR1bmRhbnQgd2l0aG91dCBzZXJ2aWNlIGRyaXZl
cnMgdG8gYXZvaWQgdGVzdCBmYWlsdXJlCgpDaGFuZ2VzIGZyb20gdjY6CiogUmUtYWRkIHRoZSBt
YWludGFpbmVycyBzZWN0aW9uIHRoYXQgd2FzIHJlbW92ZWQgZnJvbSBiYXNlIHBmc29jIHN1cHBv
cnQgcGF0Y2ggc2VyaWVzCiogUmVtb3ZlZCBDeXJpbCBKZWFuIGZyb20gbWFpbnRhaW5lcnMgZW50
cnkuCgpDaGFuZ2VzIGZyb20gdjU6CiogUmVtb3ZlZCBleGNlc3MgZnVuY3Rpb25zLCBjbGVhbnVw
IGluIG1haWxib3gtbXBmcy5jCgpDaGFuZ2VzIGZyb20gdjQ6CiogQ2hhbmdlZCBkdCBiaW5kaW5n
IGZyb20gUm9iIEhlcnJpbmcncyBmZWVkYmFjawoqIFNob3J0ZW5lZCBzb21lIHZlcmJvc2UgdmFy
aWFibGUgbmFtZXMKKiBSZW9yZGVyZWQgYmluZGluZyBwYXRjaGVzCiogV3JpdGUgZGlyZWN0bHkg
aW50byByZXNwb25zZSBhcnJheSwgcmF0aGVyIHRoYW4gYWxsb2NhdGUgaW4gY29udHJvbGxlciBp
c3IgYW5kIG1lbWNweSBpbiBjbGllbnQKCkNoYW5nZXMgZnJvbSB2MzoKKiBGaXhlZCBtYm94ZXMg
cmVmZXJlbmNlIGluIGR0IGJpbmRpbmcgZm9yIG1haWxib3ggY2xpZW50CiogQnVnIGZpeGVzIGFu
ZCBjbGVhbnVwIGZyb20gSm9uYXRoYW4gTmV1c2Now6RmZXIncyBmZWVkYmFjayBvbgogIG1haWxi
b3gtbXBmcy5jICYgbXBmcy1zeXMtY29udHJvbGxlci5jCiogUmVuYW1lZCBkdCBiaW5kaW5nIGZp
bGVzIHRvIG1hdGNoIGNvbXBhdGlibGUgc3RyaW5ncwoqIFJlbW92ZWQgUEZTb0MgZ2F0aW5nIGNv
bmRpdGlvbiBvbiBkcml2ZXJzL3NvYy9taWNyb2NoaXAgc3ViZGlyZWN0b3J5CiogQ29udmVydGVk
IGFsbCBzaXplIGJhc2VkIG9wZXJhdGlvbnMgdG8gYnl0ZXMgZm9yIGNvbnNpc3RlbmN5CiogQ29u
dmVydGVkIHJlc3BvbnNlIGFycmF5IHRvIGEgc3RydWN0dXJlLCBlbmFibGluZyBzdXBwb3J0IGZv
ciBtb3JlCiAgY29tcGxleCBzZXJ2aWNlcyB0aGF0IHJldHVybiBhIHN0YXR1cyBpbnN0ZWFkIG9m
L2Fsb25nc2lkZSBhIHBheWxvYWQuCgpDaGFuZ2VzIGZyb20gdjI6CiogRnVydGhlciByZXdvcmtl
ZCBkdCBiaW5kaW5ncyB0byBzYXRpc2Z5IGVycm9ycyBhbmQgZmVlZGJhY2sKICAoaG9wZWZ1bGx5
IHBoYW5kbGUgYXJyYXkgaXMgdGhlIGNvcnJlY3QgdHlwZSBmb3IgdGhlIG1ib3hlcykKKiBGdWxs
IG1haW50YWluZXJzIGVudHJ5IG1vdmVkIHRvIEF0aXNoJ3MgUEZTb0Mgc3VwcG9ydCBzZXJpZXMs
IHRoaXMgc2VyaWVzIG5vdyBvbmx5IGFkZHMgbWFpbGJveCBkcml2ZXIKKiBDb252ZXJ0ZWQgY29u
ZmlnIG9wdGlvbnMgZnJvbSBNUEZTIHRvIFBPTEFSRklSRV9TT0Mgc28gdGhleSBhcmUgbW9yZSBy
ZWNvZ25pc2FibGUKKiBGdXJ0aGVyIHNpbXBsaWZpZWQgZHJpdmVyIGNvZGUgZnJvbSBmZWVkYmFj
awoKQ2hhbmdlcyBmcm9tIHYxOgoqIFNxdWFzaGVkIGhlYWRlciBpbnRvIGZpcnN0IHBhdGNoCiog
Rml4ZWQgRFQgYmluZGluZyB3YXJuaW5ncyAmIHNtYWxsIGZpeGVzCiogQ2xlYW5lZCB1cCBkcml2
ZXJzIGZyb20gZmVlZGJhY2sKCkNvbm9yIERvb2xleSAoNSk6CiAgZHQtYmluZGluZ3M6IGFkZCBi
aW5kaW5ncyBmb3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94CiAgbWJveDogYWRkIHBvbGFyZmlyZSBz
b2Mgc3lzdGVtIGNvbnRyb2xsZXIgbWFpbGJveAogIGR0LWJpbmRpbmdzOiBhZGQgYmluZGluZ3Mg
Zm9yIHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIKICBzb2M6IGFkZCBwb2xhcmZpcmUg
c29jIHN5c3RlbSBjb250cm9sbGVyCiAgTUFJTlRBSU5FUlM6IGFkZCBlbnRyeSBmb3IgcG9sYXJm
aXJlIHNvYyBtYWlsYm94CgogLi4uL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1haWxib3gueWFt
bCAgICAgIHwgIDQ3ICsrKysKIC4uLmljcm9jaGlwLHBvbGFyZmlyZS1zb2Mtc3lzLWNvbnRyb2xs
ZXIueWFtbCB8ICAzNSArKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgOCArCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTIgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1wZnMuYyAgICAgICAgICAgICAg
ICB8IDI1MSArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvc29jL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9zb2MvbWljcm9jaGlwL0tjb25maWcgICAg
ICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvc29jL21pY3JvY2hpcC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9taWNyb2NoaXAvbXBmcy1zeXMtY29udHJv
bGxlci5jICAgfCAxMjEgKysrKysrKysrCiBpbmNsdWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oICAg
ICAgICAgICAgICAgICAgfCAgNDMgKysrCiAxMiBmaWxlcyBjaGFuZ2VkLCA1MzIgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tYWlsYm94L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1haWxib3gueWFtbAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlw
L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9sbGVyLnlhbWwKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL21haWxib3gvbWFpbGJveC1tcGZzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL3NvYy9taWNyb2NoaXAvS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvc29jL21pY3JvY2hpcC9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29j
L21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oCgotLSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
