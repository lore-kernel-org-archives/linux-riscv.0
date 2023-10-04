Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C8EE7B604
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkCLUbxTLlepfX8eANIPAlIv68CK2KZ3CtNVDsliO7I=; b=sRng2UjMYrxEMK
	unHiryCXxVMpEruDETyDWF6vFx1zll/96MVfz4zx99Qw+X/QjRvA5fEMd5AG/csaE903qfWzKVJAy
	Zxcewhn3OatwZt1biH6yWEYBEb2NaNNhBlu8VB2B8RNAKaGDrj/DG8FZHe1BNh49b9iqsMWwo/0kB
	AccZKLvul2WC2Yrg97RZTmHm1EjH0Osb36geqpcyx/E+FrfqdJpucvWowkVB1pZYtbnGZfTcolkw9
	BvXHfeNTGCyM3pPfo5K+tk2IoWQPCu7T5oxbNUkt8vzGmeob3+XRTqYA1D3zxhRMNpQfw0+EiFDOf
	oVA5qT5omdebecaW6NNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0yZ-0000BO-1a;
	Wed, 04 Oct 2023 12:27:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0yT-00005Z-2x
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:27:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7F780B81DE1;
	Wed,  4 Oct 2023 12:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9CBC433C8;
	Wed,  4 Oct 2023 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422451;
	bh=ijfr6HFXllf/luvFREpH5FQI3TulGFgVtkvmLdbFv64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScLODdL0FrTl5WcI4ZFVzGB/3dhIzfv39c91kHKpMnyUpcbtbtAicWM3hO66nM6Jb
	 bVGqwF21qcWd+bm1lueR+jBY8wwIWKYNoYTYcMV5uUX7HMo0X13sbX81fvHZnopNo5
	 1Rs4OiEOAF+6PrpMN19sAkF6KeNRClItyAajXK9P4zN5/jtP0FFPT0NH8sVkCsO0IR
	 As5LUiW+61xLkD2OZ1LrQPGhaRqCIxEKNQFMrM9rKHv0Zp81Ws7ZX1n+IbeEys5JI1
	 MRPxVyJR7R7Nz6m5m+bZ3h1RwL7RYNlZzN2W5NJaI3R9hQmaMf1Ni4HoZgRsQyAp7L
	 AZQTBqgRtdMfQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next 2/3] selftests/bpf: Enable lld usage for RISC-V
Date: Wed,  4 Oct 2023 14:27:20 +0200
Message-Id: <20231004122721.54525-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004122721.54525-1-bjorn@kernel.org>
References: <20231004122721.54525-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_052734_112810_3D39185F 
X-CRM114-Status: UNSURE (   8.97  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUklTQy1WIGhhcyBwcm9w
ZXIgbGxkIHN1cHBvcnQuIFVzZSB0aGF0LCBzaW1pbGFyIHRvIHdoYXQgeDg2IGRvZXMsIGZvcgp1
cmFuZG9tX3JlYWQgZXQgYWwuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCmluZGV4IGE5Y2JiODVmYTE4MC4uMDk4ZTMyYzY4
NGQ1IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCkBAIC0xODgsNyArMTg4LDcg
QEAgJChPVVRQVVQpLyU6JS5jCiAJJChRKSQoTElOSy5jKSAkXiAkKExETElCUykgLW8gJEAKIAog
IyBMTFZNJ3MgbGQubGxkIGRvZXNuJ3Qgc3VwcG9ydCBhbGwgdGhlIGFyY2hpdGVjdHVyZXMsIHNv
IHVzZSBpdCBvbmx5IG9uIHg4NgotaWZlcSAoJChTUkNBUkNIKSx4ODYpCitpZmVxICgkKFNSQ0FS
Q0gpLCQoZmlsdGVyICQoU1JDQVJDSCkseDg2IHJpc2N2KSkKIExMRCA6PSBsbGQKIGVsc2UKIExM
RCA6PSBsZAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
