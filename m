Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A68BC79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 01:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ovjg8F5YMm92dqJVxYklI/7GGFuIlq9t67cseCS+H3s=; b=zL4dCCg/1ifs5U
	BL5SIJZTw2lfDA4XwE0ARj3SI/NGmFsu1UC+aM/1RH86jP358HJLfeD48hSkLQS+U8mF6fHikmUPn
	2z9/xqTkURl/KAvyPog4U2YFMfaSjYz/tQIsnSajycg7oNvcyT8bMVOXUSz2zjCk5d1e1nwsLhZjE
	Y2GXQEVS9MhvTjZMgergwx5L8ip+KO5Q90r+zYMER9cGuctEFnw/Ek4Vta32OFSEchgTuuIDmxNop
	caNPRaRq2qcW3LDPQA8Vhpl+3xrJmgt9lekL00Vw0+S3l6KzqUWvEQTVg/27TMMWxJgmuGvtBM4Rn
	8+umdqYmrYhRTO76EFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3OZn-00000005gsR-261A;
	Mon, 07 Sep 2026 01:55:17 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3OZb-00000005go3-2GQ3
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 01:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788746090;
	bh=IPtN5otttm8uil3Pm83fRkoi35EfLqOcxkeTULa2NrM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WkFFGP5+5Ka3L/6+SE+K/I6gzenTIjKtagSTZBnL9cc6SiV46FlF+oweemLsizRtx
	 k5vegornIsCf4JjL472rTwaeDlPFxhAGLxhQnl3kYWmjLoNJ38+sN1Oyl6FOqf/aEB
	 VKg9cnJj142BqCbmejqSfSc2pD73hVJbmKbo2qgA=
X-QQ-mid: zesmtpgz8t1788746083t1fd75327
X-QQ-Originating-IP: aHLWYYlqyO/Fe+lGWgrck0bWLMNe6dlveIicawt9dWA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 09:54:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5020581304440402209
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 07 Sep 2026 09:54:36 +0800
Subject: [PATCH v5] clk: spacemit: k3: add CPU PLL rate tables
MIME-Version: 1.0
Message-Id: <20260907-k3-pll5-pll8-1800mhz-v5-1-5cc96d716b0a@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOy27DIBAF0F+JWJdoeBnoqv9RdTHGUNP6JeNYe
 cj/XpOqahZhM9KVZs6dG0l+jj6R18ONzH6NKY7DHtTLgbgWh09PY7NnwoFXYIDTb0GnrlN5GMo
 MQN9eqTPMaIWAVkqyn06zD/F8Z98/fnM61V/eLdnKG21Myzhf7r0ry3t/FfJ5xcooUBSolakq5
 wV/6+JwOh/ThM73cTm6sSe5a+UPGoOCximjiHUIigFqq4uaeNAEK2hi15QA34DVpmKqqMl/zYI
 oaDL/FjA01tVSN/aptm3bD7zes1e9AQAA
X-Change-ID: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944
To: Michael Turquette <mturquette@baylibre.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Alex Elder <elder@riscstar.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, stable@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10338;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Qc6lK3RIhSKzuQqq+9rWy6XPcwNZph92qOZUJh8z6SI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnzJGO3bv0z8X6Tbn7R3BuehY8Z5bQl/sosEQsuUL55k
 c9L5rxWRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwEQS9zL89+ustpdS75k52XqR
 Y5D/5nkXZGQVfe++nnTlVFDH/KXeMgz/9P8fv2q1R0lEyXGXXNbf7Is3F7iZ8nTnPa1+FSmTfXs
 fCwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mutteg8H72qDmgHgr61YGLIXtlHBgGRtp6GYyRqKRS+Q1MI2eGWtCICp
	MMBTHjLjvXYj8xGNStI2z76/ZcVyftbhdD2KSbKbnDrdClpa2BGCK6I/3mBvmiu35rBv4wS
	dcbFhc71akMhWDlgV4zcnGX3h7VvtD17au0AzrTgCVpEdUt/xhORbI5XLqpKSXPOmHjWMjc
	dHJtqsXev19VLOOuFjMNzwcaaMlrRLnYU1JDPpo1ydhnPKSFlGhgGGoW7dCB3b/9SGuOhO5
	M1NrwD5Ul7d7dSQ6t5HdsZb56ocMp6qUsUXO/KCuH7M14kbJGlt/qYsuwZqiLY9nqXwvVnO
	OBca06q+zL7/7NwjyfI4+rEExVT1GYYQiNv0ExILcaNplh4v+ChtMjFSJxkGL0E+/P3aCNd
	iU3aSuLXoALnr7MtgS0HXz7MD6tleurbAf0rcIFS/k8038jcbPfEyzJwAVcxIrcDgX/jbLe
	3LV2Ccm7oUmsq9FQNlVQ1x2CVPVQqNj8lyNiMBv5CBiJUt2ZGIxLGqF5rohPGuBbMIEREht
	bKwh33tqCcKVoGsX5P5fhS5GR8ckeZtgj7Op6bHJJCzYh9GPfcZBQwbyRl7DEIWCnmEC/p9
	/adIGJrWzzdCG8MAJV/+aewgUMSZGF0LH9skdz0y4J/9JEGCTKr8mWYP3xLuLIUtzQA+int
	Msics16oGU18zR6FfFYJHbWLdP6JoS9yx497ZlLcz6YTW8MJjLa9owJin5Xno77RhJtFz/1
	jzWkGnAZP94oQnXPERT/B+HztiTvN2+Znts5qKj5Vs5mpp8vw6oPk+nUQvWtDKPMnGzltDh
	g/n6X9jL29C7m0Y5PBtdOQbWbJuINLzWVNhRTXUCHC1G5UfiP1wxttJh79+21uulZz19ZnJ
	q1H90Iy6Ix5gEqsJ49NZZDctNTHfo7p0+5/89LLhxSMmWL9wEy0s2TlRn7lqMmL+0T0kuVB
	OulMv1Da90A8FHuVk0kFzt08gRZKxLthVNB42PzhzfrUo8uG9nI2mkjQhrRhL7N7NUvMpPY
	GBv5efhdbDhON4qnPAoeB3JtjPf2HYkp7MW2pM/bLt+cgltVsSGz6yvuV9Jqxm0/+EZyH1e
	WBnx+Tv+yKX
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_185504_419989_33C43470 
X-CRM114-Status: GOOD (  13.45  )
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

