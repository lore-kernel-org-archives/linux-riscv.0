Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6786CC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dRS+2JsraeCxqYOAwKd6Avvwn0kRZhdmuCw5HKxXK7A=; b=FLR4P5jLa4V623
	wkHNzh0CCKKKRqlWMY3Y2WVPTbPFqrsjvAEWFNbjOdFl0T9AHtcZss7kgCDwrSpShcz1cf7AMLIKN
	XjKGs0eEreJTRZIkfIySV/VNqE0fFvLBR8oSVRMDIapffFbWhMibKkVbqA2mSqQw+uWSc2cnxHbYf
	9/eI5XUxGhxIF3xx5iEkRbKrzGMTwWHpcPe0q7TOq9LG6fONUot5J6D6R73AW8MIJdwDEVcd+GqFb
	doRCquNBn45b14668i30RJIQUkMjibvseFTapoRdGS8/5wysK0MF7dPF8MU1W9N9GVUv7PyEzt7rv
	Wal8GN38IHjU5b9BciTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QgS-000Sjt-0o;
	Tue, 06 Jun 2023 07:00:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QgO-000SiT-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 07:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686034844; x=1717570844;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9aOdZLL0INgSjDe1MDQQYSUITQ9XpofYHKDcavMUzGc=;
  b=UgCSCbjLBy8Qt9VQjXvil8uH9P368DRGQcPWQl2QvRYYKukMB1tPEtAz
   17bR5Y3IwYH5V1869aStvB1Xa6TBLYyOn7jjo7KDaGbaWAD/9j5gUAJQr
   Cy/el0I+qqYNI1PCaFIoywcwpT5MsPlIuCn9dmUkS5Nklbr34DqV2maXa
   vNc8yimi9ND2MXIHnVPaEHquL1Lho1RB65hGsoPZYM7s+Emeu6Mt5Yl+X
   /eldfXgqFS+ikiaHHiMgL1eTSvSj56frgeUwD5wRkgOmYmYm7G1y0GVD/
   xp1I7l+3L4GOFDzyLwZLUDPI9jbtuPBJoFmW9ZUqXTwdYGOYxfJNHAnAl
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="228592302"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2023 00:00:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 6 Jun 2023 00:00:37 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 6 Jun 2023 00:00:36 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Jonathan Corbet <corbet@lwn.net>,
	<linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention patchwork's role
Date: Tue, 6 Jun 2023 07:59:19 +0100
Message-ID: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9aOdZLL0INgSjDe1MDQQYSUITQ9XpofYHKDcavMUzGc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCl1N83thU0EXL6cud/843YLj0n51n8v0vfalmyqTFy3u73s dVxoRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACaSqsrI8D6n5eQW1bqyVzevnT75Zs tZf3e/v8X3bnG3m8Zy1P3Yspvhnzln4loBr+pnM5qt1QOvLXux9lt35g7LC4Fh6lszzx7NZgcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_000044_735353_6060F7A1 
X-CRM114-Status: GOOD (  16.17  )
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

