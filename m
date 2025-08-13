Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15778CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2mYpIiGIVW4PCsMxjERH6XY0JHmyAI4S1MCgah+capU=; b=tfxzxtxN3ujEMr
	+tLSIZfBec/buD7ajiiL2SinIa7mOcpqWVRpi2WtSYwBuI+nY929Hn8YlzquEBaDFbITy/vWQsge2
	tixYw94A/Gss8eo9sUO7kc0Xcr288McsX8z0QWnO6F0+c7XX7YK8cxk78WlTxL9zO3lRT6vsQWp0r
	AgsGLUMxH8VZt1ccsY+pbDU9XSPJeF3h/Vt6EgH322cKity6Ft4KhaFZpuiDzgPV4/SWFidRVxJio
	MGewz1oYU+PUWwfbSFCUHHn7otSvM22RfffNp9bIVVxnyAotSyiPrDCONK7Yv4vQCToAgpQJAwZUr
	Kfumb1A2bYigV08d+xJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEg-0000000FBSv-1yxd;
	Wed, 13 Aug 2025 22:46:22 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umF13-0000000EYL1-2MoJ
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 17:11:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755105111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ez9de+bl1zbWJs25nq3JZ+PtT03BosVR4OIDayRTfmi8+diJ1oe31vO8jF/ePc0C2UFtd+Fq1fbpSG3aIXBaosQKEyqJPeRX03Qqu4aMkGw6h3P7c+GBiOlPCu+iV7fo2eEBrrcdd6hELybG6TzJfM9DQOGgajCnJLapx6RRFNc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755105111; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hwMVPhatoPN6SXxmbJBqlOp2xrUdMJia+ktm5ztecWo=; 
	b=OrqD72pgxpAJdMPt1nAIHSU7IKPw2XihMYbpWW6XiKfU9/ENS8kdtUc8KllpsMZX3DZSdnJnid1z6QClzLzn1pz43fXCklCKpfVYNHWHLNbL1TVfrRIuuBWfvnTVpyfWXxE6CveVfGN2IFN4/9caPDW+R3ll5qmwToIzm0U2/00=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755105111;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hwMVPhatoPN6SXxmbJBqlOp2xrUdMJia+ktm5ztecWo=;
	b=A1s8g9WQ5FaONit9656PyKMlEZfJRVfNUS+0mEac9WcIRKcXY7Ub6p1Plbj9nU8r
	KkYOBhfMd/AMKwfjiS/R5jTHi6u6+xKtnV6wsEH2fgUZ5RLIxtXZqyl+AYZsaNcxDA/
	yzjGiO8YTaq7IWSohDnPvg45ogAhEBwDu7+Le21IFUbgoxfTp5pObIBiW9jHj5qca5Z
	OZfoVc0iXS7hgVSy8/3Y27wEABNtY+HuH6fuWQWDA85bb38C3kTbmV7/eY3RHFGQ4ld
	TBmBTaFSrIkssYP/czipSU6KM7BrwRbFEbwrO2n16uf9VMm+vGsAt9xs8c1feFgTcM6
	z7NE/FpIvQ==
Received: by mx.zohomail.com with SMTPS id 1755105109586432.8546456456073;
	Wed, 13 Aug 2025 10:11:49 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/2] clk: thead: th1520-ap: allow gate cascade and fix padctrl0
Date: Thu, 14 Aug 2025 01:11:34 +0800
Message-ID: <20250813171136.2213309-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_101157_640088_4DEDD89A 
X-CRM114-Status: UNSURE (   6.16  )
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

Current ccu_gate implementation does not easily allow gates to be clock
parents because of the waste of struct clk_hw in struct ccu_gate;
however it's found that the padctrl0 apb clock gate seems to be
downstream of perisys-apb4-hclk, gating the latter w/o gating the former
makes the padctrl0 registers inaccessible too.

Fix this by refactor ccu_gate code, mimicing what Yao Zi did on
ccu_mux; and then assign perisys-apb4-hclk as parent of padctrl0 bus
gate.

This patchset depends on the display clock patchset at [1], although a
rebasing to get rid of this dependency is possible.

[1] https://lore.kernel.org/linux-riscv/20250813072702.2176993-1-uwu@icenowy.me/

Icenowy Zheng (2):
  clk: thead: th1520-ap: describe gate clocks with clk_gate
  clk: thead: th1520-ap: fix parent of padctrl0 clock

 drivers/clk/thead/clk-th1520-ap.c | 385 +++++++++++++++---------------
 1 file changed, 188 insertions(+), 197 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
