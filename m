Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9D9C5B555
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j72EEj7V4XpGg/FGaXp8AzDBKbcaqKSawejhvSYAKlE=; b=cesNY07Dem13YJ
	sfkMiph6GeHcMI6P2q+PjabQtY9tX5dI+m6xUuoBZQrMhenmPZGqL+oTjq1u11R8EdjdRMgqTotov
	97OwSuh5/ax6ATVcHQOCwv6L6xpfWzqsVk62xRYIyEfg3N0dSzx/XYVzqisaIBwiaReqo4Ni5yTrL
	iWnWtt8+z+qBOxiwJPePwcu/hcIDbPyBzt3Aqak2qIeWVSNyeNOOSsfmysaphMLNWvrCTgZ8qi7h+
	l4DErK58/ddmprfClmw3L8+7E3ezndmKE5aZYqvXfo+m7KMx05aEYq6092fkaDMHYZTuZkhhQRXNN
	upwJZgwaey0UUhw0katA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9di-00000008DTj-3dHI;
	Mon, 02 Jun 2025 18:12:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9cE-00000008D4H-45iG
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 18:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5809A5C5E67;
	Mon,  2 Jun 2025 18:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EF4C4CEEB;
	Mon,  2 Jun 2025 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887829;
	bh=2Cxd3jS8VMSsjweHbN859HTp8jM+cKEyz1r4yJ8hT4M=;
	h=From:To:Cc:Subject:Date:From;
	b=hdKgQhgvE8SV7l63uUx/PI0qaLfr+AddJIlOhFXQVpI4acJ5Nnf10WmeeXIAxbsQp
	 AsGvl+0AuDBWFK7cUlyxj89iVSQsxsgk/BrhCHFwjF7cB7Q+F8R35xsig5wAu1NHWj
	 wSQ9+nZelJK6bUgFov4ZXhuutY/ike3CLWuPRV1YNUYrFhTfZc9TUTsYhkQ0W4+JdP
	 s4q1mVj8wTI5vbddmAsTs60R+UvjkL4F5G1QLJhZSqtwThHEmXC10+vsDlH4Gfed+A
	 kTUoEP80XaU2DtcTBhlSMsnmZcKPNuB7vzSrhLeZbZ6Yy01qIWn2ODFQJNyhyBW5Za
	 Fg6645twCxlJg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: pi: use 'targets' instead of extra-y in Makefile
Date: Tue,  3 Jun 2025 03:10:18 +0900
Message-ID: <20250602181023.528550-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_111031_051357_5252967C 
X-CRM114-Status: UNSURE (   9.22  )
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

%.pi.o files are built as prerequisites of other objects.
There is no need to use extra-y, which is planned for deprecation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/kernel/pi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 81d69d45c06c..13b7d68c95b5 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -39,4 +39,4 @@ $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
-extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
+targets		:= $(patsubst %.pi.o,%.o,$(obj-y))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
