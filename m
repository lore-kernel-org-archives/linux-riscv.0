Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0CEC3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i7KuPFbXt5Gceu9HFTjFUI4yrpkYOMK1Rh8TzWBibCQ=; b=LX+gZRqIFnxttz
	1u3UeaUJVzLhVJhK3l0Uza+iqv9HYE2IZBL5+rB2fMs4npPNKxAKYtFcno89H+iqDFOoOnukO+IFM
	mLGHV8mWoBoPWlkVTIJjjK1+OTsaAV3qltlSC1DxsgLMn/oc9WdPbPll43/+OKLzzsqHZbWpLbN3Z
	uJiWXVQunu1dgPYyy1aMM4OcQLJlcVzmVfz+zZr3dESXy48nVplI7ljh8FWPFOUtGNVL4ni9X2yMB
	ICXWCKD+h7jOcpQ7ONnCjesgS+QwnHbaRJoTUDM1WgZ4TFCvMV/WzZs1H4/8ELGRH3b/7xE0mzkFX
	ufxtDVAvIA3NlLOzWvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDZF-00000007uLR-0Dhh;
	Tue, 09 Jul 2024 16:19:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDZD-00000007uKb-08el
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 16:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A821614B3;
	Tue,  9 Jul 2024 16:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D030C32786;
	Tue,  9 Jul 2024 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541985;
	bh=xQ+k+zt3rSJvrwI1kO05fsSZ6yXFCul+pYXVqgNcdwI=;
	h=From:To:Cc:Subject:Date:From;
	b=Reahh9T9SgtFgoASAQ6WLIjFl+HaVAU8+qtVT+gq/QlE0L8FovbFiTmKyMA1N4t89
	 fTAoBEpk2l1JEkFi66Wee248xXZxXRwQi7vsRGADj/dg7nv+m1A/Dj3igIlIuqrE/F
	 TGYhGW6LPIQpdAnB6C36z0HdXPych59QefiEjWrYfgehUJwjwH3690hl7dZjjqShj4
	 u9Lr2Y3O7uEvzl2JQS7fm/cRTiC0YheKldiBJ8PP5II6dv2d72hVg/MNdqkMEQoYKR
	 nnqhKumiZS5q4NLpM+fjNlLORJfQojE6hjYVRCuXDtWo6l6ztf2jI6XXtrI3yniUxx
	 s4mgzfLiU8GXA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: select ARCH_USE_SYM_ANNOTATIONS
Date: Wed, 10 Jul 2024 00:05:20 +0800
Message-ID: <20240709160536.3690-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_091947_131406_A4F08D0C 
X-CRM114-Status: UNSURE (   7.57  )
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

Y29tbWl0IDc2MzI5YzY5MzkyNCAoInJpc2N2OiBVc2UgU1lNXyooKSBhc3NlbWJseSBtYWNyb3Mg
aW5zdGVhZApvZiBkZXByZWNhdGVkIG9uZXMiKSwgbW9zdCByaXNjdiBoYXMgYmVlbiB0byBjb252
ZXJ0ZWQgdGhlIG5ldyBzdHlsZQpTWU1fIGFzc2VtYmxlciBhbm5vdGF0aW9ucy4gVGhlIHJlbWFp
bmluZyBvbmUgaXMgc2lmaXZlJ3MKZXJyYXRhX2NpcF80NTMuUywgc28gY29udmVydCB0byBuZXcg
c3R5bGUgU1lNXyBhbm5vdGF0aW9ucyBhcyB3ZWxsLgpBZnRlciB0aGF0IHNlbGVjdCBBUkNIX1VT
RV9TWU1fQU5OT1RBVElPTlMuCgoKU2luY2UgdjE6CiAgLSBhZGQgbmV3IHBhdGNoIHRvIGNvbnZl
cnQgc2lmaXZlJ3MgZXJyYXRhX2NpcF80NTMuUywgdGhhbmsgQ2zDqW1lbnQKICAtIHVwZGF0ZSBw
YXRjaDIgY29tbWl0IG1zZwoKSmlzaGVuZyBaaGFuZyAoMik6CiAgcmlzY3Y6IGVycmF0YTogc2lm
aXZlOiBVc2UgU1lNXyooKSBhc3NlbWJseSBtYWNyb3MKICByaXNjdjogc2VsZWN0IEFSQ0hfVVNF
X1NZTV9BTk5PVEFUSU9OUwoKIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSArCiBhcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhX2NpcF80NTMuUyB8IDgg
KysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
