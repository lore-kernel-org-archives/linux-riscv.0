Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBD5E7718E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvJWVNUkzlm651TvvoNBcPnoecpWn3ggi5kC1JwXJTo=; b=dHQuFE9JvqSY+3
	WcDRtL9qrgdhG1AHfBmzts/zDK8cn/WyxNTMBp/5sW0Smvn9dz1CQ4MdNfx27Y0jgRfd38HGOiELp
	1L5tVjnLTouuPsN+0WuONvgw+7sgwRFrJAzeDMbOza0BHwUJ/NlWTL6qTnmT2McpyL4GL+LNncEME
	HiY7Nfzn1Z+jAkYheu/fiCgNM/0WesD1mjHbIEHEO9aY/HXl1XTd/WlMYM/Jdp48gdjDGY92ukhBZ
	CnXJ0d9w2M4gXY6yoPfwz+m545YyrMz4V5k7V4XU1d8G5iREoc1RLhB6DV2aPJ3jhVTxn4/VZzWXF
	F39fr5gc8L4WR5ms7ddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOI-00000005Nuh-3Evo;
	Fri, 20 Dec 2024 15:58:14 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005Nqa-1jj1
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wrx10QwzuqCnRW3M8oiJ8RSWqLjQ58jslwZa+sNGfa0=; b=1gUQ2ZDtufTmt6okEhqUqqOxHF
	ZLJQoDFyIVjTvLU5Cf7xQBeye2YeKBVMrctIa6aNSfP5lKCV3mnioH9QZkfoPLbzmb6dO1FJ7ZpVV
	+YM4Rqe41G8H3WyGiZSmJX7GNCKQ4BOJMSmV8LIIlHqnM2yvOh3gX3WpGck6Sdt1kyKR+cEub5xiR
	vOEF3EmdGHIdLxvh0pX9cS2Ny7iYQcnBmR70jqnHug2dp31T0AZiUXc+1LC/EpvRoQ+2YU00msw5b
	lDZ/5gcDqT5jxyRjSl70PJ3+zrc1XbsheKqFAgO5exB0StukVMDv8nzKAEPRMNfbnRt1kVMhNSbu/
	o7GviuuA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-00ADAN-3F; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LTB-3bSK;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 11/15] add todo on fpu
Date: Fri, 20 Dec 2024 15:57:57 +0000
Message-Id: <20241220155801.1988785-12-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_448424_43D4DAB6 
X-CRM114-Status: UNSURE (   7.06  )
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

---
 arch/riscv/kernel/traps_misaligned.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 21b2a4df185f..fdf12dc579d4 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -154,6 +154,7 @@
 #define PRECISION_D 1
 
 #ifdef CONFIG_FPU
+// todo - is fpu going to be big or little endian
 
 #define FP_GET_RD(insn)		(insn >> 7 & 0x1F)
 
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