UGFsbWVyIHN1Z2dlc3RlZCBhdCBzb21lIHBvaW50LCBub3Qgc3VyZSBpZiBpdCB3YXMgaW4gb25l
IG9mIHRoZQp3ZWVrbHkgbGludXgtcmlzY3Ygc3luY3MsIG9yIGEgY29udmVyc2F0aW9uIGF0IEZP
U0RFTSwgdGhhdCB3ZQpzaG91bGQgZG9jdW1lbnQgdGhlIHJvbGUgb2YgdGhlIGF1dG9tYXRpb24g
cnVubmluZyBvbiBvdXIgcGF0Y2h3b3JrCmluc3RhbmNlIHBsYXlzIGluIHBhdGNoIGFjY2VwdGFu
Y2UuCgpBZGQgYSBzaG9ydCBub3RlIHRvIHRoZSBwYXRjaC1hY2NlcHRhbmNlIGRvY3VtZW50IHRv
IHRoYXQgZW5kLgoKU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KLS0tCkkgd2FzIGFsc28gbm90IHN1cmUgaWYgdGhpcyB3YXMgdGhlIGNvcnJl
Y3QgZG9jIGZvciB0aGlzLCBvciB3aGV0aGVyIGEKcHJvY2Vzcy9tYWludGFpbmVyLXJpc2N2LnJz
dCBmaWxlIHdhcyBiZXR0ZXIgc3VpdGVkLiBUaGVyZSdzIGNsZWFybHkgbm8KcnVzaCBvbiB0aGlz
IHRob3VnaCBzbyDCr1xfKOODhClfL8KvCgpDaGFuZ2VzIGluIHYyOgotIG1lbnRpb24gdGhhdCBy
aXNjdi9tYXN0ZXIgaXMgbm93IGFsc28gYSBwb3NzaWJsZSBhcHBsaWNhdGlvbiB0YXJnZXQuCgpD
QzogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQ0M6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAZGFiYmVsdC5jb20+CkNDOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2
ZS5jb20+CkNDOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpDQzogbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDQzogbGludXgtZG9jQHZnZXIua2VybmVsLm9yZwotLS0K
IERvY3VtZW50YXRpb24vcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QgfCAxOCArKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJzdCBiL0RvY3VtZW50YXRpb24v
cmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QKaW5kZXggMDdkNWE1NjIzZTJhLi42MzRhYTIyMmI0
MTAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QK
KysrIGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJzdApAQCAtMTYsNiAr
MTYsMjQgQEAgdGVzdGVkIGNvZGUgb3ZlciBleHBlcmltZW50YWwgY29kZS4gIFdlIHdpc2ggdG8g
ZXh0ZW5kIHRoZXNlIHNhbWUKIHByaW5jaXBsZXMgdG8gdGhlIFJJU0MtVi1yZWxhdGVkIGNvZGUg
dGhhdCB3aWxsIGJlIGFjY2VwdGVkIGZvcgogaW5jbHVzaW9uIGluIHRoZSBrZXJuZWwuCiAKK1Bh
dGNod29yaworLS0tLS0tLS0tCisKK1JJU0MtViBoYXMgYSBwYXRjaHdvcmsgaW5zdGFuY2UsIHdo
ZXJlIHRoZSBzdGF0dXMgb2YgcGF0Y2hlcyBjYW4gYmUgY2hlY2tlZDoKKworICBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8KKworSWYgeW91ciBw
YXRjaCBkb2VzIG5vdCBhcHBlYXIgaW4gdGhlIGRlZmF1bHQgdmlldywgdGhlIFJJU0MtViBtYWlu
dGFpbmVycyBoYXZlCitsaWtlbHkgZWl0aGVyIHJlcXVlc3RlZCBjaGFuZ2VzLCBvciBleHBlY3Qg
aXQgdG8gYmUgYXBwbGllZCB0byBhbm90aGVyIHRyZWUuCisKK0F1dG9tYXRpb24gcnVucyBhZ2Fp
bnN0IHRoaXMgcGF0Y2h3b3JrIGluc3RhbmNlLCBidWlsZGluZy90ZXN0aW5nIHBhdGNoZXMgYXMK
K3RoZXkgYXJyaXZlLiBUaGUgYXV0b21hdGlvbiBhcHBsaWVzIHBhdGNoZXMgYWdhaW5zdCB0aGUg
Y3VycmVudCBIRUFEIG9mIHRoZQorUklTQy1WIGBmb3ItbmV4dGAgYW5kIGBmaXhlc2AgYnJhbmNo
ZXMsIGRlcGVuZGluZyBvbiB3aGV0aGVyIHRoZSBwYXRjaCBoYXMgYmVlbgorZGV0ZWN0ZWQgYXMg
YSBmaXguIEZhaWxpbmcgdGhvc2UsIGl0IHdpbGwgdXNlIHRoZSBSSVNDLVYgYG1hc3RlcmAgYnJh
bmNoLgorVGhlIGV4YWN0IGNvbW1pdCB0byB3aGljaCBhIHNlcmllcyBoYXMgYmVlbiBhcHBsaWVk
IHdpbGwgYmUgbm90ZWQgb24gcGF0Y2h3b3JrLgorUGF0Y2hlcyBmb3Igd2hpY2ggYW55IG9mIHRo
ZSBjaGVja3MgZmFpbCBhcmUgdW5saWtlbHkgdG8gYmUgYXBwbGllZCBhbmQgaW4gbW9zdAorY2Fz
ZXMgd2lsbCBuZWVkIHRvIGJlIHJlc3VibWl0dGVkLgorCiBTdWJtaXQgQ2hlY2tsaXN0IEFkZGVu
ZHVtCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBXZSdsbCBvbmx5IGFjY2VwdCBwYXRjaGVz
IGZvciBuZXcgbW9kdWxlcyBvciBleHRlbnNpb25zIGlmIHRoZQotLSAKMi4zOS4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
