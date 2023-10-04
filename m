Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B714E7B604
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T+6xwXlL/xKcs3ml05PZugs4s8R7Whz0+l44ICk4wjk=; b=K/IrQqT2GH2fFa
	rWf3/d8RFKeFemmIaLazKYEA3YefBs3ivH7hKuzWMKPunDzy0farUkV8nsLGN1wCPV0BxR4cK9/nR
	S/VZcAGda9g8VMYxZ96BrTRomo3EJa3ny5+ieMCG7g2CpkzEQOepea/F5dY2mawU8NJ05h0jgkcL+
	2UY/qBTaEFnTzDOLx9BS8ZU1tGnW4lTjFOxHyySbTZCkAWm4rgf+2Sm44+TicQnM73cjri2E4eZ6e
	8EF3ehB4W6DIjHCt0GWpRx6IFZntfPQlDz7ow4hNCo+FcMB3AgsHint2e7v7JTc5VSNmuiHZuqZex
	L8/p7UH8o/vjJ2WQyDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0yQ-00Hb6u-35;
	Wed, 04 Oct 2023 12:27:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0yO-00Hb5T-1F
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:27:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBF2661453;
	Wed,  4 Oct 2023 12:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75416C433C8;
	Wed,  4 Oct 2023 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422446;
	bh=RkzvF8X+SXDFLfFH4P6mrq7fuBmqThHF3EmjygH38s8=;
	h=From:To:Cc:Subject:Date:From;
	b=tCdbg9GWUdthDNNxMYvE7a+R5KpNE1fdxO3rcSy3ibki5AKOYZ0Lt/gpZ/20g5Mvk
	 ytPpLV7Uoxx9ug7IpnI9UHmzf1dbPyMJaPvem9GjgK/Lg5FJavmEJxeNjtntr0Uqm/
	 ZflKPumsYQ2Ny/9BxNVQnztfvrAjTsjY+seWYkQy6eyBejCB/rvkTZJAeSzNdEYN6Q
	 Lm9LaMzQCEXoIl9vRKZQC+eM9ni2Qsxc52jMxDVyfUnKf7p4JTjMwqgUKg9E+V/ojh
	 zFFI6IbCR+wnvjbirjdr5WVioLGtQ8F1zSp1I0Jy+oS2R/2wwjvOAiz3L4l/L1xvE6
	 1nLMCm9DXFZKA==
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
Subject: [PATCH bpf-next 0/3] selftest/bpf, riscv: Improved cross-building support
Date: Wed,  4 Oct 2023 14:27:18 +0200
Message-Id: <20231004122721.54525-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_052728_466990_D8C253D3 
X-CRM114-Status: UNSURE (   5.25  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKWWV0IGFub3RoZXIgIm1v
cmUgY3Jvc3MtYnVpbGRpbmcgc3VwcG9ydCBmb3IgUklTQy1WIiBzZXJpZXMuCgpBbiBleGFtcGxl
IGhvdyB0byBpbnZva2UgYSBnZW5fdGFyIGJ1aWxkOgoKICB8IG1ha2UgQVJDSD1yaXNjdiBDUk9T
U19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSBDQz1yaXNjdjY0LWxpbnV4LWdudS1nY2MgXAog
IHwgICAgSE9TVENDPWdjYyBPPS93b3Jrc3BhY2Uva2J1aWxkIEZPUk1BVD0gXAogIHwgICAgU0tJ
UF9UQVJHRVRTPSJhcm02NCBpYTY0IHBvd2VycGMgc3BhcmM2NCB4ODYgc2d4IiAtaiAkKCgkKG5w
cm9jKS0xKSkgXAogIHwgICAgLUMgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMgZ2VuX3RhcgoKCkJq
w7ZybgoKQmrDtnJuIFTDtnBlbCAoMyk6CiAgc2VsZnRlc3RzL2JwZjogQWRkIGNyb3NzLWJ1aWxk
IHN1cHBvcnQgZm9yIHVyYW5kb21fcmVhZCBldCBhbAogIHNlbGZ0ZXN0cy9icGY6IEVuYWJsZSBs
bGQgdXNhZ2UgZm9yIFJJU0MtVgogIHNlbGZ0ZXN0cy9icGY6IEFkZCB1cHJvYmVfbXVsdGkgdG8g
Z2VuX3RhciB0YXJnZXQKCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgfCA4
ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKCmJhc2UtY29tbWl0OiAyMTQ3YzhkMDdlMWFiYzhkZmMzNDMzY2ExOGVlZDUyOTVlMjMwZWRl
Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
