Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE55C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LdfGMkgd7cw8Rc4zpdaV+3qU7cX5AKBCJTS9o7B/ts=; b=MLgiWSkpevWoCi
	HMFPVES+62z40W/LoOxSGeVBsVlFg+4niCoKuhIuDAlrIgrdkyKkn/SVBw/lYzlZbpjbsmxUPOglk
	/h4Qoj3eoZ8XAyLhWoLfC4nZ0HBobZjytPHGnNs+uCM+JbnKUsgAhIhMKJcFg11oQuUSDVVl0JPN2
	EqwBvlasGSyOdM4SVVnQaldaAeiqoY+y1Trau9viJykrj2Zp/UxoBKFM01fg4MzAjw+RWIRekqt48
	N+iZeB19pXtro/f6CBRq4Ml5AiABtfqFDWXhWlBn3PaZZuWow5LjOHTgRMgoMfG3BW8a7kGs24v7x
	GKzp41sTjNwZNQkUAVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWjk-0000000DQe5-3THv;
	Mon, 24 Feb 2025 11:35:00 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWWK-0000000DKik-2qRG
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 11:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740396068;
	bh=uK0G5z1dgyQ1LGyKW373cRDB/WnmXJQCfB7OmH+z2fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gd4ZDedFN9+OzY9eGivWQTBRtB7LyVCXYFYIj2XuMmq5EdMAULRbgKhFeJFaBID9b
	 oBanxXh8CBUeMzpAT+AlLNpFn99zk9GzOtaO1H3bLQzGhHyjeIp6fO1lnxKukVme2s
	 b2beNCO8IiKLuLat0jC72Osz8qutKDtvGYaT6eWA=
Received: from stargazer.. (unknown [IPv6:240e:358:1110:6100:dc73:854d:832e:7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 131341A40F1;
	Mon, 24 Feb 2025 06:21:02 -0500 (EST)
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
Subject: [PATCH 2/3] csky: vDSO: Remove --hash-style=both
Date: Mon, 24 Feb 2025 19:20:41 +0800
Message-ID: <20250224112042.60282-3-xry111@xry111.site>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224112042.60282-1-xry111@xry111.site>
References: <20250224112042.60282-1-xry111@xry111.site>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032108_722113_7BAD8365 
X-CRM114-Status: UNSURE (   7.80  )
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

When CSKY borned, DT_GNU_HASH had already became the de-facto
standard so DT_HASH is just wasting storage space.  Remove the explicit
--hash-style=both setting and rely on the distro toolchain default,
which is most likely "gnu" (i.e. generating only DT_GNU_HASH, no
DT_HASH).

Following the logic of commit 48f6430505c0
("arm64/vdso: Remove --hash-style=sysv").

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/csky/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 069ef0b17fe5..3e100e6cf72f 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -29,7 +29,7 @@ SYSCFLAGS_vdso.so.dbg = $(c_flags)
 $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold)
 SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
-	-Wl,--build-id=sha1 -Wl,--hash-style=both
+	-Wl,--build-id=sha1
 
 $(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
 	$(call if_changed,so2s)
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
