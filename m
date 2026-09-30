Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E1CA5FC4
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vHECcXmSVeTFuch8CQJ6RdsXLRMYn+5Gu+nmFXyuT0A=; b=ziKYVmNTzy5lof
	749HiN83j1svyN59LAFXKxSp3N9sOyz0QgiM1UeB19FnmMSk1/Q/P9cwK90L7ElwHiZnhvrUEP4CC
	b8gS8SwUcFLG7tkqa2ECuCbNAklqO69SJUEHeWtriuCGvdg2MoYU2ryZGLEy3JQuaZa6BwbIp1HM8
	LE/QvZz8AB8R5wKPkHuFFGbAViizE0x5SqSMEvVyBgDt0SBx/3+I1gSMGDAwlB+Dawoo5yYmge/RW
	sAdyJqG4sjjjiJO/RSr94yFTkTNRr5YkzE2nFh+/VeO/DdrX/bdBOzxjOUSkpKVwEm8+jLyMBHkh/
	VFiRLQ9tTnRJM+25L0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxoQ-00000006msU-04mE;
	Wed, 30 Sep 2026 17:09:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxoO-00000006msF-3K3j
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 17:09:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 178A860267;
	Wed, 30 Sep 2026 17:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981051F00899;
	Wed, 30 Sep 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788183;
	bh=KT0ETgO4Z9G3jrW0AkFaXa21laUMQC261VNURsmUYTc=;
	h=From:Date:Subject:To:Cc;
	b=kAP5j/MtMoERgR0VwBHibnuXlXWPjh8bkZpLuc+Zo/mrxg90VvvbWafxMpSBNVOnW
	 YHtKqbXQ6Kc5Mz1/jaPV0tckoOI7oMKq5MJEjTHxXuJcx+LB8VROFh/jmb0ax/ogPv
	 FB2sLfntlYod7YKk81qY5triwtHQUHwNk/OGpEfsJjRl80zy2rRMlNxHYlgDH8dkPs
	 efOmldGSII9SlcyMLgS72dIbaggt61M14kmOI0w2oJGhEk7BXyOJqDfjwg90wXNrRD
	 zra23rDY/57kwDTBWtGjlh1Vyo1R2P+8IJ5sJQdTpR80Lh+CgqBEGAT+598Mn2fgXK
	 IMV9ExnaaABqg==
From: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Date: Wed, 30 Sep 2026 10:09:36 -0700
Subject: [PATCH] MAINTAINERS: Update RISC-V Tenstorrent SoC entry
MIME-Version: 1.0
Message-Id: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE9CvWoC/yXMTQrCQAxA4auUrA1Mh6l/VxEXM22qEUwliSKU3
 r2jXbzFt3kzGCmTwbmZQenDxpNUtLsG+nuWGyEP1RBD3IdTTFgSPjOL10gNncR8UiVxHFPIMaT
 2eOgK1MFLaeTvf365brZ3eVDvvyMsywpDF+JrfgAAAA==
X-Change-ID: 20260924-b4-maintainers-tenstorrent-f40a2041875b
To: Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=fustini@kernel.org;
 h=from:subject:message-id; bh=Aa5Ivf36cfXYkp4xSRFaPN8USkw0wK2xpb5noSzAHPw=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTtdQpmDc2anKgsvLprg6nprE1983r3h5l/zVv5le/v9
 Afa6+6ldJSyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAm8jCY4Z9uU8TCuW8lpqbV
 x9v/uuSr8bDYKZDfILr5dGrB5b8Mqc4M/8zf9bUL1K5+1381QstmofCrbV1vG7fO1l4g1hjKpVl
 cywMA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

Add Anirudh Srinivasan as a maintainer. He wrote the Atlantis PRCM
clock and reset controller drivers and their DT binding.

Switch my address to kernel.org, which I use for all my upstream
work, and point T: at the kernel.org tree that the clk and dt pull
requests are sent from.

Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..086b14b688a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23600,11 +23600,12 @@ N:	spacemit
 K:	spacemit
 
 RISC-V TENSTORRENT SoC SUPPORT
-M:	Drew Fustini <dfustini@oss.tenstorrent.com>
+M:	Drew Fustini <fustini@kernel.org>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
+M:	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-T:	git https://github.com/tenstorrent/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260924-b4-maintainers-tenstorrent-f40a2041875b

Best regards,
--  
Drew Fustini (Tenstorrent) <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
