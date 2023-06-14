Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BD9EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ue5r6PDTho4w/E7xDn/Uc1lENkEyyjI96eB0wcvkQc=; b=Zxwvd2NzjmmN4V
	qXl8TjugT8DfeYeZYhKEG/zerw4vcH5psPfspKuhT9MuBvvJLihgUlxN9yROrDjy/8060YEBbiiYR
	a8SpHub6SB0sm8RbIKADyc66Cz4LVfaMotUxhMx0INsgSYuvF+mYQBdbiabSOPIfLUFEq1hfRSYmE
	qSNrZHA5H7oAO+ezLWz4k/Enbhfz87WLuR/Y7cIpELroGxKzMJ7DW1K1XlzFCP9iuQ2mybHdgvp8Y
	Mhp5mJZpxPcqrVpOVPjXUXfjQ/81GW7XzdQSSRWN8tMiSBa8s1sUlloxW9y4Ki+LYjE6xA7tVvsBQ
	PGfmD0BlyfPRcRcYuJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Twz-00CIe1-1Q;
	Wed, 14 Jun 2023 17:06:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Twx-00CId7-1g
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 17:06:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDC4461542;
	Wed, 14 Jun 2023 17:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92BAC433C9;
	Wed, 14 Jun 2023 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686762386;
	bh=QeH29Idc/6qrLsvNLxNicZ5LF/IoEKjciGzozuHn9t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2rZISm1K8SkX1xOX2TLo7PW3cS1O2+YAR3k8M/A7VHYIwyHqnIYBfZHgFZjoHAcU
	 D6TI6td2vGW0/E3u69+d2Zu7PFJ2td8w0NweV8byRIQnpl3T+xRcHQDXzF+Eg/24Kl
	 siFAuXe4IaioC/8Z1rh4+OBr2Q9k+zPGamRaR8KE5Q+3kXXjDS44jOvQ+tiTZhqZWo
	 YGCtd0MSzQSzdydgVrdgOXvuAO+tZb1xla2qNqdK9DMFnKtUXfHygowqSgjC1PS/4z
	 aq3kHPtbo8dEMetGxnDv5izg4t5+r2BOJCxxMQKppXEb7mN2OIBSCx71X/3FFRVeOi
	 wbMRbsRj8hzTA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/3] riscv: errata: thead: only set cbom size & noncoherent during boot
Date: Thu, 15 Jun 2023 00:55:02 +0800
Message-Id: <20230614165504.532-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230614165504.532-1-jszhang@kernel.org>
References: <20230614165504.532-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_100627_595241_20D6691A 
X-CRM114-Status: UNSURE (   9.32  )
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

The CBOM size and whether the HW is noncoherent is known and
determined during booting and won't change after that.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/errata/thead/errata.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index c259dc925ec1..be84b14f0118 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -45,8 +45,11 @@ static bool errata_probe_cmo(unsigned int stage,
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	riscv_cbom_block_size = L1_CACHE_BYTES;
-	riscv_noncoherent_supported();
+	if (stage == RISCV_ALTERNATIVES_BOOT) {
+		riscv_cbom_block_size = L1_CACHE_BYTES;
+		riscv_noncoherent_supported();
+	}
+
 	return true;
 }
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
