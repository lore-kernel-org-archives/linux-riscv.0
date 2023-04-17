Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94723C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9B1spEIn1RgvlvS5f9i99FBXxWFrq/+HqtNCu75Ov/Y=; b=NVpiIp8KATciix
	nAvrrMa/pTbJMENXzJQV75VPkHuJZTs7aYGmrWxRmRoYhpi82rYSPs9hZCigM9uoot/8kpCjbZCGI
	nuM0bZQbd/JeYsEmSofBM4tY71OIcqtyB/vi+JNhRv531dOxhTN4N5+qfuKbH9VO/+vULTcHfLUfp
	BII7NqauI024WUIaXkT0a1sn437/WCCqR3ri0vp7PXcmHkIT/BOrW5j4Y5EuL4BK6yFPUatgD4pVr
	GjtJ6s6gf1lkFmPqK0nP+FFPACtYhzOd6MWb8BbqhQ9i1Wqtbj6zdrka4gxuiA0eNRWo0ob0nK73o
	M5bFM1OgVBHshI9+QxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIk-00GzAS-2k;
	Mon, 17 Apr 2023 16:01:58 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIb-00Gz58-32
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:01:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1681747302;
	bh=/tBIqb3YiZRud1yDXqeDbEhl0GcdVbv2DqKYt4+iwGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nl94KQlg1GxjCKOnf3UNM2jbbKw3sUtF6qW5kFgadFHgqlsy9AH06gsgaZ0sixF+I
	 6A+a9ZSnWL7U5mecK+r2wOoL137aNZ6sPxhhFrRaj1nRsNTnKlwhOdGG2lL8W6CIlY
	 Qf63zPue1aDtonPgAADlS5vgM7meZRkNFoCwZVRE=
Date: Mon, 17 Apr 2023 18:01:35 +0200
Subject: [PATCH 5/6] tools/nolibc: loongarch: add stackprotector support
MIME-Version: 1.0
Message-Id: <20230408-nolibc-stackprotector-archs-v1-5-271f5c859c71@weissschuh.net>
References: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
In-Reply-To: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681747300; l=2073;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=/tBIqb3YiZRud1yDXqeDbEhl0GcdVbv2DqKYt4+iwGU=;
 b=vUkGNETLBzKth36N1KX6EIz8V04NLKaAwiZOLdqvzTD05bUymN/ILZN3wB9aRQjizoh52oWpG
 Vtj14M8jfS4CD9pYv6bBtf3wqMtw00w0vxjbDA5lpeOdzykdGs/JFx9
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090150_132102_2C6DF733 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0Pgot
LS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtbG9vbmdhcmNoLmggICB8IDcgKysrKysrLQog
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2luY2x1ZGUvbm9saWJjL2FyY2gtbG9vbmdhcmNoLmggYi90b29scy9pbmNsdWRlL25vbGliYy9h
cmNoLWxvb25nYXJjaC5oCmluZGV4IGVjM2I0NmE5OTFhOS4uMDdlM2IxZmQ3MjYyIDEwMDY0NAot
LS0gYS90b29scy9pbmNsdWRlL25vbGliYy9hcmNoLWxvb25nYXJjaC5oCisrKyBiL3Rvb2xzL2lu
Y2x1ZGUvbm9saWJjL2FyY2gtbG9vbmdhcmNoLmgKQEAgLTE0OSw2ICsxNDksOCBAQAogY2hhciAq
KmVudmlyb24gX19hdHRyaWJ1dGVfXygod2VhaykpOwogY29uc3QgdW5zaWduZWQgbG9uZyAqX2F1
eHYgX19hdHRyaWJ1dGVfXygod2VhaykpOwogCisjZGVmaW5lIF9fQVJDSF9TVVBQT1JUU19TVEFD
S19QUk9URUNUT1IKKwogI2lmIF9fbG9vbmdhcmNoX2dybGVuID09IDMyCiAjZGVmaW5lIExPTkdM
T0cgICAgICAiMiIKICNkZWZpbmUgU1pSRUcgICAgICAgICI0IgpAQCAtMTcwLDkgKzE3MiwxMiBA
QCBjb25zdCB1bnNpZ25lZCBsb25nICpfYXV4diBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7CiAjZW5k
aWYKIAogLyogc3RhcnR1cCBjb2RlICovCi12b2lkIF9fYXR0cmlidXRlX18oKHdlYWssbm9yZXR1
cm4sb3B0aW1pemUoIm9taXQtZnJhbWUtcG9pbnRlciIpKSkgX3N0YXJ0KHZvaWQpCit2b2lkIF9f
YXR0cmlidXRlX18oKHdlYWssbm9yZXR1cm4sb3B0aW1pemUoIm9taXQtZnJhbWUtcG9pbnRlciIp
LG5vX3N0YWNrX3Byb3RlY3RvcikpIF9zdGFydCh2b2lkKQogewogCV9fYXNtX18gdm9sYXRpbGUg
KAorI2lmZGVmIE5PTElCQ19TVEFDS1BST1RFQ1RPUgorCQkiYmwgX19zdGFja19jaGtfaW5pdFxu
IiAgICAgICAgICAgICAgIC8qIGluaXRpYWxpemUgc3RhY2sgcHJvdGVjdG9yICAgICAgICAgICAg
ICAgICAgICAgICAgICAqLworI2VuZGlmCiAJCVJFR19MICAgICAgICAiICRhMCwgJHNwLCAwXG4i
ICAgICAgICAgLyogYXJnYyAoYTApIHdhcyBpbiB0aGUgc3RhY2sgICAgICAgICAgICAgICAgICAg
ICAgICAgICovCiAJCUxPTkdfQURESSAgICAiICRhMSwgJHNwLCAiU1pSRUciXG4iICAgLyogYXJn
diAoYTEpID0gc3AgKyBTWlJFRyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCiAJCUxP
TkdfU0xMICAgICAiICRhMiwgJGEwLCAiTE9OR0xPRyJcbiIgLyogZW52cCAoYTIpID0gU1pSRUcq
YXJnYyAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICovCmRpZmYgLS1naXQgYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9ub2xpYmMvTWFrZWZpbGUKaW5kZXggOGZlZmZjNzkwYTMxLi5lZmE3YTUxZTBmY2QgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQorKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUKQEAgLTg1LDYgKzg1LDcgQEAgQ0ZM
QUdTX1NUS1BfeDg2ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfU1RLUF9hcm02
NCA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQogQ0ZMQUdTX1NUS1BfYXJtID0gJChDRkxBR1Nf
U1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfU1RLUF9yaXNjdiA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVD
VE9SKQorQ0ZMQUdTX1NUS1BfbG9vbmdhcmNoID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBD
RkxBR1NfczM5MCA9IC1tNjQKIENGTEFHUyAgPz0gLU9zIC1mbm8taWRlbnQgLWZuby1hc3luY2hy
b25vdXMtdW53aW5kLXRhYmxlcyAtc3RkPWM4OSBcCiAJCSQoY2FsbCBjYy1vcHRpb24sLWZuby1z
dGFjay1wcm90ZWN0b3IpIFwKCi0tIAoyLjQwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
