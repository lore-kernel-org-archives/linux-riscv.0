Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D92FF886F
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jCiL4vCMbRRADuXfqgLF1dLdit/PAmCgycXl9Ybhmus=; b=e85Dy1wLLRHAhQ
	Mnygi8r13EMkcyAqNPvf62ZY4MZGKJWgPrgcq8BFO9hU8FMnmV9Kgdnqv8F2GwS1y4ikxjc1DaN6i
	/+RScsPsFGQMQKX1dHrpyS4I5oLleK1DPEZLBup5lnWDCK0wYRloGk6+AsbvR/Uvf9U4Dz5DyIf0j
	WyxYXVjQcig3Xroq4xcE1GTA53OSZq/UIAei/Vcvk20LD/41XGrM7CbWzADU4HabPuhJ4vMfR2pOu
	zQfb19/EoTQuQeOrtfWe2ETeduqqESCXTbtqw8Vro9roT3pe1UXQb6QhEa3/QqlkpESZvQp6OMrWH
	QfZDKF1to2B86g9W7/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmu7-000000023vT-13yo;
	Tue, 28 Apr 2026 18:11:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmu5-000000023vA-1ESV
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 18:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DC354022C;
	Tue, 28 Apr 2026 18:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998BCC2BCAF;
	Tue, 28 Apr 2026 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777399884;
	bh=YpDlTI9oI/uDSq/nVya8Mx+RNyorLJWbHegc8OdnHAQ=;
	h=From:To:Cc:Subject:Date:From;
	b=K1hWN7Kagp/O+nHdFSIj8Gh/XicMKcwPLE3rbcsyZX/U498qquvcXHAiq476GJZUY
	 RTWvooib3DvrRwBZiGghphNWqE/bVNKjCKBBjlhVfLW/iSOAfZ1zjWcAD7vl8LbjtJ
	 q7ajvLu5VM0z1xeCAfuvBYVBeFh915naj5HCJSawHjbnqiQHOsJrEGCgeQpjpG2lvk
	 iN4x41ZZuNKcw/IP4kiP3mQzgmLc3Srstn/0nNCOUI9PibeR5ulZAUtr+TYARmhAtU
	 hgyAF0XIEYWHIrW+dW498gXJchZtzeMy86Qv9lEm4j2m3eG/k/+iKO+YXtZiOzWW/e
	 IacAhzV49jCsw==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] microchip core-qspi cleanup
Date: Tue, 28 Apr 2026 19:11:10 +0100
Message-ID: <20260428-surfboard-unhearing-96776be0495d@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xWfg8zDHosnjdk8OauMots+Zabf1Nhr291AHb82xBWE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkfftgvYXJg9nzvdWfNmQPZBh5MC6qUu6fc5LKOvOTu0 btyT/S1jlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEVZqRoXXd5o7N/KErXv3a ERW+4Effw8KTfetmrlRry3ZKZF0rJ8/wz0BFhKkvddXXlurmy8cfCcRfdd9Rs7xg5STR2McGCc8 ieQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_111125_350132_695F1D73 
X-CRM114-Status: UNSURE (   6.09  )
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

Hey Mark,

Here's the other two changes, that didn't conflict with the fixes.

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cyril Jean <cyril.jean@microchip.com>
CC: Valentina.FernandezAlanis@microchip.com
CC: linux-riscv@lists.infradead.org
CC: linux-spi@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  spi: microchip-core-qspi: report device on which timeout occured
    instead of which controller
  spi: microchip-core-qspi: remove an unused define

 drivers/spi/spi-microchip-core-qspi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
