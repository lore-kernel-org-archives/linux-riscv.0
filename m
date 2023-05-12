Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D229BC7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+/Nxq4flHPkpmJLOBkq+gR4xlWaDmYX3NXHP9DPJ5A=; b=UHNfvp3d7JobCI
	ZfP4uX8FMMtajY1J2/S0YLjXkR3NRrs/AwRyyGbvpgMdEgX1DY5X1VmMX65UIRNoCz0r8hjCOysEp
	qNHzaEjBVx2OIEohO656WJIh/utzjaqnvw1X2v+qlb6FPGr4ZFShNgKj3Zs+BiJRZvaewXKtDg6Tg
	Dd4Rwa9j/lMZ9G5NDnvhr0EzAmbMW9b3mZzVHiN7qVnWPebnAWpx6pxDkXV3onyW3MQDGtNqIpHuR
	lLu5G9WIJ1hCgPzF2o0b1nBpX6EisR+bFNNNYy5lBXFUCHBD2jQsaYCffqKkVEeiUioj5LCU3jEgC
	yXzfN46fdBcx1nRUXuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDn-00CG26-2g;
	Fri, 12 May 2023 14:58:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUDk-00CFzd-2S
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 14:58:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 573A061137;
	Fri, 12 May 2023 14:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5593AC4339E;
	Fri, 12 May 2023 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683903492;
	bh=Pna6hgXZPMsGHenSDkIIzlTOUDQrq5sDRKKv7+K0xpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQzflYqn6X1XwTYqDskdaUvkozpqmlKiTZ7sJZMcSXHaRn188NF1w4O4Gcg9IS09k
	 oKwEhmh46ngeDtbZCpX71wFNrPl+kK3Y4p+ewFov1/UkgDjuFqVOTty0tiMMSElTNb
	 yMuyw+QZmlU6JyZOeqC3QUttWJyV6GkHm73I62awiyhzXWWbPf3Lm1PjNuZoNrq0QB
	 VApf+wgzHLHZ2xAEvvSCNJwzRHGvl/v5NT9pDPzmfOPYPJjDHZOW346ZF/PUDBnppQ
	 xqqHnvoiJdxwAchWZf8t4aSIlDXEgYY06mtzf3klWqYHbjBSQG5Jhc3+1nVtzW5hkE
	 X+9KbCvtUB98A==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	virtualization@lists.linux-foundation.org,
	linux@rivosinc.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 5/7] riscv: Enable memory hot add/remove arch kbuild support
Date: Fri, 12 May 2023 16:57:35 +0200
Message-Id: <20230512145737.985671-6-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512145737.985671-1-bjorn@kernel.org>
References: <20230512145737.985671-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_075812_835849_4D683CCA 
X-CRM114-Status: UNSURE (   9.23  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKRW5hYmxlIEFSQ0hfRU5B
QkxFX01FTU9SWV9IT1RQTFVHIGFuZCBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFIGZvcgpS
SVNDLVYuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
Ci0tLQogYXJjaC9yaXNjdi9LY29uZmlnIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwppbmRleCAzNDhjMGZhMWZjOGMuLjgxYjNmMTg4ZjM5NiAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTQsNiArMTQsOCBAQCBj
b25maWcgUklTQ1YKIAlkZWZfYm9vbCB5CiAJc2VsZWN0IEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJF
TlQKIAlzZWxlY3QgQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OIGlmIEhVR0VUTEJfUEFH
RSAmJiBNSUdSQVRJT04KKwlzZWxlY3QgQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFBMVUcgaWYgU1BB
UlNFTUVNICYmIDY0QklUICYmIE1NVQorCXNlbGVjdCBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVN
T1ZFIGlmIFNQQVJTRU1FTSAmJiA2NEJJVCAmJiBNTVUKIAlzZWxlY3QgQVJDSF9FTkFCTEVfU1BM
SVRfUE1EX1BUTE9DSyBpZiBQR1RBQkxFX0xFVkVMUyA+IDIKIAlzZWxlY3QgQVJDSF9FTkFCTEVf
VEhQX01JR1JBVElPTiBpZiBUUkFOU1BBUkVOVF9IVUdFUEFHRQogCXNlbGVjdCBBUkNIX0hBU19C
SU5GTVRfRkxBVAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
