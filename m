Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D84C49EA4
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 16:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46AD61059
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 16:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46AD61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QEpk3LxVKxR+5ZnJ0XDJY4Uy7PrZBen3e1xAeGmQ2Ao=; b=V9OW0ZDWoW4eLh
	WVBd4/mgwrshramVCkaN9IkrdOu4dn48+TuqKI3xDz+zbV2Ndj1TxP8NNeNh/DdmXIaxbZTbWmcv5
	5uGf4t3VFJ1pSPeOJL1q9EoYDaiWL+JEDBboeVAGp7j/JNxbJuqwbVScilzEupYNp+vsCugCyc5o5
	JMaWqTvqTLnDi2FBytioAaVTOLKNvGJqx2JsQ+4RX8/Qdpc0YH5TUxKpAKpBlVv1zmsobO5emw58a
	aNsegrSn12L/tabqZLoP6GM3t3xYUYILD92kM0tyx3OZZ0RpRV4Or3F4yCaIWQHpulz4XWJE0Q+eB
	ZdSdbQwlFCEgNB4+zoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvMO0-0040dw-Hi; Mon, 21 Jun 2021 16:02:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvMNw-0040d2-OL
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 16:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624291372; x=1655827372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RZTu4Q0uMlgLEt74u2zDTQiVdr3MIjeXvc5Byuh9Kb0=;
 b=Yw9LmnytVJXZjTQZTUUITmwsnfTss8+6Cy+QgnRsSjrk3MuvwK9bqIce
 kFywqf1ghxFVk+t6I06tGY2XWuAxKT7b8QSKJ/I91eagCyq0i01/0Bkme
 ndqJTU5HQ9gSN/ufyXh6kpFSHp9Z5IhJykBljCB1MM2j2+JRCnTVYc1aG
 y/eVueh3QX9Oxu3nv+wwX2GxH2GhaNgXzXb5Q3N/6/MSd1zoR4rz30yju
 UmbP3cakLhgR6+gGFoziCrgl/t9q0F+SqCopVfAz3hD9FwoOzZjdJhu7j
 ETUlcamUFUzHeeOSekSVt7ZJ53/QYnYcK/7/9wP0VR41z/wku3h12wg0K w==;
