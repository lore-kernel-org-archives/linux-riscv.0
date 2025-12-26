Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CDAE8FDA5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQFQuWn8i7ZgsIY64UiF3MMzceS+9IiPdYTy1Unt0pk=; b=WbnHqDNtFPBDYm
	QXLoJ6sZgbTjiGs8IXSblJbWTsyDd+krprJAdC9UtUq7rrznAKNO8ByMPi0vswwpr97p+RppZb73f
	+zROI0dE/pdEfNFH4c15Rvwbh2kwVjWRwfEZ9nd12tIkTlBSFfPovjtnMVesgi4ATxuhIyp73qT6i
	Nf4Fzsckl1uLzWbKiDhYCDKl6Kj/nOBIdAEqZkJUDmn10SHCwx6NHwTCAxMOCvAgSy7SB7R9a8q3c
	dFaSK7EHcoswHnQVyjujsH7rpAGWqmdftYrLxlPSpvOpy73uemOA8fkx6oZwI1gi+RqCbu+RD0hOt
	7uHyCkFZDwTzIEaOHpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3G3-000000012Kv-1s66;
	Fri, 26 Dec 2025 08:33:11 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3G0-000000012Hc-3wGi
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 08:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766737943;
	bh=q144s+Pxl/YxIsHlfK2SeNs5pf4/4KxmIRh1XcAJfTw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ufla0bYwSK2amOo7gEdg199je3q4b9owsWUHJZct1Ik/6gW13XSNREramQi5gso4D
	 Z+dttbxEpFHSYIh7eXCJ5V6B0+aDm0U6DDy0UUp/vyNraqN2fMJFviQZjoFS+08yoe
	 xoNxHu8bo5b11EPztRn9yBYCs75s2wetCJ00fno8=
X-QQ-mid: zesmtpsz3t1766737937tf0740520
X-QQ-Originating-IP: fBMC0oz+qlcaXygVvZVVCJP+JsZzqHCoEj+yiZMonz4=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 16:32:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1856170875034812761
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 26 Dec 2025 16:32:01 +0800
Subject: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
MIME-Version: 1.0
Message-Id: <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766737924; l=1201;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=rZVjpRq6diTZDodTgrmoHPQRzPHbVK6nvZDYYBcO8PI=;
 b=jpYwIH4OkDuOt9w3reh51VpSYcGMuiHBl4FOC9ZnknYAMeR/Jfjh6jb3/8XpNJc7l6KDPBqa/
 P7cZc0uEvIaCx0slzGfd4VRRQe1kBmTTldGeq5hE9zgY7BTPAZemize
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ngwq0BL9nhqbWZY7lCf2IIsITybFV6mN3zjf6mm7u6sz+zDtwZEc5qCm
	weyQSRfbzJqWlEMvpiqF4EqQnoNdPyWQFUtxe+7FunXLTesJ1PVzHem5BU3vHgZYrfEOoIG
	BA4Qny/qpPLl4cT5tHN4qB82bektIxshyLQNs70nWauDXEPGQ9C+iAOiau/hTfVjsk/8O7G
	HDXdCfFzU+h31ps2x61p8C7UHe8hqITez+RgFUXyC7SgJMNjT5T8NeKJ0EjKdqh3RLDKdAk
	SCHXmDuClwU+tbaHyxn7BOmYvB0cGHvtccvNO/xtEVWkst2GN4paiHwiRz+hlVeGGjPw2Y4
	KAX+TpT2BRU70qxuhC49ozulFQKgnroRTi0cSfmoEm/7Q8HkXwHBL9bB7w0dHiNdBvpzhEZ
	i4azMgfpu+jU0Tb8wx164yOGqud+kpOxU/7PVKONHbCrxv+F6fPIcyrarQY9aP2xaN2nmBP
	qertTE6Emsyt0I9B/sHTuke4PmVJSHlRQ69SUnH6+r/8PWi+I1e+Q4H2B9BoUzKy72AJwHD
	cCmLlNlYF/tbHzqC71Rq8XGHYYxt7oorvsKPYMC8+X/HYgEBw0udk73mj8pQZCZG3AOivgH
	wiIriZfzPO52QHWV4DkM4kC0bOLvQApkjo2lzGO1UteOPn9az72lJ6kTMlmwaRuTM+I/3pN
	ZcRI9qNgjo3i3xeqc00k/9UejFpnZVrWRdwEBnnhjFkjyl0N4zC8NMwxkGKFD+V1JkclVdg
	yElZ921Xm8XCqDZ5sh8OtVh/PDwAmSJY2j8BiReN3bawcbSQOH2EBwoZFFbG0VgDeQTjCOf
	W8ogXPLZ1E8DNRLO7OiEbARCMDcAkklMeG2aup8heYWNUVv9XfMAZZgHsFhvHMYHFB4lhzo
	WmlCKKugsc2U8+WIv2La36VSvCYCC5Bo0Vi6ZXyFUWv4DwfZNbRWABX+ovUq7mtkrXM0DV2
	Xl0zLD/BLgheBScj2skLMG2IvI3oxhlOYJDERn6xGf5lCmYFXcfxeBDlV+Fi5RccBXqaxmf
	pktHzib4DyiYn5aFaN1dviqvjPedlh+HvvSft3va/UHOWriot8b9tbPsFGG2xqUy/yra68f
	OliGDZxupXspFEo8fhH7kw1n4XyH+GkPP3kLsAfi2HA
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_003309_432403_E6C0DF5C 
X-CRM114-Status: UNSURE (   9.81  )
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

The clock-frequency property is optional according to the DT binding.
Do not emit a warning when the property is missing and fall back to the
default frequency instead.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index f0c35e23f4f2e139da0d09f314f3eb0e0462a382..c829618a66a214a12b46d63bf06ba7947b9dbbb8 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -651,9 +651,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
-	if (ret && ret != -EINVAL)
-		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
+	of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
 
 	/* For now, this driver doesn't support high-speed. */
 	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
