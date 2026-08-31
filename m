Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097E7C61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnW4E2Y+4jprjkY/wWJeSCJNU6z3GnLgkLzbenbnDUk=; b=H+GNZrWouZlWke
	rq0jWMrYmC+KavNmToRUbAq4f++3eHUgUZROdfsslnDAUhldat+ZLHxqhc34n9qGSBUt83WnfudiO
	LKZW83KnfQ08fB5Q5C6IbCY4QF75JAfS9AaQzEfcHEG6xfnKRi99dNPOV+aaFHlnxcLLQglfb4QVN
	AMj90PgW05tilzdhCW9dSGijYGQLLbUHUWpzvajhcRo1kOcHsc3MK7jo9Iq9x04tWntIFQuGMeMeH
	7AXakPHXvlKtSEppFWWU9lVrMThqDfVGrHjUL2hrQmLb5qCCQkYSPDCazXixnRVOQvVlfDB0CnrFd
	0H66ygx2GRThG9azEzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zby-000000098GX-0Tjf;
	Mon, 31 Aug 2026 10:51:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zbw-000000098FW-2dPK
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 10:51:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14A3B44247;
	Mon, 31 Aug 2026 10:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D851F000E9;
	Mon, 31 Aug 2026 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173492;
	bh=/83joiCqy3bsVNmIOD4slIc2iG9I+Ggc1WrYrebcBzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UbJy2JmTMoekm2chm/lqgQMBIX0OUqgcusqVxPZlbfPU12hTQaZNB8OtIV6Eb5UUK
	 M6Ckd6IOGgMLCIqF3h7mVtIvns2sFN0pNStQaKuKi0ehLjgGwO1mCpYEPWwp869hUF
	 IHUjmPPG8D8k32DR0rzimyflarjOTt4iiyEi2njGtkSDSzGAhcJ35CxNzXKfOlLe4T
	 T6tE98wN/wRDqwOeUaeBd9zqqj0GcEZehKPlMLHuJ0ay/KPUTYrrusXXv6QkQ+JZSl
	 s1gFwAAD6esAjztlZtQYQ1FxLpclZiQ152KHPwlF+EMobBr3n5Ec6FqcX5RPTQin62
	 EdfntawphHOMA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	stable@vger.kernel.org
Subject: [PATCH v1 2/3] pinctrl: mpfs-mssio: fix width of unused bank voltage setting
Date: Mon, 31 Aug 2026 11:50:58 +0100
Message-ID: <20260831105056.756259-7-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831105056.756259-5-conor@kernel.org>
References: <20260831105056.756259-5-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=conor.dooley@microchip.com; h=from:subject; bh=ef5QyPGGJU2n0wuvE12uE0SJbu4v0TW83f9BsxA1PHM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlTY1bM/5H9KvvpciHjyzcyD2zaF6WycTKHYWyN37HLU svfBhTM7ShlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEThQyMpw13dK4m2dap+WD 7m+Ch9YfaXex198kqH/8Z3deisf0yFuMDMvvaJ/6JTtvuvoSe1cN/3N981xO7rLZw63CExty7NS qAH4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

The bank voltages are only 4 bits wide, so when a pin was unused the
driver was not correctly interpreting it as being at zero volts, because
the driver's value for unused had two extra set bits.

CC: stable@vger.kernel.org
Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index 502624221aca..9e6d233804cb 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -86,7 +86,7 @@ static struct mpfs_pinctrl_bank_voltage mpfs_pinctrl_bank_voltages[8] = {
 	{ .uv = 1800000, .val = 4 },
 	{ .uv = 2500000, .val = 6 },
 	{ .uv = 3300000, .val = 8 },
-	{ .uv = 0, .val = 0x3f }, // pin unused
+	{ .uv = 0, .val = 0xf }, // pin unused
 };
 
 static int mpfs_pinctrl_get_drive_strength_ma(u32 drive_strength)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
