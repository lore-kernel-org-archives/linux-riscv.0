Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C37EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E3QYbsSyIOxsnhktjEqw8b2YeQ8WJw7tpXZ85KQmyrk=; b=iqitiPW9+mlpRo
	H/8XMMy9tfGsMR6BPh0t5pewCVQtkNyw4PfE4Q+MZGN5E1Qrf+K5GL7TKukDR+fCkhqlsHhapqV6X
	H3MCODpO4wC/KDLMBxNwPci+DWMbnBgvOhwwbamcWANvPMq2TufjehbHRx438MEhk7zdgQIMswOLh
	j4k7JrIxNfJ2GVQyf3DqSuLDRgbeRgsnnE7tcx9jIqMgj5Wv5pm4kDGWd+VUDRqAncYGp96Fggrls
	X68/f0W9cThtm2ehCF5OkMgrmIrxXDCWRoLTmaBgeyZjZ6gjOJuiFNXL6sUBbvF0B9Njmpy5FTOHy
	xefQuMfFNMo3q16Bjp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjEX-00HYzP-2B;
	Wed, 23 Aug 2023 08:28:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjEV-00HYyY-0L
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 08:28:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 356716162C;
	Wed, 23 Aug 2023 08:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA90C433C7;
	Wed, 23 Aug 2023 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692779333;
	bh=sgE48NtgP4eQen2ml46+iGXN2pZhCvwsUI3qxh709IA=;
	h=From:To:Cc:Subject:Date:From;
	b=B8XeCEiyNqSPMfc/NUpIMPqso5AROFao4byCojwbb5El1u6vSLFULDLvh/AQ9J9TP
	 xYC4h2NCGDg1FNfUwHHbeRWhOJooIm4+18XN/Zy4G43BH0sr6vXTenjM5wA8rE7Imt
	 fXncqCcjvg9fhu8gG9hy/3DATr+TuHwLPfzJxmsMishCx3lHyZuu/G7OjN1kAw1EHE
	 I+nfxzy/zZ88AweOIeQHsgntA6vUTPBFDsyDnlsAs8aKjWUWAs9Btg8oLiuiahMdG5
	 cqMPbl0IfTurajBVvnWCCPWMFxx/8xrF99N9+NeOfPI7T3Ewe0NH9TNfwt2yCS2bJs
	 PBxkutaUE1+BA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	linux-next@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] riscv: Require FRAME_POINTER for some configurations
Date: Wed, 23 Aug 2023 10:28:45 +0200
Message-Id: <20230823082845.354839-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_012855_189197_74ACE24D 
X-CRM114-Status: GOOD (  10.48  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKU29tZSBWIGNvbmZpZ3Vy
YXRpb25zIGltcGxpY2l0bHkgdHVybiBvbiAnLWZuby1vbWl0LWZyYW1lLXBvaW50ZXInLApidXQg
bGVhdmluZyBGUkFNRV9QT0lOVEVSIGRpc2FibGVkLiBUaGlzIG1ha2VzIGl0IGhhcmQgdG8gcmVh
c29uIGFib3V0CnRoZSBGUkFNRV9QT0lOVEVSIGNvbmZpZywgYW5kIGFsc28gdHJpZ2dlcnMgYnVp
bGQgZmFpbHVyZXMgaW50cm9kdWNlZAppbiBieSB0aGUgY29tbWl0IGluIHRoZSBGaXhlczogdGFn
LgoKU2VsZWN0IEZSQU1FX1BPSU5URVIgZXhwbGljaXRseSBmb3IgdGhlc2UgY29uZmlndXJhdGlv
bnMuCgpGaXhlczogZWJjOWNiMDNiMjFlICgicmlzY3Y6IHN0YWNrOiBGaXh1cCBpbmRlcGVuZGVu
dCBzb2Z0aXJxIHN0YWNrIGZvciBDT05GSUdfRlJBTUVfUE9JTlRFUj1uIikKU2lnbmVkLW9mZi1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvS2Nv
bmZpZyAgfCAxICsKIGFyY2gvcmlzY3YvTWFrZWZpbGUgfCAzIC0tLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggMTBlN2E3YWQxNzVhLi5jZDgwNzVj
MDkyYzMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tj
b25maWcKQEAgLTYyLDYgKzYyLDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IENPTU1PTl9DTEsK
IAlzZWxlY3QgQ1BVX1BNIGlmIENQVV9JRExFIHx8IEhJQkVSTkFUSU9OCiAJc2VsZWN0IEVEQUNf
U1VQUE9SVAorCXNlbGVjdCBGUkFNRV9QT0lOVEVSIGlmIFBFUkZfRVZFTlRTIHx8IChGVU5DVElP
Tl9UUkFDRVIgJiYgIURZTkFNSUNfRlRSQUNFKQogCXNlbGVjdCBHRU5FUklDX0FSQ0hfVE9QT0xP
R1kKIAlzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiAhNjRCSVQKIAlzZWxlY3QgR0VORVJJQ19D
TE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01ha2Vm
aWxlIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQppbmRleCA2ZWM2ZDUyYTQxODAuLjEzMjllMDYwYzU0
OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2L01ha2Vm
aWxlCkBAIC04Nyw5ICs4Nyw2IEBAIGVuZGlmCiBpZmVxICgkKENPTkZJR19DTU9ERUxfTUVEQU5Z
KSx5KQogCUtCVUlMRF9DRkxBR1MgKz0gLW1jbW9kZWw9bWVkYW55CiBlbmRpZgotaWZlcSAoJChD
T05GSUdfUEVSRl9FVkVOVFMpLHkpCi0gICAgICAgIEtCVUlMRF9DRkxBR1MgKz0gLWZuby1vbWl0
LWZyYW1lLXBvaW50ZXIKLWVuZGlmCiAKICMgQXZvaWQgZ2VuZXJhdGluZyAuZWhfZnJhbWUgc2Vj
dGlvbnMuCiBLQlVJTERfQ0ZMQUdTICs9IC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMg
LWZuby11bndpbmQtdGFibGVzCgpiYXNlLWNvbW1pdDogODliZjYyMDljYWQ2NjIxNGQzNzc0ZGFj
ODZiNmJiZjJhZWM2YTMwZAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
