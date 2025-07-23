Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041BBC83F25
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 05:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tf0vaI8sFaivVtOs0l5qjldv3z13u3/+ZlsEkABMlQM=; b=2wt286JoNR55wo
	gde+WqvBtYSKlY+0hr7Fsas6PyhXVhmcV6ie22OdVMiU8IbPdTDSvxyFpudWHja7EB6HDLxFY2S8n
	0CfBiU4T0+LqJf2EhQ7EuLpeDshaBxQIVJ7GsydJzhXDrOnUms8UfH/mL8+x5pGmt3OP3OGJ+M8wz
	jPbQLEbOohbZ3SlvwdHhvYGiDOF7zbH41Ljs4MRwRg6EL7f/fRQIQVri+jQ2lZ8gkyQhw370DHkGv
	aeoS70gUy7fVUjFuvHomFC6SnLp3piehSWnyZNFrZdfyGsZ1F19ssGRozHsKGrm8JlFxeMWxdpyKd
	TfNR2l+yjgHOSARSL+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueS3t-000000043jB-3F06;
	Wed, 23 Jul 2025 05:30:41 +0000
Received: from smtpd7.iitb.ac.in ([103.21.126.62] helo=smtp1.iitb.ac.in)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueS3q-000000043cw-3Dxg
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 05:30:40 +0000
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 8550B1014A30
	for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 11:00:07 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 8550B1014A30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1753248607; bh=o4QgzqTBBnUc7wLsm/2kW3soQ4NatWqYiTC9EV+Uq+s=;
	h=Date:From:To:Cc:Subject:From;
	b=MOafYYOw79qQucX81r9LQF+Ec7ynt3g2Rvw8/cSySiFSLdCZnK3ABHUdK6MYDVMIf
	 UxUX7wqJUeWlnjb7dOlcT0z37ix1nb+WYk0cpPJnZXWoel/SfKjTJQVCKUFnYgJ8Gp
	 Fki1krcxRssbRgjvEbrXQtikJ4P1ezR/LlvSarbA=
Received: (qmail 6639 invoked by uid 510); 23 Jul 2025 11:00:07 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.901731 secs; 23 Jul 2025 11:00:07 +0530
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 23 Jul 2025 11:00:03 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 323A134151D;
	Wed, 23 Jul 2025 11:00:02 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 0CE721E81366;
	Wed, 23 Jul 2025 11:00:02 +0530 (IST)
Date: Wed, 23 Jul 2025 10:59:56 +0530
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
Subject: [PATCH v2] clk: spacemit: ccu_pll: fix error return value in
 recalc_rate callback
Message-ID: <aIBzVClNQOBrjIFG@bhairav-test.ee.iitb.ac.in>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_223039_051642_1CC4E7DB 
X-CRM114-Status: UNSURE (   9.73  )
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

Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
get correct rate entry. Follow .recalc_rate callback documentation
as mentioned in include/linux/clk-provider.h for error return value.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Reviewed-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
v1 --> v2: 
  - Add missing Fixes: tag
  - Carry forward Reviewed-by tags
---
 drivers/clk/spacemit/ccu_pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index 4427dcfbbb97..45f540073a65 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -122,7 +122,7 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
 
 	WARN_ON_ONCE(!entry);
 
-	return entry ? entry->rate : -EINVAL;
+	return entry ? entry->rate : 0;
 }
 
 static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
