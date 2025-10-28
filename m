Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A406DCCF9E5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 01:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9Dy0rYY+C0+uKJJrodv6YWBp5mJ0SZvy3eVGoaqtF8=; b=z/jeTjpsofdDGY
	1U0N6nQJoKCjhxJ7nHe5yxn+QE92dpZtAIWTzygP2Oow5G+Pg2JTwadsOsd4zaoR5cjIrMj9tb7vO
	UvS+QtxqNYSiPGmioal7a6LEvBmApqOu6USi59DEP9wNz3TfsnQScDTtTd+CTUs/TxbpnHKxgpKr+
	YWikC0C2XDLH7XPgKzI5F/c9rqE2KS+T1Gqyzm1QrmQHEZyVVhjJv3INdwEOWrkWBxCXEe9ELdnOz
	4e4kvf7PAbjz/JD5EJ3CW7SgiEZGiXxL9m2+W7yK9E9VmBUI7z9v+lEqkEBO1IBJ81HMSiDB4yRLl
	Rnk9tBsxYk7Vw4TuOTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYbC-0000000F4av-3X88;
	Tue, 28 Oct 2025 01:34:11 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYb9-0000000F4Wy-12pt
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 01:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761615157;
	bh=wSCQMvjLrBLNf5FX7IDdcyBql0gKoQDnL87jngKGghM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WHzyoKcoOAdw2sUwGqw9ugfAe5PyEMcMmz8/mBza/b/g5j88TI9bH3tlXHz8MFZ3H
	 w8tCPCunRiHD0aCw+NlNXN/OXRt8IXjQZGKt6AbHAhEjp4WCdS2sGOBnBlkR0eTcGR
	 K5YZCmDPCEB1eGm5nId2HSUss4/P7Sd4rbQhD4Ho=
X-QQ-mid: zesmtpgz5t1761615155te7b3f33f
X-QQ-Originating-IP: zYhKlthU7CIU0Jej9Zs4hktewHtXVQCI+5u9h2T/gg0=
Received: from = ( [183.48.246.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Oct 2025 09:32:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16365730684758387002
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 28 Oct 2025 09:32:10 +0800
Subject: [PATCH v2 2/2] ASoC: spacemit: use `depends on` instead of
 `select`
MIME-Version: 1.0
Message-Id: <20251028-fix-k1-i2s-v2-2-a547c15ed5c3@linux.spacemit.com>
References: <20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com>
In-Reply-To: <20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@gentoo.org>, Jinmei Wei <weijinmei@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761615145; l=1132;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=+67PEqmzb/LxXS8vH/GQ0qhgTnbL8aAKvZ6J79lPqxw=;
 b=VOWimUOVSwFKWgSLTrUiIufRFt0iUVPmpDwW51/t5wGbzbSxDMEhrsR3Uq7MBL9TRUUXOOcca
 Isi0Vcpdw0lD96nhYSnuNG6Jh6DoHxU7YdQ9AeJ4OZgIlYY1Vjc0Ycz
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OKX6byuwCvg7cP3ud8MQUPeHZXSvWhUS1PFKuyXueDozw9veylqBV9rZ
	7wHdaJ7xkpe5dcdD+ODDTr/wwk7HtWLp6RTPWI6z0EFPAhLapqlRJkBmV/E71t2ttSDM/Hh
	2RyJ4ZiFFFczJQIRrV5dfn/7SvtnZ6tgVJTRYrtdpUB/36XrTu0+Um5s4WK4yfPTsGeq5YO
	FCiD96s5HD883w0T/BlnX5spptZQd8W7V33AE3MDceRoWKMoH5UvDlAxJgDIJBrZj13Zd+G
	dOZjjteK2qkmdplNBz6Lc1KD1VtVGwEFtZzUA54KhxYCp6LqNob1vJAv/QsTWIV25s1F7h2
	Jj7uhJg3Foj/m1mqnz6MQV8J0krFkJQepO/xXX0NstQXDvpA8uIiO5lAiO6/foVs2DphCM/
	c/oWueqb8n7vGJizL97xZUW+ZrbdcP9owUewfivmI5UeWTkr7UNHfjqwKEpz5HZqjbBXsPN
	K63jMAarZg8Ibu50V1cl1QukT65NSlmWlZFobp2PiI8c1Iu3lcQZiFf1qtZfOJH9J4UKXmD
	Ai2W44gWrJ+M933o9kc862epRJUEtli/XEDc3ZI2Z/de+CQUZn9wYPCqlv85fh6H+pLI+N+
	d8o24Sgd7hsQNnvq9Pe9UCJfFWPtKb8m+wFPTQmIwdrk8Bzc7aC45oEbj8cZcW2IiY6WT4v
	AQ+xj5nPcAzsz1CTPWnyBGWYEWipgEt9AniJfQrxphUcRx7GkCXvRm6MW4S5EBIBpzw2M69
	SXNPIjecQzFMz8EVDc1q7+TyMOzJnWfQlTXCxtD5eHQsqJEY1gI8UbQ8x37I/H9Qj7bUlbr
	OkPVbDetqIVHIH8GjAx1iAsBIIIqwbhmqv3y0CNCH/OOm8z7M/bx9O+SXP40Bszsk7eUkO3
	S/K0ZLJ0U1G3qbfAs/M2hBUPZQcIn4jwTKIPmQhtsefahgregrqKc8LXG0VtgTjjinnNiQC
	xfLSU/pPgruiYOBNyhaEhH8+dWTNEHdSTbvm1wDz9bDCdmquNjQwVQAr11DhV0LE/kBc3SO
	X+VCPyhX90lJk0VpsbRWfAKP2qnt0PS3RTPDVATXA7y6wEFfRpp0cO7PUC621VYTurjVnXn
	vLjeUrvRCp8hCM+vk3pmfmzv8SbhLQn4qnu/gucFk2GAI9QgrlWIUJi+4Zty3vcmUccPEN6
	NXwj
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_183407_695677_BA65144C 
X-CRM114-Status: GOOD (  11.05  )
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

Selecting DMA_CMA directly bypasses its dependency chain.
This can cause build warnings or errors if the required
dependencies are not enabled.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20251022141705.714b19b5@canb.auug.org.au/
Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- this patch is introduced in v2
---
 sound/soc/spacemit/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/Kconfig b/sound/soc/spacemit/Kconfig
index 2179f94f3f179c54cd06e6ced5523ed3f5225cf4..e11f600a327f58681ce46df6e0e7a70f5f1d1234 100644
--- a/sound/soc/spacemit/Kconfig
+++ b/sound/soc/spacemit/Kconfig
@@ -6,8 +6,7 @@ menu "SpacemiT"
 config SND_SOC_K1_I2S
 	tristate "K1 I2S Device Driver"
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-	select CMA
-	select DMA_CMA
+	depends on DMA_CMA
 	help
 	  Say Y or M if you want to add support for I2S driver for
 	  K1 I2S controller. The device supports up to maximum of

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
