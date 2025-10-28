Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516B7CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 01:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jDyPOxUCNzU9wLey406iFC4mGQXgLweWfLurTYFi28=; b=zG0aoJHZGTEEMK
	Xh9UdWCweIiKFP2cXoYrmZNpd6+AoF3D1Ab3nGYQASNwKfmkKDLLKFVYpKzQAfGAKQ1BS2Z+n9We1
	0UQh1E5dCxacoNs385RsP7p9Crq2zvlhNY7J7dOwn8MLVkSxaTw5uv8a5YHy+jWikz26I0hBsZRTd
	roeLovV3VpQkha1FQc9RHyHaPkOx/Spi1pkNb9hbjblwNQxaSGukoVN5mRSCdcFs4rLt4bDIHi1AV
	vwUYAhBe+3bkbT0QUAPlrGQP2kxlOvjUU0L0nm6PT+Y5nUVMUH8zERORx8+hBHMfxacUJxdrVT9cH
	rh6Vx2vmmZOAVir3hnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYab-0000000F4VN-0kHc;
	Tue, 28 Oct 2025 01:33:33 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYaW-0000000F4Ua-3bxB
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 01:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761615153;
	bh=0dS9fYCR/0pXGPLknmEzfDFk6v1ODm4sLoh7xa32BBM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=AorSc7KAwGJTI9AQOiEtDvv4jWO2lspPh2zlVh5xqo/qSpUrvA7XqglbSr2q/25oB
	 MYkB2SSBHesQcMeANeOw65y7gqo0Etvi31vr8ulrn+pARCw7IbpZKkJIXZXV4ZzU5J
	 +H5ZVWizn328mJ4abvACP4mDgqeZt9mNpJQ8ncR8=
X-QQ-mid: zesmtpgz1t1761615152t951540ca
X-QQ-Originating-IP: d92L4WkpQcs1b1VRFxPMab1MNZMS5wRJByGNSPovtC0=
Received: from = ( [183.48.246.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Oct 2025 09:32:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9311238789596547588
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 28 Oct 2025 09:32:09 +0800
Subject: [PATCH v2 1/2] ASoC: spacemit: add failure check for
 spacemit_i2s_init_dai()
MIME-Version: 1.0
Message-Id: <20251028-fix-k1-i2s-v2-1-a547c15ed5c3@linux.spacemit.com>
References: <20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com>
In-Reply-To: <20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@gentoo.org>, Jinmei Wei <weijinmei@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761615145; l=1211;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=+5msboKAog008UGEttz4U+fHm+ScOLfQAquNVMiSBfE=;
 b=nfq/IcYWbKCjNOvIfAQwqrVxnuhMrkpCdsxu7SXWLQJ6q7a0hGNm9xy3G6PhkKHhK8m5SDZ8m
 uTIqf8R3B+YBoXeq/puj1gs3u0WzuNAgEULk9G8eO5D4ifutkCj8TJM
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N8FRh7sKUkL6j2RanX7oNBTndt08vL18TnYlb5+mYDhOxQhGKf6Q/2Pq
	OGXyKUh6gnpORhwxgTMEWSZN2vthg05WASmPl7S6UOQjATNozjKun2jWYWZMszuqcsbkKOc
	HbmbyAgC7r6K2LQ+Hsl1EQm2r25G0ZT6ttk951OcCfq6rU7mY4JedE7ZXi8x0NKxS5PWD0e
	tzJv/Mq3kIJls5eVVhBOxJj9/HJ76CMwSRI1sKwmpYbl9gsDxOuwr0n29c1yXbcYg+rGJQb
	ImJbEc44idlL88wxeryWsFZN2vOxAJ1cA2lwXSwI2QbiyZqZucEuq4voJw3/OKSRcNU+j71
	556vHTKw05+HD3Fy26SgyNN3TtCSqpFYqNQGtwS3xT1qpUQoNDH/Kr205KCqBmRWqUgvH6y
	B5JN53SuwIvshwH90y0zOQKZDv0AOn5XXGCNIf9nebOXDVZ4dKEFQua6GWpFD4kDVU7hiK7
	LesmV3ndQcEETWJYP7a3yZf2ZSh3xzVJdKRl7QxrpWNWNkph3D593lELElg1SRsGkUk1FcN
	siNxlhdhc0wYJWHLXhswfw0q0pBn5JQpoQ54g5QyRq7TEJ8lAn0SV2vBlUWBetSux3VWi36
	RpfvsnmvMxRaKstdjM9NXonG5FyOumyJtPnO5NdB6ne1GL+ilW1w/k1kElaxqP4XSeVIRq+
	6K6y0tiXLulk4DX9ku2aChrozIj+FiwsU3VhNr6G1Akh7nmoyLjF4FS2Vr4nKgkOTcSAyOi
	Yv/FgdPA4kmkc5vuR2yM0ufnXwKjpCxiG1F/ybLYUkpWI7B+Sv75BLvjOYAX3+yadG+R/G8
	fhlYz10d35bH5gvx8TAgvd52JcxMXDyOhnrMb+LQGSyfu4khlVl8pSkgbsJswAGVOQzsQZO
	kX/Ddv6LvCqvsylRnpw4CbNkseCIITmvGGhu/VrK7v0FSnGVg27DG6BUFW3ZnziqlCS3fW1
	bf+g24e0GTvC6WXXY5kdPgvKMFo1ACODAz9+SvrPrbEialXiSxgMtIJVp9vpBDk1qW8VZdC
	IP5R3PMAAzE3EzqzdEgHhpvu5fkvN/jglb7qJPacoJVp6apJ4X5tmAckBJbcv+6M1bql3GA
	M5ioD2BGH+UHAlYzinpHK10nsLDCzTlZf/wWOanchJ/orEiA0kZ8dM=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_183330_322679_DCBB1843 
X-CRM114-Status: GOOD (  10.24  )
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

Add error handling when memory allocation for dai fails in
spacemit_i2s_init_dai() call.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPtiNCZ_KBezL2Dr@stanley.mountain/#t
Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- fix tag
- Link to v1: https://lore.kernel.org/all/20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com/
---
 sound/soc/spacemit/k1_i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index abc439b53e3d4358570df2e69e636bf54820d9ce..8af05e1604f518b63cbbbaa66b73cfee8262d87f 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -428,7 +428,9 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(i2s->dev, i2s);
 
-	spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
+	ret = spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
+	if (ret)
+		return ret;
 
 	ret = devm_snd_soc_register_component(i2s->dev,
 					      &spacemit_i2s_component,

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
