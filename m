Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8446BC41513
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XXmthn8AZlgwHpv1FW36owBI3Qc5aiXckkrb0tfmx1w=; b=wcrynNHSYT2DBl
	BLNsfbPXdtVr7osdWTA8hKgoG832clANcTTZygKPmW+i4v+OylIPpzVJ7l0KqTl1JCpmc8wJdmHhE
	Jt6OR6hGXdXWi1QU1EdtfyELvRJZv62cxJakDnnk4Lmh4ro87L8jzkUiTcXk0XfRcXhb4CyksxKA/
	Wdqa7/V+IfOAtNUcn3oFbVR8PuLHYSXlcg99aRKlL7ESXQG1irNbljYAVz7jpK7HrWQJ/aHaKpeQN
	1JX1SVCWwtGH1c76zDX1kHl1YueSB+58U24QbxcDNDXizrcfk/0lo28k2I4wrSZBZ2pG5kVLVDk2l
	XlC3JN1jGdOQtqpQaDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQmLY-001jik-1n;
	Tue, 01 Aug 2023 10:11:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQmLU-001jZe-2J
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 10:11:18 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E7FDA24E231;
	Tue,  1 Aug 2023 18:10:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:32 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:32 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki
	<jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, Keith Zhao
	<keith.zhao@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>
Subject: [PATCH v1 v1 0/7] DRM driver for verisilicon
Date: Tue, 1 Aug 2023 18:10:23 +0800
Message-ID: <20230801101030.2040-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_031117_077807_F8378F72 
X-CRM114-Status: GOOD (  13.12  )
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

