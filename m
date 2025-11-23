Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43802CFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7rl2kvg8tHYR964V41dl3nWJ5vyH7QQrAbL1nrtrIY=; b=t/8tsHLSCamPGy
	JFihtrDWJFTfhZndzHBLhpREJ6UOKvsxnryIN529cAiH0+s2aPjfxyWg+697eLqe21SNfJXWL3NfM
	pGE6BK6ynEBS5zUOdLKhs6A5kUREmR/bu+/wN8XFUMB550pUBots+9qYfEydMF9nwJ5Wt40jomr/f
	wIia7ovnI9I0+3s6Q0bKlyz3YkUGujA2twLMb5DuG9gnORmAaHt+MioOSIdnT94G9y5MA+mkXOi/m
	3nCQ82HzbvBNptjPqKpOhN3I6L1KMx4Pq9ZRUY8OVig1eVEsOVeA4JZvGqm303gy9ar4ZA5XuJs5+
	1cVX8M3z04/CuwmU1UAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDp-0000000AclX-2arw;
	Sun, 23 Nov 2025 18:54:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDm-0000000AckW-2J80
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 18:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D11A3439C8;
	Sun, 23 Nov 2025 18:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F35C113D0;
	Sun, 23 Nov 2025 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763924040;
	bh=Qut6hQQFbtXG9FoqOb4X1suCWPj/Pc58mSnysWBNKgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSi0IzKCAoYK7iri2VAfhGYzEG3bOesxTn+1l32CXv3At2gm8zhYZ6PRIfPL7Wx60
	 /nQipgTQj6SLAvsjZu/xFZKjlccy95kqN0fT2qfWv033YvqJg0Yl/geRlRjxM39B7p
	 YsvsinLemfw1hnsB3fsS3LR9HC2uaLlifxdLU6HGqAs2Znqovchm4oeV/8ADDs47aD
	 Hu+JU+knCWCXJOkhbiMiP6UeKJKUla5CRd/SA9PPlHCQFMKwe/ILf4hmtGkrINuphf
	 pKF71PDbTcTs2nsTc+hvZt3bqtaey26lWjtK2CL0577h7pS+L7k1tj8Gf2BfW8iuuw
	 /ejiq4+iqPnnA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 2/4] MAINTAINERS: remove patchwork from RISC-V MISC SOC SUPPORT
Date: Sun, 23 Nov 2025 18:53:41 +0000
Message-ID: <20251123-backroom-unshackle-21274947448d@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
References: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=704; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=R9wk9usUr0FuNBeIHZ6jwVw5sshGJQppNSw81Izb9jM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnKEZbls0Tyji2tMnuTetKnp9bB5bXbZ0mbqEUarIzmh hPZX0zqKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwET+NzH8T1g5adGOE6d2vlFh DtbZ5XpzCffP6qRz4vtjyy1f358a9oeR4dmEDa9adzc9UNr8RNTxuepzjgI2n/+b3/Rw557L/h9 jygcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_105403_051194_D2D4990E 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Conor Dooley <conor.dooley@microchip.com>

I don't use the main riscv patchwork for anything to do with SoCs,
remove them from here to avoid confusion.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0e092d2d88a..0836b5422826 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22117,7 +22117,6 @@ RISC-V MISC SOC SUPPORT
 M:	Conor Dooley <conor@kernel.org>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-Q:	https://patchwork.kernel.org/project/linux-riscv/list/
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	arch/riscv/boot/dts/canaan/
 F:	arch/riscv/boot/dts/microchip/
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
