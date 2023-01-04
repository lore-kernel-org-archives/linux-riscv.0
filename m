Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2F0C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/r2E9veJxvu9CivCBZNThgRTYsWHwOJTQ6qaZYNm9L8=; b=Z88y97DsiQyG1y
	i6IcrZl9Kwnqs1laCWJV8VTniZwsXHR3YT7izpNNoIt+6SZ6NkPecRfw6S7lQfU4sjIsuWyiwV3A1
	kZpMcZwEW+31RZVUmR4Lrf5vQ99DMep//gmOTq6gwFyW0EYwwA/xWQuBAoz+qjN+3Uaaxms8EhAWk
	gK0Fd+yj/zhEJ09fEAnQz4B2K5onuiRKYGn4SwoiE26NIpGZXL8gxAmklKauU9rSrUl8+7ZcD+80t
	BNXlV0vN/U3rxNbTAuOSZP0wkzqHXaJszGJvHB04K4Di2OElZwYOM5KMUljGB1W+fYWp8RBdFLpgV
	Xivzy5nbUplTO5Fkj1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD89H-00AqLz-9M; Wed, 04 Jan 2023 18:05:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD89A-00AqIc-QI
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 18:05:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2E58B81892;
	Wed,  4 Jan 2023 18:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8A6C43396;
	Wed,  4 Jan 2023 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672855548;
	bh=SpxUfboVfaSWtvMSqW0B+NZAeloH/U4lZdg9RHU4N3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZyaK10kBqxH/xTpI6ZGaW6VYehCAWKr4pIlLC7OEE5Psip32Y1FhtVa0esLwfIWY
	 Ucp6yTs8EtQAPPX4mLo3Z0ezzgA37F2YHznb+fLhEx2N2Vsiozsi1dpb98R05e6Ji3
	 4lWe9XtR83YxVnriLYZOjZoD2Sp03q5B3sQZFdiYvC0KSoh0qTalDm+0MMI1dNhr8z
	 Mu2JoS+NnX8D5IS6VbhLD60LXXuhyR3tndeHWHxA+zpNdiLGT55SteqzINdxY19xN0
	 huKDkhxNkaJr+cINkBg+nXZEYk/SkmnOnyfa/Aav1Ilklsd5dRp5MyPBymK33013/p
	 t9ImPPAILndaA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: move cpu-capacity to a shared loation
