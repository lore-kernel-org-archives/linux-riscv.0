Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E5DF3092C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZzeY+DZkLKtMBMJcm5HYE0CK4zwjAL+B5llVUxn/CVA=; b=vh8iJAzfKTQUjE
	3bg25pMe4rqL2Z7uq8JIB5gy9J6xOBCa2sL9bsPDwcXuzjVWfEyqxlc0Ml5PIQ4rUoR0ZJQ0KnRNT
	pM75rQ8Xc6TdMKxVSkPTP+yr0B7wDrc8j1HTjrZUbB0LXAE0vx8VoR5Khs9ug8iYSYlOu2mFg9YiL
	EqEBOq7a7E/AKKizgyo9JuJyvSkdi2gpfp99P89hy7OpMJ1QdTJN5QzY4j3YAY2dGzmbgg6ycepgO
	xRJxwJGFyN4pd09IE2IaYDLWvz5Dd13srnnkyOliXOfVkDbcqjmxM1ktYyDBUp33UF36g4YCUlaWt
	T2op3uWSS8KyDkWgK86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy869-00000001oG8-18B4;
	Thu, 05 Mar 2026 12:46:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy868-00000001oFW-2hmt
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Mar 2026 12:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=pUlhsxKJln+rW8kzW1QZ1WnxvxiGGsR+VgHvKa+y9ns=; b=MtCPJw2f7DfiwMbJ1rbtUbV2Vt
	yvEBrCxjkvRWDECa76QYx2MAZGaxus9J7dZakdRpRzzgmVGzm/LOLy7HhW9hUXfNd2siX5dRvjXnN
	MnIZtOy/Z3+gw0Al6HqyzANZwSUAwlb7CTD5rfjGduQwiw6slbSWWZPYWh7Z4Uw/TnsPKgW8Fg9GZ
	kHpSccrmWObAl5QYMSQrWvweO+AXV7yNTS/RSqif8Xr+EAPzELLplcYszLoAfP+l7DoOOk8IRFTVx
	kqu/BNmBp2dH/bGnb9juOy0dKTA8mWmZsKRih+JtLQCFPy4HCCWsyJ6+qQeUmy0b+bVFBfJdu97o2
	9gk7Thmg==;
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy865-00000006lEf-2cGq
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 12:46:35 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fRTmz4R30z9twV;
	Thu,  5 Mar 2026 13:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772714787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pUlhsxKJln+rW8kzW1QZ1WnxvxiGGsR+VgHvKa+y9ns=;
	b=NUErKxvYverSGgEFZAMqpAl51M8lmsZAzl8neGuXaLf2ylHgQ+6NgZdZdUdLkE3a5pzQaD
	XoDtL8qB4jBH86wwBKxUREeM8hcY3VIi1Do+rdE3Hy3yoctuV5kLX8ccpQdXYEwQDUEj8J
	x+03jCjl3fDtQFjCkW6cemFIdkthYpZ140ko6KxmMOUO6zJT0S+/TO77a44Wos4zaEZ0co
	yjNZSAnXn7SuOF4BdDRQ4k22val/VvYm1e5d6J1NmUH5Ex/eTDjQObkHvszQUs+DpqRhLR
	vIm41m1qrmGjtgDTdJ/tkOK0MOfzf72osyy4w7HJTJBSjrAaBYkkpFg/ksQxvw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=S0YYrqZk;
	spf=pass (outgoing_mbo_mout: domain of shuwei.wu@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=shuwei.wu@mailbox.org
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772714786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pUlhsxKJln+rW8kzW1QZ1WnxvxiGGsR+VgHvKa+y9ns=;
	b=S0YYrqZkhp0fW//w8EMIRvU7g0BRjzA14DICNRCxj7pKMyytiYQilQE/6lxExTOUjhRCoN
	NV9241/jLrtF1EN18mOh88piPzFYdinZ+pEE8cIDB5qLkzd80j678qWl0vXGPOC5RAEqWZ
	fkIth8nr8VGujeem7pB3lJDVojFE8TfbMxWA6s51mGfWqVXi0sQbGjaZ3lqEAucPP/CZoA
	/tPXBs9m8+5GfDsjehoFyHtFhgnVmXzL0ApDcBlNqdGH9X/7V5/EJhNJo6LLLqjDNQXQ83
	44G1S89htEqaaZfGbUuWvsUBXJbYtT7hnEajWdIrj0KyGmF12kGk2Klv2Pd0oQ==
Date: Thu, 05 Mar 2026 20:46:08 +0800
Subject: [PATCH] clk: spacemit: ccu_mix: fix inverted condition in
 ccu_mix_trigger_fc()
MIME-Version: 1.0
Message-Id: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAA97qWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3WxD3eScbN20zApdI9MkQwPDZAsLE1NLJaCGgqJUoDDYsOjY2lo
 APR4xe1wAAAA=
X-Change-ID: 20260305-k1-clk-fix-25b101c88459
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuwei Wu <shuwei.wu@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772714777; l=962;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=YT5BdtExYpZoNv3snHWHiJP/l7vrlzxoC2+/p1/Mtzc=;
 b=36mh8wH7swNyMaDMB2jq1M36Hh06A8zDF/sNvVR9RrOowacqTfENWpmnlUbaG4V2Bt5IL974K
 ePwW2mAC+DCB9RBNFcg6iPERESS7VWegWhhbK1rLdvQzo91VQzGKl9Z
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-ID: b904c4551ad57a56bb1
X-MBO-RS-META: 19wj5p3km5xs7jumhi65q5cj9u8e17eh
X-Rspamd-Queue-Id: 4fRTmz4R30z9twV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_124633_828498_76BE2FA9 
X-CRM114-Status: GOOD (  10.45  )
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

Fix inverted condition that skips frequency change trigger,
causing kernel panics during cpufreq scaling.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
---
 drivers/clk/spacemit/ccu_mix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 9578366e9746..a8b407049bf4 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -73,7 +73,7 @@ static int ccu_mix_trigger_fc(struct clk_hw *hw)
 	struct ccu_common *common = hw_to_ccu_common(hw);
 	unsigned int val;
 
-	if (common->reg_fc)
+	if (!common->reg_fc)
 		return 0;
 
 	ccu_update(common, fc, common->mask_fc, common->mask_fc);

---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: 20260305-k1-clk-fix-25b101c88459

Best regards,
-- 
Shuwei Wu <shuwei.wu@mailbox.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
