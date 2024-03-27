Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08143C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FBJfB+tVu92e0jIjH1qcqhTkbSEH4Yc3l1t5a6F7H38=; b=aikTSKJIGlgeOD
	FYJButIVvjWTPIZP1UUWS7aizThWXYuzAEq03lTqYFZfPber+MlLK5Kj2+x9hlUV+K325kbl2bMik
	kHxIXlWo0tXn+zmuW2UisJs9QEPlKiDI9GRrs/ZVzz/iWpR+0Ge1wW1RWm/Jnnha9euFq673k695u
	+ed/Yox4gLCwLS9cLRz9N6NRdURot6okWE+08xD8hWQaqP6tEEh8gnJC0gfk9Xr8FI2WJ+lpBb1j9
	wzcAs67N9R7kX/ZPrur4dKWuc4jMCmiYU1B3ylau3VWiPNrX0QDE1ZDr1Mtina+wxU1e1pHX4tXKM
	RaA6klQUhqzbFQvcIbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSL6-00000008qS4-37bl;
	Wed, 27 Mar 2024 12:25:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSL2-00000008qOr-3CfV
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D46BCE25AC;
	Wed, 27 Mar 2024 12:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D34C43394;
	Wed, 27 Mar 2024 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542302;
	bh=nfNNpFSFPqJ1Ehbsb1fl0Q/VVJfGQElQungtP6fuOkk=;
	h=From:To:Cc:Subject:Date:From;
	b=ol+I2iv0lr7+a9a1r1NdynkdAVbEbq7v2cv7OunAma3r2E1a8ptexTRNghr4VqKBW
	 6coUILJNG+8O+uHYWFEzPJFOqGEu3Gz87kBkoGmvXL1o1qd00atBohVXL0b+lQPd8w
	 uVn/sNtRQCbME8jFS4544mJ8YTDfupv/Thj3nJ78xowKH1LsRapilfzw3oz2ZiZ730
	 eyDiIaEqTzs8svfa0E3P2VTJDQscIbcYzCSLP+DRt2YSuM68R++AxnfFpynR9GnISa
	 spJ1laf9VkqX4pm5fFB3Uj9kGlpWi+1nLnSfq2MQyLiJ7FDCc2YSXilkYQvANcW7Z/
	 Odq8suEHEYayg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v1 0/5] BeagleV Fire support
