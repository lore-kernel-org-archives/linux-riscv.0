Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6D2EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCdrjkr/mqMcUM2K/kKsjqDoEK0Pzr9O96eOlHFoe/A=; b=4bbmPhu0d4anTU
	HA4tK7B227DSS76NytvUDe2s8z9sNMcn2BMXv+3ElHCqQbl0jVumRqqAvY63a0R2pWaEcnrzPL+N/
	W8rfwg6yjRDDEFqxn695OIbqcmPN7QGvVjWRkhlOfVcDjAFn2D0e6TMUZIz037zTRd9dWjC506dV4
	gS6poiyTonrHh7mGKcLBhbPUjN0XylL3VUMX3Rj1hje8z9LtU73sUSrNDwA5hOcbW+AUCFFvg2/js
	Dy096lSkm2cadC4EW2NRF/+Zcv8QwcTq8CLcgR+Ex8meDdzD63Nmyq4nG6uU96PaMrtQI/jSnqRV/
	0X5jgsdn03bcuFT4d7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEv0F-001anm-04;
	Thu, 29 Jun 2023 17:00:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEv01-001ajJ-2M;
	Thu, 29 Jun 2023 17:00:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40028615BA;
	Thu, 29 Jun 2023 17:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56124C433CB;
	Thu, 29 Jun 2023 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688058003;
	bh=HEnFcC/moYFnoPxBY2BVOmQpDQ1kN+hXUcu13kg/9xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hMiUThPtt9QAVsqDXwBF4//tBZBsxF9cv8K24qAnQBF1YPPr2BkybozUVl+avaJRN
	 udUNE/uWoNH0W9u0vh6Pe1s6DRUYBaZofTLVKRbwBm4aGhAuszASWydvu4jqs5TrX5
	 Rg2/xKVIGWlyUJ+Pm9OWZ7vsWian4pSnl2/NdwzLcvDkUjr9MlSFv2e+O5pc9k1eqS
	 BM4I7iEjRdL3AlpYI3d8zXaM3thEfoLDsELu6TNj1+wsae1ytO/H+FaWbqcr1+tegT
	 6xOperToL6lTnjq2HCdi5ek/XcR6N93xhMn/IeTCw7/TpU7FMaf0C4uNlWacQBLFQ5
	 nONfrPP1e+0Tw==
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
Subject: [PATCH 2/3] PCI: keembay: Remove cast between incompatible function type
Date: Thu, 29 Jun 2023 16:59:55 +0000
Message-ID: <20230629165956.237832-2-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629165956.237832-1-kwilczynski@kernel.org>
References: <20230629165956.237832-1-kwilczynski@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_100005_872192_02D9FA58 
X-CRM114-Status: GOOD (  12.38  )
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
bGVyL2R3Yy9wY2llLWtlZW1iYXkuYzoxNzI6MTI6IHdhcm5pbmc6IGNhc3QgZnJvbSAndm9pZCAo
Kikoc3RydWN0IGNsayAqKScgdG8gJ3ZvaWQgKCopKHZvaWQgKiknIGNvbnZlcnRzIHRvIGluY29t
cGF0aWJsZSBmdW5jdGlvbiB0eXBlIFstV2Nhc3QtZnVuY3Rpb24tdHlwZS1zdHJpY3RdCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQoKikodm9pZCAqKSljbGtf
ZGlzYWJsZV91bnByZXBhcmUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KTm8gZnVuY3Rpb25hbCBj
aGFuZ2VzIGFyZSBpbnRlbmRlZC4KCkZpeGVzOiAwYzg3ZjkwYjRjMTMgKCJQQ0k6IGtlZW1iYXk6
IEFkZCBzdXBwb3J0IGZvciBJbnRlbCBLZWVtIEJheSIpClNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBXaWxjennFhHNraSA8a3dpbGN6eW5za2lAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLWtlZW1iYXkuYyB8IDExICsrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUta2VlbWJheS5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1rZWVtYmF5LmMKaW5kZXggZjkwZjM2YmFjMDE4Li4yODliZmY5OWQ3NjIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUta2VlbWJheS5jCisr
KyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUta2VlbWJheS5jCkBAIC0xNDgsNiAr
MTQ4LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfcGNpZV9vcHMga2VlbWJheV9wY2llX29w
cyA9IHsKIAkuc3RvcF9saW5rCT0ga2VlbWJheV9wY2llX3N0b3BfbGluaywKIH07CiAKK3N0YXRp
YyBpbmxpbmUgdm9pZCBrZWVtYmF5X3BjaWVfZGlzYWJsZV9jbG9jayh2b2lkICpkYXRhKQorewor
CXN0cnVjdCBjbGsgKmNsayA9IGRhdGE7CisKKwljbGtfZGlzYWJsZV91bnByZXBhcmUoY2xrKTsK
K30KKwogc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xrICprZWVtYmF5X3BjaWVfcHJvYmVfY2xvY2so
c3RydWN0IGRldmljZSAqZGV2LAogCQkJCQkJICAgY29uc3QgY2hhciAqaWQsIHU2NCByYXRlKQog
ewpAQCAtMTY4LDkgKzE3NSw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqa2VlbWJheV9w
Y2llX3Byb2JlX2Nsb2NrKHN0cnVjdCBkZXZpY2UgKmRldiwKIAlpZiAocmV0KQogCQlyZXR1cm4g
RVJSX1BUUihyZXQpOwogCi0JcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwKLQkJ
CQkgICAgICAgKHZvaWQoKikodm9pZCAqKSljbGtfZGlzYWJsZV91bnByZXBhcmUsCi0JCQkJICAg
ICAgIGNsayk7CisJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwga2VlbWJheV9w
Y2llX2Rpc2FibGVfY2xvY2ssIGNsayk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIEVSUl9QVFIocmV0
KTsKIAotLSAKMi40MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