VGhpcyBwYXRjaCBpcyBhIGRybSBkcml2ZXIgZm9yIFN0YXJmaXZlIFNvYyBKSDcxMTAsCkkgYW0g
c2VuZGluZyBEcm0gZHJpdmVyIHBhcnQgYW5kIEhETUkgZHJpdmVyIHBhcnQuCgpXZSB1c2VkIEdF
TSBmcmFtZXdvcmsgZm9yIGJ1ZmZlciBtYW5hZ2VtZW50ICwgYW5kIApmb3IgYnVmZmVyIGFsbG9j
YXRpb24sd2UgdXNlIERNQSBBUElzLgoKdGhlIFN0YXJmaXZlIEhETUkgc2VydmVycyBhcyBpbnRl
cmZhY2UgYmV0d2VlbiBhIExDRCAKQ29udHJvbGxlciBhbmQgYSBIRE1JIGJ1cy4gQSBIRE1JIFRY
IGNvbnNpc3RzIG9mIG9uZSAKSERNSSB0cmFuc21pdHRlciBjb250cm9sbGVyIGFuZCBvbmUgSERN
SSB0cmFuc21pdHRlciBQSFkuCihTb3VuZCBzdXBwb3J0IGlzIG5vdCBpbmNsdWRlIGluIHRoaXMg
cGF0Y2gpCgpUaGlzIHBhdGNoc2V0IHNob3VsZCBiZSBhcHBsaWVkIGFmdGVyIHRoZSBwYXRjaHNl
dDoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWNsay9jb3Zlci8y
MDIzMDcxMzExMzkwMi41NjUxOS0xLXhpbmd5dS53dUBzdGFyZml2ZXRlY2guY29tLwoKVjE6CkNo
YW5nZXMgc2luY2UgdjE6Ci0gRnVydGhlciBzdGFuZGFyZGl6ZSB0aGUgeWFtbCBmaWxlLgotIER0
cyBuYW1pbmcgY29udmVudGlvbiBpbXByb3ZlZC4KLSBGaXggdGhlIHByb2JsZW0gb2YgY29tcGls
aW5nIGFuZCBsb2FkaW5nIGtvIGZpbGVzLgotIFVzZSBkcm0gbmV3IGFwaSB0byBhdXRvbWF0aWNh
bGx5IG1hbmFnZSByZXNvdXJjZXMuCi0gRHJvcCBzdHJ1Y3QgdnNfY3J0Y19mdW5jcyZ2c19wbGFu
ZV9mdW5jc++8jHN1YmRpdmlkZSB0aGUgcGxhbmUncyBoZWxwIGludGVyZmFjZQotIFJlZHVjZSB0
aGUgbW9kaWZpZXJzIHVudXNlZC4KLSBPcHRpbWl6ZSB0aGUgaGRtaSBkcml2ZXIgY29kZQoKS2Vp
dGggWmhhbyAoNyk6CiAgTUFJTlRBSU5FUlM6IFVwZGF0ZSBzdGFyZml2ZSBtYWludGFpbmVycwog
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgeWFtbHMgZm9yIEpINzExMCBkaXNwbGF5IHN5c3Rl
bQogIHJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcxMTA6IGFkZCBkYyBjb250cm9sbGVyIGFuZCBo
ZG1pICBub2RlCiAgZHJtL2ZvdXJjYzogQWRkIGRybS92cyB0aWxlZCBtb2RpZmllcnMKICBkcm0v
dnM6IFJlZ2lzdGVyIERSTSBkZXZpY2UKICBkcm0vdnM6IEFkZCBLTVMgY3J0YyZwbGFuZQogIGRy
bS92czogQWRkIGhkbWkKCiAuLi4vc3RhcmZpdmUvc3RhcmZpdmUsZGlzcGxheS1zdWJzeXN0ZW0u
eWFtbCAgfCAgIDQxICsKIC4uLi9zdGFyZml2ZS9zdGFyZml2ZSxqaDcxMTAtZGM4MjAwLnlhbWwg
ICAgICB8ICAxMDcgKwogLi4uL3N0YXJmaXZlL3N0YXJmaXZlLGpoNzExMC1pbm5vLWhkbWkueWFt
bCAgIHwgICA5MiArCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICA3ICsKIC4uLi9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kgICAgICAg
ICB8ICAgODcgKwogYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaSAgICAg
IHwgICA0MyArCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL0tjb25maWcgICAgICAgICAgIHwg
ICAyNSArCiBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vTWFrZWZpbGUgICAgICAgICAgfCAg
IDEzICsKIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9zdGFyZml2ZV9oZG1pLmMgICB8ICA5
NDAgKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9zdGFyZml2ZV9oZG1pLmgg
ICB8ICAyOTUgKysrCiBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfY3J0Yy5jICAgICAg
ICAgfCAgMzY1ICsrKwogZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGMuaCAgICAg
ICAgIHwgICA1NCArCiBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZGMuYyAgICAgICAg
ICAgfCAxMDM2ICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2RjLmgg
ICAgICAgICAgIHwgICA4NyArCiBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZGNfaHcu
YyAgICAgICAgfCAyMDA4ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vdnNfZGNfaHcuaCAgICAgICAgfCAgNDk2ICsrKysKIGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19kcnYuYyAgICAgICAgICB8ICAyNzQgKysrCiBkcml2ZXJzL2dwdS9kcm0vdmVy
aXNpbGljb24vdnNfZHJ2LmggICAgICAgICAgfCAgIDU0ICsKIGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19nZW0uYyAgICAgICAgICB8ICAyOTggKysrCiBkcml2ZXJzL2dwdS9kcm0vdmVy
aXNpbGljb24vdnNfZ2VtLmggICAgICAgICAgfCAgIDUwICsKIGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19tb2Rlc2V0LmMgICAgICB8ICAgOTIgKwogZHJpdmVycy9ncHUvZHJtL3Zlcmlz
aWxpY29uL3ZzX21vZGVzZXQuaCAgICAgIHwgICAxMyArCiBkcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vdnNfcGxhbmUuYyAgICAgICAgfCAgNTAyICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vdmVy
aXNpbGljb24vdnNfcGxhbmUuaCAgICAgICAgfCAgIDY1ICsKIGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c190eXBlLmggICAgICAgICB8ICAgNzAgKwogaW5jbHVkZS91YXBpL2RybS9kcm1f
Zm91cmNjLmggICAgICAgICAgICAgICAgIHwgICAyNyArCiBpbmNsdWRlL3VhcGkvZHJtL3ZzX2Ry
bS5oICAgICAgICAgICAgICAgICAgICAgfCAgIDUwICsKIDI5IGZpbGVzIGNoYW5nZWQsIDcxOTQg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3N0YXJmaXZlL3N0YXJmaXZlLGRpc3BsYXktc3Vic3lzdGVtLnlh
bWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9zdGFyZml2ZS9zdGFyZml2ZSxqaDcxMTAtZGM4MjAwLnlhbWwKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdGFyZml2
ZS9zdGFyZml2ZSxqaDcxMTAtaW5uby1oZG1pLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9zdGFyZml2ZV9oZG1pLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vc3RhcmZpdmVfaGRtaS5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2NydGMuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19jcnRjLmgKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZGMuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kYy5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2RjX2h3LmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZGNfaHcuaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcnYuYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcnYuaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19nZW0uYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19nZW0uaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19tb2Rlc2V0LmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfbW9kZXNldC5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX3BsYW5l
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfcGxh
bmUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c190
eXBlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvZHJtL3ZzX2RybS5oCgotLSAK
Mi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
