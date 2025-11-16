Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE54CEACEF
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2+DlglPeCGpdqGP4tf8HT4NTbsRJ3yrlXuYceImbd8=; b=1nbKRkT66v3VRG
	tc2NKDW5FbFEksj5q/1dLZ7LXNqvy+AqCyz5H54THNtt1uknhi6Re7NXuI24MqRz+6l0/4MkfOY+X
	q5eo3S9AATcTO9wIcr3a02aXFU1nhhA3ozNPIezoBjOgHSFSl3FPq07DpY7/aovoUUQ/+By/Kwhy7
	0iWqvJLG7zzSCLJGJnI/ukTS2XtlBsAitPq5CMXGZKJchgnbZJcXbHaIVQb6u4VSguYWnwuqun/o0
	nqLUBgh9jEWhHHDjfJ7ddR22WofZIKY+wk7IxtNl6ToTGrU3BHtU9cMjVMF7nBEUl5ifbS8Y6VlKT
	5NJI6Tc7wICSpl1BPOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcgj-0000000EfC1-1Ulg;
	Sun, 16 Nov 2025 13:21:05 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcgf-0000000Ef7U-16L2;
	Sun, 16 Nov 2025 13:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xsxQS9uMu2ulj3kK3D36meG/HO1FCmilYNNF+TdhSOQ=; b=6UChbVw/2lffs3K5mwy8WYcLGi
	wNl/qURRl8EbLMAI/i5XS1UDgfWHXCUZ7Nz1BP64h33job7MvPEMxBJWywI6M75zO1XIGP6tn1Baf
	gJGBaihergzZC6S36FtLnHtMfO4kL05mPnMDLIFMrk43xqOciQvvzpmLP4IU6w3Rdx+bt82iG+6e8
	hRHiBZ+tG+Cj17f8hujzG75TaqDRnwDFEv2qcjrhzVUFmbfMuBzhGfRR54oW5cVlKEYN9Y+9IgkWl
	Ry37Ztct/zRFsc9LgBEwkM4RNhwXlKB1MLL9TRjxEi4tAim5STcMY5mIIlej1GYHW/vCtW+elUXJv
	OSnHWg1g==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKcga-0000000FW4E-0cRY;
	Sun, 16 Nov 2025 14:20:56 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v2 3/6] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Date: Sun, 16 Nov 2025 14:18:50 +0100
Message-Id: <20251116131853.440863-4-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116131853.440863-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116131853.440863-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052101_465063_3A8F30B3 
X-CRM114-Status: GOOD (  11.56  )
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

VGhlIEFsbHdpbm5lciBEMXMvVDExMyBuZWVkcyB0byB1c2UgdGhlIGNvbWJvIEQtUEhZIHRvIGVu
YWJsZSBMVkRTCm91dHB1dC4KCkVuYWJsZSBMVkRTIHN1cHBvcnQgaW4gdGhlIFRDT04gYW5kIGNv
bmZpZ3VyZSBpdCB1c2luZyB0aGUgUEhZLgoKQWJvcnQgUEhZIHNldHVwL3RlYXJkb3duIGVhcmx5
IGlmIGl0IGZhaWxzLgoKU2lnbmVkLW9mZi1ieTogS3ViYSBTemN6b2RyennFhHNraSA8a3ViYUBz
emN6b2Ryenluc2tpLnBsPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMg
fCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rj
b24uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKaW5kZXggMjQ3NDAwNzg1
Li5lMDcyZWNjNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29u
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwpAQCAtMTcxLDYgKzE3
MSw0MCBAQCBzdGF0aWMgdm9pZCBzdW42aV90Y29uX3NldHVwX2x2ZHNfcGh5KHN0cnVjdCBzdW40
aV90Y29uICp0Y29uLAogCQkJICBTVU42SV9UQ09OMF9MVkRTX0FOQTBfRU5fRFJWRCh2YWwpKTsK
IH0KIAorc3RhdGljIHZvaWQgc3VuMjBpX3Rjb25fc2V0dXBfbHZkc19kcGh5KHN0cnVjdCBzdW40
aV90Y29uICp0Y29uLAorCQkJCQljb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCit7
CisJdW5pb24gcGh5X2NvbmZpZ3VyZV9vcHRzIG9wdHMgPSB7IH07CisKKwlpZiAoIXRjb24tPnF1
aXJrcy0+aGFzX2NvbWJvX2RwaHkgfHwgIXRjb24tPmRwaHkpCisJCXJldHVybjsKKworCWlmIChw
aHlfaW5pdCh0Y29uLT5kcGh5KSkKKwkJcmV0dXJuOworCisJaWYgKHBoeV9zZXRfbW9kZSh0Y29u
LT5kcGh5LCBQSFlfTU9ERV9MVkRTKSkKKwkJcmV0dXJuOworCisJaWYgKHBoeV9jb25maWd1cmUo
dGNvbi0+ZHBoeSwgJm9wdHMpKQorCQlyZXR1cm47CisKKwlpZiAocGh5X3Bvd2VyX29uKHRjb24t
PmRwaHkpKQorCQlyZXR1cm47Cit9CisKK3N0YXRpYyB2b2lkIHN1bjIwaV90Y29uX3RlYXJkb3du
X2x2ZHNfZHBoeShzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKKwkJCQkJICBjb25zdCBzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIpCit7CisJaWYgKCF0Y29uLT5xdWlya3MtPmhhc19jb21ib19k
cGh5IHx8ICF0Y29uLT5kcGh5KQorCQlyZXR1cm47CisKKwlpZiAocGh5X3Bvd2VyX29mZih0Y29u
LT5kcGh5KSkKKwkJcmV0dXJuOworCisJaWYgKHBoeV9leGl0KHRjb24tPmRwaHkpKQorCQlyZXR1
cm47Cit9CisKIHN0YXRpYyB2b2lkIHN1bjRpX3Rjb25fbHZkc19zZXRfc3RhdHVzKHN0cnVjdCBz
dW40aV90Y29uICp0Y29uLAogCQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIsCiAJCQkJICAgICAgIGJvb2wgZW5hYmxlZCkKQEAgLTE1NTAsOCArMTU4NCwxMiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHN1bjRpX3Rjb25fcXVpcmtzIHN1bjlpX2E4MF90Y29uX3R2X3F1
aXJrcyA9IHsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40aV90Y29uX3F1aXJrcyBzdW4yMGlf
ZDFfbGNkX3F1aXJrcyA9IHsKIAkuaGFzX2NoYW5uZWxfMAkJPSB0cnVlLAorCS5oYXNfY29tYm9f
ZHBoeQkJPSB0cnVlLAorCS5zdXBwb3J0c19sdmRzCQk9IHRydWUsCiAJLmRjbGtfbWluX2RpdgkJ
PSAxLAogCS5zZXRfbXV4CQk9IHN1bjhpX3I0MF90Y29uX3R2X3NldF9tdXgsCisJLnNldHVwX2x2
ZHNfcGh5CQk9IHN1bjIwaV90Y29uX3NldHVwX2x2ZHNfZHBoeSwKKwkudGVhcmRvd25fbHZkc19w
aHkJPSBzdW4yMGlfdGNvbl90ZWFyZG93bl9sdmRzX2RwaHksCiB9OwogCiAvKiBzdW40aV9kcnYg
dXNlcyB0aGlzIGxpc3QgdG8gY2hlY2sgaWYgYSBkZXZpY2Ugbm9kZSBpcyBhIFRDT04gKi8KLS0g
CjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