The K3 CPU PLL rate tables currently describe only one rate per PLL,
although the hardware supports a wider range.

PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
support rates from 1.05 to 2 GHz. Populate the tables with every
supported rate in 50 MHz steps.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Cc: stable@vger.kernel.org # 7.0+
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
The corresponding U-Boot changes are available at:

- Add the CPU PLL rate tables:
  https://github.com/spacemit-com/uboot-2022.10/commit/787b5cf44c8dbc99db886d5522c0c9cd5a96ffd6
- Correct the 1.10 GHz and 2.15 GHz table entries:
  https://github.com/spacemit-com/uboot-2022.10/commit/16a775c20e9efb54ca55352215e76eb3f12e6cf0
---
Changes in v5:
- Add a Fixes tag for the commit introducing the K3 clock tree.
- Sort the PLL3, PLL4, PLL5 and PLL8 rate tables in ascending order.
- Remove the comments requiring the firmware default to be first.
- Add Aurelien Jarno's Reviewed-by and Tested-by trailers and
  Anirudh Srinivasan's Tested-by trailer.
- Link to v4: https://patch.msgid.link/20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com

Changes in v4:
- Expand the update to every supported PLL3, PLL4, PLL5 and PLL8 rate.
- Drop Aurelien Jarno's Reviewed-by and Tested-by trailers because the
  patch scope has expanded.
- Add U-Boot references for the complete tables and corrected entries.
- Link to v3: https://patch.msgid.link/20260831-k3-pll5-pll8-1800mhz-v3-1-530ed0978615@linux.spacemit.com

Changes in v3:
- Mark the change for stable kernels starting with v7.0.
- Add Aurelien Jarno's Reviewed-by and Tested-by trailers.
- Rebase onto v7.3-rc1.
- Link to v2: https://patch.msgid.link/20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com

Changes in v2:
- Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
  will be handled in a separate series.
- Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
  patch.
- Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
- Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com

To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/spacemit/ccu-k3.c | 92 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 92b930d5ff30..39df15c8a3e6 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -30,14 +30,87 @@ static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
+	CCU_PLLA_RATE(2050000000UL, 0x0b2a2d55, 0x00005500, 0xa0558686),
+	CCU_PLLA_RATE(2100000000UL, 0x0b2b3000, 0x00000000, 0xa0558787),
+	CCU_PLLA_RATE(2150000000UL, 0x0b2c32aa, 0x0000ab00, 0xa0558787),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
+	CCU_PLLA_RATE(2250000000UL, 0x0b2e3800, 0x00000000, 0xa0558888),
+	CCU_PLLA_RATE(2300000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0558888),
+	CCU_PLLA_RATE(2350000000UL, 0x0b303d55, 0x00005500, 0xa0558888),
+	CCU_PLLA_RATE(2400000000UL, 0x0b320000, 0x00000000, 0xa0558989),
 };
 
 static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
+	CCU_PLLA_RATE(2050000000UL, 0x0b2a2d55, 0x00005500, 0xa0558686),
+	CCU_PLLA_RATE(2100000000UL, 0x0b2b3000, 0x00000000, 0xa0558787),
+	CCU_PLLA_RATE(2150000000UL, 0x0b2c32aa, 0x0000ab00, 0xa0558787),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
+	CCU_PLLA_RATE(2250000000UL, 0x0b2e3800, 0x00000000, 0xa0558888),
+	CCU_PLLA_RATE(2300000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0558888),
+	CCU_PLLA_RATE(2350000000UL, 0x0b303d55, 0x00005500, 0xa0558888),
+	CCU_PLLA_RATE(2400000000UL, 0x0b320000, 0x00000000, 0xa0558989),
 };
 
 static const struct ccu_pll_rate_tbl pll5_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 
@@ -50,6 +123,25 @@ static const struct ccu_pll_rate_tbl pll7_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll8_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
