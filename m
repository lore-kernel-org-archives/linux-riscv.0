Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E274FF885A
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8c5GeufPXptRWSCZQQo06A+7/En3Ry4QKLF0w30aUyA=; b=WO6a+/76iW6ODp
	bODuWzVOM+hH8FzJGGz4umx/FXvSA3prSqkJ0m9iKnQPQgO3m3khDBQqwH2VBixYohCG9c3Ol9t9e
	q7AfdHy6WyuRw9ZqBNsYleO7qIcaMd3DO9RXSDXmrcpMyOzfLvQAtec0VA+blG1U0DQjjCmrGjbtj
	NpmSWc1wa+yukv5OrOxxOYQ+4TOEvbTG7EXiJ7jsAzdJvPwks7XIUkF/Q5BtUVYC/p3IOD4W4XpsW
	qmNIQ/Iz4B6qdGCgVZvwX2Gt0uV+98Q8CN0y+FL6SI8xqcS327l5ct+8OCMUZ7tRSs3652uMxvPDN
	5A2qfOdEORjkrrklXmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHttz-00000002j85-10yE;
	Wed, 29 Apr 2026 01:39:47 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHttu-00000002j40-1FcI
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 01:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426755;
	bh=IhNm7b5aaqeGytIsBEHmKesKKDGy9a0voGkBOun2Fb4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JRN9kEd9TIfTE1lSDelpUXhy0yCcuk5U68M0Rr8TX2viRrVK5CjyQoorXI23dVf+6
	 ly/MYPv3bYtEJmfIRf9Nd8Cp+yxsjFeQfwyOubhELnJG76MRN9BFU7LVHjgobJJ8UG
	 P6g84woTsaIbQFubXBewxduiR5snssGArfgLeOak=
X-QQ-mid: esmtpgz13t1777426747t360c3668
X-QQ-Originating-IP: rd3CXtHqGvswSSKw6JZjHsL50HqUHdZsoRaXYQ+43t8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7139710470832578007
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:48 +0800
Subject: [PATCH 3/7] ASoC: spacemit: adjust FIFO trigger threshold to half
 FIFO size
MIME-Version: 1.0
Message-Id: <20260429-k3-i2s-v1-3-2fe99db11ecb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1063;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=TN3IekLzdp18HVU+1Rpq+9TEk2UtnO7ag9ShWepOCxY=;
 b=ec7QeL6JrXUVZ6cJTDvuUdDooCidwlmr8lArWG5oMoYjQVIX6WmJGiNfPdpsvXXfGLqXc069i
 /HyE4YCuvkYAufz1dVpsxL1IkXIvH2zfUQfXE1mxlIB7tMZqKJGy3L5
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPhn6Z3dSMVJgSxxaMz2qrwR/rWdpEdp4Kdb0MBNFzEt2sOizj/U56f6
	rCB2zlT2RtpWNSzU7nrguvP18Ci+iNtFfyfz1/fKTSO4LMaT/MqnOP2DDGw1Zv24452smwU
	Ep0Y7DodWnxNtRbJBi3qHWYvh2S005VnTIjBH4xjYF9af62eAl/of50gRqO1sq7i7SrBt64
	O1XXhrGvGaFSmZHfGV/hpetfy9c00aL6scLJ0NrshIFs9N6K0mFcmqp9zQ9Aqg+6GyXW1R2
	WOpzZuS+7PZS//Mj55/NsDqN89+PqCNA24nzlVuqO69Nu4INC7DNLkrQ4UjgKNhrTx6gEmC
	BWsfCzX12z8PRnzVVzoaNmDiWRSQABjDJmEGqJc64tJtRH4ocdaC5nLi59nZbOea1m5BPYy
	hR/ZvbR6CbFmrNo+sEYa78D+Hp4WLIgo1K9waSQPEQnGuQkF6WfPqvnIKtUzcLNJCZpLbWX
	n2Fc4GAw6P/2iOQrZ4mQEmNJUxZ+EnDCk6NeAOczUq96nmENWQHHkbrycVRHxoMJGeG+Td1
	Fkn9mhmeHNA+71QdYReLjt7m5QuUntkkAKvE5EdZur5YdVSOzadY+KzwBrDeEGGhFTjJhGF
	69mfW918TsPT0D815Fo0k1TuIJy8uSX8Wey8kX7UKm7Cf4IvD1FXAgIWjxCNRc3I4//PZAL
	q0L+nCNS27Hz0B+HjbCixPwgnDDbvodsX3ssGk1xddvDHVv/zZ+qRmbM0AgWRdcN2MH6RoK
	s4ZgVRWmpH3OlSFA3sUflT8gM2SWmn5RfhKA1nC0+G4UKqcEwRAQ2GEGLJF5GqEKyTq8pnx
	+jURCWTjumQ46C5lLvwFo2KzhPPglCsvtQiWBZRk18RHLjuIEjpsEf5YoqxBGjjaAHwtNP+
	6B9HnEF1/wkiRLHiUIViBHAfqUvvos56U+xOdWAxiLy7UJSxBO83mi90YmafKYItuVSO9fO
	sswPSmU4fs7Popw0R8GZ6es1GZXgZTWMWBr5NEqFfrWduF6skOoiGlcGyTzglzuTxUHkVn7
	S1xzazKeTaKA3iJhMkN/HyTPGPAPqzcBDC+q4azETe3IbrISDb7F4aKAdxjUgihDcUJDLxM
	ZGHjAGfQ80JRrsu3zFKzodMyWNGs7/DjF7X3gpZk1ZYYEEqqMmkLPv9wXl+3vkT6YEc56zD
	o91kuK8cX9pbPcc=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_183942_823300_9A45FEB4 
X-CRM114-Status: UNSURE (   9.70  )
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

Set both TX and RX FIFO trigger thresholds (TFT/RFT) to 0xF (half of
the 32-entry FIFO) instead of 5. This provides better DMA efficiency
by allowing more data to accumulate before triggering a DMA request,
reducing the number of DMA transactions needed.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index e59624b2e23a..cef883ba4de9 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -93,8 +93,8 @@ static void spacemit_i2s_init(struct spacemit_i2s_dev *i2s)
 	u32 sscr_val, sspsp_val, ssfcr_val, ssrwt_val;
 
 	sscr_val = SSCR_TRAIL | SSCR_FRF_PSP;
-	ssfcr_val = FIELD_PREP(SSFCR_FIELD_TFT, 5) |
-		    FIELD_PREP(SSFCR_FIELD_RFT, 5) |
+	ssfcr_val = FIELD_PREP(SSFCR_FIELD_TFT, 0xF) |
+		    FIELD_PREP(SSFCR_FIELD_RFT, 0xF) |
 		    SSFCR_RSRE | SSFCR_TSRE;
 	ssrwt_val = SSRWT_RWOT;
 	sspsp_val = SSPSP_SFRMP;

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