Date: Wed, 27 Mar 2024 12:24:35 +0000
Message-ID: <20240327-parkway-dodgy-f0fe1fa20892@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RI2m5bHQsW0uJCHnU/tjkVOqc52vi6o5eCDYaLCFLpw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGksAqydJlvmL/rdPvF5qY6d1bHNnT/6FuZX9rq6Zp5/P +1AQurHjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEUZbhn9rSW5dYTA+mmFx7 mSIiMum2am/pgt+e95okjE5ffn8tnY/hr1ACk/aj0pt7n37zyt0kenqbtXTPx0vbtmZP8c402LK 8jgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_052505_432808_E1EB9A3B 
X-CRM114-Status: GOOD (  14.07  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCllvLAoKV2Vl
IHNlcmllcyBhZGRpbmcgc3VwcG9ydCBmb3IgdGhlIEJlYWdsZVYgRmlyZS4gSSd2ZSBoYWQgYSBk
dHMgc2l0dGluZwpsb2NhbGx5IGZvciB0aGlzIGZvciBvdmVyIGEgeWVhciBmb3IgdGVzdGluZyBB
dXRvIFVwZGF0ZSBhbmQgSSBtZWFudCB0bwpzdWJtaXQgc29tZXRoaW5nIHRvIG1haW5saW5lIG9u
Y2UgdGhlIGJvYXJkIGdvdCBhbm5vdW5jZWQgcHVibGljbHksIGJ1dApvbmx5IGdvdCBhcm91bmQg
dG8gdGhhdCBub3cuCgpUaGUgUENJIGNvbnRyb2xsZXIgaGFzIHRvIHN0YXkgZGlzYWJsZWQgZm9y
IG5vdywgdGhlIGRyaXZlciAoYW5kCmJpbmRpbmcpIG1hZGUgYW4gYXNzdW1wdGlvbiBhYm91dCB3
aGljaCBvZiB0aGUgdHdvIHJvb3QgcG9ydCAiaW5zdGFuY2VzIgp3b3VsZCBiZSB1c2VkIGJ5IExp
bnV4IGFuZCB0aGUgQmVhZ2xlViBGaXJlIHVzZXMgdGhlIG90aGVyIG9uZS4gSSd2ZSBnb3QKYSBX
SVAgcGF0Y2ggZm9yIHRoYXQgaW4gdGhlIHdvcmtzIGFuZCBhIHBhdGNoc2V0IGZvciB0aGUgR1BJ
TyBjb250cm9sbGVyCnRoYXQgSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIGZpbmQgc29tZSB0aW1lIHRv
IGNsZWFuIHVwIGFuZCBzdWJtaXQuCgpUaGFua3MsCkNvbm9yLgoKQ0M6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CkNDOiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNu
YW1hcmFAbWljcm9jaGlwLmNvbT4KQ0M6IEphbWllIEdpYmJvbnMgPGphbWllLmdpYmJvbnNAbWlj
cm9jaGlwLmNvbT4KQ0M6IFZhbGVudGluYSBGZXJuYW5kZXogPHZhbGVudGluYS5mZXJuYW5kZXph
bGFuaXNAbWljcm9jaGlwLmNvbT4KQ0M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KQ0M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+CkNDOiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDQzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPgpDQzogTG9yZW56byBQaWVyYWxpc2kgPGxwaWVy
YWxpc2lAa2VybmVsLm9yZz4KQ0M6ICJLcnp5c3p0b2YgV2lsY3p5xYRza2kiIDxrd0BsaW51eC5j
b20+CkNDOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpDQzogbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDQzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcKQ0M6
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnCkNDOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCgpDb25vciBEb29sZXkgKDIpOgogIGR0
LWJpbmRpbmdzOiByaXNjdjogbWljcm9jaGlwOiBkb2N1bWVudCBiZWFnbGV2LWZpcmUKICByaXNj
djogZHRzOiBtaWNyb2NoaXA6IGFkZCBhbiBpbml0aWFsIGRldmljZXRyZWUgZm9yIHRoZSBCZWFn
bGVWIEZpcmUKCkphbWllIEdpYmJvbnMgKDIpOgogIGR0LWJpbmRpbmdzOiBncGlvOiBtcGZzOiBh
ZGQgY29yZUdQSU8gc3VwcG9ydAogIGR0LWJpbmRpbmdzOiBncGlvOiBtcGZzOiBhbGxvdyBncGlv
LWxpbmUtbmFtZXMKClZhbGVudGluYSBGZXJuYW5kZXogKDEpOgogIGR0LWJpbmRpbmdzOiBQQ0k6
IG1pY3JvY2hpcDogaW5jcmVhc2UgbnVtYmVyIG9mIGl0ZW1zIGluIHJhbmdlcwogICAgcHJvcGVy
dHkKCiAuLi4vYmluZGluZ3MvZ3Bpby9taWNyb2NoaXAsbXBmcy1ncGlvLnlhbWwgICAgfCAgMTcg
Ky0KIC4uLi9iaW5kaW5ncy9wY2kvbWljcm9jaGlwLHBjaWUtaG9zdC55YW1sICAgICB8ICAgMyAr
LQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvbWljcm9jaGlwLnlhbWwgIHwgICAxICsK
IGFyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL01ha2VmaWxlICAgICAgICB8ICAgMSArCiAu
Li4vbWljcm9jaGlwL21wZnMtYmVhZ2xldi1maXJlLWZhYnJpYy5kdHNpICAgfCAxMjQgKysrKysr
KysrKwogLi4uL2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLWJlYWdsZXYtZmlyZS5kdHMgIHwgMjIz
ICsrKysrKysrKysrKysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCAzNjUgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL21p
Y3JvY2hpcC9tcGZzLWJlYWdsZXYtZmlyZS1mYWJyaWMuZHRzaQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21wZnMtYmVhZ2xldi1maXJlLmR0cwoKLS0g
CjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