Date: Wed,  4 Jan 2023 18:05:13 +0000
Message-Id: <20230104180513.1379453-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104180513.1379453-1-conor@kernel.org>
References: <20230104180513.1379453-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4078; i=conor.dooley@microchip.com; h=from:subject; bh=EHhLKTpL8b24ylcqPJCu6roLTdkZjz8WegHWiaxDAkY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlb91+c0cf+KyCreJNWx16FJ+++CThmLNT2+X5p868tcjfN H29431HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ/O5n+O/29NHEsKfOfOqBdjd+b/ /64NeTzX2i7xX/C1jdWFCg47COkWGp9LYpxfppoocYSyYqhum2eh2Y86/V/sqUG2sjGEKfsDMCAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_100553_197542_307D2EFA 
X-CRM114-Status: GOOD (  15.34  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClJJU0MtViB1
c2VzIHRoZSBzYW1lIGdlbmVyaWMgdG9wb2xvZ3kgY29kZSBhcyBhcm02NCAmIHdoaWxlIHRoZXJl
CmN1cnJlbnRseSBleGlzdHMgbm8gYmluZGluZyBmb3IgY3B1LWNhcGFjaXR5IG9uIFJJU0MtViwg
dGhlIGNvZGUgcGF0aHMKY2FuIGJlIGhpdCBpZiB0aGUgcHJvcGVydHkgaXMgcHJlc2VudC4KCk1v
dmUgdGhlIGRvY3VtZW50YXRpb24gb2YgY3B1LWNhcGFjaXR5IHRvIGEgc2hhcmVkIGxvY2F0aW9u
LCBhaGVhZCBvZgpkZWZpbmluZyBhIGJpbmRpbmcgZm9yIGNhcGFjaXR5LWRtaXBzLW1oeiBvbiBS
SVNDLVYuIFVwZGF0ZSBzb21lCnJlZmVyZW5jZXMgdG8gdGhpcyBkb2N1bWVudCBpbiB0aGUgcHJv
Y2Vzcy4KClNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Ci0tLQpJIHdhc24ndCBzdXJlIHdoYXQgdG8gZG8gd2l0aCByZWZlcmVuY2UgWzFdLCBi
dXQgc2luY2UgdGhlIHByb3BlcnR5IHdpbGwKYmUgdGhlIHNhbWUgb24gUklTQy1WLCBJIGxlZnQg
aXQgYXMgaXMuCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jcHVz
LnlhbWwgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3thcm0g
PT4gY3B1fS9jcHUtY2FwYWNpdHkudHh0ICAgICAgICAgfCA0ICsrLS0KIERvY3VtZW50YXRpb24v
c2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdCAgICAgICAgICAgICAgICAgICAgfCAyICstCiBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHku
cnN0IHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCiByZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3thcm0gPT4gY3B1
fS9jcHUtY2FwYWNpdHkudHh0ICg5OCUpCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2NwdXMueWFtbAppbmRleCAwMWI1YTljNjg5YTIuLmE3NTg2Mjk1YTZmNSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jcHVzLnlh
bWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jcHVzLnlhbWwK
QEAgLTI1Nyw3ICsyNTcsNyBAQCBwcm9wZXJ0aWVzOgogCiAgIGNhcGFjaXR5LWRtaXBzLW1oejoK
ICAgICBkZXNjcmlwdGlvbjoKLSAgICAgIHUzMiB2YWx1ZSByZXByZXNlbnRpbmcgQ1BVIGNhcGFj
aXR5IChzZWUgLi9jcHUtY2FwYWNpdHkudHh0KSBpbgorICAgICAgdTMyIHZhbHVlIHJlcHJlc2Vu
dGluZyBDUFUgY2FwYWNpdHkgKHNlZSAuLi9jcHUvY3B1LWNhcGFjaXR5LnR4dCkgaW4KICAgICAg
IERNSVBTL01IeiwgcmVsYXRpdmUgdG8gaGlnaGVzdCBjYXBhY2l0eS1kbWlwcy1taHoKICAgICAg
IGluIHRoZSBzeXN0ZW0uCiAKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vY3B1LWNhcGFjaXR5LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jcHUvY3B1LWNhcGFjaXR5LnR4dApzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUg
ZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2NwdS1jYXBhY2l0eS50
eHQKcmVuYW1lIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcHUvY3B1LWNh
cGFjaXR5LnR4dAppbmRleCBjYzVlMTkwMzkwYjcuLmYyOGUxYWRhZDQyOCAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jcHUtY2FwYWNpdHkudHh0Cisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcHUvY3B1LWNhcGFjaXR5LnR4
dApAQCAtMSwxMiArMSwxMiBAQAogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci1BUk0gQ1BVcyBjYXBhY2l0eSBiaW5kaW5ncworQ1BVIGNhcGFjaXR5IGJpbmRpbmdz
CiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIAogPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAxIC0gSW50cm9kdWN0aW9uCiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIAotQVJNIHN5c3RlbXMgbWF5
IGJlIGNvbmZpZ3VyZWQgdG8gaGF2ZSBjcHVzIHdpdGggZGlmZmVyZW50IHBvd2VyL3BlcmZvcm1h
bmNlCitTb21lIHN5c3RlbXMgbWF5IGJlIGNvbmZpZ3VyZWQgdG8gaGF2ZSBjcHVzIHdpdGggZGlm
ZmVyZW50IHBvd2VyL3BlcmZvcm1hbmNlCiBjaGFyYWN0ZXJpc3RpY3Mgd2l0aGluIHRoZSBzYW1l
IGNoaXAuIEluIHRoaXMgY2FzZSwgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBoYXMKIHRvIGJlIG1h
ZGUgYXZhaWxhYmxlIHRvIHRoZSBrZXJuZWwgZm9yIGl0IHRvIGJlIGF3YXJlIG9mIHN1Y2ggZGlm
ZmVyZW5jZXMgYW5kCiB0YWtlIGRlY2lzaW9ucyBhY2NvcmRpbmdseS4KZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdCBiL0RvY3VtZW50YXRpb24v
c2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdAppbmRleCA4MDVmODVmMzMwYjUuLjhlMmI4NTM4
YmMyYiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHku
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdApAQCAt
MjYwLDcgKzI2MCw3IEBAIGZvciB0aGF0IHB1cnBvc2UuCiAKIFRoZSBhcm0gYW5kIGFybTY0IGFy
Y2hpdGVjdHVyZXMgZGlyZWN0bHkgbWFwIHRoaXMgdG8gdGhlIGFyY2hfdG9wb2xvZ3kgZHJpdmVy
CiBDUFUgc2NhbGluZyBkYXRhLCB3aGljaCBpcyBkZXJpdmVkIGZyb20gdGhlIGNhcGFjaXR5LWRt
aXBzLW1oeiBDUFUgYmluZGluZzsgc2VlCi1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL2NwdS1jYXBhY2l0eS50eHQuCitEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY3B1L2NwdS1jYXBhY2l0eS50eHQuCiAKIDMuMiBGcmVxdWVuY3kgaW52YXJpYW5jZQogLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdAppbmRleCAzYTUy
MDUzYzI5ZGMuLmUwN2ZmZGQzOTFkMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdAorKysgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0CkBAIC0y
MzMsNyArMjMzLDcgQEAgQ0ZT6LCD5bqm57G75Z+65LqO5a6e5L2T6LSf6L296Lef6Liq5py65Yi2
77yIUGVyLUVudGl0eSBMb2FkIFRyYWNraW5nLCBQRUxU77yJCiAKIGFybeWSjGFybTY05p625p6E
55u05o6l5oqK6L+Z5Liq5L+h5oGv5pig5bCE5YiwYXJjaF90b3BvbG9neempseWKqOeahENQVSBz
Y2FsaW5n5pWw5o2u5Lit77yI6K+R5rOo77ya5Y+C6ICDCiBhcmNoX3RvcG9sb2d5LmjnmoRwZXJj
cHXlj5jph49jcHVfc2NhbGXvvInvvIzlroPmmK/ku45jYXBhY2l0eS1kbWlwcy1taHogQ1BVIGJp
bmRpbmfkuK3ooY3nlJ/orqHnrpcKLeWHuuadpeeahOOAguWPguingURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vY3B1LWNhcGFjaXR5LnR4dOOAggor5Ye65p2l55qE44CC5Y+C
6KeBRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NwdS9jcHUtY2FwYWNpdHkudHh0
44CCCiAKIDMuMiDpopHnjofkuI3lj5jmgKcKIC0tLS0tLS0tLS0tLS0tCi0tIAoyLjM5LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
