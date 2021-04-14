Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB34C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:53:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D4060238
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D4060238
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FMPObIIxGZPdOi/Pq5Xit643eKQQN/2yilj79sFPigw=; b=qTah60oOrXdJWBmmBg4TrYpH2w
	wDiqyK2UyFmQaCVBBaFIkSebYTnZH+8snNlXlkiELy4siSth+uNWVJXQS0FtpDtLAiYoNR/DIrcCM
	ghyENq2W9pfBxB96LUA64Pl9XVLHgVT1gJfMHVk+n7mR5OfnLTL5mABzUJuZi5e3ouwa+H+ram1ys
	sL6YH1+BV/shOT7M9poQ9JGC8I773Uu5NLaFBwrvOkPNE6kptwhjmLwJyYkJPuq+wn6pJO0aFS9Fw
	rCWpqiGI0pGmK4g/RY5HMMBO1FrhWidUZvw6+4darXi0kkfR63Sh9qDZwx+IdefSQGNZ0ZuvwF4B8
	+1pPbJ8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWhpe-00D4KJ-MX; Wed, 14 Apr 2021 15:53:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhpa-00D4J2-P0
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 15:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0qDPv6Bt0Q/dHGP4LkpXODIA0ne14KchWJN3Y8mTWI0=; b=oC/vvYGxziAOUNZEqltOXBQqZ4
 AdvjdgO1oU5kX3lmlN95FHtDBRE66tF6Tl23SZLJbb9ZQGLGpYUOFbYAYAwUOdU0ofHcYCMGra4oq
 axOTzltmZQFHZ/l5Y9CE6yk0py31I2VY5EMGlMGhSzqN831J91j+UzRy7oxywrmxb/zAiJm25JwFd
 tYbI/+n2Uce+MbELJVqcSjiRNdHXwgJMog5xtcsm54Ge1gnHduKRYBZl3h38OYlnjgRyAPoRwMgMK
 9qhOt/rm/U71nNla4yGvvbP9NWCLqb31enhv5Xs5qXQ/ZocYh1yaBtGL2ZjOOBo+LzThUNu/f5FP0
 1qpSLFMA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhpX-007vEC-Td
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 15:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618415607; x=1649951607;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eoxGhWeXcMiRg4o7K7hNlJmz6LK+/qrq3ZM8dOSUIks=;
 b=eXZWHETAZaUeq8jZqDKaoCTzKRxoUsn5TUv4S61gwXQ7njqTuIDGXft4
 JZQaVpOPSY9ukDac0RnqyOT8MGJhMtCyagNkd5H2AVbrN0g6Fu0QncaZF
 247v6e9gQw5mCRW9i6ioZul+Rw0TbM+of4g1cJN5yrRFs0iilSmQ/B1sa
 KOnTU4Ndk0+QhmUzNfcMLNdX4F7G4Lxv0b1RHdUwjaDb0pN9x9eIDPuGF
 R992A3p5Hzi/NgByyKJ+1C8mSMgQJ4IRi0OyAd6rpyhiiF5ZpJqTGmKXh
 1JrfjyYbbDqe4De9zfHZ9KLTnftsSg9gvKiAcPgVqc6hLcC8d7HMS62qo Q==;
IronPort-SDR: aC51Ga+H8tN724kKKQN97DuyDcjfKhqk0csyqfX+YVIqjE8fXvqZp+0/6RFtYaietuZE/u0hsI
 nPCfUCIGUUH7zXLtOBwzpJCcfkGgP/FTzs4HaSWFCUJ1aVf7tV+ADlx4zi54r6bXz+6tQqJbMl
 OxUILniB09+ISx7rkdFAfb3v4nYnnpVwEm+wIH3OoSv2EStD3bs4bfjCXWO15+54czeBv7nbZm
 Xehn+b1VUKjSx82K2j5YAYm9m2bbh43gv+WCFlCmiyvL+lQiG0EJgEfni5eoUZy7eyLG9soVWx
 sAA=
