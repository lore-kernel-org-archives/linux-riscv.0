Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ABDC53209
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 01:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:Message-Id:Date:
	References:To:Mime-Version:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pL3BGwqBeqQ6d5tkNzV656G6AI+I+asXDQ+tn3KbPEM=; b=W1FUFz/Q3+mUbaW2K53/Y+zeQg
	kLeNl1fqbSqSYViu+57UvRcZNkg19K1pRuuhZSSJVsEbDaUnjr5qsMI4ASqEUeLb3tj8h83WsyjtP
	x+dDoCO+qWx2uRs90M0wt9ACFV4ANWQ8eFatrWB9pGRAOuf0smwwXsV5M5glaeUJ03V5zol6WCVvA
	TZFWbNLhIfS2IxHMYtbNkTNXYxV0mRF91y25bv2a2JLpw83jlR5dH2JbRoZiNpzKVWEQnmRUnZmbt
	jx08970PFRkwrV/ufkibVfnncSUNyfPG1nUrXUqihB5z/Y/INnkskVkM5yN/SxdRM4jIZTRAS3TsC
	0MzlL5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woA42-00000001le6-0yFF;
	Mon, 27 Jul 2026 01:23:30 +0000
Received: from va-2-29.ptr.blmpb.com ([209.127.231.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woA3y-00000001lcK-2JSg
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 01:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1785115398; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Bveg9tUpLvJ6brn7oQydeacLalvrezQCp6eprkRB5wo=;
 b=epV3NNhfGImHyivJ7bohBzZMJ0W0lIJjtE3C7bAjE6fRrNNLkTzRg8+MNPwo97r05J5lwF
 71p73XSojnYGMJYBE/sQ0gwIHKU2jzZygTvA+U5D2OMH6sCU2ajO68UVQPpt9CELJDYb5i
 OT0uXA2K6NnEg6NMwKUyU9CmIWC1fedWhcXb+CLm9S/w8ATfTZijgEI8et8vcKKU65itmF
 PhjE7PSJu9GbDCF10oy0BlFCJfcc0lQk6YOwFELMtlvrpGOxiNui5AbOeWq68ZuTRQW1b1
 8ml5mCEiwQIBlLhD3zUAzyrGLXoMpLa4A+Dsl0G+8w5xxwx24FQagna+6hVhuA==
From: "Sterling-Ash" <baihui.liang@spacemit.com>
Subject: [PATCH v2 1/2] dt-bindings: gpu: img,powervr-rogue: add spacemit,k3-gpu
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a66b304+ab6acd+lists.infradead.org+baihui.liang@spacemit.com>
To: "Frank Binns" <frank.binns@imgtec.com>, 
	"Matt Coster" <matt.coster@imgtec.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com> <20260727012231.1025210-1-baihui.liang@spacemit.com>
Date: Mon, 27 Jul 2026 09:22:30 +0800
Message-Id: <20260727012231.1025210-2-baihui.liang@spacemit.com>
X-Mailer: git-send-email 2.34.1
X-Original-From: Sterling-Ash <baihui.liang@spacemit.com>
Received: from snode5.. ([120.237.158.181]) by smtp.feishu.cn with ESMTP; Mon, 27 Jul 2026 09:23:15 +0800
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, 
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>
In-Reply-To: <20260727012231.1025210-1-baihui.liang@spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_182326_658261_3A574F31 
X-CRM114-Status: GOOD (  10.27  )
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

QWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBJTUcgQlhNLTQtNjQgR1BVIGludGVncmF0
ZWQgaW50byB0aGUNClNwYWNlbWlUIEszIFNvQy4gSXQgc2hhcmVzIHRoZSBzYW1lIGNvcmUgYXMg
dGhlYWQsdGgxNTIwLWdwdSBidXQgaXMNCmtlcHQgYXMgYSBzZXBhcmF0ZSBjb21wYXRpYmxlIGVu
dHJ5LCBzaW5jZSB0aGUgSzMgaW50ZWdyYXRpb24gZGlmZmVycw0KZnJvbSBUSDE1MjAgaW4gaXRz
IGNsb2NrIGFuZCBwb3dlci1kb21haW4gcmVxdWlyZW1lbnRzOiBLMyBvbmx5IG5lZWRzDQphIHNp
bmdsZSAiY29yZSIgY2xvY2ssIGFuZCBpdHMgR1BVIHBvd2VyIGRvbWFpbiBpcyBlbmFibGVkIGJ5
IHRoZQ0KYm9vdGxvYWRlciBiZWZvcmUgTGludXggYm9vdHMgcmF0aGVyIHRoYW4gYmVpbmcgbW9k
ZWxsZWQgYW5kIHN3aXRjaGVkDQpieSBMaW51eCwgc28gbm8gcG93ZXItZG9tYWlucyBwcm9wZXJ0
eSBpcyByZXF1aXJlZCBmb3IgdGhpcyBwbGF0Zm9ybQ0KKHVubGlrZSB0aGUgb3RoZXIgaW1nLGlt
Zy1ieG0tNC02NCB1c2VyKS4NCg0KTm8gZXhpc3RpbmcgY29tcGF0aWJsZS1zcGVjaWZpYyAiaWYi
IGJsb2NrIG1hdGNoZXMgc3BhY2VtaXQsazMtZ3B1LCBzbw0KY2xvY2tzL2Nsb2NrLW5hbWVzL3Bv
d2VyLWRvbWFpbnMgYWxsIGZhbGwgYmFjayB0byB0aGlzIHNjaGVtYSdzDQpnZW5lcmFsIGNvbnN0
cmFpbnRzLCB3aGVyZSBwb3dlci1kb21haW5zIGlzIG9wdGlvbmFsLiBUaGlzIGxlYXZlcyByb29t
DQpmb3IgYSBwb3dlci1kb21haW5zIHByb3ZpZGVyIHRvIGJlIGFkZGVkIGxhdGVyIHdpdGhvdXQg
YSBmdXJ0aGVyDQpiaW5kaW5nIGNoYW5nZSwgc2hvdWxkIG9uZSBldmVyIGJlIG1vZGVsbGVkIGlu
IExpbnV4IGZvciB0aGlzIFNvQy4NCg0KU2lnbmVkLW9mZi1ieTogU3RlcmxpbmctQXNoIDxiYWlo
dWkubGlhbmdAc3BhY2VtaXQuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sIHwgNSArKysrKw0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KaW5kZXggYTFm
NTRkYmFlM2YzLi4yZDU4ZGQ0MDc2YTggMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwNCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KQEAg
LTM4LDYgKzM4LDExIEBAIHByb3BlcnRpZXM6DQogICAgICAgICAgICAgICAtIHRoZWFkLHRoMTUy
MC1ncHUNCiAgICAgICAgICAgLSBjb25zdDogaW1nLGltZy1ieG0tNC02NA0KICAgICAgICAgICAt
IGNvbnN0OiBpbWcsaW1nLXJvZ3VlDQorICAgICAgLSBpdGVtczoNCisgICAgICAgICAgLSBlbnVt
Og0KKyAgICAgICAgICAgICAgLSBzcGFjZW1pdCxrMy1ncHUNCisgICAgICAgICAgLSBjb25zdDog
aW1nLGltZy1ieG0tNC02NA0KKyAgICAgICAgICAtIGNvbnN0OiBpbWcsaW1nLXJvZ3VlDQogICAg
ICAgLSBpdGVtczoNCiAgICAgICAgICAgLSBlbnVtOg0KICAgICAgICAgICAgICAgLSB0aSxhbTYy
cC1ncHUNCi0tIA0KMi4zNC4xDQoKVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudCBhcmUg
Y29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBvdGhlcndpc2UgcHJvdGVjdGVk
IGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IGF0dGFjaG1lbnQgZnJvbSB5
b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgcmVwbHkgZS1t
YWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1c2UsIGNvcHksIGRpc2Nsb3Nl
IG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3NhZ2Ugb3IgYW55IGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBjYW5ub3QgYmUgZ3VhcmFudGVl
ZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNhbiBiZSBpbnRlcmNlcHRlZCwg
YW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hvdWxkIHRha2UgZnVsbCByZXNw
b25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuIAogCuacrOmCruS7tuWPiuWFtuS7u+S9
lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWPr+iDveWPl+WFtuS7luS/neaKpOaIluS4
jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWmgumYgeS4i+ivr+aUtuWIsOacrOmCruS7
tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmCruS7tueahOaWueW8j+mAmuefpeWPkeS7
tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuS7jumYgeS4i+ezu+e7n+S4
reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuacrOmCruS7tuWGmeaYjuS5i+aUtuS7tuS6
uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOAgeaKq+mcsuacrOmCruS7tuaIluWFtuS7
u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmCruS7tuaIluWFtuS7u+S9leWGheWuueiA
jOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7tuaXoOazleS/neivgeaYr+S4gOenjeWu
ieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeeahOmAmuS/oeaWueW8j++8jOWPr+iDveS8
muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaNn+Wdj++8jOaUtuS7tuS6uumcgOiHquih
jOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAggpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
