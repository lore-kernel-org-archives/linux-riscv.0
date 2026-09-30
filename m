Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E10CA5FC4
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ycAg3rwSbYD/oZIyed0TYK1qz9jeQht65P7Ts6WFcCI=; b=saobTPQelWHgYr
	lYnl0z5TeSh9OFINJRQYyQ7c6o532y7DBBEWtT9jVmfAYd0dxImuiywpg/v9DhITHlxThejOm8Pbx
	8bGv3h13FZajg2YCmMR8Xzy0x6dAaQH85JBmRl7p0zxHxnW/+A6BW1FgJEqcVJmUp8lVb/YdmTXRY
	Ktlka0CqIvpyuEshiugx1nQHB0VqeY8T0bWjFyblT0HNb2aHiNdiIVnKafW1ylhngcmPsrPr/a9ji
	0S6o/nRMrm3NS4PscPr21jwoimBOAyDrC1UVHt9Zh7AupYJ/LLQLTLmacNNGZP1tBO04WxBbBbC8w
	KXEsw6L3vIknHvXNuvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxoz-00000006n01-2Qdh;
	Wed, 30 Sep 2026 17:10:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxoy-00000006mzb-0iwF
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 17:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1D61407F6;
	Wed, 30 Sep 2026 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B971F00898;
	Wed, 30 Sep 2026 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788219;
	bh=tRE9jVcQaB9L5l25LliMME+MsBNb/ftr1C1a5utqkF4=;
	h=From:Date:Subject:To:Cc;
	b=G9elaha4xp8vDsr81R7A7TMT4RHsS2drLb2pLIJYTtzB2tZcZMMBLoziWg7NvacAg
	 PiC2KSFbHn+zOcaJULTpLQswSgXgcY56ssBEZZttGW8PGglfv+xFsMpXpWCj+COM71
	 dMaD6proXuuq4lX3b3KJ4igud879nSLYjMuHpa2SurYi7598j8s1kgaLOvvkpNJTwp
	 228rVcGigLzJU6gFZWULht+cP+Zz46cPMSXO6rrt/lm4zJKpzI0ssdV70TaaRvyHCj
	 CceQF6pdy+EZcaXrg2Jrol8grCf3TsgXOkplq71lcd4RabO9LIMv7PQgZ8zKXMJ8+m
	 W1gahRWU1iHJg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 30 Sep 2026 10:10:18 -0700
Subject: [PATCH] MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org
MIME-Version: 1.0
Message-Id: <20260930-b4-thead-maintainers-tree-v1-1-12d077a36f4b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHlCvWoC/yXMwQrCMBCE4Vcpe3YhhhqMryIe0mZqVzDKbipC6
 bsb9TCH7zD/SgYVGJ26lRQvMXmUhv2uo3FO5QqW3Eze+eCijzz0XGekzPckpbZBjasC3IfJIxy
 iy/lI7f9UTPL+tc+Xv20ZbhjrN0jb9gHhZ9TCfQAAAA==
X-Change-ID: 20260929-b4-thead-maintainers-tree-46f2e6590dd8
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ci1urjiWH/bMKD2Pezpdx3iZ8pWRRbO1MXaJKDV3p/k=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTtdar+5HDh6Ktb33uj1ZSKXlj1heoIthn9+Pmea4VT0
 ObOjVPSO0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATcT3M8M/2Ar9V+rIv7xkZ
 HWxyZJ91qy9NPeq98uu5pyunXfnN5JrJ8E/N878qd6v4ebklChylc1309nzge5M7d0furgntea3
 BT3kA
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

Update the T-Head SoC entry to reflect that the branches are hosted on
kernel.org.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..7e8b59e1fc18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23619,7 +23619,7 @@ M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/riscv-thead/list/
-T:	git https://github.com/pdp7/linux.git
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260929-b4-thead-maintainers-tree-46f2e6590dd8

Best regards,
--  
Drew Fustini (Tenstorrent) <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
