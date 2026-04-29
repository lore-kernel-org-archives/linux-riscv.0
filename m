Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA0FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVKd6mJPsWJfqVLXtN/hksMeCRN83c1yLYLpOEipqeY=; b=XNe6JflncWrQJz
	n4uY9bOBvGtnBEgd3ILZiQjaiC1OzFlwuCrq0dcFhfWD2px/deQjME5c/Dq9/lLWGSkomzEss41pT
	B92Wk68cIpmcArHA7TbtbSmbbh5N7+u7GetIZBTQha7E2CqDuqsQwiCmMedV9pvigAu84yRRXa5k3
	Nf+80pt+PPmIeIAjzcyTWMprhjB+PCMjXnB7C0EbyjqWw+Qk5GGAFi8dHASXPlbDA+37MGRzrICA1
	wVFqOAkdPwTEPXU1dxDJqrW7gIhNlRVCKupq7gYy44jazsvf45ijR647ah7yk7rjvdffilg7GnXlz
	ALpOfjJscGmLDoxOEXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHttt-00000002j69-2heK;
	Wed, 29 Apr 2026 01:39:41 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtto-00000002j3I-1eN1
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 01:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426747;
	bh=umt9s+fWxPSHuP81XZcEF9uKcHi4dTg/6NHhQ9slX2A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JgtAV8ft68Szvp8ycIH6DMD7gp6db1AlWe4GdtUUEOLMmHIHj+9R1z3ZheYZ2VDEE
	 RBFHEAN+cICKiZ+U6OlKiZ5pP/DZeXY2k83nLWBNig5h3e374c4KDZaevyGJDN1Vw8
	 6XjPk+/nwITeKsoWEcOR89e8y3CWvL1Smo1G0QPs=
X-QQ-mid: esmtpgz13t1777426738tdd87611e
X-QQ-Originating-IP: vWIv63VhrF74ROnm/3QKqWXpoDGEYGEsALkQyVl99SY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:38:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10487816630640131910
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:46 +0800
Subject: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX is
 running
MIME-Version: 1.0
Message-Id: <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1471;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=fqs712JSCd2q2Oqmt1LbqXOCERM/xXmlTc8QrXeirL0=;
 b=dOkNR7ewgmOY2VvQT0HJotglsEmMZlVysXzc+cYHBp6B84ugDG50p8cS5glYCM8tWSKL89oW4
 GPOpMOXWpanDhly6ItJjrKyqP673diM7Q2lOO/kPQfEvnQtFmta0DYt
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M1PzqxMfCONkR/wmBdc2hGkNDOlGOCx/Gugq1LWihXnuyYH9sJ9H4UJn
	L3mWVqJGoc2vF8EoAv4WHDEVgOeVwJ1YMntg3hA517UPddcHgpXDgIx1g72wLvGabJQYe1U
	uzJUcLBtvuCXC/RqqH7vxenu1vewI7TJ1+aGZe2Jttv71N9Rtr47rA7LPUNbwk9ENJCAArV
	SoPvSiAdJtHB5bT1U+B0tGg+WjxjX2db4drqcj0hQJ0sP/lk/+rwNsgJ/+TNcqAROXofYKx
	vYjJFbvvRwOJ04/IthEOB2j0kexf3H13QpGqjFUNnn3ng7suGMws4VtWE7pS1iJHXBF+30u
	XhbPg5wXlPGlmxHdNn0S0Wq0kc+co+r8HHz+6hudju6dZSD6goRLiH5EwzPAHAGxUnW8diW
	RXxx9ZH154DmcA41pivb6v7vXGj4zDjb8ECmhTt3JMUSy4gWxY/VUO3SHPH5FFAvKbBY1vi
	hbjqtIrMDKOwN+0sNHRdmVmBbl6Qisvwrab85+RGdM0mkwFfZyf/UKoVXzbVNdvhzNDRwP8
	5eO8hiBSWuXbsHyZIqFI4zJRqFUP2OUIfucjoTuJJL8RyBJmmz8kHa7BFS0H+x9fTuYoW6f
	iqMWFeWTTf0VwERSfiLo/YpyFq8oXph4Wh74HM6rZZXksAPJYpeBRgXC+MRLc4mFaOBSt48
	wu1J7NEW+ed3S2IPg7Ce0aA1+veKGk5WMen4ucxlWuLopjUFvRlS6fTSyMRXXwnF1Qu48+U
	FJKPwokgm6WmTT6YKmTv036Xy8hFWViORVPmmkTXsL1jWhoqtbsFrKrOyujU3zb3DzalRX+
	LEZLnM5u5dlmElcVVnwPjpqdIkm6mPT2J1UR+Eh5C1C4eboUYytp0ujnQlfC6zEr19i1Tr+
	G+/VzblWREsZhRauVBWZXpj1Q4W6pq3DcTVT/MCk+TkIX/FCry6cqraq5qI0rXmg+bwMoab
	xyeTyl2zd7S7Qc6p9dwu9qNPsck0Fpy7Pfs/O6d9Ftl6d0q0/qL27Zonin+cFy1/2HWk6Kl
	bo7rPTvXvSC7+aUzAW22Kv+rHbB9kk1dtG6xc2kg9Ggw92KFXPyskcbmz4cmP8ma9TbS1wH
	HLlMK24Vv2d1kXzxYzqdWrPxDYFVOP/8OA7XAUkBtoGpYvz9ZDubjx8ecQqAZGLtKnCV6mA
	zm2G
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_183936_787201_3E81DF87 
X-CRM114-Status: GOOD (  13.26  )
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

Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 1cb99f1abc7c..5c878f02cc93 100644
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
@@ -180,6 +176,10 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	}
 
+	val = readl(i2s->base + SSCR);
+	if (val & SSCR_SSE)
+		return 0;
+
 	val = readl(i2s->base + SSCR);
 	val &= ~SSCR_DW_32BYTE;
 	val |= data_width;

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
