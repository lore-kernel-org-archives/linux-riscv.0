Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4FEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6NcnHbvx/BA8Wwmnb5dHfktQpLJrtavGGxD2zFMfF0c=; b=jbIuddmNFgBIHY
	tFtuZK5h9aygEnEYGwgp1z4o8OjIPyyuMR3p4Uq2+AoeuXBM8Dpbjo/T9BlzuZOAHgzJ5xhwllnZy
	yPBC+sSizFvu4RkP8ZRQtIJvsWJqPVJskF4jABD48wzrUL22484SRlQ8uA0kJmhmGGLNG1aY58Mer
	6p2msi2mEc99fscDS8KZ+z/PUD01um5wmT0gVpzKQQuo5cirmoCIPYxGbmwPSDPg1HSTHAYQVlY2q
	jiMpvl1hI9X27YqvklCGC3VLN2ArM8ohlnfiEseAbqfui2Kb6s61KiNo3VhyPb9FFzpaKbDpy0YOD
	jPLTnaBbSZMfspeYv59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEv05-001al7-0u;
	Thu, 29 Jun 2023 17:00:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEv00-001ajB-2n;
	Thu, 29 Jun 2023 17:00:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D884615AF;
	Thu, 29 Jun 2023 17:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF10C433C0;
	Thu, 29 Jun 2023 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688058001;
	bh=+L4Ij4wrOLbQ96O/FTu1MsLp0W4gkxcKZWK0acwmpS0=;
	h=From:To:Cc:Subject:Date:From;
	b=MoXbH0bE6di+C5UwzqeyctmCs7co1wTv2/KtomUNC/fC9yUdGAPwseRlgW5d23hWE
	 plF0wyxsCMm+621H7Q4FLFBJLVTuDGEexWwSPPLLAGzqYCBnM4cM2eq8r9iBUclwJH
	 o0HkzQ6jEn8kfICJXfqaXfcnWWFlFuBJiCH/cxOsiCHaVpLooPfGLnERka3fbki7JK
	 IQsY4jD4TIlWo97Cu1MVuX4wZnT49xoOHFddGroHI6vuihy3y5IGqYnrgZZLYZ6buN
	 PyjzETzJxip3GlZmarkpZZR+zLSu9uRz9TQdQ6C33nzlnSHf68zJyASxgS52ZD0uCy
	 fvRvmYU5sLo1w==
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: "Bjorn Helgaas" <bhelgaas@google.com>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
	"Rob Herring" <robh@kernel.org>,
	"Yue Wang" <yue.wang@Amlogic.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
	"Srikanth Thokala" <srikanth.thokala@intel.com>,
	"Daire McNamara" <daire.mcnamara@microchip.com>,
	"Conor Dooley" <conor.dooley@microchip.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] PCI: meson: Remove cast between incompatible function type
Date: Thu, 29 Jun 2023 16:59:54 +0000
Message-ID: <20230629165956.237832-1-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_100004_969256_15163735 
X-CRM114-Status: GOOD (  11.14  )
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

UmF0aGVyIHRoYW4gY2FzdGluZyB2b2lkKCopKHN0cnVjdCBjbGsgKikgdG8gdm9pZCAoKikodm9p
ZCAqKSwgdGhhdApmb3JjZXMgY29udmVyc2lvbiB0byBhbiBpbmNvbXBhdGlibGUgZnVuY3Rpb24g
dHlwZSwgcmVwbGFjZSB0aGUgY2FzdAp3aXRoIGEgc21hbGwgbG9jYWwgc3R1YiBmdW5jdGlvbiB3
aXRoIGEgc2lnbmF0dXJlIHRoYXQgbWF0Y2hlcyB3aGF0CnRoZSBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoKSBmdW5jdGlvbiBleHBlY3RzLgoKVGhlIHN1YiBmdW5jdGlvbiB0YWtlcyBhIHZvaWQg
KiwgdGhlbiBwYXNzZXMgaXQgZGlyZWN0bHkgdG8KY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCksIHdo
aWNoIGhhbmRsZXMgdGhlIG1vcmUgc3BlY2lmaWMgdHlwZS4KClJlcG9ydGVkIGJ5IGNsYW5nIHdo
ZW4gYnVpbGRpbmcgd2l0aCB3YXJuaW5ncyBlbmFibGVkOgoKICBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2ktbWVzb24uYzoxOTE6Njogd2FybmluZzogY2FzdCBmcm9tICd2b2lkICgqKShz
dHJ1Y3QgY2xrICopJyB0byAndm9pZCAoKikodm9pZCAqKScgY29udmVydHMgdG8gaW5jb21wYXRp
YmxlIGZ1bmN0aW9uIHR5cGUgWy1XY2FzdC1mdW5jdGlvbi10eXBlLXN0cmljdF0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAoKikgKHZvaWQgKikpY2xrX2Rpc2FibGVf
dW5wcmVwYXJlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGFyZSBp
bnRlbmRlZC4KCkZpeGVzOiA5YzBlZjZkMzRmZGIgKCJQQ0k6IGFtbG9naWM6IEFkZCB0aGUgQW1s
b2dpYyBNZXNvbiBQQ0llIGNvbnRyb2xsZXIgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogS3J6eXN6
dG9mIFdpbGN6ecWEc2tpIDxrd2lsY3p5bnNraUBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jIHwgMTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2ktbWVzb24uYwppbmRleCBjMTUyNzY5M2JlZDkuLjM0OTkwYTYzNjNkMCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMKKysrIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMKQEAgLTE2Myw2ICsxNjMsMTMgQEAgc3Rh
dGljIGludCBtZXNvbl9wY2llX3Jlc2V0KHN0cnVjdCBtZXNvbl9wY2llICptcCkKIAlyZXR1cm4g
MDsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIG1lc29uX3BjaWVfZGlzYWJsZV9jbG9jayh2b2lk
ICpkYXRhKQoreworCXN0cnVjdCBjbGsgKmNsayA9IGRhdGE7CisKKwljbGtfZGlzYWJsZV91bnBy
ZXBhcmUoY2xrKTsKK30KKwogc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xrICptZXNvbl9wY2llX3By
b2JlX2Nsb2NrKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkJCSBjb25zdCBjaGFyICppZCwgdTY0
IHJhdGUpCiB7CkBAIC0xODcsOSArMTk0LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xrICpt
ZXNvbl9wY2llX3Byb2JlX2Nsb2NrKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0dXJuIEVSUl9Q
VFIocmV0KTsKIAl9CiAKLQlkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LAotCQkJCSAodm9p
ZCAoKikgKHZvaWQgKikpY2xrX2Rpc2FibGVfdW5wcmVwYXJlLAotCQkJCSBjbGspOworCWRldm1f
YWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIG1lc29uX3BjaWVfZGlzYWJsZV9jbG9jaywgY2xrKTsK
IAogCXJldHVybiBjbGs7CiB9Ci0tIAoyLjQxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