IronPort-SDR: flAkaGVLGzGD56+5XfKoYkfYUCGlmxrA3LN7lgfdChlp9Bd4HcBqpM9cMbj9VGHxzIYOHufxJo
 4EoX058xv4jwgnH7ObsGjnlO8FD8nKWvDRk/UcZ4RCflbTqRqG5u8IRHqfnhTtcnoLVyZyIozl
 SiWG7gOCNbblr4hhfZotLWou17MRTvSFXTzGdCramXIow65tA7sLhVo0tK7/n469yEoDT3ScuC
 WK4YhyODg41HhNEXJXCzHQIuh5jgK84XsJqWBIeu4zj5e9cHBJ+dY64Fe9+MVqRC2Z4xMsQFon
 +ck=
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="59681407"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jun 2021 09:02:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 21 Jun 2021 09:02:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 21 Jun 2021 09:02:46 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 0/5]  Add support for the PolarFire SoC system controller
Date: Mon, 21 Jun 2021 17:02:46 +0100
Message-ID: <20210621160246.29960-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_090252_927435_832B465E 
X-CRM114-Status: GOOD (  14.67  )
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
bSB2NzoKKiBSZW1vdmUgZnVuY3Rpb25zIGluIGhlYWRlciB0aGF0IGFyZSByZWR1bmRhbnQgd2l0
aG91dCBzZXJ2aWNlIGRyaXZlcnMgdG8gYXZvaWQgdGVzdCBmYWlsdXJlCgpDaGFuZ2VzIGZyb20g
djY6CiogUmUtYWRkIHRoZSBtYWludGFpbmVycyBzZWN0aW9uIHRoYXQgd2FzIHJlbW92ZWQgZnJv
bSBiYXNlIHBmc29jIHN1cHBvcnQgcGF0Y2ggc2VyaWVzCiogUmVtb3ZlZCBDeXJpbCBKZWFuIGZy
b20gbWFpbnRhaW5lcnMgZW50cnkuCgpDaGFuZ2VzIGZyb20gdjU6CiogUmVtb3ZlZCBleGNlc3Mg
ZnVuY3Rpb25zLCBjbGVhbnVwIGluIG1haWxib3gtbXBmcy5jCgpDaGFuZ2VzIGZyb20gdjQ6Ciog
Q2hhbmdlZCBkdCBiaW5kaW5nIGZyb20gUm9iIEhlcnJpbmcncyBmZWVkYmFjawoqIFNob3J0ZW5l
ZCBzb21lIHZlcmJvc2UgdmFyaWFibGUgbmFtZXMKKiBSZW9yZGVyZWQgYmluZGluZyBwYXRjaGVz
CiogV3JpdGUgZGlyZWN0bHkgaW50byByZXNwb25zZSBhcnJheSwgcmF0aGVyIHRoYW4gYWxsb2Nh
dGUgaW4gY29udHJvbGxlciBpc3IgYW5kIG1lbWNweSBpbiBjbGllbnQKCkNoYW5nZXMgZnJvbSB2
MzoKKiBGaXhlZCBtYm94ZXMgcmVmZXJlbmNlIGluIGR0IGJpbmRpbmcgZm9yIG1haWxib3ggY2xp
ZW50CiogQnVnIGZpeGVzIGFuZCBjbGVhbnVwIGZyb20gSm9uYXRoYW4gTmV1c2Now6RmZXIncyBm
ZWVkYmFjayBvbgogIG1haWxib3gtbXBmcy5jICYgbXBmcy1zeXMtY29udHJvbGxlci5jCiogUmVu
YW1lZCBkdCBiaW5kaW5nIGZpbGVzIHRvIG1hdGNoIGNvbXBhdGlibGUgc3RyaW5ncwoqIFJlbW92
ZWQgUEZTb0MgZ2F0aW5nIGNvbmRpdGlvbiBvbiBkcml2ZXJzL3NvYy9taWNyb2NoaXAgc3ViZGly
ZWN0b3J5CiogQ29udmVydGVkIGFsbCBzaXplIGJhc2VkIG9wZXJhdGlvbnMgdG8gYnl0ZXMgZm9y
IGNvbnNpc3RlbmN5CiogQ29udmVydGVkIHJlc3BvbnNlIGFycmF5IHRvIGEgc3RydWN0dXJlLCBl
bmFibGluZyBzdXBwb3J0IGZvciBtb3JlCiAgY29tcGxleCBzZXJ2aWNlcyB0aGF0IHJldHVybiBh
IHN0YXR1cyBpbnN0ZWFkIG9mL2Fsb25nc2lkZSBhIHBheWxvYWQuCgpDaGFuZ2VzIGZyb20gdjI6
CiogRnVydGhlciByZXdvcmtlZCBkdCBiaW5kaW5ncyB0byBzYXRpc2Z5IGVycm9ycyBhbmQgZmVl
ZGJhY2sKICAoaG9wZWZ1bGx5IHBoYW5kbGUgYXJyYXkgaXMgdGhlIGNvcnJlY3QgdHlwZSBmb3Ig
dGhlIG1ib3hlcykKKiBGdWxsIG1haW50YWluZXJzIGVudHJ5IG1vdmVkIHRvIEF0aXNoJ3MgUEZT
b0Mgc3VwcG9ydCBzZXJpZXMsIHRoaXMgc2VyaWVzIG5vdyBvbmx5IGFkZHMgbWFpbGJveCBkcml2
ZXIKKiBDb252ZXJ0ZWQgY29uZmlnIG9wdGlvbnMgZnJvbSBNUEZTIHRvIFBPTEFSRklSRV9TT0Mg
c28gdGhleSBhcmUgbW9yZSByZWNvZ25pc2FibGUKKiBGdXJ0aGVyIHNpbXBsaWZpZWQgZHJpdmVy
IGNvZGUgZnJvbSBmZWVkYmFjawoKQ2hhbmdlcyBmcm9tIHYxOgoqIFNxdWFzaGVkIGhlYWRlciBp
bnRvIGZpcnN0IHBhdGNoCiogRml4ZWQgRFQgYmluZGluZyB3YXJuaW5ncyAmIHNtYWxsIGZpeGVz
CiogQ2xlYW5lZCB1cCBkcml2ZXJzIGZyb20gZmVlZGJhY2sKCkNvbm9yIERvb2xleSAoNSk6CiAg
ZHQtYmluZGluZ3M6IGFkZCBiaW5kaW5ncyBmb3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94CiAgbWJv
eDogYWRkIHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIgbWFpbGJveAogIGR0LWJpbmRp
bmdzOiBhZGQgYmluZGluZ3MgZm9yIHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIKICBz
b2M6IGFkZCBwb2xhcmZpcmUgc29jIHN5c3RlbSBjb250cm9sbGVyCiAgTUFJTlRBSU5FUlM6IGFk
ZCBlbnRyeSBmb3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94CgogLi4uL21pY3JvY2hpcCxwb2xhcmZp
cmUtc29jLW1haWxib3gueWFtbCAgICAgIHwgIDQ3ICsrKysKIC4uLmljcm9jaGlwLHBvbGFyZmly
ZS1zb2Mtc3lzLWNvbnRyb2xsZXIueWFtbCB8ICAzNSArKysKIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCiBkcml2ZXJzL21haWxib3gvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1w
ZnMuYyAgICAgICAgICAgICAgICB8IDI1MSArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvc29j
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9zb2MvbWlj
cm9jaGlwL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvc29jL21pY3Jv
Y2hpcC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9taWNyb2No
aXAvbXBmcy1zeXMtY29udHJvbGxlci5jICAgfCAxMTkgKysrKysrKysrCiBpbmNsdWRlL3NvYy9t
aWNyb2NoaXAvbXBmcy5oICAgICAgICAgICAgICAgICAgfCAgNDMgKysrCiAxMiBmaWxlcyBjaGFu
Z2VkLCA1MzAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1haWxi
b3gueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9sbGVy
LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21haWxib3gvbWFpbGJveC1tcGZzLmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9taWNyb2NoaXAvS2NvbmZpZwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9NYWtlZmlsZQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oCgotLSAKMi4zMS4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
