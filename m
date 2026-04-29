Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7FAFF8864
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6S1SCFrIkAsAhU65x/mHB5K1UGUM/3M/d/85gzi+Bp4=; b=MrmcSDBF9stnhD
	AzH0Fc2i5nklqCvp2f7v6Vvm5BTv5SyW5Jtd7Kict8WGW9m3cLl+c8RlCJ16FKDI92BhbgFFPI5ac
	HNXnNaCTfB1OLe8MsuruA0CNhlfNSeAbn6tRVBK6Z1WisTVIRCCt02sNCrQ6ANCecp5mx/hID5RDQ
	CK76vHwT4Zs7h6zUbs0g6Wnun4Fe25h4qAv6cgLVENv+iwV1ZwT/I41lX5KeLWzajrQqcngsX4kmH
	MlG5c7IUpE0z+67ItX8o00mc0B8Jp3eSzXTlPbpy1pUJQMHxtyQp6qsrgeae2ST83333OeFI4MPIm
	ZWSCYXbJe61ZeMu2ePGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0nW-00000003HFO-1f5M;
	Wed, 29 Apr 2026 09:01:34 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0nQ-00000003HDA-1UBU
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 09:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777453258;
	bh=5hbBNXyz3ix3md8y0mu38ycuDHtRftKDniRKPAgPjQM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wr0V2bdQ7/FLVeEedcVrhpus1iz9j8DSJR3P2AZLSeCrFAaFO43u7mGySj7ZOPWsd
	 Bn9jmrzH4a1Xt0rAdsedHIEl0EJZtf0KzCmaPXCcUjniB9sMU6gqpuKikdtPI+8IFT
	 9ESpoF8dBbRLyRu5EUGWRkzrJo0t8hmk7K3uSLuQ=
X-QQ-mid: zesmtpgz4t1777453249t984e47fe
X-QQ-Originating-IP: pEucucTvef8aPDvCE3KgxZBoR3hZDvm5CXh2YLLOWiE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 17:00:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 926023287553214828
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 17:00:50 +0800
Subject: [PATCH v2] ASoC: spacemit: fix RX DMA params not set when TX is
 running
MIME-Version: 1.0
Message-Id: <20260429-k1-i2s-fix-v2-1-8d67835aaddc@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNL3WxD3UyjYt20zArdlFQzg2QTM0PDZEMTJaCGgqJUoDDYsOhYCL+
 4NCkrNbkEZIJSbS0Ah468wW4AAAA=
X-Change-ID: 20260429-k1-i2s-fix-de60c4611c14
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777453250; l=1903;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=eAOCn8t3y4a8isApCxHiYqSR+fK5XKtYspJVmy3GquQ=;
 b=Vy6WZiz8bJMUqd9rKM5833CQlzF4sjRVemwqtDjhX3FbrYl+XOadkfNGqMERooDo1ivNhEk6R
 Ekl/ipCmWgLAbLbtn4q2IERKMwupOKPQ3k183KBUFNM41tAtX9y2vvS
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N1R/fLSnwNqMSix5Xgm6xjiJEFClwHohdjmLZyLAsUeaY29o3eJ0R+vl
	dWDn1a6BjFnER20QFsXFOs9n4N0Q1ssPvxebzlRJlV6tf1j2ZLgqLiaoke0/iQVd9vg4N4D
	gQElG7LlIds5mVIxwcu4vFDxpdriet6BbsLXVgqXRSmWtwN4nTrnU2K/DjihG2NB33qbZ3Z
	kBM9fAR+Lclg7CQYKkIlQAnPxmdI5Dj3IUz1p9CpQ71zy0ILRy5mPzPbvoP2sHaYZc4tU6r
	aHYhUM9ZltEup1SZk9YHtR53mh/tXydGUxz6bcHxzJUNpUbry+vUN9AdNS1vZJopQZ3k8d7
	k3Ndej2F6nCbOxHwXwXlpORnwIzPDYYmxexyfUc7C1jF0ZaMf+Dbpf/wY3LYgaGQQqPrWg2
	dE6MNPx8f7GEzPrMSaGf3tRLrMpqxfr4KMa2CLAQqhYh+MPUiNYZZKSS/4UaFxwqiEZyEyy
	H0qt7em4DVAOmyyno/DUflpxLKuiV6GVNNt1EP91NsRvU9RkOjzovVXkV+xRpOP/ahMJ/bs
	vMUubZUqWu7LpMPO12Tm08PM9SarxEGLfyqSZ3gAcBgWiqSOYEKh28c3dZh3hlTf7nu8Pbq
	a/OD83VSXWRaW3ThxnTjwaMDPe8YDGxGqvVVwQ2o555Nd9qVkgduQoHhsXTv3u8C8PdC6x1
	QcMypWipbsYrz7zR2zKhjxn9Ll2gHeRCQhF/INFD6cFwThEW1v1NAHhv1AwehSy6lkkK/gI
	ot75RxbLe1CUHVAtEVlwEP14P6hBol/icck1lqTmAyVgz1jpyUSR7xwwGHFXWCj45Ud5NMu
	RoESge66h0gXBfFT/gu5xB8J8P6YxDhPyCVE+aijFYqN7x6aAs6Sh+8acxD2xoo9vW4OgLL
	uddZ5i70AYJQFWPGYeC7Tt9fBLI2zwN1WgCxTUzSNQ5IbbRsF6saezJsHCjOn+rwn/SVGd3
	4VLCOrXDMGle6TQGwzVf4AH9EWVxS5uAd8kjd6HyRBk0l0nam4mbakBN7iWY/hOUDb9oRLR
	l7GGnYHGiEG6DI77hSVT2C2ueqAYyakuc70oXYGNkXF09BfGqSv7zxEy87+HM5xDMS5HAon
	/I0ncaVfqB9QgAlX1k9Ya0dOPWz8CrL7rxkyMDOLcxoP7QqW0s00fRpNsWH3J09f3v/fLu9
	CJSQ8xZf6g9AXpk=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020129_056149_E9800A4D 
X-CRM114-Status: GOOD (  13.77  )
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

When TX is already running (SSCR_SSE is set), the hw_params callback
returns early before setting up DMA parameters for the RX stream. This
prevents the capture path from configuring its DMA data properly.

Move the SSCR_SSE check after DMA parameter setup and format
constraints, so both TX and RX streams get their DMA configuration
regardless of whether the hardware is already enabled. The early return
now only skips the register writes that would disrupt an active stream.

Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- Combine two consecutive SSCR reads into one
- Fix Fixes tag SHA1 to match the upstream commit
- Split from the original 7-patch series into a standalone fix
Link: https://lore.kernel.org/all/20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com/
---
 sound/soc/spacemit/k1_i2s.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 1cb99f1abc7c..dccf6dcb72b1 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -117,10 +117,6 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 val;
 	int ret;
 
-	val = readl(i2s->base + SSCR);
-	if (val & SSCR_SSE)
-		return 0;
-
 	dma_data = &i2s->playback_dma_data;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -181,6 +177,9 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	val = readl(i2s->base + SSCR);
+	if (val & SSCR_SSE)
+		return 0;
+
 	val &= ~SSCR_DW_32BYTE;
 	val |= data_width;
 	writel(val, i2s->base + SSCR);

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260429-k1-i2s-fix-de60c4611c14

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
