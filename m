Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7192C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PCLbpwELYmKCLc8U+E+9FPBl1ceDHc2dLGVFcn1OJ/0=; b=biensIMoz0TY75
	Seo7PkbMhDFpEcUwezEjSR3EFy9BWrj7487sUahOXKJ95/LkJ7HfZUh4TDbGM8pQ5gaVNFFdtcYyz
	NERYIaR2M6KZOoBmCE1DXgN3aiQSpuSTX1w0oeKS25U4ySV/ek2wfXg9VybuugFos7GySPJccgCdq
	vBa8rIdUbE0HDhP3QwU5qJwm0f5YweTZPrKVp2tHyHVsMqq7vMBSXtnMzAy9srPMkxWLm0pL8IQAd
	UNij5+d6GkUJ2gxXXs8nh9o9P3NjlHJUDHrqdW+5WErsxRoJ5zgkLd9o1sUlRQOFGDwNYaDcb6FVC
	mQMHLPW/mJmfpFjRH+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvkV-00000000TiB-3eG5;
	Mon, 21 Jul 2025 19:00:31 +0000
Received: from smtpd4.iitb.ac.in ([103.21.126.59] helo=smtp1.iitb.ac.in)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvkA-00000000TVl-0nb8
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 19:00:12 +0000
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 7F72B101C929
	for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 00:29:34 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 7F72B101C929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1753124374; bh=HGLwuU4D+TUfqsZVVo04GFZdHAqGvPqWRxCyM/vPrtk=;
	h=Date:From:To:Cc:Subject:From;
	b=fgrNnZVuxHtNXvQhEzFgZbSMESSpacQkPL5pPuuKDddyUMZ3qThYSKgeHDbwQLgXC
	 f450tK2nYV4C0VXVNK+LGdmMVFctzHDdoIzdZruGdFwODVi8Z6rVODSAJ4yPwWoxcU
	 Qp4k5G3hCkj9vNvRm3vx6DO7UKMDYnf+BmB5HnRY=
Received: (qmail 12007 invoked by uid 510); 22 Jul 2025 00:29:34 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.105765 secs; 22 Jul 2025 00:29:34 +0530
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 22 Jul 2025 00:29:30 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 390F036003B;
	Tue, 22 Jul 2025 00:29:29 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id CA8801E812C1;
	Tue, 22 Jul 2025 00:29:28 +0530 (IST)
Date: Tue, 22 Jul 2025 00:29:23 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org,
	heylenay@4d2.org, elder@riscstar.com, inochiama@outlook.com,
	akhilesh@ee.iitb.ac.in, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heylenay@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	unicornxdotw@foxmail.com, jszhang@kernel.org,
	zhangmeng.kevin@linux.spacemit.com, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] clk: spacemit: fix error handling in
 ccu_pll_set_rate/_round_rate
Message-ID: <aH6OC1aV6IcQnoSC@bhairav-test.ee.iitb.ac.in>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_120010_749299_0D93BEFB 
X-CRM114-Status: GOOD (  11.24  )
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

Initialize best_entry pointer with NULL in ccu_pll_lookup_best_rate()
to avoid returning garbage value when function fails to assign it
a valid rate entry. Avoid passing invalid rate entry reference to
ccu_pll_update_param by adding appropriate error handling in
ccu_pll_set_rate and ccu_pll_round_rate.
Address the effects of uninitialized pointer as reported
by smatch and coverity static code analysis tools.

Addresses-Coverity-ID: 1649164
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202505111057.ejK2J56K-lkp@intel.com/
Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/clk/spacemit/ccu_pll.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index 4427dcfbbb97..3fc6a30f98b7 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -21,7 +21,7 @@ static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *p
 							       unsigned long rate)
 {
 	struct ccu_pll_config *config = &pll->config;
-	const struct ccu_pll_rate_tbl *best_entry;
+	const struct ccu_pll_rate_tbl *best_entry = NULL;
 	unsigned long best_delta = ULONG_MAX;
 	int i;
 
@@ -107,6 +107,10 @@ static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	const struct ccu_pll_rate_tbl *entry;
 
 	entry = ccu_pll_lookup_best_rate(pll, rate);
+
+	if (!entry)
+		return -EINVAL;
+
 	ccu_pll_update_param(pll, entry);
 
 	return 0;
@@ -129,8 +133,11 @@ static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long *prate)
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_rate_tbl *entry;
+
+	entry = ccu_pll_lookup_best_rate(pll, rate);
 
-	return ccu_pll_lookup_best_rate(pll, rate)->rate;
+	return entry ? entry->rate : 0;
 }
 
 static int ccu_pll_init(struct clk_hw *hw)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