X-IronPort-AV: E=Sophos;i="5.82,222,1613458800"; d="scan'208";a="116998808"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Apr 2021 08:53:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 14 Apr 2021 08:53:23 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 14 Apr 2021 08:53:21 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 0/5]  Add support for the PolarFire SoC system controller
Date: Wed, 14 Apr 2021 16:53:20 +0100
Message-ID: <20210414155320.29382-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_085328_017102_F485FB3D 
X-CRM114-Status: GOOD (  14.36  )
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
LXN5c3RlbS1zZXJ2aWNlcy11c2VyLWd1aWRlCgpDaGFuZ2VzIGZyb20gdjU6CiogcmVtb3ZlZCBl
eGNlc3MgZnVuY3Rpb25zLCBjbGVhbnVwIGluIG1haWxib3gtbXBmcy5jCgpDaGFuZ2VzIGZyb20g
djQ6CiogQ2hhbmdlZCBkdCBiaW5kaW5nIGZyb20gUm9iIEhlcnJpbmcncyBmZWVkYmFjawoqIFNo
b3J0ZW5lZCBzb21lIHZlcmJvc2UgdmFyaWFibGUgbmFtZXMKKiBSZW9yZGVyZWQgYmluZGluZyBw
YXRjaGVzCiogV3JpdGUgZGlyZWN0bHkgaW50byByZXNwb25zZSBhcnJheSwgcmF0aGVyIHRoYW4g
YWxsb2NhdGUgaW4gY29udHJvbGxlciBpc3IgYW5kIG1lbWNweSBpbiBjbGllbnQKCkNoYW5nZXMg
ZnJvbSB2MzoKKiBGaXhlZCBtYm94ZXMgcmVmZXJlbmNlIGluIGR0IGJpbmRpbmcgZm9yIG1haWxi
b3ggY2xpZW50CiogQnVnIGZpeGVzIGFuZCBjbGVhbnVwIGZyb20gSm9uYXRoYW4gTmV1c2Now6Rm
ZXIncyBmZWVkYmFjayBvbgogIG1haWxib3gtbXBmcy5jICYgbXBmcy1zeXMtY29udHJvbGxlci5j
CiogUmVuYW1lZCBkdCBiaW5kaW5nIGZpbGVzIHRvIG1hdGNoIGNvbXBhdGlibGUgc3RyaW5ncwoq
IFJlbW92ZWQgUEZTb0MgZ2F0aW5nIGNvbmRpdGlvbiBvbiBkcml2ZXJzL3NvYy9taWNyb2NoaXAg
c3ViZGlyZWN0b3J5CiogQ29udmVydGVkIGFsbCBzaXplIGJhc2VkIG9wZXJhdGlvbnMgdG8gYnl0
ZXMgZm9yIGNvbnNpc3RlbmN5CiogQ29udmVydGVkIHJlc3BvbnNlIGFycmF5IHRvIGEgc3RydWN0
dXJlLCBlbmFibGluZyBzdXBwb3J0IGZvciBtb3JlCiAgY29tcGxleCBzZXJ2aWNlcyB0aGF0IHJl
dHVybiBhIHN0YXR1cyBpbnN0ZWFkIG9mL2Fsb25nc2lkZSBhIHBheWxvYWQuCgpDaGFuZ2VzIGZy
b20gdjI6CiogRnVydGhlciByZXdvcmtlZCBkdCBiaW5kaW5ncyB0byBzYXRpc2Z5IGVycm9ycyBh
bmQgZmVlZGJhY2sKICAoaG9wZWZ1bGx5IHBoYW5kbGUgYXJyYXkgaXMgdGhlIGNvcnJlY3QgdHlw
ZSBmb3IgdGhlIG1ib3hlcykKKiBGdWxsIG1haW50YWluZXJzIGVudHJ5IG1vdmVkIHRvIEF0aXNo
J3MgUEZTb0Mgc3VwcG9ydCBzZXJpZXMsIHRoaXMgc2VyaWVzIG5vdyBvbmx5IGFkZHMgbWFpbGJv
eCBkcml2ZXIKKiBDb252ZXJ0ZWQgY29uZmlnIG9wdGlvbnMgZnJvbSBNUEZTIHRvIFBPTEFSRklS
RV9TT0Mgc28gdGhleSBhcmUgbW9yZSByZWNvZ25pc2FibGUKKiBGdXJ0aGVyIHNpbXBsaWZpZWQg
ZHJpdmVyIGNvZGUgZnJvbSBmZWVkYmFjawoKQ2hhbmdlcyBmcm9tIHYxOgoqIFNxdWFzaGVkIGhl
YWRlciBpbnRvIGZpcnN0IHBhdGNoCiogRml4ZWQgRFQgYmluZGluZyB3YXJuaW5ncyAmIHNtYWxs
IGZpeGVzCiogQ2xlYW5lZCB1cCBkcml2ZXJzIGZyb20gZmVlZGJhY2sKCkNvbm9yIERvb2xleSAo
NSk6CiAgZHQtYmluZGluZ3M6IGFkZCBiaW5kaW5ncyBmb3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94
CiAgbWJveDogYWRkIHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xsZXIgbWFpbGJveAogIGR0
LWJpbmRpbmdzOiBhZGQgYmluZGluZ3MgZm9yIHBvbGFyZmlyZSBzb2Mgc3lzdGVtIGNvbnRyb2xs
ZXIKICBzb2M6IGFkZCBwb2xhcmZpcmUgc29jIHN5c3RlbSBjb250cm9sbGVyCiAgTUFJTlRBSU5F
UlM6IGFkZCBlbnRyeSBmb3IgcG9sYXJmaXJlIHNvYyBtYWlsYm94IGRyaXZlcgoKIC4uLi9taWNy
b2NoaXAscG9sYXJmaXJlLXNvYy1tYWlsYm94LnlhbWwgICAgICB8ICA0NyArKysrCiAuLi5pY3Jv
Y2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9sbGVyLnlhbWwgfCAgMzUgKysrCiBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9t
YWlsYm94L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICsKIGRyaXZlcnMvbWFp
bGJveC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL21haWxi
b3gvbWFpbGJveC1tcGZzLmMgICAgICAgICAgICAgICAgfCAyNTEgKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL3NvYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwog
ZHJpdmVycy9zb2MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRy
aXZlcnMvc29jL21pY3JvY2hpcC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxMCArCiBkcml2
ZXJzL3NvYy9taWNyb2NoaXAvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVy
cy9zb2MvbWljcm9jaGlwL21wZnMtc3lzLWNvbnRyb2xsZXIuYyAgIHwgMTE5ICsrKysrKysrKwog
aW5jbHVkZS9zb2MvbWljcm9jaGlwL21wZnMuaCAgICAgICAgICAgICAgICAgIHwgIDU2ICsrKysK
IDEyIGZpbGVzIGNoYW5nZWQsIDUzNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHBvbGFy
ZmlyZS1zb2MtbWFpbGJveC55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9taWNyb2NoaXAvbWljcm9jaGlwLHBvbGFyZmlyZS1zb2Mt
c3lzLWNvbnRyb2xsZXIueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWFpbGJveC9t
YWlsYm94LW1wZnMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9L
Y29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWljcm9jaGlwL01ha2VmaWxl
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWljcm9jaGlwL21wZnMtc3lzLWNvbnRy
b2xsZXIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc29jL21pY3JvY2hpcC9tcGZzLmgK
Ci0tIAoyLjMxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
