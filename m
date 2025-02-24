Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862FAC021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvL+WJsEKg3dFuyt7ik4EJ8kAHgJHvbeKkMKnXL5ln0=; b=y0GiIVqWpbiflX
	m8aJFtWbBrCo2HPLnbpP9dv+tgl4/LVyqFFsg5UjcKOirI4/dBxdV1delCei7reYvlmyVQHjNCnM3
	BMpGsc1GJx/xPJ50gYBhoxpzQk0bUo9uQ36REXlrG0c2k/Es3MWtF530tj6Kdk7yJhLVbRxCTN8AF
	S9D3g55dPnhWxp8QvT6nQwNLv/hnKLk4Ivg0MeRxI6SNIQa6XzAzp4i8nixe6kJ5TOzGuiwmaZnCP
	NnEcJ5Nqh1M1zYyG/UlEJpL29M/5/sbG8pW/U9xu82apHXq/BsepX8iWA+tKiK6u+5l/ATSJofBSn
	g6XW1UyC7pIXPb7O9FNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWjf-0000000DQaQ-3xJD;
	Mon, 24 Feb 2025 11:34:55 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWWE-0000000DKfo-2f46
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 11:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740396062;
	bh=9N5UbYwwS3cj4ISBSwf0j1nK6obW0UxDyUzHGsn7IM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1xeJqD1EyhCPVOKwyq6EZS92UTpksyChGpHsp0/kMrNZ/qiBm9uYbSBNgFkV18W8
	 I4Mn+BG1Nnbb0PDA+3SQryW3Q6ibwr1eEF4B4ZMDldpQleHkN7ADemC/803GF2n3e3
	 yozfHj9ZvBFx81aO8ITspHS7YqkUn4w7PXg5zVe0=
Received: from stargazer.. (unknown [IPv6:240e:358:1110:6100:dc73:854d:832e:7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id D8D9F1A40F0;
	Mon, 24 Feb 2025 06:20:55 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fangrui Song <i@maskray.me>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 1/3] riscv: vDSO: Remove --hash-style=both
Date: Mon, 24 Feb 2025 19:20:40 +0800
Message-ID: <20250224112042.60282-2-xry111@xry111.site>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224112042.60282-1-xry111@xry111.site>
References: <20250224112042.60282-1-xry111@xry111.site>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032102_738231_75CBBC45 
X-CRM114-Status: UNSURE (   7.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When RISC-V borned, DT_GNU_HASH had already became the de-facto
standard so DT_HASH is just wasting storage space.  Remove the explicit
--hash-style=both setting and rely on the distro toolchain default,
which is most likely "gnu" (i.e. generating only DT_GNU_HASH, no
DT_HASH).

Following the logic of commit 48f6430505c0
("arm64/vdso: Remove --hash-style=sysv").

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/riscv/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9a1b555e8733..ecee348af9ce 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -47,7 +47,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
 $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold_and_check)
 LDFLAGS_vdso.so.dbg = -shared -soname=linux-vdso.so.1 \
-	--build-id=sha1 --hash-style=both --eh-frame-hdr
+	--build-id=sha1 --eh-frame-hdr
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
